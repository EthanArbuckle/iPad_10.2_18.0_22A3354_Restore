@implementation RPSessionProxy

- (id)currentSessionID
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  sub_10001D3AC();
  if (v2)
  {
    v3 = v2;
    v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (RPSessionProxy)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RPSessionProxy();
  return -[RPSessionProxy init](&v3, "init");
}

- (uint64_t)start
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t inited;
  uint64_t v13;
  uint64_t v14;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_10001DA68();
  v5 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v14 = v9;
    *(_DWORD *)v8 = 136315138;
    v13 = sub_1000184E8(0x29287472617473, 0xE700000000000000, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v10 = type metadata accessor for RPSessionGateway();
  inited = swift_initStaticObject(v10, &unk_1000403A0);
  return (*(uint64_t (**)(void))(*(_QWORD *)inited + 176))();
}

- (uint64_t)finish
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t inited;
  uint64_t v13;
  uint64_t v14;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_10001DA68();
  v5 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v6 = Logger.logObject.getter(v5);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = swift_slowAlloc(32, -1);
    v14 = v9;
    *(_DWORD *)v8 = 136315138;
    v13 = sub_1000184E8(0x29286873696E6966, 0xE800000000000000, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s", v8, 0xCu);
    swift_arrayDestroy(v9, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v10 = type metadata accessor for RPSessionGateway();
  inited = swift_initStaticObject(v10, &unk_1000403A0);
  return (*(uint64_t (**)(void))(*(_QWORD *)inited + 184))();
}

@end
