@implementation CPLPersonChange

+ (BOOL)cplShouldIgnorePropertyForCoding:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", CFSTR("contactMatchingDictionary")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLPersonChange;
    v5 = objc_msgSendSuper2(&v7, sel_cplShouldIgnorePropertyForCoding_, v4);
  }

  return v5;
}

+ (BOOL)cplShouldIgnorePropertyForEquality:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqual:", CFSTR("contactMatchingDictionary")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLPersonChange;
    v5 = objc_msgSendSuper2(&v7, sel_cplShouldIgnorePropertyForEquality_, v4);
  }

  return v5;
}

+ (BOOL)supportsDeletion
{
  return 1;
}

+ (BOOL)supportsDirectDeletion
{
  return 1;
}

- (NSDictionary)contactMatchingDictionary
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[CPLPersonChange contactDescriptor](self, "contactDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v2, 0, 0, &v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v8;
    if (v3)
      v5 = 0;
    else
      v5 = _CPLSilentLogging == 0;
    if (v5)
    {
      __CPLGenericOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v4;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_ERROR, "Failed to decode contactDescriptor as a plist: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v3 = 0;
  }

  return (NSDictionary *)v3;
}

- (void)setContactMatchingDictionary:(id)a3
{
  void *v4;
  id v5;
  BOOL v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (v4)
      v6 = 0;
    else
      v6 = _CPLSilentLogging == 0;
    if (v6)
    {
      __CPLGenericOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v5;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "Failed to encode contactMatchingDictionary as a plist: %@", buf, 0xCu);
      }

    }
    -[CPLPersonChange setContactDescriptor:](self, "setContactDescriptor:", v4);

  }
  else
  {
    -[CPLPersonChange setContactDescriptor:](self, "setContactDescriptor:", 0);
  }
}

- (id)mergeTargetPersonScopedIdentifier
{
  void *v3;
  CPLScopedIdentifier *v4;
  void *v5;
  id v6;

  -[CPLPersonChange mergeTargetPersonIdentifier](self, "mergeTargetPersonIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [CPLScopedIdentifier alloc];
    -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v4, "initRelativeToScopedIdentifier:identifier:", v5, v3);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setMergeTargetPersonScopedIdentifier:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  objc_msgSend(v21, "scopeIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scopeIdentifier");
  v7 = objc_claimAutoreleasedReturnValue();

  if (v5 && v7)
  {
    v8 = objc_msgSend((id)v5, "isEqual:", v7);

    if ((v8 & 1) == 0)
      goto LABEL_4;
  }
  else
  {

    if (v5 | v7)
    {
LABEL_4:
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "scopeIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "scopeIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v23 = v10;
          v24 = 2112;
          v25 = v12;
          v26 = 2112;
          v27 = v13;
          _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Invalid call to %@ with mismatched scope: %@ vs. %@", buf, 0x20u);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPersonChange.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scopeIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "scopeIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v15, 64, CFSTR("Invalid call to %@ with mismatched scope: %@ vs. %@"), v16, v18, v19);

      abort();
    }
  }
  objc_msgSend(v21, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLPersonChange setMergeTargetPersonIdentifier:](self, "setMergeTargetPersonIdentifier:", v20);

}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (int64_t)personType
{
  return self->_personType;
}

- (void)setPersonType:(int64_t)a3
{
  self->_personType = a3;
}

- (int64_t)manualSortOrder
{
  return self->_manualSortOrder;
}

- (void)setManualSortOrder:(int64_t)a3
{
  self->_manualSortOrder = a3;
}

- (int64_t)assetSortOrder
{
  return self->_assetSortOrder;
}

- (void)setAssetSortOrder:(int64_t)a3
{
  self->_assetSortOrder = a3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (int64_t)verifiedType
{
  return self->_verifiedType;
}

- (void)setVerifiedType:(int64_t)a3
{
  self->_verifiedType = a3;
}

- (signed)detectionType
{
  return self->_detectionType;
}

- (void)setDetectionType:(signed __int16)a3
{
  self->_detectionType = a3;
}

- (NSString)mergeTargetPersonIdentifier
{
  return self->_mergeTargetPersonIdentifier;
}

- (void)setMergeTargetPersonIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSData)contactDescriptor
{
  return self->_contactDescriptor;
}

- (void)setContactDescriptor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactDescriptor, 0);
  objc_storeStrong((id *)&self->_mergeTargetPersonIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
}

+ (BOOL)serverSupportsGraphPeopleHome
{
  if (serverSupportsGraphPeopleHome_onceToken != -1)
    dispatch_once(&serverSupportsGraphPeopleHome_onceToken, &__block_literal_global_13999);
  return serverSupportsGraphPeopleHome_serverSupportsGraphPeopleHome;
}

+ (BOOL)serverSupportsMergeTargetRef
{
  if (serverSupportsMergeTargetRef_onceToken != -1)
    dispatch_once(&serverSupportsMergeTargetRef_onceToken, &__block_literal_global_75);
  return serverSupportsMergeTargetRef_serverSupportsMergeTargetRef;
}

+ (BOOL)serverSupportsDetectionType
{
  return 1;
}

+ (BOOL)serverSupportsAssetSortOrder
{
  return 1;
}

void __64__CPLPersonChange_DefaultsSupport__serverSupportsMergeTargetRef__block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("CPLServerSupportsMergeTargetRef"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v1 = v3;
  if (v3)
  {
    v2 = objc_msgSend(v3, "BOOLValue");
    v1 = v3;
  }
  else
  {
    v2 = 1;
  }
  serverSupportsMergeTargetRef_serverSupportsMergeTargetRef = v2;

}

void __65__CPLPersonChange_DefaultsSupport__serverSupportsGraphPeopleHome__block_invoke()
{
  void *v0;
  void *v1;
  char v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("CPLServerSupportsGraphPeopleHome"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v1 = v3;
  if (v3)
  {
    v2 = objc_msgSend(v3, "BOOLValue");
    v1 = v3;
  }
  else
  {
    v2 = 1;
  }
  serverSupportsGraphPeopleHome_serverSupportsGraphPeopleHome = v2;

}

- (BOOL)validateRecordForTracker:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPLPersonChange;
  if (!-[CPLRecordChange validateRecordForTracker:](&v9, sel_validateRecordForTracker_, v4))
    goto LABEL_7;
  if (-[CPLRecordChange hasChangeType:](self, "hasChangeType:", 2)
    && +[CPLPersonChange serverSupportsGraphPeopleHome](CPLPersonChange, "serverSupportsGraphPeopleHome")
    && !-[CPLPersonChange verifiedType](self, "verifiedType"))
  {
    objc_msgSend(v4, "pushChangeTasks");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addTask:forRecordWithScopedIdentifier:", 0, v7);

LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v5 = 1;
LABEL_8:

  return v5;
}

+ (Class)relatedRecordClass
{
  return (Class)objc_opt_class();
}

@end
