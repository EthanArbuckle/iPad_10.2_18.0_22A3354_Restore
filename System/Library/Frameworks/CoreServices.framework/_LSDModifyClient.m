@implementation _LSDModifyClient

- (BOOL)_canRegisterOrUnregisterURL:(id)a3 withOptions:(unsigned int)a4
{
  char v4;
  id v6;
  BOOL v7;

  v4 = a4;
  v6 = a3;
  if ((v4 & 0x10) != 0)
  {
    if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isSystemServer"))
      v7 = -[_LSDModifyClient clientHasMIEntitlement:](self, "clientHasMIEntitlement:", CFSTR("InstallForLaunchServices"));
    else
      v7 = 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)canUnregisterWithOptions:(unsigned int)a3
{
  return -[_LSDModifyClient _canRegisterOrUnregisterURL:withOptions:](self, "_canRegisterOrUnregisterURL:withOptions:", 0, *(_QWORD *)&a3);
}

- (BOOL)canRegisterContainer
{
  return -[_LSDModifyClient _canRegisterOrUnregisterURL:withOptions:](self, "_canRegisterOrUnregisterURL:withOptions:", 0, 0);
}

- (void)willHandleInvocation:(id)a3 isReply:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  objc_super v8;

  v4 = a4;
  v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_LSDModifyClient;
  -[_LSDClient willHandleInvocation:isReply:](&v8, sel_willHandleInvocation_isReply_, v6, v4);
  _LSDatabaseGetSeedingGroup();
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

}

- (void)setDatabaseIsSeeded:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  BOOL v13;
  uint8_t buf[4];
  _BOOL4 v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v4 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _LSDefaultLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[_LSDClient XPCConnection](self, "XPCConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109376;
    v15 = v4;
    v16 = 1024;
    v17 = objc_msgSend(v8, "processIdentifier");
    _os_log_impl(&dword_182882000, v7, OS_LOG_TYPE_DEFAULT, "setting database seeded: %d from pid %d", buf, 0xEu);

  }
  _LSServer_DatabaseExecutionContext();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58___LSDModifyClient_setDatabaseIsSeeded_completionHandler___block_invoke;
  v11[3] = &unk_1E1043540;
  v13 = v4;
  v10 = v6;
  v12 = v10;
  -[LSDBExecutionContext syncWrite:]((uint64_t)v9, v11);

}

- (void)registerItemInfo:(id)a3 alias:(id)a4 diskImageAlias:(id)a5 bundleURL:(id)a6 installationPlist:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[4];
  id v28;
  _LSDModifyClient *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  MEMORY[0x186DAF208]();
  _LSServer_GetIOQueue();
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104___LSDModifyClient_registerItemInfo_alias_diskImageAlias_bundleURL_installationPlist_completionHandler___block_invoke;
  block[3] = &unk_1E1043568;
  v33 = v16;
  v34 = v19;
  v28 = v14;
  v29 = self;
  v30 = v17;
  v31 = v15;
  v32 = v18;
  v21 = v16;
  v22 = v18;
  v23 = v15;
  v24 = v17;
  v25 = v19;
  v26 = v14;
  dispatch_async(v20, block);

}

- (void)unregisterBundleUnit:(unsigned int)a3 options:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v5;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  unsigned int v19;
  int v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  const __CFString *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[2];

  v5 = *(_QWORD *)&a4;
  v32[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient unregisterBundleUnit:options:completionHandler:]");
  if (a3)
  {
    if (-[_LSDModifyClient canUnregisterWithOptions:](self, "canUnregisterWithOptions:", v5))
    {
      _LSDefaultLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        -[_LSDClient XPCConnection](self, "XPCConnection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218496;
        v26 = (int)objc_msgSend(v10, "processIdentifier");
        v27 = 2048;
        v28 = a3;
        v29 = 2048;
        v30 = v5;
        _os_log_impl(&dword_182882000, v9, OS_LOG_TYPE_DEFAULT, "client %lu will unregister unit %llx options %llx", buf, 0x20u);

      }
      _LSDatabaseSentinelIncrement();
      v11 = (void *)MEMORY[0x186DAE9BC](v8);
      v12 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __67___LSDModifyClient_unregisterBundleUnit_options_completionHandler___block_invoke;
      v21[3] = &unk_1E103FE30;
      v13 = v11;
      v22 = v13;
      v14 = (void *)MEMORY[0x186DAE9BC](v21);

      _LSServer_DatabaseExecutionContext();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v12;
      v17[1] = 3221225472;
      v17[2] = __67___LSDModifyClient_unregisterBundleUnit_options_completionHandler___block_invoke_2;
      v17[3] = &unk_1E1043590;
      v19 = a3;
      v20 = v5;
      v8 = v14;
      v18 = v8;
      -[LSDBExecutionContext syncWrite:]((uint64_t)v15, v17);

      v16 = v22;
    }
    else
    {
      v31 = *MEMORY[0x1E0CB2938];
      v32[0] = CFSTR("May not unregister bundle");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDModifyClient unregisterBundleUnit:options:completionHandler:]", 528, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v16);
    }
  }
  else
  {
    v23 = *MEMORY[0x1E0CB2938];
    v24 = CFSTR("invalid bundleInit for unregistering");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDModifyClient unregisterBundleUnit:options:completionHandler:]", 588, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v16);
  }

}

