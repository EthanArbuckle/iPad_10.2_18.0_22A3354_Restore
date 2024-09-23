@implementation HealthRecordsNotifications

- (_TtC15HealthRecordsUI26HealthRecordsNotifications)init
{
  _TtC15HealthRecordsUI26HealthRecordsNotifications *v2;
  unint64_t v3;
  objc_super v5;

  v2 = self;
  if ((MEMORY[0x1E0DEE9D8] & 0xC000000000000000) != 0 && sub_1BC62D3B8())
    v3 = sub_1BC523A5C(MEMORY[0x1E0DEE9D8]);
  else
    v3 = MEMORY[0x1E0DEE9E8];
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR____TtC15HealthRecordsUI26HealthRecordsNotifications_cancellables) = (Class)v3;
  sub_1BC62AA0C();
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR____TtC15HealthRecordsUI26HealthRecordsNotifications_notificationManager) = (Class)sub_1BC62AA00();

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for HealthRecordsNotifications();
  return -[HealthRecordsNotifications init](&v5, sel_init);
}

- (void)notificationAlertIfNecessaryWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC15HealthRecordsUI26HealthRecordsNotifications *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1BC521AC8((uint64_t)sub_1BC3DD9EC, v5);

  swift_release();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
}

@end
