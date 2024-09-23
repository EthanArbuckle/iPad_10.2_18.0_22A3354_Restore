@implementation DummyOperationClient

- (id)proxifiedDescription
{
  return (id)sub_23B1C63BC();
}

- (void)setCancellationHandler:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9libfssync20DummyOperationClient_cancellationHandler) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (void)operationDidProgressWithInfo:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  _TtC9libfssync20DummyOperationClient *v9;
  id v10;

  v7 = _Block_copy(a5);
  v8 = sub_23B1C620C();
  _Block_copy(v7);
  v9 = self;
  v10 = a4;
  sub_23AC23384(v8, a4, (uint64_t)v9, (uint64_t)v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (_TtC9libfssync20DummyOperationClient)init
{
  _TtC9libfssync20DummyOperationClient *result;

  result = (_TtC9libfssync20DummyOperationClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectRelease();
}

@end
