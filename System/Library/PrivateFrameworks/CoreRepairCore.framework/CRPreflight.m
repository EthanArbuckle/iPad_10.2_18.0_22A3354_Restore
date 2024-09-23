@implementation CRPreflight

- (void)queryRepairDeltaWithReply:(id)a3
{
  void (**v3)(id, uint64_t, void *, void *);
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  void *v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  void *v53;
  void *v54;
  void (**v55)(id, uint64_t, void *, void *);
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[3];
  _QWORD v72[3];
  uint8_t v73[128];
  uint8_t buf[4];
  const char *v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  void *v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, uint64_t, void *, void *))a3;
  v4 = (void *)objc_opt_new();
  v68 = 0;
  objc_msgSend_findUnsealedDataWithError_(CRFDRUtils, v5, (uint64_t)&v68, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v68;
  v12 = v8;
  if (v7)
    v13 = v8 == 0;
  else
    v13 = 0;
  v14 = v13;
  if (v13)
  {
    if (objc_msgSend_count(v7, v9, v10, v11))
    {
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v44 = v7;
      v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v15, (uint64_t)&v64, (uint64_t)v80, 16);
      if (v58)
      {
        v52 = v14;
        v53 = v12;
        v54 = v7;
        v55 = v3;
        v56 = *(_QWORD *)v65;
        v57 = v44;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v65 != v56)
              objc_enumerationMutation(v44);
            v59 = v18;
            v19 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v18);
            objc_msgSend_objectForKeyedSubscript_(v44, v16, v19, v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)AMFDRSealingMapCopyAssemblyIdentifierForClass();
            handleForCategory(0);
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              v75 = "-[CRPreflight queryRepairDeltaWithReply:]";
              v76 = 2112;
              v77 = v19;
              v78 = 2112;
              v79 = v21;
              _os_log_debug_impl(&dword_214503000, v22, OS_LOG_TYPE_DEBUG, "%s: key: %@, asid: %@", buf, 0x20u);
            }

            v62 = 0u;
            v63 = 0u;
            v60 = 0u;
            v61 = 0u;
            v23 = v20;
            v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v60, (uint64_t)v73, 16);
            if (v25)
            {
              v28 = v25;
              v29 = *(_QWORD *)v61;
              do
              {
                for (i = 0; i != v28; ++i)
                {
                  if (*(_QWORD *)v61 != v29)
                    objc_enumerationMutation(v23);
                  objc_msgSend_dataUsingEncoding_(*(void **)(*((_QWORD *)&v60 + 1) + 8 * i), v26, 4, v27);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_base64EncodedStringWithOptions_(v31, v32, 0, v33);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v21)
                  {
                    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v21, v35, (uint64_t)CFSTR("-"), (uint64_t)CFSTR(","));
                    v36 = objc_claimAutoreleasedReturnValue();
                    v38 = (void *)v36;
                    if (v36)
                    {
                      v71[0] = CFSTR("key");
                      v71[1] = CFSTR("identifier");
                      v72[0] = v19;
                      v72[1] = v34;
                      v71[2] = CFSTR("asid");
                      v72[2] = v36;
                      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v37, (uint64_t)v72, (uint64_t)v71, 3);
                      v39 = objc_claimAutoreleasedReturnValue();
                      objc_msgSend_addObject_(v4, v40, (uint64_t)v39, v41);
                    }
                    else
                    {
                      handleForCategory(0);
                      v39 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v75 = (const char *)v21;
                        _os_log_error_impl(&dword_214503000, v39, OS_LOG_TYPE_ERROR, "Failed to change asid format: %@", buf, 0xCu);
                      }
                    }

                  }
                  else
                  {
                    v69[0] = CFSTR("key");
                    v69[1] = CFSTR("identifier");
                    v70[0] = v19;
                    v70[1] = v34;
                    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v35, (uint64_t)v70, (uint64_t)v69, 2);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_addObject_(v4, v42, (uint64_t)v38, v43);
                  }

                }
                v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v60, (uint64_t)v73, 16);
              }
              while (v28);
            }

            v18 = v59 + 1;
            v44 = v57;
          }
          while (v59 + 1 != v58);
          v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v16, (uint64_t)&v64, (uint64_t)v80, 16);
        }
        while (v58);
        v7 = v54;
        v3 = v55;
        v12 = v53;
        v14 = v52;
      }
    }
    else
    {
      handleForCategory(0);
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_214503000, v44, OS_LOG_TYPE_DEFAULT, "No delta components found", buf, 2u);
      }
    }
  }
  else
  {
    handleForCategory(0);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      sub_214567828((uint64_t)v12, v44, v46, v47, v48, v49, v50, v51);
  }

  if (v3)
    v3[2](v3, v14, v4, v12);

}

