@implementation ObjCDiagnosticsReporterLaunchOptions

- (NSArray)files_to_attach
{
  uint64_t *v2;
  uint64_t v3;
  Class isa;
  _BYTE v6[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach);
  swift_beginAccess((char *)self + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach, v6, 0, 0);
  v3 = *v2;
  swift_bridgeObjectRetain(v3);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (void)setFiles_to_attach:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7[24];

  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach);
  swift_beginAccess(v5, v7, 1, 0);
  v6 = *v5;
  *v5 = v4;
  swift_bridgeObjectRelease(v6);
}

- (NSString)log_path
{
  return (NSString *)sub_10000DA54((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path);
}

- (void)setLog_path:(id)a3
{
  sub_10000DB30((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path);
}

- (NSString)panic_string
{
  return (NSString *)sub_10000DA54((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string);
}

- (void)setPanic_string:(id)a3
{
  sub_10000DB30((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string);
}

- (ObjCDiagnosticsReporterLaunchOptions)init
{
  _QWORD *v3;
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach) = (Class)&_swiftEmptyArrayStorage;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string);
  v5 = (objc_class *)type metadata accessor for DiagnosticsReporterLaunchOptions();
  *v4 = 0;
  v4[1] = 0;
  v7.receiver = self;
  v7.super_class = v5;
  return -[ObjCDiagnosticsReporterLaunchOptions init](&v7, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach));
  swift_bridgeObjectRelease(*(_QWORD *)&self->files_to_attach[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->files_to_attach[OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string]);
}

@end
