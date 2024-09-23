@implementation UARPSupportedAccessoryA2868

- (UARPSupportedAccessoryA2868)init
{
  UARPSupportedAccessoryA2868 *v2;
  void *v3;
  UARPAccessoryHardwareUSBPD *v4;
  UARPAccessoryHardwareUSBPD *hwID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2868;
  v2 = -[UARPSupportedAccessoryUSBPDDongle init](&v7, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA2868 appleModelNumber](UARPSupportedAccessoryA2868, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("Lightning to USB-C Adapter"));
    -[UARPSupportedAccessory setUpdateRequiresPowerAssertion:](v2, "setUpdateRequiresPowerAssertion:", 1);
    v4 = -[UARPAccessoryHardwareUSBPD initWithVendorID:productID:usbpdClass:locationType:supportsAccMode7:]([UARPAccessoryHardwareUSBPD alloc], "initWithVendorID:productID:usbpdClass:locationType:supportsAccMode7:", +[UARPSupportedAccessoryUSBPD vendorID](UARPSupportedAccessoryUSBPD, "vendorID"), +[UARPSupportedAccessoryA2868 productID](UARPSupportedAccessoryA2868, "productID"), +[UARPSupportedAccessoryUSBPDDongle deviceClass](UARPSupportedAccessoryUSBPDDongle, "deviceClass"), +[UARPSupportedAccessoryUSBPD locationType](UARPSupportedAccessoryUSBPD, "locationType"), -[UARPSupportedAccessory supportsAccMode7](v2, "supportsAccMode7"));
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A2868");
}

+ (unsigned)productID
{
  return 5904;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
