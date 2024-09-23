@implementation MPCDeferrableTask

- (MPCDeferrableTask)initWithIdentifier:(id)a3 timeout:(double)a4 queue:(id)a5 block:(id)a6
{
  id v10;
  id v11;
  id v12;
  MPCDeferrableTask *v13;
  MPCDeferrableTask *v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  id location;
  objc_super v24;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)MPCDeferrableTask;
  v13 = -[MPCDeferrableTask init](&v24, sel_init);
  v14 = v13;
  if (v13)
  {
    -[MPCDeferrableTask setIdentifier:](v13, "setIdentifier:", v10);
    -[MPCDeferrableTask setQueue:](v14, "setQueue:", v11);
    -[MPCDeferrableTask setBlock:](v14, "setBlock:", v12);
    v14->_lock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v14);
    v15 = objc_alloc(MEMORY[0x24BE65C40]);
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __60__MPCDeferrableTask_initWithIdentifier_timeout_queue_block___block_invoke;
    v21 = &unk_24CAB7860;
    objc_copyWeak(&v22, &location);
    v16 = (void *)objc_msgSend(v15, "initWithTimeout:interruptionHandler:", &v18, a4);
    -[MPCDeferrableTask setGuard:](v14, "setGuard:", v16, v18, v19, v20, v21);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v14;
}

- (BOOL)cancel
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  int v6;
  BOOL v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[MPCDeferrableTask block](self, "block");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (v4
    && (-[MPCDeferrableTask guard](self, "guard"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "disarm"),
        v5,
        v6))
  {
    -[MPCDeferrableTask execute:](self, "execute:", 2);
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[MPCDeferrableTask identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p identifier=%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[MPCDeferrableTask setDeallocating:](self, "setDeallocating:", 1);
  -[MPCDeferrableTask cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MPCDeferrableTask;
  -[MPCDeferrableTask dealloc](&v3, sel_dealloc);
}

- (void)execute:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v7;
  NSObject *v8;
  const __CFString *v9;
  _BOOL4 v10;
  NSObject *v11;
  id *v12;
  id v13;
  _QWORD *v14;
  id v15;
  void *v16;
  _QWORD block[5];
  _QWORD v18[2];
  _QWORD v19[4];
  _QWORD v20[2];
  uint8_t buf[4];
  MPCDeferrableTask *v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[MPCDeferrableTask block](self, "block");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("Optimal");
    if (a3 == 1)
      v9 = CFSTR("Timed out");
    if (a3 == 2)
      v9 = CFSTR("Canceled");
    *(_DWORD *)buf = 138543618;
    v22 = self;
    v23 = 2114;
    v24 = v9;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Started executing (%{public}@)", buf, 0x16u);
  }

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCDeferrableTask.m"), 84, CFSTR("%@ Deferred task can't be executed multiple times"), self);

  }
  v10 = -[MPCDeferrableTask deallocating](self, "deallocating");
  -[MPCDeferrableTask queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __29__MPCDeferrableTask_execute___block_invoke;
    v19[3] = &unk_24CAB4C10;
    v12 = (id *)v20;
    v20[0] = v7;
    v20[1] = a3;
    v13 = v7;
    v14 = v19;
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __29__MPCDeferrableTask_execute___block_invoke_2;
    block[3] = &unk_24CABABE0;
    v12 = (id *)v18;
    v18[0] = v7;
    v18[1] = a3;
    block[4] = self;
    v15 = v7;
    v14 = block;
  }
  dispatch_async(v11, v14);

  -[MPCDeferrableTask taskDidExecute](self, "taskDidExecute");
}

- (void)taskDidExecute
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[MPCDeferrableTask setBlock:](self, "setBlock:", 0);
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (MSVBlockGuard)guard
{
  return self->_guard;
}

- (void)setGuard:(id)a3
{
  objc_storeStrong((id *)&self->_guard, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (BOOL)deallocating
{
  return self->_deallocating;
}

- (void)setDeallocating:(BOOL)a3
{
  self->_deallocating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guard, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

uint64_t __29__MPCDeferrableTask_execute___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __29__MPCDeferrableTask_execute___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "setFinished:", 1);
}

void __60__MPCDeferrableTask_initWithIdentifier_timeout_queue_block___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  if (!a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "execute:", 1);

  }
}

@end
