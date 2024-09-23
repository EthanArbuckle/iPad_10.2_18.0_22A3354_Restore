@implementation NRDevice(VersionFactories)

- (uint64_t)watchOSVersion
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "valueForProperty:", *MEMORY[0x24BE6B3F0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6B4A8], "versionForString:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntegerValue");
  else
    v4 = 0xFFFFFFFFLL;

  return v4;
}

- (uint64_t)bltVersion
{
  unint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = objc_msgSend(a1, "watchOSVersion");
  if (v1 > 0x6FFFF)
    return 8;
  if (v1 > 0x5FFFF)
    return 7;
  if (v1 >> 18)
    return 6;
  v3 = 4;
  v4 = 3;
  v5 = 2;
  if (!(v1 >> 17))
    v5 = (v1 & 0xFFFFFFFFFFFF0000) != 0;
  if (v1 >> 9 <= 0x100)
    v4 = v5;
  if (v1 <= 0x2FFFF)
    v3 = v4;
  if (v1 <= 0x301FF)
    return v3;
  else
    return 5;
}

+ (BOOL)activePairedDeviceSupportIsGreaterEqualVersion:()VersionFactories
{
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x24BE6B4E0], "blt_boundedWaitForActivePairedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "watchOSVersion");

  return v5 >= a3;
}

+ (uint64_t)activePairedDeviceSupportsFileSettingSync
{
  return objc_msgSend(a1, "activePairedDeviceSupportIsGreaterEqualVersion:", 196608);
}

+ (uint64_t)activePairedDeviceSupportsFileBulletinAdd
{
  return objc_msgSend(a1, "activePairedDeviceSupportIsGreaterEqualVersion:", 131584);
}

+ (uint64_t)activePairedDeviceSupportsAttachmentFiles
{
  return objc_msgSend(a1, "activePairedDeviceSupportIsGreaterEqualVersion:", 196608);
}

+ (uint64_t)activePairedDeviceSupportsNSNullPListExtenion
{
  return objc_msgSend(a1, "activePairedDeviceSupportIsGreaterEqualVersion:", 0x40000);
}

+ (uint64_t)activePairedDeviceSupportsMultipleAttachments
{
  return objc_msgSend(a1, "activePairedDeviceSupportIsGreaterEqualVersion:", 0x40000);
}

+ (uint64_t)activePairedDeviceSupportsAddBulletinReplyToken
{
  return objc_msgSend(a1, "activePairedDeviceSupportIsGreaterEqualVersion:", 0x40000);
}

+ (uint64_t)activePairedDeviceSupportsSendingOnlyCategoryID
{
  return objc_msgSend(a1, "activePairedDeviceSupportIsGreaterEqualVersion:", 327680);
}

+ (uint64_t)activePairedDeviceSupportsCriticalAndGroupingSettings
{
  return objc_msgSend(a1, "activePairedDeviceSupportIsGreaterEqualVersion:", 327680);
}

+ (uint64_t)activePairedDeviceSupportsSiriActionAppList
{
  return objc_msgSend(a1, "activePairedDeviceSupportIsGreaterEqualVersion:", 327680);
}

+ (uint64_t)activePairedDeviceSupportsDisplayingSubtitle
{
  return objc_msgSend(a1, "activePairedDeviceSupportIsGreaterEqualVersion:", 327680);
}

+ (uint64_t)activePairedDeviceSupportsAuthorizationStatusLockScreenAndNCSettings
{
  return objc_msgSend(a1, "activePairedDeviceSupportIsGreaterEqualVersion:", 327680);
}

+ (uint64_t)activePairedDeviceSupportsUserNotificationListDestination
{
  return objc_msgSend(a1, "activePairedDeviceSupportIsGreaterEqualVersion:", 327680);
}

+ (uint64_t)activePairedDeviceSupportsSpokenNotificationSettings
{
  return objc_msgSend(a1, "activePairedDeviceSupportIsGreaterEqualVersion:", 393216);
}

+ (uint64_t)activePairedDeviceSupportsEmergencyAlerts
{
  return objc_msgSend(a1, "activePairedDeviceSupportIsGreaterEqualVersion:", 393216);
}

+ (uint64_t)activePairedDeviceSupportsNoLocalRemoteNotificationInBulletinContext
{
  return objc_msgSend(a1, "activePairedDeviceSupportIsGreaterEqualVersion:", 393216);
}

+ (uint64_t)activePairedDeviceSupportsNotSendingTemporarySequenceNumbers
{
  return objc_msgSend(a1, "activePairedDeviceSupportIsGreaterEqualVersion:", 393216);
}

+ (uint64_t)activePairedDeviceSupportsIconsPerNotification
{
  return objc_msgSend(a1, "activePairedDeviceSupportIsGreaterEqualVersion:", 393216);
}

+ (uint64_t)activePairedDeviceSupportsAuthorizationExpirationDate
{
  return objc_msgSend(a1, "activePairedDeviceSupportIsGreaterEqualVersion:", 458752);
}

+ (id)versionForString:()VersionFactories
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17A8]), "initWithString:", v3);
  v5 = 0;
  do
  {
    if (!objc_msgSend(v4, "scanInteger:", (char *)&v9 + v5, v9)
      || (*(unint64_t *)((char *)&v9 + v5) & 0x8000000000000000) != 0)
    {
      v6 = 0;
    }
    else if ((objc_msgSend(v4, "isAtEnd") & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      v6 = objc_msgSend(v4, "scanString:intoString:", CFSTR("."), 0);
    }
    if (v5 == 16)
      break;
    if ((objc_msgSend(v4, "isAtEnd") & 1) != 0)
      break;
    v5 += 8;
  }
  while (v6 == 1);
  if (v6 && objc_msgSend(v4, "isAtEnd"))
  {
    if (v9 >> 16)
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    else
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", ((_DWORD)v9 << 16) | ((unint64_t)v10 << 8) | v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