- (void)registerContainerURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient registerContainerURL:completionHandler:]");
  if (v6 && objc_msgSend(v6, "isFileURL"))
  {
    if (-[_LSDModifyClient canRegisterContainer](self, "canRegisterContainer"))
    {
      MEMORY[0x186DAF208]();
      _LSServer_GetIOQueue();
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59___LSDModifyClient_registerContainerURL_completionHandler___block_invoke;
      block[3] = &unk_1E10405C0;
      v13 = v6;
      v14 = v7;
      dispatch_async(v8, block);

      v9 = v13;
    }
    else
    {
      v17 = *MEMORY[0x1E0CB2938];
      v18[0] = CFSTR("May not register container");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDModifyClient registerContainerURL:completionHandler:]", 599, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

    }
  }
  else
  {
    v15 = *MEMORY[0x1E0CB2938];
    v16 = CFSTR("invalid containerURL");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDModifyClient registerContainerURL:completionHandler:]", 621, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v10);

  }
}

- (void)updateContainerUnit:(unsigned int)a3 completionHandler:(id)a4
{
  id v6;
  os_unfair_lock_s *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  unsigned int v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient updateContainerUnit:completionHandler:]");
  if (a3)
  {
    if (-[_LSDModifyClient canRegisterContainer](self, "canRegisterContainer"))
    {
      _LSServer_DatabaseExecutionContext();
      v7 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __58___LSDModifyClient_updateContainerUnit_completionHandler___block_invoke;
      v12[3] = &unk_1E10435B8;
      v14 = a3;
      v13 = v6;
      -[LSDBExecutionContext syncRead:](v7, v12);

    }
    else
    {
      v17 = *MEMORY[0x1E0CB2938];
      v18[0] = CFSTR("May not update container registation");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDModifyClient updateContainerUnit:completionHandler:]", 633, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v11);

    }
  }
  else
  {
    v15 = *MEMORY[0x1E0CB2938];
    v16 = CFSTR("invalid container Unit");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDModifyClient updateContainerUnit:completionHandler:]", 662, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v9);

  }
}

- (void)registerExtensionPoint:(id)a3 platform:(unsigned int)a4 declaringURL:(id)a5 withInfo:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  unsigned int v26;
  uint64_t v27;
  const __CFString *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient registerExtensionPoint:platform:declaringURL:withInfo:completionHandler:]");
  v15 = 0;
  if (v11 && v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = _LSIsDictionaryWithKeysAndValuesOfClasses(v13, v16, 0);

  }
  _LSExtensionsLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    v30 = "-[_LSDModifyClient registerExtensionPoint:platform:declaringURL:withInfo:completionHandler:]";
    v31 = 2112;
    v32 = v11;
    v33 = 1024;
    v34 = a4;
    v35 = 2112;
    v36 = v12;
    v37 = 2112;
    v38 = v13;
    _os_log_debug_impl(&dword_182882000, v17, OS_LOG_TYPE_DEBUG, "%s Registering extension point with identifier '%@' platform: %d url '%@' SDK Dictionary: %@", buf, 0x30u);
  }

  if (v15)
  {
    _LSServer_DatabaseExecutionContext();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __92___LSDModifyClient_registerExtensionPoint_platform_declaringURL_withInfo_completionHandler___block_invoke;
    v21[3] = &unk_1E10435E0;
    v22 = v11;
    v26 = a4;
    v23 = v13;
    v24 = v12;
    v25 = v14;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v18, v21);

    v19 = v22;
  }
  else
  {
    v27 = *MEMORY[0x1E0CB2938];
    v28 = CFSTR("invalid extensionPoint SDK dictionary");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDModifyClient registerExtensionPoint:platform:declaringURL:withInfo:completionHandler:]", 691, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v14 + 2))(v14, 0, v20);

  }
}

- (void)unregisterExtensionPoint:(id)a3 platform:(unsigned int)a4 withVersion:(id)a5 parentBundleUnit:(unsigned int)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a7;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient unregisterExtensionPoint:platform:withVersion:parentBundleUnit:co"
                                    "mpletionHandler:]");
  if (v11)
  {
    _LSServer_DatabaseExecutionContext();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __101___LSDModifyClient_unregisterExtensionPoint_platform_withVersion_parentBundleUnit_completionHandler___block_invoke;
    v17[3] = &unk_1E1043608;
    v18 = v11;
    v21 = a4;
    v22 = a6;
    v19 = v12;
    v20 = v13;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v14, v17);

  }
  else
  {
    v23 = *MEMORY[0x1E0CB2938];
    v24[0] = CFSTR("invalid extensionPoint identifier");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDModifyClient unregisterExtensionPoint:platform:withVersion:parentBundleUnit:completionHandler:]", 710, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v16);

  }
}

- (void)setHandler:(id)a3 version:(LSVersionNumber *)a4 roles:(unsigned int)a5 forContentType:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  __int128 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  _QWORD v21[4];
  id v22;
  _LSDModifyClient *v23;
  id v24;
  id v25;
  unsigned int v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient setHandler:version:roles:forContentType:completionHandler:]");
  if (v12 && v13)
  {
    _LSServer_DatabaseExecutionContext();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __78___LSDModifyClient_setHandler_version_roles_forContentType_completionHandler___block_invoke;
    v21[3] = &unk_1E1043658;
    v22 = v13;
    v23 = self;
    v26 = a5;
    v24 = v12;
    v16 = *(_OWORD *)&a4->_opaque[16];
    v27 = *(_OWORD *)a4->_opaque;
    v28 = v16;
    v25 = v14;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v15, v21);

  }
  else
  {
    v19 = *MEMORY[0x1E0CB2938];
    v20 = CFSTR("bad inputs");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDModifyClient setHandler:version:roles:forContentType:completionHandler:]", 756, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v14 + 2))(v14, 0, v18);

  }
}

