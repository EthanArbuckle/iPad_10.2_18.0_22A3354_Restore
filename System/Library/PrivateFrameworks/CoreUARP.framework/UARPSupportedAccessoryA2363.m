@implementation UARPSupportedAccessoryA2363

- (UARPSupportedAccessoryA2363)init
{
  UARPSupportedAccessoryA2363 *v2;
  void *v3;
  UARPAccessoryHardwareUSBPD *v4;
  UARPAccessoryHardwareUSBPD *hwID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2363;
  v2 = -[UARPSupportedAccessoryUSBPDMagSafe init](&v7, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA2363 appleModelNumber](UARPSupportedAccessoryA2363, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("MagSafe Charge Cable"));
    -[UARPSupportedAccessory setSupportsLogs:](v2, "setSupportsLogs:", 1);
    -[UARPSupportedAccessory setSupportsAnalytics:](v2, "setSupportsAnalytics:", 1);
    v4 = -[UARPAccessoryHardwareUSBPD initWithVendorID:productID:usbpdClass:locationType:supportsAccMode7:]([UARPAccessoryHardwareUSBPD alloc], "initWithVendorID:productID:usbpdClass:locationType:supportsAccMode7:", +[UARPSupportedAccessoryUSBPD vendorID](UARPSupportedAccessoryUSBPD, "vendorID"), +[UARPSupportedAccessoryA2363 productID](UARPSupportedAccessoryA2363, "productID"), +[UARPSupportedAccessoryUSBPDMagSafe deviceClass](UARPSupportedAccessoryUSBPDMagSafe, "deviceClass"), +[UARPSupportedAccessoryUSBPDMagSafe locationType](UARPSupportedAccessoryUSBPDMagSafe, "locationType"), -[UARPSupportedAccessory supportsAccMode7](v2, "supportsAccMode7"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A2363");
}

+ (unsigned)productID
{
  return 30720;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
