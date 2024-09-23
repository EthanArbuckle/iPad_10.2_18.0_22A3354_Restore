@implementation UARPSupportedAccessoryA3046DFUSimulated

- (UARPSupportedAccessoryA3046DFUSimulated)init
{
  UARPSupportedAccessoryA3046DFUSimulated *v2;
  void *v3;
  void *v4;
  void *v5;
  UARPAccessoryHardwareUSB *v6;
  UARPAccessoryHardwareUSB *hwID;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UARPSupportedAccessoryA3046DFUSimulated;
  v2 = -[UARPSupportedAccessoryUSB init](&v9, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA3046DFUSimulated appleModelNumber](UARPSupportedAccessoryA3046DFUSimulated, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    +[UARPSupportedAccessoryA3046DFUSimulated modelName](UARPSupportedAccessoryA3046DFUSimulated, "modelName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", v4);

    -[UARPSupportedAccessory setDfuMode:](v2, "setDfuMode:", 1);
    -[UARPSupportedAccessory setIsSimulator:](v2, "setIsSimulator:", 1);
    +[UARPSupportedAccessoryA3046 appleModelNumber](UARPSupportedAccessoryA3046, "appleModelNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setMobileAssetAppleModelNumber:](v2, "setMobileAssetAppleModelNumber:", v5);

    v6 = -[UARPAccessoryHardwareUSB initWithVendorID:productID:]([UARPAccessoryHardwareUSB alloc], "initWithVendorID:productID:", +[UARPSupportedAccessoryA3046Simulated vendorID](UARPSupportedAccessoryA3046Simulated, "vendorID"), +[UARPSupportedAccessoryA3046DFUSimulated productID](UARPSupportedAccessoryA3046DFUSimulated, "productID"));
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
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@-DFUSIM"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (unsigned)productID
{
  return +[UARPSupportedAccessoryA3046DFU productID](UARPSupportedAccessoryA3046DFU, "productID");
}

+ (id)modelName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  +[UARPSupportedAccessoryA3046DFU modelName](UARPSupportedAccessoryA3046DFU, "modelName");
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
