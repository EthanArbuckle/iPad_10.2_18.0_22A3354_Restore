@implementation CNMutablePostalAddress

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CNPostalAddress initWithPostalAddress:]([CNPostalAddress alloc], "initWithPostalAddress:", self);
}

- (id)freeze
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class();
  object_setClass(self, v3);
  return self;
}

@end
