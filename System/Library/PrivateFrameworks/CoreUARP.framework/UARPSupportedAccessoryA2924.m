@implementation UARPSupportedAccessoryA2924

- (UARPSupportedAccessoryA2924)init
{
  UARPSupportedAccessoryA2924 *v2;
  void *v3;
  UARPAccessoryHardwareBluetooth *v4;
  UARPAccessoryHardwareBluetooth *hwID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2924;
  v2 = -[UARPSupportedAccessoryBeatsBluetooth init](&v7, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA2924 appleModelNumber](UARPSupportedAccessoryA2924, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("Headset"));
    v4 = -[UARPAccessoryHardwareBluetooth initWithVendorIDSource:vendorID:productID:productVersion:]([UARPAccessoryHardwareBluetooth alloc], "initWithVendorIDSource:vendorID:productID:productVersion:", 1, +[UARPSupportedAccessoryBeatsBluetooth vendorID](UARPSupportedAccessoryBeatsBluetooth, "vendorID"), +[UARPSupportedAccessoryA2924 productID](UARPSupportedAccessoryA2924, "productID"), 1);
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A2924");
}

+ (unsigned)productID
{
  return 8215;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
