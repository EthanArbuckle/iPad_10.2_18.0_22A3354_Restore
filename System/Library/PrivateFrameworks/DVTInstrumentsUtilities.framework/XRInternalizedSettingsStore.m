@implementation XRInternalizedSettingsStore

+ (void)initialize
{
  void *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  int isEqual;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  const char *v66;
  void *v67;
  const char *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t j;
  void *v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  id obj;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  uint64_t v102;
  void *v103;
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)objc_opt_new();
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v3 = (void *)objc_opt_new();
    objc_msgSend_processInfo(MEMORY[0x24BDD1760], v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_environment(v8, v9, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)CFSTR("XrayInternalSettingsPath"), v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v89 = v17;
      v90 = v13;
      objc_msgSend_componentsSeparatedByString_(v17, v18, (uint64_t)CFSTR(":"), v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v21, v22, v23, v24, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      isEqual = objc_msgSend_isEqual_(v26, v27, (uint64_t)CFSTR("-"), v28, v29);

      if (isEqual)
      {
        objc_msgSend_removeAllObjects(v3, v31, v32, v33, v34);
        if ((unint64_t)objc_msgSend_count(v21, v35, v36, v37, v38) < 2)
        {
          v46 = MEMORY[0x24BDBD1A8];
        }
        else
        {
          v43 = objc_msgSend_count(v21, v39, v40, v41, v42);
          objc_msgSend_subarrayWithRange_(v21, v44, 1, v43 - 1, v45);
          v46 = objc_claimAutoreleasedReturnValue();
        }

        v21 = (void *)v46;
      }
      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      obj = v21;
      v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v97, (uint64_t)v104, 16);
      if (v48)
      {
        v53 = v48;
        v54 = *(_QWORD *)v98;
        v91 = *MEMORY[0x24BDD0FC8];
        do
        {
          for (i = 0; i != v53; ++i)
          {
            if (*(_QWORD *)v98 != v54)
              objc_enumerationMutation(obj);
            v56 = (void *)MEMORY[0x24BDBCF48];
            objc_msgSend_stringByStandardizingPath(*(void **)(*((_QWORD *)&v97 + 1) + 8 * i), v49, v50, v51, v52);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_fileURLWithPath_isDirectory_(v56, v58, (uint64_t)v57, 1, v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();

            if (v60)
            {
              objc_msgSend_addObject_(v3, v61, (uint64_t)v60, v62, v63);
            }
            else
            {
              v64 = (void *)MEMORY[0x24BDD1540];
              v102 = v91;
              objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v61, (uint64_t)CFSTR("Failed to use internal settings override path: %@"), v62, v63, 0);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v103 = v65;
              objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v66, (uint64_t)&v103, (uint64_t)&v102, 1);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_errorWithDomain_code_userInfo_(v64, v68, (uint64_t)CFSTR("Instruments Frameworks"), 0, (uint64_t)v67);
              v69 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_defaultResponder(XRStandardIssueResponder, v70, v71, v72, v73);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_handleIssue_type_from_(v74, v75, (uint64_t)v69, 0, 0);

            }
          }
          v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v49, (uint64_t)&v97, (uint64_t)v104, 16);
        }
        while (v53);
      }

      v17 = v89;
      v13 = v90;
    }

    v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v76, (uint64_t)&v93, (uint64_t)v101, 16);
    if (v77)
    {
      v78 = v77;
      v79 = *(_QWORD *)v94;
      do
      {
        for (j = 0; j != v78; ++j)
        {
          if (*(_QWORD *)v94 != v79)
            objc_enumerationMutation(v3);
          v81 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * j);
          sub_226365908(v2, v81, (uint64_t)CFSTR("ExternalSettings.plist"));
          sub_226365908(v2, v81, (uint64_t)CFSTR("InternalSettings.plist"));
          sub_226365908(v2, v81, (uint64_t)CFSTR("AppleInternal.plist"));
        }
        v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v82, (uint64_t)&v93, (uint64_t)v101, 16);
      }
      while (v78);
    }

    v87 = objc_msgSend_copy(v2, v83, v84, v85, v86);
    v88 = (void *)qword_25583C920;
    qword_25583C920 = v87;

  }
}

+ (id)internalizedSettings
{
  return (id)qword_25583C920;
}

+ (id)objectForKey:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_objectForKeyedSubscript_((void *)qword_25583C920, a2, (uint64_t)a3, v3, v4);
}

@end
