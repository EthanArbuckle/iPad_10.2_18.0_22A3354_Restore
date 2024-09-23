@implementation CPSLearnMoreResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSLearnMoreResponse)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPSLearnMoreResponse;
  return -[CPSLearnMoreResponse init](&v4, sel_init, a3);
}

@end
