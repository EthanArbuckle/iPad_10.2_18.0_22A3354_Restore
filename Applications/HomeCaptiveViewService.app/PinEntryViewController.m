@implementation PinEntryViewController

- (void)viewDidLoad
{
  _TtC22HomeCaptiveViewService22PinEntryViewController *v2;

  v2 = self;
  sub_10000AEA0();

}

- (void)didCompleteTextEntry:(id)a3
{
  id v4;
  _TtC22HomeCaptiveViewService22PinEntryViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10000B858();

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PinEntryViewController();
  v4 = v5.receiver;
  -[PinEntryViewController viewWillDisappear:](&v5, "viewWillDisappear:", v3);
  objc_msgSend(v4, "hideActivityIndicator", v5.receiver, v5.super_class);

}

- (_TtC22HomeCaptiveViewService22PinEntryViewController)initWithContentView:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit(&self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC22HomeCaptiveViewService22PinEntryViewController_coordinator], 0);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PinEntryViewController();
  return -[PinEntryViewController initWithContentView:](&v6, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy(&self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC22HomeCaptiveViewService22PinEntryViewController_coordinator], a2);
}

@end
