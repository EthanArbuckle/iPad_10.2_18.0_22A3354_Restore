@implementation CCIncrementalSetDonation

- (unint64_t)priorVersion
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCIncrementalSetDonation;
  return -[CCSetDonation priorVersion](&v3, sel_priorVersion);
}

@end
