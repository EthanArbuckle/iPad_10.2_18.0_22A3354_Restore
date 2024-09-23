@implementation MILaunchServicesDatabaseGatherer

- (MILaunchServicesDatabaseGatherer)initWithOptions:(unint64_t)a3 personaUniqueString:(id)a4 enumerator:(id)a5
{
  id v9;
  id v10;
  MILaunchServicesDatabaseGatherer *v11;
  uint64_t v12;
  NSMutableSet *internalApps;
  uint64_t v14;
  NSMutableSet *systemApps;
  uint64_t v16;
  NSMutableSet *userApps;
  uint64_t v18;
  NSMutableSet *appExtensions;
  uint64_t v20;
  NSMutableSet *frameworks;
  uint64_t v22;
  NSMutableSet *coreServices;
  uint64_t v24;
  NSMutableSet *systemAppPlaceholders;
  void *v26;
  uint64_t v27;
  id enumerator;
  objc_super v30;

  v9 = a4;
  v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)MILaunchServicesDatabaseGatherer;
  v11 = -[MILaunchServicesDatabaseGatherer init](&v30, sel_init);
  if (v11)
  {
    v12 = objc_opt_new();
    internalApps = v11->_internalApps;
    v11->_internalApps = (NSMutableSet *)v12;

    v14 = objc_opt_new();
    systemApps = v11->_systemApps;
    v11->_systemApps = (NSMutableSet *)v14;

    v16 = objc_opt_new();
    userApps = v11->_userApps;
    v11->_userApps = (NSMutableSet *)v16;

    v18 = objc_opt_new();
    appExtensions = v11->_appExtensions;
    v11->_appExtensions = (NSMutableSet *)v18;

    v20 = objc_opt_new();
    frameworks = v11->_frameworks;
    v11->_frameworks = (NSMutableSet *)v20;

    v22 = objc_opt_new();
    coreServices = v11->_coreServices;
    v11->_coreServices = (NSMutableSet *)v22;

    v24 = objc_opt_new();
    systemAppPlaceholders = v11->_systemAppPlaceholders;
    v11->_systemAppPlaceholders = (NSMutableSet *)v24;

    +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v11->_shouldUpdateAppExtensionDataContainersWithParentID = objc_msgSend(v26, "haveUpdatedAppExtensionDataContainersWithParentID") ^ 1;

    if (v11->_shouldUpdateAppExtensionDataContainersWithParentID && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5))
      MOLogWrite();
    v27 = MEMORY[0x1BCCAA218](v10);
    enumerator = v11->_enumerator;
    v11->_enumerator = (id)v27;

    v11->_gatherOptions = a3;
    objc_storeStrong((id *)&v11->_personaUniqueString, a4);
  }

  return v11;
}

- (MILaunchServicesDatabaseGatherer)initWithOptions:(unint64_t)a3 enumerator:(id)a4
{
  return -[MILaunchServicesDatabaseGatherer initWithOptions:personaUniqueString:enumerator:](self, "initWithOptions:personaUniqueString:enumerator:", a3, 0, a4);
}

