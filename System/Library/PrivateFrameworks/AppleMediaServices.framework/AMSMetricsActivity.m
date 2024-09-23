@implementation AMSMetricsActivity

- (OS_nw_activity)nwActivity
{
  return (OS_nw_activity *)(id)sub_18C931D58();
}

- (AMSMetricsActivity)initWithLabel:(int64_t)a3
{
  return (AMSMetricsActivity *)MetricsActivity.init(label:)(a3);
}

- (AMSMetricsActivity)initWithLabel:(int64_t)a3 parent:(id)a4
{
  swift_unknownObjectRetain();
  return (AMSMetricsActivity *)MetricsActivity.init(label:parent:)(a3);
}

- (void)activate
{
  AMSMetricsActivity *v2;

  v2 = self;
  sub_18C93225C();

}

- (void)completeAfter:(id)a3
{
  id v4;
  AMSMetricsActivity *v5;

  v4 = a3;
  v5 = self;
  sub_18C93323C(v4);

}

- (AMSMetricsActivity)init
{
  MetricsActivity.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
