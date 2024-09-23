@implementation DOCChainOperation

- (void)main
{
  _TtC26DocumentManagerExecutables17DOCChainOperation *v2;

  v2 = self;
  DOCChainOperation.main()();

}

- (_TtC26DocumentManagerExecutables17DOCChainOperation)init
{
  _TtC26DocumentManagerExecutables17DOCChainOperation *result;

  result = (_TtC26DocumentManagerExecutables17DOCChainOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCChainOperation_operationQueue));
  sub_21EA5B5B0((uint64_t)self + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCChainOperation_latestOperationResult);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCChainOperation_latestOperationError));
}

@end
