@implementation MCMCommandReferencesQuery

- (MCMCommandReferencesQuery)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  id v8;
  MCMCommandReferencesQuery *v9;
  uint64_t v10;
  NSSet *ownerIdentifiers;
  uint64_t v12;
  NSSet *groupIdentifiers;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MCMCommandReferencesQuery;
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

    v9->_uid = objc_msgSend(v8, "uid");
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
  v4 = objc_msgSend(v3, "isAllowedToReadReferences");

  return v4;
}

- (void)execute
{
  void *v3;
  MCMResultWithOwnersAndGroupsBase *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  unint64_t v9;
  MCMResultWithOwnersAndGroupsBase *v10;
  id v11;
  MCMResultWithOwnersAndGroupsBase *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, void *, void *);
  void *v23;
  MCMCommandReferencesQuery *v24;
  MCMResultWithOwnersAndGroupsBase *v25;
  BOOL v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17D7010](self, a2);
  v4 = objc_alloc_init(MCMResultWithOwnersAndGroupsBase);
  -[MCMCommandReferencesQuery ownerIdentifiers](self, "ownerIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    -[MCMCommandReferencesQuery groupIdentifiers](self, "groupIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7 == 0;

  }
  v8 = (void *)gCodeSigningMapping;
  v9 = -[MCMCommandReferencesQuery containerClass](self, "containerClass");
  v27 = 0;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __36__MCMCommandReferencesQuery_execute__block_invoke;
  v23 = &unk_1E8CB5910;
  v26 = v6;
  v24 = self;
  v10 = v4;
  v25 = v10;
  LOBYTE(v9) = objc_msgSend(v8, "enumerateOwnersAndGroupsWithGroupClass:error:block:", v9, &v27, &v20);
  v11 = v27;
  if ((v9 & 1) == 0)
  {
    v12 = [MCMResultWithOwnersAndGroupsBase alloc];
    v13 = -[MCMResultBase initWithError:](v12, "initWithError:", v11, v20, v21, v22, v23, v24);

    v10 = (MCMResultWithOwnersAndGroupsBase *)v13;
  }
  container_log_handle_for_category();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[MCMResultWithOwnersAndGroupsBase ownerIdentifiers](v10, "ownerIdentifiers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");
    -[MCMResultWithOwnersAndGroupsBase groupIdentifiers](v10, "groupIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");
    *(_DWORD *)buf = 134218498;
    v29 = v16;
    v30 = 2048;
    v31 = v18;
    v32 = 2112;
    v33 = v11;
    _os_log_impl(&dword_1CF807000, v14, OS_LOG_TYPE_DEFAULT, "References query; owners count = %lu, groups count = %lu, error = %@",
      buf,
      0x20u);

  }
  -[MCMCommand resultPromise](self, "resultPromise");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "completeWithResult:", v10);

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

uint64_t __36__MCMCommandReferencesQuery_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v6;
  id v7;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;

  v6 = a2;
  v7 = a3;
  if (*(_BYTE *)(a1 + 48))
    goto LABEL_2;
  objc_msgSend(*(id *)(a1 + 32), "ownerIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "ownerIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "containsObject:", v6))
    {

LABEL_2:
      objc_msgSend(*(id *)(a1 + 40), "addOwner:group:", v6, v7);
      goto LABEL_3;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "groupIdentifiers");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(*(id *)(a1 + 32), "groupIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v7);

    if (v9)
    {

      if ((v13 & 1) == 0)
        goto LABEL_3;
    }
    else if (!v13)
    {
      goto LABEL_3;
    }
    goto LABEL_2;
  }
  if (v9)
  {

  }
LABEL_3:

  return 1;
}

+ (unint64_t)command
{
  return 47;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end
