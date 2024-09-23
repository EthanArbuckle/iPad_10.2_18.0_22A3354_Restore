@implementation PuzzleNotificationAutoEnableStartupTask

- (_TtC8NewsFeed39PuzzleNotificationAutoEnableStartupTask)init
{
  _TtC8NewsFeed39PuzzleNotificationAutoEnableStartupTask *result;

  result = (_TtC8NewsFeed39PuzzleNotificationAutoEnableStartupTask *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8NewsFeed39PuzzleNotificationAutoEnableStartupTask_executionPhase;
  v4 = sub_1BB86E6BC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8NewsFeed39PuzzleNotificationAutoEnableStartupTask_notificationController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8NewsFeed39PuzzleNotificationAutoEnableStartupTask_userInfo));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed39PuzzleNotificationAutoEnableStartupTask_featureAvailability);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed39PuzzleNotificationAutoEnableStartupTask_puzzleHistoryService);
}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _TtC8NewsFeed39PuzzleNotificationAutoEnableStartupTask *v10;

  v4 = qword_1ED3C0B50;
  v5 = a3;
  v10 = self;
  if (v4 != -1)
    swift_once();
  v6 = sub_1BB86EFEC();
  __swift_project_value_buffer(v6, (uint64_t)qword_1ED476918);
  v7 = sub_1BB86EFC8();
  v8 = sub_1BB87330C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1BA493000, v7, v8, "PuzzleNotificationAutoEnableStartupTask received a subscription expired notification.", v9, 2u);
    MEMORY[0x1BCCE5C38](v9, -1, -1);
  }

  sub_1BB110C28();
}

@end
