@implementation AADataclassManager

- (id)allowListedDataclassesForAppleAccountClassBasic
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = *MEMORY[0x24BDB3DE8];
  v9[0] = *MEMORY[0x24BDB3DD8];
  v9[1] = v3;
  v4 = *MEMORY[0x24BDB3E68];
  v9[2] = *MEMORY[0x24BDB3E38];
  v9[3] = v4;
  v9[4] = *MEMORY[0x24BDB3E88];
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a2, (uint64_t)v9, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v2, v6, (uint64_t)v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)allowListedDataclassesForAppleAccountClassFull
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  _QWORD v12[7];

  v12[6] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_allowListedDataclassesForAppleAccountClassBasic(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDB3DC0];
  v12[0] = *MEMORY[0x24BDB3DA8];
  v12[1] = v4;
  v5 = *MEMORY[0x24BDB3DD0];
  v12[2] = *MEMORY[0x24BDB3DC8];
  v12[3] = v5;
  v6 = *MEMORY[0x24BDB3EC8];
  v12[4] = *MEMORY[0x24BDB3E80];
  v12[5] = v6;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v7, (uint64_t)v12, 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setByAddingObjectsFromArray_(v3, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_userVisibleDataclasses
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  _QWORD v23[22];

  v23[21] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = *MEMORY[0x24BDB3DA8];
  v23[0] = *MEMORY[0x24BDB3E18];
  v23[1] = v3;
  v4 = *MEMORY[0x24BDB3EB0];
  v23[2] = *MEMORY[0x24BDB3E48];
  v23[3] = v4;
  v5 = *MEMORY[0x24BDB3DD8];
  v23[4] = *MEMORY[0x24BDB3DB0];
  v23[5] = v5;
  v6 = *MEMORY[0x24BDB3E00];
  v23[6] = *MEMORY[0x24BDB3DE8];
  v23[7] = v6;
  v7 = *MEMORY[0x24BDB3E10];
  v23[8] = *MEMORY[0x24BDB3E20];
  v23[9] = v7;
  v8 = *MEMORY[0x24BDB3E30];
  v23[10] = *MEMORY[0x24BDB3E08];
  v23[11] = v8;
  v9 = *MEMORY[0x24BDB3E60];
  v23[12] = *MEMORY[0x24BDB3E38];
  v23[13] = v9;
  v10 = *MEMORY[0x24BDB3E78];
  v23[14] = *MEMORY[0x24BDB3E68];
  v23[15] = v10;
  v11 = *MEMORY[0x24BDB3EB8];
  v23[16] = *MEMORY[0x24BDB3E88];
  v23[17] = v11;
  v12 = *MEMORY[0x24BDB3EC8];
  v23[18] = *MEMORY[0x24BDB3EC0];
  v23[19] = v12;
  v23[20] = *MEMORY[0x24BDB3E70];
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a2, (uint64_t)v23, 21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v2, v14, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_isMomentsDataclassEnabled(MEMORY[0x24BE049F8], v16, v17)
    && objc_msgSend_isDeviceiPhone(AADeviceModelHelper, v18, v19))
  {
    objc_msgSend_setByAddingObject_(v15, v20, *MEMORY[0x24BDB3E50]);
    v21 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v21;
  }
  return v15;
}

- (id)_nonVisibleServiceDataclass
{
  void *v2;
  void *v3;
  const char *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v7[0] = *MEMORY[0x24BDB3E28];
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a2, (uint64_t)v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v2, v4, (uint64_t)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)denyListedMacOSDataclasses
{
  void *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = *MEMORY[0x24BDB3E18];
  v10[0] = *MEMORY[0x24BDB3DA8];
  v10[1] = v3;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], a2, (uint64_t)v10, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v2, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    objc_msgSend_setByAddingObject_(v6, v7, *MEMORY[0x24BDB3E48]);
    v8 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v8;
  }
  return v6;
}

