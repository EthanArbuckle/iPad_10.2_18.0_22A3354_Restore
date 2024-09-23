@implementation NSDictionary(ATSyncState)

- (uint64_t)lastServerRevision
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForKey:", CFSTR("LastServerRevision"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedLongLongValue");

  return v2;
}

- (void)setLastServerRevision:()ATSyncState
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forKey:", v2, CFSTR("LastServerRevision"));

}

- (uint64_t)lastClientRevision
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForKey:", CFSTR("LastClientRevision"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedLongLongValue");

  return v2;
}

- (void)setLastClientRevision:()ATSyncState
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forKey:", v2, CFSTR("LastClientRevision"));

}

- (void)setNewRevision:()ATSyncState
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setValue:forKey:", v2, CFSTR("NewRevisionKey"));

}

- (uint64_t)newRevision
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "valueForKey:", CFSTR("NewRevisionKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedLongLongValue");

  return v2;
}

- (uint64_t)versionToken
{
  return objc_msgSend(a1, "objectForKey:", CFSTR("VersionToken"));
}

- (uint64_t)setVersionToken:()ATSyncState
{
  return objc_msgSend(a1, "setValue:forKey:", a3, CFSTR("VersionToken"));
}

- (uint64_t)displayName
{
  return objc_msgSend(a1, "valueForKey:", CFSTR("DisplayName"));
}

- (uint64_t)setDisplayName:()ATSyncState
{
  return objc_msgSend(a1, "setValue:forKey:", a3, CFSTR("DisplayName"));
}

- (uint64_t)model
{
  return objc_msgSend(a1, "valueForKey:", CFSTR("Model"));
}

- (uint64_t)setModel:()ATSyncState
{
  return objc_msgSend(a1, "setValue:forKey:", a3, CFSTR("Model"));
}

- (uint64_t)osType
{
  return objc_msgSend(a1, "valueForKey:", CFSTR("OSType"));
}

- (uint64_t)setOsType:()ATSyncState
{
  return objc_msgSend(a1, "setValue:forKey:", a3, CFSTR("OSType"));
}

- (uint64_t)osVersion
{
  return objc_msgSend(a1, "valueForKey:", CFSTR("OSVersion"));
}

- (uint64_t)setOsVersion:()ATSyncState
{
  return objc_msgSend(a1, "setValue:forKey:", a3, CFSTR("OSVersion"));
}

- (uint64_t)grappaInfo
{
  return objc_msgSend(a1, "valueForKey:", CFSTR("Grappa"));
}

- (uint64_t)setGrappaInfo:()ATSyncState
{
  return objc_msgSend(a1, "setValue:forKey:", a3, CFSTR("Grappa"));
}

- (uint64_t)enabledDataClasses
{
  return objc_msgSend(a1, "valueForKey:", CFSTR("EnabledDataClasses"));
}

- (uint64_t)setEnabledDataClasses:()ATSyncState
{
  return objc_msgSend(a1, "setValue:forKey:", a3, CFSTR("EnabledDataClasses"));
}

- (uint64_t)devicePairingId
{
  return objc_msgSend(a1, "valueForKey:", CFSTR("DevicePairingId"));
}

- (uint64_t)setDevicePairingId:()ATSyncState
{
  return objc_msgSend(a1, "setValue:forKey:", a3, CFSTR("DevicePairingId"));
}

- (uint64_t)deviceGUID
{
  return objc_msgSend(a1, "valueForKey:", CFSTR("DeviceGUID"));
}

- (uint64_t)setDeviceGUID:()ATSyncState
{
  return objc_msgSend(a1, "setValue:forKey:", a3, CFSTR("DeviceGUID"));
}

@end
