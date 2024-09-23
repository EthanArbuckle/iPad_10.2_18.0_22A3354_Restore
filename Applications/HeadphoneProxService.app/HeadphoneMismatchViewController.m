@implementation HeadphoneMismatchViewController

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC20HeadphoneProxService31HeadphoneMismatchViewController *v3;

  v3 = self;
  sub_100018964((uint64_t)v3, v2);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService31HeadphoneMismatchViewController)initWithContentView:(id)a3
{
  id v4;
  uint64_t v5;
  _TtC20HeadphoneProxService31HeadphoneMismatchViewController *v6;

  v4 = a3;
  v6 = (_TtC20HeadphoneProxService31HeadphoneMismatchViewController *)sub_10001B598((uint64_t)a3, v5);

  return v6;
}

- (void).cxx_destruct
{
  sub_100017E48((uint64_t)&self->leftLabel[OBJC_IVAR____TtC20HeadphoneProxService31HeadphoneMismatchViewController_viewModel], &qword_1000B8C40);

  sub_100009FD0((uint64_t)&self->leftLabel[OBJC_IVAR____TtC20HeadphoneProxService31HeadphoneMismatchViewController_presenter]);
}

@end
