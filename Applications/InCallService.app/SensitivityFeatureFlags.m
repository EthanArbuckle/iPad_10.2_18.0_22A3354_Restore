@implementation SensitivityFeatureFlags

+ (BOOL)isSensitivityAvatarTreatmentEnabled
{
  swift_getObjCClassMetadata(a1);
  return sub_1001885B4() & 1;
}

+ (BOOL)isContactNudityDetectionEnabled
{
  return sub_1001885E8() & 1;
}

+ (BOOL)isCommunicationSafetyEnabled
{
  return sub_10018869C() & 1;
}

- (_TtC13InCallService23SensitivityFeatureFlags)init
{
  return (_TtC13InCallService23SensitivityFeatureFlags *)sub_10017E9F8();
}

@end
