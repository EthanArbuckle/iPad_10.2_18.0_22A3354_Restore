@implementation CRBatteryStatus

- (CRBatteryStatus)init
{
  CRBatteryStatus *v2;
  const char *v3;
  uint64_t v4;
  CRBatteryStatus *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRBatteryStatus;
  v2 = -[CRComponentAuth init](&v7, sel_init);
  v5 = v2;
  if (v2)
    objc_msgSend_setComponentName_(v2, v3, (uint64_t)CFSTR("Battery"), v4);
  return v5;
}

- (int64_t)copyComponentStatus
{
  uint64_t v2;
  void *v3;
  const char *v5;
  uint64_t v6;
  int64_t AuthCPComponentStatus;
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
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
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
  void *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  char isEqualToSet;
  NSObject *v67;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  uint8_t buf[16];

  if ((objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E0D18308], a2, (uint64_t)CFSTR("bcrt"), v2) & 1) == 0
    && !objc_msgSend_isFDRDataClassSupported_(MEMORY[0x1E0D18308], v5, (uint64_t)CFSTR("vcrt"), v6))
  {
    return 0;
  }
  if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0)
  {
    if (_os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0)
      return -1;
    objc_msgSend_findUnsealedData(self, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_new();
    if ((objc_msgSend_deviceSupportsRepairBootIntent(v12, v13, v14, v15) & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(v11, v16, (uint64_t)CFSTR("bcrt"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {

        goto LABEL_15;
      }
      objc_msgSend_objectForKeyedSubscript_(v11, v19, (uint64_t)CFSTR("vcrt"), v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
LABEL_15:
        objc_msgSend__getObjectForKeyFromDefaults_(self, v21, (uint64_t)CFSTR("cachedPreFlightResults"), v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v24, v25, (uint64_t)CFSTR("failComponents"), v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_extractComponentsAndIdentifiers_(CRFDRUtils, v28, (uint64_t)v27, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_objectForKeyedSubscript_(v11, v31, (uint64_t)CFSTR("bcrt"), v32);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)0x1E0C99000;
        if (v35)
        {
          v37 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend_objectForKeyedSubscript_(v11, v33, (uint64_t)CFSTR("bcrt"), v34);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setWithArray_(v37, v39, (uint64_t)v38, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend_objectForKeyedSubscript_(v30, v43, (uint64_t)CFSTR("bcrt"), v44);
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setWithArray_(v42, v45, (uint64_t)v3, v46);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_isEqualToSet_(v41, v47, (uint64_t)v36, v48) & 1) != 0)
          {

LABEL_24:
            handleForCategory();
            v67 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1401000, v67, OS_LOG_TYPE_DEFAULT, "component failed preflight proceeding", buf, 2u);
            }

            goto LABEL_27;
          }
          v70 = v41;
          v71 = v38;
        }
        objc_msgSend_objectForKeyedSubscript_(v11, v33, (uint64_t)CFSTR("vcrt"), v34);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (v51)
        {
          v69 = v3;
          v73 = v24;
          v52 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend_objectForKeyedSubscript_(v11, v49, (uint64_t)CFSTR("vcrt"), v50);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setWithArray_(v52, v54, (uint64_t)v53, v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = (void *)MEMORY[0x1E0C99E60];
          v72 = v30;
          objc_msgSend_objectForKeyedSubscript_(v30, v58, (uint64_t)CFSTR("vcrt"), v59);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setWithArray_(v57, v61, (uint64_t)v60, v62);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToSet = objc_msgSend_isEqualToSet_(v56, v64, (uint64_t)v63, v65);

          if (v35)
          {

          }
          v30 = v72;
          v24 = v73;
          if ((isEqualToSet & 1) != 0)
            goto LABEL_24;
        }
        else
        {

          if (v35)
          {

          }
        }

        AuthCPComponentStatus = -3;
        goto LABEL_31;
      }
    }
    else
    {

    }
LABEL_27:
    AuthCPComponentStatus = objc_msgSend_getAuthCPComponentStatus_(self, v21, (uint64_t)CFSTR("Battery"), v22);
LABEL_31:

    return AuthCPComponentStatus;
  }
  return -3;
}

- (BOOL)isComponentFailed
{
  uint64_t v2;

  return objc_msgSend_getAuthCPComponentStatus_(self, a2, (uint64_t)CFSTR("Battery"), v2) == -1;
}

@end
