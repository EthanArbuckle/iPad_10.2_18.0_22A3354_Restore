@implementation MOApprovedApplicationsManager

- (id)_getApprovedApplicationsArray
{
  NSArray *approvedApplications;
  NSArray *v4;
  NSArray *v5;

  approvedApplications = self->_approvedApplications;
  if (!approvedApplications)
  {
    -[MOApprovedApplicationsManager _getApprovedApplicationsArrayAndRequireAccess:](self, "_getApprovedApplicationsArrayAndRequireAccess:", 0);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_approvedApplications;
    self->_approvedApplications = v4;

    approvedApplications = self->_approvedApplications;
  }
  return approvedApplications;
}

- (id)_getApprovedApplicationsWithAccessArray
{
  NSArray *approvedApplicationsWithAccess;
  NSArray *v4;
  NSArray *v5;

  approvedApplicationsWithAccess = self->_approvedApplicationsWithAccess;
  if (!approvedApplicationsWithAccess)
  {
    -[MOApprovedApplicationsManager _getApprovedApplicationsArrayAndRequireAccess:](self, "_getApprovedApplicationsArrayAndRequireAccess:", 1);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_approvedApplicationsWithAccess;
    self->_approvedApplicationsWithAccess = v4;

    approvedApplicationsWithAccess = self->_approvedApplicationsWithAccess;
  }
  return approvedApplicationsWithAccess;
}

- (id)_getApprovedApplicationsArrayAndRequireAccess:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  __CFString *v22;
  MOApprovedApplicationsManager *v23;
  BOOL v24;

  +[MOOnboardingAndSettingsManager sharedInstance](MOOnboardingAndSettingsManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("ApprovedJournalingApplicationsOverrideForcedList"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  objc_msgSend(MEMORY[0x24BDC1540], "enumeratorWithOptions:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __79__MOApprovedApplicationsManager__getApprovedApplicationsArrayAndRequireAccess___block_invoke;
  v20 = &unk_25133F950;
  v11 = v9;
  v21 = v11;
  v22 = CFSTR("Approved applications lookup");
  v24 = a3;
  v23 = self;
  objc_msgSend(v10, "setFilter:", &v17);
  v12 = (void *)objc_opt_new();
  objc_msgSend(v10, "nextObject", v17, v18, v19, v20);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    do
    {
      objc_msgSend(v12, "addObject:", v14);
      objc_msgSend(v10, "nextObject");
      v15 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v15;
    }
    while (v15);
  }

  return v12;
}

uint64_t __79__MOApprovedApplicationsManager__getApprovedApplicationsArrayAndRequireAccess___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *v29;
  NSObject *v30;
  _BOOL4 v31;
  const __CFString *v32;
  const char *v33;
  const __CFString *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  uint64_t v56;
  NSObject *v57;
  NSObject *v58;
  id v59;
  void *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _OWORD v70[4];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  char v85[128];
  uint8_t buf[4];
  const __CFString *v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  const __CFString *v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "entitlements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  if (!v6)
    goto LABEL_15;
  v60 = v4;
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v7 = v6;
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
  if (!v8)
    goto LABEL_14;
  v9 = v8;
  v10 = *(_QWORD *)v80;
  v56 = 138412546;
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v80 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
      if (objc_msgSend(v12, "isEqualToString:", v5, v56))
      {
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v12);
        v13 = objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          _mo_log_facility_get_os_log(MOLogFacilitySettings);
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v56;
            v87 = CFSTR("ApprovedJournalingApplicationsOverrideForcedList");
            v88 = 2112;
            v89 = v5;
            _os_log_error_impl(&dword_2422B0000, v14, OS_LOG_TYPE_ERROR, "Invalid defaults value type in %@.%@", buf, 0x16u);
          }

          continue;
        }
        v28 = -[NSObject BOOLValue](v13, "BOOLValue");
        _mo_log_facility_get_os_log(MOLogFacilitySettings);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)v28)
        {
          v4 = v60;
          if (v31)
          {
            v32 = *(const __CFString **)(a1 + 40);
            *(_DWORD *)buf = v56;
            v87 = v32;
            v88 = 2112;
            v89 = v5;
            v33 = "%@: [%@:OverrideForcedSelected]";
LABEL_46:
            _os_log_impl(&dword_2422B0000, v30, OS_LOG_TYPE_DEFAULT, v33, buf, 0x16u);
          }
        }
        else
        {
          v4 = v60;
          if (v31)
          {
            v34 = *(const __CFString **)(a1 + 40);
            *(_DWORD *)buf = v56;
            v87 = v34;
            v88 = 2112;
            v89 = v5;
            v33 = "%@: [%@:OverrideForcedUnselected]";
            goto LABEL_46;
          }
        }

        goto LABEL_97;
      }
    }
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v79, v94, 16);
    if (v9)
      continue;
    break;
  }
