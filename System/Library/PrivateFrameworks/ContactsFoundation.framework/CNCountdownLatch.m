@implementation CNCountdownLatch

- (CNCountdownLatch)init
{
  return -[CNCountdownLatch initWithStartingCount:](self, "initWithStartingCount:", 0);
}

- (CNCountdownLatch)initWithStartingCount:(unint64_t)a3
{
  CNCountdownLatch *v4;
  CNCountdownLatch *v5;
  CNUnfairLock *v6;
  CNUnfairLock *lock;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *latchedSemaphore;
  CNCountdownLatch *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CNCountdownLatch;
  v4 = -[CNCountdownLatch init](&v12, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_count = a3;
    v6 = objc_alloc_init(CNUnfairLock);
    lock = v5->_lock;
    v5->_lock = v6;

    v8 = dispatch_semaphore_create(0);
    latchedSemaphore = v5->_latchedSemaphore;
    v5->_latchedSemaphore = (OS_dispatch_semaphore *)v8;

    v10 = v5;
  }

  return v5;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", CFSTR("count"), self->_count);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)countDown
{
  CNUnfairLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__CNCountdownLatch_countDown__block_invoke;
  v3[3] = &unk_1E29B9358;
  v3[4] = self;
  CNRunWithLock(lock, v3);
}

intptr_t __29__CNCountdownLatch_countDown__block_invoke(intptr_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 8);
  if (v2)
  {
    *(_QWORD *)(v1 + 8) = v2 - 1;
    v3 = *(_QWORD *)(result + 32);
    if (!*(_QWORD *)(v3 + 8))
      return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v3 + 24));
  }
  return result;
}

- (void)await
{
  -[CNCountdownLatch awaitWithTimeout:](self, "awaitWithTimeout:", 1.79769313e308);
}

- (BOOL)awaitWithTimeout:(double)a3
{
  return -[CNCountdownLatch awaitWithTimeout:strategy:](self, "awaitWithTimeout:strategy:", 0, a3);
}

- (BOOL)awaitWithTimeout:(double)a3 strategy:(unint64_t)a4
{
  if (a3 <= 0.0)
    return -[CNCountdownLatch awaitImmediate](self, "awaitImmediate", a4);
  if (a4 == 1)
    return -[CNCountdownLatch awaitWhileSpinningRunloopWithTimeout:](self, "awaitWhileSpinningRunloopWithTimeout:");
  return -[CNCountdownLatch awaitOnSemaphoreWithTimeout:](self, "awaitOnSemaphoreWithTimeout:");
}

- (BOOL)hasLatched
{
  CNUnfairLock *lock;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__CNCountdownLatch_hasLatched__block_invoke;
  v5[3] = &unk_1E29B9330;
  v5[4] = self;
  v5[5] = &v6;
  CNRunWithLock(lock, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__CNCountdownLatch_hasLatched__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8) == 0;
  return result;
}

- (BOOL)awaitOnSemaphoreWithTimeout:(double)a3
{
  _BOOL4 v4;

  v4 = CNDispatchSemaphoreWait(self->_latchedSemaphore, a3);
  if (v4)
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_latchedSemaphore);
  return v4;
}

- (BOOL)awaitWhileSpinningRunloopWithTimeout:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  do
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "runUntilDate:", v5);

    v7 = -[CNCountdownLatch hasLatched](self, "hasLatched");
    objc_msgSend(v4, "timeIntervalSinceNow");
  }
  while (v8 > 0.0 && !v7);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latchedSemaphore, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
