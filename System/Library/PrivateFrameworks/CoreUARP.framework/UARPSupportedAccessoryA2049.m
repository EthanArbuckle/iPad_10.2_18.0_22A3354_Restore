@implementation UARPSupportedAccessoryA2049

- (UARPSupportedAccessoryA2049)init
{
  UARPSupportedAccessoryA2049 *v2;
  void *v3;
  void *v4;
  UARPAccessoryHardwareUSB *v5;
  UARPAccessoryHardwareUSB *hwID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UARPSupportedAccessoryA2049;
  v2 = -[UARPSupportedAccessoryUSB init](&v8, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA2049 appleModelNumber](UARPSupportedAccessoryA2049, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    +[UARPSupportedAccessoryA2049 modelName](UARPSupportedAccessoryA2049, "modelName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", v4);

    v5 = -[UARPAccessoryHardwareUSB initWithVendorID:productID:]([UARPAccessoryHardwareUSB alloc], "initWithVendorID:productID:", +[UARPSupportedAccessoryUSB vendorID](UARPSupportedAccessoryUSB, "vendorID"), +[UARPSupportedAccessoryA2049 productID](UARPSupportedAccessoryA2049, "productID"));
    hwID = v2->hwID;
    v2->hwID = v5;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A2049");
}

+ (unsigned)productID
{
  return 4362;
}

+ (id)modelName
{
  return CFSTR("USB-C to 3.5 mm Headphone Jack Adapter");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