- (void)removeHandlerForContentType:(id)a3 roles:(unsigned int)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _LSDModifyClient *v15;
  id v16;
  unsigned int v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient removeHandlerForContentType:roles:completionHandler:]");
  if (v8)
  {
    _LSServer_DatabaseExecutionContext();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72___LSDModifyClient_removeHandlerForContentType_roles_completionHandler___block_invoke;
    v13[3] = &unk_1E10436A8;
    v14 = v8;
    v15 = self;
    v17 = a4;
    v16 = v9;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v10, v13);

  }
  else
  {
    v18 = *MEMORY[0x1E0CB2938];
    v19[0] = CFSTR("contentType");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDModifyClient removeHandlerForContentType:roles:completionHandler:]", 782, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v12);

  }
}

- (void)setHandler:(id)a3 version:(LSVersionNumber *)a4 forURLScheme:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  __int128 v14;
  void *v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  _QWORD v19[4];
  id v20;
  _LSDModifyClient *v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient setHandler:version:forURLScheme:completionHandler:]");
  if (v10 && v11)
  {
    _LSServer_DatabaseExecutionContext();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __70___LSDModifyClient_setHandler_version_forURLScheme_completionHandler___block_invoke;
    v19[3] = &unk_1E10436F8;
    v20 = v11;
    v21 = self;
    v22 = v10;
    v14 = *(_OWORD *)&a4->_opaque[16];
    v24 = *(_OWORD *)a4->_opaque;
    v25 = v14;
    v23 = v12;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v13, v19);

  }
  else
  {
    v17 = *MEMORY[0x1E0CB2938];
    v18 = CFSTR("bad inputs");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDModifyClient setHandler:version:forURLScheme:completionHandler:]", 810, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v12 + 2))(v12, 0, v16);

  }
}

- (void)removeHandlerForURLScheme:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _LSDModifyClient *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient removeHandlerForURLScheme:completionHandler:]");
  if (v6)
  {
    _LSServer_DatabaseExecutionContext();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64___LSDModifyClient_removeHandlerForURLScheme_completionHandler___block_invoke;
    v11[3] = &unk_1E1043748;
    v12 = v6;
    v13 = self;
    v14 = v7;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v8, v11);

  }
  else
  {
    v15 = *MEMORY[0x1E0CB2938];
    v16[0] = CFSTR("scheme");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDModifyClient removeHandlerForURLScheme:completionHandler:]", 838, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v10);

  }
}

- (void)removeAllHandlersWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient removeAllHandlersWithCompletionHandler:]");
  _LSServer_DatabaseExecutionContext();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59___LSDModifyClient_removeAllHandlersWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E10417E0;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  -[LSDBExecutionContext syncWrite:]((uint64_t)v5, v7);

}

- (void)removeAllHandlerPrefsForBundleID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  void *v9;
  int v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (v6)
  {
    -[_LSDClient XPCConnection](self, "XPCConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v10 = _LSCanModifyDefaultHandler(CFSTR("*"), CFSTR("*"), v9, (uint64_t)&v15);
    v11 = v15;

    if (!v10)
    {
      v7[2](v7, 0, v11);
      goto LABEL_8;
    }
    _LSHandlerPrefRemoveAllWithBundleID(v6, v7);
    _LSDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[_LSDClient XPCConnection](self, "XPCConnection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "processIdentifier");
      *(_DWORD *)buf = 134218242;
      v19 = v14;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_182882000, v12, OS_LOG_TYPE_DEFAULT, "pid %ld removed handlers for %@", buf, 0x16u);

    }
  }
  else
  {
    v16 = *MEMORY[0x1E0CB2938];
    v17 = CFSTR("bundleID");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDModifyClient removeAllHandlerPrefsForBundleID:completionHandler:]", 885, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v12);
  }

LABEL_8:
}

- (void)relaxApplicationTypeRequirements:(BOOL)a3 forBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  BOOL v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isAppleInternal") & 1) != 0)
  {
    -[_LSDClient XPCConnection](self, "XPCConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_xpcConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = _LSCheckEntitlementForXPCConnection(v11, CFSTR("com.apple.private.launchservices.canChangeEntitlementRequirementsForDefaultApplications"));

    if (v12)
    {
      _LSServer_DatabaseExecutionContext();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __91___LSDModifyClient_relaxApplicationTypeRequirements_forBundleIdentifier_completionHandler___block_invoke;
      v18[3] = &unk_1E10437E8;
      v19 = v8;
      v21 = a3;
      v20 = v9;
      -[LSDBExecutionContext syncWrite:]((uint64_t)v13, v18);

    }
    else
    {
      v22 = *MEMORY[0x1E0CB2938];
      v23 = CFSTR("process may not modify the requirements for default applications");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDModifyClient relaxApplicationTypeRequirements:forBundleIdentifier:completionHandler:]", 896, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v17);

    }
  }
  else
  {
    v24 = *MEMORY[0x1E0CB2938];
    v25[0] = CFSTR("This functionality is not available on this device.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 78, (uint64_t)"-[_LSDModifyClient relaxApplicationTypeRequirements:forBundleIdentifier:completionHandler:]", 893, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v15);

  }
}

