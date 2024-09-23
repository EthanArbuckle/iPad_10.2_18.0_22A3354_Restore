@implementation HeadhponeHeartRateViewController

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC20HeadphoneProxService32HeadhponeHeartRateViewController *v3;

  v3 = self;
  sub_10005FA84((uint64_t)v3, v2);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService32HeadhponeHeartRateViewController)initWithContentView:(id)a3
{
  id v4;
  uint64_t v5;
  _TtC20HeadphoneProxService32HeadhponeHeartRateViewController *v6;

  v4 = a3;
  v6 = (_TtC20HeadphoneProxService32HeadhponeHeartRateViewController *)sub_100060DD0((uint64_t)a3, v5);

  return v6;
}

- (void).cxx_destruct
{

  sub_100009FD0((uint64_t)&self->PRXFeatureTourContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService32HeadhponeHeartRateViewController_presenter]);
}

@end
