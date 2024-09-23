@implementation AudioDataManager

- (_TtC7NewsUI216AudioDataManager)init
{
  _TtC7NewsUI216AudioDataManager *result;

  result = (_TtC7NewsUI216AudioDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216AudioDataManager_feedConfigManager);

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216AudioDataManager_heroStore);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216AudioDataManager_playlistStore);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216AudioDataManager_recentlyPlayedStore);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216AudioDataManager_suggestionsStore);

  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216AudioDataManager_headlineConverter);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216AudioDataManager_completedListeningProcessor);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  sub_1D6AD91E0(self, (uint64_t)a2, a3);
}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  sub_1D6AD91E0(self, (uint64_t)a2, a3);
}

@end
