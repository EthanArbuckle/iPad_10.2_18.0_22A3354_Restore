@implementation _XRLazyKVOBlockToken

- (_XRLazyKVOBlockToken)initWithObject:(id)a3 observer:(id)a4
{
  id v6;
  id v7;
  _XRLazyKVOBlockToken *v8;
  _XRLazyKVOBlockToken *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_XRLazyKVOBlockToken;
  v8 = -[_XRLazyKVOBlockToken init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_object, v6);
    objc_storeWeak(&v9->_observer, v7);
  }

  return v9;
}

- (void)handleLazyKVOUpdate:(id)a3
{
  void (**block)(id, id, id);
  id v5;
  id WeakRetained;

  block = (void (**)(id, id, id))self->_block;
  if (block)
  {
    WeakRetained = objc_loadWeakRetained(&self->_object);
    v5 = objc_loadWeakRetained(&self->_observer);
    block[2](block, WeakRetained, v5);

  }
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_destroyWeak(&self->_observer);
  objc_destroyWeak(&self->_object);
}

@end
