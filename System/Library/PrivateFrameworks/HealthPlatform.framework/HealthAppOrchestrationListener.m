@implementation HealthAppOrchestrationListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC14HealthPlatform30HealthAppOrchestrationListener *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1BC7DD8D0(v7);

  return v9 & 1;
}

- (_TtC14HealthPlatform30HealthAppOrchestrationListener)init
{
  _TtC14HealthPlatform30HealthAppOrchestrationListener *result;

  result = (_TtC14HealthPlatform30HealthAppOrchestrationListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14HealthPlatform30HealthAppOrchestrationListener_listener));
  sub_1BC7DDD3C((uint64_t)self + OBJC_IVAR____TtC14HealthPlatform30HealthAppOrchestrationListener_coordinator);
  swift_release();
}

@end
