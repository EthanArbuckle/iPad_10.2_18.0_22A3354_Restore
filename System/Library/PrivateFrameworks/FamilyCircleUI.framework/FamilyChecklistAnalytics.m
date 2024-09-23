@implementation FamilyChecklistAnalytics

+ (_TtC14FamilyCircleUI24FamilyChecklistAnalytics)shared
{
  if (qword_2549F60A0 != -1)
    swift_once();
  return (_TtC14FamilyCircleUI24FamilyChecklistAnalytics *)(id)qword_254A03DC0;
}

- (void)sendChildSettingsAnalyticsEvent
{
  sub_20E0533D0(self, (uint64_t)a2, 20);
}

- (void)sendCommLimitsAnalyticsEvent
{
  sub_20E0533D0(self, (uint64_t)a2, 21);
}

- (void)sendLocationSharingAnalyticsEvent
{
  sub_20E0533D0(self, (uint64_t)a2, 22);
}

- (void)sendIcloudPlusSharingAnalyticsEvent
{
  sub_20E0533D0(self, (uint64_t)a2, 23);
}

- (void)sendRecoveryContactsAnalyticsEvent
{
  sub_20E0533D0(self, (uint64_t)a2, 24);
}

- (void)sendEmergencyContactsAnalyticsEvent
{
  sub_20E0533D0(self, (uint64_t)a2, 25);
}

- (void)sendChecklistChildSettingsToggleAnalyticsEvent
{
  sub_20E0533D0(self, (uint64_t)a2, 27);
}

- (void)sendChecklistCommLimitsToggleAnalyticsEvent
{
  sub_20E0533D0(self, (uint64_t)a2, 28);
}

- (void)sendChecklistLocationSharingToggleAnalyticsEvent
{
  sub_20E0533D0(self, (uint64_t)a2, 29);
}

- (void)sendChecklistIcloudPlusToggleAnalyticsEvent
{
  sub_20E0533D0(self, (uint64_t)a2, 30);
}

- (void)sendRecoveryContactsToggleAnalyticsEvent
{
  sub_20E0533D0(self, (uint64_t)a2, 31);
}

- (void)sendEmergencyContactsToggleAnalyticsEvent
{
  sub_20E0533D0(self, (uint64_t)a2, 32);
}

- (void)sendTotalChecklistViewsAnalyticsEvent
{
  sub_20E0533D0(self, (uint64_t)a2, 33);
}

- (void)sendEmergencyContactsOnOffToggleEvent
{
  sub_20E0533D0(self, (uint64_t)a2, 34);
}

- (void)sendCommLimitsOnOffToggleEvent
{
  sub_20E0533D0(self, (uint64_t)a2, 35);
}

- (void)sendChildSettingsOnOffToggleEvent
{
  sub_20E0533D0(self, (uint64_t)a2, 36);
}

- (void)sendLocationSharingOnOffToggleEvent
{
  sub_20E0533D0(self, (uint64_t)a2, 37);
}

- (void)sendicloudPlusOnOffToggleEvent
{
  sub_20E0533D0(self, (uint64_t)a2, 38);
}

- (void)sendRecoveryContactsOnOffToggleEvent
{
  sub_20E0533D0(self, (uint64_t)a2, 39);
}

- (_TtC14FamilyCircleUI24FamilyChecklistAnalytics)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FamilyChecklistAnalytics();
  return -[FamilyChecklistAnalytics init](&v3, sel_init);
}

@end
