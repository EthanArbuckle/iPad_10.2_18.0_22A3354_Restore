@implementation CREnclosureStatus

- (CREnclosureStatus)init
{
  CREnclosureStatus *v2;
  const char *v3;
  uint64_t v4;
  CREnclosureStatus *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CREnclosureStatus;
  v2 = -[CRComponentAuth init](&v7, sel_init);
  v5 = v2;
  if (v2)
    objc_msgSend_setComponentName_(v2, v3, (uint64_t)CFSTR("Enclosure"), v4);
  return v5;
}

- (int64_t)copyComponentStatus
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  int isEqualToSet;
  NSObject *v46;
  uint8_t v48[16];

  if (objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, a2, (uint64_t)CFSTR("NBCl"), v2))
  {
    if (_os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0)
    {
      v7 = 0;
LABEL_16:
      v8 = -3;
      goto LABEL_17;
    }
    objc_msgSend_findUnsealedData(self, v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_new();
    if ((objc_msgSend_deviceSupportsRepairBootIntent(v9, v10, v11, v12) & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(v7, v13, (uint64_t)CFSTR("NBCl"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend__getObjectForKeyFromDefaults_(self, v16, (uint64_t)CFSTR("cachedPreFlightResults"), v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)CFSTR("failComponents"), v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_extractComponentsAndIdentifiers_(CRFDRUtils, v22, (uint64_t)v21, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_objectForKeyedSubscript_(v7, v25, (uint64_t)CFSTR("NBCl"), v26);
        v27 = objc_claimAutoreleasedReturnValue();
        if (!v27)
          goto LABEL_15;
        v30 = (void *)v27;
        v31 = (void *)MEMORY[0x24BDBCF20];
        objc_msgSend_objectForKeyedSubscript_(v7, v28, (uint64_t)CFSTR("NBCl"), v29);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setWithArray_(v31, v33, (uint64_t)v32, v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)MEMORY[0x24BDBCF20];
        objc_msgSend_objectForKeyedSubscript_(v24, v37, (uint64_t)CFSTR("NBCl"), v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setWithArray_(v36, v40, (uint64_t)v39, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToSet = objc_msgSend_isEqualToSet_(v35, v43, (uint64_t)v42, v44);

        if (!isEqualToSet)
        {
LABEL_15:

          goto LABEL_16;
        }
        handleForCategory(0);
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v48 = 0;
          _os_log_impl(&dword_214503000, v46, OS_LOG_TYPE_DEFAULT, "component failed preflight proceeding", v48, 2u);
        }

      }
    }
    else
    {

    }
    v8 = 1;
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
LABEL_17:

  return v8;
}

@end
