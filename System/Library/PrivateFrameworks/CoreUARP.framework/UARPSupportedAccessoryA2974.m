@implementation UARPSupportedAccessoryA2974

- (UARPSupportedAccessoryA2974)init
{
  UARPSupportedAccessoryA2974 *v2;
  void *v3;
  UARPAccessoryHardwareHID *v4;
  UARPAccessoryHardwareHID *hwID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2974;
  v2 = -[UARPSupportedAccessoryMagicKeyboard init](&v7, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA2974 appleModelNumber](UARPSupportedAccessoryA2974, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("Magic Keyboard"));
    -[UARPSupportedAccessory setUpdateRequiresPowerAssertion:](v2, "setUpdateRequiresPowerAssertion:", 1);
    v4 = -[UARPAccessoryHardwareHID initWithVendorID:productID:]([UARPAccessoryHardwareHID alloc], "initWithVendorID:productID:", +[UARPSupportedAccessoryHID vendorID](UARPSupportedAccessoryMagicKeyboard, "vendorID"), +[UARPSupportedAccessoryA2974 productID](UARPSupportedAccessoryA2974, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A2974");
}

+ (unsigned)productID
{
  return 1109;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
