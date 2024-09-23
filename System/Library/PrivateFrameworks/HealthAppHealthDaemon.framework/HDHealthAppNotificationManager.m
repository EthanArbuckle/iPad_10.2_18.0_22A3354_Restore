@implementation HDHealthAppNotificationManager

- (_TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager)initWithProfile:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager *v9;

  sub_23DB8C310();
  v5 = objc_allocWithZone(MEMORY[0x24BDF88B8]);
  v6 = a3;
  v7 = (void *)sub_23DB8C2F8();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v5, sel_initWithBundleIdentifier_, v7);

  v9 = -[HDHealthAppNotificationManager initWithProfile:userNotificationCenter:](self, sel_initWithProfile_userNotificationCenter_, v6, v8);
  return v9;
}

- (_TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager)initWithProfile:(id)a3 userNotificationCenter:(id)a4
{
  id v7;
  id v8;
  objc_class *v9;
  _TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager *v10;
  objc_class *v11;
  objc_class *v12;
  _TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager *v13;
  objc_super v15;

  v7 = objc_allocWithZone(MEMORY[0x24BE40C60]);
  v8 = a3;
  v9 = (objc_class *)a4;
  v10 = self;
  v11 = (objc_class *)objc_msgSend(v7, sel_initWithProfile_, v8);
  *(Class *)((char *)&v10->super.isa
           + OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_summarySharingEntryManager) = v11;
  *(Class *)((char *)&v10->super.isa
           + OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_userNotificationCenter) = v9;
  v12 = v9;

  v15.receiver = v10;
  v15.super_class = (Class)type metadata accessor for HDHealthAppNotificationManager();
  v13 = -[HDHealthAppNotificationManager init](&v15, sel_init);

  return v13;
}

- (id)createSharingReminderNotificationAndReturnError:(id *)a3
{
  _TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager *v3;
  void *v4;

  v3 = self;
  v4 = (void *)sub_23DB7DB60();

  return v4;
}

- (void)removeNotificationWithIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager *v7;

  v4 = sub_23DB8C310();
  v6 = v5;
  v7 = self;
  sub_23DB7DDA0(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)removeNotificationsWithIdentifiers:(id)a3
{
  _TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager *v4;

  sub_23DB8C370();
  v4 = self;
  sub_23DB7DEF8();

  swift_bridgeObjectRelease();
}

- (_TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager)init
{
  _TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager *result;

  result = (_TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_summarySharingEntryManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21HealthAppHealthDaemon30HDHealthAppNotificationManager_userNotificationCenter));
}

@end