+ (id)_createPluginDataContainerForAppexBundle:(id)a3 forPersona:(id)a4 setParent:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v14;
  id v15;
  char v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v16 = 0;
  v15 = 0;
  objc_msgSend(v7, "dataContainerCreatingIfNeeded:forPersona:makeLive:created:error:", 1, v8, 1, &v16, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;
  if (v10)
  {
    if (v9 && !v16)
      objc_msgSend(v10, "setParentBundleID:", v9);
    v12 = v10;
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    objc_msgSend(v7, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  return v10;
}

+ (BOOL)enumerateAppExtensionsInBundle:(id)a3 forPersona:(id)a4 updatingAppExtensionParentID:(BOOL)a5 ensureAppExtensionsAreExecutable:(BOOL)a6 installProfiles:(BOOL)a7 error:(id *)a8 enumerator:(id)a9
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  char v33;
  id v34;
  void *v35;
  MIInstalledInfoGatherer *v36;
  void *v37;
  MIInstalledInfoGatherer *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  void *v49;
  BOOL IsMalformedBundleError;
  void *v51;
  void *v52;
  id *v53;
  void *v55;
  id v56;
  id v57;
  void *v58;
  id v60;
  id v61;
  void (**v62)(id, void *, _QWORD);
  _BOOL4 v63;
  _BOOL4 v64;
  _BOOL4 v65;
  uint64_t v66;
  id obj;
  void *v68;
  void *v69;
  MIInstalledInfoGatherer *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  id v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  id v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  id v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v63 = a6;
  v64 = a7;
  v65 = a5;
  v96 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v61 = a4;
  v62 = (void (**)(id, void *, _QWORD))a9;
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = 0;
  v60 = v10;
  objc_msgSend(v10, "appExtensionBundlesWithError:", &v92);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v92;
  if (!v12)
  {
    v52 = 0;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    IsMalformedBundleError = _IsMalformedBundleError(v13);
    v53 = a8;
    v51 = v60;
    if (a8)
      goto LABEL_64;
    goto LABEL_66;
  }
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v58 = v12;
  obj = v12;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
  if (!v14)
  {
LABEL_57:

    IsMalformedBundleError = 1;
    v51 = v60;
    v52 = v58;
    goto LABEL_66;
  }
  v15 = v14;
  v73 = *(_QWORD *)v89;
  v68 = v11;
LABEL_4:
  v16 = 0;
  v66 = v15;
  while (1)
  {
    if (*(_QWORD *)v89 != v73)
      objc_enumerationMutation(obj);
    v17 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v16);
    v87 = v13;
    v18 = objc_msgSend(v17, "validateBundleMetadataWithError:", &v87, v55, v56, v57);
    v19 = v87;

    if ((v18 & 1) != 0)
      break;
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      goto LABEL_55;
    objc_msgSend(v17, "bundleURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "path");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v55 = v21;
    MOLogWrite();
LABEL_54:

LABEL_55:
    v13 = v19;
    if (++v16 == v15)
    {
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
      if (v15)
        goto LABEL_4;
      goto LABEL_57;
    }
  }
  v20 = (void *)objc_opt_new();
  if (v65)
    v21 = v11;
  else
    v21 = 0;
  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "deviceHasPersonas");

  if (!v23)
  {
    objc_msgSend((id)objc_opt_class(), "_createPluginDataContainerForAppexBundle:forPersona:setParent:", v17, 0, v21);
    v26 = (id)objc_claimAutoreleasedReturnValue();
    if (v26)
      objc_msgSend(v20, "addObject:", v26);
LABEL_31:

    if (v63)
    {
      v81 = v19;
      v33 = objc_msgSend(v17, "makeExecutableWithError:", &v81);
      v34 = v81;
      v35 = v19;
      v19 = v34;

      if ((v33 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      {
        objc_msgSend(v17, "identifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v19;
        MOLogWrite();

      }
    }
    if (v64)
      objc_msgSend(v17, "installEmbeddedProvisioningProfileWithProgress:", 0);
    v36 = [MIInstalledInfoGatherer alloc];
    v37 = (void *)objc_msgSend(v20, "copy");
    v38 = -[MIInstalledInfoGatherer initWithAppExtensionBundle:inBundleIdentifier:dataContainers:](v36, "initWithAppExtensionBundle:inBundleIdentifier:dataContainers:", v17, v11, v37);

    v80 = v19;
    -[MIInstalledInfoGatherer bundleRecordWithError:](v38, "bundleRecordWithError:", &v80);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v80;

    if (v39)
    {
      v69 = v39;
      v70 = v38;
      v71 = v20;
      v72 = v16;
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v40 = v20;
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v76, v93, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v77;
        do
        {
          for (i = 0; i != v42; ++i)
          {
            if (*(_QWORD *)v77 != v43)
              objc_enumerationMutation(v40);
            v45 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
            objc_msgSend(v45, "rawContainer", v55);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend(v46, "isNew");

            if (v47)
            {
              +[MIContainerProtectionManager defaultManager](MIContainerProtectionManager, "defaultManager");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "setDataProtectionOnDataContainer:forNewBundle:retryIfLocked:", v45, v17, 0);

            }
          }
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v76, v93, 16);
        }
        while (v42);
      }

      objc_msgSend(v17, "identifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v69;
      ((void (**)(id, void *, void *))v62)[2](v62, v49, v69);
      v11 = v68;
      v20 = v71;
      v16 = v72;
      v38 = v70;
    }
    else
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_53;
      objc_msgSend(v17, "identifier", v55);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v11;
      v57 = v75;
      v55 = v49;
      MOLogWrite();
    }

LABEL_53:
    v15 = v66;
    v19 = v75;
    goto LABEL_54;
  }
  if (v61)
  {
    v74 = v19;
    v24 = v16;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v26 = v25;
    v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v83;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v83 != v30)
            objc_enumerationMutation(v26);
          objc_msgSend((id)objc_opt_class(), "_createPluginDataContainerForAppexBundle:forPersona:setParent:", v17, *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * j), v21);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (v32)
            objc_msgSend(v20, "addObject:", v32);

        }
        v29 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
      }
      while (v29);
    }

    v16 = v24;
    v11 = v68;
    v19 = v74;
    goto LABEL_31;
  }
  v27 = v20;
  v86 = v19;
  _AllPersonasAssociatedWithIdentifier(v11, &v86);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v86;

  if (v25)
  {
    v24 = v16;
    v74 = v13;
    v20 = v27;
    goto LABEL_21;
  }

  IsMalformedBundleError = 0;
  v53 = a8;
  v51 = v60;
  v52 = v58;
  if (!a8)
    goto LABEL_66;
