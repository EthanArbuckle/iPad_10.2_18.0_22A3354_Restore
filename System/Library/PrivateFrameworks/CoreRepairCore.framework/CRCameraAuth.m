@implementation CRCameraAuth

- (CRCameraAuth)init
{
  CRCameraAuth *v2;
  const char *v3;
  uint64_t v4;
  CRCameraAuth *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRCameraAuth;
  v2 = -[CRComponentAuth init](&v7, sel_init);
  v5 = v2;
  if (v2)
    objc_msgSend_setComponentName_(v2, v3, (uint64_t)CFSTR("Camera"), v4);
  return v5;
}

- (int64_t)copyComponentStatus
{
  CRCameraAuth *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int64_t isEqualToString;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  int v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v3, (uint64_t)CFSTR("CmCl"), v4) & 1) != 0)
  {
    if (_os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0)
    {
      v5 = 0;
      v6 = 0;
LABEL_23:
      isEqualToString = -3;
      goto LABEL_25;
    }
    if (_os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0)
    {
      v5 = 0;
      v6 = 0;
    }
    else
    {
      objc_msgSend_findUnsealedData(v2, v8, v9, v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_opt_new();
      if ((objc_msgSend_deviceSupportsRepairBootIntent(v11, v12, v13, v14) & 1) != 0)
      {
        objc_msgSend_objectForKeyedSubscript_(v6, v15, (uint64_t)CFSTR("CmCl"), v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend__getObjectForKeyFromDefaults_(v2, v18, (uint64_t)CFSTR("cachedPreFlightResults"), v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v21, v22, (uint64_t)CFSTR("failComponents"), v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_extractComponentsAndIdentifiers_(CRFDRUtils, v25, (uint64_t)v24, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_objectForKeyedSubscript_(v6, v28, (uint64_t)CFSTR("CmCl"), v29);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v32)
            goto LABEL_22;
          v33 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend_objectForKeyedSubscript_(v6, v30, (uint64_t)CFSTR("CmCl"), v31);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setWithArray_(v33, v35, (uint64_t)v34, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend_objectForKeyedSubscript_(v27, v39, (uint64_t)CFSTR("CmCl"), v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setWithArray_(v38, v42, (uint64_t)v41, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v38) = objc_msgSend_isEqualToSet_(v37, v45, (uint64_t)v44, v46);

          if (!(_DWORD)v38)
          {
LABEL_22:

            v5 = 0;
            goto LABEL_23;
          }
          handleForCategory(0);
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v56) = 0;
            _os_log_impl(&dword_214503000, v47, OS_LOG_TYPE_DEFAULT, "component failed preflight proceeding", (uint8_t *)&v56, 2u);
          }

        }
      }
      else
      {

      }
      objc_msgSend_getCmClValidationStatus(v2, v18, v19, v20);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      handleForCategory(0);
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v56 = 138412290;
        v57 = v5;
        _os_log_impl(&dword_214503000, v48, OS_LOG_TYPE_DEFAULT, "FDR Validation status:%@", (uint8_t *)&v56, 0xCu);
      }

      if ((objc_msgSend_isEqualToString_(v5, v49, (uint64_t)CFSTR("Fail"), v50) & 1) == 0
        && (objc_msgSend_isEqualToString_(v5, v51, (uint64_t)CFSTR("Invalid"), v52) & 1) == 0)
      {
        isEqualToString = objc_msgSend_isEqualToString_(v5, v53, (uint64_t)CFSTR("Pass"), v54);
        goto LABEL_25;
      }
    }
    isEqualToString = -1;
  }
  else
  {
    v5 = 0;
    v6 = 0;
    isEqualToString = 1;
  }
LABEL_25:

  objc_sync_exit(v2);
  return isEqualToString;
}

- (BOOL)isComponentFailed
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  char isEqualToString;

  objc_msgSend_getCmClValidationStatus(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(v4, v5, (uint64_t)CFSTR("Fail"), v6) & 1) != 0)
    isEqualToString = 1;
  else
    isEqualToString = objc_msgSend_isEqualToString_(v4, v7, (uint64_t)CFSTR("Invalid"), v8);

  return isEqualToString;
}

- (id)getCmClValidationStatus
{
  uint64_t v2;
  uint64_t isFDRDataClassSupported;
  const char *v4;
  io_registry_entry_t v5;
  void *CFProperty;
  NSObject *v7;

  isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, a2, (uint64_t)CFSTR("CmCl"), v2);
  if (!(_DWORD)isFDRDataClassSupported)
  {
LABEL_7:
    CFProperty = 0;
    return CFProperty;
  }
  v5 = sub_2145149E0(isFDRDataClassSupported, v4);
  if (!v5)
  {
    handleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_214568AC0();

    goto LABEL_7;
  }
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v5, CFSTR("CmClValidationStatus"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  return CFProperty;
}

@end
