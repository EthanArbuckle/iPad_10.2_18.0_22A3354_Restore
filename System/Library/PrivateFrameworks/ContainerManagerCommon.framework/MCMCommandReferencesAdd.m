@implementation MCMCommandReferencesAdd

- (MCMCommandReferencesAdd)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  MCMCommandReferencesAdd *v9;
  uint64_t v10;
  NSSet *ownerIdentifiers;
  uint64_t v12;
  NSSet *groupIdentifiers;
  uint64_t v14;
  MCMUserIdentity *userIdentity;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MCMCommandReferencesAdd;
  v9 = -[MCMCommand initWithMessage:context:reply:](&v17, sel_initWithMessage_context_reply_, v8, a4, a5);
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

    v9->_createDuringReconciliation = objc_msgSend(v8, "createDuringReconciliation");
    objc_msgSend(v8, "userIdentity");
    v14 = objc_claimAutoreleasedReturnValue();
    userIdentity = v9->_userIdentity;
    v9->_userIdentity = (MCMUserIdentity *)v14;

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
  MCMCommandReferencesAdd *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __objc2_class_ro **p_info;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  MCMError *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  MCMError *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  MCMError *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  __objc2_class_ro **v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  void *v62;
  void *v63;
  BOOL v64;
  void *v65;
  void *v66;
  void *v67;
  MCMCommandReferencesAdd *v68;
  MCMError *v69;
  _QWORD v70[4];
  id v71;
  id v72;
  BOOL v73;
  MCMError *v74;
  _BYTE v75[128];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint8_t buf[4];
  uint64_t v91;
  __int16 v92;
  uint64_t v93;
  uint64_t v94;

  v2 = self;
  v94 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandReferencesAdd _resolveUserIdentity](v2, "_resolveUserIdentity");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = +[MCMUserIdentity isUserIdentityRequiredForContainerClass:](MCMUserIdentity, "isUserIdentityRequiredForContainerClass:", -[MCMCommandReferencesAdd containerClass](v2, "containerClass"));
  -[MCMCommandReferencesAdd ownerIdentifiers](v2, "ownerIdentifiers");
  v5 = objc_claimAutoreleasedReturnValue();
  p_info = (__objc2_class_ro **)(MCMCommandDeleteContainerContent + 32);
  if (!v5)
    goto LABEL_37;
  v7 = (void *)v5;
  -[MCMCommandReferencesAdd groupIdentifiers](v2, "groupIdentifiers");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_36;
  v9 = (void *)v8;
  -[MCMCommandReferencesAdd ownerIdentifiers](v2, "ownerIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
  {

LABEL_36:
    p_info = MCMCommandDeleteContainerContent.info;
    goto LABEL_37;
  }
  -[MCMCommandReferencesAdd groupIdentifiers](v2, "groupIdentifiers");
  v68 = v2;
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  v2 = v68;
  p_info = (__objc2_class_ro **)(MCMCommandDeleteContainerContent + 32);
  if (!v12)
  {
LABEL_37:
    container_log_handle_for_category();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      -[MCMCommandReferencesAdd ownerIdentifiers](v2, "ownerIdentifiers");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "count");
      -[MCMCommandReferencesAdd groupIdentifiers](v2, "groupIdentifiers");
      v53 = p_info;
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = objc_msgSend(v54, "count");
      *(_DWORD *)buf = 134218240;
      v91 = v52;
      v92 = 2048;
      v93 = v55;
      _os_log_error_impl(&dword_1CF807000, v45, OS_LOG_TYPE_ERROR, "Owner and group identifiers must be specified; owner cnt = %lu, group cnt = %lu",
        buf,
        0x16u);

      p_info = v53;
    }

    v15 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 38, 3);
    v44 = 0;
