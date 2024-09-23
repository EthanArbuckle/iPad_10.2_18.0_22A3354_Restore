@implementation IKStrongHandle

- (IKStrongHandle)initWithObject:(id)a3
{
  id v5;
  IKStrongHandle *v6;
  IKStrongHandle *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IKStrongHandle;
  v6 = -[IKStrongHandle init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_object, a3);

  return v7;
}

- (id)object
{
  return self->_object;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
}

@end
