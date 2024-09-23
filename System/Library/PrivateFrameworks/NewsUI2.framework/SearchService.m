@implementation SearchService

- (_TtC7NewsUI213SearchService)init
{
  _TtC7NewsUI213SearchService *result;

  result = (_TtC7NewsUI213SearchService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI213SearchService_searchEndpointConfigManager);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI213SearchService_queryContextManager);
  swift_unknownObjectRelease();
  sub_1D6318544(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI213SearchService_queryContext), *(_QWORD *)&self->connection[OBJC_IVAR____TtC7NewsUI213SearchService_queryContext]);
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI213SearchService_logger;
  v4 = sub_1D6E1C664();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
}

@end
