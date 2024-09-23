@implementation HeadphoneNotGenuineViewController

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC20HeadphoneProxService33HeadphoneNotGenuineViewController *v3;

  v3 = self;
  sub_100016354((uint64_t)v3, v2);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v4;
  uint64_t Strong;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self, a2);
  v4 = v7.receiver;
  -[HeadphoneNotGenuineViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  Strong = swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC20HeadphoneProxService33HeadphoneNotGenuineViewController_presenter]);
  if (Strong)
  {
    v6 = Strong;
    sub_1000761A4(v4[OBJC_IVAR____TtC20HeadphoneProxService33HeadphoneNotGenuineViewController_type]);

    swift_unknownObjectRelease(v6);
  }
  else
  {

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)handleTapOnLabel:(id)a3
{
  id v4;
  _TtC20HeadphoneProxService33HeadphoneNotGenuineViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1000171E8();

}

- (_TtC20HeadphoneProxService33HeadphoneNotGenuineViewController)initWithContentView:(id)a3
{
  id v4;
  uint64_t v5;
  _TtC20HeadphoneProxService33HeadphoneNotGenuineViewController *v6;

  v4 = a3;
  v6 = (_TtC20HeadphoneProxService33HeadphoneNotGenuineViewController *)sub_100017C9C((uint64_t)a3, v5);

  return v6;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->subtitleLabel[OBJC_IVAR____TtC20HeadphoneProxService33HeadphoneNotGenuineViewController_learnMoreLink]);
  sub_100017E48((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService33HeadphoneNotGenuineViewController_headphoneModel], &qword_1000B83E8);
  sub_100009FD0((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService33HeadphoneNotGenuineViewController_presenter]);
}

@end
