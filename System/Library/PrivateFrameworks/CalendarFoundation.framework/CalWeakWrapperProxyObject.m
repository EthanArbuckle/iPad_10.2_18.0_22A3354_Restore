@implementation CalWeakWrapperProxyObject

- (CalWeakWrapperProxyObject)initWithWrappedObject:(id)a3
{
  id v4;
  CalWeakWrapperProxyObject *v5;
  CalWeakWrapperProxyObject *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CalWeakWrapperProxyObject;
  v5 = -[CalWeakWrapperProxyObject init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak(&v5->_wrappedObject, v4);

  return v6;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  void *v4;
  id WeakRetained;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CalWeakWrapperProxyObject;
  -[CalWeakWrapperProxyObject methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    WeakRetained = 0;
  else
    WeakRetained = objc_loadWeakRetained(&self->_wrappedObject);

  return WeakRetained;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  id v7;
  id WeakRetained;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CalWeakWrapperProxyObject;
  -[CalWeakWrapperProxyObject methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(&self->_wrappedObject);
    objc_msgSend(WeakRetained, "methodSignatureForSelector:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)wrappedObject
{
  return objc_loadWeakRetained(&self->_wrappedObject);
}

- (void)setWrappedObject:(id)a3
{
  objc_storeWeak(&self->_wrappedObject, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_wrappedObject);
}

@end
