@implementation UARPSupportedAccessoryA2514

- (UARPSupportedAccessoryA2514)init
{
  UARPSupportedAccessoryA2514 *v2;
  void *v3;
  UARPAccessoryHardwareB2PHID *v4;
  UARPAccessoryHardwareB2PHID *hwID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2514;
  v2 = -[UARPSupportedAccessoryBeatsUSB init](&v7, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA2514 appleModelNumber](UARPSupportedAccessoryA2514, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("Studio Case"));
    v4 = -[UARPAccessoryHardwareB2PHID initWithVendorID:productID:]([UARPAccessoryHardwareB2PHID alloc], "initWithVendorID:productID:", +[UARPSupportedAccessoryBeatsUSB vendorID](UARPSupportedAccessoryBeatsUSB, "vendorID"), +[UARPSupportedAccessoryA2514 productID](UARPSupportedAccessoryA2514, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A2514");
}

+ (unsigned)productID
{
  return 16400;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
