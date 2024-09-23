@implementation HeadphoneEndCallViewController

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC20HeadphoneProxService30HeadphoneEndCallViewController *v3;

  v3 = self;
  sub_100011A74((uint64_t)v3, v2);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC20HeadphoneProxService30HeadphoneEndCallViewController *v4;

  v4 = self;
  sub_1000126C4(a3, (uint64_t)v4);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService30HeadphoneEndCallViewController)initWithContentView:(id)a3
{
  id v4;
  uint64_t v5;
  _TtC20HeadphoneProxService30HeadphoneEndCallViewController *v6;

  v4 = a3;
  v6 = (_TtC20HeadphoneProxService30HeadphoneEndCallViewController *)sub_10001345C((uint64_t)a3, v5);

  return v6;
}

- (void).cxx_destruct
{

  sub_100009FD0((uint64_t)&self->PRXFeatureTourContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneEndCallViewController_presenter]);
}

@end