LABEL_64:
  if (!IsMalformedBundleError)
  {
    v13 = objc_retainAutorelease(v13);
    IsMalformedBundleError = 0;
    *v53 = v13;
  }
LABEL_66:

  return IsMalformedBundleError;
}

+ (id)_createDataContainerAndSetDataProtectionForBundle:(id)a3 forPersona:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v14;
  id v15;
  char v16;

  v7 = a3;
  v8 = a4;
  v16 = 0;
  v15 = 0;
  objc_msgSend(v7, "dataContainerCreatingIfNeeded:forPersona:makeLive:created:error:", 1, v8, 1, &v16, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v9)
  {
    if (v16)
    {
      +[MIContainerProtectionManager defaultManager](MIContainerProtectionManager, "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDataProtectionOnDataContainer:forNewBundle:retryIfLocked:", v9, v7, 0);

    }
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(v7, "bundleURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    if (a5)
      *a5 = objc_retainAutorelease(v10);
  }

  return v9;
}

+ (id)entryForBundle:(id)a3 inContainer:(id)a4 forPersona:(id)a5 withError:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  MIInstalledInfoGatherer *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v42;
  id *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  id v56;
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_opt_new();
  if (!objc_msgSend(v9, "needsDataContainer"))
  {
    v21 = a6;
    v22 = 0;
    goto LABEL_31;
  }
  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "deviceHasPersonas");

  if (!v14)
  {
    v50 = 0;
    objc_msgSend((id)objc_opt_class(), "_createDataContainerAndSetDataProtectionForBundle:forPersona:error:", v9, 0, &v50);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v24 = v50;
    if (!v23)
      goto LABEL_39;
    v21 = a6;
    objc_msgSend(v12, "addObject:", v23);
    goto LABEL_30;
  }
  v48 = v11;
  +[MIUserManagement sharedInstance](MIUserManagement, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "enterprisePersonaUniqueString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  objc_msgSend(v15, "multiPersonaSADAppBundleIDsWithError:", &v57);
  v17 = objc_claimAutoreleasedReturnValue();
  v19 = v57;
  v47 = (void *)v17;
  if (!v17)
  {
    _CreateAndLogError((uint64_t)"+[MILaunchServicesDatabaseGatherer entryForBundle:inContainer:forPersona:withError:]", 299, CFSTR("MIInstallerErrorDomain"), 4, v19, 0, CFSTR("Failed to query multi persona SAD apps from UserManagement"), v18, v42);
    v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

    goto LABEL_22;
  }
  v46 = v16;
  if (!v48)
  {
    objc_msgSend(v9, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v19;
    _AllPersonasAssociatedWithIdentifier(v25, &v56);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v56;

    v16 = v46;
    v19 = v24;
    if (v20)
      goto LABEL_11;
LABEL_22:

    v23 = 0;
    v11 = v48;
LABEL_38:

LABEL_39:
    if (a6)
    {
LABEL_40:
      v24 = objc_retainAutorelease(v24);
      v40 = 0;
      *a6 = v24;
      goto LABEL_43;
    }
LABEL_42:
    v40 = 0;
    goto LABEL_43;
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
  v44 = v15;
  v45 = v10;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v23 = v20;
  v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v53;
    v24 = v19;
    v43 = a6;
    while (2)
    {
      v29 = 0;
      v30 = v24;
      do
      {
        if (*(_QWORD *)v53 != v28)
          objc_enumerationMutation(v23);
        v31 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v29);
        v32 = (void *)objc_opt_class();
        v51 = v30;
        objc_msgSend(v32, "_createDataContainerAndSetDataProtectionForBundle:forPersona:error:", v9, v31, &v51);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v51;

        if (!v33)
        {

          v19 = v23;
          v15 = v44;
          v10 = v45;
          a6 = v43;
          v16 = v46;
          goto LABEL_21;
        }
        objc_msgSend(v12, "addObject:", v33);

        ++v29;
        v30 = v24;
      }
      while (v27 != v29);
      v27 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      a6 = v43;
      if (v27)
        continue;
      break;
    }
  }
  else
  {
    v24 = v19;
  }

  v10 = v45;
  if (v46)
  {
    objc_msgSend(v9, "identifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v47, "containsObject:", v34);

    if (v35)
    {
      objc_msgSend(v9, "dataContainerCreatingIfNeeded:forPersona:makeLive:created:error:", 0, v46, 1, 0, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
        objc_msgSend(v12, "addObject:", v36);

    }
  }
  v21 = a6;

  v11 = v48;
LABEL_30:

  v22 = v24;
LABEL_31:
  v37 = [MIInstalledInfoGatherer alloc];
  v38 = (void *)objc_msgSend(v12, "copy");
  if (v10)
    v39 = -[MIInstalledInfoGatherer initWithBundleContainer:dataContainers:](v37, "initWithBundleContainer:dataContainers:", v10, v38);
  else
    v39 = -[MIInstalledInfoGatherer initWithBundle:dataContainers:](v37, "initWithBundle:dataContainers:", v9, v38);
  v23 = (id)v39;

  v49 = v22;
  objc_msgSend(v23, "bundleRecordWithError:", &v49);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v49;

  if (!v40)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
    {
      a6 = v21;
      if (v21)
        goto LABEL_40;
      goto LABEL_42;
    }
    objc_msgSend(v9, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();
    a6 = v21;
    goto LABEL_38;
  }
LABEL_43:

  return v40;
}

+ (id)fetchInfoForBundle:(id)a3 forPersona:(id)a4 inContainer:(id)a5 withError:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  int v20;
  id v21;
  void *v22;
  id v23;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v29 = 0;
  objc_msgSend((id)objc_opt_class(), "entryForBundle:inContainer:forPersona:withError:", v9, v11, v10, &v29);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v29;
  if (!v12)
  {
    v22 = 0;
    v18 = 0;
    v17 = 0;
    if (!a6)
      goto LABEL_10;
    goto LABEL_8;
  }
  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_opt_new();
  objc_msgSend(v9, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, v16);

  objc_msgSend(v14, "addObject:", v12);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __88__MILaunchServicesDatabaseGatherer_fetchInfoForBundle_forPersona_inContainer_withError___block_invoke;
  v26[3] = &unk_1E6CB7870;
  v17 = v15;
  v27 = v17;
  v18 = v14;
  v28 = v18;
  v19 = (void *)MEMORY[0x1BCCAA218](v26);
  v25 = v13;
  v20 = objc_msgSend((id)objc_opt_class(), "enumerateAppExtensionsInBundle:forPersona:updatingAppExtensionParentID:ensureAppExtensionsAreExecutable:installProfiles:error:enumerator:", v9, v10, 0, 0, 0, &v25, v19);
  v21 = v25;

  if (v20)
    v22 = (void *)objc_msgSend(v18, "copy");
  else
    v22 = 0;
  v13 = v21;
  if (a6)
  {
LABEL_8:
    if (v13)
      *a6 = objc_retainAutorelease(v13);
  }
LABEL_10:
  v23 = v22;

  return v23;
}

void __88__MILaunchServicesDatabaseGatherer_fetchInfoForBundle_forPersona_inContainer_withError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12, v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bundleURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v12);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  }

}

