@implementation _EFContentProtectionObserverWrapper

- (_EFContentProtectionObserverWrapper)initWithObserver:(id)a3 queue:(id)a4
{
  id v6;
  id v7;
  _EFContentProtectionObserverWrapper *v8;
  _EFContentProtectionObserverWrapper *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_EFContentProtectionObserverWrapper;
  v8 = -[_EFContentProtectionObserverWrapper init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_observer, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
  }

  return v9;
}

- (EFContentProtectionObserver)observer
{
  return (EFContentProtectionObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_observer);
}

@end
