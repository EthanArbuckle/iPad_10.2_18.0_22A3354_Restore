@implementation LNDeallocationHandler

- (LNDeallocationHandler)initWithObject:(id)a3 deallocationHandler:(id)a4
{
  id v6;
  id v7;
  LNDeallocationHandler *v8;
  void *v9;
  id deallocationHandler;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LNDeallocationHandler;
  v8 = -[LNDeallocationHandler init](&v12, sel_init);
  if (v8)
  {
    v9 = _Block_copy(v7);
    deallocationHandler = v8->_deallocationHandler;
    v8->_deallocationHandler = v9;

    objc_storeWeak(&v8->_object, v6);
    objc_setAssociatedObject(v6, v8, v8, (void *)1);
  }

  return v8;
}

- (void)dealloc
{
  id deallocationHandler;
  void (**v4)(_QWORD);
  id WeakRetained;
  id v6;
  objc_super v7;

  deallocationHandler = self->_deallocationHandler;
  if (deallocationHandler)
  {
    v4 = (void (**)(_QWORD))_Block_copy(deallocationHandler);
    WeakRetained = objc_loadWeakRetained(&self->_object);
    v6 = self->_deallocationHandler;
    self->_deallocationHandler = 0;

    objc_storeWeak(&self->_object, 0);
    v4[2](v4);
    if (WeakRetained)
      objc_setAssociatedObject(WeakRetained, self, 0, (void *)1);

  }
  v7.receiver = self;
  v7.super_class = (Class)LNDeallocationHandler;
  -[LNDeallocationHandler dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deallocationHandler, 0);
  objc_destroyWeak(&self->_object);
}

@end