- (BOOL)_scanAppExtensionsInBundle:(id)a3 inBundleContainer:(id)a4 withError:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  _BOOL8 shouldUpdateAppExtensionDataContainersWithParentID;
  _BOOL8 v15;
  id v17;
  _QWORD v18[5];

  v8 = a3;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __91__MILaunchServicesDatabaseGatherer__scanAppExtensionsInBundle_inBundleContainer_withError___block_invoke;
  v18[3] = &unk_1E6CB7898;
  v18[4] = self;
  v9 = (void *)MEMORY[0x1BCCAA218](v18);
  if (objc_msgSend(v8, "bundleType") == 10)
  {
    v10 = 0;
    v11 = 1;
  }
  else
  {
    v12 = objc_opt_class();
    -[MILaunchServicesDatabaseGatherer personaUniqueString](self, "personaUniqueString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    shouldUpdateAppExtensionDataContainersWithParentID = self->_shouldUpdateAppExtensionDataContainersWithParentID;
    v15 = a4 != 0;
    v17 = 0;
    v11 = 1;
    LOBYTE(v12) = objc_msgSend((id)v12, "enumerateAppExtensionsInBundle:forPersona:updatingAppExtensionParentID:ensureAppExtensionsAreExecutable:installProfiles:error:enumerator:", v8, v13, shouldUpdateAppExtensionDataContainersWithParentID, v15, 1, &v17, v9);
    v10 = v17;

    if ((v12 & 1) == 0)
    {
      if (a5)
      {
        v10 = objc_retainAutorelease(v10);
        v11 = 0;
        *a5 = v10;
      }
      else
      {
        v11 = 0;
      }
    }
  }

  return v11;
}

