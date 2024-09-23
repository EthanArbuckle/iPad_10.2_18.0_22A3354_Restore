@implementation ASDRequestOptions

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ASDRequestOptions init](+[ASDRequestOptions allocWithZone:](ASDRequestOptions, "allocWithZone:", a3), "init");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDRequestOptions)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASDRequestOptions;
  return -[ASDRequestOptions init](&v4, sel_init, a3);
}

@end
