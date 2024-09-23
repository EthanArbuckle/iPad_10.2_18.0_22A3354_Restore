@implementation _NAObserverProxy

- (_NAObserverProxy)initWithWeakObserver:(id)a3
{
  id v4;
  _NAObserverProxy *v5;
  _NAObserverProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_NAObserverProxy;
  v5 = -[_NAObserverProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak(&v5->_weakObserver, v4);
    v6->_valid = 1;
  }

  return v6;
}

- (void)invalidate
{
  self->_valid = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[_NAObserverProxy invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)_NAObserverProxy;
  -[_NAObserverProxy dealloc](&v3, sel_dealloc);
}

- (id)weakObserver
{
  return objc_loadWeakRetained(&self->_weakObserver);
}

- (BOOL)isValid
{
  return self->_valid;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_weakObserver);
}

@end
