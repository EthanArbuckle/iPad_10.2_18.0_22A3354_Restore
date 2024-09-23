@implementation WidgetCenterServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  _TtC10ChronoCore18WidgetCenterServer *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1D2729024(v7);

  return v9 & 1;
}

- (_TtC10ChronoCore18WidgetCenterServer)init
{
  _TtC10ChronoCore18WidgetCenterServer *result;

  result = (_TtC10ChronoCore18WidgetCenterServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore18WidgetCenterServer__extensionManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore18WidgetCenterServer__timelineService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore18WidgetCenterServer__descriptorService);
  sub_1D271E704((uint64_t)self + OBJC_IVAR____TtC10ChronoCore18WidgetCenterServer__widgetRelevanceService, &qword_1ED952500);
}

@end
