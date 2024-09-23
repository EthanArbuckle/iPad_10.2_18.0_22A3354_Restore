@implementation UARPSupportedAccessoryAirPodsBud

- (UARPSupportedAccessoryAirPodsBud)init
{
  UARPSupportedAccessoryAirPodsBud *v2;
  UARPSupportedAccessoryAirPodsBud *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UARPSupportedAccessoryAirPodsBud;
  v2 = -[UARPSupportedAccessory init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UARPSupportedAccessory setVendorName:](v2, "setVendorName:", CFSTR("Apple Inc."));
    -[UARPSupportedAccessory setSupportsHeySiriCompact:](v3, "setSupportsHeySiriCompact:", 1);
    -[UARPSupportedAccessory setReofferFirmwareOnSync:](v3, "setReofferFirmwareOnSync:", 1);
    -[UARPSupportedAccessory setSupportsFriendlyName:](v3, "setSupportsFriendlyName:", 1);
    -[UARPSupportedAccessory setSupportsInternalSettings:](v3, "setSupportsInternalSettings:", 1);
    -[UARPSupportedAccessory setSupportsDeveloperSettings:](v3, "setSupportsDeveloperSettings:", 1);
    -[UARPSupportedAccessory setSupportsVersions:](v3, "setSupportsVersions:", 1);
    -[UARPSupportedAccessory setAllowDownloadOnCellular:](v3, "setAllowDownloadOnCellular:", 1);
    -[UARPSupportedAccessory setUpdaterName:](v3, "setUpdaterName:", CFSTR("BTLEServer"));
    -[UARPSupportedAccessory addBSDNotificationName:](v3, "addBSDNotificationName:", CFSTR("com.apple.corespeech.voicetriggerassetchange"));
  }
  return v3;
}

+ (id)appleModelNumber
{
  return CFSTR("Unknown");
}

+ (id)mobileAssetAppleModelNumber
{
  return CFSTR("Unknown");
}

+ (unsigned)vendorID
{
  return 76;
}

+ (unsigned)productID
{
  return 0;
}

@end
