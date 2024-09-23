@implementation UARPSupportedAccessoryA2968USB

- (UARPSupportedAccessoryA2968USB)init
{
  UARPSupportedAccessoryA2968USB *v2;
  void *v3;
  UARPAccessoryHardwareUSB *v4;
  UARPAccessoryHardwareUSB *hwID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2968USB;
  v2 = -[UARPSupportedAccessoryAirPodsCaseUSB init](&v7, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA2968USB appleModelNumber](UARPSupportedAccessoryA2968USB, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("AirPods Pro 2 Case"));
    -[UARPSupportedAccessory setPersonalizationNotification:](v2, "setPersonalizationNotification:", CFSTR("com.apple.uarp.BTLEServer.personalizationNeeded"));
    v4 = -[UARPAccessoryHardwareUSB initWithVendorID:productID:]([UARPAccessoryHardwareUSB alloc], "initWithVendorID:productID:", +[UARPSupportedAccessoryAirPodsCaseUSB vendorID](UARPSupportedAccessoryAirPodsCaseUSB, "vendorID"), +[UARPSupportedAccessoryA2968USB productID](UARPSupportedAccessoryA2968USB, "productID"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return +[UARPSupportedAccessoryA2968 appleModelNumber](UARPSupportedAccessoryA2968, "appleModelNumber");
}

+ (unsigned)productID
{
  return 5022;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
