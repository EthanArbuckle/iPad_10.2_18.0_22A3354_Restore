@implementation UARPSupportedAccessoryHID

- (UARPSupportedAccessoryHID)init
{
  UARPSupportedAccessoryHID *v2;
  UARPSupportedAccessoryHID *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UARPSupportedAccessoryHID;
  v2 = -[UARPSupportedAccessory init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UARPSupportedAccessory setVendorName:](v2, "setVendorName:", CFSTR("Apple Inc."));
    -[UARPSupportedAccessory setUpdaterName:](v3, "setUpdaterName:", CFSTR("com.apple.UARPUpdaterServiceHID"));
    -[UARPSupportedAccessory setSupportsInternalSettings:](v3, "setSupportsInternalSettings:", 1);
    -[UARPSupportedAccessory setUploaderResponseTimeout:](v3, "setUploaderResponseTimeout:", 10000);
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
