@implementation CKDDeviceIDManager

- (id)_perServicelookupKeyForContainer:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_containerID(a3, a2, (uint64_t)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)deviceIdentifierForContainer:(id)a3 skipInMemoryCache:(BOOL)a4 createIfNecessary:(BOOL)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  id v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  id v24;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  BOOL v31;
  BOOL v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v8 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_1BE9BB180;
  v37 = sub_1BE9BAE68;
  v38 = 0;
  objc_msgSend_currentProcess(CKDDaemonProcess, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_processType(v11, v12, v13);

  if (v14 == 1)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend__serviceForContainer_(self, v15, (uint64_t)v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__perServicelookupKeyForContainer_(self, v18, (uint64_t)v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_queue(self, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1BE9C0DAC;
    v26[3] = &unk_1E7837188;
    v26[4] = self;
    v31 = a4;
    v27 = v8;
    v28 = v17;
    v29 = v19;
    v30 = &v33;
    v32 = a5;
    v23 = v19;
    v24 = v17;
    dispatch_sync(v22, v26);

    v16 = (id)v34[5];
  }
  _Block_object_dispose(&v33, 8);

  return v16;
}

- (id)deviceIdentifierForContainer:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_deviceIdentifierForContainer_skipInMemoryCache_createIfNecessary_, a3);
}

- (id)deviceIDsByContainerIdentifierInContainerEnvironment:(int64_t)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;

  objc_msgSend_deviceIDsByContainerIdentifierByContainerEnvironment(self, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v5, v8, (uint64_t)v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend_deviceIDsByContainerIdentifierByContainerEnvironment(self, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v13, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v12, v15, (uint64_t)v9, v14);

  }
  return v9;
}

- (NSMutableDictionary)deviceIDsByContainerIdentifierByContainerEnvironment
{
  return self->_deviceIDsByContainerIdentifierByContainerEnvironment;
}

- (id)_serviceForContainer:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = *MEMORY[0x1E0C95398];
  objc_msgSend_containerID(a3, a2, (uint64_t)a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_environment(v5, v6, v7);
  CKContainerEnvironmentString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v9, (uint64_t)CFSTR("%@.%@.%@"), v4, CFSTR("deviceIdentifier"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)sharedManager
{
  if (qword_1ED702B50 != -1)
    dispatch_once(&qword_1ED702B50, &unk_1E7837140);
  return (id)qword_1ED702B48;
}

- (id)initInternal
{
  CKDDeviceIDManager *v2;
  objc_class *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  NSMutableDictionary *deviceIDsByContainerIdentifierByContainerEnvironment;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CKDDeviceIDManager;
  v2 = -[CKDDeviceIDManager init](&v14, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (const char *)objc_msgSend_UTF8String(v4, v5, v6);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create(v7, v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    v11 = objc_opt_new();
    deviceIDsByContainerIdentifierByContainerEnvironment = v2->_deviceIDsByContainerIdentifierByContainerEnvironment;
    v2->_deviceIDsByContainerIdentifierByContainerEnvironment = (NSMutableDictionary *)v11;

  }
  return v2;
}

- (id)_globalService
{
  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("%@"), *MEMORY[0x1E0C95398]);
}

- (id)_savedDeviceIdentifierForService:(id)a3 lookupKey:(id)a4 success:(BOOL *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  char isSystemInstalledBinary;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  BOOL v23;
  __CFDictionary *Mutable;
  const void *v25;
  const char *v26;
  uint64_t v27;
  OSStatus v28;
  OSStatus v29;
  NSObject *v30;
  id v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  char v38;
  const char *v39;
  CFTypeRef result;
  uint8_t buf[4];
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend_currentProcess(CKDDaemonProcess, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  isSystemInstalledBinary = objc_msgSend_isSystemInstalledBinary(v12, v13, v14);

  if ((isSystemInstalledBinary & 1) == 0)
  {
    objc_msgSend_standardUserDefaults(MEMORY[0x1E0C99EA0], v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryForKey_(v18, v19, (uint64_t)v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v20, v21, (uint64_t)v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      v23 = 1;
      if (!a5)
        goto LABEL_22;
      goto LABEL_21;
    }
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6898], (const void *)*MEMORY[0x1E0C95398]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B58], v8);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68F8], v9);
  v25 = (const void *)*MEMORY[0x1E0C9AE50];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD7018], (const void *)*MEMORY[0x1E0C9AE50]);
  if (!*MEMORY[0x1E0C95280] || (objc_msgSend_useLegacyKeychain(self, v26, v27) & 1) == 0)
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70A8], v25);
  result = 0;
  v28 = SecItemCopyMatching(Mutable, &result);
  v23 = v28 == -25300 || v28 == 0;
  if (v28 != -25300)
  {
    v29 = v28;
    if (v28)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v30 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v43 = v29;
        _os_log_error_impl(&dword_1BE990000, v30, OS_LOG_TYPE_ERROR, "SecItemCopyMatching() failed: %ld", buf, 0xCu);
      }
    }
  }
  CFRelease(Mutable);
  if (!result)
  {
    v22 = 0;
    if (!a5)
      goto LABEL_22;
    goto LABEL_21;
  }
  v31 = objc_alloc(MEMORY[0x1E0CB3940]);
  v22 = (void *)objc_msgSend_initWithData_encoding_(v31, v32, (uint64_t)result, 4);
  CFRelease(result);
  objc_msgSend_currentProcess(CKDDaemonProcess, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend_isSystemInstalledBinary(v35, v36, v37);

  if ((v38 & 1) == 0)
    objc_msgSend__saveDeviceIdentifierToDefaults_forService_lookupKey_(self, v39, (uint64_t)v22, v8, v9);
  if (a5)
LABEL_21:
    *a5 = v23;
LABEL_22:

  return v22;
}