LABEL_40:
    v46 = objc_msgSend(objc_alloc((Class)(p_info + 381)), "initWithError:", v15);

    v44 = (void *)v46;
    goto LABEL_41;
  }
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  -[MCMCommandReferencesAdd ownerIdentifiers](v68, "ownerIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v86, v85, 16);
  v14 = 0;
  v15 = 0;
  if (v59)
  {
    v16 = *(_QWORD *)v87;
    v62 = v3;
    v57 = *(_QWORD *)v87;
    v58 = v13;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v87 != v16)
        {
          v18 = v17;
          objc_enumerationMutation(v13);
          v17 = v18;
        }
        v60 = v17;
        v19 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * v17);
        v81 = 0u;
        v82 = 0u;
        v83 = 0u;
        v84 = 0u;
        -[MCMCommandReferencesAdd groupIdentifiers](v2, "groupIdentifiers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v81, v80, 16);
        if (v21)
        {
          v22 = v21;
          v23 = v4;
          v24 = *(_QWORD *)v82;
          while (2)
          {
            v25 = 0;
            v26 = v15;
            do
            {
              if (*(_QWORD *)v82 != v24)
                objc_enumerationMutation(v20);
              v27 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * v25);
              v28 = (void *)gCodeSigningMapping;
              v29 = -[MCMCommandReferencesAdd containerClass](v68, "containerClass");
              v74 = v26;
              v70[0] = MEMORY[0x1E0C809B0];
              v70[1] = 3221225472;
              v70[2] = __34__MCMCommandReferencesAdd_execute__block_invoke;
              v70[3] = &unk_1E8CB4A90;
              v71 = v66;
              v73 = v64;
              v72 = v23;
              LODWORD(v27) = objc_msgSend(v28, "addGroupIdentifier:forIdentifier:containerClass:error:reconcileHandler:", v27, v19, v29, &v74, v70);
              v15 = v74;

              if (!(_DWORD)v27)
              {

                v44 = 0;
                v3 = v62;
                v4 = v23;
                v2 = v68;
                p_info = (__objc2_class_ro **)(MCMCommandDeleteContainerContent + 32);
                goto LABEL_40;
              }
              ++v25;
              v26 = v15;
            }
            while (v22 != v25);
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v81, v80, 16);
            if (v22)
              continue;
            break;
          }
          v14 = 1;
          v3 = v62;
          v4 = v23;
          v2 = v68;
          v13 = v58;
        }

        v17 = v60 + 1;
        p_info = (__objc2_class_ro **)(MCMCommandDeleteContainerContent + 32);
        v16 = v57;
      }
      while (v60 + 1 != v59);
      v59 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v86, v85, 16);
    }
    while (v59);
  }

  if (-[MCMCommandReferencesAdd createDuringReconciliation](v2, "createDuringReconciliation")
    && objc_msgSend(v4, "count"))
  {
    v61 = v14;
    v63 = v3;
    v65 = v4;
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v30 = v4;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v76, v75, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v77;
      do
      {
        v34 = 0;
        v35 = v15;
        do
        {
          if (*(_QWORD *)v77 != v33)
            objc_enumerationMutation(v30);
          v36 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * v34);
          -[MCMCommand context](v2, "context");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "containerFactory");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v35;
          objc_msgSend(v38, "containerForContainerIdentity:createIfNecessary:error:", v36, 1, &v69);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v69;

          objc_msgSend(v39, "metadataMinimal");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v40, "existed") & 1) == 0)
            objc_msgSend(v67, "addObject:", v40);

          ++v34;
          v35 = v15;
          v2 = v68;
        }
        while (v32 != v34);
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v76, v75, 16);
      }
      while (v32);
    }

    v3 = v63;
    v4 = v65;
    p_info = MCMCommandDeleteContainerContent.info;
    v14 = v61;
  }
  v41 = objc_alloc((Class)(p_info + 381));
  -[MCMCommand context](v2, "context");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "clientIdentity");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v56) = 1;
  v44 = (void *)objc_msgSend(v41, "initWithContainers:includePath:includeInfo:includeUserManagedAssetsRelPath:includeCreator:clientIdentity:skipSandboxExtensions:", v67, 1, 0, 0, 0, v43, v56);

  p_info = (__objc2_class_ro **)(MCMCommandDeleteContainerContent + 32);
  if ((v14 & 1) == 0)
    goto LABEL_40;
LABEL_41:
  container_log_handle_for_category();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    v48 = objc_msgSend(v67, "count");
    objc_msgSend(v44, "error");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v91 = v48;
    v92 = 2112;
    v93 = (uint64_t)v49;
    _os_log_impl(&dword_1CF807000, v47, OS_LOG_TYPE_DEFAULT, "References add; created containers count = %lu, error = %@",
      buf,
      0x16u);

  }
  -[MCMCommand resultPromise](v2, "resultPromise");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "completeWithResult:", v44);

  objc_autoreleasePoolPop(v3);
}

- (id)_resolveUserIdentity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[MCMCommand context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMCommandReferencesAdd userIdentity](self, "userIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MCMCommandReferencesAdd userIdentity](self, "userIdentity");
    v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v8 = v7;
    goto LABEL_7;
  }
  if ((objc_msgSend(v5, "isNoSpecificPersona") & 1) == 0)
  {
    v7 = v5;
    goto LABEL_6;
  }
  v8 = 0;
LABEL_7:

  return v8;
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

void __34__MCMCommandReferencesAdd_execute__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (*(_QWORD *)(a1 + 32) && *(_BYTE *)(a1 + 48))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "userIdentity");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqual:", *(_QWORD *)(a1 + 32));

          if (v12)
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      }
      while (v7);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "unionSet:", v4);
  }

}

+ (unint64_t)command
{
  return 48;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
