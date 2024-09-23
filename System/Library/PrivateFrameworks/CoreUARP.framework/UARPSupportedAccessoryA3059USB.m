@implementation UARPSupportedAccessoryA3059USB

- (UARPSupportedAccessoryA3059USB)init
{
  UARPSupportedAccessoryA3059USB *v2;
  void *v3;
  void *v4;
  UARPAccessoryHardwareUSB *v5;
  UARPAccessoryHardwareUSB *hwID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UARPSupportedAccessoryA3059USB;
  v2 = -[UARPSupportedAccessoryAirPodsCaseUSB init](&v8, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA3059USB appleModelNumber](UARPSupportedAccessoryA3059USB, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("AirPods Pro 2 Case"));
    +[UARPSupportedAccessoryAirPodsBud mobileAssetAppleModelNumber](UARPSupportedAccessoryA3056, "mobileAssetAppleModelNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setMobileAssetAppleModelNumber:](v2, "setMobileAssetAppleModelNumber:", v4);

    v5 = -[UARPAccessoryHardwareUSB initWithVendorID:productID:]([UARPAccessoryHardwareUSB alloc], "initWithVendorID:productID:", +[UARPSupportedAccessoryAirPodsCaseUSB vendorID](UARPSupportedAccessoryAirPodsCaseUSB, "vendorID"), +[UARPSupportedAccessoryA3059USB productID](UARPSupportedAccessoryA3059USB, "productID"));
    hwID = v2->hwID;
    v2->hwID = v5;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return +[UARPSupportedAccessoryA3059 appleModelNumber](UARPSupportedAccessoryA3059, "appleModelNumber");
}

+ (unsigned)productID
{
  return 5024;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
