@implementation UARPSupportedAccessoryA2871

- (UARPSupportedAccessoryA2871)init
{
  UARPSupportedAccessoryA2871 *v2;
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
  v16.super_class = (Class)UARPSupportedAccessoryA2871;
  v2 = -[UARPSupportedAccessoryBeatsBluetooth init](&v16, sel_init);
  if (v2)
  {
    +[UARPSupportedAccessoryA2871 appleModelNumber](UARPSupportedAccessoryA2871, "appleModelNumber");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPSupportedAccessory setAppleModelNumber:](v2, "setAppleModelNumber:", v3);

    -[UARPSupportedAccessory setModelName:](v2, "setModelName:", CFSTR("Studio Buds"));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    +[UARPSupportedAccessoryA2871 alternativeAppleModelNumbers](UARPSupportedAccessoryA2871, "alternativeAppleModelNumbers", 0);
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

    v9 = -[UARPAccessoryHardwareBluetooth initWithVendorIDSource:vendorID:productID:productVersion:]([UARPAccessoryHardwareBluetooth alloc], "initWithVendorIDSource:vendorID:productID:productVersion:", 1, +[UARPSupportedAccessoryBeatsBluetooth vendorID](UARPSupportedAccessoryBeatsBluetooth, "vendorID"), +[UARPSupportedAccessoryA2871 productID](UARPSupportedAccessoryA2871, "productID"), 1);
    hwID = v2->hwID;
    v2->hwID = v9;

    -[UARPSupportedAccessory setHardwareID:](v2, "setHardwareID:", v2->hwID);
  }
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_opt_new();
  +[UARPSupportedAccessoryA2871 appleModelNumber](UARPSupportedAccessoryA2871, "appleModelNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Apple Model Number: %@\n"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("HardwareID: %@\n"), self->hwID);
  -[UARPSupportedAccessory downstreamAppleModelNumbers](self, "downstreamAppleModelNumbers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[UARPSupportedAccessory downstreamAppleModelNumbers](self, "downstreamAppleModelNumbers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", Downstream Apple Model Numbers = %@"), v7);

  }
  -[UARPSupportedAccessory alternativeAppleModelNumbers](self, "alternativeAppleModelNumbers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[UARPSupportedAccessory alternativeAppleModelNumbers](self, "alternativeAppleModelNumbers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", Alternative Apple Model Numbers = %@"), v10);

  }
  -[UARPSupportedAccessory mobileAssetAppleModelNumber](self, "mobileAssetAppleModelNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[UARPSupportedAccessory mobileAssetAppleModelNumber](self, "mobileAssetAppleModelNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(", Mobile Asset Apple Model Numbers = %@"), v12);

  }
  objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)appleModelNumber
{
  return CFSTR("A2871");
}

+ (id)alternativeAppleModelNumbers
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("A2872"), CFSTR("A2952"), 0);
}

+ (unsigned)productID
{
  return 8214;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->hwID, 0);
}

@end
