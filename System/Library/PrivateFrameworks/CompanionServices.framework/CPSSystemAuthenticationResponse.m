@implementation CPSSystemAuthenticationResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSSystemAuthenticationResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPSSystemAuthenticationResponse;
  return -[CPSSystemAuthenticationResponse init](&v4, sel_init, a3);
}

@end
