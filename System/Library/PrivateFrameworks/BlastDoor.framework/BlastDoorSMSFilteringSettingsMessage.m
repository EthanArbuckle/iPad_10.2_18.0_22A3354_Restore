@implementation BlastDoorSMSFilteringSettingsMessage

- (NSString)description
{
  return (NSString *)sub_1AD4D3024();
}

- (NSString)filterExtensionName
{
  return (NSString *)sub_1AD4D4828((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorSMSFilteringSettingsMessage_sMSFilteringSettingsMessage);
}

- (unint64_t)smsFilterCapabilitiesOptions
{
  return *(_QWORD *)&self->sMSFilteringSettingsMessage[OBJC_IVAR___BlastDoorSMSFilteringSettingsMessage_sMSFilteringSettingsMessage
                                                     + 8];
}

- (BlastDoorSMSFilteringSettingsMessage)init
{
  BlastDoorSMSFilteringSettingsMessage *result;

  result = (BlastDoorSMSFilteringSettingsMessage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
