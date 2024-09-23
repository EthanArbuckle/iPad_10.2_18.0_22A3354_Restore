@implementation ICLWorkspace

- (ICLWorkspace)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICLWorkspace;
  return -[ICLWorkspace init](&v3, sel_init);
}

+ (id)defaultWorkspace
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__ICLWorkspace_defaultWorkspace__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultWorkspace_onceToken != -1)
    dispatch_once(&defaultWorkspace_onceToken, block);
  return (id)defaultWorkspace_defaultInstance;
}

void __32__ICLWorkspace_defaultWorkspace__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)defaultWorkspace_defaultInstance;
  defaultWorkspace_defaultInstance = (uint64_t)v0;

}

- (BOOL)enumerateBuiltInSystemContentWithBlock:(id)a3 error:(id *)a4
{
  id v5;
  MILaunchServicesDatabaseGatherer *v6;
  id v7;
  MILaunchServicesDatabaseGatherer *v8;
  BOOL v9;
  id v10;
  void *v11;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  v5 = a3;
  v16 = 1;
  if ((container_invalidate_code_signing_cache() & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    MOLogWrite();
  v6 = [MILaunchServicesDatabaseGatherer alloc];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __61__ICLWorkspace_enumerateBuiltInSystemContentWithBlock_error___block_invoke;
  v14[3] = &unk_1E6CB72A0;
  v7 = v5;
  v15 = v7;
  v8 = -[MILaunchServicesDatabaseGatherer initWithOptions:enumerator:](v6, "initWithOptions:enumerator:", 2, v14);
  v13 = 0;
  v9 = -[MILaunchServicesDatabaseGatherer performGatherWithError:](v8, "performGatherWithError:", &v13);
  v10 = v13;
  v11 = v10;
  if (a4 && !v9)
    *a4 = objc_retainAutorelease(v10);

  return v9;
}

void __61__ICLWorkspace_enumerateBuiltInSystemContentWithBlock_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v5)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (id)bundleIDsForContainerizedContentWithError:(id *)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__ICLWorkspace_bundleIDsForContainerizedContentWithError___block_invoke;
  v9[3] = &unk_1E6CB72C8;
  v5 = v4;
  v10 = v5;
  +[MIMCMContainer enumerateContainersWithClass:forPersona:isTransient:identifiers:groupIdentifiers:usingBlock:](MIMCMContainer, "enumerateContainersWithClass:forPersona:isTransient:identifiers:groupIdentifiers:usingBlock:", 1, 0, 0, 0, 0, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

    v5 = 0;
  }
  if (a3 && !v5)
    *a3 = objc_retainAutorelease(v6);
  v7 = (void *)objc_msgSend(v5, "copy");

  return v7;
}

uint64_t __58__ICLWorkspace_bundleIDsForContainerizedContentWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

  return 1;
}

