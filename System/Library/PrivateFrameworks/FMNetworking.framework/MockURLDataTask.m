@implementation MockURLDataTask

- (void)resume
{
  void (*v2)(void);
  _TtC12FMNetworking15MockURLDataTask *v3;

  v2 = *(void (**)(void))((char *)&self->super.super.super.isa
                        + OBJC_IVAR____TtC12FMNetworking15MockURLDataTask_executionBlock);
  v3 = self;
  v2();

}

- (_TtC12FMNetworking15MockURLDataTask)init
{
  _TtC12FMNetworking15MockURLDataTask *result;

  result = (_TtC12FMNetworking15MockURLDataTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
