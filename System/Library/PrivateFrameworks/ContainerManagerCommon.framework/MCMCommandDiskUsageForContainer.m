@implementation MCMCommandDiskUsageForContainer

- (MCMCommandDiskUsageForContainer)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  MCMCommandDiskUsageForContainer *v9;
  uint64_t v10;
  MCMConcreteContainerIdentity *concreteContainerIdentity;
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MCMCommandDiskUsageForContainer;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v13, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "concreteContainerIdentity");
    v10 = objc_claimAutoreleasedReturnValue();
    concreteContainerIdentity = v9->_concreteContainerIdentity;
    v9->_concreteContainerIdentity = (MCMConcreteContainerIdentity *)v10;

  }
  return v9;
}

- (BOOL)preflightClientAllowed
{
  MCMCommandDiskUsageForContainer *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  -[MCMCommand context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMCommandDiskUsageForContainer concreteContainerIdentity](v2, "concreteContainerIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v4, "isAllowedToLookupContainerIdentity:", v5);

  return (char)v2;
}

- (void)execute
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  MCMCommandInfoValueForKey *v13;
  void *v14;
  MCMCommandInfoValueForKey *v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  MCMResultDiskUsageForContainer *v21;
  uint64_t v22;
  MCMResultDiskUsageForContainer *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  _QWORD v40[4];
  MCMResultDiskUsageForContainer *v41;
  id v42;
  MCMCommandDiskUsageForContainer *v43;
  id v44;
  char v45;
  id v46;
  uint64_t v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  v47 = 1;
  v4 = _os_feature_enabled_impl();
  -[MCMCommandDiskUsageForContainer concreteContainerIdentity](self, "concreteContainerIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommand context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  objc_msgSend(v7, "entryForContainerIdentity:error:", v5, &v46);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v46;

  objc_msgSend(v8, "metadataMinimal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v38 = v9;
    v11 = objc_msgSend(v5, "containerClass");
    v12 = 0;
    if (v11 <= 0xE && ((1 << v11) & 0x412A) != 0)
    {
      v13 = [MCMCommandInfoValueForKey alloc];
      -[MCMCommand context](self, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[MCMCommandInfoValueForKey initWithKey:concreteContainerIdentity:context:resultPromise:](v13, "initWithKey:concreteContainerIdentity:context:resultPromise:", CFSTR("StaticDiskUsage"), v5, v14, 0);

      -[MCMCommandInfoValueForKey infoValueForKeyWithError:](v15, "infoValueForKeyWithError:", &v47);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12 && v47 != 24)
      {
        container_log_handle_for_category();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v49 = v5;
          v50 = 2048;
          v51 = v47;
          _os_log_error_impl(&dword_1CF807000, v16, OS_LOG_TYPE_ERROR, "Error looking up info value for identity: %@: %llu", buf, 0x16u);
        }

      }
    }
    objc_opt_class();
    v17 = v12;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;
    v37 = v10;

    if (!v18)
    {
      v30 = v3;
      container_log_handle_for_category();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        -[MCMCommand context](self, "context");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "clientIdentity");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v49 = v36;
        _os_log_debug_impl(&dword_1CF807000, v31, OS_LOG_TYPE_DEBUG, "Reply to disk usage handed off to the slow workloop for client [%@]", buf, 0xCu);

      }
      -[MCMCommand reply](self, "reply");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMCommand context](self, "context");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "clientIdentity");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __42__MCMCommandDiskUsageForContainer_execute__block_invoke;
      v40[3] = &unk_1E8CB58C8;
      v41 = v37;
      v45 = v4;
      v42 = v5;
      v43 = self;
      v44 = v8;
      objc_msgSend(v32, "handoffToSlowWorkloopforClientIdentity:withBlock:", v34, v40);

      v21 = v41;
      v3 = v30;
      v10 = v37;
      v9 = v38;
      goto LABEL_23;
    }
    v39 = v5;
    v22 = objc_msgSend(v17, "unsignedLongLongValue");
    v23 = [MCMResultDiskUsageForContainer alloc];
    objc_msgSend(v8, "containerIdentity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "containerClass");
    v19 = v8;
    objc_msgSend(v8, "containerIdentity");
    v26 = v3;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "userIdentity");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[MCMResultDiskUsageForContainer initWithDiskUsageBytes:descendants:containerClass:personaType:](v23, "initWithDiskUsageBytes:descendants:containerClass:personaType:", v22, 0, v25, objc_msgSend(v28, "personaType"));

    v3 = v26;
    v10 = v37;
    v9 = v38;
    if (v21)
    {
LABEL_19:
      -[MCMCommand resultPromise](self, "resultPromise", v37);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "completeWithResult:", v21);

      v8 = v19;
      v5 = v39;
