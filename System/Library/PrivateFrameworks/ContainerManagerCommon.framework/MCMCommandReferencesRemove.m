@implementation MCMCommandReferencesRemove

- (MCMCommandReferencesRemove)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  MCMCommandReferencesRemove *v9;
  uint64_t v10;
  NSSet *ownerIdentifiers;
  uint64_t v12;
  NSSet *groupIdentifiers;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MCMCommandReferencesRemove;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v15, sel_initWithMessage_context_reply_, v8, a4, a5);
  if (v9)
  {
    v9->_containerClass = objc_msgSend(v8, "containerClass");
    objc_msgSend(v8, "ownerIdentifiers");
    v10 = objc_claimAutoreleasedReturnValue();
    ownerIdentifiers = v9->_ownerIdentifiers;
    v9->_ownerIdentifiers = (NSSet *)v10;

    objc_msgSend(v8, "groupIdentifiers");
    v12 = objc_claimAutoreleasedReturnValue();
    groupIdentifiers = v9->_groupIdentifiers;
    v9->_groupIdentifiers = (NSSet *)v12;

    v9->_deleteDuringReconciliation = objc_msgSend(v8, "deleteDuringReconciliation");
    v9->_yesReallyApplyToAll = objc_msgSend(v8, "yesReallyApplyToAll");
  }

  return v9;
}

- (BOOL)preflightClientAllowed
{
  void *v2;
  void *v3;
  char v4;

  -[MCMCommand context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientIdentity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowedToChangeReferences");

  return v4;
}

- (void)execute
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  MCMError *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  MCMError *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  MCMResultPromise *v28;
  void *v29;
  void *v30;
  void *v31;
  MCMResultWithContainersArrayBase *v32;
  MCMResultWithContainersArrayBase *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  MCMError *v49;
  id v50;
  uint8_t buf[4];
  void *v52;
  _BYTE v53[128];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandReferencesRemove ownerIdentifiers](self, "ownerIdentifiers");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    goto LABEL_2;
  if (!-[MCMCommandReferencesRemove yesReallyApplyToAll](self, "yesReallyApplyToAll"))
  {
    container_log_handle_for_category();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CF807000, v36, OS_LOG_TYPE_ERROR, "Owner identifiers must be specified", buf, 2u);
    }

    v7 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 38, 3);
    v4 = 0;
    goto LABEL_37;
  }
  v50 = 0;
  objc_msgSend((id)gCodeSigningMapping, "identifiersWithError:", &v50);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v26 = v50;
  v27 = v26;
  if (!v4)
  {
    v7 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v26, 0, 66);

LABEL_37:
    v32 = -[MCMResultBase initWithError:]([MCMResultWithContainersArrayBase alloc], "initWithError:", v7);
    goto LABEL_38;
  }

LABEL_2:
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v4 = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v59, v58, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v60;
    v44 = v4;
    v45 = v3;
    v43 = *(_QWORD *)v60;
    do
    {
      v9 = 0;
      v42 = v6;
      do
      {
        if (*(_QWORD *)v60 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v9);
        -[MCMCommandReferencesRemove groupIdentifiers](self, "groupIdentifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          -[MCMCommandReferencesRemove groupIdentifiers](self, "groupIdentifiers");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v53, 16);
          if (v13)
          {
            v14 = v13;
            v41 = v9;
            v15 = *(_QWORD *)v55;
            while (2)
            {
              v16 = 0;
              v17 = v7;
              do
              {
                if (*(_QWORD *)v55 != v15)
                  objc_enumerationMutation(v12);
                v18 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v16);
                v19 = (void *)gCodeSigningMapping;
                v20 = -[MCMCommandReferencesRemove containerClass](self, "containerClass");
                v49 = v17;
                v47[0] = MEMORY[0x1E0C809B0];
                v47[1] = 3221225472;
                v47[2] = __37__MCMCommandReferencesRemove_execute__block_invoke;
                v47[3] = &unk_1E8CB5140;
                v48 = v46;
                LODWORD(v20) = objc_msgSend(v19, "removeGroupIdentifier:forIdentifier:containerClass:error:reconcileHandler:", v18, v10, v20, &v49, v47);
                v7 = v49;

                if (!(_DWORD)v20)
                {

                  v4 = v44;
                  v3 = v45;
                  goto LABEL_37;
                }
                ++v16;
                v17 = v7;
              }
              while (v14 != v16);
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v53, 16);
              if (v14)
                continue;
              break;
            }
            v4 = v44;
            v3 = v45;
            v6 = v42;
            v8 = v43;
            v9 = v41;
          }
          else
          {
            v6 = v42;
          }
        }
        else
        {
          v21 = v4;
          v22 = v3;
          v23 = v9;
          v24 = (void *)gCodeSigningMapping;
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "removeCodeSigningDictionaryForIdentifiers:", v25);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            objc_msgSend(v46, "unionSet:", v12);
          v9 = v23;
          v3 = v22;
          v4 = v21;
          v8 = v43;
        }

        ++v9;
      }
      while (v9 != v6);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v59, v58, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  if (!-[MCMCommandReferencesRemove deleteDuringReconciliation](self, "deleteDuringReconciliation"))
    goto LABEL_32;
  if (!objc_msgSend(v46, "count"))
    goto LABEL_32;
  v28 = objc_alloc_init(MCMResultPromise);
  objc_msgSend(v46, "allObjects");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommand context](self, "context");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:](MCMCommandOperationDelete, "commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:", v29, 0, v30, v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "execute");
  -[MCMResultPromise result](v28, "result");
  v32 = (MCMResultWithContainersArrayBase *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
LABEL_32:
    v33 = [MCMResultWithContainersArrayBase alloc];
    -[MCMCommand context](self, "context");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "clientIdentity");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v40) = 1;
    v32 = -[MCMResultWithContainersArrayBase initWithContainers:includePath:includeInfo:includeUserManagedAssetsRelPath:includeCreator:clientIdentity:skipSandboxExtensions:](v33, "initWithContainers:includePath:includeInfo:includeUserManagedAssetsRelPath:includeCreator:clientIdentity:skipSandboxExtensions:", MEMORY[0x1E0C9AA60], 1, 0, 0, 0, v35, v40);

  }
LABEL_38:
  container_log_handle_for_category();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    -[MCMResultBase error](v32, "error");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v52 = v38;
    _os_log_impl(&dword_1CF807000, v37, OS_LOG_TYPE_DEFAULT, "References remove; error = %@", buf, 0xCu);

  }
  -[MCMCommand resultPromise](self, "resultPromise");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "completeWithResult:", v32);

  objc_autoreleasePoolPop(v3);
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (NSSet)ownerIdentifiers
{
  return self->_ownerIdentifiers;
}

- (NSSet)groupIdentifiers
{
  return self->_groupIdentifiers;
}

- (unint64_t)explicitFlags
{
  return self->_explicitFlags;
}

- (unsigned)uid
{
  return self->_uid;
}

- (unint64_t)privateFlags
{
  return self->_privateFlags;
}

- (BOOL)createDuringReconciliation
{
  return self->_createDuringReconciliation;
}

- (BOOL)deleteDuringReconciliation
{
  return self->_deleteDuringReconciliation;
}

- (BOOL)yesReallyApplyToAll
{
  return self->_yesReallyApplyToAll;
}

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_groupIdentifiers, 0);
  objc_storeStrong((id *)&self->_ownerIdentifiers, 0);
}

uint64_t __37__MCMCommandReferencesRemove_execute__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "unionSet:", a2);
}

+ (unint64_t)command
{
  return 49;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