- (void)issueRepairCert:(id)a3 withReply:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, void *, void *, void *);
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t DefaultAMAuthInstallRef;
  const char *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  const char *v43;
  void *v44;
  void *v45;
  const char *v46;
  int RepairTicket_error;
  uint64_t v48;
  CRRIK *v49;
  const char *v50;
  CRRIK *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  void *v60;
  const char *v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  void *v66;
  const char *v67;
  void *v68;
  void *v69;
  const char *v70;
  void *v71;
  id v72;
  id v73;
  uint64_t v74;
  const __CFString *v75;
  uint64_t v76;
  const __CFString *v77;
  _QWORD v78[2];
  _QWORD v79[2];
  uint64_t v80;
  void *v81;
  uint64_t v82;
  const __CFString *v83;
  uint64_t v84;
  id v85;
  uint8_t buf[4];
  const char *v87;
  __int16 v88;
  id v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, void *, void *, void *))a4;
  v73 = 0;
  handleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v87 = "-[CRPreflight issueRepairCert:withReply:]";
    v88 = 2112;
    v89 = v6;
    _os_log_impl(&dword_214503000, v8, OS_LOG_TYPE_DEFAULT, "%s parameters: %@", buf, 0x16u);
  }

  if (!v6)
  {
    v30 = 0;
    v29 = 0;
    goto LABEL_19;
  }
  objc_msgSend_objectForKeyedSubscript_(v6, v9, (uint64_t)CFSTR("miniPreflight"), v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12
    && (v15 = (void *)v12,
        objc_msgSend_objectForKeyedSubscript_(v6, v13, (uint64_t)CFSTR("miniPreflight"), v14),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v16,
        v15,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend_objectForKeyedSubscript_(v6, v13, (uint64_t)CFSTR("miniPreflight"), v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend_BOOLValue(v18, v19, v20, v21);

  }
  else
  {
    v22 = 0;
  }
  objc_msgSend_objectForKeyedSubscript_(v6, v13, (uint64_t)CFSTR("socksHost"), v14);
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23
    && (v26 = (void *)v23,
        objc_msgSend_objectForKeyedSubscript_(v6, v24, (uint64_t)CFSTR("socksHost"), v25),
        v27 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        v28 = objc_opt_isKindOfClass(),
        v27,
        v26,
        (v28 & 1) != 0))
  {
    objc_msgSend_objectForKeyedSubscript_(v6, v24, (uint64_t)CFSTR("socksHost"), v25);
    v29 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }
  objc_msgSend_objectForKeyedSubscript_(v6, v24, (uint64_t)CFSTR("socksPort"), v25);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v30)
    goto LABEL_18;
  objc_msgSend_objectForKeyedSubscript_(v6, v9, (uint64_t)CFSTR("socksPort"), v11);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v32 = objc_opt_isKindOfClass();

  if ((v32 & 1) == 0)
  {
    v30 = 0;
LABEL_18:
    v33 = 0;
    if ((v22 & 1) != 0)
      goto LABEL_31;
    goto LABEL_19;
  }
  objc_msgSend_objectForKeyedSubscript_(v6, v9, (uint64_t)CFSTR("socksPort"), v11);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v22 & 1) != 0)
    goto LABEL_28;
