@implementation MCEDUModeUtilities

+ (id)configureToSharedDevice
{
  return (id)objc_msgSend(MEMORY[0x1E0D1C1E8], "configureToSharedDeviceWithPreferenceDomain:", *MEMORY[0x1E0D448D8]);
}

@end
