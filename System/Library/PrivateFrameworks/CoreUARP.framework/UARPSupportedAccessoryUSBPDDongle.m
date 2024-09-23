@implementation UARPSupportedAccessoryUSBPDDongle

- (UARPSupportedAccessoryUSBPDDongle)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPSupportedAccessoryUSBPDDongle;
  return -[UARPSupportedAccessoryUSBPD init](&v3, sel_init);
}

+ (int64_t)deviceClass
{
  return 2;
}

@end
