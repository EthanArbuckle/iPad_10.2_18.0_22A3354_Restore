@implementation SFDeviceUtilities

+ (id)deviceUUID
{
  if (deviceUUID_once != -1)
    dispatch_once(&deviceUUID_once, &__block_literal_global_43);
  return (id)deviceUUID_deviceUUID;
}

void __31__SFDeviceUtilities_deviceUUID__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  if (objc_msgSend(MEMORY[0x1E0DD9900], "accessLevel") == 2)
  {
    v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("FEBFD06E-A2DF-4AEF-A58B-A9DEE6116B9D"));
    v1 = (void *)deviceUUID_deviceUUID;
    deviceUUID_deviceUUID = v0;
  }
  else
  {
    _SFSafariCloudTabsMetadataPath();
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "safari_stringForKey:", CFSTR("DeviceUUID"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v3);
      v5 = (void *)deviceUUID_deviceUUID;
      deviceUUID_deviceUUID = v4;

    }
    if (!deviceUUID_deviceUUID)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
      v7 = (void *)deviceUUID_deviceUUID;
      deviceUUID_deviceUUID = (uint64_t)v6;

      v8 = (void *)objc_msgSend(v2, "mutableCopy");
      if (!v2)
      {
        v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);

        v8 = (void *)v9;
      }
      objc_msgSend((id)deviceUUID_deviceUUID, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("DeviceUUID"));

      objc_msgSend(v8, "writeToFile:atomically:", v14, 1);
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("cloudTabsDeviceUUIDForRestoration"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend((id)deviceUUID_deviceUUID, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("cloudTabsDeviceUUIDForRestoration"));

    }
    v1 = (void *)v14;
  }

}

@end
