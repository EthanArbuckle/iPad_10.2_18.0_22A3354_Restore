@implementation UARPSupportedAccessoryAirPodsCaseUSB

- (UARPSupportedAccessoryAirPodsCaseUSB)init
{
  UARPSupportedAccessoryAirPodsCaseUSB *v2;
  UARPSupportedAccessoryAirPodsCaseUSB *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UARPSupportedAccessoryAirPodsCaseUSB;
  v2 = -[UARPSupportedAccessory init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UARPSupportedAccessory setVendorName:](v2, "setVendorName:", CFSTR("Apple Inc."));
    -[UARPSupportedAccessory setSupportsLogs:](v3, "setSupportsLogs:", 1);
    -[UARPSupportedAccessory setSupportsAnalytics:](v3, "setSupportsAnalytics:", 1);
    -[UARPSupportedAccessory setSupportsInternalSettings:](v3, "setSupportsInternalSettings:", 1);
    -[UARPSupportedAccessory setSupportsDeveloperSettings:](v3, "setSupportsDeveloperSettings:", 1);
    -[UARPSupportedAccessory setAllowDownloadOnCellular:](v3, "setAllowDownloadOnCellular:", 1);
    -[UARPSupportedAccessory setTtrSolicitLogs:](v3, "setTtrSolicitLogs:", 1);
  }
  return v3;
}

+ (id)appleModelNumber
{
  return CFSTR("Unknown");
}

+ (unsigned)vendorID
{
  return 1452;
}

+ (unsigned)productID
{
  return 0;
}

@end
