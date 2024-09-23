@implementation PASVSScannerCardViewController

- (void)viewDidLoad
{
  _TtC14PASViewService30PASVSScannerCardViewController *v2;

  v2 = self;
  sub_10000CF34();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PASVSScannerCardViewController();
  v4 = (char *)v5.receiver;
  -[PASVSScannerCardViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC14PASViewService30PASVSScannerCardViewController_scannerEngineVC], "start", v5.receiver, v5.super_class);
  objc_msgSend(v4, "resetConfirmationRing");

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PASVSScannerCardViewController();
  v4 = (char *)v5.receiver;
  -[PASVSScannerCardViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC14PASViewService30PASVSScannerCardViewController_scannerEngineVC], "stop", v5.receiver, v5.super_class);

}

- (_TtC14PASViewService30PASVSScannerCardViewController)initWithScannerEngine:(id)a3
{
  id v3;
  _TtC14PASViewService30PASVSScannerCardViewController *result;

  v3 = a3;
  result = (_TtC14PASViewService30PASVSScannerCardViewController *)_swift_stdlib_reportUnimplementedInitializer("PASViewService.PASVSScannerCardViewController", 45, "init(scannerEngine:)", 20, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease(*(_QWORD *)&self->PRXScannerViewController_opaque[OBJC_IVAR____TtC14PASViewService30PASVSScannerCardViewController_delegate]);
}

@end
