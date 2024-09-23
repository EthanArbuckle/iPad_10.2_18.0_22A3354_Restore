@implementation UARPSupportedAccessoryA3140

- (UARPSupportedAccessoryA3140)init
{
  UARPSupportedAccessoryA3140 *v2;
  void *v3;
  UARPAccessoryHardwareBluetooth *v4;
  UARPAccessoryHardwareBluetooth *hwID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA3140;
  v2 = -[UARPSupportedAccessoryBeatsBluetooth init](&v7, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA3140 appleModelNumber](UARPSupportedAccessoryA3140, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("Headset"));
    v4 = -[UARPAccessoryHardwareBluetooth initWithVendorIDSource:vendorID:productID:productVersion:]([UARPAccessoryHardwareBluetooth alloc], "initWithVendorIDSource:vendorID:productID:productVersion:", 1, +[UARPSupportedAccessoryBeatsBluetooth vendorID](UARPSupportedAccessoryBeatsBluetooth, "vendorID"), +[UARPSupportedAccessoryA3140 productID](UARPSupportedAccessoryA3140, "productID"), 1);
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A3140");
}

+ (unsigned)productID
{
  return 8229;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
