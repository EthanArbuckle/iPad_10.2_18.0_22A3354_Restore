@implementation CPSRestrictedAccessResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSRestrictedAccessResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPSRestrictedAccessResponse;
  return -[CPSRestrictedAccessResponse init](&v4, sel_init, a3);
}

@end
