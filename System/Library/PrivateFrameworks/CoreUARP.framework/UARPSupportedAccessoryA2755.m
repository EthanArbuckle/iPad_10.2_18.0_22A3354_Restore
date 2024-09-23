@implementation UARPSupportedAccessoryA2755

- (UARPSupportedAccessoryA2755)init
{
  UARPSupportedAccessoryA2755 *v2;
  void *v3;
  UARPAccessoryHardwareHID *v4;
  UARPAccessoryHardwareHID *hwID;
  UARPAccessoryHIDPersonality *v6;
  UARPAccessoryHIDPersonality *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UARPSupportedAccessoryA2755;
  v2 = -[UARPSupportedAccessoryWatchPuck init](&v9, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA2755 appleModelNumber](UARPSupportedAccessoryA2755, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("Watch Puck Charger (MFi Module)"));
    v4 = -[UARPAccessoryHardwareHID initWithVendorID:productID:]([UARPAccessoryHardwareHID alloc], "initWithVendorID:productID:", +[UARPSupportedAccessoryHID vendorID](UARPSupportedAccessoryHID, "vendorID"), +[UARPSupportedAccessoryA2755 productID](UARPSupportedAccessoryA2755, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
    v6 = -[UARPAccessoryHIDPersonality initWithVendorID:productID:]([UARPAccessoryHIDPersonality alloc], "initWithVendorID:productID:", 1293, 346);
    -[UARPAccessoryHardwareHID addPersonality:](v2->hwID, "addPersonality:", v6);
    v7 = -[UARPAccessoryHIDPersonality initWithVendorID:productID:]([UARPAccessoryHIDPersonality alloc], "initWithVendorID:productID:", 12907, 289);
    -[UARPAccessoryHardwareHID addPersonality:](v2->hwID, "addPersonality:", v7);

  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A2755");
}

+ (unsigned)productID
{
  return 1284;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
