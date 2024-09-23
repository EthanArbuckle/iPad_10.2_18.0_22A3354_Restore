@implementation FPFSServicerExtender

- (int)requestEffectivePID
{
  return objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync20FPFSServicerExtender_request), sel_pid);
}

- (NSString)prettyDescription
{
  _TtC9libfssync20FPFSServicerExtender *v2;
  void *v3;

  v2 = self;
  sub_23ABF7C34();

  v3 = (void *)sub_23B1C63BC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC9libfssync20FPFSServicerExtender)init
{
  _TtC9libfssync20FPFSServicerExtender *result;

  result = (_TtC9libfssync20FPFSServicerExtender *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
