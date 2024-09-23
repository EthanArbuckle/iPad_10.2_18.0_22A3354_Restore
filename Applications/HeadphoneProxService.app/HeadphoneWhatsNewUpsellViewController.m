@implementation HeadphoneWhatsNewUpsellViewController

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC20HeadphoneProxService37HeadphoneWhatsNewUpsellViewController *v3;

  v3 = self;
  sub_100057544((uint64_t)v3, v2);

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
  -[HeadphoneWhatsNewUpsellViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  Strong = swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC20HeadphoneProxService37HeadphoneWhatsNewUpsellViewController_presenter]);
  if (Strong)
  {
    v6 = Strong;
    sub_1000761A4(v4[OBJC_IVAR____TtC20HeadphoneProxService37HeadphoneWhatsNewUpsellViewController_type]);

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

- (_TtC20HeadphoneProxService37HeadphoneWhatsNewUpsellViewController)initWithContentView:(id)a3
{
  id v4;
  uint64_t v5;
  _TtC20HeadphoneProxService37HeadphoneWhatsNewUpsellViewController *v6;

  v4 = a3;
  v6 = (_TtC20HeadphoneProxService37HeadphoneWhatsNewUpsellViewController *)sub_1000589C8((uint64_t)a3, v5);

  return v6;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService37HeadphoneWhatsNewUpsellViewController_headphoneProxFeatureManager]);
  swift_release(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService37HeadphoneWhatsNewUpsellViewController_listBuilder]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService37HeadphoneWhatsNewUpsellViewController____lazy_storage___featureMap]);
  sub_100009FD0((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService37HeadphoneWhatsNewUpsellViewController_presenter]);
}

@end
