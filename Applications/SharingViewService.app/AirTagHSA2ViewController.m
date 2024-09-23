@implementation AirTagHSA2ViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18SharingViewService24AirTagHSA2ViewController *v4;

  v4 = self;
  sub_10000DE0C(a3);

}

- (_TtC18SharingViewService24AirTagHSA2ViewController)initWithContentView:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit(&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService24AirTagHSA2ViewController_mainController], 0);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AirTagHSA2ViewController();
  return -[AirTagHSA2ViewController initWithContentView:](&v6, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy(&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService24AirTagHSA2ViewController_mainController], a2);
}

@end
