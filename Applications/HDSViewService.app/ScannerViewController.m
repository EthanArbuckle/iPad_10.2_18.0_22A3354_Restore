@implementation ScannerViewController

- (void)viewDidLoad
{
  _TtC14HDSViewService21ScannerViewController *v2;

  v2 = self;
  sub_10004D398();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ScannerViewController(0);
  v4 = v7.receiver;
  -[ScannerViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  sub_10007805C();
  sub_100061CE4(v5, v6);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  os_log_type_t v10;
  uint8_t *v11;
  objc_super v12;

  v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for ScannerViewController(0);
  v4 = v12.receiver;
  -[ScannerViewController viewDidDisappear:](&v12, "viewDidDisappear:", v3);
  if (qword_1000D55F0 != -1)
    swift_once(&qword_1000D55F0, sub_10006035C);
  v6 = type metadata accessor for Logger(0, v5);
  v7 = sub_10001118C(v6, (uint64_t)qword_1000D74F8);
  v8 = Logger.logObject.getter(v7);
  v10 = static os_log_type_t.default.getter(v8, v9);
  if (os_log_type_enabled(v8, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v10, "SVSHomePodIDViewController: stop was called", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

}

- (_TtC14HDSViewService21ScannerViewController)initWithContentView:(id)a3
{
  id v3;
  __n128 v4;
  __n128 v5;
  __n128 v6;
  __n128 v7;
  _TtC14HDSViewService21ScannerViewController *result;

  v3 = a3;
  result = (_TtC14HDSViewService21ScannerViewController *)_swift_stdlib_reportUnimplementedInitializer("HDSViewService.ScannerViewController", 36, "init(contentView:)", 18, 0, v4, v5, v6, v7);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  unsigned __int8 *v3;
  uint64_t v4;

  v3 = &self->viewfinderViewController[OBJC_IVAR____TtC14HDSViewService21ScannerViewController_log];
  v4 = type metadata accessor for Logger(0, a2);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
