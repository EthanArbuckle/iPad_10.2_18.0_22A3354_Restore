@implementation HeadphoneUnsupportedViewController

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC20HeadphoneProxService34HeadphoneUnsupportedViewController *v3;

  v3 = self;
  sub_1000553F0((uint64_t)v3, v2);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService34HeadphoneUnsupportedViewController)initWithContentView:(id)a3
{
  objc_class *ObjectType;
  unsigned __int8 *v6;
  uint64_t v7;
  unsigned __int8 *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v6 = &self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService34HeadphoneUnsupportedViewController_viewModel];
  v7 = type metadata accessor for HeadphoneViewModel(0);
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = &self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService34HeadphoneUnsupportedViewController_presenter];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService34HeadphoneUnsupportedViewController_type] = 24;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[SoftwareUpdateRequiredViewController initWithContentView:](&v10, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  sub_1000558E8((uint64_t)self + OBJC_IVAR____TtC20HeadphoneProxService34HeadphoneUnsupportedViewController_viewModel);
  swift_unknownObjectRelease(*(_QWORD *)&self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService34HeadphoneUnsupportedViewController_presenter]);
}

@end
