@implementation SCNJitterer

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    if (a3)
    {
      self->_enabled = 1;
      -[SCNJitterer restart](self, "restart");
    }
    else
    {
      -[SCNJitterer stopIfNeeded](self, "stopIfNeeded");
      self->_enabled = 0;
    }
  }
}

- (void)restart
{
  _QWORD block[5];

  if (self->_enabled)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __22__SCNJitterer_restart__block_invoke;
    block[3] = &unk_1EA59E288;
    block[4] = self;
    dispatch_async((dispatch_queue_t)_updateQueue, block);
  }
}

- (SCNJitterer)initWithDelegate:(id)a3
{
  SCNJitterer *v4;
  SCNJitterer *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD handler[5];
  _QWORD v10[6];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SCNJitterer;
  v4 = -[SCNJitterer init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_delegate, a3);
    v5->_restartSourceIsSuspended = 1;
    v5->_state = 3;
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x3052000000;
    v10[3] = __Block_byref_object_copy__0;
    v10[4] = __Block_byref_object_dispose__0;
    v10[5] = v5;
    v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)_updateQueue);
    v7 = MEMORY[0x1E0C809B0];
    v5->_restartSource = (OS_dispatch_source *)v6;
    handler[0] = v7;
    handler[1] = 3221225472;
    handler[2] = __32__SCNJitterer_initWithDelegate___block_invoke;
    handler[3] = &unk_1EA59DF80;
    handler[4] = v10;
    dispatch_source_set_event_handler(v6, handler);
    _Block_object_dispose(v10, 8);
  }
  return v5;
}

uint64_t __32__SCNJitterer_initWithDelegate___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16) = 1;
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "update");
}

+ (void)initialize
{
  _updateQueue = (uint64_t)dispatch_queue_create("com.apple.scenekit.jitteringUpdateQueue", 0);
}

void __22__SCNJitterer_restart__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  dispatch_time_t v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 32))
  {
    v3 = *(NSObject **)(v1 + 48);
    v4 = dispatch_time(0, 100000000);
    dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 48));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  }
}

- (void)update
{
  id Weak;
  unint64_t state;

  Weak = objc_loadWeak((id *)&self->_delegate);
  state = self->_state;
  if (!state)
    goto LABEL_5;
  if (state == 1)
  {
    self->_iteration = 0;
    if (objc_msgSend(Weak, "_canJitter"))
    {
      self->_state = 0;
LABEL_5:
      -[SCNJitterer jitter](self, "jitter");
    }
  }
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  NSObject *restartSource;
  objc_super v6;
  _QWORD handler[5];
  _QWORD block[5];

  v3 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__SCNJitterer_dealloc__block_invoke;
  block[3] = &unk_1EA59E288;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)_updateQueue, block);
  v4 = dispatch_semaphore_create(0);
  restartSource = self->_restartSource;
  handler[0] = v3;
  handler[1] = 3221225472;
  handler[2] = __22__SCNJitterer_dealloc__block_invoke_2;
  handler[3] = &unk_1EA59E288;
  handler[4] = v4;
  dispatch_source_set_cancel_handler(restartSource, handler);
  dispatch_source_cancel((dispatch_source_t)self->_restartSource);
  dispatch_release((dispatch_object_t)self->_restartSource);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v4);
  objc_storeWeak((id *)&self->_delegate, 0);
  v6.receiver = self;
  v6.super_class = (Class)SCNJitterer;
  -[SCNJitterer dealloc](&v6, sel_dealloc);
}

void __22__SCNJitterer_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 32))
    dispatch_resume(*(dispatch_object_t *)(v1 + 48));
}

intptr_t __22__SCNJitterer_dealloc__block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)delegateWillDie
{
  objc_storeWeak((id *)&self->_delegate, 0);
  if (self->_state <= 1)
    self->_state = 2;
  dispatch_sync((dispatch_queue_t)_updateQueue, &__block_literal_global_12);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isAborting
{
  return self->_state == 2;
}

- (void)jitter
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "_iteration <= C3DJitteringIterationCount";
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Assertion '%s' failed. invalid iteration count", (uint8_t *)&v1, 0xCu);
}

uint64_t __21__SCNJitterer_jitter__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "update");
}

void __21__SCNJitterer_jitter__block_invoke_2(uint64_t a1)
{

}

- (void)stopIfNeeded
{
  _QWORD block[5];

  if (self->_enabled)
  {
    if (self->_state <= 1)
      self->_state = 2;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__SCNJitterer_stopIfNeeded__block_invoke;
    block[3] = &unk_1EA59E288;
    block[4] = self;
    dispatch_async((dispatch_queue_t)_updateQueue, block);
  }
}

void __27__SCNJitterer_stopIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 32))
  {
    dispatch_suspend(*(dispatch_object_t *)(v1 + 48));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
  }
}

@end
