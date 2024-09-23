@implementation AsynchronousBlockOperation

- (void)main
{
  void (*v2)(void);
  _TtC16HealthExperience26AsynchronousBlockOperation *v3;

  v2 = *(void (**)(void))((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC16HealthExperience26AsynchronousBlockOperation_workBlock);
  v3 = self;
  v2();

}

- (NSString)debugDescription
{
  _TtC16HealthExperience26AsynchronousBlockOperation *v2;
  void *v3;

  v2 = self;
  sub_1BC8C34AC();

  v3 = (void *)sub_1BC933E88();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC16HealthExperience26AsynchronousBlockOperation)init
{
  _TtC16HealthExperience26AsynchronousBlockOperation *result;

  result = (_TtC16HealthExperience26AsynchronousBlockOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

@end
