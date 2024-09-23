@implementation COMessageSessionRequest

- (COMessageSessionRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)COMessageSessionRequest;
  return -[COMessageSessionRequest init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