LABEL_19:
  DefaultAMAuthInstallRef = objc_msgSend_getDefaultAMAuthInstallRef(CRPersonalizationManager, v9, v10, v11);
  if (!DefaultAMAuthInstallRef)
  {
    v71 = v30;
    v40 = (void *)v29;
    v58 = (void *)MEMORY[0x24BDD1540];
    v84 = *MEMORY[0x24BDD0FC8];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v34, (uint64_t)CFSTR("Failed to get auth ref"), v36);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    v85 = v42;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v59, (uint64_t)&v85, (uint64_t)&v84, 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v58, v61, (uint64_t)CFSTR("com.apple.corerepair"), -85, v60);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_38:

    goto LABEL_39;
  }
  if (v29 && v30)
    AMAuthInstallSetSOCKSProxyInformation();
  if (objc_msgSend_shouldPersonalizeWithSSOByDefault(CRPersonalizationManager, v34, v35, v36)&& objc_msgSend_enableSSO_(CRPersonalizationManager, v38, DefaultAMAuthInstallRef, v39))
  {
    v71 = v30;
    v40 = (void *)v29;
    v41 = (void *)MEMORY[0x24BDD1540];
    v82 = *MEMORY[0x24BDD0FC8];
    v83 = CFSTR("Failed to enable SSO");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v38, (uint64_t)&v83, (uint64_t)&v82, 1);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v41, v43, (uint64_t)CFSTR("com.apple.corerepair"), -85, v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_39:
    v51 = 0;
    v33 = 0;
    goto LABEL_40;
  }
  objc_msgSend_initWithAuthInstallObj_(CRPersonalizationManager, v38, DefaultAMAuthInstallRef, v39);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = 0;
  RepairTicket_error = objc_msgSend_getRepairTicket_error_(v45, v46, (uint64_t)&v73, (uint64_t)&v72);
  v42 = v72;

  if (!RepairTicket_error || v42)
  {
    v71 = v30;
    v40 = (void *)v29;
    v64 = (void *)MEMORY[0x24BDD1540];
    v80 = *MEMORY[0x24BDD0FC8];
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v9, (uint64_t)CFSTR("Failed to get repair ticket: %@"), v48, v42);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v60;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v65, (uint64_t)&v81, (uint64_t)&v80, 1);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v64, v67, (uint64_t)CFSTR("com.apple.corerepair"), -85, v66);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_38;
  }
LABEL_28:
  v33 = 0;
  if (v29 && v30)
  {
    v78[0] = CFSTR("socksHost");
    v78[1] = CFSTR("socksPort");
    v79[0] = v29;
    v79[1] = v30;
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v9, (uint64_t)v79, (uint64_t)v78, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_31:
  v71 = v30;
  v49 = objc_alloc_init(CRRIK);
  if (v49)
  {
    v51 = v49;
    v40 = (void *)v29;
    objc_msgSend_requestBAACertificates_apticket_proxySettings_(self, v50, (uint64_t)v49, (uint64_t)v73, v33);
    v52 = objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      v56 = (void *)v52;
      v44 = 0;
      v57 = 1;
      if (!v7)
        goto LABEL_42;
      goto LABEL_41;
    }
    v69 = (void *)MEMORY[0x24BDD1540];
    v74 = *MEMORY[0x24BDD0FC8];
    v75 = CFSTR("Request BAA failed");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v53, (uint64_t)&v75, (uint64_t)&v74, 1);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v69, v70, (uint64_t)CFSTR("com.apple.corerepair"), -76, v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = (void *)v29;
    v62 = (void *)MEMORY[0x24BDD1540];
    v76 = *MEMORY[0x24BDD0FC8];
    v77 = CFSTR("Create RIK failed");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v50, (uint64_t)&v77, (uint64_t)&v76, 1);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_userInfo_(v62, v63, (uint64_t)CFSTR("com.apple.corerepair"), -75, v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
  }
LABEL_40:

  v56 = 0;
  v57 = 0;
  if (v7)
  {
LABEL_41:
    objc_msgSend_keyBlob(v51, v53, v54, v55);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v57, v68, v56, v44);

  }
LABEL_42:
  AMSupportSafeRelease();

}

