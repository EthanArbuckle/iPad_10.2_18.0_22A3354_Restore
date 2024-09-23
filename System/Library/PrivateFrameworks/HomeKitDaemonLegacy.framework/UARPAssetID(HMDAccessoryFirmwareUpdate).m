@implementation UARPAssetID(HMDAccessoryFirmwareUpdate)

- (id)softwareVersion
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (((_os_feature_enabled_impl() & 1) != 0
     || CFPreferencesGetAppBooleanValue(CFSTR("MatterOTA"), CFSTR("/Library/Managed Preferences/mobile/com.apple.homed.plist"), 0))&& objc_msgSend(a1, "isMatterAsset"))
  {
    objc_msgSend(a1, "assetVersionNumber");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      v3 = objc_alloc(MEMORY[0x1E0D286A0]);
      objc_msgSend(a1, "assetVersionNumber");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v3, "initWithMajorVersion:minorVersion:updateVersion:", objc_msgSend(v4, "unsignedLongValue"), 0, 0);
LABEL_8:
      v2 = (void *)v5;

    }
  }
  else
  {
    objc_msgSend(a1, "assetVersion");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      v6 = objc_alloc(MEMORY[0x1E0D286A0]);
      objc_msgSend(a1, "assetVersion");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "initWithVersionString:", v4);
      goto LABEL_8;
    }
  }
  return v2;
}

@end
