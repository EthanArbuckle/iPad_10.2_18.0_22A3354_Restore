@implementation TSNotificationSettings

- (int64_t)authorizationStatus
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___TSNotificationSettings_authorizationStatus);
}

- (BOOL)sound
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___TSNotificationSettings_sound);
}

- (BOOL)badge
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___TSNotificationSettings_badge);
}

- (BOOL)showOnLockScreen
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___TSNotificationSettings_showOnLockScreen);
}

- (BOOL)showInNotificationCenter
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___TSNotificationSettings_showInNotificationCenter);
}

- (BOOL)showBanners
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___TSNotificationSettings_showBanners);
}

- (int)scheduledDeliverySetting
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR___TSNotificationSettings_scheduledDeliverySetting);
}

- (TSNotificationSettings)initWithSystemSettings:(id)a3
{
  id v3;
  TSNotificationSettings *v4;

  v3 = a3;
  v4 = (TSNotificationSettings *)sub_1D6B06B98(v3);

  return v4;
}

- (TSNotificationSettings)init
{
  TSNotificationSettings *result;

  result = (TSNotificationSettings *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
