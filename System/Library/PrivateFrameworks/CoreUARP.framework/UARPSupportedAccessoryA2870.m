@implementation UARPSupportedAccessoryA2870

- (UARPSupportedAccessoryA2870)init
{
  UARPSupportedAccessoryA2870 *v2;
  void *v3;
  UARPAccessoryHardwareB2PHID *v4;
  UARPAccessoryHardwareB2PHID *hwID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2870;
  v2 = -[UARPSupportedAccessoryBeatsUSB init](&v7, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA2870 appleModelNumber](UARPSupportedAccessoryA2870, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("Studio Case"));
    v4 = -[UARPAccessoryHardwareB2PHID initWithVendorID:productID:]([UARPAccessoryHardwareB2PHID alloc], "initWithVendorID:productID:", +[UARPSupportedAccessoryBeatsUSB vendorID](UARPSupportedAccessoryBeatsUSB, "vendorID"), +[UARPSupportedAccessoryA2870 productID](UARPSupportedAccessoryA2870, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A2870");
}

+ (unsigned)productID
{
  return 16432;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
