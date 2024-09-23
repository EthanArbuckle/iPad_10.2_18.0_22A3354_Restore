@implementation HMDUserActivityReportCoordinatorFactory

+ (id)coordinatorWithHome:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = sub_2219C684C(v3);

  return v4;
}

- (HMDUserActivityReportCoordinatorFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDUserActivityReportCoordinatorFactory;
  return -[HMDUserActivityReportCoordinatorFactory init](&v3, sel_init);
}

@end
