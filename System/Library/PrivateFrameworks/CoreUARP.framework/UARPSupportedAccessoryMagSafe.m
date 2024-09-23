@implementation UARPSupportedAccessoryMagSafe

- (UARPSupportedAccessoryMagSafe)init
{
  UARPSupportedAccessoryMagSafe *v2;
  UARPSupportedAccessoryMagSafe *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UARPSupportedAccessoryMagSafe;
  v2 = -[UARPSupportedAccessoryHID init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UARPSupportedAccessory setSupportsPowerLogging:](v2, "setSupportsPowerLogging:", 1);
    -[UARPSupportedAccessory setSupportsInternalSettings:](v3, "setSupportsInternalSettings:", 1);
    -[UARPSupportedAccessory setCapabilities:](v3, "setCapabilities:", 1);
    -[UARPSupportedAccessory setPostStagingNotifications:](v3, "setPostStagingNotifications:", 1);
  }
  return v3;
}

@end
