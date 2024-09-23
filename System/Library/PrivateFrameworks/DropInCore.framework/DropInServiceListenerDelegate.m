@implementation DropInServiceListenerDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC10DropInCore29DropInServiceListenerDelegate *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_23A7BAAAC((uint64_t)v8, v7);

  return v9 & 1;
}

- (_TtC10DropInCore29DropInServiceListenerDelegate)init
{
  sub_23A7BC304();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  swift_unknownObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC10DropInCore29DropInServiceListenerDelegate_logger;
  v4 = sub_23A7F1E0C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  sub_23A77EF5C((uint64_t)self + OBJC_IVAR____TtC10DropInCore29DropInServiceListenerDelegate_xpcClientDelegate);
}

@end