- (void)challengeStrongComponents:(id)a3 withReply:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, void *, void *);
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  BOOL v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  uint64_t v39;
  int v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  CFDataRef v45;
  NSObject *v46;
  CFDataRef v47;
  int v48;
  NSObject *v49;
  char v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  const char *v60;
  void *v61;
  const char *v62;
  void (**v63)(id, uint64_t, void *, void *);
  id v64;
  void *v66;
  void *v67;
  id obj;
  uint8_t buf;
  char v70[11];
  int v71;
  const __CFData *v72;
  const __CFData *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[3];
  _QWORD v81[3];
  uint64_t v82;
  void *v83;
  __int128 bytes;
  int v85;
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, uint64_t, void *, void *))a4;
  v7 = (void *)objc_opt_new();
  v67 = (void *)objc_opt_new();
  if (!v5)
    goto LABEL_5;
  objc_msgSend_objectForKeyedSubscript_(v5, v8, (uint64_t)CFSTR("challenges"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v13 = v10;
    objc_msgSend_objectForKeyedSubscript_(v5, v11, (uint64_t)CFSTR("challenges"), v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend_objectForKeyedSubscript_(v5, v16, (uint64_t)CFSTR("challenges"), v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_5:
    v10 = 0;
  }
LABEL_6:
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = v10;
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v74, (uint64_t)v86, 16);
  if (!v19)
  {
    v56 = 0;
    v57 = 1;
    goto LABEL_55;
  }
  v22 = v19;
  v66 = v7;
  v63 = v6;
  v64 = v5;
  v23 = *(_QWORD *)v75;
LABEL_8:
  v24 = 0;
  while (1)
  {
    if (*(_QWORD *)v75 != v23)
      objc_enumerationMutation(obj);
    v25 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v24);
    v72 = 0;
    v73 = 0;
    v71 = 0;
    objc_msgSend_objectForKeyedSubscript_(v25, v20, (uint64_t)CFSTR("key"), v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v25, v27, (uint64_t)CFSTR("nonce"), v28);
    v29 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v29;
    if (v26)
      v33 = v29 == 0;
    else
      v33 = 1;
    if (v33)
      goto LABEL_44;
    if (objc_msgSend_isEqual_(v26, v30, (uint64_t)CFSTR("vcrt"), v31))
    {
      objc_msgSend_sha256Data_(self, v34, (uint64_t)v32, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_vcrtSign_outSignature_outDeviceNonce_outError_(v67, v37, (uint64_t)v36, (uint64_t)&v73, &v72, &v71);

LABEL_17:
      v40 = 1;
      goto LABEL_23;
    }
    if (objc_msgSend_isEqual_(v26, v34, (uint64_t)CFSTR("bcrt"), v35))
    {
      objc_msgSend_bcrtSign_outSignature_outDeviceNonce_outError_(v67, v41, (uint64_t)v32, (uint64_t)&v73, 0, &v71);
    }
    else
    {
      if (!objc_msgSend_isEqual_(v26, v41, (uint64_t)CFSTR("tcrt"), v42))
      {
        if (!objc_msgSend_isEqual_(v26, v43, (uint64_t)CFSTR("prpc"), v44))
        {
          handleForCategory(0);
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
            sub_214567890(&buf, v70, v51);
          goto LABEL_43;
        }
        objc_msgSend_prpcSign_outSignature_outDeviceNonce_outError_(v67, v54, (uint64_t)v32, (uint64_t)&v73, &v72, &v71);
        goto LABEL_17;
      }
      objc_msgSend_tcrtSign_outSignature_outDeviceNonce_outError_(v67, v43, (uint64_t)v32, (uint64_t)&v73, 0, &v71);
    }
    v40 = 0;
LABEL_23:
    v45 = v73;
    if (!v73)
    {
      handleForCategory(0);
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        LODWORD(bytes) = 138412290;
        *(_QWORD *)((char *)&bytes + 4) = v26;
        _os_log_error_impl(&dword_214503000, v46, OS_LOG_TYPE_ERROR, "Failed to get strong component signature: %@", (uint8_t *)&bytes, 0xCu);
      }

      bytes = 0uLL;
      v85 = 0;
      v45 = CFDataCreate(0, (const UInt8 *)&bytes, 20);
      v73 = v45;
    }
    v47 = v72;
    if (v72)
      v48 = 0;
    else
      v48 = v40;
    if (v48 == 1)
    {
      handleForCategory(0);
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        LODWORD(bytes) = 138412290;
        *(_QWORD *)((char *)&bytes + 4) = v26;
        _os_log_error_impl(&dword_214503000, v49, OS_LOG_TYPE_ERROR, "Failed to get strong component nonce: %@", (uint8_t *)&bytes, 0xCu);
      }

      bytes = 0uLL;
      v85 = 0;
      v47 = CFDataCreate(0, (const UInt8 *)&bytes, 20);
      v72 = v47;
      v45 = v73;
    }
    v50 = v47 ? 0 : v40;
    if (!v45 || (v50 & 1) != 0)
      break;
    if (v40)
    {
      v80[0] = CFSTR("key");
      v80[1] = CFSTR("signature");
      v81[0] = v26;
      v81[1] = v45;
      v80[2] = CFSTR("deviceNonce");
      v81[2] = v47;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v38, (uint64_t)v81, (uint64_t)v80, 3);
      v51 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v78[0] = CFSTR("key");
      v78[1] = CFSTR("signature");
      v79[0] = v26;
      v79[1] = v45;
      objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v38, (uint64_t)v79, (uint64_t)v78, 2);
      v51 = objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend_addObject_(v7, v52, (uint64_t)v51, v53);
