@implementation ProxyOperationClient

- (id)proxifiedDescription
{
  void *v2;
  _TtC9libfssyncP33_7F4FBB69DAA1D0B2DA22684CBB0F5CB320ProxyOperationClient *v3;
  id v4;
  void *v5;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC9libfssyncP33_7F4FBB69DAA1D0B2DA22684CBB0F5CB320ProxyOperationClient_client);
  v3 = self;
  v4 = objc_msgSend(v2, sel_proxifiedDescription);
  sub_23B1C63E0();

  v5 = (void *)sub_23B1C63BC();
  swift_bridgeObjectRelease();
  return v5;
}

- (void)setCancellationHandler:(id)a3
{
  _TtC9libfssyncP33_7F4FBB69DAA1D0B2DA22684CBB0F5CB320ProxyOperationClient *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_23ABF764C((uint64_t)a3);
  swift_unknownObjectRelease();

}

- (void)cancel
{
  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC9libfssyncP33_7F4FBB69DAA1D0B2DA22684CBB0F5CB320ProxyOperationClient_client), sel_cancel);
}

- (void)operationDidProgressWithInfo:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC9libfssyncP33_7F4FBB69DAA1D0B2DA22684CBB0F5CB320ProxyOperationClient *v10;
  id v11;

  v7 = _Block_copy(a5);
  v8 = sub_23B1C620C();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = self;
  v11 = a4;
  sub_23ABF7784(v8, a4, (uint64_t)sub_23AAB792C, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC9libfssyncP33_7F4FBB69DAA1D0B2DA22684CBB0F5CB320ProxyOperationClient)init
{
  _TtC9libfssyncP33_7F4FBB69DAA1D0B2DA22684CBB0F5CB320ProxyOperationClient *result;

  result = (_TtC9libfssyncP33_7F4FBB69DAA1D0B2DA22684CBB0F5CB320ProxyOperationClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

@end
