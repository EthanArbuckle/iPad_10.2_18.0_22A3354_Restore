@implementation NotificationSettingsModel

- (_TtC14MentalHealthUI25NotificationSettingsModel)init
{
  objc_class *ObjectType;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  char *v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE65DF0]), sel_init);
  sub_2418A9DE0();
  v4 = objc_allocWithZone(MEMORY[0x24BDF88B8]);
  v5 = (void *)sub_2418A9DB0();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_initWithBundleIdentifier_, v5);

  v7 = objc_allocWithZone(ObjectType);
  v8 = NotificationSettingsModel.init(settingsManager:userNotificationCenter:)(v3, v6);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC14MentalHealthUI25NotificationSettingsModel *)v8;
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC14MentalHealthUI25NotificationSettingsModel *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_defaultCenter);
  objc_msgSend(v6, sel_removeObserver_, v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[NotificationSettingsModel dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MentalHealthUI25NotificationSettingsModel_settingsManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14MentalHealthUI25NotificationSettingsModel_userNotificationCenter));
  v3 = (char *)self + OBJC_IVAR____TtC14MentalHealthUI25NotificationSettingsModel__areNotificationsDisabled;
  sub_24172887C(0, &qword_2543914E8, MEMORY[0x24BEE1328], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BDB9EF0]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)updateNotificationAuthorizationStatus
{
  void *v2;
  _TtC14MentalHealthUI25NotificationSettingsModel *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC14MentalHealthUI25NotificationSettingsModel_userNotificationCenter);
  v3 = self;
  v4 = objc_msgSend(v2, sel_notificationSettings);
  objc_msgSend(v4, sel_authorizationStatus);

  swift_getKeyPath();
  swift_getKeyPath();
  sub_2418A8424();
}

- (void)settingsManagerDidUpdateNotificationSettings:(id)a3
{
  id v5;
  _TtC14MentalHealthUI25NotificationSettingsModel *v6;

  swift_getObjectType();
  sub_24176092C();
  v5 = a3;
  v6 = self;
  sub_2418A83B8();
  sub_2418A83D0();

  swift_release();
}

@end
