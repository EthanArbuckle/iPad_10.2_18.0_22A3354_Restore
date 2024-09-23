@implementation UARPSupportedAccessoryA2384

- (UARPSupportedAccessoryA2384)init
{
  UARPSupportedAccessoryA2384 *v2;
  void *v3;
  UARPAccessoryHardwareHID *v4;
  UARPAccessoryHardwareHID *hwID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2384;
  v2 = -[UARPSupportedAccessoryMagSafe init](&v7, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA2384 appleModelNumber](UARPSupportedAccessoryA2384, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("MagSafe Battery Pack"));
    v4 = -[UARPAccessoryHardwareHID initWithVendorID:productID:]([UARPAccessoryHardwareHID alloc], "initWithVendorID:productID:", +[UARPSupportedAccessoryHID vendorID](UARPSupportedAccessoryHID, "vendorID"), +[UARPSupportedAccessoryA2384 productID](UARPSupportedAccessoryA2384, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A2384");
}

+ (unsigned)productID
{
  return 5017;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
