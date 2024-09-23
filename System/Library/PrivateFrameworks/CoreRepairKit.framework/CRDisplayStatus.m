@implementation CRDisplayStatus

- (CRDisplayStatus)init
{
  CRDisplayStatus *v2;
  const char *v3;
  uint64_t v4;
  CRDisplayStatus *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRDisplayStatus;
  v2 = -[CRComponentAuth init](&v7, sel_init);
  v5 = v2;
  if (v2)
    objc_msgSend_setComponentName_(v2, v3, (uint64_t)CFSTR("Display"), v4);
  return v5;
}

- (int64_t)copyComponentStatus
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  int isFDRDataClassSupported;
  const char *v8;
  uint64_t v9;
  int v10;
  void *v11;
  int64_t AuthCPComponentStatus;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  char isEqualToSet;
  NSObject *v70;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint8_t buf[16];

  isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E0D18308], a2, (uint64_t)CFSTR("tcrt"), v2);
  v10 = objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E0D18308], v8, (uint64_t)CFSTR("dCfg"), v9);
  if ((isFDRDataClassSupported & 1) != 0 || v10)
  {
    if (_os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0)
    {
      v11 = 0;
LABEL_34:
      AuthCPComponentStatus = -3;
      goto LABEL_35;
    }
    if (isFDRDataClassSupported && _os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0)
    {
      v11 = 0;
      AuthCPComponentStatus = -1;
      goto LABEL_35;
    }
    objc_msgSend_findUnsealedData(self, v13, v14, v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_opt_new();
    if ((objc_msgSend_deviceSupportsRepairBootIntent(v16, v17, v18, v19) & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(v11, v20, (uint64_t)CFSTR("tcrt"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {

        goto LABEL_18;
      }
      objc_msgSend_objectForKeyedSubscript_(v11, v23, (uint64_t)CFSTR("dCfg"), v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
LABEL_18:
        objc_msgSend__getObjectForKeyFromDefaults_(self, v25, (uint64_t)CFSTR("cachedPreFlightResults"), v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v28, v29, (uint64_t)CFSTR("failComponents"), v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_extractComponentsAndIdentifiers_(CRFDRUtils, v32, (uint64_t)v31, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_objectForKeyedSubscript_(v11, v35, (uint64_t)CFSTR("tcrt"), v36);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        if (v77)
        {
          v39 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend_objectForKeyedSubscript_(v11, v37, (uint64_t)CFSTR("tcrt"), v38);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setWithArray_(v39, v40, (uint64_t)v5, v41);
          v42 = objc_claimAutoreleasedReturnValue();
          v43 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend_objectForKeyedSubscript_(v34, v44, (uint64_t)CFSTR("tcrt"), v45);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v43;
          v47 = (void *)v42;
          objc_msgSend_setWithArray_(v46, v48, (uint64_t)v3, v49);
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_isEqualToSet_(v47, v50, (uint64_t)v4, v51) & 1) != 0)
          {

            goto LABEL_27;
          }
          v75 = v47;
        }
        objc_msgSend_objectForKeyedSubscript_(v11, v37, (uint64_t)CFSTR("dCfg"), v38);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (v54)
        {
          v72 = v4;
          v73 = v3;
          v74 = v5;
          v76 = v28;
          v55 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend_objectForKeyedSubscript_(v11, v52, (uint64_t)CFSTR("dCfg"), v53);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setWithArray_(v55, v57, (uint64_t)v56, v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend_objectForKeyedSubscript_(v34, v61, (uint64_t)CFSTR("dCfg"), v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setWithArray_(v60, v64, (uint64_t)v63, v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToSet = objc_msgSend_isEqualToSet_(v59, v67, (uint64_t)v66, v68);

          if (v77)
          {

          }
          v28 = v76;
          if ((isEqualToSet & 1) != 0)
          {
LABEL_27:
            handleForCategory();
            v70 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1401000, v70, OS_LOG_TYPE_DEFAULT, "component failed preflight proceeding", buf, 2u);
            }

            if ((isFDRDataClassSupported & 1) == 0)
              goto LABEL_30;
            goto LABEL_16;
          }
        }
        else
        {

          if (v77)
          {

          }
        }

        goto LABEL_34;
      }
    }
    else
    {

    }
    if (!isFDRDataClassSupported)
    {
LABEL_30:
      AuthCPComponentStatus = 1;
      goto LABEL_35;
    }
LABEL_16:
    AuthCPComponentStatus = objc_msgSend_getAuthCPComponentStatus_(self, v25, (uint64_t)CFSTR("TouchController"), v26);
    goto LABEL_35;
  }
  v11 = 0;
  AuthCPComponentStatus = 0;
LABEL_35:

  return AuthCPComponentStatus;
}

- (BOOL)isComponentFailed
{
  uint64_t v2;
  int isFDRDataClassSupported;
  const char *v5;
  uint64_t v6;

  isFDRDataClassSupported = objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E0D18308], a2, (uint64_t)CFSTR("tcrt"), v2);
  if (isFDRDataClassSupported)
    LOBYTE(isFDRDataClassSupported) = objc_msgSend_getAuthCPComponentStatus_(self, v5, (uint64_t)CFSTR("TouchController"), v6) == -1;
  return isFDRDataClassSupported;
}

@end
