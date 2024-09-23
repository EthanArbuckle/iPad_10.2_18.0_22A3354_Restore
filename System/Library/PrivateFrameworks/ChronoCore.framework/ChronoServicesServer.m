@implementation ChronoServicesServer

- (void)dealloc
{
  void *v3;
  _TtC10ChronoCore20ChronoServicesServer *v4;
  objc_super v5;

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_connectionListener);
  v4 = self;
  if (v3)
    objc_msgSend(v3, sel_invalidate);
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ChronoServicesServer();
  -[ChronoServicesServer dealloc](&v5, sel_dealloc);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_timelineService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_taskService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_descriptorService);
  sub_1D271E704((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_deviceService, qword_1ED953300);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_extensionService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_widgetHostService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_keybagStateProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_powerlogSuggestionService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_keepAliveAssertionProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_duetService);
  sub_1D271E704((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_stuckPairedRelationshipRepairer, (uint64_t *)&unk_1ED952840);
  sub_1D271E704((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_widgetRelevanceService, &qword_1ED952500);
  sub_1D271E704((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_remoteActivityLaunchService, &qword_1ED9525E0);
  sub_1D271E704((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_activityService, &qword_1ED9589E8);
  sub_1D271E704((uint64_t)self + OBJC_IVAR____TtC10ChronoCore20ChronoServicesServer_iconStore, (uint64_t *)&unk_1ED955E98);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (_TtC10ChronoCore20ChronoServicesServer)init
{
  _TtC10ChronoCore20ChronoServicesServer *result;

  result = (_TtC10ChronoCore20ChronoServicesServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  _TtC10ChronoCore20ChronoServicesServer *v9;

  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1D28590E8(v8);

  swift_unknownObjectRelease();
}

@end
