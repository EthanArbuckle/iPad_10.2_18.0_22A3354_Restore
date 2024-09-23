@implementation HeadphoneSiriViewController

- (_TtC20HeadphoneProxService27HeadphoneSiriViewController)initWithContentView:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(_QWORD *)&self->presenter[OBJC_IVAR____TtC20HeadphoneProxService27HeadphoneSiriViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService27HeadphoneSiriViewController_type] = 22;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[HeadphoneSiriViewController initWithContentView:](&v7, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  sub_100009FD0((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService27HeadphoneSiriViewController_presenter]);
}

- (void)continueSetup
{
  sub_100037A1C((char *)self, (uint64_t)a2, sub_10007527C);
}

- (void)dismissSetup
{
  sub_100037A1C((char *)self, (uint64_t)a2, (void (*)(void))sub_100073404);
}

- (void)skipSetup
{
  sub_100037A1C((char *)self, (uint64_t)a2, sub_100075184);
}

- (void)showLearnMore
{
  sub_100037A1C((char *)self, (uint64_t)a2, (void (*)(void))sub_100075370);
}

@end
