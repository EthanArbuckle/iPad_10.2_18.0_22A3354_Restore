@implementation BYExpressSetupDefaultSource

- (BOOL)dataAvailable
{
  return 1;
}

- (id)sourceDeviceClass
{
  return 0;
}

- (id)locationServicesOptIn
{
  return &__kCFBooleanTrue;
}

- (id)appAnalyticsOptIn
{
  return 0;
}

- (id)deviceAnalyticsOptIn
{
  return 0;
}

- (id)siriOptIn
{
  return &__kCFBooleanTrue;
}

- (id)locationServicesSettings
{
  return 0;
}

- (id)siriVoiceProfileAvailabilityMetadata
{
  return 0;
}

- (id)siriDataSharingOptIn
{
  return 0;
}

- (id)siriVoiceTriggerEnabled
{
  return 0;
}

- (id)screenTimeEnabled
{
  return 0;
}

- (id)softwareUpdateAutoUpdateEnabled
{
  return 0;
}

- (id)softwareUpdateAutoDownloadEnabled
{
  return 0;
}

- (int64_t)userInterfaceStyleModeValue
{
  return 0;
}

- (id)watchMigrationData
{
  return 0;
}

- (id)walletProvisioningContext
{
  return 0;
}

- (id)walletMetadata
{
  return 0;
}

- (id)actionButtonData
{
  return 0;
}

@end
