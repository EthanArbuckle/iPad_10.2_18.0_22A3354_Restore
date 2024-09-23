@implementation UARPSupportedAccessoryUSB

- (UARPSupportedAccessoryUSB)init
{
  UARPSupportedAccessoryUSB *v2;
  UARPSupportedAccessoryUSB *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UARPSupportedAccessoryUSB;
  v2 = -[UARPSupportedAccessory init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UARPSupportedAccessory setVendorName:](v2, "setVendorName:", CFSTR("Apple Inc."));
    -[UARPSupportedAccessory setSupportsInternalSettings:](v3, "setSupportsInternalSettings:", 1);
    -[UARPSupportedAccessory setUpdateRequiresPowerAssertion:](v3, "setUpdateRequiresPowerAssertion:", 1);
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
