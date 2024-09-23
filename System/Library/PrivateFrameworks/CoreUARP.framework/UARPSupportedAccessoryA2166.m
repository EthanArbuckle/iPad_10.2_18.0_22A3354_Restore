@implementation UARPSupportedAccessoryA2166

- (UARPSupportedAccessoryA2166)init
{
  UARPSupportedAccessoryA2166 *v2;
  void *v3;
  UARPAccessoryHardwareUSBPD *v4;
  UARPAccessoryHardwareUSBPD *hwID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2166;
  v2 = -[UARPSupportedAccessoryUSBPDPowerAdapterLegacy init](&v7, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA2166 appleModelNumber](UARPSupportedAccessoryA2166, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("Power Adapter (Legacy)"));
    v4 = -[UARPAccessoryHardwareUSBPD initWithVendorID:productID:usbpdClass:locationType:supportsAccMode7:]([UARPAccessoryHardwareUSBPD alloc], "initWithVendorID:productID:usbpdClass:locationType:supportsAccMode7:", +[UARPSupportedAccessoryUSBPD vendorID](UARPSupportedAccessoryUSBPD, "vendorID"), +[UARPSupportedAccessoryA2166 productID](UARPSupportedAccessoryA2166, "productID"), +[UARPSupportedAccessoryUSBPDPowerAdapter deviceClass](UARPSupportedAccessoryUSBPDPowerAdapterLegacy, "deviceClass"), +[UARPSupportedAccessoryUSBPD locationType](UARPSupportedAccessoryUSBPD, "locationType"), -[UARPSupportedAccessory supportsAccMode7](v2, "supportsAccMode7"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A2166");
}

+ (unsigned)productID
{
  return 28674;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
