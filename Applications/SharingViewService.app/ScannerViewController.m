@implementation ScannerViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  uint64_t ObjectType;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ScannerViewController(0);
  v4 = (char *)v7.receiver;
  -[ScannerViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC18SharingViewService21ScannerViewController_scannerEngineViewController + 8];
  ObjectType = swift_getObjectType(*(_QWORD *)&v4[OBJC_IVAR____TtC18SharingViewService21ScannerViewController_scannerEngineViewController]);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(ObjectType, v5);
  objc_msgSend(v4, "resetConfirmationRing", v7.receiver, v7.super_class);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  uint64_t ObjectType;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ScannerViewController(0);
  v4 = (char *)v7.receiver;
  -[ScannerViewController viewDidDisappear:](&v7, "viewDidDisappear:", v3);
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC18SharingViewService21ScannerViewController_scannerEngineViewController + 8];
  ObjectType = swift_getObjectType(*(_QWORD *)&v4[OBJC_IVAR____TtC18SharingViewService21ScannerViewController_scannerEngineViewController]);
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(ObjectType, v5);

}

- (_TtC18SharingViewService21ScannerViewController)initWithScannerEngine:(id)a3
{
  id v3;
  _TtC18SharingViewService21ScannerViewController *result;

  v3 = a3;
  result = (_TtC18SharingViewService21ScannerViewController *)_swift_stdlib_reportUnimplementedInitializer("SharingViewService.ScannerViewController", 40, "init(scannerEngine:)", 20, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  unsigned __int8 *v3;
  uint64_t v4;

  v3 = &self->scannerEngineViewController[OBJC_IVAR____TtC18SharingViewService21ScannerViewController_log];
  v4 = type metadata accessor for Logger(0, a2);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
