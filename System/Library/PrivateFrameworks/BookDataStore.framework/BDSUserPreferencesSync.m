@implementation BDSUserPreferencesSync

+ (void)copyChangedLocalPreferencesToGroupContainerWithAppSuiteName:(id)a3 container:(id)a4 groupName:(id)a5 groupContainer:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  id v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  BOOL v65;
  NSObject *v66;
  NSObject *v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSObject *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  id v88;
  const char *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  id obj;
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint8_t v100[128];
  uint8_t buf[4];
  uint64_t v102;
  __int16 v103;
  id v104;
  __int16 v105;
  id v106;
  __int16 v107;
  id v108;
  uint64_t v109;

  v109 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  BDSCloudKitAudiobookLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    v102 = (uint64_t)v10;
    v103 = 2112;
    v104 = v11;
    v105 = 2112;
    v106 = v12;
    v107 = 2112;
    v108 = v13;
    _os_log_impl(&dword_227D4F000, v14, OS_LOG_TYPE_DEFAULT, "Checking local preferences with appSuite: %@ container: %@ groupName: %@ groupContainer: %@", buf, 0x2Au);
  }

  v15 = objc_alloc(MEMORY[0x24BDBCF50]);
  v20 = v15;
  if (v12 && v13)
  {
    v25 = (void *)objc_msgSend__initWithSuiteName_container_(v15, v16, (uint64_t)v12, (uint64_t)v13, v19, v13, v12);
  }
  else
  {
    objc_msgSend_containerIdentifier(BDSAppGroupContainer, v16, v17, v18, v19, v13, v12);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerURL(BDSAppGroupContainer, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend__initWithSuiteName_container_(v20, v32, (uint64_t)v26, (uint64_t)v31, v33);

  }
  v92 = v11;
  v93 = v10;
  if (v10 && v11)
  {
    v34 = objc_alloc(MEMORY[0x24BDBCF50]);
    v37 = objc_msgSend__initWithSuiteName_container_(v34, v35, (uint64_t)v10, (uint64_t)v11, v36);
  }
  else
  {
    objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v21, v22, v23, v24);
    v37 = objc_claimAutoreleasedReturnValue();
  }
  v38 = (void *)v37;
  v95 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  objc_msgSend_syncedPreferenceKeys(a1, v39, v40, v41, v42);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v96, (uint64_t)v100, 16);
  if (v44)
  {
    v48 = v44;
    v49 = *(_QWORD *)v97;
    do
    {
      for (i = 0; i != v48; ++i)
      {
        if (*(_QWORD *)v97 != v49)
          objc_enumerationMutation(obj);
        v51 = *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * i);
        objc_msgSend_stringByAppendingString_(CFSTR("watchSynced-"), v45, v51, v46, v47);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v25, v53, (uint64_t)v52, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v38, v57, v51, v58, v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = v60;
        if (v60)
          v65 = 1;
        else
          v65 = v56 == 0;
        if (v65 && (!v60 || (objc_msgSend_isEqual_(v60, v61, (uint64_t)v56, v62, v63) & 1) != 0))
        {
          BDSCloudKitAudiobookLog();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v102 = v51;
            _os_log_impl(&dword_227D4F000, v66, OS_LOG_TYPE_INFO, "Preference %@ was unchanged", buf, 0xCu);
          }

        }
        else
        {
          BDSCloudKitAudiobookLog();
          v67 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v102 = v51;
            v103 = 2112;
            v104 = v64;
            v105 = 2112;
            v106 = v56;
            _os_log_impl(&dword_227D4F000, v67, OS_LOG_TYPE_DEFAULT, "Synced preference %@ changed locally, copying value to group container (new value %@, old value %@)", buf, 0x20u);
          }

          objc_msgSend_setObject_forKey_(v25, v68, (uint64_t)v64, (uint64_t)v52, v69);
          objc_msgSend_addObject_(v95, v70, (uint64_t)v52, v71, v72);
        }

      }
      v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v45, (uint64_t)&v96, (uint64_t)v100, 16);
    }
    while (v48);
  }

  if (objc_msgSend_count(v95, v73, v74, v75, v76))
  {
    BDSCloudKitAudiobookLog();
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v102 = (uint64_t)v95;
      _os_log_impl(&dword_227D4F000, v77, OS_LOG_TYPE_INFO, "Updating npsManager with sync keys: %@", buf, 0xCu);
    }

    objc_msgSend_containerIdentifier(BDSAppGroupContainer, v78, v79, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerIdentifier(BDSAppGroupContainer, v83, v84, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = objc_alloc_init(MEMORY[0x24BE6B2C8]);
    objc_msgSend_synchronizeUserDefaultsDomain_keys_container_appGroupContainer_(v88, v89, (uint64_t)v82, (uint64_t)v95, (uint64_t)CFSTR("com.apple.iBooks"), v87);

  }
}