LABEL_23:

      goto LABEL_24;
    }
  }
  else
  {
    v39 = v5;
    v19 = v8;
    container_log_handle_for_category();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v49 = v9;
      v50 = 2112;
      v51 = (uint64_t)v39;
      _os_log_error_impl(&dword_1CF807000, v20, OS_LOG_TYPE_ERROR, "No Container with identity: error = %@, identity = %@", buf, 0x16u);
    }

    v21 = -[MCMResultBase initWithError:]([MCMResultDiskUsageForContainer alloc], "initWithError:", v9);
    v17 = 0;
    if (v21)
      goto LABEL_19;
  }
  v8 = v19;
  v5 = v39;
LABEL_24:

  objc_autoreleasePoolPop(v3);
}

- (MCMConcreteContainerIdentity)concreteContainerIdentity
{
  return self->_concreteContainerIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concreteContainerIdentity, 0);
}

void __42__MCMCommandDiskUsageForContainer_execute__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  MCMResultDiskUsageForContainer *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  MCMResultDiskUsageForContainer *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  +[MCMTestLocks sharedInstance](MCMTestLocks, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "waitOnLock:", 8);

  +[MCMTestLocks sharedInstance](MCMTestLocks, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "waitOnLock:", 2);

  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "containerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerRootURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "fastDiskUsageForURL:", v6);
  v9 = v8;

  if (!*(_BYTE *)(a1 + 64))
  {
    v10 = objc_msgSend(*(id *)(a1 + 40), "containerClass");
    if (v10 <= 0xE && ((1 << v10) & 0x412A) != 0)
    {
      v32 = 0;
      v33 = &v32;
      v34 = 0x3032000000;
      v35 = __Block_byref_object_copy__4736;
      v36 = __Block_byref_object_dispose__4737;
      v37 = 0;
      objc_msgSend(*(id *)(a1 + 48), "reply");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __42__MCMCommandDiskUsageForContainer_execute__block_invoke_8;
      v26[3] = &unk_1E8CB58A0;
      v30 = v7;
      v31 = v9;
      v12 = *(id *)(a1 + 40);
      v13 = *(_QWORD *)(a1 + 48);
      v27 = v12;
      v28 = v13;
      v29 = &v32;
      objc_msgSend(v11, "dispatchSyncToFastWorkloopWithBlock:", v26);

      objc_msgSend((id)v33[5], "result");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "error");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        container_log_handle_for_category();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v24 = *(_QWORD *)(a1 + 40);
          objc_msgSend(v14, "error");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v39 = v24;
          v40 = 2112;
          v41 = v25;
          _os_log_error_impl(&dword_1CF807000, v16, OS_LOG_TYPE_ERROR, "Error setting info value for identity: %@: %@", buf, 0x16u);

        }
      }

      _Block_object_dispose(&v32, 8);
    }
  }
  v17 = [MCMResultDiskUsageForContainer alloc];
  objc_msgSend(*(id *)(a1 + 56), "containerIdentity");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "containerClass");
  objc_msgSend(*(id *)(a1 + 56), "containerIdentity");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "userIdentity");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[MCMResultDiskUsageForContainer initWithDiskUsageBytes:descendants:containerClass:personaType:](v17, "initWithDiskUsageBytes:descendants:containerClass:personaType:", v7, v9, v19, objc_msgSend(v21, "personaType"));

  objc_msgSend(*(id *)(a1 + 48), "resultPromise");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "completeWithResult:", v22);

}

void __42__MCMCommandDiskUsageForContainer_execute__block_invoke_8(uint64_t a1)
{
  MCMCommandSetInfoValue *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  MCMCommandSetInfoValue *v6;

  v2 = [MCMCommandSetInfoValue alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MCMCommandSetInfoValue initWithKey:value:containerIdentity:context:resultPromise:](v2, "initWithKey:value:containerIdentity:context:resultPromise:", CFSTR("StaticDiskUsage"), v3, v4, v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  -[MCMCommandSetInfoValue execute](v6, "execute");
}

+ (unint64_t)command
{
  return 23;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
