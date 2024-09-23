@implementation CRComponentAuth

- (CRComponentAuth)init
{
  CRComponentAuth *v2;
  const char *v3;
  uint64_t v4;
  CRComponentAuth *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRComponentAuth;
  v2 = -[CRComponentAuth init](&v7, sel_init);
  v5 = v2;
  if (v2)
    objc_msgSend_setComponentName_(v2, v3, 0, v4);
  return v5;
}

- (CRComponentAuth)initWithComponentName:(id)a3
{
  id v4;
  CRComponentAuth *v5;
  const char *v6;
  uint64_t v7;
  CRComponentAuth *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRComponentAuth;
  v5 = -[CRComponentAuth init](&v10, sel_init);
  v8 = v5;
  if (v5)
    objc_msgSend_setComponentName_(v5, v6, (uint64_t)v4, v7);

  return v8;
}

- (int64_t)copyComponentStatus
{
  return 0;
}

- (int64_t)getAuthCPComponentStatus:(id)a3
{
  int v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  int64_t v33;
  CRComponentAuth *v35;
  id v36;
  __CFArray *obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __CFArray *v42;
  uint8_t v43[128];
  uint8_t buf[4];
  __CFArray *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v35 = self;
  objc_sync_enter(v35);
  v42 = 0;
  v4 = sub_1D140C4D4(&v42);
  if (v4)
  {
    handleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1D140DA74(v4, v5);
  }
  else
  {
    handleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v45 = v42;
      _os_log_impl(&dword_1D1401000, v6, OS_LOG_TYPE_DEFAULT, "Components: %@", buf, 0xCu);
    }

    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v42;
    v8 = 0;
    v9 = 0;
    v5 = 0;
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v38, (uint64_t)v43, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v39;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v39 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v15);
          if (v16 && objc_msgSend_count(*(void **)(*((_QWORD *)&v38 + 1) + 8 * v15), v10, v11, v12))
          {
            objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v10, (uint64_t)"isTrustedForUI", v12);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v16, v18, (uint64_t)v17, v19);
            v20 = objc_claimAutoreleasedReturnValue();

            objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v21, (uint64_t)"ComponentName", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v16, v24, (uint64_t)v23, v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v27, (uint64_t)"AuthPassed", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v16, v30, (uint64_t)v29, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20 && v26 && objc_msgSend_isEqualToString_(v26, v10, (uint64_t)v36, v12))
            {
              v33 = objc_msgSend_convertIORegDataToStatus_authPass_(v35, v10, v20, (uint64_t)v32);

              v5 = v20;
              goto LABEL_22;
            }
            v8 = v26;
            v9 = v32;
            v5 = v20;
          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v38, (uint64_t)v43, 16);
        if (v13)
          continue;
        break;
      }
    }

  }
  v33 = 0;
LABEL_22:

  objc_sync_exit(v35);
  return v33;
}

- (int64_t)convertIORegDataToStatus:(id)a3 authPass:(id)a4
{
  if (!a3)
    return 0;
  if (objc_msgSend_intValue(a3, a2, (uint64_t)a3, (uint64_t)a4))
    return 1;
  return -1;
}

- (int64_t)synchronouslycopyAuthStatus
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v3 = dispatch_queue_create("com.apple.corerepair.authsyncqueue", MEMORY[0x1E0C80D50]);
  v7 = objc_msgSend_copyComponentStatus(self, v4, v5, v6);
  v13[3] = v7;
  if (!v7)
  {
    handleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_1D140DB10();

    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1D14080AC;
    v11[3] = &unk_1E92206C0;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v3, v11);
    if (!v13[3])
    {
      handleForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_1D140DAE4();

    }
    v7 = v13[3];
  }

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)isFirstAuthComplete
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_copyComponentStatus(self, a2, v2, v3) != 0;
}

- (BOOL)_checkForComponentFailureInDefaults:(id)a3
{
  id v3;
  uid_t v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  NSObject *v27;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = getuid();
  handleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1401000, v5, OS_LOG_TYPE_DEFAULT, "Reading system health from file", buf, 2u);
    }

    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v15, (uint64_t)CFSTR("/var/mobile/Library/Preferences/%@.plist"), v16, CFSTR("com.apple.mobilerepaird.systemhealth"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x1E0C99D80], v17, (uint64_t)v14, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v19;
    if (!v19
      || (objc_msgSend_objectForKey_(v19, v20, (uint64_t)v3, v21),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          v26 = objc_msgSend_BOOLValue(v22, v23, v24, v25),
          v22,
          !v26))
    {

      LOBYTE(v13) = 0;
      goto LABEL_16;
    }
    handleForCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v3;
      _os_log_impl(&dword_1D1401000, v27, OS_LOG_TYPE_DEFAULT, "Found failed component: %@", buf, 0xCu);
    }

LABEL_14:
    LOBYTE(v13) = 1;
LABEL_16:

    goto LABEL_17;
  }
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1401000, v5, OS_LOG_TYPE_DEFAULT, "Reading system health from defaults", buf, 2u);
  }

  v7 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v10 = (void *)objc_msgSend_initWithSuiteName_(v7, v8, (uint64_t)CFSTR("com.apple.mobilerepaird.systemhealth"), v9);
  LODWORD(v13) = objc_msgSend_BOOLForKey_(v10, v11, (uint64_t)v3, v12);

  if ((_DWORD)v13)
  {
    handleForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v3;
      _os_log_impl(&dword_1D1401000, v14, OS_LOG_TYPE_DEFAULT, "Found failed component: %@", buf, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_17:

  return (char)v13;
}

- (id)_getObjectForKeyFromDefaults:(id)a3
{
  id v3;
  uid_t v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  uint8_t buf[16];
  uint8_t v24[16];

  v3 = a3;
  v4 = getuid();
  handleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1401000, v5, OS_LOG_TYPE_DEFAULT, "Reading system health from defaults", buf, 2u);
    }

    v7 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v10 = (void *)objc_msgSend_initWithSuiteName_(v7, v8, (uint64_t)CFSTR("com.apple.mobilerepaird.systemhealth"), v9);
    objc_msgSend_objectForKey_(v10, v11, (uint64_t)v3, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1D1401000, v5, OS_LOG_TYPE_DEFAULT, "Reading system health from file", v24, 2u);
    }

    objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v14, (uint64_t)CFSTR("/var/mobile/Library/Preferences/%@.plist"), v15, CFSTR("com.apple.mobilerepaird.systemhealth"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x1E0C99D80], v16, (uint64_t)v10, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v18;
    if (v18)
    {
      objc_msgSend_objectForKey_(v18, v19, (uint64_t)v3, v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (id)findUnsealedData
{
  if (qword_1ED932160 != -1)
    dispatch_once(&qword_1ED932160, &unk_1E9220700);
  return (id)qword_1ED932168;
}

- (BOOL)isComponentFailed
{
  return 0;
}

- (NSString)componentName
{
  return self->componentName;
}

- (void)setComponentName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->componentName, 0);
}

@end
