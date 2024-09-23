@implementation HeadphoneAdaptiveControlsAdaptiveModeViewController

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC20HeadphoneProxService51HeadphoneAdaptiveControlsAdaptiveModeViewController *v3;

  v3 = self;
  sub_100027F40((uint64_t)v3, v2);

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
  -[HeadphoneAdaptiveControlsAdaptiveModeViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  Strong = swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC20HeadphoneProxService51HeadphoneAdaptiveControlsAdaptiveModeViewController_presenter]);
  if (Strong)
  {
    v6 = Strong;
    sub_1000761A4(v4[OBJC_IVAR____TtC20HeadphoneProxService51HeadphoneAdaptiveControlsAdaptiveModeViewController_type]);

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

- (_TtC20HeadphoneProxService51HeadphoneAdaptiveControlsAdaptiveModeViewController)initWithContentView:(id)a3
{
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(_QWORD *)&self->presenter[OBJC_IVAR____TtC20HeadphoneProxService51HeadphoneAdaptiveControlsAdaptiveModeViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService51HeadphoneAdaptiveControlsAdaptiveModeViewController_type] = 9;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[HeadphoneAdaptiveControlsAdaptiveModeViewController initWithContentView:](&v7, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  sub_100009FD0((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService51HeadphoneAdaptiveControlsAdaptiveModeViewController_presenter]);
}

@end
