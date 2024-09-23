@implementation HMProxyObjectIVar

- (HMProxyObjectIVar)self
{
  return (HMProxyObjectIVar *)self->_target;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMProxyObjectIVar;
  -[HMProxyObjectIVar dealloc](&v3, sel_dealloc);
}

@end