void __91__MILaunchServicesDatabaseGatherer__scanAppExtensionsInBundle_inBundleContainer_withError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "appExtensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v11);

  if (!v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "enumerator");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v9)[2](v9, v5, 0);

    objc_msgSend(*(id *)(a1 + 32), "appExtensions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v11);
    goto LABEL_6;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    objc_msgSend(v5, "bundleURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

LABEL_6:
  }

}

- (BOOL)_markDriverKitExtensionsExecutableInBundle:(id)a3 withError:(id *)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  objc_msgSend(a3, "driverKitExtensionBundlesWithError:", &v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v22;
  if (!v5)
  {
    v15 = 0;
    if (!a4)
      goto LABEL_17;
    goto LABEL_15;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      v11 = 0;
      v12 = v6;
      do
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v17 = v12;
        v14 = objc_msgSend(v13, "makeExecutableWithError:", &v17);
        v6 = v17;

        if (!v14)
        {
          v15 = 0;
          goto LABEL_12;
        }
        objc_msgSend(v13, "installEmbeddedProvisioningProfileWithProgress:", 0);
        objc_msgSend(v13, "installMacStyleEmbeddedProvisioningProfileWithProgress:", 0);
        ++v11;
        v12 = v6;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v9)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_12:

  if (a4)
  {
LABEL_15:
    if (!v15)
      *a4 = objc_retainAutorelease(v6);
  }
LABEL_17:

  return v15;
}

- (id)_setForEntry:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  switch(objc_msgSend(v4, "applicationType"))
  {
    case 1:
      -[MILaunchServicesDatabaseGatherer coreServices](self, "coreServices");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
      -[MILaunchServicesDatabaseGatherer systemApps](self, "systemApps");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      -[MILaunchServicesDatabaseGatherer systemAppPlaceholders](self, "systemAppPlaceholders");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4:
      -[MILaunchServicesDatabaseGatherer userApps](self, "userApps");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 5:
      -[MILaunchServicesDatabaseGatherer internalApps](self, "internalApps");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    default:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MILaunchServicesDatabaseGatherer appExtensions](self, "appExtensions");
        v5 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v6 = (void *)v5;
        goto LABEL_10;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[MILaunchServicesDatabaseGatherer frameworks](self, "frameworks");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        MOLogWrite();
      v6 = 0;
LABEL_10:

      return v6;
  }
}

