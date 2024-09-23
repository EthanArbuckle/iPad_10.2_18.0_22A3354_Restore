@implementation UARPSupportedAccessoryA2463

- (UARPSupportedAccessoryA2463)init
{
  UARPSupportedAccessoryA2463 *v2;
  void *v3;
  UARPAccessoryHardwareHID *v4;
  UARPAccessoryHardwareHID *hwID;
  UARPAccessoryHIDPersonality *v6;
  UARPAccessoryHIDPersonality *v7;
  UARPAccessoryHIDPersonality *v8;
  UARPAccessoryHIDPersonality *v9;
  UARPAccessoryHIDPersonality *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UARPSupportedAccessoryA2463;
  v2 = -[UARPSupportedAccessoryMagSafe init](&v12, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA2463 appleModelNumber](UARPSupportedAccessoryA2463, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("MagSafe Charger (MFi Module)"));
    v4 = -[UARPAccessoryHardwareHID initWithVendorID:productID:]([UARPAccessoryHardwareHID alloc], "initWithVendorID:productID:", +[UARPSupportedAccessoryHID vendorID](UARPSupportedAccessoryHID, "vendorID"), +[UARPSupportedAccessoryA2463 productID](UARPSupportedAccessoryA2463, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    v6 = -[UARPAccessoryHIDPersonality initWithVendorID:productID:]([UARPAccessoryHIDPersonality alloc], "initWithVendorID:productID:", 11145, 50652);
    -[UARPAccessoryHardwareHID addPersonality:](v2->hwID, "addPersonality:", v6);
    v7 = -[UARPAccessoryHIDPersonality initWithVendorID:productID:]([UARPAccessoryHIDPersonality alloc], "initWithVendorID:productID:", 11145, 24790);
    -[UARPAccessoryHardwareHID addPersonality:](v2->hwID, "addPersonality:", v7);
    v8 = -[UARPAccessoryHIDPersonality initWithVendorID:productID:]([UARPAccessoryHIDPersonality alloc], "initWithVendorID:productID:", 11145, 40119);
    -[UARPAccessoryHardwareHID addPersonality:](v2->hwID, "addPersonality:", v8);
    v9 = -[UARPAccessoryHIDPersonality initWithVendorID:productID:]([UARPAccessoryHIDPersonality alloc], "initWithVendorID:productID:", 11145, 15125);
    -[UARPAccessoryHardwareHID addPersonality:](v2->hwID, "addPersonality:", v9);
    v10 = -[UARPAccessoryHIDPersonality initWithVendorID:productID:]([UARPAccessoryHIDPersonality alloc], "initWithVendorID:productID:", 11145, 15126);
    -[UARPAccessoryHardwareHID addPersonality:](v2->hwID, "addPersonality:", v10);
    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);

  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A2463");
}

+ (unsigned)productID
{
  return 1281;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
