@implementation FPFileTreeLifetimeExtender

- (double)timeout
{
  return *(double *)((char *)&self->super.isa
                   + OBJC_IVAR____TtC9libfssyncP33_4832980660C328E96B083C662469F36526FPFileTreeLifetimeExtender_timeout);
}

- (unint64_t)timeoutState
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC9libfssyncP33_4832980660C328E96B083C662469F36526FPFileTreeLifetimeExtender_timeoutState);
}

- (void)setTimeoutState:(unint64_t)a3
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC9libfssyncP33_4832980660C328E96B083C662469F36526FPFileTreeLifetimeExtender_timeoutState) = (Class)a3;
}

- (int)requestEffectivePID
{
  return objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC9libfssyncP33_4832980660C328E96B083C662469F36526FPFileTreeLifetimeExtender_requestor), sel_pid);
}

- (NSString)prettyDescription
{
  _TtC9libfssyncP33_4832980660C328E96B083C662469F36526FPFileTreeLifetimeExtender *v2;
  void *v3;

  v2 = self;
  sub_23AC07E74();

  v3 = (void *)sub_23B1C63BC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC9libfssyncP33_4832980660C328E96B083C662469F36526FPFileTreeLifetimeExtender)init
{
  _TtC9libfssyncP33_4832980660C328E96B083C662469F36526FPFileTreeLifetimeExtender *result;

  result = (_TtC9libfssyncP33_4832980660C328E96B083C662469F36526FPFileTreeLifetimeExtender *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9libfssyncP33_4832980660C328E96B083C662469F36526FPFileTreeLifetimeExtender_itemIdentifier));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9libfssyncP33_4832980660C328E96B083C662469F36526FPFileTreeLifetimeExtender_requestor));
}

@end
