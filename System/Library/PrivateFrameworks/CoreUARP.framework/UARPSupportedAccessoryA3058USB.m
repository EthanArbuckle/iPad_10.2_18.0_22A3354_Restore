@implementation UARPSupportedAccessoryA3058USB

- (UARPSupportedAccessoryA3058USB)init
{
  UARPSupportedAccessoryA3058USB *v2;
  void *v3;
  void *v4;
  UARPAccessoryHardwareUSB *v5;
  UARPAccessoryHardwareUSB *hwID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UARPSupportedAccessoryA3058USB;
  v2 = -[UARPSupportedAccessoryAirPodsCaseUSB init](&v8, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA3058USB appleModelNumber](UARPSupportedAccessoryA3058USB, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("AirPods Pro 2 Case"));
    +[UARPSupportedAccessoryAirPodsBud mobileAssetAppleModelNumber](UARPSupportedAccessoryA3053, "mobileAssetAppleModelNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setMobileAssetAppleModelNumber:](v2, "setMobileAssetAppleModelNumber:", v4);

    v5 = -[UARPAccessoryHardwareUSB initWithVendorID:productID:]([UARPAccessoryHardwareUSB alloc], "initWithVendorID:productID:", +[UARPSupportedAccessoryAirPodsCaseUSB vendorID](UARPSupportedAccessoryAirPodsCaseUSB, "vendorID"), +[UARPSupportedAccessoryA3058USB productID](UARPSupportedAccessoryA3058USB, "productID"));
    hwID = v2->hwID;
    v2->hwID = v5;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A3058");
}

+ (unsigned)productID
{
  return 5023;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
