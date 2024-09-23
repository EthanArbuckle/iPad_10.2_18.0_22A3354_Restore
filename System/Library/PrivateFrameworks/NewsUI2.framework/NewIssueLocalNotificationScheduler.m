@implementation NewIssueLocalNotificationScheduler

- (_TtC7NewsUI234NewIssueLocalNotificationScheduler)init
{
  _TtC7NewsUI234NewIssueLocalNotificationScheduler *result;

  result = (_TtC7NewsUI234NewIssueLocalNotificationScheduler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI234NewIssueLocalNotificationScheduler_notificationService);
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI234NewIssueLocalNotificationScheduler_calendar;
  v4 = sub_1D6E16094();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
}

- (void)issueReadingHistoryDidChange:(id)a3 forIssueIDs:(id)a4
{
  id v6;
  _TtC7NewsUI234NewIssueLocalNotificationScheduler *v7;
  _TtC7NewsUI234NewIssueLocalNotificationScheduler *v8;
  void *v9;

  swift_getObjectType();
  sub_1D5E847C4(0, (unint64_t *)&qword_1ED603DE0, type metadata accessor for UserNotification, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  v6 = a3;
  v7 = self;
  sub_1D6E1AE1C();
  *(_QWORD *)(swift_allocObject() + 16) = v7;
  v8 = v7;
  v9 = (void *)sub_1D6E1AB4C();
  sub_1D6E1AC3C();

  swift_release();
  swift_release();
  swift_release();

}

@end
