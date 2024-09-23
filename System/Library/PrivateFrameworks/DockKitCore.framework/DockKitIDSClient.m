@implementation DockKitIDSClient

- (_TtC11DockKitCore16DockKitIDSClient)init
{
  _TtC11DockKitCore16DockKitIDSClient *result;

  result = (_TtC11DockKitCore16DockKitIDSClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC11DockKitCore16DockKitIDSClient_token;
  v4 = sub_23A69072C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_23A5F234C((uint64_t)self + OBJC_IVAR____TtC11DockKitCore16DockKitIDSClient_delegate);
  swift_bridgeObjectRelease();
}

@end
