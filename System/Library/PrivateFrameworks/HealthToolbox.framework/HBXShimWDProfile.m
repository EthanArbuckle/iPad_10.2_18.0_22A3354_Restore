@implementation HBXShimWDProfile

- (HBXShimWDProfile)initWithHealthStore:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HBXShimWDProfile;
  return -[WDProfile initWithHealthStore:](&v4, sel_initWithHealthStore_, a3);
}

- (id)userActivityManager
{
  return 0;
}

@end