- (void)resetServerStoreWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient resetServerStoreWithCompletionHandler:]");
  _LSServer_DatabaseExecutionContext();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58___LSDModifyClient_resetServerStoreWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E10417E0;
  v7[4] = self;
  v6 = v4;
  v8 = v6;
  -[LSDBExecutionContext syncWrite:]((uint64_t)v5, v7);

}

- (BOOL)clientHasMIEntitlement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _LSCheckMIAllowedSPIForXPCConnection(v6, v4) != 0;

  return v7;
}

- (void)updateRecordForApp:(id)a3 withSINF:(id)a4 iTunesMetadata:(id)a5 placeholderMetadata:(id)a6 sendNotification:(int)a7 operationUUID:(id)a8 returnSaveToken:(BOOL)a9 completionHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  int v43;
  BOOL v44;
  uint64_t v45;
  const __CFString *v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v35 = a4;
  v17 = a5;
  v18 = a6;
  v33 = a8;
  v19 = a10;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:se"
                                    "ndNotification:operationUUID:returnSaveToken:completionHandler:]");
  v20 = v16 != 0;
  if (v16 && v35)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class(), v33);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = _LSIsDictionaryWithKeysAndValuesOfClasses(v35, v21, 0);

  }
  if (v17 && v20)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = _LSIsDictionaryWithKeysAndValuesOfClasses(v17, v22, 0);

  }
  if (v18 && v20)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = _LSIsDictionaryWithKeysAndValuesOfClasses(v18, v23, 0);

    if ((v24 & 1) == 0)
    {
LABEL_10:
      v45 = *MEMORY[0x1E0CB2938];
      v46 = CFSTR("invalid metadata, cannot update bundle record");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1, v33);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDModifyClient updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:returnSaveToken:completionHandler:]", 1024, v25);
      v26 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, id))v19 + 2))(v19, 0, 0, v26);
      goto LABEL_29;
    }
  }
  else if (!v20)
  {
    goto LABEL_10;
  }
  if (-[_LSDModifyClient clientIsEntitledForPostInstallationOperations](self, "clientIsEntitledForPostInstallationOperations", v33))
  {
    v25 = v35;
    v26 = v17;
LABEL_21:
    v27 = v18;
    goto LABEL_23;
  }
  if (-[_LSDModifyClient clientHasMIEntitlement:](self, "clientHasMIEntitlement:", CFSTR("UpdateSinfForLaunchServices")))
  {
    v25 = v35;
  }
  else
  {
    v25 = 0;
  }
  if (-[_LSDModifyClient clientHasMIEntitlement:](self, "clientHasMIEntitlement:", CFSTR("UpdateiTunesMetadataForLaunchServices")))
  {
    v26 = v17;
  }
  else
  {
    v26 = 0;
  }
  if (-[_LSDModifyClient clientHasMIEntitlement:](self, "clientHasMIEntitlement:", CFSTR("UpdatePlaceholderMetadata")))
    goto LABEL_21;
  v27 = 0;
LABEL_23:
  v28 = v27;
  v29 = v28;
  if (v26 || v25 || v28)
  {
    _LSServer_DatabaseExecutionContext();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __148___LSDModifyClient_updateRecordForApp_withSINF_iTunesMetadata_placeholderMetadata_sendNotification_operationUUID_returnSaveToken_completionHandler___block_invoke;
    v36[3] = &unk_1E1043838;
    v37 = v16;
    v38 = v25;
    v39 = v26;
    v40 = v29;
    v44 = a9;
    v41 = v34;
    v43 = a7;
    v42 = v19;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v32, v36);

  }
  else
  {
    v47 = *MEMORY[0x1E0CB2938];
    v48[0] = CFSTR("UpdateSinfForLaunchServices/UpdateiTunesMetadataForLaunchServices/UpdatePlaceholderMetadata");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDModifyClient updateRecordForApp:withSINF:iTunesMetadata:placeholderMetadata:sendNotification:operationUUID:returnSaveToken:completionHandler:]", 1020, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v19 + 2))(v19, 0, 0, v31);

  }
LABEL_29:

}

- (void)synchronizeWithMobileInstallation
{
  NSObject *v3;
  _QWORD block[5];

  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient synchronizeWithMobileInstallation]");
  MEMORY[0x186DAF208]();
  _LSServer_GetIOQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53___LSDModifyClient_synchronizeWithMobileInstallation__block_invoke;
  block[3] = &unk_1E10418C8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)rebuildApplicationDatabasesForSystem:(BOOL)a3 internal:(BOOL)a4 user:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  int v13;
  _opaque_pthread_t *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  uint8_t buf[4];
  int v32;
  _BYTE buffer[16];
  int v34;
  _QWORD v35[13];

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v35[11] = *MEMORY[0x1E0C80C00];
  v10 = (void (**)(id, _QWORD, void *))a6;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient rebuildApplicationDatabasesForSystem:internal:user:completionHandler:]");
  MEMORY[0x186DAF208]();
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_xpcConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = _LSCheckEntitlementForXPCConnection(v12, CFSTR("com.apple.lsapplicationworkspace.rebuildappdatabases"));

  if (!v13)
  {
    _LSDefaultLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[_LSDClient XPCConnection](self, "XPCConnection");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109120;
      v32 = objc_msgSend(v29, "processIdentifier");
      _os_log_error_impl(&dword_182882000, v19, OS_LOG_TYPE_ERROR, "Unentitled request to RebuildApplicationDatabases by pid %d", buf, 8u);

    }
    v20 = -54;
    goto LABEL_19;
  }
  os_unfair_lock_lock((os_unfair_lock_t)&-[_LSDModifyClient rebuildApplicationDatabasesForSystem:internal:user:completionHandler:]::rebuildMutex);
  v14 = pthread_self();
  v30 = pthread_getname_np(v14, (char *)buf, 0x100uLL);
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = objc_msgSend(v15, "processIdentifier");
  while (proc_pidinfo(v17, 3, 0, buffer, 136) == 136)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s(%d)"), v35, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v18);

    v17 = v34;
    if (v34 <= 1)
      goto LABEL_12;
  }
  v21 = *__error();
  _LSDefaultLog();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    -[_LSDModifyClient rebuildApplicationDatabasesForSystem:internal:user:completionHandler:].cold.1(v17, v21, v22);

