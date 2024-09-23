@implementation UARPSupportedAccessoryA3211

- (UARPSupportedAccessoryA3211)init
{
  UARPSupportedAccessoryA3211 *v2;
  void *v3;
  UARPAccessoryHardwareBluetooth *v4;
  UARPAccessoryHardwareBluetooth *hwID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA3211;
  v2 = -[UARPSupportedAccessoryBeatsBluetooth init](&v7, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA3211 appleModelNumber](UARPSupportedAccessoryA3211, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("Speaker"));
    -[UARPSupportedAccessory setSupportsHeySiriCompact:](v2, "setSupportsHeySiriCompact:", 0);
    v4 = -[UARPAccessoryHardwareBluetooth initWithVendorIDSource:vendorID:productID:productVersion:]([UARPAccessoryHardwareBluetooth alloc], "initWithVendorIDSource:vendorID:productID:productVersion:", 1, +[UARPSupportedAccessoryBeatsBluetooth vendorID](UARPSupportedAccessoryBeatsBluetooth, "vendorID"), +[UARPSupportedAccessoryA3211 productID](UARPSupportedAccessoryA3211, "productID"), 1);
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A3211");
}

+ (unsigned)productID
{
  return 8218;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
