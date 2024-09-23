@implementation UARPSupportedAccessoryd5b67c73d2e5e518

- (UARPSupportedAccessoryd5b67c73d2e5e518)init
{
  UARPSupportedAccessoryd5b67c73d2e5e518 *v2;
  void *v3;
  void *v4;
  UARPAccessoryHardwareHID *v5;
  UARPAccessoryHardwareHID *hwID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UARPSupportedAccessoryd5b67c73d2e5e518;
  v2 = -[UARPSupportedAccessoryHID init](&v8, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryd5b67c73d2e5e518 productGroup](UARPSupportedAccessoryd5b67c73d2e5e518, "productGroup");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setProductGroup:](v2, "setProductGroup:", v3);

    +[UARPSupportedAccessoryd5b67c73d2e5e518 productNumber](UARPSupportedAccessoryd5b67c73d2e5e518, "productNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setProductNumber:](v2, "setProductNumber:", v4);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("Unity Remote"));
    -[UARPSupportedAccessory setVendorName:](v2, "setVendorName:", CFSTR("Universal Electronics Inc."));
    -[UARPSupportedAccessory setSupportsInternalSettings:](v2, "setSupportsInternalSettings:", 0);
    v5 = -[UARPAccessoryHardwareHID initWithVendorID:productID:]([UARPAccessoryHardwareHID alloc], "initWithVendorID:productID:", +[UARPSupportedAccessoryd5b67c73d2e5e518 vendorID](UARPSupportedAccessoryd5b67c73d2e5e518, "vendorID"), +[UARPSupportedAccessoryd5b67c73d2e5e518 productID](UARPSupportedAccessoryd5b67c73d2e5e518, "productID"));
    hwID = v2->hwID;
    v2->hwID = v5;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  +[UARPSupportedAccessoryd5b67c73d2e5e518 productGroup](UARPSupportedAccessoryd5b67c73d2e5e518, "productGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSupportedAccessoryd5b67c73d2e5e518 productNumber](UARPSupportedAccessoryd5b67c73d2e5e518, "productNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("PG/PN: %@%@, "), v4, v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("HardwareID: %@"), self->hwID);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)productGroup
{
  return CFSTR("d5b67c73");
}

+ (id)productNumber
{
  return CFSTR("d2e5e518");
}

+ (id)appleModelNumber
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  +[UARPSupportedAccessoryd5b67c73d2e5e518 productGroup](UARPSupportedAccessoryd5b67c73d2e5e518, "productGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSupportedAccessoryd5b67c73d2e5e518 productNumber](UARPSupportedAccessoryd5b67c73d2e5e518, "productNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@%@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (unsigned)vendorID
{
  return 147;
}

+ (unsigned)productID
{
  return -24576;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
