@implementation IntroViewController

- (void)viewDidLoad
{
  _TtC22HomeCaptiveViewService19IntroViewController *v2;

  v2 = self;
  sub_100003C80();

}

- (_TtC22HomeCaptiveViewService19IntroViewController)initWithContentView:(id)a3
{
  unsigned __int8 *v5;
  objc_class *v6;
  objc_super v8;

  swift_unknownObjectWeakInit(&self->PRXIconContentViewController_opaque[OBJC_IVAR____TtC22HomeCaptiveViewService19IntroViewController_coordinator], 0);
  v5 = &self->PRXIconContentViewController_opaque[OBJC_IVAR____TtC22HomeCaptiveViewService19IntroViewController_deviceName];
  v6 = (objc_class *)type metadata accessor for IntroViewController();
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[IntroViewController initWithContentView:](&v8, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy(&self->PRXIconContentViewController_opaque[OBJC_IVAR____TtC22HomeCaptiveViewService19IntroViewController_coordinator], a2);
  swift_bridgeObjectRelease(*(_QWORD *)&self->coordinator[OBJC_IVAR____TtC22HomeCaptiveViewService19IntroViewController_deviceName]);
}

@end
