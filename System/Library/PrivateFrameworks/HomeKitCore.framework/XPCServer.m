@implementation XPCServer

- (_TtC11HomeKitCore9XPCServer)init
{
  _TtC11HomeKitCore9XPCServer *result;

  result = (_TtC11HomeKitCore9XPCServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)start
{
  _TtC11HomeKitCore9XPCServer *v2;

  v2 = self;
  XPCServer.start()();

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC11HomeKitCore9XPCServer *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_22883C178(v7);

  return v9 & 1;
}

@end
