@implementation UARPSupportedAccessoryA2743

- (UARPSupportedAccessoryA2743)init
{
  UARPSupportedAccessoryA2743 *v2;
  void *v3;
  UARPAccessoryHardwareUSBPD *v4;
  UARPAccessoryHardwareUSBPD *hwID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2743;
  v2 = -[UARPSupportedAccessoryUSBPDPowerAdapter init](&v7, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA2743 appleModelNumber](UARPSupportedAccessoryA2743, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("Power Adapter"));
    -[UARPSupportedAccessory setSupportsAnalytics:](v2, "setSupportsAnalytics:", 1);
    v4 = -[UARPAccessoryHardwareUSBPD initWithVendorID:productID:usbpdClass:locationType:supportsAccMode7:]([UARPAccessoryHardwareUSBPD alloc], "initWithVendorID:productID:usbpdClass:locationType:supportsAccMode7:", +[UARPSupportedAccessoryUSBPD vendorID](UARPSupportedAccessoryUSBPD, "vendorID"), +[UARPSupportedAccessoryA2743 productID](UARPSupportedAccessoryA2743, "productID"), +[UARPSupportedAccessoryUSBPDPowerAdapter deviceClass](UARPSupportedAccessoryUSBPDPowerAdapter, "deviceClass"), +[UARPSupportedAccessoryUSBPD locationType](UARPSupportedAccessoryUSBPD, "locationType"), -[UARPSupportedAccessory supportsAccMode7](v2, "supportsAccMode7"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A2743");
}

+ (unsigned)productID
{
  return 28700;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
