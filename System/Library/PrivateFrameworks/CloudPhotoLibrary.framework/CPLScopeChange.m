@implementation CPLScopeChange

- (void)_setChangeType:(unint64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPLScopeChange;
  -[CPLRecordChange setChangeType:](&v3, sel_setChangeType_, a3);
}

- (CPLScopeChange)initWithScopeIdentifier:(id)a3 type:(int64_t)a4
{
  id v7;
  uint64_t v8;
  CPLScopeChange *v9;
  CPLScopeChange *v10;
  CPLScopedIdentifier *v11;
  CPLScopeChange *v12;
  objc_class *v13;
  CPLScopeChange *v14;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  objc_super v24;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_opt_class();
  if (v8 == objc_opt_class())
  {
    v13 = +[CPLScopeChange scopeChangeClassForType:](CPLScopeChange, "scopeChangeClassForType:", a4);
    if (v13 != (objc_class *)objc_opt_class())
    {
      v12 = (CPLScopeChange *)objc_msgSend([v13 alloc], "initWithScopeIdentifier:type:", v7, a4);
      goto LABEL_8;
    }
  }
  else if ((objc_msgSend((id)objc_opt_class(), "isSubclassOfClass:", +[CPLScopeChange scopeChangeClassForType:](CPLScopeChange, "scopeChangeClassForType:", a4)) & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (void *)objc_opt_class();
        v18 = v17;
        +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", a4);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v27 = v17;
        v28 = 2112;
        v29 = v19;
        _os_log_impl(&dword_1B03C2000, v16, OS_LOG_TYPE_ERROR, "Invalid class %@ for scope type %@", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLScopeChange.m");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_opt_class();
    +[CPLScopeChange descriptionForScopeType:](CPLScopeChange, "descriptionForScopeType:", a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v21, 203, CFSTR("Invalid class %@ for scope type %@"), v22, v23);

    abort();
  }
  v25.receiver = self;
  v25.super_class = (Class)CPLScopeChange;
  v9 = -[CPLScopeChange init](&v25, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_scopeType = a4;
    v11 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:]([CPLScopedIdentifier alloc], "initWithScopeIdentifier:identifier:", CFSTR("__SCOPE__"), v7);
    v24.receiver = v10;
    v24.super_class = (Class)CPLScopeChange;
    -[CPLRecordChange setScopedIdentifier:](&v24, sel_setScopedIdentifier_, v11);
    v10->_activated = 1;

  }
  v12 = v10;
  self = v12;
LABEL_8:
  v14 = v12;

  return v14;
}

- (id)_scopedIdentifier
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CPLScopeChange;
  -[CPLRecordChange scopedIdentifier](&v3, sel_scopedIdentifier);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)scopeIdentifier
{
  void *v2;
  void *v3;

  -[CPLScopeChange _scopedIdentifier](self, "_scopedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)assetCountPerType
{
  return -[CPLLibraryInfo assetCounts](self->_libraryInfo, "assetCounts");
}

- (BOOL)isDisabled
{
  return -[CPLLibraryState isDisabled](self->_libraryState, "isDisabled");
}

- (NSDate)disabledDate
{
  return -[CPLLibraryState disabledDate](self->_libraryState, "disabledDate");
}

- (NSDate)deleteDate
{
  return -[CPLLibraryState deleteDate](self->_libraryState, "deleteDate");
}

- (CPLAccountFlags)accountFlags
{
  return -[CPLLibraryInfo accountFlags](self->_libraryInfo, "accountFlags");
}

- (id)_additionalDescription
{
  return &stru_1E60DF6B8;
}

- (id)description
{
  void *v3;
  NSString *stagingScopeIdentifier;
  id v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  void *v10;
  NSString *v11;
  void *v12;
  const __CFString *v13;
  id v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  void *v28;

  -[CPLScopeChange share](self, "share");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    stagingScopeIdentifier = self->_stagingScopeIdentifier;
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v6 = objc_opt_class();
    -[CPLScopeChange scopeIdentifier](self, "scopeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = "";
    if ((-[CPLRecordChange changeType](self, "changeType") & 0x400) != 0)
      v9 = " [D]";
    else
      v9 = "";
    objc_msgSend((id)objc_opt_class(), "descriptionForScopeType:", -[CPLScopeChange scopeType](self, "scopeType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (stagingScopeIdentifier)
    {
      v11 = self->_stagingScopeIdentifier;
      if (!self->_activated)
        v8 = " not-active";
      -[CPLScopeChange _additionalDescription](self, "_additionalDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v8;
      v28 = v12;
      v24 = v3;
      v25 = v11;
      v22 = v9;
      v23 = v10;
      v13 = CFSTR("<%@ %@%s (%@) - %@ (staged to %@)%s%@>");
    }
    else
    {
      if (self->_activated)
        v19 = "";
      else
        v19 = " not-active";
      -[CPLScopeChange _additionalDescription](self, "_additionalDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)v19;
      v27 = (const char *)v12;
      v23 = v10;
      v24 = v3;
      v22 = v9;
      v13 = CFSTR("<%@ %@%s (%@) - %@%s%@>");
    }
    v18 = objc_msgSend(v5, "initWithFormat:", v13, v6, v7, v22, v23, v24, v25, v27, v28);
  }
  else
  {
    v14 = objc_alloc(MEMORY[0x1E0CB3940]);
    v15 = objc_opt_class();
    -[CPLScopeChange scopeIdentifier](self, "scopeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = "";
    if ((-[CPLRecordChange changeType](self, "changeType") & 0x400) != 0)
      v17 = " [D]";
    else
      v17 = "";
    objc_msgSend((id)objc_opt_class(), "descriptionForScopeType:", -[CPLScopeChange scopeType](self, "scopeType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!self->_activated)
      v16 = " not-active";
    -[CPLScopeChange _additionalDescription](self, "_additionalDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v14, "initWithFormat:", CFSTR("<%@ %@%s (%@)%s%@>"), v15, v7, v17, v10, v16, v12, v26, v28);
  }
  v20 = (void *)v18;

  return v20;
}

- (id)redactedDescription
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  -[CPLScopeChange share](self, "share");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = objc_opt_class();
  -[CPLScopeChange scopeIdentifier](self, "scopeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[CPLRecordChange changeType](self, "changeType") & 0x400) != 0)
    v7 = " [D]";
  else
    v7 = "";
  objc_msgSend((id)objc_opt_class(), "descriptionForScopeType:", -[CPLScopeChange scopeType](self, "scopeType"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v3)
    v10 = objc_msgSend(v4, "initWithFormat:", CFSTR("<%@ %@%s (%@) - %@>"), v5, v6, v7, v8, v3);
  else
    v10 = objc_msgSend(v4, "initWithFormat:", CFSTR("<%@ %@%s (%@)>"), v5, v6, v7, v8, v13);
  v11 = (void *)v10;

  return v11;
}

- (int64_t)defaultFlags
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;

  -[CPLScopeChange share](self, "share");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "currentUserParticipant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v6 = objc_msgSend(v4, "permission");
    else
      v6 = objc_msgSend(v3, "publicPermission");
    v7 = v6 == 2;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)updateScopeFromScopeChange:(id)a3 direction:(unint64_t)a4 didHaveChanges:(BOOL *)a5
{
  if (a4 == 1)
  {
    *a5 = 0;
  }
  else
  {
    *a5 = 1;
    -[NSObject cplCopyPropertiesFromObject:withCopyBlock:](self, "cplCopyPropertiesFromObject:withCopyBlock:", a3, 0);
  }
}

- (BOOL)isScopeChange
{
  return 1;
}

- (BOOL)isLibraryShare
{
  return (-[CPLScopeChange scopeType](self, "scopeType") & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (BOOL)needsToSetScopeIdentifier
{
  void *v2;
  char v3;

  -[CPLScopeChange scopeIdentifier](self, "scopeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("auto"));

  return v3;
}

- (void)updateScopeIdentifier:(id)a3
{
  id v4;
  void *v5;
  CPLScopedIdentifier *v6;
  void *v7;
  CPLScopedIdentifier *v8;
  NSObject *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CPLScopeChange _scopedIdentifier](self, "_scopedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = [CPLScopedIdentifier alloc];
    objc_msgSend(v5, "scopeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](v6, "initWithScopeIdentifier:identifier:", v7, v4);
    v11.receiver = self;
    v11.super_class = (Class)CPLScopeChange;
    -[CPLRecordChange setScopedIdentifier:](&v11, sel_setScopedIdentifier_, v8);

  }
  if (!_CPLSilentLogging)
  {
    __CPLGenericOSLogDomain();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[CPLScopeChange _scopedIdentifier](self, "_scopedIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v5;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Updating %@ -> %@", buf, 0x16u);

    }
  }

}

- (BOOL)shouldAlwaysUpdateScopeInfoWhenPossible
{
  return 0;
}

- (int64_t)scopeType
{
  return self->_scopeType;
}

- (void)setScopeType:(int64_t)a3
{
  self->_scopeType = a3;
}

- (int64_t)busyState
{
  return self->_busyState;
}

- (void)setBusyState:(int64_t)a3
{
  self->_busyState = a3;
}

- (BOOL)containerHasBeenWiped
{
  return self->_containerHasBeenWiped;
}

- (CPLShare)share
{
  return self->_share;
}

- (void)setShare:(id)a3
{
  objc_storeStrong((id *)&self->_share, a3);
}

- (BOOL)isActivated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (CPLLibraryState)libraryState
{
  return self->_libraryState;
}

- (void)setLibraryState:(id)a3
{
  objc_storeStrong((id *)&self->_libraryState, a3);
}

- (CPLLibraryInfo)libraryInfo
{
  return self->_libraryInfo;
}

- (void)setLibraryInfo:(id)a3
{
  objc_storeStrong((id *)&self->_libraryInfo, a3);
}

- (NSString)stagingScopeIdentifier
{
  return self->_stagingScopeIdentifier;
}

- (void)setStagingScopeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (unint64_t)pullTaskItem
{
  return self->_pullTaskItem;
}

- (void)setPullTaskItem:(unint64_t)a3
{
  self->_pullTaskItem = a3;
}

- (CPLEngineScope)scope
{
  return self->_scope;
}

- (void)setScope:(id)a3
{
  objc_storeStrong((id *)&self->_scope, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_stagingScopeIdentifier, 0);
  objc_storeStrong((id *)&self->_libraryInfo, 0);
  objc_storeStrong((id *)&self->_libraryState, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_share, 0);
}

+ (id)mappingForScopeTypeDescription
{
  if (mappingForScopeTypeDescription_onceToken != -1)
    dispatch_once(&mappingForScopeTypeDescription_onceToken, &__block_literal_global_3315);
  return (id)mappingForScopeTypeDescription_mapping;
}

+ (id)descriptionForScopeType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(a1, "mappingForScopeTypeDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown type (%ld)"), a3);
  v8 = v7;

  return v8;
}

+ (id)mappingForScopeBusyStateDescription
{
  if (mappingForScopeBusyStateDescription_onceToken != -1)
    dispatch_once(&mappingForScopeBusyStateDescription_onceToken, &__block_literal_global_30_3308);
  return (id)mappingForScopeBusyStateDescription_mapping;
}

+ (id)descriptionForBusyState:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(a1, "mappingForScopeBusyStateDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unknown busy state (%ld)"), a3);
  v8 = v7;

  return v8;
}

+ (Class)scopeChangeClassForType:(int64_t)a3
{
  void *v6;
  void *v7;
  Class result;

  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      break;
    default:
      if (a3 != 0x7FFFFFFF)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLScopeChange.m");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, v7, 99, CFSTR("unknown scope type %ld"), a3);

        abort();
      }
      return result;
  }
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)shouldAutoActivateScopeWithType:(int64_t)a3
{
  BOOL result;
  void *v8;
  void *v9;

  result = 0;
  if ((unint64_t)a3 > 6)
  {
    if (a3 != 0x7FFFFFFF)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLScopeChange.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, v9, 127, CFSTR("unknown scope type %ld"), a3);

      abort();
    }
  }
  else if (((1 << a3) & 0x43) == 0)
  {
    if (((1 << a3) & 0xC) != 0)
    {
      return 1;
    }
    else if (overridesFeatureFlag == 1 && isFeatureEnabled == 0)
    {
      return 0;
    }
    else
    {
      if (CPLAllowsInactiveSharedLibraryScope_onceToken != -1)
        dispatch_once(&CPLAllowsInactiveSharedLibraryScope_onceToken, &__block_literal_global_1_21468);
      return CPLAllowsInactiveSharedLibraryScope_allowsInactiveSharedLibraryScope == 0;
    }
  }
  return result;
}

+ (BOOL)supportsStagingScopeForScopeWithType:(int64_t)a3
{
  return a3 == 5;
}

+ (BOOL)scopeWithTypeHasQuota:(int64_t)a3
{
  return ((unint64_t)a3 < 6) & (0x32u >> a3);
}

+ (BOOL)supportsDirectMinglingForScopeWithType:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) != 4;
}

+ (id)newScopeChangeWithScopeIdentifier:(id)a3 type:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithScopeIdentifier:type:", v6, a4);

  return v7;
}

+ (id)newScopeChangeInferClassWithScopeIdentifier:(id)a3 type:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(a1, "scopeChangeClassForType:", a4)), "initWithScopeIdentifier:type:", v6, a4);

  return v7;
}

