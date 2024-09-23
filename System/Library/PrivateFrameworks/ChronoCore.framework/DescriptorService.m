@implementation DescriptorService

- (void)dealloc
{
  _TtC10ChronoCore17DescriptorService *v2;

  v2 = self;
  sub_1D29675A4();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore17DescriptorService_extensionManager);
  sub_1D271E704((uint64_t)self + OBJC_IVAR____TtC10ChronoCore17DescriptorService_userManager, &qword_1EFC90090);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore17DescriptorService_remoteWidgetDescriptorService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore17DescriptorService_preferences);
  sub_1D271E704((uint64_t)self + OBJC_IVAR____TtC10ChronoCore17DescriptorService_descriptorCache, &qword_1ED94DB30);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore17DescriptorService_hostService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore17DescriptorService_intentResolver);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore17DescriptorService_keybagStateProvider);
  sub_1D271E704((uint64_t)self + OBJC_IVAR____TtC10ChronoCore17DescriptorService_stateCaptureManager, &qword_1ED954178);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10ChronoCore17DescriptorService_taskService);
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

- (_TtC10ChronoCore17DescriptorService)init
{
  _TtC10ChronoCore17DescriptorService *result;

  result = (_TtC10ChronoCore17DescriptorService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
