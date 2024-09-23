@implementation UARPSupportedAccessoryBeatsUSB

- (UARPSupportedAccessoryBeatsUSB)init
{
  UARPSupportedAccessoryBeatsUSB *v2;
  UARPSupportedAccessoryBeatsUSB *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UARPSupportedAccessoryBeatsUSB;
  v2 = -[UARPSupportedAccessory init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[UARPSupportedAccessory setVendorName:](v2, "setVendorName:", CFSTR("Beats by Dre"));
  return v3;
}

+ (id)appleModelNumber
{
  return CFSTR("Unknown");
}

+ (unsigned)vendorID
{
  return 10507;
}

+ (unsigned)productID
{
  return 0;
}

@end