+ (id)newDeleteScopeChangeWithScopeIdentifier:(id)a3 type:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithScopeIdentifier:type:", v6, a4);

  objc_msgSend(v7, "_setChangeType:", 1024);
  return v7;
}

+ (id)newScopeChangeWithAutomaticScopeIdentifierForScopeType:(int64_t)a3
{
  return (id)objc_msgSend(a1, "newScopeChangeWithScopeIdentifier:type:", CFSTR("auto"), a3);
}

void __53__CPLScopeChange_mappingForScopeBusyStateDescription__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6119EE0;
  v2[1] = &unk_1E6119EF8;
  v3[0] = CFSTR("none");
  v3[1] = CFSTR("busy");
  v2[2] = &unk_1E6119F10;
  v3[2] = CFSTR("snapshot");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mappingForScopeBusyStateDescription_mapping;
  mappingForScopeBusyStateDescription_mapping = v0;

}

void __48__CPLScopeChange_mappingForScopeTypeDescription__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[8];
  _QWORD v3[9];

  v3[8] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6119EE0;
  v2[1] = &unk_1E6119EF8;
  v3[0] = CFSTR("unknown");
  v3[1] = CFSTR("library");
  v2[2] = &unk_1E6119F10;
  v2[3] = &unk_1E6119F28;
  v3[2] = CFSTR("owned-moment-share");
  v3[3] = CFSTR("accepted-moment-share");
  v2[4] = &unk_1E6119F40;
  v2[5] = &unk_1E6119F58;
  v3[4] = CFSTR("owned-library-share");
  v3[5] = CFSTR("accepted-library-share");
  v2[6] = &unk_1E6119F70;
  v2[7] = &unk_1E6119F88;
  v3[6] = CFSTR("staging");
  v3[7] = CFSTR("ignored");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mappingForScopeTypeDescription_mapping;
  mappingForScopeTypeDescription_mapping = v0;

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "cplCopyPropertiesFromObject:withCopyBlock:", self, 0);
  return v4;
}

- (CPLScopeChange)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  CPLScopeChange *v6;
  objc_class *v7;
  objc_class *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  CPLScopeChange *v13;
  __int16 v14;
  objc_class *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class()
    || (v7 = +[CPLScopeChange scopeChangeClassForType:](CPLScopeChange, "scopeChangeClassForType:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scopeType"))), v7 == (objc_class *)v5))
  {
    v11.receiver = self;
    v11.super_class = (Class)CPLScopeChange;
    self = -[CPLRecordChange initWithCoder:](&v11, sel_initWithCoder_, v4);
    v6 = self;
  }
  else
  {
    v8 = v7;
    v6 = (CPLScopeChange *)objc_msgSend([v7 alloc], "initWithCoder:", v4);
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v6;
        v14 = 2112;
        v15 = v8;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_DEFAULT, "Automatically upgrading %@ to %@", buf, 0x16u);
      }

    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)cplShouldIgnorePropertyForEquality:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("scope")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("pullTaskItem")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("recordModificationDate")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLScopeChange;
    v5 = objc_msgSendSuper2(&v7, sel_cplShouldIgnorePropertyForEquality_, v4);
  }

  return v5;
}

@end