LABEL_12:
  objc_msgSend(v16, "reverseObjectEnumerator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "allObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "componentsJoinedByString:", CFSTR("->"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v25, "length"))
    pthread_setname_np((const char *)objc_msgSend(objc_retainAutorelease(v25), "UTF8String"));

  v26 = _LSServer_RebuildApplicationDatabases(v8, v7, v6, 0, 1);
  if (!v30)
    pthread_setname_np((const char *)buf);
  os_unfair_lock_unlock((os_unfair_lock_t)&-[_LSDModifyClient rebuildApplicationDatabasesForSystem:internal:user:completionHandler:]::rebuildMutex);
  if (!v26)
  {
    v20 = -10810;
LABEL_19:
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], v20, (uint64_t)"-[_LSDModifyClient rebuildApplicationDatabasesForSystem:internal:user:completionHandler:]", 1101, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v28);

    goto LABEL_20;
  }
  v27 = ((uint64_t (*)(id, uint64_t, _QWORD))v10[2])(v10, 1, 0);
LABEL_20:
  MEMORY[0x186DAF214](v27);

}

- (void)installApplication:(id)a3 atURL:(id)a4 withOptions:(id)a5 installType:(unint64_t)a6 reply:(id)a7
{
  void *v7;
  void (**v8)(id, _QWORD, void *);

  v8 = (void (**)(id, _QWORD, void *))a7;
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4, (uint64_t)"-[_LSDModifyClient installApplication:atURL:withOptions:installType:reply:]", 1113, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, 0, v7);

}

- (void)uninstallApplication:(id)a3 withOptions:(id)a4 uninstallType:(unint64_t)a5 reply:(id)a6
{
  void *v6;
  void (**v7)(id, _QWORD, void *);

  v7 = (void (**)(id, _QWORD, void *))a6;
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -4, (uint64_t)"-[_LSDModifyClient uninstallApplication:withOptions:uninstallType:reply:]", 1121, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, 0, v6);

}

- (void)unregisterApplicationsAtMountPoint:(id)a3 operationUUID:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)os_transaction_create();
  _LSDatabaseSentinelIncrement();
  _LSServer_DatabaseExecutionContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75___LSDModifyClient_unregisterApplicationsAtMountPoint_operationUUID_reply___block_invoke;
  v16[3] = &unk_1E10438B0;
  v15 = v7;
  v17 = v15;
  v12 = v8;
  v18 = v12;
  v13 = v9;
  v20 = v13;
  v14 = v10;
  v19 = v14;
  -[LSDBExecutionContext syncWrite:]((uint64_t)v11, v16);

}

- (void)unregisterApplicationAtURL:(id)a3 reply:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = (void *)os_transaction_create();
  _LSDatabaseSentinelIncrement();
  _LSServer_DatabaseExecutionContext();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53___LSDModifyClient_unregisterApplicationAtURL_reply___block_invoke;
  v12[3] = &unk_1E10438D8;
  v11 = v5;
  v13 = v11;
  v9 = v6;
  v15 = v9;
  v10 = v7;
  v14 = v10;
  -[LSDBExecutionContext syncWrite:]((uint64_t)v8, v12);

}

- (void)refreshContentInFrameworkAtURL:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  _LSServer_GetIOQueue();
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57___LSDModifyClient_refreshContentInFrameworkAtURL_reply___block_invoke;
  block[3] = &unk_1E10401F0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)setUpdateAvailabilities:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = (void *)objc_opt_class();
  v9 = (void *)objc_opt_class();
  if ((_LSIsDictionaryWithKeysAndValuesOfClass(v6, v8, v9) & 1) == 0)
  {
    v18 = *MEMORY[0x1E0CB2938];
    v19[0] = CFSTR("valuesByBundleID");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDModifyClient setUpdateAvailabilities:completionHandler:]", 1301, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v14);
LABEL_9:

    goto LABEL_10;
  }
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_xpcConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = _LSCheckEntitlementForXPCConnection(v11, CFSTR("com.apple.private.launchservices.canchangeupdateavailability"));

  if (!v12)
  {
    if (CFSTR("com.apple.private.launchservices.canchangeupdateavailability"))
      v15 = CFSTR("com.apple.private.launchservices.canchangeupdateavailability");
    else
      v15 = CFSTR("unknown entitlement");
    v16 = *MEMORY[0x1E0CB2938];
    v17 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDModifyClient setUpdateAvailabilities:completionHandler:]", 1304, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v14);
    goto LABEL_9;
  }
  +[LSApplicationRecord setUpdateAvailabilityForApplicationsWithBundleIdentifiers:completionHandler:](LSApplicationRecord, "setUpdateAvailabilityForApplicationsWithBundleIdentifiers:completionHandler:", v6, v7);
