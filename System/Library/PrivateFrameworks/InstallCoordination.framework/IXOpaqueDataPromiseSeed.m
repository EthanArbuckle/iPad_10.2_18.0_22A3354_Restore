@implementation IXOpaqueDataPromiseSeed

- (IXOpaqueDataPromiseSeed)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IXOpaqueDataPromiseSeed;
  return -[IXDataPromiseSeed initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IXOpaqueDataPromiseSeed;
  -[IXDataPromiseSeed encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)IXOpaqueDataPromiseSeed;
  return -[IXDataPromiseSeed copyWithZone:](&v4, sel_copyWithZone_, a3);
}

- (Class)clientPromiseClass
{
  return (Class)objc_opt_class();
}

@end
