@implementation HMFObjectObserver

void __36__HMFObjectObserver__startObserving__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "deallocationBlock");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
  {
    (*(void (**)(uint64_t))(v1 + 16))(v1);
    objc_msgSend(WeakRetained, "setDeallocationBlock:", 0);
  }

}

- (void)setDeallocationBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (id)deallocationBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)dealloc
{
  id deallocationBlock;
  objc_super v4;

  deallocationBlock = self->_deallocationBlock;
  self->_deallocationBlock = 0;

  -[HMFObjectObserver _stopObserving](self, "_stopObserving");
  v4.receiver = self;
  v4.super_class = (Class)HMFObjectObserver;
  -[HMFObjectObserver dealloc](&v4, sel_dealloc);
}

- (HMFObjectObserver)initWithObservedObject:(id)a3
{
  id v4;
  HMFObjectObserver *v5;
  HMFObjectObserver *v6;
  HMFObjectObserver *v7;
  objc_super v9;

  v4 = a3;
  if (v4)
  {
    v9.receiver = self;
    v9.super_class = (Class)HMFObjectObserver;
    v5 = -[HMFObjectObserver init](&v9, sel_init);
    v6 = v5;
    if (v5)
    {
      objc_storeWeak(&v5->_observedObject, v4);
      v6->_cachedHash = objc_msgSend(v4, "hash");
      -[HMFObjectObserver _startObserving](v6, "_startObserving");
    }
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_stopObserving
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1A1AC355C](self, a2);
  -[HMFObjectObserver observedObject](self, "observedObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_setAssociatedObject(v4, self, 0, (void *)1);

  objc_autoreleasePoolPop(v3);
}

- (void)_startObserving
{
  void *v3;
  _HMFObjectObserverInternal *v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[HMFObjectObserver observedObject](self, "observedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(_HMFObjectObserverInternal);
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __36__HMFObjectObserver__startObserving__block_invoke;
    v5[3] = &unk_1E3B37BF8;
    objc_copyWeak(&v6, &location);
    -[_HMFObjectObserverInternal setDeallocationBlock:](v4, "setDeallocationBlock:", v5);
    objc_setAssociatedObject(v3, self, v4, (void *)1);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);

  }
}

- (id)observedObject
{
  return objc_loadWeakRetained(&self->_observedObject);
}

- (unint64_t)cachedHash
{
  return self->_cachedHash;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deallocationBlock, 0);
  objc_destroyWeak(&self->_observedObject);
}

- (HMFObjectObserver)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (BOOL)isEqual:(id)a3
{
  HMFObjectObserver *v4;
  HMFObjectObserver *v5;
  unint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  BOOL v11;

  v4 = (HMFObjectObserver *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      v7 = atomic_load((unint64_t *)&self->_observedObject);
      v8 = atomic_load(v6 + 1);
      if (v7)
        v9 = v8 == 0;
      else
        v9 = 1;
      v11 = !v9 && v7 == v8;
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

@end
