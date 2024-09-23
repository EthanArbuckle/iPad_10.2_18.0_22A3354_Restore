@implementation UARPSupportedAccessoryA2968

- (UARPSupportedAccessoryA2968)init
{
  UARPSupportedAccessoryA2968 *v2;
  void *v3;
  UARPAccessoryHardwareBluetooth *v4;
  UARPAccessoryHardwareBluetooth *hwID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2968;
  v2 = -[UARPSupportedAccessoryAirPodsCase init](&v7, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA2968 appleModelNumber](UARPSupportedAccessoryA2968, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("AirPods Pro 2 Case (USB-C)"));
    -[UARPSupportedAccessory setPersonalizationNotification:](v2, "setPersonalizationNotification:", CFSTR("com.apple.uarp.BTLEServer.personalizationNeeded"));
    v4 = -[UARPAccessoryHardwareBluetooth initWithVendorIDSource:vendorID:productID:productVersion:]([UARPAccessoryHardwareBluetooth alloc], "initWithVendorIDSource:vendorID:productID:productVersion:", 1, +[UARPSupportedAccessoryAirPodsCase vendorID](UARPSupportedAccessoryAirPodsCase, "vendorID"), +[UARPSupportedAccessoryA2968 productID](UARPSupportedAccessoryA2968, "productID"), 1);
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A2968");
}

+ (unsigned)productID
{
  return 8216;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
