@implementation CLSEntitlements

+ (id)entitlementsForCurrentTaskWithError:(id *)a3
{
  void *v5;
  char v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  id v16;
  const char *v17;
  void *v18;

  objc_msgSend_bundleRecordForCurrentProcess(MEMORY[0x1E0CA5898], a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CLSExecutableLinkedOnOrAfter_iOS17_5_macOS_14_5();
  if (v5 && (v6 & 1) != 0)
  {
    objc_opt_class();
    objc_opt_isKindOfClass();
    objc_msgSend_entitlements(v5, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allowedEntitlements(a1, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryOfObjectsForKeys_(v10, v14, (uint64_t)v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc((Class)a1);
    v18 = (void *)objc_msgSend_initWithEntitlements_(v16, v17, (uint64_t)v15);

  }
  else
  {
    objc_msgSend_entitlementsForNonAppCurrentTaskWithError_(a1, v7, (uint64_t)a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

+ (id)entitlementsForNonAppCurrentTaskWithError:(id *)a3
{
  SecTaskRef v5;
  const char *v6;
  SecTaskRef v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;

  v5 = SecTaskCreateFromSelf(0);
  if (v5)
  {
    v7 = v5;
    v8 = (void *)MEMORY[0x1D82573E4]();
    objc_msgSend_cls_appExtensionContainerBundleRecordForCurrentTask(MEMORY[0x1E0CA5898], v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_entitlements(v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v8);
    objc_msgSend_allowedEntitlements(a1, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryOfObjectsForKeys_(v14, v18, (uint64_t)v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_entitlementsWithSecTask_overrides_error_(a1, v20, (uint64_t)v7, v19, a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v7);

  }
  else
  {
    objc_msgSend_cls_assignError_code_description_(MEMORY[0x1E0CB35C8], v6, (uint64_t)a3, 100, CFSTR("Unable to retrieve current task for entitlement lookup."));
    v21 = 0;
  }
  return v21;
}

+ (id)entitlementsWithConnection:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  SecTaskRef v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  SecTaskRef v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  audit_token_t v29;

  v6 = a3;
  v9 = v6;
  if (v6)
    objc_msgSend_auditToken(v6, v7, v8);
  else
    memset(&v29, 0, sizeof(v29));
  v10 = SecTaskCreateWithAuditToken(0, &v29);
  if (v10)
  {
    v14 = v10;
    v15 = (void *)MEMORY[0x1D82573E4](v10, v11, v12, v13);
    objc_msgSend_cls_appExtensionContainerBundleRecordForConnection_(MEMORY[0x1E0CA5898], v16, (uint64_t)v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_entitlements(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v15);
    objc_msgSend_allowedEntitlements(a1, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryOfObjectsForKeys_(v20, v24, (uint64_t)v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_entitlementsWithSecTask_overrides_error_(a1, v26, (uint64_t)v14, v25, a4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v14);

  }
  else
  {
    objc_msgSend_cls_assignError_code_description_(MEMORY[0x1E0CB35C8], v11, (uint64_t)a4, 100, CFSTR("Unable to retrieve connection task for entitlement lookup."));
    v27 = 0;
  }

  return v27;
}

+ (id)entitlementsWithSecTask:(__SecTask *)a3 overrides:(id)a4 error:(id *)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const __CFArray *v14;
  CFDictionaryRef v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  CFErrorRef v20;
  const __CFArray *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  const char *v29;
  void *v30;
  id v31;
  const char *v32;
  void *v33;
  CFErrorRef v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  CFErrorRef error;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  error = 0;
  objc_msgSend_allowedEntitlements(a1, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v11, v12, v13);
  v14 = (const __CFArray *)objc_claimAutoreleasedReturnValue();

  v15 = SecTaskCopyValuesForEntitlements(a3, v14, &error);
  v18 = (void *)objc_msgSend_mutableCopy(v15, v16, v17);

  v20 = error;
  if (v18)
  {
    v35 = error;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v21 = v14;
    v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v36, v41, 16);
    if (v23)
    {
      v25 = v23;
      v26 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v37 != v26)
            objc_enumerationMutation(v21);
          v28 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend_objectForKeyedSubscript_(v8, v24, v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
            objc_msgSend_setObject_forKeyedSubscript_(v18, v29, (uint64_t)v30, v28);

        }
        v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v24, (uint64_t)&v36, v41, 16);
      }
      while (v25);
    }

    v31 = objc_alloc((Class)a1);
    v33 = (void *)objc_msgSend_initWithEntitlements_(v31, v32, (uint64_t)v18);
    v20 = v35;
  }
  else
  {
    objc_msgSend_cls_assignError_fromError_(MEMORY[0x1E0CB35C8], v19, (uint64_t)a5, error);
    v33 = 0;
  }

  return v33;
}

+ (id)allowedEntitlements
{
  void *v2;
  void *v3;
  const char *v4;
  void *v5;
  _QWORD v7[9];

  v7[8] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v7[0] = CFSTR("com.apple.private.ClassKit.register-dashboard");
  v7[1] = CFSTR("com.apple.private.ClassKit.dashboard");
  v7[2] = CFSTR("com.apple.private.ClassKit.search");
  v7[3] = CFSTR("com.apple.private.contacts");
  v7[4] = CFSTR("com.apple.private.contactsui");
  v7[5] = CFSTR("application-identifier");
  v7[6] = CFSTR("com.apple.private.ClassKit.internal");
  v7[7] = CFSTR("com.apple.developer.ClassKit-environment");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], a2, (uint64_t)v7, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v2, v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)isDashboardAppProcess
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D408A438;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB6B0 != -1)
    dispatch_once(&qword_1ED0FB6B0, block);
  return byte_1ED0FB6A8;
}

+ (BOOL)isInternalProcess
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D408A5F0;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB6B8 != -1)
    dispatch_once(&qword_1ED0FB6B8, block);
  return byte_1ED0FB6A9;
}

+ (BOOL)isSearchEnabledProcess
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D408A7AC;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB6C0 != -1)
    dispatch_once(&qword_1ED0FB6C0, block);
  return byte_1ED0FB6AA;
}