LABEL_10:

}

- (void)garbageCollectDatabaseWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDModifyClient garbageCollectDatabaseWithCompletionHandler:]");
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_xpcConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _LSCheckEntitlementForXPCConnection(v6, CFSTR("com.apple.private.coreservices.canforcedatabasegc"));

  if (v7)
  {
    _LSServer_DatabaseExecutionContext();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64___LSDModifyClient_garbageCollectDatabaseWithCompletionHandler___block_invoke;
    v12[3] = &unk_1E1041740;
    v13 = v4;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v8, v12);

  }
  else
  {
    if (CFSTR("com.apple.private.coreservices.canforcedatabasegc"))
      v9 = CFSTR("com.apple.private.coreservices.canforcedatabasegc");
    else
      v9 = CFSTR("unknown entitlement");
    v14 = *MEMORY[0x1E0CB2938];
    v15[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDModifyClient garbageCollectDatabaseWithCompletionHandler:]", 1351, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v11);

  }
}

- (void)setPreferenceValue:(id)a3 forKey:(id)a4 forApplicationAtURL:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, uint64_t);
  void *v14;
  void *v15;
  FSNode *v16;
  id *v17;
  FSNode *v18;
  os_unfair_lock_s *v19;
  uint64_t v20;
  FSNode *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  FSNode *v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  _QWORD v35[4];
  FSNode *v36;
  id obj;
  char v38;
  audit_token_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  const __CFString *v51;
  uint64_t v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, uint64_t))a6;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__22;
  v44 = __Block_byref_object_dispose__22;
  v45 = 0;
  memset(&v39, 0, sizeof(v39));
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "auditToken");
  else
    memset(&v39, 0, sizeof(v39));

  v38 = 0;
  _LSIsAuditTokenSandboxed((uint64_t)&v39, &v38, 0);
  if (v11 && v12 && (objc_msgSend(v12, "isFileURL") & 1) != 0)
  {
    if (v38 && !_LSCheckEntitlementForAuditToken(&v39, CFSTR("com.apple.private.launchservices.canmodifypreferences")))
    {
      if (CFSTR("com.apple.private.launchservices.canmodifypreferences"))
        v26 = CFSTR("com.apple.private.launchservices.canmodifypreferences");
      else
        v26 = CFSTR("unknown entitlement");
      v50 = *MEMORY[0x1E0CB2938];
      v51 = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
      v18 = (FSNode *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDModifyClient setPreferenceValue:forKey:forApplicationAtURL:completionHandler:]", 1373, v18);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v41[5];
      v41[5] = v27;

    }
    else if (+[FSNode canReadMetadataOfURL:fromSandboxWithAuditToken:](FSNode, "canReadMetadataOfURL:fromSandboxWithAuditToken:", v12, &v39))
    {
      v16 = [FSNode alloc];
      v17 = (id *)(v41 + 5);
      obj = (id)v41[5];
      v18 = -[FSNode initWithURL:flags:error:](v16, "initWithURL:flags:error:", v12, 1, &obj);
      objc_storeStrong(v17, obj);
      if (v18)
      {
        _LSServer_DatabaseExecutionContext();
        v19 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
        v20 = MEMORY[0x1E0C809B0];
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __84___LSDModifyClient_setPreferenceValue_forKey_forApplicationAtURL_completionHandler___block_invoke;
        v35[3] = &unk_1E103FC48;
        v21 = v18;
        v36 = v21;
        -[LSDBExecutionContext syncRead:](v19, v35);

        _LSServer_GetIOQueue();
        v22 = objc_claimAutoreleasedReturnValue();
        v29[0] = v20;
        v29[1] = 3221225472;
        v29[2] = __84___LSDModifyClient_setPreferenceValue_forKey_forApplicationAtURL_completionHandler___block_invoke_251;
        v29[3] = &unk_1E1043900;
        v33 = &v46;
        v30 = v11;
        v18 = v21;
        v31 = v18;
        v32 = v10;
        v34 = &v40;
        dispatch_sync(v22, v29);

      }
    }
    else
    {
      _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDModifyClient setPreferenceValue:forKey:forApplicationAtURL:completionHandler:]", 1377, 0);
      v25 = objc_claimAutoreleasedReturnValue();
      v18 = (FSNode *)v41[5];
      v41[5] = v25;
    }
  }
  else
  {
    v52 = *MEMORY[0x1E0CB2938];
    v53[0] = CFSTR("bad inputs");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
    v18 = (FSNode *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDModifyClient setPreferenceValue:forKey:forApplicationAtURL:completionHandler:]", 1367, v18);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v41[5];
    v41[5] = v23;

  }
  v13[2](v13, *((unsigned __int8 *)v47 + 24), v41[5]);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
}

