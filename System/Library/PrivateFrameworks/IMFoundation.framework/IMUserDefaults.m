@implementation IMUserDefaults

- (id)appValueForKey:(id)a3
{
  return (id)IMGetAppValueForKey(a3, a2);
}

+ (id)sharedDefaults
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_19067A9C8;
  block[3] = &unk_1E2C444F8;
  block[4] = a1;
  if (qword_1ECD90D30 != -1)
    dispatch_once(&qword_1ECD90D30, block);
  return (id)qword_1ECD90D28;
}

+ (void)setEnableEngram:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v8 = (id)objc_msgSend_initWithSuiteName_(v4, v5, (uint64_t)CFSTR("com.apple.ids"), v6);
  objc_msgSend_setBool_forKey_(v8, v7, v3, (uint64_t)CFSTR("EnableEngramVersion"));

}

+ (BOOL)isEngramEnabled
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  BOOL v8;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v5 = (void *)objc_msgSend_initWithSuiteName_(v2, v3, (uint64_t)CFSTR("com.apple.ids"), v4);
  v8 = objc_msgSend_integerForKey_(v5, v6, (uint64_t)CFSTR("EnableEngramVersion"), v7) == 2;

  return v8;
}

+ (void)setPhoneNumberValidationMode:(int64_t)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v4 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v8 = (id)objc_msgSend_initWithSuiteName_(v4, v5, (uint64_t)CFSTR("com.apple.ids"), v6);
  objc_msgSend_setInteger_forKey_(v8, v7, a3, (uint64_t)CFSTR("PhoneNumberValidationMode"));

}

+ (int64_t)phoneNumberValidationMode
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  int64_t v8;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v5 = (void *)objc_msgSend_initWithSuiteName_(v2, v3, (uint64_t)CFSTR("com.apple.ids"), v4);
  v8 = objc_msgSend_integerForKey_(v5, v6, (uint64_t)CFSTR("PhoneNumberValidationMode"), v7);

  return v8;
}

+ (void)setPhoneNumberValidationPreflightTestData:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x1E0C99EA0];
  v4 = a3;
  v5 = [v3 alloc];
  v9 = (id)objc_msgSend_initWithSuiteName_(v5, v6, (uint64_t)CFSTR("com.apple.ids"), v7);
  objc_msgSend_setObject_forKey_(v9, v8, (uint64_t)v4, (uint64_t)CFSTR("PreflightTestData"));

}

+ (NSString)phoneNumberValidationPreflightTestData
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v5 = (void *)objc_msgSend_initWithSuiteName_(v2, v3, (uint64_t)CFSTR("com.apple.ids"), v4);
  objc_msgSend_stringForKey_(v5, v6, (uint64_t)CFSTR("PreflightTestData"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

+ (void)setEnableLiveDeliveryWarmUp:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v8 = (id)objc_msgSend_initWithSuiteName_(v4, v5, (uint64_t)CFSTR("com.apple.ids"), v6);
  objc_msgSend_setBool_forKey_(v8, v7, v3, (uint64_t)CFSTR("EnableLiveDeliveryWarmUp"));

}

+ (BOOL)isLiveDeliveryWarmUpEnabled
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  char v8;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v5 = (void *)objc_msgSend_initWithSuiteName_(v2, v3, (uint64_t)CFSTR("com.apple.ids"), v4);
  v8 = objc_msgSend_BOOLForKey_(v5, v6, (uint64_t)CFSTR("EnableLiveDeliveryWarmUp"), v7);

  return v8;
}

+ (BOOL)trustAnyCredential
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  char v8;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v5 = (void *)objc_msgSend_initWithSuiteName_(v2, v3, (uint64_t)CFSTR("com.apple.ids"), v4);
  v8 = objc_msgSend_BOOLForKey_(v5, v6, (uint64_t)CFSTR("TrustAnyCredential"), v7);

  return v8;
}

+ (BOOL)isWritePushPayloadsToDiskEnabled
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  char v8;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v5 = (void *)objc_msgSend_initWithSuiteName_(v2, v3, (uint64_t)CFSTR("com.apple.ids"), v4);
  v8 = objc_msgSend_BOOLForKey_(v5, v6, (uint64_t)CFSTR("WritePushPayloadsToDisk"), v7);

  return v8;
}

