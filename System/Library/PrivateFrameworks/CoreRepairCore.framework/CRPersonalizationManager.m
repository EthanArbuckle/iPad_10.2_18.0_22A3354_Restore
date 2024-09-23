@implementation CRPersonalizationManager

- (CRPersonalizationManager)init
{
  objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], (uint64_t)CFSTR("Use defaultManager or initWithAuthInstallObj instead of init."));

  return 0;
}

- (id)_init:(__AMAuthInstall *)a3
{
  CRPersonalizationManager *v4;
  CRPersonalizationManager *v5;
  NSDictionary *personalizationMap;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t BaseAMAIObject;
  CRPersonalizationElement *v11;
  const char *v12;
  void *v13;
  CRPersonalizationElement *v14;
  const char *v15;
  void *v16;
  CRPersonalizationElement *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  CRPersonalizationElement *v21;
  const char *v22;
  uint64_t v23;
  CRPersonalizationElement *v24;
  const char *v25;
  CRPersonalizationElement *v26;
  const char *v27;
  void *v28;
  CRPersonalizationElement *v29;
  const char *v30;
  uint64_t v31;
  CRPersonalizationElement *v32;
  const char *v33;
  void *v34;
  CRPersonalizationElement *v35;
  const char *v36;
  uint64_t v37;
  CRPersonalizationElement *v38;
  const char *v39;
  void *v40;
  CRPersonalizationElement *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  int v49;
  NSObject *p_super;
  NSObject *v51;
  CRPersonalizationManager *v52;
  NSObject *v53;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  objc_super v60;
  _QWORD v61[11];
  _QWORD v62[13];

  v62[11] = *MEMORY[0x24BDAC8D0];
  v60.receiver = self;
  v60.super_class = (Class)CRPersonalizationManager;
  v4 = -[CRPersonalizationManager init](&v60, sel_init);
  v5 = v4;
  if (v4)
  {
    personalizationMap = v4->personalizationMap;
    v4->personalizationMap = 0;

    if (a3)
    {
      v5->amai = a3;
    }
    else
    {
      BaseAMAIObject = objc_msgSend_createBaseAMAIObject(CRPersonalizationManager, v7, v8, v9);
      v5->amai = (__AMAuthInstall *)BaseAMAIObject;
      if (!BaseAMAIObject)
      {
        handleForCategory(0);
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          sub_21456C774();

        goto LABEL_29;
      }
    }
    v11 = [CRPersonalizationElement alloc];
    v13 = (void *)objc_msgSend_initWithID_param_requestFunction_responseFunction_(v11, v12, (uint64_t)CFSTR("trustObject"), 0, off_254D7AE68, off_254D7AE60);
    v14 = [CRPersonalizationElement alloc];
    v16 = (void *)objc_msgSend_initWithID_param_requestFunction_responseFunction_(v14, v15, (uint64_t)CFSTR("personalizedDiskImage"), (uint64_t)CFSTR("/private/var/mobile/RepairDiskImage/FactoryDiskImagePersonalized.dmg"), off_254D7AE80, off_254D7AE88);
    v17 = [CRPersonalizationElement alloc];
    v19 = objc_msgSend_initWithID_param_requestFunction_responseFunction_(v17, v18, (uint64_t)CFSTR("seacookie"), 0, off_254D7AED0, off_254D7AED8);
    v20 = (void *)v19;
    if (v13 && v16 && v19)
    {
      v57 = (void *)v19;
      v58 = v16;
      v59 = v13;
      v21 = [CRPersonalizationElement alloc];
      v23 = objc_msgSend_initWithID_param_requestFunction_responseFunction_(v21, v22, (uint64_t)CFSTR("veridianFirmware"), 0, off_254D7AE90, off_254D7AEA8);
      v24 = [CRPersonalizationElement alloc];
      v55 = (void *)objc_msgSend_initWithID_param_requestFunction_responseFunction_(v24, v25, (uint64_t)CFSTR("zenithSavageFirmware"), 0, off_254D7AEA0, off_254D7AEB0);
      v26 = [CRPersonalizationElement alloc];
      v28 = (void *)objc_msgSend_initWithID_param_requestFunction_responseFunction_(v26, v27, (uint64_t)CFSTR("zenithYonkersFirmware"), 0, off_254D7AEC0, off_254D7AEC8);
      v29 = [CRPersonalizationElement alloc];
      v31 = objc_msgSend_initWithID_param_requestFunction_responseFunction_(v29, v30, (uint64_t)CFSTR("ramdiskSavageFirmware"), 0, off_254D7AE98, off_254D7AEB0);
      v32 = [CRPersonalizationElement alloc];
      v34 = (void *)objc_msgSend_initWithID_param_requestFunction_responseFunction_(v32, v33, (uint64_t)CFSTR("ramdiskYonkersFirmware"), 0, off_254D7AEB8, off_254D7AEC8);
      v35 = [CRPersonalizationElement alloc];
      v37 = objc_msgSend_initWithID_param_requestFunction_responseFunction_(v35, v36, (uint64_t)CFSTR("brunorFirmware"), 0, off_254D7AEF8, off_254D7AEF0);
      v38 = [CRPersonalizationElement alloc];
      v40 = (void *)objc_msgSend_initWithID_param_requestFunction_responseFunction_(v38, v39, (uint64_t)CFSTR("lthTransfer"), 0, off_254D7AEE0, off_254D7AEE8);
      v41 = [CRPersonalizationElement alloc];
      v43 = objc_msgSend_initWithID_param_requestFunction_responseFunction_(v41, v42, (uint64_t)CFSTR("repairTicket"), 0, off_254D7AE78, off_254D7AE70);
      v45 = (void *)v43;
      v56 = v23;
      if (v23 && v55 && v28 && v31 && v34 && v37 && v40 && v43)
      {
        v61[0] = CFSTR("trustObject");
        v61[1] = CFSTR("personalizedDiskImage");
        v62[0] = v59;
        v62[1] = v58;
        v61[2] = CFSTR("veridianFirmware");
        v61[3] = CFSTR("zenithSavageFirmware");
        v62[2] = v23;
        v62[3] = v55;
        v61[4] = CFSTR("zenithYonkersFirmware");
        v61[5] = CFSTR("ramdiskSavageFirmware");
        v62[4] = v28;
        v62[5] = v31;
        v61[6] = CFSTR("ramdiskYonkersFirmware");
        v61[7] = CFSTR("brunorFirmware");
        v62[6] = v34;
        v62[7] = v37;
        v61[8] = CFSTR("lthTransfer");
        v61[9] = CFSTR("repairTicket");
        v62[8] = v40;
        v62[9] = v43;
        v61[10] = CFSTR("seacookie");
        v62[10] = v57;
        v46 = (void *)v37;
        objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v44, (uint64_t)v62, (uint64_t)v61, 11);
        v47 = objc_claimAutoreleasedReturnValue();
        v48 = (void *)v31;
        v49 = 0;
        p_super = &v5->personalizationMap->super;
        v5->personalizationMap = (NSDictionary *)v47;
      }
      else
      {
        v46 = (void *)v37;
        v48 = (void *)v31;
        handleForCategory(0);
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          sub_21456C7A0();
        v49 = 1;
      }

      v16 = v58;
      v13 = v59;
      v51 = v56;
      v20 = v57;
    }
    else
    {
      handleForCategory(0);
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        sub_21456C7A0();
      v49 = 1;
    }

    if (!v49)
      goto LABEL_25;
LABEL_29:
    v52 = 0;
    goto LABEL_30;
  }
