@implementation KSWeakRefHolder

- (KSWeakRefHolder)initWithObject:(id)a3
{
  id v4;
  KSWeakRefHolder *v5;
  KSWeakRefHolder *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)KSWeakRefHolder;
  v5 = -[KSWeakRefHolder init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak(&v5->_weakObject, v4);

  return v6;
}

+ (id)weakRefHolderWithObject:(id)a3
{
  id v3;
  KSWeakRefHolder *v4;

  v3 = a3;
  v4 = -[KSWeakRefHolder initWithObject:]([KSWeakRefHolder alloc], "initWithObject:", v3);

  return v4;
}

- (id)strongRef
{
  return objc_loadWeakRetained(&self->_weakObject);
}

- (id)weakObject
{
  return objc_loadWeakRetained(&self->_weakObject);
}

- (void)setWeakObject:(id)a3
{
  objc_storeWeak(&self->_weakObject, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_weakObject);
}

@end