- (id)_filteredDataclassesForAccountClass:(id)a3
{
  id v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  const char *v17;

  v5 = a3;
  if (objc_msgSend_isEqualToString_(v5, v6, *MEMORY[0x24BE047F0]))
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v7, v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, self, CFSTR("AADataclassManager.m"), 191, CFSTR("AAAccountClassPrimary does not have filtered dataclasses. All dataclasses are valid"));

  }
  if (objc_msgSend_isEqualToString_(v5, v7, *MEMORY[0x24BE047E0]))
  {
    objc_msgSend_allowListedDataclassesForAppleAccountClassBasic(self, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend_isEqualToString_(v5, v9, *MEMORY[0x24BE047E8]))
    {
      v14 = 0;
      goto LABEL_9;
    }
    objc_msgSend_allowListedDataclassesForAppleAccountClassFull(self, v12, v13);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v11;
LABEL_9:

  return v14;
}

- (id)filteredServerProvidedFeatures:(id)a3 forAccount:(id)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  char isEqualToString;
  const char *v22;
  uint64_t v23;
  void *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  const char *v32;
  const char *v33;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v10 = a4;
  if (!v10)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v8, v9);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v35, v36, (uint64_t)a2, self, CFSTR("AADataclassManager.m"), 203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

    if (v7)
      goto LABEL_3;
LABEL_24:
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v8, v9);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v37, v38, (uint64_t)a2, self, CFSTR("AADataclassManager.m"), 204, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serverProvidedFeatures"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_24;
LABEL_3:
  objc_msgSend_setWithSet_(MEMORY[0x24BDBCF20], v8, (uint64_t)v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend_mutableCopy(v11, v12, v13);

  v15 = *MEMORY[0x24BDB3EB0];
  if ((objc_msgSend_containsObject_(v14, v16, *MEMORY[0x24BDB3EB0]) & 1) == 0
    && objc_msgSend_containsObject_(v14, v17, *MEMORY[0x24BDB3EC8])
    && (objc_msgSend_aa_isManagedAppleID(v10, v17, v18) & 1) == 0)
  {
    objc_msgSend_addObject_(v14, v17, v15);
  }
  objc_msgSend_aa_accountClass(v10, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v19, v20, *MEMORY[0x24BE047E0]);

  if ((isEqualToString & 1) == 0)
  {
    v23 = *MEMORY[0x24BDB3E80];
    if ((objc_msgSend_containsObject_(v14, v22, *MEMORY[0x24BDB3E80]) & 1) == 0)
    {
      if (objc_msgSend_containsObject_(v14, v22, *MEMORY[0x24BDB3EC8]))
        objc_msgSend_addObject_(v14, v22, v23);
    }
  }
  objc_msgSend_setWithArray_(MEMORY[0x24BDBCEF0], v22, MEMORY[0x24BDBD1A8]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v25 = v14;
  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v39, v43, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v40 != v29)
          objc_enumerationMutation(v25);
        v31 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          sub_230EB7BA8();
        if (objc_msgSend_shouldProvisionDataclass_forAccount_(self, v32, v31, v10))
          objc_msgSend_addObject_(v24, v33, v31);
      }
      v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v33, (uint64_t)&v39, v43, 16);
    }
    while (v28);
  }

  return v24;
}

+ (AADataclassManager)sharedManager
{
  if (qword_255EAA6C0 != -1)
    dispatch_once(&qword_255EAA6C0, &unk_24FF9ED60);
  return (AADataclassManager *)(id)qword_255EAA6B8;
}