- (BOOL)_scanBundle:(id)a3 inContainer:(id)a4 addingToBundleSet:(id)a5 enumeratingEntry:(id)a6 withError:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  id v19;
  BOOL v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  BOOL v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  BOOL v36;
  id v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v51;
  id v53;
  id v54;
  uint8_t buf[4];
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v11, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "containsObject:", v15);

  if ((v16 & 1) != 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      objc_msgSend(v11, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "path");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    v19 = 0;
LABEL_6:
    v20 = 1;
    goto LABEL_41;
  }
  if (v14)
  {
    -[MILaunchServicesDatabaseGatherer enumerator](self, "enumerator");
    v21 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v21)[2](v21, v14, 0);

  }
  objc_msgSend(v11, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v22);

  if (MILogHandleForSignpost_onceToken_0 != -1)
    dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
  v23 = (void *)MILogHandleForSignpost_logHandle_0;
  if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
  {
    v24 = v23;
    objc_msgSend(v11, "bundleURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "path");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v56 = v26;
    _os_signpost_emit_with_name_impl(&dword_1B76F3000, v24, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ScanPlugins", "Scanning plugins in bundle at %@", buf, 0xCu);

  }
  v54 = 0;
  v27 = -[MILaunchServicesDatabaseGatherer _scanAppExtensionsInBundle:inBundleContainer:withError:](self, "_scanAppExtensionsInBundle:inBundleContainer:withError:", v11, v12, &v54);
  v19 = v54;
  if (!v27)
  {
    if (MILogHandleForSignpost_onceToken_0 != -1)
      dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
    v42 = (void *)MILogHandleForSignpost_logHandle_0;
    if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
    {
      v43 = v42;
      objc_msgSend(v11, "bundleURL");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "path");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v56 = v45;
      _os_signpost_emit_with_name_impl(&dword_1B76F3000, v43, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ScanPlugins", "[FAIL] Done scanning plugins in bundle at %@", buf, 0xCu);

    }
    goto LABEL_38;
  }
  if (MILogHandleForSignpost_onceToken_0 != -1)
    dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
  v28 = (void *)MILogHandleForSignpost_logHandle_0;
  if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
  {
    v29 = v28;
    objc_msgSend(v11, "bundleURL");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "path");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v56 = v31;
    _os_signpost_emit_with_name_impl(&dword_1B76F3000, v29, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ScanPlugins", "Done scanning plugins in bundle at %@", buf, 0xCu);

  }
  if (!v12)
    goto LABEL_6;
  if (MILogHandleForSignpost_onceToken_0 != -1)
    dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
  v32 = (void *)MILogHandleForSignpost_logHandle_0;
  if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
  {
    v33 = v32;
    objc_msgSend(v11, "bundleURL");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "path");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v56 = v35;
    _os_signpost_emit_with_name_impl(&dword_1B76F3000, v33, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MarkDriverKitExtensionsExecutable", "Mark DriverKit extensions in bundle as executable at %@", buf, 0xCu);

  }
  v53 = v19;
  v36 = -[MILaunchServicesDatabaseGatherer _markDriverKitExtensionsExecutableInBundle:withError:](self, "_markDriverKitExtensionsExecutableInBundle:withError:", v11, &v53);
  v37 = v53;

  if (!v36)
  {
    if (MILogHandleForSignpost_onceToken_0 != -1)
      dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
    v46 = (void *)MILogHandleForSignpost_logHandle_0;
    if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
    {
      v47 = v46;
      objc_msgSend(v11, "bundleURL");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "path");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v56 = v49;
      _os_signpost_emit_with_name_impl(&dword_1B76F3000, v47, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MarkDriverKitExtensionsExecutable", "[FAIL] Done marking DriverKit extensions in bundle as executable at %@", buf, 0xCu);

    }
    v19 = v37;
LABEL_38:
    if (a7)
    {
      v19 = objc_retainAutorelease(v19);
      v20 = 0;
      *a7 = v19;
    }
    else
    {
      v20 = 0;
    }
    goto LABEL_41;
  }
  if (MILogHandleForSignpost_onceToken_0 != -1)
    dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
  v38 = (void *)MILogHandleForSignpost_logHandle_0;
  if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
  {
    v39 = v38;
    objc_msgSend(v11, "bundleURL");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "path");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v56 = v41;
    _os_signpost_emit_with_name_impl(&dword_1B76F3000, v39, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MarkDriverKitExtensionsExecutable", "Done marking DriverKit extensions in bundle as executable at %@", buf, 0xCu);

  }
  v20 = 1;
  v19 = v37;
LABEL_41:

  return v20;
}

- (BOOL)scanExecutableBundle:(id)a3 inContainer:(id)a4 forPersona:(id)a5 withError:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  id v23;
  char v24;
  void *v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  const char *v31;
  void *v32;
  id v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (MILogHandleForSignpost_onceToken_0 != -1)
    dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
  v13 = (void *)MILogHandleForSignpost_logHandle_0;
  if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
  {
    v14 = v13;
    objc_msgSend(v10, "bundleURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v37 = v16;
    _os_signpost_emit_with_name_impl(&dword_1B76F3000, v14, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ScanBundle", "Scanning bundle at %@", buf, 0xCu);

  }
  v35 = 0;
  objc_msgSend((id)objc_opt_class(), "entryForBundle:inContainer:forPersona:withError:", v10, v11, v12, &v35);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v35;
  if (v17)
  {
    -[MILaunchServicesDatabaseGatherer _setForEntry:](self, "_setForEntry:", v17);
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v21 = (void *)v19;
      v34 = v18;
      v22 = -[MILaunchServicesDatabaseGatherer _scanBundle:inContainer:addingToBundleSet:enumeratingEntry:withError:](self, "_scanBundle:inContainer:addingToBundleSet:enumeratingEntry:withError:", v10, v11, v19, v17, &v34);
      v23 = v34;

      v18 = v21;
    }
    else
    {
      _CreateAndLogError((uint64_t)"-[MILaunchServicesDatabaseGatherer scanExecutableBundle:inContainer:forPersona:withError:]", 568, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Could not find appropriate set for app %@"), v20, (uint64_t)v17);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v22 = 0;
    }

    v18 = v23;
    if (!a6)
      goto LABEL_14;
  }
  else
  {
    v22 = 0;
    if (!a6)
      goto LABEL_14;
  }
  if (!v22)
    *a6 = objc_retainAutorelease(v18);
LABEL_14:
  if (v18)
    v24 = v22;
  else
    v24 = 1;
  if ((v24 & 1) == 0)
  {
    -[MILaunchServicesDatabaseGatherer enumerator](self, "enumerator");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[MILaunchServicesDatabaseGatherer enumerator](self, "enumerator");
      v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id))v26)[2](v26, 0, v18);

    }
  }
  if (v22)
  {
    if (MILogHandleForSignpost_onceToken_0 != -1)
      dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
    v27 = (void *)MILogHandleForSignpost_logHandle_0;
    if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
    {
      v28 = v27;
      objc_msgSend(v10, "bundleURL");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "path");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v30;
      v31 = "Done scanning bundle at %@";
LABEL_29:
      _os_signpost_emit_with_name_impl(&dword_1B76F3000, v28, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ScanBundle", v31, buf, 0xCu);

    }
  }
  else
  {
    if (MILogHandleForSignpost_onceToken_0 != -1)
      dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
    v32 = (void *)MILogHandleForSignpost_logHandle_0;
    if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
    {
      v28 = v32;
      objc_msgSend(v10, "bundleURL");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "path");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v37 = v30;
      v31 = "[FAIL] Done scanning bundle at %@";
      goto LABEL_29;
    }
  }

  return v22;
}

