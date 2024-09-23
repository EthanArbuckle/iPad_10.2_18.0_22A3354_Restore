@implementation LocalSettingsModel

- (_TtC24MenstrualCyclesAppPlugin18LocalSettingsModel)init
{
  return (_TtC24MenstrualCyclesAppPlugin18LocalSettingsModel *)sub_231ABE17C();
}

- (void)settingsManagerDidUpdateNotificationSettings:(id)a3
{
  id v5;
  _TtC24MenstrualCyclesAppPlugin18LocalSettingsModel *v6;

  swift_getObjectType();
  sub_231ABE370();
  v5 = a3;
  v6 = self;
  sub_231CA02C4();
  sub_231CA033C();

  swift_release();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin18LocalSettingsModel_settingsManager));
}

@end
