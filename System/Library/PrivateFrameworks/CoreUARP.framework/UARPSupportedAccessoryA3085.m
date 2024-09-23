@implementation UARPSupportedAccessoryA3085

- (UARPSupportedAccessoryA3085)init
{
  UARPSupportedAccessoryA3085 *v2;
  void *v3;
  UARPAccessoryHardwareHID *v4;
  UARPAccessoryHardwareHID *hwID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA3085;
  v2 = -[UARPSupportedAccessoryPencil init](&v7, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA3085 appleModelNumber](UARPSupportedAccessoryA3085, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setUpdateRequiresPowerAssertion:](v2, "setUpdateRequiresPowerAssertion:", 1);
    -[UARPSupportedAccessory setAutoAppliesStagedFirmware:](v2, "setAutoAppliesStagedFirmware:", 1);
    v4 = -[UARPAccessoryHardwareHID initWithVendorID:productID:]([UARPAccessoryHardwareHID alloc], "initWithVendorID:productID:", +[UARPSupportedAccessoryA3085 vendorID](UARPSupportedAccessoryA3085, "vendorID"), +[UARPSupportedAccessoryA3085 productID](UARPSupportedAccessoryA3085, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A3085");
}

+ (unsigned)vendorID
{
  return +[UARPSupportedAccessoryHID vendorID](UARPSupportedAccessoryHID, "vendorID");
}

+ (unsigned)productID
{
  return 1057;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
