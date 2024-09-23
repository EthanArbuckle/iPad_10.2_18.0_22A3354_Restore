@implementation MTExponentialBackOffTimer

+ (id)timerWithInitialTime:(double)a3 fireBlock:(id)a4
{
  return (id)objc_msgSend(a1, "timerWithInitialTime:backoffFactor:fireBlock:", 2, a4, a3);
}

+ (id)timerWithInitialTime:(double)a3 backoffFactor:(unint64_t)a4 fireBlock:(id)a5
{
  id v8;
  dispatch_queue_t v9;
  void *v10;

  v8 = a5;
  v9 = dispatch_queue_create("com.apple.MTExponentialBackOffTimer.serial", 0);
  objc_msgSend(a1, "timerWithInitialTime:backoffFactor:fireBlock:queue:", a4, v8, v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)timerWithInitialTime:(double)a3 backoffFactor:(unint64_t)a4 fireBlock:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a6;
  v11 = a5;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInitialTime:backoffFactor:fireBlock:queue:", a4, v11, v10, a3);

  return v12;
}

- (MTExponentialBackOffTimer)initWithInitialTime:(double)a3 backoffFactor:(unint64_t)a4 fireBlock:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  MTExponentialBackOffTimer *v12;
  uint64_t v13;
  id block;
  objc_super v16;

  v10 = a5;
  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)MTExponentialBackOffTimer;
  v12 = -[MTExponentialBackOffTimer init](&v16, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    block = v12->_block;
    v12->_block = (id)v13;

    v12->_currentBackoff = 1;
    v12->_backoffFactor = a4;
    v12->_initialTime = a3;
    objc_storeStrong((id *)&v12->_queue, a6);
  }

  return v12;
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__MTExponentialBackOffTimer_start__block_invoke;
  block[3] = &unk_1E39CB858;
  block[4] = self;
  dispatch_async(queue, block);
}

void __34__MTExponentialBackOffTimer_start__block_invoke(uint64_t a1)
{
  uint64_t v1;
  dispatch_source_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  _QWORD handler[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 8))
  {
    v3 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(v1 + 24));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(NSObject **)(v6 + 8);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __34__MTExponentialBackOffTimer_start__block_invoke_2;
    handler[3] = &unk_1E39CB858;
    handler[4] = v6;
    dispatch_source_set_event_handler(v7, handler);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 8);
    v10 = dispatch_time(0, (uint64_t)(*(double *)(v8 + 32) * (double)*(unint64_t *)(v8 + 40) * 1000000000.0));
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 8));
  }
}

uint64_t __34__MTExponentialBackOffTimer_start__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "timerFinished");
}

- (void)timerFinished
{
  OS_dispatch_source *timer;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  timer = self->_timer;
  self->_timer = 0;

  self->_currentBackoff *= self->_backoffFactor;
  (*((void (**)(void))self->_block + 2))();
}

- (void)stop
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__MTExponentialBackOffTimer_stop__block_invoke;
  block[3] = &unk_1E39CB858;
  block[4] = self;
  dispatch_async(queue, block);
}

_QWORD *__33__MTExponentialBackOffTimer_stop__block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[1])
  {
    result = (_QWORD *)objc_msgSend(result, "_cancel");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) *= *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
  }
  return result;
}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__MTExponentialBackOffTimer_reset__block_invoke;
  block[3] = &unk_1E39CB858;
  block[4] = self;
  dispatch_async(queue, block);
}

_QWORD *__34__MTExponentialBackOffTimer_reset__block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[1])
  {
    result = (_QWORD *)objc_msgSend(result, "_cancel");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  }
  return result;
}

- (void)_cancel
{
  OS_dispatch_source *timer;

  dispatch_source_cancel((dispatch_source_t)self->_timer);
  timer = self->_timer;
  self->_timer = 0;

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p backoff: %ld>"), objc_opt_class(), self, self->_currentBackoff);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (double)initialTime
{
  return self->_initialTime;
}

- (void)setInitialTime:(double)a3
{
  self->_initialTime = a3;
}

- (unint64_t)currentBackoff
{
  return self->_currentBackoff;
}

- (void)setCurrentBackoff:(unint64_t)a3
{
  self->_currentBackoff = a3;
}

- (unint64_t)backoffFactor
{
  return self->_backoffFactor;
}

- (void)setBackoffFactor:(unint64_t)a3
{
  self->_backoffFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
