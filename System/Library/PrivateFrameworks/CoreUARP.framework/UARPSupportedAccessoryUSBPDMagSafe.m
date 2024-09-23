@implementation UARPSupportedAccessoryUSBPDMagSafe

- (UARPSupportedAccessoryUSBPDMagSafe)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPSupportedAccessoryUSBPDMagSafe;
  return -[UARPSupportedAccessoryUSBPD init](&v3, sel_init);
}

+ (int64_t)deviceClass
{
  return 0;
}

+ (int64_t)locationType
{
  return 1;
}

@end
