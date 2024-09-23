@implementation ALServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC5ALXPC17ALServiceDelegate *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = specialized ALServiceDelegate.listener(_:shouldAcceptNewConnection:)(v7);

  return v9 & 1;
}

- (void)onData:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _TtC5ALXPC17ALServiceDelegate *v8;

  v4 = a3;
  v8 = self;
  v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = v6;

  ALServiceDelegate.onData(_:)(v5, v7);
  outlined consume of Data._Representation(v5, v7);

}

- (void)onInterrupt
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC5ALXPC17ALServiceDelegate *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;

  v3 = type metadata accessor for Logger();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  xpclog.getter((uint64_t)v6);
  v8 = Logger.logObject.getter();
  v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_235928000, v8, v9, "service,onInterrupt", v10, 2u);
    MEMORY[0x23B7DBDA4](v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (_TtC5ALXPC17ALServiceDelegate)init
{
  _TtC5ALXPC17ALServiceDelegate *result;

  result = (_TtC5ALXPC17ALServiceDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC5ALXPC17ALServiceDelegate__dataService);
}

@end
