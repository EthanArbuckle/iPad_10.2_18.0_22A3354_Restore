@implementation UARPSupportedAccessoryA3046Simulated

- (UARPSupportedAccessoryA3046Simulated)init
{
  UARPSupportedAccessoryA3046Simulated *v2;
  void *v3;
  void *v4;
  void *v5;
  UARPAccessoryHardwareUSB *v6;
  UARPAccessoryHardwareUSB *hwID;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UARPSupportedAccessoryA3046Simulated;
  v2 = -[UARPSupportedAccessoryUSB init](&v9, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA3046Simulated appleModelNumber](UARPSupportedAccessoryA3046Simulated, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    +[UARPSupportedAccessoryA3046Simulated modelName](UARPSupportedAccessoryA3046Simulated, "modelName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", v4);

    -[UARPSupportedAccessory setIsSimulator:](v2, "setIsSimulator:", 1);
    +[UARPSupportedAccessoryA3046 appleModelNumber](UARPSupportedAccessoryA3046, "appleModelNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setMobileAssetAppleModelNumber:](v2, "setMobileAssetAppleModelNumber:", v5);

    v6 = -[UARPAccessoryHardwareUSB initWithVendorID:productID:]([UARPAccessoryHardwareUSB alloc], "initWithVendorID:productID:", +[UARPSupportedAccessoryA3046Simulated vendorID](UARPSupportedAccessoryA3046Simulated, "vendorID"), +[UARPSupportedAccessoryA3046Simulated productID](UARPSupportedAccessoryA3046Simulated, "productID"));
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
  +[UARPSupportedAccessoryA3046 appleModelNumber](UARPSupportedAccessoryA3046, "appleModelNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-SIM"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (unsigned)vendorID
{
  return 1093;
}

+ (unsigned)productID
{
  return +[UARPSupportedAccessoryA3046 productID](UARPSupportedAccessoryA3046, "productID");
}

+ (id)modelName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  +[UARPSupportedAccessoryA3046 modelName](UARPSupportedAccessoryA3046, "modelName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ [Simulator]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