- (BOOL)scanAppExtensionsInFrameworkBundle:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  char v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD, _QWORD);
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  const char *v21;
  void *v22;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (MILogHandleForSignpost_onceToken_0 != -1)
    dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
  v7 = (void *)MILogHandleForSignpost_logHandle_0;
  if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
  {
    v8 = v7;
    objc_msgSend(v6, "bundleURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v10;
    _os_signpost_emit_with_name_impl(&dword_1B76F3000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ScanBundle", "Scanning framework at %@", buf, 0xCu);

  }
  -[MILaunchServicesDatabaseGatherer frameworks](self, "frameworks");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v12 = -[MILaunchServicesDatabaseGatherer _scanBundle:inContainer:addingToBundleSet:enumeratingEntry:withError:](self, "_scanBundle:inContainer:addingToBundleSet:enumeratingEntry:withError:", v6, 0, v11, 0, &v24);
  v13 = v24;

  if (a4 && !v12)
    *a4 = objc_retainAutorelease(v13);
  if (v13)
    v14 = v12;
  else
    v14 = 1;
  if ((v14 & 1) == 0)
  {
    -[MILaunchServicesDatabaseGatherer enumerator](self, "enumerator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[MILaunchServicesDatabaseGatherer enumerator](self, "enumerator");
      v16 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id))v16)[2](v16, 0, v13);

    }
  }
  if (v12)
  {
    if (MILogHandleForSignpost_onceToken_0 != -1)
      dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
    v17 = (void *)MILogHandleForSignpost_logHandle_0;
    if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
    {
      v18 = v17;
      objc_msgSend(v6, "bundleURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v20;
      v21 = "Done scanning framework at %@";
LABEL_23:
      _os_signpost_emit_with_name_impl(&dword_1B76F3000, v18, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ScanBundle", v21, buf, 0xCu);

    }
  }
  else
  {
    if (MILogHandleForSignpost_onceToken_0 != -1)
      dispatch_once(&MILogHandleForSignpost_onceToken_0, &__block_literal_global_8);
    v22 = (void *)MILogHandleForSignpost_logHandle_0;
    if (os_signpost_enabled((os_log_t)MILogHandleForSignpost_logHandle_0))
    {
      v18 = v22;
      objc_msgSend(v6, "bundleURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v20;
      v21 = "[FAIL] Done scanning framework at %@";
      goto LABEL_23;
    }
  }

  return v12;
}

- (void)errorOccurred:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[MILaunchServicesDatabaseGatherer enumerator](self, "enumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MILaunchServicesDatabaseGatherer enumerator](self, "enumerator");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, id))v5)[2](v5, 0, v6);

  }
}

- (BOOL)performGatherWithError:(id *)a3
{
  uint64_t v5;
  unint64_t v6;
  MIFilesystemScanner *v7;
  void *v8;
  MIFilesystemScanner *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;

  if ((-[MILaunchServicesDatabaseGatherer gatherOptions](self, "gatherOptions") & 2) != 0)
  {
    v5 = 2298;
  }
  else if ((-[MILaunchServicesDatabaseGatherer gatherOptions](self, "gatherOptions") & 4) != 0)
  {
    v5 = 1029;
  }
  else if ((-[MILaunchServicesDatabaseGatherer gatherOptions](self, "gatherOptions") & 8) != 0)
  {
    v5 = 768;
  }
  else if ((-[MILaunchServicesDatabaseGatherer gatherOptions](self, "gatherOptions") & 0x10) != 0)
  {
    v5 = 4;
  }
  else
  {
    v5 = 3967;
  }
  v6 = ((-[MILaunchServicesDatabaseGatherer gatherOptions](self, "gatherOptions") & 1) << 7) | v5;
  v7 = [MIFilesystemScanner alloc];
  -[MILaunchServicesDatabaseGatherer personaUniqueString](self, "personaUniqueString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[MIFilesystemScanner initWithScanOptions:personaUniqueString:](v7, "initWithScanOptions:personaUniqueString:", v6, v8);

  -[MIFilesystemScanner setDelegate:](v9, "setDelegate:", self);
  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "reScanSystemApps");

  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reScanInternalApps");

  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reScanCoreServicesApps");

  +[MIKeychainAccessGroupTracker sharedTracker](MIKeychainAccessGroupTracker, "sharedTracker");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "invalidateCache");

  v14 = -[MIFilesystemScanner performScanWithError:](v9, "performScanWithError:", a3);
  if (v14 && self->_shouldUpdateAppExtensionDataContainersWithParentID)
  {
    +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHaveUpdatedAppExtensionDataContainersWithParentID:", 1);

    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      MOLogWrite();
  }

  return v14;
}

