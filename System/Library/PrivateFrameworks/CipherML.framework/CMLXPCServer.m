@implementation CMLXPCServer

- (_TtC8CipherML12CMLXPCServer)init
{
  uint64_t ObjectType;
  _QWORD *v3;
  _TtC8CipherML12CMLXPCServer *v4;

  ObjectType = swift_getObjectType();
  type metadata accessor for RequestsManager();
  swift_allocObject();
  v3 = RequestsManager.init(configCache:keyStorage:activeUseCaseTracker:allowList:currentTime:)(0, 0, 0, 0, 0, (uint8_t *)closure #1 in default argument 4 of RequestsManager.init(configCache:keyStorage:activeUseCaseTracker:allowList:currentTime:), 0);
  v4 = (_TtC8CipherML12CMLXPCServer *)(*(uint64_t (**)(_QWORD *))(ObjectType + 88))(v3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC8CipherML12CMLXPCServer *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = specialized CMLXPCServer.listener(_:shouldAcceptNewConnection:)(v7);

  return v9 & 1;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
