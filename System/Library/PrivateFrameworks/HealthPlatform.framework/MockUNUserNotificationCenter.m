@implementation MockUNUserNotificationCenter

- (_TtC14HealthPlatform28MockUNUserNotificationCenter)initWithBundleIdentifier:(id)a3 queue:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a3)
  {
    v5 = sub_1BC817AE8();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  return (_TtC14HealthPlatform28MockUNUserNotificationCenter *)sub_1BC750400(v5, v7, a4);
}

- (void)addNotificationRequest:(id)a3 withCompletionHandler:(id)a4
{
  void (*v6)(void);
  uint64_t v7;
  id v8;
  _TtC14HealthPlatform28MockUNUserNotificationCenter *v9;

  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_1BC753AD0;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_1BC75055C(v8, v6, v7);
  sub_1BC6F748C((uint64_t)v6);

}

- (void)getPendingNotificationRequestsWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  os_unfair_lock_s *v7;
  _TtC14HealthPlatform28MockUNUserNotificationCenter *v8;

  v4 = _Block_copy(a3);
  *(_QWORD *)(swift_allocObject() + 16) = v4;
  v5 = *(uint64_t *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC14HealthPlatform28MockUNUserNotificationCenter_mockNotificationState);
  v6 = (_QWORD *)(v5 + 16);
  v7 = (os_unfair_lock_s *)(v5 + 40);
  v8 = self;
  os_unfair_lock_lock(v7);
  sub_1BC753AAC(v6);
  os_unfair_lock_unlock(v7);

  swift_release();
}

- (id)pendingNotificationRequests
{
  return sub_1BC751994((char *)self, (uint64_t)a2, (void (*)(uint64_t *__return_ptr, os_unfair_lock_s *))sub_1BC7517D8, (unint64_t *)&qword_1ED6B85A0);
}

- (void)getDeliveredNotificationsWithCompletionHandler:(id)a3
{
  void *v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  _TtC14HealthPlatform28MockUNUserNotificationCenter *v8;

  v4 = _Block_copy(a3);
  *(_QWORD *)(swift_allocObject() + 16) = v4;
  v5 = *(os_unfair_lock_s **)((char *)&self->super.super.isa
                            + OBJC_IVAR____TtC14HealthPlatform28MockUNUserNotificationCenter_mockNotificationState);
  v6 = (uint64_t)&v5[4];
  v7 = v5 + 10;
  v8 = self;
  os_unfair_lock_lock(v7);
  sub_1BC753A60(v6);
  os_unfair_lock_unlock(v7);

  swift_release();
}

- (id)deliveredNotifications
{
  return sub_1BC751994((char *)self, (uint64_t)a2, (void (*)(uint64_t *__return_ptr, os_unfair_lock_s *))sub_1BC75195C, &qword_1EF45B870);
}

- (void)removePendingNotificationRequestsWithIdentifiers:(id)a3
{
  sub_1BC751BF0((char *)self, (uint64_t)a2, (uint64_t)a3, (void (*)(os_unfair_lock_s *))sub_1BC753A20);
}

- (void)removeDeliveredNotificationsWithIdentifiers:(id)a3
{
  sub_1BC751BF0((char *)self, (uint64_t)a2, (uint64_t)a3, (void (*)(os_unfair_lock_s *))sub_1BC753A08);
}

- (void)removeAllPendingNotificationRequests
{
  sub_1BC751D0C((char *)self, (uint64_t)a2, (void (*)(os_unfair_lock_s *))sub_1BC751C84);
}

- (void)removeAllDeliveredNotifications
{
  sub_1BC751D0C((char *)self, (uint64_t)a2, (void (*)(os_unfair_lock_s *))sub_1BC751CC8);
}

- (void)getNotificationSettingsWithCompletionHandler:(id)a3
{
  void *v4;
  _TtC14HealthPlatform28MockUNUserNotificationCenter *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1BC7538B0((char *)v5, (void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (id)notificationSettings
{
  void **v3;
  void *v4;
  _TtC14HealthPlatform28MockUNUserNotificationCenter *v5;
  id v6;
  _TtC14HealthPlatform28MockUNUserNotificationCenter *v7;
  id v8;
  objc_super v10;

  v3 = (void **)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC14HealthPlatform28MockUNUserNotificationCenter_customNotificationSettings);
  swift_beginAccess();
  v4 = *v3;
  if (*v3)
  {
    v5 = self;
    v6 = v4;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)type metadata accessor for MockUNUserNotificationCenter();
    v7 = self;
    v6 = -[MockUNUserNotificationCenter notificationSettings](&v10, sel_notificationSettings);
  }
  v8 = v4;

  return v6;
}

- (_TtC14HealthPlatform28MockUNUserNotificationCenter)initWithBundleIdentifier:(id)a3
{
  _TtC14HealthPlatform28MockUNUserNotificationCenter *result;

  result = (_TtC14HealthPlatform28MockUNUserNotificationCenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14HealthPlatform28MockUNUserNotificationCenter_customNotificationSettings));
  swift_release();
}

@end
