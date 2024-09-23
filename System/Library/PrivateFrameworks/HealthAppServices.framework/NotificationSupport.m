@implementation NotificationSupport

+ (UNNotificationSound)defaultHealthAppNotificationSound
{
  if (qword_1F00AE3F8 != -1)
    swift_once();
  return (UNNotificationSound *)(id)qword_1F00AE6A0;
}

+ (id)createNotificationUserInfoFor:(int64_t)a3 with:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  sub_1D713FBE8();
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_1D714622C();
    v9 = sub_1D7146274();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    v10 = sub_1D7146274();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  _s17HealthAppServices19NotificationSupportC06createD8UserInfo3for4withSDys11AnyHashableVypGSo20HKNotificationDomainV_10Foundation3URLVSgtFZ_0(a3, (uint64_t)v8);
  sub_1D713BBC4((uint64_t)v8, (uint64_t (*)(_QWORD))sub_1D713FBE8);
  v11 = (void *)sub_1D71462EC();
  swift_bridgeObjectRelease();
  return v11;
}

- (_TtC17HealthAppServices19NotificationSupport)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NotificationSupport();
  return -[NotificationSupport init](&v3, sel_init);
}

@end
