@implementation ObjCDiagnosticsReporterLaunchOptions

- (NSArray)files_to_attach
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_21E280534();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setFiles_to_attach:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  v4 = sub_21E280540();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSString)log_path
{
  return (NSString *)sub_21E27791C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path);
}

- (void)setLog_path:(id)a3
{
  sub_21E2779F8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path);
}

- (NSString)panic_string
{
  return (NSString *)sub_21E27791C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string);
}

- (void)setPanic_string:(id)a3
{
  sub_21E2779F8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string);
}

- (ObjCDiagnosticsReporterLaunchOptions)init
{
  _QWORD *v3;
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_files_to_attach) = (Class)MEMORY[0x24BEE4AF8];
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_log_path);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ObjCDiagnosticsReporterLaunchOptions_panic_string);
  v5 = (objc_class *)type metadata accessor for DiagnosticsReporterLaunchOptions();
  *v4 = 0;
  v4[1] = 0;
  v7.receiver = self;
  v7.super_class = v5;
  return -[ObjCDiagnosticsReporterLaunchOptions init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
