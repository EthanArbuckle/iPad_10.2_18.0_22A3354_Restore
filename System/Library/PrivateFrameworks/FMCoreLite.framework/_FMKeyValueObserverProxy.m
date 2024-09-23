@implementation _FMKeyValueObserverProxy

- (_FMKeyValueObserverProxy)initWithWeakObserver:(id)a3 observedObject:(id)a4 keyPath:(id)a5 options:(unint64_t)a6 observerBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  _FMKeyValueObserverProxy *v15;
  _FMKeyValueObserverProxy *v16;
  uint64_t v17;
  id observerBlock;
  objc_super v20;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)_FMKeyValueObserverProxy;
  v15 = -[_FMObserverProxy initWithWeakObserver:](&v20, sel_initWithWeakObserver_, a3);
  v16 = v15;
  if (v15)
  {
    objc_storeWeak(&v15->_observedObject, v12);
    objc_storeStrong((id *)&v16->_keyPath, a5);
    v17 = MEMORY[0x1AF455734](v14);
    observerBlock = v16->_observerBlock;
    v16->_observerBlock = (id)v17;

    v16->_isObserving = 1;
    objc_msgSend(v12, "addObserver:forKeyPath:options:context:", v16, v13, a6, 0);
  }

  return v16;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  id v8;

  v8 = a5;
  if (-[_FMObserverProxy isValid](self, "isValid"))
  {
    -[_FMObserverProxy weakObserver](self, "weakObserver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))self->_observerBlock + 2))();

  }
}

- (void)invalidate
{
  id WeakRetained;
  objc_super v4;

  if (self->_isObserving)
  {
    self->_isObserving = 0;
    WeakRetained = objc_loadWeakRetained(&self->_observedObject);
    objc_msgSend(WeakRetained, "removeObserver:forKeyPath:", self, self->_keyPath);

  }
  v4.receiver = self;
  v4.super_class = (Class)_FMKeyValueObserverProxy;
  -[_FMObserverProxy invalidate](&v4, sel_invalidate);
}

- (id)observerBlock
{
  return self->_observerBlock;
}

- (id)observedObject
{
  return objc_loadWeakRetained(&self->_observedObject);
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_destroyWeak(&self->_observedObject);
  objc_storeStrong(&self->_observerBlock, 0);
}

@end