+ (NSArray)syncedPreferenceKeys
{
  if (qword_253F3C6B8 != -1)
    dispatch_once(&qword_253F3C6B8, &unk_24F08B990);
  return (NSArray *)(id)qword_253F3C6C0;
}

+ (void)copyChangedLocalPreferencesToGroupContainer
{
  MEMORY[0x24BEDD108](a1, sel_copyChangedLocalPreferencesToGroupContainerWithAppSuiteName_container_groupName_groupContainer_, 0, 0, 0);
}

+ (id)objectFromGroupPreferencesForKey:(id)a3
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BDBCF50]);
  objc_msgSend_containerIdentifier(BDSAppGroupContainer, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerURL(BDSAppGroupContainer, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend__initWithSuiteName_container_(v4, v15, (uint64_t)v9, (uint64_t)v14, v16);

  objc_msgSend_stringByAppendingString_(CFSTR("watchSynced-"), v18, (uint64_t)v3, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v17, v22, (uint64_t)v21, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (void)copyChangedGroupPreferencesToLocalContainer
{
  id v3;
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
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  BOOL v49;
  NSObject *v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  __int128 v54;
  id obj;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDBCF50]);
  objc_msgSend_containerIdentifier(BDSAppGroupContainer, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerURL(BDSAppGroupContainer, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend__initWithSuiteName_container_(v3, v14, (uint64_t)v8, (uint64_t)v13, v15);

  objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend_syncedPreferenceKeys(a1, v22, v23, v24, v25);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v26, (uint64_t)&v56, (uint64_t)v66, 16);
  if (v27)
  {
    v32 = v27;
    v33 = *(_QWORD *)v57;
    *(_QWORD *)&v31 = 138412290;
    v54 = v31;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v57 != v33)
          objc_enumerationMutation(obj);
        v35 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend_stringByAppendingString_(CFSTR("watchSynced-"), v28, v35, v29, v30, v54);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v16, v37, (uint64_t)v36, v38, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v21, v41, v35, v42, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v44;
        if (v44)
          v49 = 1;
        else
          v49 = v40 == 0;
        if (v49 && (!v44 || (objc_msgSend_isEqual_(v44, v45, (uint64_t)v40, v46, v47) & 1) != 0))
        {
          BDSCloudKitAudiobookLog();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v54;
            v61 = v35;
            _os_log_impl(&dword_227D4F000, v50, OS_LOG_TYPE_INFO, "Preference %@ was unchanged", buf, 0xCu);
          }

        }
        else
        {
          BDSCloudKitAudiobookLog();
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v61 = v35;
            v62 = 2112;
            v63 = v40;
            v64 = 2112;
            v65 = v48;
            _os_log_impl(&dword_227D4F000, v51, OS_LOG_TYPE_DEFAULT, "Synced preference %@ changed in group, copying value locally (new value %@, old value %@)", buf, 0x20u);
          }

          objc_msgSend_setObject_forKey_(v21, v52, (uint64_t)v40, v35, v53);
        }

      }
      v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v56, (uint64_t)v66, 16);
    }
    while (v32);
  }

}

@end
