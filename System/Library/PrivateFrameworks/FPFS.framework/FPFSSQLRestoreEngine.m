@implementation FPFSSQLRestoreEngine

- (_TtC9libfssync20FPFSSQLRestoreEngine)initWithUserURL:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v3 = sub_23B1C5A08();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23B1C59CC();
  return (_TtC9libfssync20FPFSSQLRestoreEngine *)sub_23B136124(v5);
}

- (void)restoreWithCleanupOnSuccess:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  void *v6;
  _TtC9libfssync20FPFSSQLRestoreEngine *v7;

  v4 = a3;
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = self;
  sub_23B13FDAC(v4, (uint64_t)v7, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (_TtC9libfssync20FPFSSQLRestoreEngine)init
{
  _TtC9libfssync20FPFSSQLRestoreEngine *result;

  result = (_TtC9libfssync20FPFSSQLRestoreEngine *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC9libfssync20FPFSSQLRestoreEngine_userURL;
  v3 = sub_23B1C5A08();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end
