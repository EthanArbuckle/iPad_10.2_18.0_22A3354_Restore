@implementation UARPSupportedAccessoryAirPodsCase

- (UARPSupportedAccessoryAirPodsCase)init
{
  UARPSupportedAccessoryAirPodsCase *v2;
  UARPSupportedAccessoryAirPodsCase *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UARPSupportedAccessoryAirPodsCase;
  v2 = -[UARPSupportedAccessory init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UARPSupportedAccessory setVendorName:](v2, "setVendorName:", CFSTR("Apple Inc."));
    -[UARPSupportedAccessory setSupportsInternalSettings:](v3, "setSupportsInternalSettings:", 1);
    -[UARPSupportedAccessory setSupportsDeveloperSettings:](v3, "setSupportsDeveloperSettings:", 1);
    -[UARPSupportedAccessory setAllowDownloadOnCellular:](v3, "setAllowDownloadOnCellular:", 1);
    -[UARPSupportedAccessory setUpdaterName:](v3, "setUpdaterName:", CFSTR("BTLEServer"));
    -[UARPSupportedAccessory setTtrSolicitLogs:](v3, "setTtrSolicitLogs:", 1);
    -[UARPSupportedAccessory addSysdiagnoseApprovedMetric:](v3, "addSysdiagnoseApprovedMetric:", CFSTR("com.apple.Bluetooth.AccessoryCase.pif_daily"));
  }
  return v3;
}

+ (id)appleModelNumber
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
