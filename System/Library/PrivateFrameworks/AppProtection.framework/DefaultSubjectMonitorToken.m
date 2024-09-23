@implementation DefaultSubjectMonitorToken

- (void)invalidate
{
  void (*v2)(void);
  _TtC13AppProtection26DefaultSubjectMonitorToken *v3;

  v2 = *(void (**)(void))((char *)&self->super.isa
                        + OBJC_IVAR____TtC13AppProtection26DefaultSubjectMonitorToken_invalidationHandler);
  v3 = self;
  v2();

}

- (_TtC13AppProtection26DefaultSubjectMonitorToken)init
{
  _TtC13AppProtection26DefaultSubjectMonitorToken *result;

  result = (_TtC13AppProtection26DefaultSubjectMonitorToken *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

- (uint64_t)hash
{
  return MEMORY[0x24BEE0930]();
}

@end
