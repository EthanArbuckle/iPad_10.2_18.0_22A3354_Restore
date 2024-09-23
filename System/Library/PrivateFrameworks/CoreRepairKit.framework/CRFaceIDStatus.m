@implementation CRFaceIDStatus

- (CRFaceIDStatus)init
{
  CRFaceIDStatus *v2;
  const char *v3;
  uint64_t v4;
  CRFaceIDStatus *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRFaceIDStatus;
  v2 = -[CRComponentAuth init](&v7, sel_init);
  v5 = v2;
  if (v2)
    objc_msgSend_setComponentName_(v2, v3, (uint64_t)CFSTR("FaceID"), v4);
  return v5;
}

- (int64_t)copyComponentStatus
{
  void *v2;
  int64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  char isEqualToSet;
  NSObject *v65;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint8_t buf[16];

  if (!MGGetBoolAnswer())
    return 0;
  if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0)
  {
    if (_os_feature_enabled_impl() && (_os_feature_enabled_impl() & 1) != 0)
      return -3;
    objc_msgSend_findUnsealedData(self, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_opt_new();
    if ((objc_msgSend_deviceSupportsRepairBootIntent(v9, v10, v11, v12) & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(v8, v13, (uint64_t)CFSTR("psd2"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {

        goto LABEL_14;
      }
      objc_msgSend_objectForKeyedSubscript_(v8, v16, (uint64_t)CFSTR("prpc"), v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
LABEL_14:
        objc_msgSend__getObjectForKeyFromDefaults_(self, v18, (uint64_t)CFSTR("cachedPreFlightResults"), v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v22, v23, (uint64_t)CFSTR("failComponents"), v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_extractComponentsAndIdentifiers_(CRFDRUtils, v26, (uint64_t)v25, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_objectForKeyedSubscript_(v8, v29, (uint64_t)CFSTR("psd2"), v30);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = (void *)0x1E0C99000;
        if (v33)
        {
          v35 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend_objectForKeyedSubscript_(v8, v31, (uint64_t)CFSTR("psd2"), v32);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setWithArray_(v35, v37, (uint64_t)v36, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend_objectForKeyedSubscript_(v28, v41, (uint64_t)CFSTR("psd2"), v42);
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setWithArray_(v40, v43, (uint64_t)v2, v44);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend_isEqualToSet_(v39, v45, (uint64_t)v34, v46) & 1) != 0)
          {

LABEL_23:
            handleForCategory();
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D1401000, v65, OS_LOG_TYPE_DEFAULT, "component failed preflight proceeding", buf, 2u);
            }

            goto LABEL_26;
          }
          v68 = v39;
          v69 = v36;
        }
        objc_msgSend_objectForKeyedSubscript_(v8, v31, (uint64_t)CFSTR("prpc"), v32);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (v49)
        {
          v67 = v2;
          v71 = v22;
          v50 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend_objectForKeyedSubscript_(v8, v47, (uint64_t)CFSTR("prpc"), v48);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setWithArray_(v50, v52, (uint64_t)v51, v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = (void *)MEMORY[0x1E0C99E60];
          v70 = v28;
          objc_msgSend_objectForKeyedSubscript_(v28, v56, (uint64_t)CFSTR("prpc"), v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setWithArray_(v55, v59, (uint64_t)v58, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToSet = objc_msgSend_isEqualToSet_(v54, v62, (uint64_t)v61, v63);

          if (v33)
          {

          }
          v28 = v70;
          v22 = v71;
          if ((isEqualToSet & 1) != 0)
            goto LABEL_23;
        }
        else
        {

          if (v33)
          {

          }
        }

        v4 = -3;
LABEL_32:

        return v4;
      }
    }
    else
    {

    }
LABEL_26:
    if (objc_msgSend_isComponentFailed(self, v18, v20, v19))
      v4 = -1;
    else
      v4 = 1;
    goto LABEL_32;
  }
  return -1;
}

- (BOOL)isComponentFailed
{
  uint64_t v2;
  uint64_t v3;
  CRFaceIDStatus *v4;
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
