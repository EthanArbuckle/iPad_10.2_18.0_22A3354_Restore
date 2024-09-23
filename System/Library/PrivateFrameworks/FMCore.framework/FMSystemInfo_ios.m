@implementation FMSystemInfo_ios

- (id)deviceUDID
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__FMSystemInfo_ios_deviceUDID__block_invoke;
  block[3] = &unk_1E82AA5A8;
  block[4] = self;
  if (deviceUDID_onceToken != -1)
    dispatch_once(&deviceUDID_onceToken, block);
  return (id)deviceUDID_deviceIdentifier;
}

- (id)deviceClass
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[FMSystemInfo_ios _deviceInfoForKey:](self, "_deviceInfoForKey:", CFSTR("DeviceName"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("iPod")))
      v4 = CFSTR("iPod touch");
    else
      v4 = v3;
  }
  else
  {
    v4 = CFSTR("Unknown");
  }
  v5 = v4;

  return v5;
}

- (id)productType
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  -[FMSystemInfo_ios _deviceInfoForKey:](self, "_deviceInfoForKey:", CFSTR("ProductType"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("Unknown");
  v4 = v2;

  return v4;
}

- (id)osVersion
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  -[FMSystemInfo_ios _deviceInfoForKey:](self, "_deviceInfoForKey:", CFSTR("ProductVersion"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("Unknown");
  v4 = v2;

  return v4;
}

- (id)osBuildVersion
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  -[FMSystemInfo_ios _deviceInfoForKey:](self, "_deviceInfoForKey:", CFSTR("BuildVersion"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("Unknown");
  v4 = v2;

  return v4;
}

- (id)_deviceInfoForKey:(__CFString *)a3
{
  return (id)MGCopyAnswerWithError();
}

- (id)_deviceInfoNumberForKey:(__CFString *)a3
{
  return (id)MGCopyAnswerWithError();
}

- (BOOL)_BOOLDeviceInfoForKey:(__CFString *)a3
{
  const void *v3;
  const void *v4;

  v3 = (const void *)MGCopyAnswerWithError();
  v4 = (const void *)*MEMORY[0x1E0C9AE50];
  CFRelease(v3);
  return v3 == v4;
}

- (id)productName
{
  __CFString *v2;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__FMSystemInfo_ios_productName__block_invoke;
  block[3] = &unk_1E82AA5A8;
  block[4] = self;
  if (productName_onceToken != -1)
    dispatch_once(&productName_onceToken, block);
  if (productName__value)
    v2 = (__CFString *)productName__value;
  else
    v2 = CFSTR("Unknown");
  return v2;
}

- (id)deviceName
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  -[FMSystemInfo_ios _deviceInfoForKey:](self, "_deviceInfoForKey:", CFSTR("UserAssignedDeviceName"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = CFSTR("Unknown");
  v4 = v2;

  return v4;
}

- (id)deviceModelName
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[FMSystemInfo_ios _deviceInfoForKey:](self, "_deviceInfoForKey:", CFSTR("DeviceName"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (-[__CFString isEqualToString:](v2, "isEqualToString:", CFSTR("iPod")))
      v4 = CFSTR("iPod touch");
    else
      v4 = v3;
  }
  else
  {
    v4 = CFSTR("Unknown");
  }
  v5 = v4;

  return v5;
}

- (id)serialNumber
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__FMSystemInfo_ios_serialNumber__block_invoke;
  block[3] = &unk_1E82AA5A8;
  block[4] = self;
  if (serialNumber_onceToken != -1)
    dispatch_once(&serialNumber_onceToken, block);
  return (id)serialNumber__value;
}

- (id)imei
{
  return -[FMSystemInfo_ios _deviceInfoForKey:](self, "_deviceInfoForKey:", CFSTR("InternationalMobileEquipmentIdentity"));
}

- (id)meid
{
  return -[FMSystemInfo_ios _deviceInfoForKey:](self, "_deviceInfoForKey:", CFSTR("MobileEquipmentIdentifier"));
}

- (id)ecid
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__FMSystemInfo_ios_ecid__block_invoke;
  block[3] = &unk_1E82AA5A8;
  block[4] = self;
  if (ecid_onceToken != -1)
    dispatch_once(&ecid_onceToken, block);
  return (id)ecid__value;
}

- (id)chipId
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__FMSystemInfo_ios_chipId__block_invoke;
  block[3] = &unk_1E82AA5A8;
  block[4] = self;
  if (chipId_onceToken != -1)
    dispatch_once(&chipId_onceToken, block);
  return (id)chipId__value;
}

- (id)wifiMacAddress
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__FMSystemInfo_ios_wifiMacAddress__block_invoke;
  block[3] = &unk_1E82AA5A8;
  block[4] = self;
  if (wifiMacAddress_onceToken != -1)
    dispatch_once(&wifiMacAddress_onceToken, block);
  return (id)wifiMacAddress__value;
}

- (id)btMacAddress
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__FMSystemInfo_ios_btMacAddress__block_invoke;
  block[3] = &unk_1E82AA5A8;
  block[4] = self;
  if (btMacAddress_onceToken != -1)
    dispatch_once(&btMacAddress_onceToken, block);
  return (id)btMacAddress__value;
}

- (BOOL)isDeviceSecured
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPasscodeSet");

  return v3;
}

- (BOOL)hasSEP
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__FMSystemInfo_ios_hasSEP__block_invoke;
  block[3] = &unk_1E82AA5A8;
  block[4] = self;
  if (hasSEP_onceToken != -1)
    dispatch_once(&hasSEP_onceToken, block);
  return hasSEP__value;
}

- (void)_deviceInfoForKey:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1C9967000, a2, a3, "Cannot obtain Gestalt value for %@!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_1();
}

@end
