@implementation FPFSSQLBackupEngine

- (_TtC9libfssync19FPFSSQLBackupEngine)initWithUserURL:(id)a3 outputUserURL:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v4 = sub_23B1C5A08();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v11 - v8;
  sub_23B1C59CC();
  sub_23B1C59CC();
  return (_TtC9libfssync19FPFSSQLBackupEngine *)sub_23B0F1FA8(v9, v7);
}

- (void)backUpWithCompletionHandler:(id)a3
{
  void *v4;
  _TtC9libfssync19FPFSSQLBackupEngine *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_23B0F4CB8((char *)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (_TtC9libfssync19FPFSSQLBackupEngine)init
{
  _TtC9libfssync19FPFSSQLBackupEngine *result;

  result = (_TtC9libfssync19FPFSSQLBackupEngine *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC9libfssync19FPFSSQLBackupEngine_userURL;
  v4 = sub_23B1C5A08();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC9libfssync19FPFSSQLBackupEngine_outputUserURL, v4);
  v5((char *)self + OBJC_IVAR____TtC9libfssync19FPFSSQLBackupEngine_destinationDirectoryURL, v4);
  v5((char *)self + OBJC_IVAR____TtC9libfssync19FPFSSQLBackupEngine_backupManifestURL, v4);
}

@end
