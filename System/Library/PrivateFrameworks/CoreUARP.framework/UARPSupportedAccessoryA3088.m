@implementation UARPSupportedAccessoryA3088

- (UARPSupportedAccessoryA3088)init
{
  UARPSupportedAccessoryA3088 *v2;
  void *v3;
  UARPAccessoryHardwareHID *v4;
  UARPAccessoryHardwareHID *hwID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA3088;
  v2 = -[UARPSupportedAccessoryMagSafe init](&v7, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA3088 appleModelNumber](UARPSupportedAccessoryA3088, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("MagSafe Charger (MFi Module)"));
    v4 = -[UARPAccessoryHardwareHID initWithVendorID:productID:]([UARPAccessoryHardwareHID alloc], "initWithVendorID:productID:", +[UARPSupportedAccessoryHID vendorID](UARPSupportedAccessoryHID, "vendorID"), +[UARPSupportedAccessoryA3088 productID](UARPSupportedAccessoryA3088, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A3088");
}

+ (unsigned)productID
{
  return 1288;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