- (NSMutableSet)coreServices
{
  return self->_coreServices;
}

- (NSMutableSet)systemApps
{
  return self->_systemApps;
}

- (NSMutableSet)userApps
{
  return self->_userApps;
}

- (NSMutableSet)internalApps
{
  return self->_internalApps;
}

- (NSMutableSet)appExtensions
{
  return self->_appExtensions;
}

- (NSMutableSet)frameworks
{
  return self->_frameworks;
}

- (NSMutableSet)systemAppPlaceholders
{
  return self->_systemAppPlaceholders;
}

- (id)enumerator
{
  return self->_enumerator;
}

- (unint64_t)gatherOptions
{
  return self->_gatherOptions;
}

- (BOOL)shouldUpdateAppExtensionDataContainersWithParentID
{
  return self->_shouldUpdateAppExtensionDataContainersWithParentID;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong(&self->_enumerator, 0);
  objc_storeStrong((id *)&self->_systemAppPlaceholders, 0);
  objc_storeStrong((id *)&self->_frameworks, 0);
  objc_storeStrong((id *)&self->_appExtensions, 0);
  objc_storeStrong((id *)&self->_internalApps, 0);
  objc_storeStrong((id *)&self->_userApps, 0);
  objc_storeStrong((id *)&self->_systemApps, 0);
  objc_storeStrong((id *)&self->_coreServices, 0);
}

@end
