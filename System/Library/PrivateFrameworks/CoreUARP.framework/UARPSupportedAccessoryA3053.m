@implementation UARPSupportedAccessoryA3053

- (UARPSupportedAccessoryA3053)init
{
  UARPSupportedAccessoryA3053 *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  UARPAccessoryHardwareBluetooth *v9;
  UARPAccessoryHardwareBluetooth *hwID;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)UARPSupportedAccessoryA3053;
  v2 = -[UARPSupportedAccessoryAirPodsBud init](&v16, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA3053 appleModelNumber](UARPSupportedAccessoryA3053, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("AirPods Pro 2"));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    +[UARPSupportedAccessoryA3053 alternativeAppleModelNumbers](UARPSupportedAccessoryA3053, "alternativeAppleModelNumbers", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          -[UARPSupportedAccessory addAlternativeAppleModelNumber:](v2, "addAlternativeAppleModelNumber:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v6);
    }

    v9 = -[UARPAccessoryHardwareBluetooth initWithVendorIDSource:vendorID:productID:productVersion:]([UARPAccessoryHardwareBluetooth alloc], "initWithVendorIDSource:vendorID:productID:productVersion:", 1, +[UARPSupportedAccessoryAirPodsBud vendorID](UARPSupportedAccessoryAirPodsBud, "vendorID"), +[UARPSupportedAccessoryA3053 productID](UARPSupportedAccessoryA3053, "productID"), 1);
    hwID = v2->hwID;
    v2->hwID = v9;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

+ (id)appleModelNumber
{
  return CFSTR("A3053");
}

+ (id)alternativeAppleModelNumbers
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("A3050"), 0);
}

+ (unsigned)productID
{
  return 8217;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
