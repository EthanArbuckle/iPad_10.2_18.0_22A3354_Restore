@implementation ClientConnection

- (_TtC12GroupKitCore16ClientConnection)init
{
  return (_TtC12GroupKitCore16ClientConnection *)ClientConnection.init()();
}

- (void).cxx_destruct
{
  swift_release();

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  id v6;
  _TtC12GroupKitCore16ClientConnection *v7;

  v5 = a3;
  v6 = a4;
  v7 = self;
  ClientConnection.listener(_:shouldAcceptNewConnection:)((NSXPCListener)a3, (NSXPCConnection)a4);

  return _convertBoolToObjCBool(_:)() & 1;
}

@end
