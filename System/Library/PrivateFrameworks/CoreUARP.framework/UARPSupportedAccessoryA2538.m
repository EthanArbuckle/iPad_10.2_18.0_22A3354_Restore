@implementation UARPSupportedAccessoryA2538

- (UARPSupportedAccessoryA2538)init
{
  UARPSupportedAccessoryA2538 *v2;
  void *v3;
  UARPAccessoryHardwareHID *v4;
  UARPAccessoryHardwareHID *hwID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2538;
  v2 = -[UARPSupportedAccessoryPencil init](&v7, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA2538 appleModelNumber](UARPSupportedAccessoryA2538, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setUpdateRequiresPowerAssertion:](v2, "setUpdateRequiresPowerAssertion:", 1);
    v4 = -[UARPAccessoryHardwareHID initWithVendorID:productID:]([UARPAccessoryHardwareHID alloc], "initWithVendorID:productID:", +[UARPSupportedAccessoryPencil vendorID](UARPSupportedAccessoryPencil, "vendorID"), +[UARPSupportedAccessoryA2538 productID](UARPSupportedAccessoryA2538, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A2538");
}

+ (unsigned)productID
{
  return 1106;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
