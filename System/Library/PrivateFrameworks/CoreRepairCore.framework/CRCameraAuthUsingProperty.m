@implementation CRCameraAuthUsingProperty

- (CRCameraAuthUsingProperty)init
{
  CRCameraAuthUsingProperty *v2;
  const char *v3;
  uint64_t v4;
  CRCameraAuthUsingProperty *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRCameraAuthUsingProperty;
  v2 = -[CRComponentAuth init](&v7, sel_init);
  v5 = v2;
  if (v2)
    objc_msgSend_setComponentName_(v2, v3, (uint64_t)CFSTR("Camera"), v4);
  return v5;
}

- (int64_t)copyComponentStatus
{
  CRCameraAuthUsingProperty *v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
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
  NSObject *v44;
  uint8_t v46[16];

  v2 = self;
  objc_sync_enter(v2);
  if ((objc_msgSend_isFDRPropertySupported_(CRFDRBaseDeviceHandler, v3, (uint64_t)CFSTR("RCSn"), v4) & 1) != 0)
  {
    if (_os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0)
    {
      v8 = 0;
LABEL_16:
      v9 = -3;
      goto LABEL_17;
    }
    objc_msgSend_findUnsealedData(v2, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    if ((objc_msgSend_deviceSupportsRepairBootIntent(v10, v11, v12, v13) & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(v8, v14, (uint64_t)CFSTR("RCSn"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
LABEL_14:
        v9 = 1;
        goto LABEL_17;
      }
      objc_msgSend__getObjectForKeyFromDefaults_(v2, v17, (uint64_t)CFSTR("cachedPreFlightResults"), v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v10, v19, (uint64_t)CFSTR("failComponents"), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_extractComponentsAndIdentifiers_(CRFDRUtils, v22, (uint64_t)v21, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_objectForKeyedSubscript_(v8, v25, (uint64_t)CFSTR("RCSn"), v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v29)
        goto LABEL_15;
      v30 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend_objectForKeyedSubscript_(v8, v27, (uint64_t)CFSTR("RCSn"), v28);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setWithArray_(v30, v32, (uint64_t)v31, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend_objectForKeyedSubscript_(v24, v36, (uint64_t)CFSTR("RCSn"), v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setWithArray_(v35, v39, (uint64_t)v38, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v35) = objc_msgSend_isEqualToSet_(v34, v42, (uint64_t)v41, v43);

      if (!(_DWORD)v35)
      {
LABEL_15:

        goto LABEL_16;
      }
      handleForCategory(0);
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v46 = 0;
        _os_log_impl(&dword_214503000, v44, OS_LOG_TYPE_DEFAULT, "component failed preflight proceeding", v46, 2u);
      }

    }
    goto LABEL_14;
  }
  v8 = 0;
  v9 = 0;
LABEL_17:

  objc_sync_exit(v2);
  return v9;
}

@end
