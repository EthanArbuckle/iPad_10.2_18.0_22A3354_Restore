@implementation UARPSupportedAccessoryA3057

- (UARPSupportedAccessoryA3057)init
{
  UARPSupportedAccessoryA3057 *v2;
  void *v3;
  void *v4;
  UARPAccessoryHardwareBluetooth *v5;
  UARPAccessoryHardwareBluetooth *hwID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UARPSupportedAccessoryA3057;
  v2 = -[UARPSupportedAccessoryAirPodsBud init](&v8, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA3057 appleModelNumber](UARPSupportedAccessoryA3057, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("AirPods Pro 2"));
    +[UARPSupportedAccessoryA3057 mobileAssetAppleModelNumber](UARPSupportedAccessoryA3057, "mobileAssetAppleModelNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setMobileAssetAppleModelNumber:](v2, "setMobileAssetAppleModelNumber:", v4);

    v5 = -[UARPAccessoryHardwareBluetooth initWithVendorIDSource:vendorID:productID:productVersion:]([UARPAccessoryHardwareBluetooth alloc], "initWithVendorIDSource:vendorID:productID:productVersion:", 1, +[UARPSupportedAccessoryAirPodsBud vendorID](UARPSupportedAccessoryAirPodsBud, "vendorID"), +[UARPSupportedAccessoryA3057 productID](UARPSupportedAccessoryA3057, "productID"), 1);
    hwID = v2->hwID;
    v2->hwID = v5;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A3057");
}

+ (id)mobileAssetAppleModelNumber
{
  return +[UARPSupportedAccessoryA3056 appleModelNumber](UARPSupportedAccessoryA3056, "appleModelNumber");
}

+ (unsigned)productID
{
  return 8224;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
