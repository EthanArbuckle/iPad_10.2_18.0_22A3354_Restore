@implementation AudioFeedContentPrefetcher

- (_TtC7NewsUI226AudioFeedContentPrefetcher)init
{
  _TtC7NewsUI226AudioFeedContentPrefetcher *result;

  result = (_TtC7NewsUI226AudioFeedContentPrefetcher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI226AudioFeedContentPrefetcher_feedConfigManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI226AudioFeedContentPrefetcher_formatService);
  swift_unknownObjectRelease();
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  _TtC7NewsUI226AudioFeedContentPrefetcher *v8;
  id v9;
  _QWORD v10[6];

  v5 = (void *)objc_opt_self();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = self;
  v10[4] = sub_1D6CFD3A0;
  v10[5] = v6;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 1107296256;
  v10[2] = sub_1D5EB52E8;
  v10[3] = &block_descriptor_198;
  v7 = _Block_copy(v10);
  v8 = self;
  v9 = a3;
  swift_release();
  objc_msgSend(v5, sel_scheduleLowPriorityBlock_, v7);
  _Block_release(v7);

}

@end
