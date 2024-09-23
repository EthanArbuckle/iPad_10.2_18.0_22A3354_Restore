@implementation ProfilesAppDelegate

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC8Profiles19ProfilesAppDelegate *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_231DB918C((uint64_t (*)(_QWORD))sub_231DBA280, v9);

  swift_release();
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC8Profiles19ProfilesAppDelegate *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_231DB96AC(v11, (uint64_t (*)(uint64_t))sub_231DB9180, v9);

  swift_release();
}

- (_TtC8Profiles19ProfilesAppDelegate)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Profiles19ProfilesAppDelegate_healthStore) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Profiles19ProfilesAppDelegate_summarySharingEntryStore) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Profiles19ProfilesAppDelegate_healthSharingNotificationSyncStore) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Profiles19ProfilesAppDelegate_cancellables) = (Class)MEMORY[0x24BEE4B08];
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ProfilesAppDelegate();
  return -[ProfilesAppDelegate init](&v3, sel_init);
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Profiles19ProfilesAppDelegate_healthSharingNotificationSyncStore));
  swift_bridgeObjectRelease();
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  uint64_t v5;
  id v8;
  _TtC8Profiles19ProfilesAppDelegate *v9;
  char v10;

  v5 = (uint64_t)a5;
  if (!a4)
  {
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  sub_231E0EF4C();
  if (v5)
LABEL_3:
    v5 = sub_231E0EEBC();
LABEL_4:
  v8 = a3;
  v9 = self;
  v10 = sub_231DF3E64((uint64_t)a3, v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

@end
