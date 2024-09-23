@implementation CRTouchIDStatus

- (CRTouchIDStatus)init
{
  CRTouchIDStatus *v2;
  const char *v3;
  uint64_t v4;
  CRTouchIDStatus *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRTouchIDStatus;
  v2 = -[CRComponentAuth init](&v7, sel_init);
  v5 = v2;
  if (v2)
    objc_msgSend_setComponentName_(v2, v3, (uint64_t)CFSTR("TouchID"), v4);
  return v5;
}

- (int64_t)copyComponentStatus
{
  int64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  int isEqualToSet;
  NSObject *v45;
  uint8_t v47[16];

  if (!MGGetBoolAnswer())
    return 0;
  if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0)
  {
    if (_os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0)
      return -3;
    objc_msgSend_findUnsealedData(self, v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    if ((objc_msgSend_deviceSupportsRepairBootIntent(v8, v9, v10, v11) & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(v7, v12, (uint64_t)CFSTR("MSRk"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_17;
      objc_msgSend__getObjectForKeyFromDefaults_(self, v15, (uint64_t)CFSTR("cachedPreFlightResults"), v17);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v8, v18, (uint64_t)CFSTR("failComponents"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_extractComponentsAndIdentifiers_(CRFDRUtils, v21, (uint64_t)v20, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_objectForKeyedSubscript_(v7, v24, (uint64_t)CFSTR("MSRk"), v25);
      v26 = objc_claimAutoreleasedReturnValue();
      if (!v26)
        goto LABEL_20;
      v29 = (void *)v26;
      v30 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend_objectForKeyedSubscript_(v7, v27, (uint64_t)CFSTR("MSRk"), v28);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setWithArray_(v30, v32, (uint64_t)v31, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend_objectForKeyedSubscript_(v23, v36, (uint64_t)CFSTR("MSRk"), v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setWithArray_(v35, v39, (uint64_t)v38, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToSet = objc_msgSend_isEqualToSet_(v34, v42, (uint64_t)v41, v43);

      if (!isEqualToSet)
      {
LABEL_20:

        v3 = -3;
LABEL_21:

        return v3;
      }
      handleForCategory();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v47 = 0;
        _os_log_impl(&dword_1D1401000, v45, OS_LOG_TYPE_DEFAULT, "component failed preflight proceeding", v47, 2u);
      }

    }
LABEL_17:
    if (objc_msgSend_isComponentFailed(self, v15, v16, v17))
      v3 = -1;
    else
      v3 = 1;
    goto LABEL_21;
  }
  return -1;
}

- (BOOL)isComponentFailed
{
  uint64_t v2;
  uint64_t v3;
  CRTouchIDStatus *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;

  v4 = self;
  objc_msgSend_componentName(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingString_(v5, v6, (uint64_t)CFSTR("Failed"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend__checkForComponentFailureInDefaults_(v4, v9, (uint64_t)v8, v10);

  return (char)v4;
}

@end