- (AADataclassManager)init
{
  const char *v2;
  uint64_t v3;
  AADataclassManager *v4;
  uint64_t v5;
  ACAccountStore *store;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AADataclassManager;
  v4 = -[AADataclassManager init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend_defaultStore(MEMORY[0x24BDB4398], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    store = v4->_store;
    v4->_store = (ACAccountStore *)v5;

  }
  return v4;
}

- (AADataclassManager)initWithAccountStore:(id)a3
{
  id v5;
  AADataclassManager *v6;
  AADataclassManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AADataclassManager;
  v6 = -[AADataclassManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_store, a3);

  return v7;
}

+ (id)appBundleIdentifierDictionary
{
  if (qword_255EAA6D0 != -1)
    dispatch_once(&qword_255EAA6D0, &unk_24FF9ED80);
  return (id)qword_255EAA6C8;
}

- (id)appBundleIdentifierForDataclass:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;

  v3 = a3;
  objc_msgSend_appBundleIdentifierDictionary(AADataclassManager, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v6, v7, (uint64_t)v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_isRestrictedForDataclass:(id)a3 account:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  int isEqualToString;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  BOOL v15;

  v5 = a3;
  v6 = a4;
  isEqualToString = objc_msgSend_isEqualToString_(v5, v7, *MEMORY[0x24BDB3DA8]);
  if (v6 && isEqualToString && !objc_msgSend_aa_isAccountClass_(v6, v9, *MEMORY[0x24BE047F0]))
  {
    v15 = 0;
  }
  else
  {
    if (qword_255EAA6E0 != -1)
      dispatch_once(&qword_255EAA6E0, &unk_24FF9EDA0);
    objc_msgSend_objectForKeyedSubscript_((void *)qword_255EAA6D8, v9, (uint64_t)v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend_sharedConnection(MEMORY[0x24BE63CB0], v10, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend_BOOLRestrictionForFeature_(v13, v14, (uint64_t)v12) == 2;

    }
    else
    {
      v15 = 0;
    }

  }
  return v15;
}

- (BOOL)policyRestrictsDataclass:(id)a3
{
  return MEMORY[0x24BEDD108](AACloudPolicyRestrictions, sel_policyRestrictsDataclass_, a3);
}

- (BOOL)isSystemAppRestrictedOrRemovedForDataclass:(id)a3
{
  return objc_msgSend_isSystemAppMCRestrictedOrRemovedForDataclass_forAccount_(self, a2, (uint64_t)a3, 0);
}

- (BOOL)isSystemAppMCRestrictedOrRemovedForDataclass:(id)a3 forAccount:(id)a4
{
  id v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  const char *v12;
  void *v13;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  int isRestricted;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v34;
  const char *v35;
  uint64_t v36;
  char isPlaceholder;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  int v42;
  const __CFString *v43;
  id v44;
  uint8_t buf[4];
  const __CFString *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((objc_msgSend__isRestrictedForDataclass_account_(self, v7, (uint64_t)v6, a4) & 1) == 0)
  {
    objc_msgSend_sharedManager(AADataclassManager, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appBundleIdentifierForDataclass_(v11, v12, (uint64_t)v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      _AALogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        sub_230EB7BD0();
      v10 = 0;
      goto LABEL_17;
    }
    v14 = objc_alloc(MEMORY[0x24BDC1540]);
    v44 = 0;
    v16 = (void *)objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(v14, v15, (uint64_t)v13, 1, &v44);
    v19 = v44;
    if (v16)
    {
      objc_msgSend_applicationState(v16, v17, v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      isRestricted = objc_msgSend_isRestricted(v20, v21, v22);

      if (isRestricted)
      {
        _AALogSystem();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend_applicationState(v16, v27, v28);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend_isRestricted(v39, v40, v41);
          v43 = CFSTR("NO");
          *(_DWORD *)buf = 138412802;
          if (v42)
            v43 = CFSTR("YES");
          v46 = v43;
          v47 = 2112;
          v48 = v6;
          v49 = 2112;
          v50 = v13;
          _os_log_debug_impl(&dword_230EB3000, v26, OS_LOG_TYPE_DEBUG, "App state isRestricted is (%@) for dataclass %@ with bundleid %@", buf, 0x20u);

        }
LABEL_7:
        v10 = 1;
LABEL_15:

LABEL_16:
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend_applicationState(v16, v24, v25);
      v26 = objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isInstalled(v26, v29, v30) & 1) == 0)
      {
        objc_msgSend_applicationState(v16, v31, v32);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        isPlaceholder = objc_msgSend_isPlaceholder(v34, v35, v36);

        if ((isPlaceholder & 1) != 0
          || !objc_msgSend__hideDataclassWhenAppRemoved_(self, v38, (uint64_t)v6))
        {
          v10 = 0;
          goto LABEL_16;
        }
        _AALogSystem();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          sub_230EB7C90();
        goto LABEL_7;
      }
    }
    else
    {
      _AALogSystem();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        sub_230EB7C30();
    }
    v10 = 0;
    goto LABEL_15;
  }
  v10 = 1;
LABEL_18:

  return v10;
}

- (BOOL)_hideDataclassWhenAppRemoved:(id)a3
{
  return objc_msgSend__shouldShowDataclassWhenAppIsRemoved_(self, a2, (uint64_t)a3) ^ 1;
}

- (BOOL)_shouldShowDataclassWhenAppIsRemoved:(id)a3
{
  uint64_t v3;
  const char *v4;
  id v5;
  char v6;

  v3 = qword_255EAA6F0;
  v5 = a3;
  if (v3 != -1)
    dispatch_once(&qword_255EAA6F0, &unk_24FF9EDC0);
  v6 = objc_msgSend_containsObject_((void *)qword_255EAA6E8, v4, (uint64_t)v5);

  return v6;
}

- (BOOL)canAutoEnableDataclass:(id)a3 forAccount:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  int v23;
  uint64_t v24;
  int v25;
  const char *v26;
  NSObject *v27;
  BOOL v28;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  int isSystemAppMCRestrictedOrRemovedForDataclass_forAccount;
  const char *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  const char *v40;
  void *v41;
  const char *v42;
  uint8_t buf[4];
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v11 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v9, v10);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v39, v40, (uint64_t)a2, self, CFSTR("AADataclassManager.m"), 464, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataclass"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v9, v10);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v41, v42, (uint64_t)a2, self, CFSTR("AADataclassManager.m"), 465, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

LABEL_3:
  _AALogSystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v7;
    _os_log_impl(&dword_230EB3000, v12, OS_LOG_TYPE_DEFAULT, "Checking if we need to auto-enable: %@", buf, 0xCu);
  }

  if (!objc_msgSend_aa_isPrimaryEmailVerified(v11, v13, v14))
    goto LABEL_17;
  objc_msgSend__userVisibleDataclasses(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_containsObject_(v17, v18, (uint64_t)v7))
  {

  }
  else
  {
    objc_msgSend__nonVisibleServiceDataclass(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend_containsObject_(v21, v22, (uint64_t)v7);

    if (!v23)
    {
LABEL_17:
      v25 = 0;
      goto LABEL_18;
    }
  }
  if ((objc_msgSend__isRestrictedForDataclass_account_(self, v15, (uint64_t)v7, v11) & 1) != 0
    || objc_msgSend_isEqualToString_(v7, v15, *MEMORY[0x24BDB3DA8])
    && (objc_msgSend_isRunningInStoreDemoMode(MEMORY[0x24BE049F8], v15, v24) & 1) != 0
    || (objc_msgSend_isEqualToString_(v7, v15, *MEMORY[0x24BDB3E00]) & 1) != 0
    || (objc_msgSend_isEqualToString_(v7, v15, *MEMORY[0x24BDB3E78]) & 1) != 0
    || (objc_msgSend_isEqualToString_(v7, v15, *MEMORY[0x24BDB3E40]) & 1) != 0
    || (objc_msgSend_isEqualToString_(v7, v15, *MEMORY[0x24BDB3EA8]) & 1) != 0
    || (objc_msgSend_isEqualToString_(v7, v15, *MEMORY[0x24BDB3E48]) & 1) != 0)
  {
    goto LABEL_17;
  }
  v30 = *MEMORY[0x24BDB3E38];
  if (objc_msgSend_isEqualToString_(v7, v15, *MEMORY[0x24BDB3E38]))
  {
    objc_msgSend_sharedManager(AADataclassManager, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    isSystemAppMCRestrictedOrRemovedForDataclass_forAccount = objc_msgSend_isSystemAppMCRestrictedOrRemovedForDataclass_forAccount_(v33, v34, v30, v11);

    v25 = (objc_msgSend_aa_needsEmailConfiguration(v11, v36, v37) | isSystemAppMCRestrictedOrRemovedForDataclass_forAccount) ^ 1;
  }
  else
  {
    if (objc_msgSend_isEqualToString_(v7, v31, *MEMORY[0x24BDB3E18])
      && objc_msgSend_isDeviceiPad(AADeviceModelHelper, v15, v16))
    {
      _AALogSystem();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_230EB3000, v38, OS_LOG_TYPE_DEFAULT, "Health Dataclass. Setting auto-enable for iPad to false.", buf, 2u);
      }

      goto LABEL_17;
    }
    v25 = 1;
  }
