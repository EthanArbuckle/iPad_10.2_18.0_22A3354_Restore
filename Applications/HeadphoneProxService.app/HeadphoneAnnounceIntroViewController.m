@implementation HeadphoneAnnounceIntroViewController

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC20HeadphoneProxService36HeadphoneAnnounceIntroViewController *v3;

  v3 = self;
  sub_10000C748((uint64_t)v3, v2);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC20HeadphoneProxService36HeadphoneAnnounceIntroViewController *v4;

  v4 = self;
  sub_10000CD70(a3, (uint64_t)v4);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService36HeadphoneAnnounceIntroViewController)initWithContentView:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(_QWORD *)&self->presenter[OBJC_IVAR____TtC20HeadphoneProxService36HeadphoneAnnounceIntroViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService36HeadphoneAnnounceIntroViewController_type] = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[HeadphoneAnnounceIntroViewController initWithContentView:](&v7, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  sub_100009FD0((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService36HeadphoneAnnounceIntroViewController_presenter]);
}

@end
