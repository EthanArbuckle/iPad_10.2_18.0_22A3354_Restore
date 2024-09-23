@implementation TagFeedServiceConfigPrefetcher

- (void)revisitSuspendedState
{
  _TtC7NewsUI230TagFeedServiceConfigPrefetcher *v3;

  *(_QWORD *)(swift_allocObject() + 16) = self;
  v3 = self;
  sub_1D6E1AFF0();

  swift_release();
}

- (_TtC7NewsUI230TagFeedServiceConfigPrefetcher)init
{
  _TtC7NewsUI230TagFeedServiceConfigPrefetcher *result;

  result = (_TtC7NewsUI230TagFeedServiceConfigPrefetcher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI230TagFeedServiceConfigPrefetcher_formatService);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI230TagFeedServiceConfigPrefetcher_assetHandleFactory);
  swift_release();

}

@end