+ (id)_connectionToInstallationDaemonWithError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  id v10;
  void *v11;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.mobile.installd"), 0);
  if (!v4)
  {
    _CreateAndLogError((uint64_t)"+[ICLWorkspace _connectionToInstallationDaemonWithError:]", 136, ICLWorkspaceErrorDomain[0], 2, 0, 0, CFSTR("Failed to create connection to %@"), v5, (uint64_t)CFSTR("com.apple.mobile.installd"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_5;
LABEL_7:
    v10 = objc_retainAutorelease(v10);
    v6 = 0;
    *a3 = v10;
    goto LABEL_10;
  }
  v6 = (void *)v4;
  MobileInstallerProtocolInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRemoteObjectInterface:", v7);

  if (!xpc_user_sessions_enabled())
  {
LABEL_9:
    objc_msgSend(v6, "resume");
    v10 = 0;
    goto LABEL_10;
  }
  if (xpc_user_sessions_get_foreground_uid() != -101)
  {
    objc_msgSend(v6, "_xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_connection_set_target_user_session_uid();

    goto LABEL_9;
  }
  v8 = ICLWorkspaceErrorDomain[0];
  xpc_strerror();
  _CreateAndLogError((uint64_t)"+[ICLWorkspace _connectionToInstallationDaemonWithError:]", 147, v8, 2, 0, 0, CFSTR("xpc_user_sessions_get_foreground_uid() failed with error %d - %s"), v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (a3)
    goto LABEL_7;
LABEL_5:
  v6 = 0;
LABEL_10:

  return v6;
}

- (void)triggerRegistrationForContainerizedContentWithOptions:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v5 = a3;
  v6 = a4;
  v21 = 0;
  objc_msgSend((id)objc_opt_class(), "_connectionToInstallationDaemonWithError:", &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v21;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __81__ICLWorkspace_triggerRegistrationForContainerizedContentWithOptions_completion___block_invoke;
    v18[3] = &unk_1E6CB72F0;
    v10 = v7;
    v19 = v10;
    v20 = v6;
    v13 = v9;
    v14 = 3221225472;
    v15 = __81__ICLWorkspace_triggerRegistrationForContainerizedContentWithOptions_completion___block_invoke_2;
    v16 = &unk_1E6CB7318;
    v17 = (id)MEMORY[0x1BCCAA218](v18);
    v11 = v17;
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", &v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "triggerRegistrationForContainerizedContentForOptions:withCompletion:", v5, v11, v13, v14, v15, v16);

  }
  else
  {
    (*((void (**)(id, id))v6 + 2))(v6, v8);
  }

}

void __81__ICLWorkspace_triggerRegistrationForContainerizedContentWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __81__ICLWorkspace_triggerRegistrationForContainerizedContentWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)triggerRegistrationForContainerizedContentWithOptions:(id)a3 withError:(id *)a4
{
  id v5;
  void *v6;
  id *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  BOOL v12;
  _QWORD v14[6];
  _QWORD v15[5];
  id obj;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__5;
  v25 = __Block_byref_object_dispose__5;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v6 = (void *)objc_opt_class();
  v7 = (id *)(v22 + 5);
  obj = (id)v22[5];
  objc_msgSend(v6, "_connectionToInstallationDaemonWithError:", &obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v7, obj);
  if (v8)
  {
    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __80__ICLWorkspace_triggerRegistrationForContainerizedContentWithOptions_withError___block_invoke;
    v15[3] = &unk_1E6CB7340;
    v15[4] = &v21;
    objc_msgSend(v8, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __80__ICLWorkspace_triggerRegistrationForContainerizedContentWithOptions_withError___block_invoke_2;
    v14[3] = &unk_1E6CB7368;
    v14[4] = &v21;
    v14[5] = &v17;
    objc_msgSend(v10, "triggerRegistrationForContainerizedContentForOptions:withCompletion:", v5, v14);

    objc_msgSend(v8, "invalidate");
  }
  v11 = *((unsigned __int8 *)v18 + 24);
  if (a4 && !*((_BYTE *)v18 + 24))
  {
    *a4 = objc_retainAutorelease((id)v22[5]);
    v11 = *((unsigned __int8 *)v18 + 24);
  }
  v12 = v11 != 0;

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v12;
}

void __80__ICLWorkspace_triggerRegistrationForContainerizedContentWithOptions_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __80__ICLWorkspace_triggerRegistrationForContainerizedContentWithOptions_withError___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (void)triggerRegistrationForDiskImageContentWithOptions:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v5 = a3;
  v6 = a4;
  v21 = 0;
  objc_msgSend((id)objc_opt_class(), "_connectionToInstallationDaemonWithError:", &v21);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v21;
  if (v7)
  {
    v9 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __77__ICLWorkspace_triggerRegistrationForDiskImageContentWithOptions_completion___block_invoke;
    v18[3] = &unk_1E6CB72F0;
    v10 = v7;
    v19 = v10;
    v20 = v6;
    v13 = v9;
    v14 = 3221225472;
    v15 = __77__ICLWorkspace_triggerRegistrationForDiskImageContentWithOptions_completion___block_invoke_2;
    v16 = &unk_1E6CB7318;
    v17 = (id)MEMORY[0x1BCCAA218](v18);
    v11 = v17;
    objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", &v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "triggerRegistrationForDiskImageContentForOptions:withCompletion:", v5, v11, v13, v14, v15, v16);

  }
  else
  {
    (*((void (**)(id, id))v6 + 2))(v6, v8);
  }

}

void __77__ICLWorkspace_triggerRegistrationForDiskImageContentWithOptions_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __77__ICLWorkspace_triggerRegistrationForDiskImageContentWithOptions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)infoForLaunchServicesWithWrapperURL:(id)a3 forBundleIdentifier:(id)a4 withError:(id *)a5
{
  void *v5;
  void *v6;

  -[ICLWorkspace bundleRecordsForLaunchServicesWithWrapperURL:forBundleIdentifier:withError:](self, "bundleRecordsForLaunchServicesWithWrapperURL:forBundleIdentifier:withError:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICLBundleRecord bundleRecordArrayToInfoDictionaryArray:](ICLBundleRecord, "bundleRecordArrayToInfoDictionaryArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)bundleRecordsForLaunchServicesWithWrapperURL:(id)a3 forBundleIdentifier:(id)a4 withError:(id *)a5
{
  uint64_t v5;
  void *v7;
  void *v8;

  _CreateAndLogError((uint64_t)"-[ICLWorkspace bundleRecordsForLaunchServicesWithWrapperURL:forBundleIdentifier:withError:]", 307, ICLWorkspaceErrorDomain[0], 4, 0, 0, CFSTR("%s is unavailable on this platform"), v5, (uint64_t)"-[ICLWorkspace bundleRecordsForLaunchServicesWithWrapperURL:forBundleIdentifier:withError:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a5)
    *a5 = objc_retainAutorelease(v7);

  return 0;
}

- (BOOL)enumerateCryptexContentWithBlock:(id)a3 error:(id *)a4
{
  id v5;
  MILaunchServicesDatabaseGatherer *v6;
  id v7;
  MILaunchServicesDatabaseGatherer *v8;
  BOOL v9;
  id v10;
  void *v11;
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  v6 = [MILaunchServicesDatabaseGatherer alloc];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __55__ICLWorkspace_enumerateCryptexContentWithBlock_error___block_invoke;
  v14[3] = &unk_1E6CB72A0;
  v7 = v5;
  v15 = v7;
  v8 = -[MILaunchServicesDatabaseGatherer initWithOptions:enumerator:](v6, "initWithOptions:enumerator:", 8, v14);
  v13 = 0;
  v9 = -[MILaunchServicesDatabaseGatherer performGatherWithError:](v8, "performGatherWithError:", &v13);
  v10 = v13;
  v11 = v10;
  if (a4 && !v9)
    *a4 = objc_retainAutorelease(v10);

  return v9;
}

void __55__ICLWorkspace_enumerateCryptexContentWithBlock_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (v5)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (id)bundleRecordsWithFrameworkURL:(id)a3 options:(id)a4 withError:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v29;
  id v30;
  id v31;
  _BOOL4 v32;
  id v33;
  id *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  objc_opt_class();
  v11 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  if (!v12)
  {
    _CreateAndLogError((uint64_t)"-[ICLWorkspace bundleRecordsWithFrameworkURL:options:withError:]", 363, CFSTR("MIInstallerErrorDomain"), 25, 0, 0, CFSTR("frameworkBundleURL parameter was not a valid URL"), v13, (uint64_t)v29);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (v8)
  {
    objc_opt_class();
    v14 = v8;
    v15 = (objc_opt_isKindOfClass() & 1) != 0 ? v14 : 0;

    if (!v15)
    {
      _CreateAndLogError((uint64_t)"-[ICLWorkspace bundleRecordsWithFrameworkURL:options:withError:]", 368, CFSTR("MIInstallerErrorDomain"), 25, 0, 0, CFSTR("options parameter was not a dictionary"), v17, (uint64_t)v29);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      goto LABEL_21;
    }
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    objc_msgSend(v11, "path");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v8;
    MOLogWrite();

  }
  v40 = 0;
  +[MIBundle bundleForURL:error:](MIExecutableBundle, "bundleForURL:error:", v11, &v40, v29, v30);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v16 = v40;
  if (!v12)
  {
LABEL_19:
    v15 = 0;
    goto LABEL_21;
  }
  v18 = v10;
  v19 = v9;
  v34 = a5;
  +[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "primaryPersonaString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v16;
  +[MILaunchServicesDatabaseGatherer entryForBundle:inContainer:forPersona:withError:](MILaunchServicesDatabaseGatherer, "entryForBundle:inContainer:forPersona:withError:", v12, 0, v21, &v39);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v33 = v39;

  if (v15)
  {
    objc_msgSend(v12, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, v22);

    objc_msgSend(v9, "addObject:", v15);
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __64__ICLWorkspace_bundleRecordsWithFrameworkURL_options_withError___block_invoke;
    v36[3] = &unk_1E6CB7390;
    v37 = v18;
    v31 = v9;
    v38 = v31;
    v23 = (void *)MEMORY[0x1BCCAA218](v36);
    +[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "primaryPersonaString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v33;
    v32 = +[MILaunchServicesDatabaseGatherer enumerateAppExtensionsInBundle:forPersona:updatingAppExtensionParentID:ensureAppExtensionsAreExecutable:installProfiles:error:enumerator:](MILaunchServicesDatabaseGatherer, "enumerateAppExtensionsInBundle:forPersona:updatingAppExtensionParentID:ensureAppExtensionsAreExecutable:installProfiles:error:enumerator:", v12, v25, 0, 0, 0, &v35, v23);
    v16 = v35;

    v9 = v19;
    v10 = v18;

    a5 = v34;
    if (v32)
    {
      v26 = (void *)objc_msgSend(v31, "copy");
      if (!v34)
        goto LABEL_24;
      goto LABEL_22;
    }
LABEL_21:
    v26 = 0;
    if (!a5)
      goto LABEL_24;
    goto LABEL_22;
  }
  v26 = 0;
  v16 = v33;
  a5 = v34;
  v10 = v18;
  if (!v34)
    goto LABEL_24;
LABEL_22:
  if (!v26)
    *a5 = objc_retainAutorelease(v16);
LABEL_24:
  v27 = v26;

  return v27;
}

void __64__ICLWorkspace_bundleRecordsWithFrameworkURL_options_withError___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)containerizedAppBundleRecordsForIdentity:(id)a3 inDomain:(unint64_t)a4 options:(id)a5 withError:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  id *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v19[6];
  _QWORD v20[5];
  id obj;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v9 = a3;
  v10 = a5;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__5;
  v32 = __Block_byref_object_dispose__5;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__5;
  v26 = __Block_byref_object_dispose__5;
  v27 = 0;
  v11 = (void *)objc_opt_class();
  v12 = (id *)(v23 + 5);
  obj = (id)v23[5];
  objc_msgSend(v11, "_connectionToInstallationDaemonWithError:", &obj);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v12, obj);
  if (v13)
  {
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __84__ICLWorkspace_containerizedAppBundleRecordsForIdentity_inDomain_options_withError___block_invoke;
    v20[3] = &unk_1E6CB7340;
    v20[4] = &v22;
    objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __84__ICLWorkspace_containerizedAppBundleRecordsForIdentity_inDomain_options_withError___block_invoke_2;
    v19[3] = &unk_1E6CB73B8;
    v19[4] = &v22;
    v19[5] = &v28;
    objc_msgSend(v15, "fetchInfoForContainerizedAppWithIdentity:inDomain:options:completion:", v9, a4, v10, v19);

    objc_msgSend(v13, "invalidate");
  }
  v16 = (void *)v29[5];
  if (a6 && !v16)
  {
    *a6 = objc_retainAutorelease((id)v23[5]);
    v16 = (void *)v29[5];
  }
  v17 = v16;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v17;
}

void __84__ICLWorkspace_containerizedAppBundleRecordsForIdentity_inDomain_options_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __84__ICLWorkspace_containerizedAppBundleRecordsForIdentity_inDomain_options_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

- (id)diskUsageForLaunchServicesWithBundleIDs:(id)a3 options:(id)a4 withError:(id *)a5
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v20[6];
  _QWORD v21[5];
  id obj;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v7 = a3;
  v9 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__5;
  v33 = __Block_byref_object_dispose__5;
  v34 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__5;
  v27 = __Block_byref_object_dispose__5;
  v28 = 0;
  if (v9)
  {
    v10 = (void *)objc_opt_class();
    v11 = (id *)(v24 + 5);
    obj = (id)v24[5];
    objc_msgSend(v10, "_connectionToInstallationDaemonWithError:", &obj);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v11, obj);
    if (v12)
    {
      v13 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __74__ICLWorkspace_diskUsageForLaunchServicesWithBundleIDs_options_withError___block_invoke;
      v21[3] = &unk_1E6CB7340;
      v21[4] = &v23;
      objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", v21);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v13;
      v20[1] = 3221225472;
      v20[2] = (uint64_t)__74__ICLWorkspace_diskUsageForLaunchServicesWithBundleIDs_options_withError___block_invoke_2;
      v20[3] = (uint64_t)&unk_1E6CB73E0;
      v20[4] = (uint64_t)&v23;
      v20[5] = (uint64_t)&v29;
      objc_msgSend(v14, "fetchDiskUsageForIdentifiers:withOptions:completion:", v7, v9, v20);

      objc_msgSend(v12, "invalidate");
    }
  }
  else
  {
    _CreateAndLogError((uint64_t)"-[ICLWorkspace diskUsageForLaunchServicesWithBundleIDs:options:withError:]", 453, CFSTR("MIInstallerErrorDomain"), 25, 0, 0, CFSTR("options dictionary parameter was not specified"), v8, v20[0]);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v24[5];
    v24[5] = v15;

    v12 = 0;
  }
  v17 = (void *)v30[5];
  if (a5 && !v17)
  {
    *a5 = objc_retainAutorelease((id)v24[5]);
    v17 = (void *)v30[5];
  }
  v18 = v17;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v18;
}

void __74__ICLWorkspace_diskUsageForLaunchServicesWithBundleIDs_options_withError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __74__ICLWorkspace_diskUsageForLaunchServicesWithBundleIDs_options_withError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v8 = v5;
  }
  else
  {
    v7 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v8 = v11;
  }
  v9 = v8;
  v10 = *v7;
  *v7 = v9;

}

@end
