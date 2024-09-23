@implementation UARPSupportedAccessoryUSBPDPowerAdapterLegacy

- (UARPSupportedAccessoryUSBPDPowerAdapterLegacy)init
{
  UARPSupportedAccessoryUSBPDPowerAdapterLegacy *v2;
  UARPSupportedAccessoryUSBPDPowerAdapterLegacy *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UARPSupportedAccessoryUSBPDPowerAdapterLegacy;
  v2 = -[UARPSupportedAccessoryUSBPDPowerAdapter init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UARPSupportedAccessory setAutoAppliesStagedFirmware:](v2, "setAutoAppliesStagedFirmware:", 1);
    -[UARPSupportedAccessory setSupportsAccMode7:](v3, "setSupportsAccMode7:", 0);
  }
  return v3;
}

@end
