@implementation CKDBatchFetchUserPrivacySettingsOperation

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/batch-get-user-privacy-settings", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)shouldCheckAppVersion
{
  return 0;
}

- (int)operationType
{
  return 405;
}

- (void)main
{
  CKDBatchFetchUserPrivacySettingsURLRequest *v3;
  const char *v4;
  void *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;
  id from;
  id location;

  v3 = [CKDBatchFetchUserPrivacySettingsURLRequest alloc];
  v5 = (void *)objc_msgSend_initWithOperation_(v3, v4, (uint64_t)self);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v5);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = sub_1BEB94EAC;
  v15 = &unk_1E782E468;
  objc_copyWeak(&v16, &location);
  objc_copyWeak(&v17, &from);
  objc_msgSend_setCompletionBlock_(v5, v6, (uint64_t)&v12);
  objc_msgSend_setRequest_(self, v7, (uint64_t)v5, v12, v13, v14, v15);
  objc_msgSend_container(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_performRequest_(v10, v11, (uint64_t)v5);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

+ (id)appPermissionGroupsFromContainerPrivacySettings:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  const char *v23;
  void *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t k;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t m;
  uint64_t v61;
  const char *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  id v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t n;
  void *v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  const char *v83;
  const char *v84;
  const char *v85;
  uint64_t v86;
  id v88;
  void *v89;
  id obj;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _BYTE v121[128];
  _BYTE v122[128];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_opt_new();
  v100 = (void *)objc_opt_new();
  v5 = (void *)v4;
  v91 = (void *)objc_opt_new();
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  obj = v3;
  v98 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v117, v125, 16);
  if (v98)
  {
    v96 = *(_QWORD *)v118;
    do
    {
      for (i = 0; i != v98; ++i)
      {
        if (*(_QWORD *)v118 != v96)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * i);
        objc_msgSend_containerID(v10, v7, v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend_setObject_forKeyedSubscript_(v91, v11, (uint64_t)v10, v12);
          v115 = 0u;
          v116 = 0u;
          v113 = 0u;
          v114 = 0u;
          objc_msgSend_applicationBundleIDs(v10, v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v113, v124, 16);
          if (v17)
          {
            v19 = v17;
            v20 = *(_QWORD *)v114;
            do
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(_QWORD *)v114 != v20)
                  objc_enumerationMutation(v15);
                v22 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * j);
                objc_msgSend_objectForKeyedSubscript_(v5, v18, v22);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v24)
                {
                  v24 = (void *)objc_opt_new();
                  objc_msgSend_setObject_forKeyedSubscript_(v5, v25, (uint64_t)v24, v22);
                }
                objc_msgSend_addObject_(v24, v23, (uint64_t)v12);
                objc_msgSend_objectForKeyedSubscript_(v100, v26, (uint64_t)v12);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v28)
                {
                  v28 = (void *)objc_opt_new();
                  objc_msgSend_setObject_forKeyedSubscript_(v100, v29, (uint64_t)v28, v12);
                }
                objc_msgSend_addObject_(v28, v27, v22);

              }
              v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v113, v124, 16);
            }
            while (v19);
          }

        }
      }
      v98 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v117, v125, 16);
    }
    while (v98);
  }

  v88 = (id)objc_opt_new();
  if (objc_msgSend_count(v5, v30, v31))
  {
    v92 = v5;
    do
    {
      objc_msgSend_allKeys(v5, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_lastObject(v34, v35, v36);
      v37 = objc_claimAutoreleasedReturnValue();

      v38 = (void *)objc_opt_new();
      v39 = (void *)objc_opt_new();
      v97 = (void *)objc_opt_new();
      objc_msgSend_addObject_(v38, v40, v37);
      v89 = (void *)v37;
      objc_msgSend_addObject_(v39, v41, v37);
      if (objc_msgSend_count(v38, v42, v43))
      {
        v45 = 0;
        do
        {
          v94 = v45;
          objc_msgSend_objectAtIndexedSubscript_(v38, v44, v45);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v5, v46, (uint64_t)v93);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = 0u;
          v110 = 0u;
          v111 = 0u;
          v112 = 0u;
          v95 = v47;
          v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v48, (uint64_t)&v109, v123, 16);
          if (v49)
          {
            v51 = v49;
            v99 = *(_QWORD *)v110;
            do
            {
              for (k = 0; k != v51; ++k)
              {
                if (*(_QWORD *)v110 != v99)
                  objc_enumerationMutation(v95);
                v53 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * k);
                objc_msgSend_objectForKeyedSubscript_(v100, v50, v53);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v105 = 0u;
                v106 = 0u;
                v107 = 0u;
                v108 = 0u;
                v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v55, (uint64_t)&v105, v122, 16);
                if (v56)
                {
                  v58 = v56;
                  v59 = *(_QWORD *)v106;
                  do
                  {
                    for (m = 0; m != v58; ++m)
                    {
                      if (*(_QWORD *)v106 != v59)
                        objc_enumerationMutation(v54);
                      v61 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * m);
                      if ((objc_msgSend_containsObject_(v39, v57, v61) & 1) == 0)
                      {
                        objc_msgSend_addObject_(v38, v57, v61);
                        objc_msgSend_addObject_(v39, v62, v61);
                      }
                    }
                    v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v57, (uint64_t)&v105, v122, 16);
                  }
                  while (v58);
                }
                objc_msgSend_addObject_(v97, v57, v53);
                objc_msgSend_removeObjectForKey_(v100, v63, v53);

              }
              v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v50, (uint64_t)&v109, v123, 16);
            }
            while (v51);
          }
          v5 = v92;
          objc_msgSend_removeObjectForKey_(v92, v50, (uint64_t)v93);

          v45 = v94 + 1;
        }
        while (v94 + 1 < (unint64_t)objc_msgSend_count(v38, v64, v65));
      }
      v66 = (void *)objc_opt_new();
      v101 = 0u;
      v102 = 0u;
      v103 = 0u;
      v104 = 0u;
      v67 = v97;
      v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v68, (uint64_t)&v101, v121, 16);
      if (v69)
      {
        v71 = v69;
        v72 = 0;
        v73 = *(_QWORD *)v102;
        do
        {
          for (n = 0; n != v71; ++n)
          {
            if (*(_QWORD *)v102 != v73)
              objc_enumerationMutation(v67);
            objc_msgSend_objectForKeyedSubscript_(v91, v70, *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * n));
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_discoverable(v75, v76, v77) == 1)
              v72 = 1;

          }
          v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v70, (uint64_t)&v101, v121, 16);
        }
        while (v71);
      }
      else
      {
        v72 = 0;
      }

      objc_msgSend_setEnabledPermissions_(v66, v78, v72);
      objc_msgSend_allObjects(v67, v79, v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setContainerIDs_(v66, v82, (uint64_t)v81);

      objc_msgSend_setApplicationBundleIDs_(v66, v83, (uint64_t)v38);
      objc_msgSend_addObject_(v88, v84, (uint64_t)v66);

      v5 = v92;
    }
    while (objc_msgSend_count(v92, v85, v86));
  }

  return v88;
}

- (NSArray)containerPrivacySettings
{
  return self->_containerPrivacySettings;
}

- (void)setContainerPrivacySettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerPrivacySettings, 0);
}

@end
