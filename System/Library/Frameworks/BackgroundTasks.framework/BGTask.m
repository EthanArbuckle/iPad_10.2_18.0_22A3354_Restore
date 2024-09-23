@implementation BGTask

- (id)_initWithIdentifier:(id)a3 activity:(id)a4
{
  id v7;
  id v8;
  BGTask *v9;
  BGTask *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BGTask;
  v9 = -[BGTask init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v10->__lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v10->__activity, a4);
  }

  return v10;
}

- (id)_unsafe_setTaskCompletedWithSuccess:(BOOL)a3 afterDelay:(double)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  double v15;
  BOOL v16;

  self->__completed = 1;
  -[BGTask setExpirationHandler:](self, "setExpirationHandler:", 0);
  -[BGTask _completionHandler](self, "_completionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BGTask _setCompletionHandler:](self, "_setCompletionHandler:", 0);
  -[BGTask _handlerQueue](self, "_handlerQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __57__BGTask__unsafe_setTaskCompletedWithSuccess_afterDelay___block_invoke;
    v12[3] = &unk_24CC620F8;
    v15 = a4;
    v13 = v8;
    v14 = v7;
    v16 = a3;
    v10 = (void *)MEMORY[0x212BE0554](v12);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __57__BGTask__unsafe_setTaskCompletedWithSuccess_afterDelay___block_invoke(uint64_t a1)
{
  double v2;
  dispatch_time_t v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  char v7;

  v2 = *(double *)(a1 + 48);
  if (v2 == 0.0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = dispatch_time(0, (uint64_t)(v2 * 1000000000.0));
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __57__BGTask__unsafe_setTaskCompletedWithSuccess_afterDelay___block_invoke_2;
    v5[3] = &unk_24CC620D0;
    v4 = *(NSObject **)(a1 + 32);
    v6 = *(id *)(a1 + 40);
    v7 = *(_BYTE *)(a1 + 56);
    dispatch_after(v3, v4, v5);

  }
}

uint64_t __57__BGTask__unsafe_setTaskCompletedWithSuccess_afterDelay___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)setTaskCompletedWithSuccess:(BOOL)success
{
  -[BGTask _setTaskCompletedWithSuccess:actionsIfNotAlreadyCompleted:](self, "_setTaskCompletedWithSuccess:actionsIfNotAlreadyCompleted:", success, 0);
}

- (void)_setTaskCompletedWithSuccess:(BOOL)a3 actionsIfNotAlreadyCompleted:(id)a4
{
  _BOOL8 v4;
  double v6;
  void (**v7)(_QWORD);
  void (**v8)(void);

  v4 = a3;
  v8 = (void (**)(void))a4;
  os_unfair_lock_lock(&self->__lock);
  if (self->__completed)
  {
    os_unfair_lock_unlock(&self->__lock);
  }
  else
  {
    if (v8)
      v8[2]();
    else
      v6 = 0.0;
    -[BGTask _unsafe_setTaskCompletedWithSuccess:afterDelay:](self, "_unsafe_setTaskCompletedWithSuccess:afterDelay:", v4, v6);
    v7 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->__lock);
    if (v7)
    {
      v7[2](v7);

    }
  }

}

- (void)dealloc
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_2116F8000, a2, OS_LOG_TYPE_ERROR, "Task %{public}@ dealloc'd without completing. This is a programmer error.", (uint8_t *)&v2, 0xCu);
}

- (void)_callExpirationHandler
{
  os_unfair_lock_s *p_lock;
  void (**v4)(void);

  p_lock = &self->__lock;
  os_unfair_lock_lock(&self->__lock);
  -[BGTask expirationHandler](self, "expirationHandler");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  -[BGTask setExpirationHandler:](self, "setExpirationHandler:", 0);
  os_unfair_lock_unlock(p_lock);
  if (v4)
    v4[2]();
  else
    -[BGTask setTaskCompletedWithSuccess:](self, "setTaskCompletedWithSuccess:", 0);

}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)expirationHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setExpirationHandler:(void *)expirationHandler
{
  objc_setProperty_atomic_copy(self, a2, expirationHandler, 24);
}

- (_DASActivity)_activity
{
  return self->__activity;
}

- (void)_setActivity:(id)a3
{
  objc_storeStrong((id *)&self->__activity, a3);
}

- (BOOL)_completed
{
  return self->__completed;
}

- (void)_setCompleted:(BOOL)a3
{
  self->__completed = a3;
}

- (os_unfair_lock_s)_lock
{
  return self->__lock;
}

- (void)_setLock:(os_unfair_lock_s)a3
{
  self->__lock = a3;
}

- (OS_dispatch_queue)_handlerQueue
{
  return self->__handlerQueue;
}

- (void)_setHandlerQueue:(id)a3
{
  objc_storeStrong((id *)&self->__handlerQueue, a3);
}

- (id)_completionHandler
{
  return self->__completionHandler;
}

- (void)_setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__completionHandler, 0);
  objc_storeStrong((id *)&self->__handlerQueue, 0);
  objc_storeStrong((id *)&self->__activity, 0);
  objc_storeStrong(&self->_expirationHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
