@implementation TodayDataManager

- (_TtC7NewsUI216TodayDataManager)init
{
  _TtC7NewsUI216TodayDataManager *result;

  result = (_TtC7NewsUI216TodayDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_delegate);
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_sharedItemManager);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_nativeAdService);
  swift_release();
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_sportsOnboardingManager);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_shortcutService);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_historyService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_puzzleStatsService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_puzzleHistoryService);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_offlineFeedPrimer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_offlineFeatures);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_shortcutsModule);

}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  char *v5;
  uint64_t v6;
  void (*v7)(void);
  id v8;
  _TtC7NewsUI216TodayDataManager *v9;

  v5 = (char *)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_delegate;
  if (MEMORY[0x1D82919D4]((char *)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 48);
    v8 = a3;
    v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  char *v5;
  uint64_t v6;
  void (*v7)(void);
  id v8;
  _TtC7NewsUI216TodayDataManager *v9;

  v5 = (char *)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_delegate;
  if (MEMORY[0x1D82919D4]((char *)self + OBJC_IVAR____TtC7NewsUI216TodayDataManager_delegate, a2))
  {
    v6 = *((_QWORD *)v5 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 56);
    v8 = a3;
    v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6
{
  id v7;
  _TtC7NewsUI216TodayDataManager *v8;

  v7 = a3;
  v8 = self;
  sub_1D67C3FC4(v7);

}

@end
