@implementation PolicyRequest

- (PolicyRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PolicyRequest;
  return -[PolicyRequest init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PolicyRequest)initWithCoder:(id)a3
{
  PolicyRequest *v4;

  v4 = objc_alloc_init(PolicyRequest);

  return v4;
}

@end
