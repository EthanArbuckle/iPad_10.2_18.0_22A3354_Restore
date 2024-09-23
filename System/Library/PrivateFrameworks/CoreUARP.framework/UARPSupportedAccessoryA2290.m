@implementation UARPSupportedAccessoryA2290

- (UARPSupportedAccessoryA2290)init
{
  UARPSupportedAccessoryA2290 *v2;
  void *v3;
  UARPAccessoryHardwareUSBPD *v4;
  UARPAccessoryHardwareUSBPD *hwID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2290;
  v2 = -[UARPSupportedAccessoryUSBPDPowerAdapterLegacy init](&v7, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA2290 appleModelNumber](UARPSupportedAccessoryA2290, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("Power Adapter (Legacy)"));
    v4 = -[UARPAccessoryHardwareUSBPD initWithVendorID:productID:usbpdClass:locationType:supportsAccMode7:]([UARPAccessoryHardwareUSBPD alloc], "initWithVendorID:productID:usbpdClass:locationType:supportsAccMode7:", +[UARPSupportedAccessoryUSBPD vendorID](UARPSupportedAccessoryUSBPD, "vendorID"), +[UARPSupportedAccessoryA2290 productID](UARPSupportedAccessoryA2290, "productID"), +[UARPSupportedAccessoryUSBPDPowerAdapter deviceClass](UARPSupportedAccessoryUSBPDPowerAdapterLegacy, "deviceClass"), +[UARPSupportedAccessoryUSBPD locationType](UARPSupportedAccessoryUSBPD, "locationType"), -[UARPSupportedAccessory supportsAccMode7](v2, "supportsAccMode7"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A2290");
}

+ (unsigned)productID
{
  return 28693;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
