@implementation UARPSupportedAccessoryUSBPD

- (UARPSupportedAccessoryUSBPD)init
{
  UARPSupportedAccessoryUSBPD *v2;
  UARPSupportedAccessoryUSBPD *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UARPSupportedAccessoryUSBPD;
  v2 = -[UARPSupportedAccessory init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UARPSupportedAccessory setVendorName:](v2, "setVendorName:", CFSTR("Apple Inc."));
    -[UARPSupportedAccessory setUpdaterName:](v3, "setUpdaterName:", CFSTR("com.apple.UARPUpdaterServiceUSBPD"));
    -[UARPSupportedAccessory setSupportsInternalSettings:](v3, "setSupportsInternalSettings:", 1);
    -[UARPSupportedAccessory setSupportsAccMode7:](v3, "setSupportsAccMode7:", 1);
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

+ (int64_t)deviceClass
{
  return 3;
}

+ (int64_t)locationType
{
  return 0;
}

@end
