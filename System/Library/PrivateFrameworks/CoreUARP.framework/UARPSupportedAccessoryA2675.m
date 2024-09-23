@implementation UARPSupportedAccessoryA2675

- (UARPSupportedAccessoryA2675)init
{
  UARPSupportedAccessoryA2675 *v2;
  void *v3;
  void *v4;
  UARPAccessoryHardwareHID *v5;
  UARPAccessoryHardwareHID *hwID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UARPSupportedAccessoryA2675;
  v2 = -[UARPSupportedAccessoryWatchPuck init](&v8, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA2675 appleModelNumber](UARPSupportedAccessoryA2675, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("Watch Puck Charger (MFi Module)"));
    +[UARPSupportedAccessoryA2755 appleModelNumber](UARPSupportedAccessoryA2755, "appleModelNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setMobileAssetAppleModelNumber:](v2, "setMobileAssetAppleModelNumber:", v4);

    v5 = -[UARPAccessoryHardwareHID initWithVendorID:productID:]([UARPAccessoryHardwareHID alloc], "initWithVendorID:productID:", +[UARPSupportedAccessoryHID vendorID](UARPSupportedAccessoryHID, "vendorID"), +[UARPSupportedAccessoryA2675 productID](UARPSupportedAccessoryA2675, "productID"));
    hwID = v2->hwID;
    v2->hwID = v5;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A2675");
}

+ (unsigned)productID
{
  return 1285;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
