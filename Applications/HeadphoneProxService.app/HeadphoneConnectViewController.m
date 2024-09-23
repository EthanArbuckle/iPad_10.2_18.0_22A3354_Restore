@implementation HeadphoneConnectViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v3.receiver;
  -[HeadphoneConnectViewController viewDidLoad](&v3, "viewDidLoad");
  objc_msgSend(v2, "setDismissalType:", 1, v3.receiver, v3.super_class);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC20HeadphoneProxService30HeadphoneConnectViewController *v4;

  v4 = self;
  sub_100038BCC(a3, (uint64_t)v4);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC20HeadphoneProxService30HeadphoneConnectViewController *v4;

  v4 = self;
  sub_100038F84(a3, (uint64_t)v4);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService30HeadphoneConnectViewController)initWithContentView:(id)a3
{
  id v4;
  uint64_t v5;
  _TtC20HeadphoneProxService30HeadphoneConnectViewController *v6;

  v4 = a3;
  v6 = (_TtC20HeadphoneProxService30HeadphoneConnectViewController *)sub_10003D374((uint64_t)a3, v5);

  return v6;
}

- (void).cxx_destruct
{
  _BYTE v3[264];

  sub_10003CFDC((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneConnectViewController_movieContainer], (uint64_t)v3, &qword_1000B90F0);
  sub_10003D0DC((uint64_t)v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_10003D158);

  sub_100017E48((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneConnectViewController_viewModel], &qword_1000B8C40);
  sub_100009FD0((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneConnectViewController_presenter]);
}

@end
