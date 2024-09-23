@implementation BlastDoorSMSMessage_SMSFilteringSettings

- (NSString)description
{
  return (NSString *)sub_1AD4D3024();
}

- (NSString)filterExtensionName
{
  return (NSString *)sub_1AD4D4828((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSMessage_SMSFilteringSettings_sMSMessage_SMSFilteringSettings);
}

- (unint64_t)smsFilterCapabilitiesOptions
{
  return *(_QWORD *)&self->sMSMessage_SMSFilteringSettings[OBJC_IVAR___BlastDoorSMSMessage_SMSFilteringSettings_sMSMessage_SMSFilteringSettings
                                                         + 8];
}

- (BlastDoorSMSMessage_SMSFilteringSettings)init
{
  BlastDoorSMSMessage_SMSFilteringSettings *result;

  result = (BlastDoorSMSMessage_SMSFilteringSettings *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
