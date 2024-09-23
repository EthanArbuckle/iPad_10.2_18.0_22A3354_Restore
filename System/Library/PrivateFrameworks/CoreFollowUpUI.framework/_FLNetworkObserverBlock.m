@implementation _FLNetworkObserverBlock

- (id)_initWithBlock:(id)a3 networkObserver:(id)a4
{
  id v6;
  id v7;
  _FLNetworkObserverBlock *v8;
  uint64_t v9;
  id block;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_FLNetworkObserverBlock;
  v8 = -[_FLNetworkObserverBlock init](&v12, sel_init);
  if (v8)
  {
    v9 = MEMORY[0x2199F81EC](v6);
    block = v8->_block;
    v8->_block = (id)v9;

    objc_storeWeak((id *)&v8->_networkObserver, v7);
  }

  return v8;
}

- (void)executeBlock
{
  (*((void (**)(void))self->_block + 2))();
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_networkObserver);
  objc_msgSend(WeakRetained, "removeNetworkReachableObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_FLNetworkObserverBlock;
  -[_FLNetworkObserverBlock dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_networkObserver);
  objc_storeStrong(&self->_block, 0);
}

@end