LABEL_18:
  if (objc_msgSend_aa_isManagedAppleID(v11, v15, v16))
  {
    if ((v25 & ~objc_msgSend_aa_serverDisabledDataclass_(v11, v26, (uint64_t)v7) & 1) == 0)
    {
LABEL_20:
      _AALogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v7;
        _os_log_impl(&dword_230EB3000, v27, OS_LOG_TYPE_DEFAULT, "Skipping auto-enable for %@", buf, 0xCu);
      }
      v28 = 0;
      goto LABEL_27;
    }
  }
  else if (!v25)
  {
    goto LABEL_20;
  }
  _AALogSystem();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v7;
    _os_log_impl(&dword_230EB3000, v27, OS_LOG_TYPE_DEFAULT, "Auto-enabling dataclass: %@", buf, 0xCu);
  }
  v28 = 1;
LABEL_27:

  return v28;
}

- (BOOL)shouldProvisionDataclass:(id)a3 forAccount:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  int isSystemAppMCRestrictedOrRemovedForDataclass_forAccount;
  const char *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  BOOL v24;
  void *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  char shouldProvisionNotesForAccount;
  const char *v30;
  void *v32;
  const char *v33;
  void *v34;
  const char *v35;

  v7 = a3;
  v8 = a4;
  v11 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v9, v10);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v32, v33, (uint64_t)a2, self, CFSTR("AADataclassManager.m"), 521, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataclass"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v9, v10);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v34, v35, (uint64_t)a2, self, CFSTR("AADataclassManager.m"), 522, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

