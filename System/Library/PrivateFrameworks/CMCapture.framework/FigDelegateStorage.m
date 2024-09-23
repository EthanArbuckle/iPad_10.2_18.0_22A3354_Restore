@implementation FigDelegateStorage

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  OS_dispatch_queue *delegateQueue;

  if (!a3 && a4)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = CFSTR("When setting the delegate to nil the queue must also be nil");
    goto LABEL_8;
  }
  if (a3 && !a4)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = CFSTR("Caller must provide a queue");
LABEL_8:
    objc_exception_throw((id)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0));
  }
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  objc_storeWeak(&self->_delegate, a3);
  delegateQueue = self->_delegateQueue;
  self->_delegateQueue = (OS_dispatch_queue *)a4;
  os_unfair_lock_unlock(&self->_lock);

}

- (FigDelegateStorage)init
{
  FigDelegateStorage *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigDelegateStorage;
  result = -[FigDelegateStorage init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)invokeDelegateCallbackWithBlock:(id)a3
{
  os_unfair_lock_s *p_lock;
  OS_dispatch_queue *v6;
  _QWORD v7[6];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_delegateQueue;
  os_unfair_lock_unlock(p_lock);
  if (v6)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__FigDelegateStorage_invokeDelegateCallbackWithBlock___block_invoke;
    v7[3] = &unk_1E491F098;
    v7[4] = self;
    v7[5] = a3;
    dispatch_async((dispatch_queue_t)v6, v7);

  }
  else
  {
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
  }
}

void __54__FigDelegateStorage_invokeDelegateCallbackWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id Weak;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = (void *)MEMORY[0x1A858DD40]();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  Weak = objc_loadWeak((id *)(v2 + 16));
  if (!Weak)
  {

    *(_QWORD *)(v2 + 8) = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 24));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, Weak);
  objc_autoreleasePoolPop(v3);
}

- (id)delegate
{
  os_unfair_lock_s *p_lock;
  id Weak;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  Weak = objc_loadWeak(&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return Weak;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak(&self->_delegate, 0);

  v3.receiver = self;
  v3.super_class = (Class)FigDelegateStorage;
  -[FigDelegateStorage dealloc](&v3, sel_dealloc);
}

- (OS_dispatch_queue)delegateQueue
{
  os_unfair_lock_s *p_lock;
  OS_dispatch_queue *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_delegateQueue;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

@end
