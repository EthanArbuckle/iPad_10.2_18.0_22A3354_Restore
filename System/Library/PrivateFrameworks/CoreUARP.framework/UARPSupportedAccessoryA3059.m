@implementation UARPSupportedAccessoryA3059

- (UARPSupportedAccessoryA3059)init
{
  UARPSupportedAccessoryA3059 *v2;
  void *v3;
  void *v4;
  UARPAccessoryHardwareBluetooth *v5;
  UARPAccessoryHardwareBluetooth *hwID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UARPSupportedAccessoryA3059;
  v2 = -[UARPSupportedAccessoryAirPodsCase init](&v8, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA3059 appleModelNumber](UARPSupportedAccessoryA3059, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("AirPods Pro 2 Case"));
    +[UARPSupportedAccessoryAirPodsBud mobileAssetAppleModelNumber](UARPSupportedAccessoryA3056, "mobileAssetAppleModelNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setMobileAssetAppleModelNumber:](v2, "setMobileAssetAppleModelNumber:", v4);

    v5 = -[UARPAccessoryHardwareBluetooth initWithVendorIDSource:vendorID:productID:productVersion:]([UARPAccessoryHardwareBluetooth alloc], "initWithVendorIDSource:vendorID:productID:productVersion:", 1, +[UARPSupportedAccessoryAirPodsCase vendorID](UARPSupportedAccessoryAirPodsCase, "vendorID"), +[UARPSupportedAccessoryA3059 productID](UARPSupportedAccessoryA3059, "productID"), 1);
    hwID = v2->hwID;
    v2->hwID = v5;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A3059");
}

+ (unsigned)productID
{
  return 8220;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