+ (BOOL)isPrivateSearchEnabledProcess
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1D408A9BC;
  block[3] = &unk_1E9749D50;
  block[4] = a1;
  if (qword_1ED0FB6C8 != -1)
    dispatch_once(&qword_1ED0FB6C8, block);
  return byte_1ED0FB6AB;
}

- (CLSEntitlements)init
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v8, (uint64_t)CFSTR("The method -[%@ %@] is not available."), v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_exceptionWithName_reason_userInfo_(v3, v10, v4, v9, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v11);
}

- (CLSEntitlements)initWithEntitlements:(id)a3
{
  id v4;
  CLSEntitlements *v5;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CLSEntitlements;
  v5 = -[CLSEntitlements init](&v27, sel_init);
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = (void *)objc_opt_class();
    objc_msgSend_allowedEntitlements(v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v23, v28, 16);
    if (v12)
    {
      v14 = v12;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v10);
          v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend_objectForKeyedSubscript_(v4, v13, v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend_setObject_forKeyedSubscript_(v6, v18, (uint64_t)v19, v17);

        }
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v23, v28, 16);
      }
      while (v14);
    }

    objc_storeStrong((id *)&v5->_entitlements, v6);
    objc_msgSend_objectForKeyedSubscript_(v4, v20, (uint64_t)CFSTR("application-identifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      CPCopyBundleIdentifierAndTeamFromApplicationIdentifier();

  }
  return v5;
}

- (NSString)classKitEnvironment
{
  void *v2;
  const char *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  id v11;
  id v13;
  _QWORD v14[2];
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  objc_msgSend_stringValueForEntitlement_error_(self, a2, (uint64_t)CFSTR("com.apple.developer.ClassKit-environment"), &v13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v4)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v5 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v16 = CFSTR("com.apple.developer.ClassKit-environment");
      v17 = 2114;
      v18 = v4;
      _os_log_impl(&dword_1D4054000, v5, OS_LOG_TYPE_INFO, "Failed to read %@ entitelment: %{public}@", buf, 0x16u);
    }
  }
  v6 = (void *)MEMORY[0x1E0C99E60];
  v14[0] = CFSTR("development");
  v14[1] = CFSTR("production");
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v3, (uint64_t)v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v6, v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 && objc_msgSend_containsObject_(v9, v10, (uint64_t)v2))
    v11 = v2;
  else
    v11 = 0;

  return (NSString *)v11;
}

- (BOOL)isPublicClassKitAPIEnabled
{
  uint64_t v2;
  void *v3;
  BOOL v4;

  objc_msgSend_classKitEnvironment(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isInternal
{
  char v2;
  id v3;
  NSObject *v4;
  id v6;
  uint8_t buf[4];
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v2 = objc_msgSend_BOOLValueForEntitlement_error_(self, a2, (uint64_t)CFSTR("com.apple.private.ClassKit.internal"), &v6);
  v3 = v6;
  if (v3)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v4 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v8 = CFSTR("com.apple.private.ClassKit.internal");
      _os_log_impl(&dword_1D4054000, v4, OS_LOG_TYPE_INFO, "failed to read %@ entitlement.", buf, 0xCu);
    }
  }

  return v2;
}

