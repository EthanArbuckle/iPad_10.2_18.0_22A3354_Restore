@implementation CKSyncEngineFetchChangesOptions

- (CKSyncEngineFetchChangesOptions)initWithScope:(CKSyncEngineFetchChangesScope *)scope
{
  CKSyncEngineFetchChangesScope *v4;
  CKSyncEngineFetchChangesOptions *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  CKSyncEngineFetchChangesOptions *v9;
  void *v10;
  void *v11;
  CKSyncEngineFetchChangesScope *v12;
  CKSyncEngineFetchChangesScope *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CKOperationGroup *operationGroup;
  NSDictionary *zoneConfigurations;
  CKSyncEngineFetchChangesZoneConfiguration *v21;
  CKSyncEngineFetchChangesZoneConfiguration *defaultZoneConfiguration;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v27;

  v4 = scope;
  v27.receiver = self;
  v27.super_class = (Class)CKSyncEngineFetchChangesOptions;
  v5 = -[CKSyncEngineFetchChangesOptions init](&v27, sel_init);
  v9 = v5;
  if (v5)
  {
    v5->_forceFetchChanges = 0;
    v10 = (void *)objc_msgSend_copy(v4, v6, v7, v8);
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = (CKSyncEngineFetchChangesScope *)objc_opt_new();
    v13 = v9->_scope;
    v9->_scope = v12;

    v14 = (void *)objc_opt_class();
    objc_msgSend_defaultOperationGroup(v14, v15, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    operationGroup = v9->_operationGroup;
    v9->_operationGroup = (CKOperationGroup *)v18;

    zoneConfigurations = v9->_zoneConfigurations;
    v9->_zoneConfigurations = (NSDictionary *)MEMORY[0x1E0C9AA70];

    v21 = objc_alloc_init(CKSyncEngineFetchChangesZoneConfiguration);
    defaultZoneConfiguration = v9->_defaultZoneConfiguration;
    v9->_defaultZoneConfiguration = v21;

    objc_msgSend_updateOperationGroupName(v9, v23, v24, v25);
  }

  return v9;
}

- (void)setOperationGroup:(id)a3 updateName:(BOOL)a4
{
  _BOOL4 v4;
  CKSyncEngineFetchChangesOptions *v7;
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

- (void)CKDescribePropertiesUsing:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t Changes;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  id v45;

  v45 = a3;
  objc_msgSend_scope(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v45, v8, (uint64_t)CFSTR("scope"), (uint64_t)v7, 0);

  objc_msgSend_operationGroup(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_name(v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addPropertyIfExists_value_shouldRedact_(v45, v17, (uint64_t)CFSTR("group"), (uint64_t)v16, 0);

  if (objc_msgSend_forceFetchChanges(self, v18, v19, v20))
  {
    v24 = (void *)MEMORY[0x1E0CB37E8];
    Changes = objc_msgSend_forceFetchChanges(self, v21, v22, v23);
    objc_msgSend_numberWithBool_(v24, v26, Changes, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v45, v29, (uint64_t)CFSTR("forceFetchChanges"), (uint64_t)v28, 0);

  }
  objc_msgSend_defaultZoneConfiguration(self, v21, v22, v23);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addProperty_value_shouldRedact_(v45, v31, (uint64_t)CFSTR("defaultZoneConfiguration"), (uint64_t)v30, 0);

  objc_msgSend_zoneConfigurations(self, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend_count(v35, v36, v37, v38);

  if (v39)
  {
    objc_msgSend_zoneConfigurations(self, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_shouldRedact_(v45, v44, (uint64_t)CFSTR("zoneConfigurations"), (uint64_t)v43, 0);

  }
}

- (CKOperationGroup)operationGroup
{
  CKSyncEngineFetchChangesOptions *v2;
  CKOperationGroup *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_operationGroup;
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)forceFetchChanges
{
  return self->_forceFetchChanges;
}

- (NSDictionary)zoneConfigurations
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (CKSyncEngineFetchChangesZoneConfiguration)defaultZoneConfiguration
{
  return (CKSyncEngineFetchChangesZoneConfiguration *)objc_getProperty(self, a2, 48, 1);
}

- (CKSyncEngineFetchChangesScope)scope
{
  CKSyncEngineFetchChangesOptions *v2;
  CKSyncEngineFetchChangesScope *v3;

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
  objc_storeStrong((id *)&self->_defaultZoneConfiguration, 0);
  objc_storeStrong((id *)&self->_zoneConfigurations, 0);
  objc_storeStrong((id *)&self->_prioritizedZoneIDs, 0);
  objc_storeStrong((id *)&self->_operationGroup, 0);
  objc_storeStrong((id *)&self->_scope, 0);
}

- (BOOL)CKDescriptionShouldPrintPointer
{
  return 0;
}

- (id)CKDescriptionClassName
{
  return CFSTR("FetchChangesOptions");
}

- (id)redactedDescription
{
  return (id)((uint64_t (*)(CKSyncEngineFetchChangesOptions *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKRedactedDescription);
}

- (NSArray)prioritizedZoneIDs
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)updateOperationGroupName
{
  CKSyncEngineFetchChangesOptions *v2;

  v2 = self;
  CKSyncEngineFetchChangesOptions.updateOperationGroupName()();

}

- (CKSyncEngineFetchChangesOptions)init
{
  void *v3;
  const char *v4;
  uint64_t v5;
  CKSyncEngineFetchChangesOptions *v6;

  v3 = (void *)objc_opt_new();
  v6 = (CKSyncEngineFetchChangesOptions *)objc_msgSend_initWithScope_(self, v4, (uint64_t)v3, v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CKSyncEngineFetchChangesOptions *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;

  v5 = [CKSyncEngineFetchChangesOptions alloc];
  objc_msgSend_scope(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend_copy(v9, v10, v11, v12);
  v16 = (void *)objc_msgSend_initWithScope_(v5, v14, (uint64_t)v13, v15);

  v19 = (void *)objc_msgSend_copyWithZone_(self->_prioritizedZoneIDs, v17, (uint64_t)a3, v18);
  objc_msgSend_setPrioritizedZoneIDs_(v16, v20, (uint64_t)v19, v21);

  v24 = (void *)objc_msgSend_copyWithZone_(self->_zoneConfigurations, v22, (uint64_t)a3, v23);
  objc_msgSend_setZoneConfigurations_(v16, v25, (uint64_t)v24, v26);

  v29 = (void *)objc_msgSend_copyWithZone_(self->_defaultZoneConfiguration, v27, (uint64_t)a3, v28);
  objc_msgSend_setDefaultZoneConfiguration_(v16, v30, (uint64_t)v29, v31);

  objc_msgSend_operationGroup(v16, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOperationGroup_updateName_(v16, v36, (uint64_t)v35, 0);

  return v16;
}

- (CKSyncEngineFetchChangesOptions)initWithZoneIDs:(id)a3
{
  id v4;
  CKSyncEngineFetchChangesScope *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  CKSyncEngineFetchChangesOptions *v14;

  v4 = a3;
  if (v4)
  {
    v5 = [CKSyncEngineFetchChangesScope alloc];
    objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v6, (uint64_t)v4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend_initWithZoneIDs_(v5, v9, (uint64_t)v8, v10);

  }
  else
  {
    v11 = (void *)objc_opt_new();
  }
  v14 = (CKSyncEngineFetchChangesOptions *)objc_msgSend_initWithScope_(self, v12, (uint64_t)v11, v13);

  return v14;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKSyncEngineFetchChangesOptions *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKUnredactedDescription);
}

- (void)setScope:(CKSyncEngineFetchChangesScope *)scope
{
  CKSyncEngineFetchChangesOptions *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CKSyncEngineFetchChangesScope *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  CKSyncEngineFetchChangesScope *v13;

  v13 = scope;
  v4 = self;
  objc_sync_enter(v4);
  v8 = objc_msgSend_copy(v13, v5, v6, v7);
  v9 = v4->_scope;
  v4->_scope = (CKSyncEngineFetchChangesScope *)v8;

  objc_msgSend_updateOperationGroupName(v4, v10, v11, v12);
  objc_sync_exit(v4);

}

- (void)setPrioritizedZoneIDs:(NSArray *)prioritizedZoneIDs
{
  objc_setProperty_atomic_copy(self, a2, prioritizedZoneIDs, 32);
}

- (void)setForceFetchChanges:(BOOL)a3
{
  self->_forceFetchChanges = a3;
}

- (void)setZoneConfigurations:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (void)setDefaultZoneConfiguration:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

@end