- (void)_saveDeviceIdentifierToDefaults:(id)a3 forService:(id)a4 lookupKey:(id)a5
{
  void *v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  id v26;

  v26 = a4;
  v7 = (void *)MEMORY[0x1E0C99EA0];
  v8 = a5;
  v9 = a3;
  objc_msgSend_standardUserDefaults(v7, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryForKey_(v12, v13, (uint64_t)v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend_mutableCopy(v14, v15, v16);
  v18 = v17;
  if (v17)
    v19 = v17;
  else
    v19 = (id)objc_opt_new();
  v20 = v19;

  objc_msgSend_setObject_forKeyedSubscript_(v20, v21, (uint64_t)v9, v8);
  objc_msgSend_standardUserDefaults(MEMORY[0x1E0C99EA0], v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v24, v25, (uint64_t)v20, v26);

}

- (__CFDictionary)createQueryForService:(id)a3 lookupKey:(id)a4 sysBound:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  __CFDictionary *Mutable;
  const char *v11;
  uint64_t v12;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6898], (const void *)*MEMORY[0x1E0C95398]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B58], v9);

  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68F8], v8);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD68A0], (const void *)*MEMORY[0x1E0CD68D0]);
  if (v5)
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD6B90], &unk_1E78B02F8);
  if (!*MEMORY[0x1E0C95280] || (objc_msgSend_useLegacyKeychain(self, v11, v12) & 1) == 0)
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0CD70A8], (const void *)*MEMORY[0x1E0C9AE50]);
  return Mutable;
}

- (void)_saveDeviceIdentifier:(id)a3 forService:(id)a4 lookupKey:(id)a5 sysBound:(BOOL)a6 success:(BOOL *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  const char *v15;
  __CFDictionary *QueryForService_lookupKey_sysBound;
  const char *v17;
  const void *v18;
  const void *v19;
  OSStatus v20;
  __CFDictionary *Mutable;
  const char *v22;
  uint64_t v23;
  BOOL v24;
  NSObject *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  int isSystemInstalledBinary;
  const char *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;

  v8 = a6;
  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  QueryForService_lookupKey_sysBound = (__CFDictionary *)objc_msgSend_createQueryForService_lookupKey_sysBound_(self, v15, (uint64_t)v13, v14, v8);
  v18 = (const void *)objc_msgSend_dataUsingEncoding_(v12, v17, 4);
  v19 = (const void *)*MEMORY[0x1E0CD70D8];
  CFDictionaryAddValue(QueryForService_lookupKey_sysBound, (const void *)*MEMORY[0x1E0CD70D8], v18);
  v20 = SecItemAdd(QueryForService_lookupKey_sysBound, 0);
  if (v20 == -25299)
  {
    CFDictionaryRemoveValue(QueryForService_lookupKey_sysBound, v19);
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFDictionaryAddValue(Mutable, v19, v18);
    v20 = SecItemUpdate(QueryForService_lookupKey_sysBound, Mutable);
    CFRelease(Mutable);
  }
  CFRelease(QueryForService_lookupKey_sysBound);
  v24 = v20 == 0;
  if (v20)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v25 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v31 = 134217984;
      v32 = v20;
      _os_log_error_impl(&dword_1BE990000, v25, OS_LOG_TYPE_ERROR, "SecItemAdd()/SecItemUpdate() failed: %ld", (uint8_t *)&v31, 0xCu);
    }
  }
  else
  {
    objc_msgSend_currentProcess(CKDDaemonProcess, v22, v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    isSystemInstalledBinary = objc_msgSend_isSystemInstalledBinary(v26, v27, v28);

    if ((isSystemInstalledBinary & 1) == 0)
      objc_msgSend__saveDeviceIdentifierToDefaults_forService_lookupKey_(self, v30, (uint64_t)v12, v13, v14);
  }
  if (a7)
    *a7 = v24;

}