- (void)setPreferenceValueForCallingApplication:(id)a3 forKey:(id)a4 completionHandler:(id)a5
{
  id v8;
  LaunchServices::PrefsStorage *v9;
  void (**v10)(id, _QWORD, uint64_t);
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  FSNode *v15;
  id *v16;
  FSNode *v17;
  os_unfair_lock_s *v18;
  FSNode *v19;
  uint64_t v20;
  _QWORD v21[4];
  FSNode *v22;
  LaunchServices::PrefsStorage *v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (LaunchServices::PrefsStorage *)a4;
  v10 = (void (**)(id, _QWORD, uint64_t))a5;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__22;
  v34 = __Block_byref_object_dispose__22;
  v35 = 0;
  v28 = 0u;
  v29 = 0u;
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "auditToken");
  }
  else
  {
    v28 = 0u;
    v29 = 0u;
  }

  if (!v9 || (LaunchServices::PrefsStorage::preferenceKeyMayBeSelfSet(v9, v13) & 1) == 0)
  {
    v40 = *MEMORY[0x1E0CB2938];
    v41[0] = CFSTR("prefKey");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -50, (uint64_t)"-[_LSDModifyClient setPreferenceValueForCallingApplication:forKey:completionHandler:]", 1415, v14);
    v20 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v17 = (FSNode *)v31[5];
    v31[5] = v20;
    goto LABEL_11;
  }
  v14 = (void *)_LSCopyBundleURLForAuditToken(&v28, 0);
  if (!v14)
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -600, (uint64_t)"-[_LSDModifyClient setPreferenceValueForCallingApplication:forKey:completionHandler:]", 1437, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v15 = [FSNode alloc];
  v16 = (id *)(v31 + 5);
  obj = (id)v31[5];
  v17 = -[FSNode initWithURL:flags:error:](v15, "initWithURL:flags:error:", v14, 0, &obj);
  objc_storeStrong(v16, obj);
  if (v17)
  {
    _LSServer_DatabaseExecutionContext();
    v18 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __85___LSDModifyClient_setPreferenceValueForCallingApplication_forKey_completionHandler___block_invoke;
    v21[3] = &unk_1E1043928;
    v19 = v17;
    v22 = v19;
    v25 = &v36;
    v23 = v9;
    v24 = v8;
    v26 = &v30;
    -[LSDBExecutionContext syncRead:](v18, v21);

    v17 = v19;
  }
LABEL_11:

  v10[2](v10, *((unsigned __int8 *)v37 + 24), v31[5]);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
}

- (void)performShimmedInstallOfArtifact:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v12 = _LSValidateEntitlementsOfConnectionForVanillaInstall(v11, v9, &v16);
  v13 = v16;

  if (v12)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __71___LSDModifyClient_performShimmedInstallOfArtifact_options_completion___block_invoke;
    v14[3] = &unk_1E103FE08;
    v15 = v10;
    _LSInvokeMIForShimmedInstall(v8, v9, v14);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v13);
  }

}

- (void)performShimmedUninstallOfApplicationWithIdentifier:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v12 = _LSValidateEntitlementsOfConnectionForUninstall(v11, (uint64_t)v9, &v16);
  v13 = v16;

  if (v12)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __90___LSDModifyClient_performShimmedUninstallOfApplicationWithIdentifier_options_completion___block_invoke;
    v14[3] = &unk_1E103FE08;
    v15 = v10;
    _LSInvokeMIForShimmedUninstall(v8, v9, v14);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v13);
  }

}

- (BOOL)clientIsEntitledForPostInstallationOperations
{
  void *v2;
  _xpc_connection_s *v3;
  BOOL v4;
  NSObject *v6;
  int v7;
  uint64_t pid;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[_LSDClient XPCConnection](self, "XPCConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_xpcConnection");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();

  if (_LSCheckEntitlementForXPCConnectionQuiet(v3, CFSTR("com.apple.private.coreservices.can-register-install-results"))|| _LSCheckEntitlementForXPCConnectionQuiet(v3, CFSTR("com.apple.private.installcoordinationd.daemon"))|| _LSCheckEntitlementForXPCConnectionQuiet(v3, CFSTR("com.apple.private.coreservices.lsaw")))
  {
    v4 = 1;
  }
  else
  {
    _LSDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      pid = xpc_connection_get_pid(v3);
      _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_DEFAULT, "Connection from process %llu is not entitled for post installation modifications to the database", (uint8_t *)&v7, 0xCu);
    }

    v4 = 0;
  }

  return v4;
}

- (void)performPostInstallationRegistration:(id)a3 personaUniqueStrings:(id)a4 operationUUID:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  os_unfair_lock_s *RegisterInstallResultsLock;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _LSDModifyClient *v24;
  id v25;
  id v26;
  id v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!-[_LSDModifyClient clientIsEntitledForPostInstallationOperations](self, "clientIsEntitledForPostInstallationOperations"))
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDModifyClient performPostInstallationRegistration:personaUniqueStrings:operationUUID:reply:]", 1536, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, id))v13 + 2))(v13, 0, 0, v17);
    goto LABEL_10;
  }
  if (!v11)
  {
    v17 = 0;
    v16 = 0;
    goto LABEL_9;
  }
  +[_LSPersonaDatabase sharedInstance]();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  -[_LSPersonaDatabase personasWithAttributesForPersonaUniqueStrings:error:]((uint64_t)v14, v15, &v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v27;

  if (v16)
  {
LABEL_9:
    RegisterInstallResultsLock = (os_unfair_lock_s *)_LSDatabaseGetRegisterInstallResultsLock();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __97___LSDModifyClient_performPostInstallationRegistration_personaUniqueStrings_operationUUID_reply___block_invoke;
    v21[3] = &unk_1E1043978;
    v22 = v10;
    v26 = v13;
    v23 = v12;
    v24 = self;
    v25 = v16;
    v20 = v16;
    _LSDoWithLock(RegisterInstallResultsLock, v21);

    goto LABEL_10;
  }
  _LSDefaultLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    -[_LSDModifyClient performPostInstallationRegistration:personaUniqueStrings:operationUUID:reply:].cold.1((uint64_t)v11, (uint64_t)v17, v18);

  (*((void (**)(id, _QWORD, _QWORD, id))v13 + 2))(v13, 0, 0, v17);
LABEL_10:

}

