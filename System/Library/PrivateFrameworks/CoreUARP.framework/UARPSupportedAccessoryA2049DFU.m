@implementation UARPSupportedAccessoryA2049DFU

- (UARPSupportedAccessoryA2049DFU)init
{
  UARPSupportedAccessoryA2049DFU *v2;
  void *v3;
  void *v4;
  void *v5;
  UARPAccessoryHardwareUSB *v6;
  UARPAccessoryHardwareUSB *hwID;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UARPSupportedAccessoryA2049DFU;
  v2 = -[UARPSupportedAccessoryUSB init](&v9, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA2049DFU appleModelNumber](UARPSupportedAccessoryA2049DFU, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    +[UARPSupportedAccessoryA2049DFU modelName](UARPSupportedAccessoryA2049DFU, "modelName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", v4);

    -[UARPSupportedAccessory setDfuMode:](v2, "setDfuMode:", 1);
    +[UARPSupportedAccessoryA2049 appleModelNumber](UARPSupportedAccessoryA2049, "appleModelNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setMobileAssetAppleModelNumber:](v2, "setMobileAssetAppleModelNumber:", v5);

    v6 = -[UARPAccessoryHardwareUSB initWithVendorID:productID:]([UARPAccessoryHardwareUSB alloc], "initWithVendorID:productID:", +[UARPSupportedAccessoryUSB vendorID](UARPSupportedAccessoryUSB, "vendorID"), +[UARPSupportedAccessoryA2049DFU productID](UARPSupportedAccessoryA2049DFU, "productID"));
    hwID = v2->hwID;
    v2->hwID = v6;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  +[UARPSupportedAccessoryA2049 appleModelNumber](UARPSupportedAccessoryA2049, "appleModelNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-DFU"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (unsigned)productID
{
  return -4070;
}

+ (id)modelName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  +[UARPSupportedAccessoryA2049 modelName](UARPSupportedAccessoryA2049, "modelName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (DFU)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