LABEL_3:
  objc_msgSend_sharedManager(AADataclassManager, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  isSystemAppMCRestrictedOrRemovedForDataclass_forAccount = objc_msgSend_isSystemAppMCRestrictedOrRemovedForDataclass_forAccount_(v12, v13, (uint64_t)v7, v11);

  if (isSystemAppMCRestrictedOrRemovedForDataclass_forAccount)
  {
    _AALogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      sub_230EB7D20();

    goto LABEL_12;
  }
  if (!objc_msgSend_isEqualToString_(v7, v15, *MEMORY[0x24BDB3E50])
    || objc_msgSend_isMomentsDataclassEnabled(MEMORY[0x24BE049F8], v17, v18)
    && objc_msgSend_isDeviceiPhone(AADeviceModelHelper, v19, v20))
  {
    objc_msgSend_aa_accountClass(v11, v17, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_isEqualToString_(v21, v22, *MEMORY[0x24BE047F0]) & 1) != 0)
    {
      v24 = 1;
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend__filteredDataclassesForAccountClass_(self, v23, (uint64_t)v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_containsObject_(v25, v26, (uint64_t)v7))
    {
      if (objc_msgSend_isEqualToString_(v7, v27, *MEMORY[0x24BDB3E68]))
      {
        shouldProvisionNotesForAccount = objc_msgSend__shouldProvisionNotesForAccount_(self, v28, (uint64_t)v11);
      }
      else
      {
        if (!objc_msgSend_isEqualToString_(v7, v28, *MEMORY[0x24BDB3E88]))
        {
          v24 = 1;
          goto LABEL_21;
        }
        shouldProvisionNotesForAccount = objc_msgSend__shouldProvisionRemindersForAccount_(self, v30, (uint64_t)v11);
      }
      v24 = shouldProvisionNotesForAccount;
    }
    else
    {
      v24 = 0;
    }
LABEL_21:

    goto LABEL_22;
  }
LABEL_12:
  v24 = 0;
LABEL_23:

  return v24;
}

