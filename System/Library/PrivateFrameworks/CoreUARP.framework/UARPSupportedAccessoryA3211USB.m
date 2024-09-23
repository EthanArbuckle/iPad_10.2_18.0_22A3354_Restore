@implementation UARPSupportedAccessoryA3211USB

- (UARPSupportedAccessoryA3211USB)init
{
  UARPSupportedAccessoryA3211USB *v2;
  void *v3;
  UARPAccessoryHardwareB2PHID *v4;
  UARPAccessoryHardwareB2PHID *hwID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA3211USB;
  v2 = -[UARPSupportedAccessoryBeatsUSB init](&v7, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA3211USB appleModelNumber](UARPSupportedAccessoryA3211USB, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("Speaker"));
    v4 = -[UARPAccessoryHardwareB2PHID initWithVendorID:productID:]([UARPAccessoryHardwareB2PHID alloc], "initWithVendorID:productID:", +[UARPSupportedAccessoryBeatsUSB vendorID](UARPSupportedAccessoryBeatsUSB, "vendorID"), +[UARPSupportedAccessoryA3211USB productID](UARPSupportedAccessoryA3211USB, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return +[UARPSupportedAccessoryA3211 appleModelNumber](UARPSupportedAccessoryA3211, "appleModelNumber");
}

+ (unsigned)productID
{
  return 9984;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
