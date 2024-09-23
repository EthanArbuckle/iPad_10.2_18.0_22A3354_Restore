@implementation UARPSupportedAccessoryA2776

- (UARPSupportedAccessoryA2776)init
{
  UARPSupportedAccessoryA2776 *v2;
  void *v3;
  UARPAccessoryHardwareIIC *v4;
  UARPAccessoryHardwareIIC *hwID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UARPSupportedAccessoryA2776;
  v2 = -[UARPSupportedAccessory init](&v7, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA2776 appleModelNumber](UARPSupportedAccessoryA2776, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("Agnes"));
    -[UARPSupportedAccessory setSupportsInternalSettings:](v2, "setSupportsInternalSettings:", 1);
    -[UARPSupportedAccessory addServiceBSDNotificationName:](v2, "addServiceBSDNotificationName:", CFSTR("com.apple.accessoryUpdater.uarp.fwUpdateNow."));
    v4 = objc_alloc_init(UARPAccessoryHardwareIIC);
    hwID = v2->hwID;
    v2->hwID = v4;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A2776");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