- (BOOL)_shouldProvisionNotesForAccount:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  char isEqualToString;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  BOOL v18;
  void *v20;
  const char *v21;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v5, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, self, CFSTR("AADataclassManager.m"), 580, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

  }
  objc_msgSend_aa_accountClass(v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v8, v9, *MEMORY[0x24BE047F0]))
  {

LABEL_10:
    v18 = 1;
    goto LABEL_11;
  }
  objc_msgSend_aa_accountClass(v7, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v12, v13, *MEMORY[0x24BE047E8]);

  if ((isEqualToString & 1) != 0 || !objc_msgSend_aa_isNotesMigrated(v7, v15, v16))
    goto LABEL_10;
  _AALogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    sub_230EB7D80();

  v18 = 0;
LABEL_11:

  return v18;
}

- (BOOL)_shouldProvisionRemindersForAccount:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  char isEqualToString;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  BOOL v18;
  void *v20;
  const char *v21;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v5, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, self, CFSTR("AADataclassManager.m"), 598, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

  }
  objc_msgSend_aa_accountClass(v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v8, v9, *MEMORY[0x24BE047F0]))
  {

LABEL_10:
    v18 = 1;
    goto LABEL_11;
  }
  objc_msgSend_aa_accountClass(v7, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v12, v13, *MEMORY[0x24BE047E8]);

  if ((isEqualToString & 1) != 0 || !objc_msgSend_aa_isRemindersMigrated(v7, v15, v16))
    goto LABEL_10;
  _AALogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    sub_230EB7DE0();

  v18 = 0;
LABEL_11:

  return v18;
}

- (void)enableDataclassesWithoutLocalDataDataclassActionsForAccount:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  ACAccountStore *store;
  const char *v15;
  _QWORD v16[4];
  id v17;
  _BYTE *v18;
  _BYTE buf[24];
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend_filterDataclassesForPossibleAutoEnablementForAccount_(self, v8, (uint64_t)v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v9, v10, v11))
  {
    objc_msgSend_enableDataclassesWithoutLocalDataDataclassActionsForDataclasses_fromAccount_completion_(self, v12, (uint64_t)v9, v6, v7);
  }
  else
  {
    _AALogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[AADataclassManager enableDataclassesWithoutLocalDataDataclassActionsForAccount:completion:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_230EB3000, v13, OS_LOG_TYPE_DEFAULT, "%s - There are no auto-enableable dataclasses for account %@. Proceeding with save.", buf, 0x16u);
    }

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v20 = sub_230EB6B64;
    v21 = sub_230EB6B74;
    v22 = (id)os_transaction_create();
    store = self->_store;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = sub_230EB6B7C;
    v16[3] = &unk_24FF9EDE8;
    v17 = v7;
    v18 = buf;
    objc_msgSend_saveAccount_withCompletionHandler_(store, v15, (uint64_t)v6, v16);

    _Block_object_dispose(buf, 8);
  }

}

- (void)enableDataclassesWithoutLocalDataDataclassActionsForDataclasses:(id)a3 fromAccount:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  const char *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v13 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v11, v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v20, v21, (uint64_t)a2, self, CFSTR("AADataclassManager.m"), 638, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("account"));

    if (v13)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v11, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, CFSTR("AADataclassManager.m"), 637, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dataclasses"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v13)
    goto LABEL_4;
LABEL_9:
  objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v11, v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v22, v23, (uint64_t)a2, self, CFSTR("AADataclassManager.m"), 639, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

