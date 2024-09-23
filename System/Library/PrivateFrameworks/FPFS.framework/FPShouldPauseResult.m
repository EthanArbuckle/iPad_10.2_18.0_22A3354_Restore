@implementation FPShouldPauseResult

- (BOOL)shouldPause
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC9libfssync19FPShouldPauseResult_shouldPause);
}

- (OS_dispatch_semaphore)semaphore
{
  return (OS_dispatch_semaphore *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR____TtC9libfssync19FPShouldPauseResult_semaphore));
}

- (_TtC9libfssync19FPShouldPauseResult)initWithShouldPause:(BOOL)a3 semaphore:(id)a4
{
  id v5;
  objc_super v7;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC9libfssync19FPShouldPauseResult_shouldPause) = a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9libfssync19FPShouldPauseResult_semaphore) = (Class)a4;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FPShouldPauseResult();
  v5 = a4;
  return -[FPShouldPauseResult init](&v7, sel_init);
}

- (_TtC9libfssync19FPShouldPauseResult)init
{
  _TtC9libfssync19FPShouldPauseResult *result;

  result = (_TtC9libfssync19FPShouldPauseResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