LABEL_14:

  v4 = v60;
LABEL_15:
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v15 = objc_msgSend(&unk_251344530, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
  if (v15)
  {
    v16 = v15;
    v7 = 0;
    v17 = *(_QWORD *)v76;
    while (2)
    {
      v18 = 0;
      v19 = v7;
      do
      {
        if (*(_QWORD *)v76 != v17)
          objc_enumerationMutation(&unk_251344530);
        v7 = *(id *)(*((_QWORD *)&v75 + 1) + 8 * v18);

        if (objc_msgSend(v5, "isEqualToString:", v7))
        {
          _mo_log_facility_get_os_log(MOLogFacilitySettings);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v29 = *(const __CFString **)(a1 + 40);
            *(_DWORD *)buf = 138412546;
            v87 = v29;
            v88 = 2112;
            v89 = v5;
            _os_log_impl(&dword_2422B0000, v13, OS_LOG_TYPE_DEFAULT, "%@: [%@:SpecialCaseUnselected]", buf, 0x16u);
          }
          v28 = 0;
          goto LABEL_97;
        }
        ++v18;
        v19 = v7;
      }
      while (v16 != v18);
      v16 = objc_msgSend(&unk_251344530, "countByEnumeratingWithState:objects:count:", &v75, v93, 16);
      if (v16)
        continue;
      break;
    }

  }
  v73 = 0u;
  v74 = 0u;
  v71 = 0u;
  v72 = 0u;
  v20 = objc_msgSend(&unk_251344548, "countByEnumeratingWithState:objects:count:", &v71, v92, 16);
  if (v20)
  {
    v21 = v20;
    v7 = 0;
    v22 = *(_QWORD *)v72;
    while (2)
    {
      v23 = 0;
      v24 = v7;
      do
      {
        if (*(_QWORD *)v72 != v22)
          objc_enumerationMutation(&unk_251344548);
        v7 = *(id *)(*((_QWORD *)&v71 + 1) + 8 * v23);

        if (objc_msgSend(v5, "isEqualToString:", v7))
        {
          if (*(_BYTE *)(a1 + 56))
            v28 = objc_msgSend(*(id *)(a1 + 48), "isApplicationUsingDataAccess:", v5);
          else
            v28 = 1;
          _mo_log_facility_get_os_log(MOLogFacilitySettings);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v49 = *(const __CFString **)(a1 + 40);
            v50 = CFSTR("AccessBasedUnselected");
            *(_DWORD *)buf = 138412802;
            if ((_DWORD)v28)
              v50 = CFSTR("Selected");
            v87 = v49;
            v88 = 2112;
            v89 = v5;
            v90 = 2112;
            v91 = v50;
            _os_log_impl(&dword_2422B0000, v13, OS_LOG_TYPE_DEFAULT, "%@: [%@:Access%@]", buf, 0x20u);
          }
          goto LABEL_97;
        }
        ++v23;
        v24 = v7;
      }
      while (v21 != v23);
      v21 = objc_msgSend(&unk_251344548, "countByEnumeratingWithState:objects:count:", &v71, v92, 16);
      if (v21)
        continue;
      break;
    }

  }
  objc_msgSend(v4, "objectForKey:ofClass:", CFSTR("com.apple.momentsd.internal"), objc_opt_class());
  v25 = objc_claimAutoreleasedReturnValue();
  v13 = v25;
  if (v25
    && (memset(v70, 0, sizeof(v70)),
        -[NSObject countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", v70, v85, 16)))
  {
    v7 = **((id **)&v70[0] + 1);
    _mo_log_facility_get_os_log(MOLogFacilitySettings);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = *(const __CFString **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v87 = v27;
      v88 = 2112;
      v89 = v5;
      _os_log_impl(&dword_2422B0000, v26, OS_LOG_TYPE_DEFAULT, "%@: [%@:InternalEntitlementSelected]", buf, 0x16u);
    }
    v28 = 1;
  }
  else
  {
    objc_msgSend(v4, "objectForKey:ofClass:", CFSTR("com.apple.developer.moments.allow"), objc_opt_class());
    v26 = objc_claimAutoreleasedReturnValue();
    v61 = v4;
    if (v26)
    {
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v35 = v13;
      v36 = -[NSObject countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
      if (v36)
      {
        v37 = v36;
        v57 = v26;
        v59 = v3;
        v7 = 0;
        v38 = *(_QWORD *)v67;
        while (2)
        {
          v39 = 0;
          v40 = v7;
          do
          {
            if (*(_QWORD *)v67 != v38)
              objc_enumerationMutation(v35);
            v7 = *(id *)(*((_QWORD *)&v66 + 1) + 8 * v39);

            if (-[NSObject isEqualToString:](v7, "isEqualToString:", CFSTR("suggestions")))
            {
              if (*(_BYTE *)(a1 + 56))
                v28 = objc_msgSend(*(id *)(a1 + 48), "isApplicationUsingDataAccess:", v5);
              else
                v28 = 1;
              v26 = v57;
              _mo_log_facility_get_os_log(MOLogFacilitySettings);
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                v51 = *(const __CFString **)(a1 + 40);
                v52 = CFSTR("Unselected");
                *(_DWORD *)buf = 138412802;
                if ((_DWORD)v28)
                  v52 = CFSTR("Selected");
                v87 = v51;
                v88 = 2112;
                v89 = v5;
                v90 = 2112;
                v91 = v52;
                _os_log_impl(&dword_2422B0000, v42, OS_LOG_TYPE_DEFAULT, "%@: [%@:EntitlementAccess%@]", buf, 0x20u);
              }
              goto LABEL_94;
            }
            ++v39;
            v40 = v7;
          }
          while (v37 != v39);
          v37 = -[NSObject countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v66, v84, 16);
          if (v37)
            continue;
          break;
        }

        v26 = v57;
      }

      v4 = v61;
    }
    objc_msgSend(v4, "objectForKey:ofClass:", CFSTR("com.apple.developer.journal.allow"), objc_opt_class());
    v41 = objc_claimAutoreleasedReturnValue();
    v35 = v41;
    if (v41)
    {
      v59 = v3;
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v42 = v41;
      v43 = -[NSObject countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v62, v83, 16);
      if (v43)
      {
        v44 = v43;
        v58 = v26;
        v7 = 0;
        v45 = *(_QWORD *)v63;
        while (2)
        {
          v46 = 0;
          v47 = v7;
          do
          {
            if (*(_QWORD *)v63 != v45)
              objc_enumerationMutation(v42);
            v7 = *(id *)(*((_QWORD *)&v62 + 1) + 8 * v46);

            if (-[NSObject isEqualToString:](v7, "isEqualToString:", CFSTR("suggestions")))
            {
              if (*(_BYTE *)(a1 + 56))
                v28 = objc_msgSend(*(id *)(a1 + 48), "isApplicationUsingDataAccess:", v5);
              else
                v28 = 1;
              v26 = v58;
              _mo_log_facility_get_os_log(MOLogFacilitySettings);
              v48 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              {
                v53 = *(const __CFString **)(a1 + 40);
                v54 = CFSTR("Unselected");
                *(_DWORD *)buf = 138412802;
                if ((_DWORD)v28)
                  v54 = CFSTR("Selected");
                v87 = v53;
                v88 = 2112;
                v89 = v5;
                v90 = 2112;
                v91 = v54;
                _os_log_impl(&dword_2422B0000, v48, OS_LOG_TYPE_DEFAULT, "%@: [%@:EntitlementAccess%@]", buf, 0x20u);
              }
              goto LABEL_92;
            }
            ++v46;
            v47 = v7;
          }
          while (v44 != v46);
          v44 = -[NSObject countByEnumeratingWithState:objects:count:](v42, "countByEnumeratingWithState:objects:count:", &v62, v83, 16);
          if (v44)
            continue;
          break;
        }
        v28 = 0;
        v48 = v7;
        v7 = 0;
        v26 = v58;
LABEL_92:

      }
      else
      {
        v7 = 0;
        v28 = 0;
      }
      v35 = v42;
LABEL_94:

      v3 = v59;
    }
    else
    {
      v7 = 0;
      v28 = 0;
    }

    v4 = v61;
  }

LABEL_97:
  return v28;
}

- (MOApprovedApplicationsManager)init
{
  MOApprovedApplicationsManager *v2;
  MOApprovedApplicationsManager *v3;
  NSArray *approvedApplications;
  MOApprovedApplicationsManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MOApprovedApplicationsManager;
  v2 = -[MOApprovedApplicationsManager init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    approvedApplications = v2->_approvedApplications;
    v2->_approvedApplications = 0;

    v5 = v3;
  }

  return v3;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__MOApprovedApplicationsManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_shared_0;
}

void __47__MOApprovedApplicationsManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_shared_0;
  sharedInstance_shared_0 = (uint64_t)v1;

}

- (BOOL)isJournalingSuggestionsAvailableForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isEqualToString:", &stru_2513404F8) & 1) == 0)
  {
    -[MOApprovedApplicationsManager _getApprovedApplicationsArray](self, "_getApprovedApplicationsArray");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "bundleIdentifier", (_QWORD)v13);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v5, "isEqualToString:", v10);

          if ((v11 & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_14;
          }
        }
        v6 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)getJournalingSuggestionsApprovedApplicationRecordForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isEqualToString:", &stru_2513404F8) & 1) == 0)
  {
    -[MOApprovedApplicationsManager _getApprovedApplicationsWithAccessArray](self, "_getApprovedApplicationsWithAccessArray");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v7);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v10, "bundleIdentifier", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v5, "isEqualToString:", v11);

          if ((v12 & 1) != 0)
          {
            v6 = (void *)objc_msgSend(v10, "copy");
            goto LABEL_14;
          }
        }
        v6 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_14:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isApplicationUsingDataAccess:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[MOOnboardingAndSettingsManager sharedInstance](MOOnboardingAndSettingsManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isApplicationUsingDataAccess:", v3);

  return v5;
}

- (void)registerApplicationsForDataAccess:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[MOOnboardingAndSettingsManager sharedInstance](MOOnboardingAndSettingsManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerApplicationsForDataAccess:", v3);

}

- (BOOL)isClientUsingDataAccess:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[MOOnboardingAndSettingsManager sharedInstance](MOOnboardingAndSettingsManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isClientUsingDataAccess:", v3);

  return v5;
}

- (void)registerClientsForDataAccess:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[MOOnboardingAndSettingsManager sharedInstance](MOOnboardingAndSettingsManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClientsForDataAccess:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_approvedApplicationsWithAccess, 0);
  objc_storeStrong((id *)&self->_approvedApplications, 0);
}

@end