LABEL_43:

LABEL_44:
    if (v22 == ++v24)
    {
      v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v74, (uint64_t)v86, 16);
      v22 = v55;
      if (!v55)
      {
        v56 = 0;
        v57 = 1;
        goto LABEL_53;
      }
      goto LABEL_8;
    }
  }
  v58 = (void *)MEMORY[0x24BDD1540];
  v82 = *MEMORY[0x24BDD0FC8];
  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v38, (uint64_t)CFSTR("Failed to challenge strong component: %@"), v39, v26);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v59;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v60, (uint64_t)&v83, (uint64_t)&v82, 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_(v58, v62, (uint64_t)CFSTR("com.apple.corerepair"), -42, v61);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = 0;
LABEL_53:
  v6 = v63;
  v5 = v64;
  v7 = v66;
LABEL_55:

  if (v6)
    v6[2](v6, v57, v7, v56);

}

- (id)sign:(id)a3 keyBlob:(id)a4
{
  id v6;
  id v7;
  CRRIK *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_2145678CC();
    goto LABEL_15;
  }
  if (!v6)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_2145678F8();
    goto LABEL_15;
  }
  v8 = [CRRIK alloc];
  v11 = objc_msgSend_initWithKeyBlob_(v8, v9, (uint64_t)v7, v10);
  if (!v11)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_214567924();
    goto LABEL_15;
  }
  v14 = v11;
  objc_msgSend_sha256Data_(self, v12, (uint64_t)v6, v13);
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    handleForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_214567950();

LABEL_15:
    v19 = 0;
    goto LABEL_16;
  }
  v18 = (void *)v15;
  objc_msgSend_sign_(v14, v16, v15, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  return v19;
}

- (BOOL)verify:(id)a3 signature:(id)a4 keyBlob:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRRIK *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  char v21;
  NSObject *v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10)
  {
    handleForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_2145678CC();
    goto LABEL_12;
  }
  v11 = [CRRIK alloc];
  v14 = objc_msgSend_initWithKeyBlob_(v11, v12, (uint64_t)v10, v13);
  if (!v14)
  {
    handleForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_214567924();
    goto LABEL_12;
  }
  v17 = v14;
  objc_msgSend_sha256Data_(self, v15, (uint64_t)v8, v16);
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    handleForCategory(0);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_214567950();

LABEL_12:
    v21 = 0;
    goto LABEL_13;
  }
  v20 = (void *)v18;
  v21 = objc_msgSend_verify_signature_(v17, v19, v18, (uint64_t)v9);

LABEL_13:
  return v21;
}

