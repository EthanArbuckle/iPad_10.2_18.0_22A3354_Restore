@implementation MCDeviceCapabilities

+ (id)currentDevice
{
  if (currentDevice_once != -1)
    dispatch_once(&currentDevice_once, &__block_literal_global_27);
  return (id)currentDevice_device;
}

void __37__MCDeviceCapabilities_currentDevice__block_invoke()
{
  MCDeviceCapabilities *v0;
  void *v1;

  v0 = objc_alloc_init(MCDeviceCapabilities);
  v1 = (void *)currentDevice_device;
  currentDevice_device = (uint64_t)v0;

}

- (BOOL)_mediaDiskIsEncrypted
{
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  CFTypeID v4;
  _BOOL4 v5;
  NSObject *v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (const __CFBoolean *)MGCopyAnswer();
  v3 = v2;
  v5 = v2 && (v4 = CFGetTypeID(v2), v4 == CFBooleanGetTypeID()) && CFBooleanGetValue(v3) != 0;
  v6 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 67109120;
    v8[1] = v5;
    _os_log_impl(&dword_19ECC4000, v6, OS_LOG_TYPE_DEBUG, "block level encryption is %x", (uint8_t *)v8, 8u);
  }
  if (v3)
    CFRelease(v3);
  return v5;
}

- (MCDeviceCapabilities)init
{
  MCDeviceCapabilities *v2;
  MCDeviceCapabilities *v3;
  int v4;
  NSObject *v5;
  void *v6;
  objc_super v8;
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)MCDeviceCapabilities;
  v2 = -[MCDeviceCapabilities init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    if (-[MCDeviceCapabilities _mediaDiskIsEncrypted](v2, "_mediaDiskIsEncrypted"))
      v3->_supportsBlockLevelEncryption = 1;
    v4 = MKBDeviceFormattedForContentProtection();
    if (v4 < 0)
    {
      v5 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v10 = v4;
        _os_log_impl(&dword_19ECC4000, v5, OS_LOG_TYPE_ERROR, "Unable to determine if device supports file level encryption.  Got %d from MKBDeviceSupportsContentProtection()", buf, 8u);
      }
    }
    v3->_supportsFileLevelEncryption = v4 == 1;
    v6 = (void *)MGCopyAnswer();
    v3->_hasSEP = v6 != 0;

  }
  return v3;
}

- (BOOL)validateCapabilitiesRequiredByRestrictions:(id)a3 localizedIncompatibilityMessage:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v8 = a3;
  v9 = a4;
  if (+[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", CFSTR("requireBlockLevelEncryption"), v8) == 1&& !self->_supportsBlockLevelEncryption)
  {
    if (!a5)
      goto LABEL_11;
    v10 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArrayFromLocalizedDescription(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    v13 = 26000;
LABEL_10:
    objc_msgSend(v12, "MCErrorWithDomain:code:descriptionArray:errorType:", CFSTR("MCDeviceCapabilitiesErrorDomain"), v13, v11, CFSTR("MCFatalError"));
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a5) = 0;
    goto LABEL_11;
  }
  if (+[MCRestrictionManager BOOLSettingForFeature:withUserSettingDictionary:](MCRestrictionManager, "BOOLSettingForFeature:withUserSettingDictionary:", CFSTR("requireFileLevelEncryption"), v8) == 1&& !self->_supportsFileLevelEncryption)
  {
    if (!a5)
      goto LABEL_11;
    v14 = (void *)MEMORY[0x1E0CB35C8];
    MCErrorArrayFromLocalizedDescription(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v14;
    v13 = 26001;
    goto LABEL_10;
  }
  LOBYTE(a5) = 1;
LABEL_11:

  return (char)a5;
}

- (BOOL)supportsBlockLevelEncryption
{
  return self->_supportsBlockLevelEncryption;
}

- (BOOL)supportsFileLevelEncryption
{
  return self->_supportsFileLevelEncryption;
}

- (BOOL)hasSEP
{
  return self->_hasSEP;
}

@end
