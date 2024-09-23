@implementation UARPSupportedAccessoryUSBPDPowerAdapter

- (UARPSupportedAccessoryUSBPDPowerAdapter)init
{
  UARPSupportedAccessoryUSBPDPowerAdapter *v2;
  UARPSupportedAccessoryUSBPDPowerAdapter *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UARPSupportedAccessoryUSBPDPowerAdapter;
  v2 = -[UARPSupportedAccessoryUSBPD init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UARPSupportedAccessory addServiceBSDNotificationName:](v2, "addServiceBSDNotificationName:", CFSTR("com.apple.system.powermanagement.poweradapter"));
    -[UARPSupportedAccessory setCapabilities:](v3, "setCapabilities:", 1);
  }
  return v3;
}

+ (int64_t)deviceClass
{
  return 1;
}

@end
