@implementation UARPSupportedAccessoryA2617USB

- (UARPSupportedAccessoryA2617USB)init
{
  UARPSupportedAccessoryA2617USB *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  UARPAccessoryHardwareUSB *v10;
  UARPAccessoryHardwareUSB *hwID;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)UARPSupportedAccessoryA2617USB;
  v2 = -[UARPSupportedAccessoryAirPodsCaseUSB init](&v17, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA2617USB appleModelNumber](UARPSupportedAccessoryA2617USB, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("AirPods Pro 2 Case"));
    -[UARPSupportedAccessory setFusingOverrideUnfused:](v2, "setFusingOverrideUnfused:", CFSTR("prod"));
    +[UARPSupportedAccessoryA2699 mobileAssetAppleModelNumber](UARPSupportedAccessoryA2699, "mobileAssetAppleModelNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setMobileAssetAppleModelNumber:](v2, "setMobileAssetAppleModelNumber:", v4);

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    +[UARPSupportedAccessoryA2617USB alternativeAppleModelNumbers](UARPSupportedAccessoryA2617USB, "alternativeAppleModelNumbers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          -[UARPSupportedAccessory addAlternativeAppleModelNumber:](v2, "addAlternativeAppleModelNumber:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9++));
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v7);
    }

    -[UARPSupportedAccessory setPersonalizationNotification:](v2, "setPersonalizationNotification:", CFSTR("com.apple.uarp.BTLEServer.personalizationNeeded"));
    v10 = -[UARPAccessoryHardwareUSB initWithVendorID:productID:]([UARPAccessoryHardwareUSB alloc], "initWithVendorID:productID:", +[UARPSupportedAccessoryAirPodsCaseUSB vendorID](UARPSupportedAccessoryAirPodsCaseUSB, "vendorID"), +[UARPSupportedAccessoryA2617USB productID](UARPSupportedAccessoryA2617USB, "productID"));
    hwID = v2->hwID;
    v2->hwID = v10;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return +[UARPSupportedAccessoryA2617 appleModelNumber](UARPSupportedAccessoryA2617, "appleModelNumber");
}

+ (id)alternativeAppleModelNumbers
{
  return +[UARPSupportedAccessoryA2617 alternativeAppleModelNumbers](UARPSupportedAccessoryA2617, "alternativeAppleModelNumbers");
}

+ (unsigned)productID
{
  return 4373;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
