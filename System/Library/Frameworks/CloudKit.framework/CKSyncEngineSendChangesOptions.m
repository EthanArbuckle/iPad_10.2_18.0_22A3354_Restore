@implementation CKSyncEngineSendChangesOptions

- (void)setOperationGroup:(id)a3 updateName:(BOOL)a4
{
  _BOOL4 v4;
  CKSyncEngineSendChangesOptions *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v4 = a4;
  v11 = a3;
  v7 = self;
  objc_sync_enter(v7);
  objc_storeStrong((id *)&v7->_operationGroup, a3);
  if (v4)
    objc_msgSend_updateOperationGroupName(v7, v8, v9, v10);
  objc_sync_exit(v7);

}

- (CKSyncEngineSendChangesOptions)initWithScope:(CKSyncEngineSendChangesScope *)scope
{
  CKSyncEngineSendChangesScope *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKSyncEngineSendChangesOptions *v8;
  void *v9;
  void *v10;
  CKSyncEngineSendChangesScope *v11;
  CKSyncEngineSendChangesScope *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CKOperationGroup *operationGroup;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v23;

  v4 = scope;
  v23.receiver = self;
  v23.super_class = (Class)CKSyncEngineSendChangesOptions;
  v8 = -[CKSyncEngineSendChangesOptions init](&v23, sel_init);
  if (v8)
  {
    v9 = (void *)objc_msgSend_copy(v4, v5, v6, v7);
    v10 = v9;
    if (v9)
      v11 = v9;
    else
      v11 = (CKSyncEngineSendChangesScope *)objc_opt_new();
    v12 = v8->_scope;
    v8->_scope = v11;

    v13 = (void *)objc_opt_class();
    objc_msgSend_defaultOperationGroup(v13, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    operationGroup = v8->_operationGroup;
    v8->_operationGroup = (CKOperationGroup *)v17;

    objc_msgSend_updateOperationGroupName(v8, v19, v20, v21);
  }

  return v8;
}

- (CKOperationGroup)operationGroup
{
  CKSyncEngineSendChangesOptions *v2;
  CKOperationGroup *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_operationGroup;
  objc_sync_exit(v2);

  return v3;
}

- (CKSyncEngineSendChangesScope)scope
{
  CKSyncEngineSendChangesOptions *v2;
  CKSyncEngineSendChangesScope *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_scope;
  objc_sync_exit(v2);

  return v3;
}

- (void)setOperationGroup:(CKOperationGroup *)operationGroup
{
  objc_msgSend_setOperationGroup_updateName_(self, a2, (uint64_t)operationGroup, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationGroup, 0);
  objc_storeStrong((id *)&self->_scope, 0);
}

- (BOOL)CKDescriptionShouldPrintPointer
{
  return 0;
}

- (id)CKDescriptionClassName
{
  return CFSTR("SendChangesOptions");
}

- (void)CKDescribePropertiesUsing:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  id v18;

  v4 = a3;
  objc_msgSend_scope(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v4, v9, (uint64_t)CFSTR("scope"), (uint64_t)v8, 0);

  objc_msgSend_operationGroup(self, v10, v11, v12);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v18, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v4, v17, (uint64_t)CFSTR("group"), (uint64_t)v16, 0);

}

+ (id)defaultOperationGroup
{
  id v2;

  static CKSyncEngineSendChangesOptions.defaultOperationGroup()();
  return v2;
}

- (void)updateOperationGroupName
{
  CKSyncEngineSendChangesOptions *v2;

  v2 = self;
  CKSyncEngineSendChangesOptions.updateOperationGroupName()();

}

- (CKSyncEngineSendChangesOptions)init
{
  void *v3;
  const char *v4;
  uint64_t v5;
  CKSyncEngineSendChangesOptions *v6;

  v3 = (void *)objc_opt_new();
  v6 = (CKSyncEngineSendChangesOptions *)objc_msgSend_initWithScope_(self, v4, (uint64_t)v3, v5);

  return v6;
}

- (CKSyncEngineSendChangesOptions)initWithZoneIDs:(id)a3
{
  id v4;
  CKSyncEngineSendChangesScope *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  CKSyncEngineSendChangesOptions *v14;

  v4 = a3;
  if (v4)
  {
    v5 = [CKSyncEngineSendChangesScope alloc];
    objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v6, (uint64_t)v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend_initWithZoneIDs_(v5, v9, (uint64_t)v8, v10);

  }
  else
  {
    v11 = (void *)objc_opt_new();
  }
  v14 = (CKSyncEngineSendChangesOptions *)objc_msgSend_initWithScope_(self, v12, (uint64_t)v11, v13);

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKSyncEngineSendChangesOptions *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;

  v4 = [CKSyncEngineSendChangesOptions alloc];
  objc_msgSend_scope(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_copy(v8, v9, v10, v11);
  v15 = (void *)objc_msgSend_initWithScope_(v4, v13, (uint64_t)v12, v14);

  objc_msgSend_operationGroup(v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOperationGroup_updateName_(v15, v20, (uint64_t)v19, 0);

  return v15;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEngineSendChangesOptions *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEngineSendChangesOptions *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (void)setScope:(CKSyncEngineSendChangesScope *)scope
{
  CKSyncEngineSendChangesOptions *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CKSyncEngineSendChangesScope *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CKSyncEngineSendChangesScope *v13;

  v13 = scope;
  v4 = self;
  objc_sync_enter(v4);
  v8 = objc_msgSend_copy(v13, v5, v6, v7);
  v9 = v4->_scope;
  v4->_scope = (CKSyncEngineSendChangesScope *)v8;

  objc_msgSend_updateOperationGroupName(v4, v10, v11, v12);
  objc_sync_exit(v4);

}

- (id)zoneIDs
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  objc_msgSend_scope(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneIDs(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
