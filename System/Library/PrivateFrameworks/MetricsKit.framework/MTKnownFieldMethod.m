@implementation MTKnownFieldMethod

- (void)imp
{
  return self->_imp;
}

- (SEL)accessor
{
  return self->_accessor;
}

- (MTKnownFieldMethod)initWithIMP:(void *)a3 accessor:(SEL)a4
{
  MTKnownFieldMethod *v6;
  MTKnownFieldMethod *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTKnownFieldMethod;
  v6 = -[MTKnownFieldMethod init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[MTKnownFieldMethod setImp:](v6, "setImp:", a3);
    -[MTKnownFieldMethod setAccessor:](v7, "setAccessor:", a4);
  }
  return v7;
}

- (void)setImp:(void *)a3
{
  self->_imp = a3;
}

- (void)setAccessor:(SEL)a3
{
  self->_accessor = a3;
}

@end
