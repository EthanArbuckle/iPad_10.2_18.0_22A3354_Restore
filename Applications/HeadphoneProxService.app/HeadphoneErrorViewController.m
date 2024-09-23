@implementation HeadphoneErrorViewController

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC20HeadphoneProxService28HeadphoneErrorViewController *v3;

  v3 = self;
  sub_100025FAC((uint64_t)v3, v2);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService28HeadphoneErrorViewController)initWithContentView:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(_QWORD *)&self->presenter[OBJC_IVAR____TtC20HeadphoneProxService28HeadphoneErrorViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService28HeadphoneErrorViewController_type] = 14;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[HeadphoneErrorViewController initWithContentView:](&v7, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  sub_100009FD0((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService28HeadphoneErrorViewController_presenter]);
}

@end
