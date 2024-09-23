@implementation CRBackGlassStatus

- (CRBackGlassStatus)init
{
  CRBackGlassStatus *v2;
  const char *v3;
  uint64_t v4;
  CRBackGlassStatus *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRBackGlassStatus;
  v2 = -[CRComponentAuth init](&v7, sel_init);
  v5 = v2;
  if (v2)
    objc_msgSend_setComponentName_(v2, v3, (uint64_t)CFSTR("BackGlass"), v4);
  return v5;
}

- (int64_t)copyComponentStatus
{
  uint64_t v2;
  void *v3;
  void *v4;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  int64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  char isEqualToSet;
  NSObject *v69;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint8_t buf[16];

  if ((objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, a2, (uint64_t)CFSTR("bCfg"), v2) & 1) != 0
    || objc_msgSend_isFDRDataClassSupported_(CRFDRBaseDeviceHandler, v6, (uint64_t)CFSTR("LCfg"), v7))
  {
    if (_os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0)
    {
      v11 = 0;
LABEL_28:
      v23 = -3;
      goto LABEL_29;
    }
    objc_msgSend_findUnsealedData(self, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_new();
    if ((objc_msgSend_deviceSupportsRepairBootIntent(v12, v13, v14, v15) & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(v11, v16, (uint64_t)CFSTR("bCfg"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {

        goto LABEL_12;
      }
      objc_msgSend_objectForKeyedSubscript_(v11, v19, (uint64_t)CFSTR("LCfg"), v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
LABEL_12:
        objc_msgSend__getObjectForKeyFromDefaults_(self, v21, (uint64_t)CFSTR("cachedPreFlightResults"), v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v25, v26, (uint64_t)CFSTR("failComponents"), v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_extractComponentsAndIdentifiers_(CRFDRUtils, v29, (uint64_t)v28, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_objectForKeyedSubscript_(v11, v32, (uint64_t)CFSTR("bCfg"), v33);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          v37 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend_objectForKeyedSubscript_(v11, v34, (uint64_t)CFSTR("bCfg"), v35);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setWithArray_(v37, v39, (uint64_t)v38, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend_objectForKeyedSubscript_(v31, v43, (uint64_t)CFSTR("bCfg"), v44);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setWithArray_(v42, v45, (uint64_t)v3, v46);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_isEqualToSet_(v41, v47, (uint64_t)v4, v48) & 1) != 0)
          {

LABEL_21:
            handleForCategory(0);
            v69 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_214503000, v69, OS_LOG_TYPE_DEFAULT, "component failed preflight proceeding", buf, 2u);
            }

            goto LABEL_24;
          }
          v71 = v41;
          v73 = v38;
        }
        objc_msgSend_objectForKeyedSubscript_(v11, v34, (uint64_t)CFSTR("LCfg"), v35, v71);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (v51)
        {
          v75 = v25;
          v52 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend_objectForKeyedSubscript_(v11, v49, (uint64_t)CFSTR("LCfg"), v50);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setWithArray_(v52, v54, (uint64_t)v53, v55);
          v56 = objc_claimAutoreleasedReturnValue();
          v57 = v31;
          v58 = (void *)v56;
          v59 = (void *)MEMORY[0x24BDBCF20];
          v74 = v57;
          objc_msgSend_objectForKeyedSubscript_(v57, v60, (uint64_t)CFSTR("LCfg"), v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setWithArray_(v59, v63, (uint64_t)v62, v64);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToSet = objc_msgSend_isEqualToSet_(v58, v66, (uint64_t)v65, v67);

          if (v36)
          {

          }
          v31 = v74;
          v25 = v75;
          if ((isEqualToSet & 1) != 0)
            goto LABEL_21;
        }
        else
        {

          if (v36)
          {

          }
        }

        goto LABEL_28;
      }
    }
    else
    {

    }
LABEL_24:
    v23 = 1;
    goto LABEL_29;
  }
  v11 = 0;
  v23 = 0;
LABEL_29:

  return v23;
}

@end