- (id)sha256Data:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CC_LONG v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  const char *v14;
  void *v15;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v7 = objc_msgSend_length(v3, v4, v5, v6, 0, 0, 0, 0);
  if ((unint64_t)(v7 - 1) > 0xFFFFFFFD)
  {
    v15 = 0;
  }
  else
  {
    v8 = v7;
    v9 = objc_retainAutorelease(v3);
    v13 = (const void *)objc_msgSend_bytes(v9, v10, v11, v12);
    CC_SHA256(v13, v8, (unsigned __int8 *)&v17);
    objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v14, (uint64_t)&v17, 32);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)requestBAACertificates:(id)a3 apticket:(id)a4 proxySettings:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  BOOL v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  BOOL v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  NSObject *v45;
  dispatch_time_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  NSObject *v51;
  id v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  dispatch_semaphore_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  _QWORD v67[6];

  v67[5] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = sub_21450D1C8;
  v65 = sub_21450D1D8;
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v11, v12, v13);
  v66 = (id)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = sub_21450D1C8;
  v59 = sub_21450D1D8;
  v60 = dispatch_semaphore_create(0);
  if (v7)
  {
    objc_msgSend_attestationBlob(v7, v14, v15, v16);
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend_pubKeyBlob(v7, v17, v18, v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        if (v8)
          objc_msgSend_setObject_forKeyedSubscript_(v10, v21, (uint64_t)v8, *MEMORY[0x24BE2C3D8]);
        objc_msgSend_setObject_forKeyedSubscript_(v10, v21, (uint64_t)v20, *MEMORY[0x24BE2C3B0]);
        objc_msgSend_setObject_forKeyedSubscript_(v10, v23, (uint64_t)v22, *MEMORY[0x24BE2C3B8]);
        objc_msgSend_setObject_forKeyedSubscript_(v10, v24, MEMORY[0x24BDBD1C8], *MEMORY[0x24BE2C470]);
        v25 = *MEMORY[0x24BE2C400];
        v67[0] = *MEMORY[0x24BE2C458];
        v67[1] = v25;
        v26 = *MEMORY[0x24BE2C430];
        v67[2] = *MEMORY[0x24BE2C420];
        v67[3] = v26;
        v67[4] = *MEMORY[0x24BE2C410];
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v27, (uint64_t)v67, 5);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v10, v29, (uint64_t)v28, *MEMORY[0x24BE2C448]);

        if (v9)
        {
          objc_msgSend_objectForKeyedSubscript_(v9, v30, (uint64_t)CFSTR("socksHost"), v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v32 == 0;

          if (!v33)
          {
            objc_msgSend_objectForKeyedSubscript_(v9, v34, (uint64_t)CFSTR("socksHost"), v35);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v10, v37, (uint64_t)v36, *MEMORY[0x24BE2C490]);

          }
          objc_msgSend_objectForKeyedSubscript_(v9, v34, (uint64_t)CFSTR("socksPort"), v35);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38 == 0;

          if (!v39)
          {
            objc_msgSend_objectForKeyedSubscript_(v9, v40, (uint64_t)CFSTR("socksPort"), v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v10, v43, (uint64_t)v42, *MEMORY[0x24BE2C498]);

          }
        }
        dispatch_get_global_queue(0, 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = MEMORY[0x24BDAC760];
        DeviceIdentityIssueClientCertificateWithCompletion();

        v45 = v56[5];
        v46 = dispatch_time(0, 90000000000);
        if (dispatch_semaphore_wait(v45, v46))
        {
          handleForCategory(0);
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            sub_214567A2C();
        }
        else
        {
          if (objc_msgSend_count((void *)v62[5], v47, v48, v49, v54, 3221225472, sub_21450D1E0, &unk_24D1A9F10, &v61, &v55))
          {
            v52 = (id)v62[5];

            goto LABEL_23;
          }
          handleForCategory(0);
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            sub_214567A00();
        }

      }
      else
      {
        handleForCategory(0);
        v51 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          sub_2145679D4();

      }
    }
    else
    {
      handleForCategory(0);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_2145679A8();
    }
  }
  else
  {
    handleForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_21456797C();
  }
  v52 = 0;
LABEL_23:

  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v61, 8);

  return v52;
}

@end
