@implementation FMSystemInfo

- (BOOL)isInternalBuild
{
  return os_variant_has_internal_content();
}

void __30__FMSystemInfo_ios_deviceUDID__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_deviceInfoForKey:", CFSTR("UniqueDeviceID"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)deviceUDID_deviceIdentifier;
  deviceUDID_deviceIdentifier = v1;

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_7);
  return (id)sharedInstance___instance_0;
}

- (id)ownerAccount
{
  return +[FMOwnerAccount sharedInstance](FMOwnerAccount, "sharedInstance");
}

void __30__FMSystemInfo_sharedInstance__block_invoke()
{
  FMSystemInfo_ios *v0;
  void *v1;

  v0 = objc_alloc_init(FMSystemInfo_ios);
  v1 = (void *)sharedInstance___instance_0;
  sharedInstance___instance_0 = (uint64_t)v0;

}

void __31__FMSystemInfo_ios_productName__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_deviceInfoForKey:", CFSTR("ProductName"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)productName__value;
  productName__value = v1;

}

void __32__FMSystemInfo_ios_serialNumber__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_deviceInfoForKey:", CFSTR("SerialNumber"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)serialNumber__value;
  serialNumber__value = v1;

}

void __24__FMSystemInfo_ios_ecid__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_deviceInfoNumberForKey:", CFSTR("UniqueChipID"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)ecid__value;
  ecid__value = v1;

}

void __26__FMSystemInfo_ios_chipId__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_deviceInfoNumberForKey:", CFSTR("ChipID"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)chipId__value;
  chipId__value = v1;

}

void __34__FMSystemInfo_ios_wifiMacAddress__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_deviceInfoForKey:", CFSTR("WifiAddress"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)wifiMacAddress__value;
  wifiMacAddress__value = v1;

}

void __32__FMSystemInfo_ios_btMacAddress__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_deviceInfoForKey:", CFSTR("BluetoothAddress"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)btMacAddress__value;
  btMacAddress__value = v1;

}

uint64_t __26__FMSystemInfo_ios_hasSEP__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_BOOLDeviceInfoForKey:", CFSTR("HasSEP"));
  hasSEP__value = result;
  return result;
}

void __31__FMSystemInfo_osx_productName__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)_CFCopySystemVersionDictionary();
  if (v0)
  {
    v3 = v0;
    objc_msgSend(v0, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB98]);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)productName__value_0;
    productName__value_0 = v1;

    v0 = v3;
  }

}

- (id)productType
{
  return 0;
}

- (id)productName
{
  return 0;
}

- (id)deviceClass
{
  return 0;
}

- (id)deviceUDID
{
  return 0;
}

- (id)osVersion
{
  return 0;
}

- (id)osBuildVersion
{
  return 0;
}

- (id)deviceName
{
  return 0;
}

- (id)deviceModelName
{
  return 0;
}

- (id)serialNumber
{
  return 0;
}

- (id)imei
{
  return 0;
}

- (id)meid
{
  return 0;
}

- (id)ecid
{
  return 0;
}

- (id)chipId
{
  return 0;
}

- (id)wifiMacAddress
{
  return 0;
}

- (id)btMacAddress
{
  return 0;
}

- (BOOL)isDeviceSecured
{
  return 0;
}

- (BOOL)hasSEP
{
  return 0;
}

@end
