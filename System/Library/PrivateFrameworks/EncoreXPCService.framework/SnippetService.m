@implementation SnippetService

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC16EncoreXPCService14SnippetService *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_23A8A7898();

  return v9 & 1;
}

- (void)subscribeWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC16EncoreXPCService14SnippetService *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_23A8A6F6C((uint64_t)sub_23A8A7C1C, v5);

  swift_release();
}

- (void)handleEventWithEvent:(id)a3
{
  id v4;
  _TtC16EncoreXPCService14SnippetService *v5;

  v4 = a3;
  v5 = self;
  sub_23A8A70DC(v4);

}

- (void)publishWithEvent:(id)a3
{
  id v4;
  _TtC16EncoreXPCService14SnippetService *v5;

  v4 = a3;
  v5 = self;
  sub_23A8A74E4(v4);

}

- (void)echoWithEvent:(id)a3
{
  id v4;
  _TtC16EncoreXPCService14SnippetService *v5;

  v4 = a3;
  v5 = self;
  sub_23A8A754C(v4);

}

- (_TtC16EncoreXPCService14SnippetService)init
{
  _TtC16EncoreXPCService14SnippetService *result;

  result = (_TtC16EncoreXPCService14SnippetService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_23A8A3CB8(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC16EncoreXPCService14SnippetService_eventHandler));
  swift_unknownObjectRelease();

}

@end
