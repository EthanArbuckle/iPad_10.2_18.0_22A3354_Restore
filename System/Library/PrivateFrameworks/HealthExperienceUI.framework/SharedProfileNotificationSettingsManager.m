@implementation SharedProfileNotificationSettingsManager

- (_TtC18HealthExperienceUI40SharedProfileNotificationSettingsManager)init
{
  _TtC18HealthExperienceUI40SharedProfileNotificationSettingsManager *result;

  result = (_TtC18HealthExperienceUI40SharedProfileNotificationSettingsManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI40SharedProfileNotificationSettingsManager_healthStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI40SharedProfileNotificationSettingsManager_userDefaults));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI40SharedProfileNotificationSettingsManager_notificationCenter));
  swift_release();
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI40SharedProfileNotificationSettingsManager__currentValues;
  sub_1A961D988(0, &qword_1ED2704A0, (uint64_t (*)(uint64_t))sub_1A99F4A4C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0C96198]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
