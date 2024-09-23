@implementation MCMCommandCrashTest

- (MCMCommandCrashTest)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  MCMCommandCrashTest *v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MCMCommandCrashTest;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v11, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    v9->_crashCount = objc_msgSend(v8, "crashCount");
    v9->_setTestLocks = objc_msgSend(v8, "setTestLocks");
  }

  return v9;
}

- (BOOL)preflightClientAllowed
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  char v7;

  v3 = containermanager_copy_global_configuration();
  v4 = objc_msgSend(v3, "isInternalImage");

  if (!v4)
    return 0;
  -[MCMCommand context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAllowedToTest");

  return v7;
}

- (void)execute
{
  const char *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t active_platform;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  MCMCommandSetInfoValue *v31;
  NSObject *v32;
  MCMCommandSetInfoValue *v33;
  void *v34;
  void *v35;
  MCMResultPromise *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  MCMResultBase *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  NSObject *v51;
  int v52;
  NSObject *v53;
  MCMCommandCrashTest *v54;
  SEL v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  uint64_t v67;
  void *v68;
  uint8_t v69[4];
  int v70;
  _BYTE buf[12];
  __int16 v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v63 = (void *)MEMORY[0x1D17D7010](self, a2);
  v3 = (const char *)container_codesign_copy_current_identifier();
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:deallocator:", v3, strnlen(v3, 0x400uLL), 4, &__block_literal_global_1197);
  -[MCMCommand context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 1;
  v6 = containermanager_copy_global_configuration();
  v7 = 12;
  v8 = objc_msgSend(v6, "dispositionForContainerClass:", 12);

  if (v8 != 1)
  {
    v9 = containermanager_copy_global_configuration();
    v7 = 10;
    objc_msgSend(v9, "dispositionForContainerClass:", 10);

  }
  -[MCMCommand context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "globalConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "staticConfig");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "configForContainerClass:", v7);
  v13 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "userIdentityCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "userIdentityForPersonalPersona");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  active_platform = dyld_get_active_platform();
  -[MCMCommand context](self, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "userIdentityCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)v4;
  v62 = (void *)v13;
  +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:](MCMContainerIdentity, "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:", v15, v4, v13, active_platform, v18, &v67);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "containerFactory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0;
  objc_msgSend(v20, "containerForContainerIdentity:createIfNecessary:error:", v19, 1, &v66);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v66;

  v65 = v22;
  objc_msgSend(v21, "metadataWithError:", &v65);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v65;

  if (!v23)
  {
    container_log_handle_for_category();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v64;
      v72 = 2112;
      v73 = (uint64_t)v24;
      _os_log_error_impl(&dword_1CF807000, v26, OS_LOG_TYPE_ERROR, "Failed to create or lookup lookup existing container for retry test: %@; error = %@",
        buf,
        0x16u);
    }
    goto LABEL_19;
  }
  v60 = v21;
  v61 = v19;
  if (!-[MCMCommandCrashTest crashCount](self, "crashCount"))
  {
    v26 = 0;
    v31 = 0;
LABEL_14:
    v36 = objc_alloc_init(MCMResultPromise);
    objc_msgSend(v23, "containerIdentity");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:](MCMCommandOperationDelete, "commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:", v38, 0, v5, v36);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v39, "execute");
    -[MCMResultPromise result](v36, "result");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "error");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      container_log_handle_for_category();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v23, "containerPath");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "containerRootURL");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "path");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[MCMResultPromise result](v36, "result");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "error");
        v48 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v56;
        v72 = 2112;
        v73 = v48;
        v49 = (void *)v48;
        _os_log_error_impl(&dword_1CF807000, v42, OS_LOG_TYPE_ERROR, "Failed to delete retry container at [%@]; error = %@",
          buf,
          0x16u);

      }
      -[MCMResultPromise result](v36, "result");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "error");
      v44 = objc_claimAutoreleasedReturnValue();

      v24 = (id)v44;
    }
    v21 = v60;
    v19 = v61;

LABEL_19:
    container_log_handle_for_category();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = 0;
      v72 = 2112;
      v73 = (uint64_t)v24;
      _os_log_impl(&dword_1CF807000, v45, OS_LOG_TYPE_DEFAULT, "Restart result: %llu, error = %@", buf, 0x16u);
    }

    -[MCMCommand resultPromise](self, "resultPromise");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[MCMResultBase initWithError:]([MCMResultBase alloc], "initWithError:", v24);
    objc_msgSend(v46, "completeWithResult:", v47);

    objc_autoreleasePoolPop(v63);
    return;
  }
  objc_msgSend(v23, "info");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("CrashCounter"));
  v26 = objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v23, "info");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("CrashCounter"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "unsignedIntValue");

    v30 = v29 - 1;
  }
  else
  {
    v30 = -[MCMCommandCrashTest crashCount](self, "crashCount");
  }
  container_log_handle_for_category();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v30;
    _os_log_error_impl(&dword_1CF807000, v32, OS_LOG_TYPE_ERROR, "Restarts remaining in retry test: %llu", buf, 0xCu);
  }

  v33 = [MCMCommandSetInfoValue alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v30);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "containerIdentity");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[MCMCommandSetInfoValue initWithKey:value:containerIdentity:context:resultPromise:](v33, "initWithKey:value:containerIdentity:context:resultPromise:", CFSTR("CrashCounter"), v34, v35, v5, 0);

  -[MCMCommandSetInfoValue execute](v31, "execute");
  if (!v30)
    goto LABEL_14;
  if (-[MCMCommandCrashTest setTestLocks](self, "setTestLocks"))
  {
    +[MCMTestLocks sharedInstance](MCMTestLocks, "sharedInstance");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setEnabled:", 1);
    objc_msgSend(v50, "acquireLock:", -[MCMCommandCrashTest setTestLocks](self, "setTestLocks"));

  }
  -[MCMRuntimeState persist](objc_alloc_init(MCMRuntimeState), "persist");
  container_log_handle_for_category();
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CF807000, v51, OS_LOG_TYPE_DEFAULT, "Restarting", buf, 2u);
  }

  *(_QWORD *)buf = 1;
  if (sysctlbyname("kern.crash_behavior_test_mode", 0, 0, buf, 8uLL) < 0)
  {
    v52 = *__error();
    container_log_handle_for_category();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v69 = 67109120;
      v70 = v52;
      _os_log_error_impl(&dword_1CF807000, v53, OS_LOG_TYPE_ERROR, "Could not enable crash test mode, error = %{darwin.errno}d", v69, 8u);
    }

  }
  usleep(0x7A120u);
  v54 = (MCMCommandCrashTest *)abort_with_reason();
  -[MCMCommandCrashTest crashCount](v54, v55);
}

- (unint64_t)crashCount
{
  return self->_crashCount;
}

- (unint64_t)setTestLocks
{
  return self->_setTestLocks;
}

uint64_t __30__MCMCommandCrashTest_execute__block_invoke(int a1, void *a2)
{
  uint64_t result;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = a2;
  if (a2)
  {
    free(a2);
    return memset_s(v3, 8uLL, 0, 8uLL);
  }
  return result;
}

+ (unint64_t)command
{
  return 25;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