- (void)_saveDeviceIdentifier:(id)a3 forContainer:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  const char *v9;
  void *v10;
  const char *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend__serviceForContainer_(self, v8, (uint64_t)v6);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__perServicelookupKeyForContainer_(self, v9, (uint64_t)v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__saveDeviceIdentifier_forService_lookupKey_sysBound_success_(self, v11, (uint64_t)v7, v12, v10, 0, 0);
}

- (void)_deleteDeviceIdentifierForContainer:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  const __CFDictionary *QueryForService_lookupKey_sysBound;
  OSStatus v11;
  OSStatus v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend__serviceForContainer_(self, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__perServicelookupKeyForContainer_(self, v7, (uint64_t)v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  QueryForService_lookupKey_sysBound = (const __CFDictionary *)objc_msgSend_createQueryForService_lookupKey_sysBound_(self, v9, (uint64_t)v6, v8, 0);
  v11 = SecItemDelete(QueryForService_lookupKey_sysBound);
  if (v11)
  {
    v12 = v11;
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v13 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v14 = 134217984;
      v15 = v12;
      _os_log_error_impl(&dword_1BE990000, v13, OS_LOG_TYPE_ERROR, "SecItemDelete() for device identifier failed: %ld", (uint8_t *)&v14, 0xCu);
    }
  }
  CFRelease(QueryForService_lookupKey_sysBound);

}

- (id)globalDeviceIdentifier
{
  return (id)MEMORY[0x1E0DE7D20](self, sel_globalDeviceIdentifierSkipInMemoryCache_createIfNecessary_, 0);
}

- (id)globalDeviceIdentifierSkipInMemoryCache:(BOOL)a3 createIfNecessary:(BOOL)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  _QWORD block[5];
  id v21;
  __CFString *v22;
  uint64_t *v23;
  BOOL v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = sub_1BE9BB180;
  v30 = sub_1BE9BAE68;
  v31 = 0;
  objc_msgSend_currentProcess(CKDDaemonProcess, a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_processType(v7, v8, v9);

  if (v10 == 1)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend__globalService(self, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_queue(self, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BEBEB284;
    block[3] = &unk_1E78371B0;
    v24 = a3;
    block[4] = self;
    v21 = v14;
    v22 = CFSTR("globalDeviceIdentifier");
    v23 = &v26;
    v25 = a4;
    v18 = v14;
    dispatch_sync(v17, block);

    v13 = (id)v27[5];
  }
  _Block_object_dispose(&v26, 8);

  return v13;
}

- (BOOL)useLegacyKeychain
{
  return self->_useLegacyKeychain;
}

- (void)setUseLegacyKeychain:(BOOL)a3
{
  self->_useLegacyKeychain = a3;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void)setDeviceIDsByContainerIdentifierByContainerEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIDsByContainerIdentifierByContainerEnvironment, a3);
}

- (NSString)globalDeviceID
{
  return self->_globalDeviceID;
}

- (void)setGlobalDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_globalDeviceID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_globalDeviceID, 0);
  objc_storeStrong((id *)&self->_deviceIDsByContainerIdentifierByContainerEnvironment, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
