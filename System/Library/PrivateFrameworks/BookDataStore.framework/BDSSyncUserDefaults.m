@implementation BDSSyncUserDefaults

+ (BOOL)isSignedIntoICloud
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char isUserSignedInToiCloud;

  objc_msgSend_sharedProvider(MEMORY[0x24BE0FBE8], a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isUserSignedInToiCloud = objc_msgSend_isUserSignedInToiCloud(v5, v6, v7, v8, v9);

  return isUserSignedInToiCloud;
}

+ (BOOL)isGlobalICloudDriveSyncOptedIn
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char isGlobalICloudDriveSyncOptedIn;

  objc_msgSend_sharedProvider(MEMORY[0x24BE0FBE8], a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isGlobalICloudDriveSyncOptedIn = objc_msgSend_isGlobalICloudDriveSyncOptedIn(v5, v6, v7, v8, v9);

  return isGlobalICloudDriveSyncOptedIn;
}

+ (BOOL)isCloudKitSyncOptedIn
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_BOOLForKey_(v5, v6, (uint64_t)CFSTR("BCSyncCloudKit"), v7, v8);

  return v9;
}

+ (id)makeOSStateHandler
{
  id v2;
  const char *v3;
  uint64_t v4;

  v2 = objc_alloc(MEMORY[0x24BE0FC10]);
  return (id)objc_msgSend_initWithTitle_block_(v2, v3, (uint64_t)CFSTR("BDSSyncUserDefaults"), (uint64_t)&unk_24F08A1D0, v4);
}

+ (id)iCloudIdentity
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend_sharedProvider(MEMORY[0x24BE0FBE8], a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_iCloudIdentity(v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)isICloudDriveSyncOptedIn
{
  return ((uint64_t (*)(__objc2_class *, char *))MEMORY[0x24BEDD108])(BDSSyncUserDefaults, sel__isICloudDriveSyncOptedIn);
}

+ (BOOL)_isICloudDriveSyncOptedIn
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int isPrimaryAccountManagedAppleID;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  int v34;
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  const __CFString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_sharedProvider(MEMORY[0x24BE0FBE8], a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isPrimaryAccountManagedAppleID = objc_msgSend_isPrimaryAccountManagedAppleID(v5, v6, v7, v8, v9);

  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_BOOLForKey_(v15, v16, (uint64_t)CFSTR("BCSyncICloudDrive"), v17, v18);

  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_BOOLForKey_(v24, v25, (uint64_t)CFSTR("BCSyncCloudKit"), v26, v27);

  BDSUbiquityLog();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v30 = CFSTR("NO");
    if (isPrimaryAccountManagedAppleID)
      v31 = CFSTR("YES");
    else
      v31 = CFSTR("NO");
    if (v19)
      v32 = CFSTR("YES");
    else
      v32 = CFSTR("NO");
    v34 = 138412802;
    v35 = v31;
    v36 = 2112;
    v37 = v32;
    if (v28)
      v30 = CFSTR("YES");
    v38 = 2112;
    v39 = v30;
    _os_log_impl(&dword_227D4F000, v29, OS_LOG_TYPE_INFO, "BDSSyncUserDefaults: isICloudDriveSyncOptedIn isPrimaryAccountManagedAppleID = %@ isBCSyncICloudDriveUserDefaults = %@ isBCSyncCloudKitUserDefaults = %@", (uint8_t *)&v34, 0x20u);
  }

  return isPrimaryAccountManagedAppleID | v19 & v28;
}

+ (BOOL)_isBundleIdentifierInArray:(__CFArray *)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v6;
  CFIndex Count;
  unint64_t v8;
  CFIndex v9;
  BOOL v10;
  const __CFString *ValueAtIndex;
  CFTypeID v12;

  objc_msgSend__booksAppBundleIdentifier(a1, a2, (uint64_t)a3, v3, v4);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  Count = CFArrayGetCount(a3);
  if (Count)
  {
    v8 = Count;
    v9 = 0;
    v10 = 1;
    do
    {
      ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a3, v9);
      v12 = CFGetTypeID(ValueAtIndex);
      if (v12 == CFStringGetTypeID() && CFStringCompare(ValueAtIndex, v6, 0) == kCFCompareEqualTo)
        break;
      v10 = ++v9 < v8;
    }
    while (v8 != v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)_isServiceEnabledAlternative:(__CFString *)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const void *v8;
  char isBundleIdentifierInArray;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = TCCAccessCopyBundleIdentifiersForService();
  if (v4)
  {
    v8 = (const void *)v4;
    isBundleIdentifierInArray = objc_msgSend__isBundleIdentifierInArray_(BDSSyncUserDefaults, v5, v4, v6, v7);
    CFRelease(v8);
    return isBundleIdentifierInArray;
  }
  else
  {
    BDSCloudKitLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_227E5A908((uint64_t)a3, v11, v12, v13, v14, v15, v16, v17);

    return 0;
  }
}