LABEL_4:
  _AALogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v29 = v10;
    v30 = 2114;
    v31 = v9;
    _os_log_impl(&dword_230EB3000, v14, OS_LOG_TYPE_DEFAULT, "Attempting to auto-enable dataclasses for account (%@): %{public}@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_230EB6EE4;
  v24[3] = &unk_24FF9EE38;
  objc_copyWeak(&v27, (id *)buf);
  v15 = v13;
  v26 = v15;
  v16 = v10;
  v25 = v16;
  objc_msgSend__buildAutoEnableableDataclassesAndActionsForAccount_dataclassesForEnablement_completion_(self, v17, (uint64_t)v16, v9, v24);

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);

}

- (void)_buildAutoEnableableDataclassesAndActionsForAccount:(id)a3 dataclassesForEnablement:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, id, _QWORD);
  const char *v11;
  uint64_t v12;
  id v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  int isPrimaryEmailVerified;
  ACAccountStore *store;
  const char *v25;
  void *v26;
  id v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  id v32;
  void *v33;
  id v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(void **, void *, void *);
  void *v49;
  AADataclassManager *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, id, _QWORD))a5;
  v45 = (void *)objc_msgSend_mutableCopy(v9, v11, v12);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v13 = v9;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v55, v61, 16);
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v56;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v56 != v18)
          objc_enumerationMutation(v13);
        objc_msgSend_setEnabled_forDataclass_(v8, v16, 1, *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v19++), v45);
      }
      while (v17 != v19);
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v55, v61, 16);
    }
    while (v17);
  }

  v20 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  isPrimaryEmailVerified = objc_msgSend_aa_isPrimaryEmailVerified(v8, v21, v22);
  store = self->_store;
  v54 = 0;
  objc_msgSend_dataclassActionsForAccountSave_error_(store, v25, (uint64_t)v8, &v54);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v54;
  v30 = v27;
  if (v26)
  {
    _AALogSystem();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v26;
      _os_log_impl(&dword_230EB3000, v31, OS_LOG_TYPE_DEFAULT, "We have potential dataclass actions: %@", buf, 0xCu);
    }

    v32 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v46 = MEMORY[0x24BDAC760];
    v47 = 3221225472;
    v48 = sub_230EB7668;
    v49 = &unk_24FF9EE60;
    v50 = self;
    v51 = v32;
    v33 = v45;
    v52 = v45;
    v53 = v8;
    v34 = v32;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v26, v35, (uint64_t)&v46);
    v38 = (void *)objc_msgSend_copy(v34, v36, v37);
    objc_msgSend_setObject_forKeyedSubscript_(v20, v39, (uint64_t)v38, CFSTR("dataclassActions"));

    goto LABEL_12;
  }
  v33 = v45;
  if (!v27)
  {
LABEL_12:
    if (isPrimaryEmailVerified != objc_msgSend_aa_isPrimaryEmailVerified(v8, v28, v29, v45, v46, v47, v48, v49, v50))objc_msgSend_aa_setPrimaryEmailVerified_(v8, v40, 1);
    v42 = (void *)objc_msgSend_copy(v33, v40, v41);
    objc_msgSend_setObject_forKeyedSubscript_(v20, v43, (uint64_t)v42, CFSTR("dataclasses"));

    v10[2](v10, v20, 0);
    goto LABEL_19;
  }
  _AALogSystem();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    sub_230EB7FA0();

  ((void (**)(id, id, void *))v10)[2](v10, 0, v30);
LABEL_19:

}

- (BOOL)isDataclassActionSafeForAutoEnablement:(id)a3
{
  return MEMORY[0x24BEDD108](a3, sel_isSafeForAutoEnablement, a3);
}

- (id)filterDataclassesForPossibleAutoEnablementForAccount:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v3 = a3;
  objc_msgSend_provisionedDataclasses(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_230EB7940;
  v14[3] = &unk_24FF9EC58;
  v15 = v3;
  v10 = v3;
  objc_msgSend_aaf_filter_(v9, v11, (uint64_t)v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (ACAccountStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
