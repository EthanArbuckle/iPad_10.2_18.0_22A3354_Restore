@implementation HeadphoneBatteryViewController

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC20HeadphoneProxService30HeadphoneBatteryViewController *v3;

  v3 = self;
  sub_10004E8E4((uint64_t)v3, v2);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  id *v5;
  char *v6;
  char v7[24];
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self, a2);
  v4 = (char *)v8.receiver;
  -[HeadphoneBatteryViewController viewWillAppear:](&v8, "viewWillAppear:", v3);
  sub_10004F020();
  v5 = (id *)&v4[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneBatteryViewController_movieBatteryView];
  swift_beginAccess(&v4[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneBatteryViewController_movieBatteryView], v7, 0, 0);
  if (*v5)
  {
    v6 = (char *)*v5;
    sub_10000B54C();

    v4 = v6;
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC20HeadphoneProxService30HeadphoneBatteryViewController *v4;

  v4 = self;
  sub_10004F594(a3, (uint64_t)v4);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updateBatteryLevels
{
  _TtC20HeadphoneProxService30HeadphoneBatteryViewController *v2;

  v2 = self;
  sub_1000543F0();

}

- (_TtC20HeadphoneProxService30HeadphoneBatteryViewController)initWithContentView:(id)a3
{
  id v4;
  uint64_t v5;
  _TtC20HeadphoneProxService30HeadphoneBatteryViewController *v6;

  v4 = a3;
  v6 = (_TtC20HeadphoneProxService30HeadphoneBatteryViewController *)sub_100055270((uint64_t)a3, v5);

  return v6;
}

- (void).cxx_destruct
{

  sub_100017E48((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneBatteryViewController_viewModel], &qword_1000B8C40);
  sub_100009FD0((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneBatteryViewController_presenter]);
}

@end