- (BOOL)isDashboardAPIEnabled
{
  char v2;
  id v3;
  NSObject *v4;
  id v6;
  uint8_t buf[4];
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v2 = objc_msgSend_BOOLValueForEntitlement_error_(self, a2, (uint64_t)CFSTR("com.apple.private.ClassKit.dashboard"), &v6);
  v3 = v6;
  if (v3)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v4 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v8 = CFSTR("com.apple.private.ClassKit.dashboard");
      _os_log_impl(&dword_1D4054000, v4, OS_LOG_TYPE_INFO, "failed to read %@ entitlement.", buf, 0xCu);
    }
  }

  return v2;
}

- (BOOL)isRegisterDashboardEnabled
{
  char v2;
  id v3;
  NSObject *v4;
  id v6;
  uint8_t buf[4];
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v2 = objc_msgSend_BOOLValueForEntitlement_error_(self, a2, (uint64_t)CFSTR("com.apple.private.ClassKit.register-dashboard"), &v6);
  v3 = v6;
  if (v3)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v4 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v8 = CFSTR("com.apple.private.ClassKit.register-dashboard");
      _os_log_impl(&dword_1D4054000, v4, OS_LOG_TYPE_INFO, "failed to read %@ entitlement.", buf, 0xCu);
    }
  }

  return v2;
}

- (BOOL)isSearchAPIEnabled
{
  uint64_t v2;
  const char *v4;
  char v5;
  char v6;
  id v7;
  const char *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v13;
  id v14;
  uint8_t buf[4];
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend_isPrivateSearchAPIEnabled(self, a2, v2) & 1) != 0)
    return 1;
  v14 = 0;
  v6 = objc_msgSend_BOOLValueForEntitlement_error_(self, v4, (uint64_t)CFSTR("com.apple.private.contacts"), &v14);
  v7 = v14;
  v9 = v7;
  if ((v6 & 1) != 0)
  {
    v5 = 1;
    if (!v7)
      return v5;
  }
  else
  {
    v13 = v7;
    v5 = objc_msgSend_BOOLValueForEntitlement_error_(self, v8, (uint64_t)CFSTR("com.apple.private.contactsui"), &v13);
    v10 = v13;

    v9 = v10;
    if (!v10)
      return v5;
  }
  if (qword_1ED0FB9A0 != -1)
    dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
  v11 = CLSLogDefault;
  if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v16 = CFSTR("searchAPI");
    _os_log_impl(&dword_1D4054000, v11, OS_LOG_TYPE_INFO, "failed to read %@ entitlement.", buf, 0xCu);
  }

  return v5;
}

- (BOOL)isPrivateSearchAPIEnabled
{
  char v2;
  id v3;
  NSObject *v4;
  id v6;
  uint8_t buf[4];
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v2 = objc_msgSend_BOOLValueForEntitlement_error_(self, a2, (uint64_t)CFSTR("com.apple.private.ClassKit.search"), &v6);
  v3 = v6;
  if (v3)
  {
    if (qword_1ED0FB9A0 != -1)
      dispatch_once(&qword_1ED0FB9A0, &unk_1E9749CD0);
    v4 = CLSLogDefault;
    if (os_log_type_enabled((os_log_t)CLSLogDefault, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v8 = CFSTR("searchAPI");
      _os_log_impl(&dword_1D4054000, v4, OS_LOG_TYPE_INFO, "failed to read %@ entitlement.", buf, 0xCu);
    }
  }

  return v2;
}

- (BOOL)hasEntitlement:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  BOOL v12;

  v4 = a3;
  if (objc_msgSend_length(v4, v5, v6))
  {
    objc_msgSend_entitlements(self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v9, v10, (uint64_t)v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11 != 0;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isInDevelopmentEnvironment
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const char *v8;
  char isEqualToString;

  objc_msgSend_classKitEnvironment(self, a2, v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend_classKitEnvironment(self, v4, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(CFSTR("development"), v8, (uint64_t)v7);

  }
  else
  {
    isEqualToString = 0;
  }

  return isEqualToString;
}

- (BOOL)BOOLValueForEntitlement:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  char v15;

  v6 = a3;
  if (objc_msgSend_hasEntitlement_(self, v7, (uint64_t)v6))
  {
    objc_msgSend_entitlements(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = objc_msgSend_BOOLValue(v12, v13, v14);
    }
    else
    {
      objc_msgSend_cls_assignError_code_format_(MEMORY[0x1E0CB35C8], v13, (uint64_t)a4, 4, CFSTR("Expected a BOOL value for entitlement: %@"), v6);
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)stringValueForEntitlement:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  id v14;

  v6 = a3;
  if (objc_msgSend_hasEntitlement_(self, v7, (uint64_t)v6))
  {
    objc_msgSend_entitlements(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v12;
    }
    else
    {
      objc_msgSend_cls_assignError_code_format_(MEMORY[0x1E0CB35C8], v13, (uint64_t)a4, 4, CFSTR("Expected a string value for entitlement: %@"), v6);
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (NSDictionary)entitlements
{
  return self->_entitlements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
}

@end