LABEL_25:
  v52 = v5;
LABEL_30:

  return v52;
}

+ (id)defaultManager
{
  id v2;
  const char *v3;
  uint64_t v4;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend__init_(v2, v3, 0, v4);
}

+ (id)initWithAuthInstallObj:(__AMAuthInstall *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;

  v4 = objc_alloc((Class)a1);
  return (id)objc_msgSend__init_(v4, v5, (uint64_t)a3, v6);
}

- (BOOL)personalizeWithElements:(id)a3 error:(id *)a4
{
  id v5;
  CRPersonalizationManager *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  NSDictionary *personalizationMap;
  uint64_t v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  BOOL v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void (**v30)(_QWORD, _QWORD);
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  unsigned int v47;
  NSObject *v48;
  const char *v49;
  void *v50;
  NSObject *v51;
  const char *v52;
  id v53;
  NSObject *v54;
  const char *v55;
  void *v56;
  const char *v57;
  NSObject *v58;
  const char *v59;
  void *v60;
  const char *v61;
  BOOL v62;
  unsigned int PersonalizedResponse;
  id v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t j;
  NSDictionary *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  BOOL v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void (**v84)(_QWORD, _QWORD);
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  NSObject *v91;
  const char *v92;
  void *v93;
  const char *v94;
  void *v97;
  void *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  uint64_t v107;
  _BYTE v108[128];
  uint64_t v109;
  const __CFString *v110;
  uint64_t v111;
  const __CFString *v112;
  uint8_t buf[4];
  void *v114;
  uint64_t v115;
  const __CFString *v116;
  _BYTE v117[128];
  uint64_t v118;
  _QWORD v119[3];

  v119[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  v98 = (void *)objc_opt_new();
  v107 = 0;
  v97 = v5;
  if (!v5 || !objc_msgSend_count(v5, v7, v8, v9))
  {
    handleForCategory(0);
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      sub_21456C7CC();

    if (a4)
    {
      v56 = (void *)MEMORY[0x24BDD1540];
      v118 = *MEMORY[0x24BDD0FC8];
      v119[0] = CFSTR("Invalid CRPersonalizationElementIds");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v55, (uint64_t)v119, (uint64_t)&v118, 1);
      v51 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v56, v57, *MEMORY[0x24BEDA7C0], 1, v51);
      v53 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
LABEL_53:
    v62 = 0;
    goto LABEL_54;
  }
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v10 = v5;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v103, (uint64_t)v117, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v104;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v104 != v15)
          objc_enumerationMutation(v10);
        personalizationMap = v6->personalizationMap;
        if (personalizationMap)
        {
          v18 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * i);
          objc_msgSend_objectForKeyedSubscript_(personalizationMap, v12, v18, v13);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend_objectForKeyedSubscript_(v6->personalizationMap, v12, v18, v13);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_personalizationMeasurementCreator(v20, v21, v22, v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v24 == 0;

            if (!v25)
            {
              objc_msgSend_objectForKeyedSubscript_(v6->personalizationMap, v12, v18, v13);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_personalizationMeasurementCreator(v26, v27, v28, v29);
              v30 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v6->personalizationMap, v31, v18, v32);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_param(v33, v34, v35, v36);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, void *))v30)[2](v30, v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addEntriesFromDictionary_(v98, v39, (uint64_t)v38, v40);

            }
          }
        }
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v103, (uint64_t)v117, 16);
    }
    while (v14);
  }

  if (!v98 || !objc_msgSend_count(v98, v41, v42, v43))
  {
    handleForCategory(0);
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      sub_21456C7F8();

    if (a4)
    {
      v60 = (void *)MEMORY[0x24BDD1540];
      v115 = *MEMORY[0x24BDD0FC8];
      v116 = CFSTR("Invalid measurementDict");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v59, (uint64_t)&v116, (uint64_t)&v115, 1);
      v51 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v60, v61, *MEMORY[0x24BEDA7C0], 1, v51);
      v53 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
    goto LABEL_53;
  }
  handleForCategory(0);
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v114 = v98;
    _os_log_impl(&dword_214503000, v44, OS_LOG_TYPE_DEFAULT, "final measurement dict:%@", buf, 0xCu);
  }

  objc_msgSend_objectForKeyedSubscript_(v98, v45, *MEMORY[0x24BEDA818], v46);
  v47 = AMAuthInstallApImg4ServerRequestAddRequiredTags();
  if (!v47)
  {
    PersonalizedResponse = AMAuthInstallApCreatePersonalizedResponse();
    if (!PersonalizedResponse && v107)
    {
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      v64 = v10;
      v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v65, (uint64_t)&v99, (uint64_t)v108, 16);
      if (v68)
      {
        v69 = *(_QWORD *)v100;
        do
        {
          for (j = 0; j != v68; ++j)
          {
            if (*(_QWORD *)v100 != v69)
              objc_enumerationMutation(v64);
            v71 = v6->personalizationMap;
            if (v71)
            {
              v72 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * j);
              objc_msgSend_objectForKeyedSubscript_(v71, v66, v72, v67);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              if (v73)
              {
                objc_msgSend_objectForKeyedSubscript_(v6->personalizationMap, v66, v72, v67);
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_personalizationResponseParser(v74, v75, v76, v77);
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                v79 = v78 == 0;

                if (!v79)
                {
                  objc_msgSend_objectForKeyedSubscript_(v6->personalizationMap, v66, v72, v67);
                  v80 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_personalizationResponseParser(v80, v81, v82, v83);
                  v84 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                  v84[2](v84, v107);
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v6->personalizationMap, v86, v72, v87);
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setData_(v88, v89, (uint64_t)v85, v90);

                }
              }
            }
          }
          v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v66, (uint64_t)&v99, (uint64_t)v108, 16);
        }
        while (v68);
      }

      handleForCategory(0);
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_214503000, v51, OS_LOG_TYPE_DEFAULT, "PersonalizeWithElements Successful", buf, 2u);
      }
      v62 = 1;
      goto LABEL_32;
    }
    handleForCategory(0);
    v91 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      sub_21456C824();

    if (a4)
    {
      v93 = (void *)MEMORY[0x24BDD1540];
      v109 = *MEMORY[0x24BDD0FC8];
      v110 = CFSTR("Failed to create response dict");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v92, (uint64_t)&v110, (uint64_t)&v109, 1);
      v51 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v93, v94, *MEMORY[0x24BEDA7C0], PersonalizedResponse, v51);
      v53 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
    goto LABEL_53;
  }
  handleForCategory(0);
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    sub_21456C850();

  if (!a4)
    goto LABEL_53;
  v50 = (void *)MEMORY[0x24BDD1540];
  v111 = *MEMORY[0x24BDD0FC8];
  v112 = CFSTR("Failed to create request dict");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v49, (uint64_t)&v112, (uint64_t)&v111, 1);
  v51 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v50, v52, *MEMORY[0x24BEDA7C0], v47, v51);
  v53 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:
  v62 = 0;
  *a4 = v53;
