@implementation PresenceHostSession

- (NSString)description
{
  _TtC14CopresenceCore19PresenceHostSession *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = PresenceHostSession.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x1AF4480F4](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC14CopresenceCore19PresenceHostSession)init
{
  _TtC14CopresenceCore19PresenceHostSession *result;

  result = (_TtC14CopresenceCore19PresenceHostSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC14CopresenceCore19PresenceHostSession_id;
  v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_release();
  swift_release();

  outlined destroy of ActivitySession.DomainAssertionWrapper((uint64_t)self + OBJC_IVAR____TtC14CopresenceCore19PresenceHostSession_workQueue, (uint64_t (*)(_QWORD))type metadata accessor for AsyncSerialQueue);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC14CopresenceCore19PresenceHostSession_reporter);
  swift_release();

  swift_release();
  outlined destroy of UUID?((uint64_t)self + OBJC_IVAR____TtC14CopresenceCore19PresenceHostSession_sessionSuspensionController, &demangling cache variable for type metadata for SessionSuspensionControllerProtocol?);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC14CopresenceCore19PresenceHostSession *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = specialized PresenceHostSession.listener(_:shouldAcceptNewConnection:)(v7);

  return v9 & 1;
}

@end