- (void)performPostUninstallationUnregistrationOfBundleID:(id)a3 operationUUID:(id)a4 unregisterType:(unsigned int)a5 precondition:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  os_unfair_lock_s *RegisterInstallResultsLock;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  _LSDModifyClient *v22;
  id v23;
  unsigned int v24;

  v17 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  if (-[_LSDModifyClient clientIsEntitledForPostInstallationOperations](self, "clientIsEntitledForPostInstallationOperations"))
  {
    RegisterInstallResultsLock = (os_unfair_lock_s *)_LSDatabaseGetRegisterInstallResultsLock();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __118___LSDModifyClient_performPostUninstallationUnregistrationOfBundleID_operationUUID_unregisterType_precondition_reply___block_invoke;
    v18[3] = &unk_1E10439C8;
    v23 = v14;
    v19 = v12;
    v20 = v17;
    v24 = a5;
    v21 = v13;
    v22 = self;
    _LSDoWithLock(RegisterInstallResultsLock, v18);

    v16 = v23;
  }
  else
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDModifyClient performPostUninstallationUnregistrationOfBundleID:operationUUID:unregisterType:precondition:reply:]", 1561, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v14 + 2))(v14, 0, v16);
  }

}

- (void)performUpdateOfPersonasOfBundleID:(id)a3 toPersonaUniqueStrings:(id)a4 operationUUID:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t, _QWORD);
  void *v14;
  id *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[4];
  NSObject *v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t *v29;
  id obj;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t, _QWORD))a6;
  if (-[_LSDModifyClient clientIsEntitledForPostInstallationOperations](self, "clientIsEntitledForPostInstallationOperations"))
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__22;
    v38 = __Block_byref_object_dispose__22;
    v39 = 0;
    v31 = 0;
    v32[0] = &v31;
    v32[1] = 0x3032000000;
    v32[2] = __Block_byref_object_copy__22;
    v32[3] = __Block_byref_object_dispose__22;
    v33 = 0;
    +[_LSPersonaDatabase sharedInstance]();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id *)(v32[0] + 40);
    obj = *(id *)(v32[0] + 40);
    -[_LSPersonaDatabase personasWithAttributesForPersonaUniqueStrings:error:]((uint64_t)v14, v11, &obj);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v15, obj);

    if (v16)
    {
      _LSInstallLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[_LSDClient XPCConnection](self, "XPCConnection");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "processIdentifier");
        *(_DWORD *)buf = 138412802;
        v41 = v16;
        v42 = 2112;
        v43 = v10;
        v44 = 2048;
        v45 = v19;
        _os_log_impl(&dword_182882000, v17, OS_LOG_TYPE_DEFAULT, "attempting to set personas %@ for bundleID %@ from pid %ld", buf, 0x20u);

      }
      _LSServer_DatabaseExecutionContext();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __97___LSDModifyClient_performUpdateOfPersonasOfBundleID_toPersonaUniqueStrings_operationUUID_reply___block_invoke;
      v24[3] = &unk_1E10439F0;
      v25 = v10;
      v26 = v16;
      v28 = &v31;
      v29 = &v34;
      v27 = v12;
      -[LSDBExecutionContext syncWrite:]((uint64_t)v20, v24);

      v21 = v25;
    }
    else
    {
      _LSInstallLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[_LSDModifyClient performUpdateOfPersonasOfBundleID:toPersonaUniqueStrings:operationUUID:reply:].cold.1((uint64_t)v32, v21, v23);
    }

    v13[2](v13, v35[5], *(_QWORD *)(v32[0] + 40));
    _Block_object_dispose(&v31, 8);

    _Block_object_dispose(&v34, 8);
  }
  else
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDModifyClient performUpdateOfPersonasOfBundleID:toPersonaUniqueStrings:operationUUID:reply:]", 1660, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v13)[2](v13, 0, v22);

  }
}

- (void)forceSaveForTestingWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a3;
  if (-[_LSDModifyClient clientIsEntitledForPostInstallationOperations](self, "clientIsEntitledForPostInstallationOperations")|| (-[_LSDClient XPCConnection](self, "XPCConnection"), v4 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v4, "_xpcConnection"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v6 = _LSCheckEntitlementForXPCConnection(v5, CFSTR("com.apple.private.coreservices.can-force-database-save-for-testing")), v5, v4, v6))
  {
    _LSServer_DatabaseExecutionContext();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54___LSDModifyClient_forceSaveForTestingWithCompletion___block_invoke;
    v10[3] = &unk_1E1041740;
    v11 = v9;
    -[LSDBExecutionContext syncWrite:]((uint64_t)v7, v10);

    v8 = v11;
  }
  else
  {
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSDModifyClient forceSaveForTestingWithCompletion:]", 1672, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v8);
  }

}

- (void)rebuildApplicationDatabasesForSystem:(os_log_t)log internal:user:completionHandler:.cold.1(int a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "proc_pidinfo(PROC_PIDTBSDINFO) failed for %ld: %{darwin.errno}d", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)performPostInstallationRegistration:(NSObject *)a3 personaUniqueStrings:operationUUID:reply:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_4_0(&dword_182882000, a3, (uint64_t)a3, "Could not look up personas given unique strings %@: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)performUpdateOfPersonasOfBundleID:(uint64_t)a3 toPersonaUniqueStrings:operationUUID:reply:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_5(&dword_182882000, a2, a3, "could not get personas from persona unique strings: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

@end