LABEL_32:

LABEL_54:
  AMSupportSafeRelease();

  objc_sync_exit(v6);
  return v62;
}

- (BOOL)_personalizeWithElement:(id)a3 useCache:(BOOL)a4 parsedResponseData:(id *)a5 error:(id *)a6
{
  _BOOL4 v8;
  const char *v10;
  uint64_t v11;
  id v12;
  NSDictionary *personalizationMap;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  int v25;
  const char *v26;
  uint64_t v27;
  NSDictionary *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  BOOL v44;
  NSObject *v45;
  _QWORD v47[2];

  v8 = a4;
  v47[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  if (!v12 || !a5)
  {
    handleForCategory(0);
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      sub_21456C87C();

    goto LABEL_16;
  }
  if (!v8)
    goto LABEL_7;
  personalizationMap = self->personalizationMap;
  if (!personalizationMap)
    goto LABEL_7;
  objc_msgSend_objectForKeyedSubscript_(personalizationMap, v10, (uint64_t)v12, v11);
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_7;
  v16 = (void *)v14;
  objc_msgSend_objectForKeyedSubscript_(self->personalizationMap, v10, (uint64_t)v12, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
LABEL_7:
    v47[0] = v12;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v10, (uint64_t)v47, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_personalizeWithElements_error_(self, v24, (uint64_t)v23, (uint64_t)a6);

    if (v25)
    {
      v28 = self->personalizationMap;
      if (!v28)
        goto LABEL_12;
      objc_msgSend_objectForKeyedSubscript_(v28, v26, (uint64_t)v12, v27);
      v29 = objc_claimAutoreleasedReturnValue();
      if (!v29)
        goto LABEL_12;
      v32 = (void *)v29;
      objc_msgSend_objectForKeyedSubscript_(self->personalizationMap, v30, (uint64_t)v12, v31);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_data(v33, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v37)
        goto LABEL_12;
      goto LABEL_11;
    }
LABEL_16:
    v44 = 0;
    goto LABEL_17;
  }
LABEL_11:
  objc_msgSend_objectForKeyedSubscript_(self->personalizationMap, v10, (uint64_t)v12, v22);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = *a5;
  *a5 = v42;

LABEL_12:
  v44 = 1;
LABEL_17:

  return v44;
}

- (BOOL)getRemoteTrustObjectDigestWithExistedDigest:(id)a3 digestData:(id *)a4 error:(id *)a5
{
  NSDictionary *personalizationMap;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;

  personalizationMap = self->personalizationMap;
  v9 = a3;
  objc_msgSend_objectForKeyedSubscript_(personalizationMap, v10, (uint64_t)CFSTR("trustObject"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setParam_(v12, v13, (uint64_t)v9, v14);

  return objc_msgSend__personalizeWithElement_useCache_parsedResponseData_error_(self, v15, (uint64_t)CFSTR("trustObject"), 0, a4, a5);
}

- (BOOL)getPDIAPTicketUsingCache:(BOOL)a3 apTicketData:(id *)a4 error:(id *)a5
{
  return objc_msgSend__personalizeWithElement_useCache_parsedResponseData_error_(self, a2, (uint64_t)CFSTR("personalizedDiskImage"), a3, a4, a5);
}

- (BOOL)getBMUTicketForVeridianFWUpdateWithOptions:(id)a3 BMUTicket:(id *)a4 error:(id *)a5
{
  const char *v8;
  uint64_t v9;
  id v10;
  NSDictionary *personalizationMap;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  char v19;

  v10 = a3;
  if (v10
    && (personalizationMap = self->personalizationMap) != 0
    && (objc_msgSend_objectForKeyedSubscript_(personalizationMap, v8, (uint64_t)CFSTR("veridianFirmware"), v9),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    objc_msgSend_objectForKeyedSubscript_(self->personalizationMap, v13, (uint64_t)CFSTR("veridianFirmware"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setParam_(v15, v16, (uint64_t)v10, v17);

    v19 = objc_msgSend_personalizeVeridianWithError_parsedResponseData_(self, v18, (uint64_t)a5, (uint64_t)a4);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)getSavageTicketForSavageFWUpdateWithOptions:(id)a3 SavageTicket:(id *)a4 error:(id *)a5
{
  const char *v8;
  uint64_t v9;
  id v10;
  NSDictionary *personalizationMap;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  char v19;

  v10 = a3;
  if (v10
    && (personalizationMap = self->personalizationMap) != 0
    && (objc_msgSend_objectForKeyedSubscript_(personalizationMap, v8, (uint64_t)CFSTR("ramdiskSavageFirmware"), v9),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    objc_msgSend_objectForKeyedSubscript_(self->personalizationMap, v13, (uint64_t)CFSTR("ramdiskSavageFirmware"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setParam_(v15, v16, (uint64_t)v10, v17);

    v19 = objc_msgSend__personalizeWithElement_useCache_parsedResponseData_error_(self, v18, (uint64_t)CFSTR("ramdiskSavageFirmware"), 0, a4, a5);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)getYonkersTicketForYonkersFWUpdateWithOptions:(id)a3 YonkersTicket:(id *)a4 error:(id *)a5
{
  const char *v8;
  uint64_t v9;
  id v10;
  NSDictionary *personalizationMap;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  char v19;

  v10 = a3;
  if (v10
    && (personalizationMap = self->personalizationMap) != 0
    && (objc_msgSend_objectForKeyedSubscript_(personalizationMap, v8, (uint64_t)CFSTR("ramdiskYonkersFirmware"), v9),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    objc_msgSend_objectForKeyedSubscript_(self->personalizationMap, v13, (uint64_t)CFSTR("ramdiskYonkersFirmware"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setParam_(v15, v16, (uint64_t)v10, v17);

    v19 = objc_msgSend__personalizeWithElement_useCache_parsedResponseData_error_(self, v18, (uint64_t)CFSTR("ramdiskYonkersFirmware"), 0, a4, a5);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)getSavageTicketForZenithSavageFWUpdateWithOptions:(id)a3 SavageTicket:(id *)a4 error:(id *)a5
{
  const char *v8;
  uint64_t v9;
  id v10;
  NSDictionary *personalizationMap;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  char v19;

  v10 = a3;
  if (v10
    && (personalizationMap = self->personalizationMap) != 0
    && (objc_msgSend_objectForKeyedSubscript_(personalizationMap, v8, (uint64_t)CFSTR("zenithSavageFirmware"), v9),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    objc_msgSend_objectForKeyedSubscript_(self->personalizationMap, v13, (uint64_t)CFSTR("zenithSavageFirmware"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setParam_(v15, v16, (uint64_t)v10, v17);

    v19 = objc_msgSend__personalizeWithElement_useCache_parsedResponseData_error_(self, v18, (uint64_t)CFSTR("zenithSavageFirmware"), 0, a4, a5);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)getYonkersTicketForZenithYonkersFWUpdateWithOptions:(id)a3 YonkersTicket:(id *)a4 error:(id *)a5
{
  const char *v8;
  uint64_t v9;
  id v10;
  NSDictionary *personalizationMap;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  char v19;

  v10 = a3;
  if (v10
    && (personalizationMap = self->personalizationMap) != 0
    && (objc_msgSend_objectForKeyedSubscript_(personalizationMap, v8, (uint64_t)CFSTR("zenithYonkersFirmware"), v9),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    objc_msgSend_objectForKeyedSubscript_(self->personalizationMap, v13, (uint64_t)CFSTR("zenithYonkersFirmware"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setParam_(v15, v16, (uint64_t)v10, v17);

    v19 = objc_msgSend__personalizeWithElement_useCache_parsedResponseData_error_(self, v18, (uint64_t)CFSTR("zenithYonkersFirmware"), 0, a4, a5);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)getBrunorTicketForBrunorFWUpdateWithOptions:(id)a3 BrunorTicket:(id *)a4 auth:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  const char *v10;
  uint64_t v11;
  id v12;
  NSDictionary *personalizationMap;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  char v24;
  _QWORD v26[2];
  _QWORD v27[3];

  v7 = a5;
  v27[2] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  if (v12
    && (personalizationMap = self->personalizationMap) != 0
    && (objc_msgSend_objectForKeyedSubscript_(personalizationMap, v10, (uint64_t)CFSTR("brunorFirmware"), v11),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v14,
        v14))
  {
    v26[0] = CFSTR("updaterOptions");
    v26[1] = CFSTR("auth");
    v16 = MEMORY[0x24BDBD1C0];
    if (v7)
      v16 = MEMORY[0x24BDBD1C8];
    v27[0] = v12;
    v27[1] = v16;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v15, (uint64_t)v27, (uint64_t)v26, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(self->personalizationMap, v18, (uint64_t)CFSTR("brunorFirmware"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setParam_(v20, v21, (uint64_t)v17, v22);

    v24 = objc_msgSend__personalizeWithElement_useCache_parsedResponseData_error_(self, v23, (uint64_t)CFSTR("brunorFirmware"), 0, a4, a6);
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (BOOL)getApTicketForSeaCookiePairingWithOptions:(id)a3 pairingTicket:(id *)a4 error:(id *)a5
{
  const char *v8;
  uint64_t v9;
  id v10;
  NSDictionary *personalizationMap;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  char v19;

  v10 = a3;
  personalizationMap = self->personalizationMap;
  if (personalizationMap
    && (objc_msgSend_objectForKeyedSubscript_(personalizationMap, v8, (uint64_t)CFSTR("seacookie"), v9),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    objc_msgSend_objectForKeyedSubscript_(self->personalizationMap, v13, (uint64_t)CFSTR("seacookie"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setParam_(v15, v16, (uint64_t)v10, v17);

    v19 = objc_msgSend__personalizeWithElement_useCache_parsedResponseData_error_(self, v18, (uint64_t)CFSTR("seacookie"), 0, a4, a5);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (BOOL)getApTicketForLthTransferWithOptions:(id)a3 apTicketData:(id *)a4 error:(id *)a5
{
  const char *v8;
  uint64_t v9;
  id v10;
  NSDictionary *personalizationMap;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  char v19;

  v10 = a3;
  if (v10
    && (personalizationMap = self->personalizationMap) != 0
    && (objc_msgSend_objectForKeyedSubscript_(personalizationMap, v8, (uint64_t)CFSTR("lthTransfer"), v9),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v12))
  {
    objc_msgSend_objectForKeyedSubscript_(self->personalizationMap, v13, (uint64_t)CFSTR("lthTransfer"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setParam_(v15, v16, (uint64_t)v10, v17);

    v19 = objc_msgSend__personalizeWithElement_useCache_parsedResponseData_error_(self, v18, (uint64_t)CFSTR("lthTransfer"), 0, a4, a5);
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (__AMAuthInstall)getDefaultAMAuthInstallRef
{
  uint64_t v2;
  uint64_t v3;

  return (__AMAuthInstall *)objc_msgSend_createBaseAMAIObject(CRPersonalizationManager, a2, v2, v3);
}

+ (__AMAuthInstall)createBaseAMAIObject
{
  NSObject *v3;
  const __CFAllocator *v4;
  __AMAuthInstall *v5;
  CFURLRef v6;
  NSObject *v7;
  __CFDictionary *Mutable;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  NSObject *v15;
  void *v16;
  BOOL v17;
  id v18;
  const char *v19;
  uint64_t v20;
  const void *v21;
  const void *v22;
  const void *v23;
  const void *v24;
  const void *v25;
  const void *v26;
  const void *v27;
  const void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const void *v32;
  NSObject *v33;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint8_t buf[4];
  uint64_t LibraryVersionString;
  _OWORD v43[3];
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v44 = 0;
  memset(v43, 0, sizeof(v43));
  AMAuthInstallLogSetHandler();
  handleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    LibraryVersionString = AMAuthInstallSupportGetLibraryVersionString();
    _os_log_impl(&dword_214503000, v3, OS_LOG_TYPE_DEFAULT, "built from %@", buf, 0xCu);
  }

  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = (__AMAuthInstall *)AMAuthInstallCreate();
  if (!v5)
    goto LABEL_53;
  v6 = CFURLCreateWithString(v4, CFSTR("https://gs.apple.com:443"), 0);
  handleForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    LibraryVersionString = (uint64_t)v6;
    _os_log_impl(&dword_214503000, v7, OS_LOG_TYPE_DEFAULT, "using default signing server: %@", buf, 0xCu);
  }

  if (!v6)
  {
    handleForCategory(0);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_21456C8A8();

    goto LABEL_53;
  }
  if (AMAuthInstallSetSigningServerURL())
  {
    handleForCategory(0);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      sub_21456C99C((uint64_t)v6, v37);

    goto LABEL_53;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
LABEL_53:
    v16 = 0;
    goto LABEL_14;
  }
  v39 = MGCopyAnswer();
  v9 = MGCopyAnswer();
  v10 = MGCopyAnswer();
  v11 = MGCopyAnswer();
  v40 = MGCopyAnswer();
  v12 = MGCopyAnswer();
  v13 = img4_nonce_domain_copy_nonce();
  if (v13)
  {
    v14 = v13;
    handleForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_21456C92C(v14, v15);

LABEL_13:
    v16 = 0;
LABEL_14:
    v17 = 0;
    goto LABEL_40;
  }
  v18 = objc_alloc(MEMORY[0x24BDBCE50]);
  v20 = objc_msgSend_initWithBytes_length_(v18, v19, (uint64_t)v43 + 2, HIDWORD(v44));
  if (!v20)
  {
    handleForCategory(0);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      sub_21456C8D4();

    goto LABEL_13;
  }
  v16 = (void *)v20;
  v21 = (const void *)*MEMORY[0x24BDBD430];
  if (v10)
    v22 = (const void *)v10;
  else
    v22 = (const void *)*MEMORY[0x24BDBD430];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BEDA748], v22);
  if (v39)
    v23 = (const void *)v39;
  else
    v23 = v21;
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BEDA740], v23);
  if (v9)
    v24 = (const void *)v9;
  else
    v24 = v21;
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BEDA738], v24);
  if (v12)
    v25 = (const void *)v12;
  else
    v25 = &unk_24D1B7CB0;
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BEDA778], v25);
  if (v40)
    v26 = (const void *)v40;
  else
    v26 = v21;
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BEDA780], v26);
  if (v11)
    v27 = (const void *)v11;
  else
    v27 = v21;
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BEDA768], v27);
  v28 = (const void *)*MEMORY[0x24BDBD270];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BEDA790], (const void *)*MEMORY[0x24BDBD270]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BEDA730], v16);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BEDA770], v28);
  v32 = (const void *)objc_msgSend__copySikaFuse(a1, v29, v30, v31);
  if (v32)
  {
    handleForCategory(0);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      LibraryVersionString = (uint64_t)v32;
      _os_log_impl(&dword_214503000, v33, OS_LOG_TYPE_DEFAULT, "setting SiKA Fuse: %@", buf, 0xCu);
    }

    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BEDA788], v32);
  }
  if (AMAuthInstallApSetParameters())
  {
    handleForCategory(0);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      sub_21456C900();

    goto LABEL_14;
  }
  v17 = AMAuthInstallApImg4ForceServerSigning() == 0;
LABEL_40:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  if (!v17)
  {
    AMSupportSafeRelease();
    v5 = 0;
  }

  return v5;
}

- (BOOL)addCustomPersonalizationElementWithId:(id)a3 personalizationElement:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  int HasEntitlement;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSDictionary *v22;
  NSDictionary *personalizationMap;
  NSObject *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  NSObject *v30;
  const char *v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v13 = (void *)objc_msgSend_mutableCopy(self->personalizationMap, v10, v11, v12);
  v14 = (void *)objc_opt_new();
  HasEntitlement = objc_msgSend_currentProcessHasEntitlement_(v14, v15, (uint64_t)CFSTR("com.apple.corerepair.AllowPersonalizationOverride"), v16);

  if (HasEntitlement)
  {
    if (v8)
    {
      if (v9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend_setObject_forKeyedSubscript_(v13, v18, (uint64_t)v9, (uint64_t)v8);
            v22 = (NSDictionary *)objc_msgSend_copy(v13, v19, v20, v21);
            personalizationMap = self->personalizationMap;
            self->personalizationMap = v22;

            LOBYTE(a5) = 1;
            goto LABEL_16;
          }
        }
      }
    }
    handleForCategory(0);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_21456CA10();

    if (a5)
    {
      v32 = (void *)MEMORY[0x24BDD1540];
      v33 = *MEMORY[0x24BEDA7C0];
      v38 = *MEMORY[0x24BDD0FC8];
      v39[0] = CFSTR("Parameters Invalid");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v31, (uint64_t)v39, (uint64_t)&v38, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v32, v34, v33, 1, v28);
      goto LABEL_15;
    }
  }
  else
  {
    handleForCategory(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_21456CA3C();

    if (a5)
    {
      v26 = (void *)MEMORY[0x24BDD1540];
      v27 = *MEMORY[0x24BEDA7C0];
      v36 = *MEMORY[0x24BDD0FC8];
      v37 = CFSTR("Process is not entitled to perform addCustomPersonalizationElementWithId");
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v25, (uint64_t)&v37, (uint64_t)&v36, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_(v26, v29, v27, 14, v28);
LABEL_15:
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a5) = 0;
    }
  }
LABEL_16:

  return (char)a5;
}

+ (BOOL)IsTatsuErrorNetworkingRelated:(int64_t)a3
{
  BOOL result;

  result = 1;
  if ((unint64_t)a3 > 0x10 || ((1 << a3) & 0x11800) == 0)
    return a3 == 3099;
  return result;
}

- (BOOL)personalizeVeridianWithError:(id *)a3 parsedResponseData:(id *)a4
{
  CRPersonalizationManager *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSDictionary *personalizationMap;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void (**v24)(_QWORD, _QWORD);
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  unsigned int PersonalizedResponse;
  NSObject *v39;
  const char *v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v45;
  const __CFString *v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = self;
  objc_sync_enter(v5);
  v8 = (void *)objc_opt_new();
  personalizationMap = v5->personalizationMap;
  if (personalizationMap)
  {
    objc_msgSend_objectForKeyedSubscript_(personalizationMap, v6, (uint64_t)CFSTR("veridianFirmware"), v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend_objectForKeyedSubscript_(v5->personalizationMap, v10, (uint64_t)CFSTR("veridianFirmware"), v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_personalizationMeasurementCreator(v13, v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend_objectForKeyedSubscript_(v5->personalizationMap, v18, (uint64_t)CFSTR("veridianFirmware"), v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_personalizationMeasurementCreator(v20, v21, v22, v23);
        v24 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v5->personalizationMap, v25, (uint64_t)CFSTR("veridianFirmware"), v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_param(v27, v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v24)[2](v24, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addEntriesFromDictionary_(v8, v33, (uint64_t)v32, v34);

      }
    }
  }
  handleForCategory(0);
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v8;
    _os_log_impl(&dword_214503000, v35, OS_LOG_TYPE_DEFAULT, "final measurement dict:%@", buf, 0xCu);
  }

  objc_msgSend_objectForKeyedSubscript_(v8, v36, *MEMORY[0x24BEDA818], v37);
  PersonalizedResponse = AMAuthInstallApCreatePersonalizedResponse();
  handleForCategory(0);
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    sub_21456C824();

  if (a3)
  {
    v41 = (void *)MEMORY[0x24BDD1540];
    v45 = *MEMORY[0x24BDD0FC8];
    v46 = CFSTR("Failed to create response dict");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v40, (uint64_t)&v46, (uint64_t)&v45, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v41, v43, *MEMORY[0x24BEDA7C0], PersonalizedResponse, v42);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  AMSupportSafeRelease();

  objc_sync_exit(v5);
  return 0;
}

- (BOOL)getRepairTicket:(id *)a3 error:(id *)a4
{
  return objc_msgSend__personalizeWithElement_useCache_parsedResponseData_error_(self, a2, (uint64_t)CFSTR("repairTicket"), 0, a3, a4);
}

+ (BOOL)shouldPersonalizeWithSSOByDefault
{
  CRUserDefaults *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  char v9;

  if (!os_variant_has_internal_content())
    return 0;
  v2 = [CRUserDefaults alloc];
  v5 = (void *)objc_msgSend_initWithSuiteName_(v2, v3, (uint64_t)CFSTR("com.apple.corerepaird.test"), v4);
  if (!v5)
    return 0;
  v8 = v5;
  v9 = objc_msgSend_BOOLForKey_(v5, v6, (uint64_t)CFSTR("personalizeWithSSO"), v7);

  return v9;
}

+ (int)enableSSO:(__AMAuthInstall *)a3
{
  NSObject *v3;
  int v4;
  int v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  int v12;
  const char *v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  uint8_t v18[16];

  handleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_214503000, v3, OS_LOG_TYPE_DEFAULT, "Enabling SSO", v18, 2u);
  }

  if ((os_variant_has_internal_content() & 1) == 0)
  {
    handleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_21456CAEC();
    v15 = 0;
    goto LABEL_19;
  }
  v4 = AMAuthInstallSsoInitialize();
  if (v4)
  {
    v15 = v4;
    handleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_21456CAC0();
    goto LABEL_19;
  }
  v5 = AMAuthInstallSsoEnable();
  if (v5)
  {
    v15 = v5;
    handleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_21456CA94();
    goto LABEL_19;
  }
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_fileExistsAtPath_(v9, v10, (uint64_t)CFSTR("/var/MobileSoftwareUpdate/Controller/RepairServices/sso_token"), v11);

  if (!v12)
    return 0;
  objc_msgSend_dataWithContentsOfFile_(MEMORY[0x24BDBCE50], v13, (uint64_t)CFSTR("/var/MobileSoftwareUpdate/Controller/RepairServices/sso_token"), v14);
  v15 = AMAuthInstallSsoSetToken();
  if (v15)
  {
    handleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_21456CA68();
LABEL_19:

  }
  return v15;
}

+ (__CFNumber)_copySikaFuse
{
  io_registry_entry_t v2;
  io_object_t v3;
  const __CFAllocator *v4;
  const __CFData *CFProperty;
  const __CFData *v6;
  CFTypeID v7;
  const UInt8 *BytePtr;
  __CFNumber *v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v16[16];
  uint8_t buf[16];
  uint8_t v18[2];
  __int16 v19;

  v2 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B18], "IODeviceTree:/chosen");
  if (v2)
  {
    v3 = v2;
    v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v2, CFSTR("esdm-fuses"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (!CFProperty)
    {
      handleForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_214503000, v14, OS_LOG_TYPE_DEFAULT, "unable to lookup esdm-fuses property", buf, 2u);
      }

      v9 = 0;
      goto LABEL_18;
    }
    v6 = CFProperty;
    v7 = CFGetTypeID(CFProperty);
    if (v7 == CFDataGetTypeID())
    {
      BytePtr = CFDataGetBytePtr(v6);
      v9 = CFNumberCreate(v4, kCFNumberIntType, BytePtr);
      if (v9)
      {
LABEL_17:
        CFRelease(v6);
LABEL_18:
        IOObjectRelease(v3);
        return v9;
      }
      handleForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 0;
        v11 = "could not create CFNumber for esdm-fuses";
        v12 = (uint8_t *)&v19;
LABEL_15:
        _os_log_impl(&dword_214503000, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
      }
    }
    else
    {
      handleForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        v11 = "esdm-fuses property is not a CFData";
        v12 = v18;
        goto LABEL_15;
      }
    }

    v9 = 0;
    goto LABEL_17;
  }
  handleForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_214503000, v13, OS_LOG_TYPE_DEFAULT, "unable to find 'chosen' registry entry", v16, 2u);
  }

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->personalizationMap, 0);
}

@end