+ (BOOL)_isServiceDisabledAlternative:(__CFString *)a3
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const void *v8;
  char isBundleIdentifierInArray;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = TCCAccessCopyBundleIdentifiersDisabledForService();
  if (v4)
  {
    v8 = (const void *)v4;
    isBundleIdentifierInArray = objc_msgSend__isBundleIdentifierInArray_(BDSSyncUserDefaults, v5, v4, v6, v7);
    CFRelease(v8);
    return isBundleIdentifierInArray;
  }
  else
  {
    BDSCloudKitLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_227E5A96C((uint64_t)a3, v11, v12, v13, v14, v15, v16, v17);

    return 1;
  }
}

+ (void)_setService:(__CFString *)a3 enabled:(BOOL)a4
{
  uint64_t v4;
  _BOOL4 v5;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  const __CFString *v11;
  int v12;
  __CFString *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v5 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__booksAppBundleIdentifier(a1, a2, (uint64_t)a3, a4, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = TCCAccessSetForBundleId();
  BDSCloudKitLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = CFSTR("NO");
      if (v5)
        v11 = CFSTR("YES");
      v12 = 138543618;
      v13 = a3;
      v14 = 2114;
      v15 = v11;
      _os_log_impl(&dword_227D4F000, v10, OS_LOG_TYPE_INFO, "Successfully set %{public}@ to %{public}@.", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    sub_227E5A9D0((uint64_t)a3, v5, v10);
  }

}

+ (id)_booksAppBundleIdentifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_bdsAppBundleIdentifier(BDSAppBundleIdentifier, a2, v2, v3, v4);
}

+ (id)_stateForLog
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  uint64_t isSignedIntoICloud;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t isCloudKitSyncOptedIn;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t isICloudDriveSyncOptedIn;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t isGlobalICloudDriveSyncOptedIn;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  void *v53;
  _QWORD v55[5];
  _QWORD v56[6];

  v56[5] = *MEMORY[0x24BDAC8D0];
  v55[0] = CFSTR("isSignedIntoICloud");
  v6 = (void *)MEMORY[0x24BDD16E0];
  isSignedIntoICloud = objc_msgSend_isSignedIntoICloud(a1, a2, v2, v3, v4);
  objc_msgSend_numberWithBool_(v6, v8, isSignedIntoICloud, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v11;
  v55[1] = CFSTR("isCloudKitSyncOptedIn");
  v12 = (void *)MEMORY[0x24BDD16E0];
  isCloudKitSyncOptedIn = objc_msgSend_isCloudKitSyncOptedIn(a1, v13, v14, v15, v16);
  objc_msgSend_numberWithBool_(v12, v18, isCloudKitSyncOptedIn, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v21;
  v55[2] = CFSTR("isICloudDriveSyncOptedIn");
  v22 = (void *)MEMORY[0x24BDD16E0];
  isICloudDriveSyncOptedIn = objc_msgSend_isICloudDriveSyncOptedIn(a1, v23, v24, v25, v26);
  objc_msgSend_numberWithBool_(v22, v28, isICloudDriveSyncOptedIn, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v31;
  v55[3] = CFSTR("isGlobalICloudDriveSyncOptedIn");
  v32 = (void *)MEMORY[0x24BDD16E0];
  isGlobalICloudDriveSyncOptedIn = objc_msgSend_isGlobalICloudDriveSyncOptedIn(a1, v33, v34, v35, v36);
  objc_msgSend_numberWithBool_(v32, v38, isGlobalICloudDriveSyncOptedIn, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v56[3] = v41;
  v55[4] = CFSTR("iCloudIdentityExists");
  v42 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_iCloudIdentity(a1, v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInt_(v42, v48, v47 != 0, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v56[4] = v51;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v52, (uint64_t)v56, (uint64_t)v55, 5);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  return v53;
}

@end