+ (BOOL)isWriteBlastDoorPayloadsToDiskEnabled
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  char v8;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v5 = (void *)objc_msgSend_initWithSuiteName_(v2, v3, (uint64_t)CFSTR("com.apple.ids"), v4);
  v8 = objc_msgSend_BOOLForKey_(v5, v6, (uint64_t)CFSTR("WriteBlastDoorPayloadsToDisk"), v7);

  return v8;
}

+ (NSString)writePushPayloadsToDiskPath
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v5 = (void *)objc_msgSend_initWithSuiteName_(v2, v3, (uint64_t)CFSTR("com.apple.ids"), v4);
  objc_msgSend_stringForKey_(v5, v6, (uint64_t)CFSTR("WritePushPayloadsToDiskPath"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

+ (BOOL)shouldDisableFailFastWhenSatelliteIsAvailable
{
  id v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  char v8;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v5 = (void *)objc_msgSend_initWithSuiteName_(v2, v3, (uint64_t)CFSTR("com.apple.ids"), v4);
  v8 = objc_msgSend_BOOLForKey_(v5, v6, (uint64_t)CFSTR("ShouldDisableFailFastWhenSatelliteIsAvailable"), v7);

  return v8;
}

- (BOOL)appBoolByHostForKey:(id)a3
{
  return IMGetAppByHostBoolForKey(a3);
}

- (void)setAppBool:(BOOL)a3 byHostForKey:(id)a4
{
  IMSetAppByHostBoolForKey((const __CFString *)a4, a3);
}

- (void)setAppValue:(id)a3 forKey:(id)a4
{
  IMSetAppValueForKey((const __CFString *)a4, a3);
}

- (void)removeAppValueForKey:(id)a3
{
  IMRemoveAppValueForKey((const __CFString *)a3);
}

- (BOOL)appBoolForKey:(id)a3
{
  return IMGetAppBoolForKey(a3);
}

- (void)setAppBool:(BOOL)a3 forKey:(id)a4
{
  IMSetAppBoolForKey((const __CFString *)a4, a3);
}

- (void)setValue:(void *)a3 forKey:(id)a4 appID:(id)a5
{
  MEMORY[0x1E0DE7D20](self, sel_setValue_forKey_applicationID_userName_hostName_, a3, a4);
}

- (void)setMultiple:(id)a3 remove:(id)a4 appID:(id)a5
{
  MEMORY[0x1E0DE7D20](self, sel_setMultiple_remove_applicationID_userName_hostName_, a3, a4);
}

- (void)synchronizeAppID:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_synchronizeApplicationID_userName_hostName_, a3, *MEMORY[0x1E0C9B260]);
}

- (id)copyKeyListForAppID:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_copyKeyListForApplicationID_userName_hostName_, a3, *MEMORY[0x1E0C9B260]);
}

- (id)copyMultipleForCurrentKeys:(id)a3 appID:(id)a4
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_copyMultipleForCurrentKeys_applicationID_userName_hostName_, a3, a4);
}

- (id)copyValueForKey:(id)a3 appID:(id)a4
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_copyValueForKey_applicationID_userName_hostName_, a3, a4);
}

- (void)setValue:(void *)a3 forKey:(id)a4 applicationID:(__CFString *)a5 userName:(__CFString *)a6 hostName:(__CFString *)a7
{
  CFPreferencesSetValue((CFStringRef)a4, a3, a5, a6, a7);
}

- (void)setMultiple:(id)a3 remove:(id)a4 applicationID:(__CFString *)a5 userName:(__CFString *)a6 hostName:(__CFString *)a7
{
  CFPreferencesSetMultiple((CFDictionaryRef)a3, (CFArrayRef)a4, a5, a6, a7);
}

- (void)synchronizeApplicationID:(__CFString *)a3 userName:(__CFString *)a4 hostName:(__CFString *)a5
{
  CFPreferencesSynchronize(a3, a4, a5);
}

- (id)copyKeyListForApplicationID:(__CFString *)a3 userName:(__CFString *)a4 hostName:(__CFString *)a5
{
  return CFPreferencesCopyKeyList(a3, a4, a5);
}

- (id)copyMultipleForCurrentKeys:(id)a3 applicationID:(__CFString *)a4 userName:(__CFString *)a5 hostName:(__CFString *)a6
{
  return CFPreferencesCopyMultiple((CFArrayRef)a3, a4, a5, a6);
}

- (id)copyValueForKey:(id)a3 applicationID:(__CFString *)a4 userName:(__CFString *)a5 hostName:(__CFString *)a6
{
  return (id)CFPreferencesCopyValue((CFStringRef)a3, a4, a5, a6);
}

@end
