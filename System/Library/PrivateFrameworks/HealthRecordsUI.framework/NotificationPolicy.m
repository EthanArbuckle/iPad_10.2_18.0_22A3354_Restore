@implementation NotificationPolicy

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  void (**v8)(void *, uint64_t);
  uint64_t v9;
  id v10;
  _TtC15HealthRecordsUI18NotificationPolicy *v11;
  uint64_t v12;
  id v13;

  v8 = (void (**)(void *, uint64_t))_Block_copy(a5);
  v9 = qword_1EF428870;
  v10 = a3;
  v13 = a4;
  v11 = self;
  if (v9 != -1)
    swift_once();
  if ((sub_1BC60FC6C() & 1) != 0)
    v12 = 0;
  else
    v12 = 27;
  v8[2](v8, v12);
  _Block_release(v8);

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC15HealthRecordsUI18NotificationPolicy *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1BC4C552C(v11, sub_1BC486A8C, v9);

  swift_release();
}

- (_TtC15HealthRecordsUI18NotificationPolicy)init
{
  _TtC15HealthRecordsUI18NotificationPolicy *result;

  result = (_TtC15HealthRecordsUI18NotificationPolicy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI18NotificationPolicy_notificationSyncStore));
  swift_bridgeObjectRelease();
}

@end
