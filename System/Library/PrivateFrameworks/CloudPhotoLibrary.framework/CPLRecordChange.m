@implementation CPLRecordChange

- (id)storedClassNameForCPLArchiver:(id)a3
{
  void *v3;
  void *v4;

  NSStringFromClass((Class)-[CPLRecordChange classForCoder](self, "classForCoder", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "substringWithRange:", 3, objc_msgSend(v3, "length") - 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CPLRecordChange)initWithCoder:(id)a3
{
  id v4;
  CPLRecordChange *v5;
  CPLRecordChange *v6;
  void *v7;
  void *v8;
  CPLScopedIdentifier *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLRecordChange;
  v5 = -[CPLRecordChange init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    -[NSObject cplDecodePropertiesFromCoder:](v5, "cplDecodePropertiesFromCoder:", v4);
    -[CPLRecordChange scopedIdentifier](v6, "scopedIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      if (initWithCoder__onceToken_4511 != -1)
        dispatch_once(&initWithCoder__onceToken_4511, &__block_literal_global_45);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", initWithCoder__stringClass, CFSTR("identifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:]([CPLScopedIdentifier alloc], "initWithScopeIdentifier:identifier:", CFSTR("PrimarySync"), v8);
        -[CPLRecordChange setScopedIdentifier:](v6, "setScopedIdentifier:", v9);

      }
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "cplCopyPropertiesFromObject:withCopyBlock:", self, 0);
  return v4;
}

uint64_t __46__CPLRecordChange_CPLNSCoding__initWithCoder___block_invoke()
{
  uint64_t result;

  result = objc_opt_class();
  initWithCoder__stringClass = result;
  return result;
}

+ (BOOL)cplShouldIgnorePropertyForCoding:(id)a3
{
  id v4;
  unsigned __int8 v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("identifier")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLRecordChange;
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
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("identifier")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CPLRecordChange;
    v5 = objc_msgSendSuper2(&v7, sel_cplShouldIgnorePropertyForEquality_, v4);
  }

  return v5;
}

+ (Class)classForStoredClassName:(id)a3 forCPLArchiver:(id)a4
{
  objc_class *v4;
  id v5;
  NSString *v6;
  objc_class *v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (NSString *)objc_msgSend([v4 alloc], "initWithFormat:", CFSTR("CPL%@Change"), v5);

  v7 = NSClassFromString(v6);
  return v7;
}

+ (id)cplAdditionalSecureClassesForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (cplAdditionalSecureClassesForProperty__onceToken != -1)
    dispatch_once(&cplAdditionalSecureClassesForProperty__onceToken, &__block_literal_global_4526);
  objc_msgSend((id)cplAdditionalSecureClassesForProperty__additionalClasses, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___CPLRecordChange;
    objc_msgSendSuper2(&v10, sel_cplAdditionalSecureClassesForProperty_, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __70__CPLRecordChange_CPLNSCoding__cplAdditionalSecureClassesForProperty___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[7];
  _QWORD v10[8];

  v10[7] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("resources");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v0;
  v9[1] = CFSTR("expungeableResourceStates");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v1;
  v9[2] = CFSTR("containerRelations");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v2;
  v9[3] = CFSTR("keywords");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v3;
  v9[4] = CFSTR("people");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v4;
  v9[5] = CFSTR("sharingContributorUserIdentifiers");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v5;
  v9[6] = CFSTR("updateSharingContributorUserIdentifiers");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[6] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 7);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)cplAdditionalSecureClassesForProperty__additionalClasses;
  cplAdditionalSecureClassesForProperty__additionalClasses = v7;

}

- (CPLRecordChange)initWithCPLArchiver:(id)a3
{
  id v4;
  CPLRecordChange *v5;
  CPLRecordChange *v6;
  void *v7;
  void *v8;
  CPLScopedIdentifier *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CPLRecordChange;
  v5 = -[NSObject initWithCPLArchiver:](&v11, sel_initWithCPLArchiver_, v4);
  v6 = v5;
  if (v5)
  {
    -[CPLRecordChange scopedIdentifier](v5, "scopedIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      if (initWithCPLArchiver__onceToken != -1)
        dispatch_once(&initWithCPLArchiver__onceToken, &__block_literal_global_1300);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", initWithCPLArchiver__stringClass, CFSTR("identifier"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:]([CPLScopedIdentifier alloc], "initWithScopeIdentifier:identifier:", CFSTR("PrimarySync"), v8);
        -[CPLRecordChange setScopedIdentifier:](v6, "setScopedIdentifier:", v9);

      }
    }
  }

  return v6;
}

uint64_t __52__CPLRecordChange_CPLArchiver__initWithCPLArchiver___block_invoke()
{
  uint64_t result;

  result = objc_opt_class();
  initWithCPLArchiver__stringClass = result;
  return result;
}

- (id)scopedIdentifiersForMapping
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (-[CPLRecordChange supportsResources](self, "supportsResources")
    && -[CPLRecordChange hasChangeType:](self, "hasChangeType:", 8)
    && (-[CPLRecordChange resourceCopyFromScopedIdentifier](self, "resourceCopyFromScopedIdentifier"),
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)v3;
    -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)translateToCloudChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)-[CPLRecordChange copy](self, "copy");
  v27 = 0;
  -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v8, &v27);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v7, "setScopedIdentifier:", v9);
      if (!v7)
      {
LABEL_24:

        goto LABEL_25;
      }
    }
    else
    {
      -[CPLRecordChange proposedCloudScopedIdentifierWithError:](self, "proposedCloudScopedIdentifierWithError:", a4);
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10
        && (v11 = (void *)v10,
            objc_msgSend(v6, "setupCloudScopedIdentifier:forLocalScopedIdentifier:isFinal:direction:error:", v10, v8, 0, 1, a4), v12 = (void *)objc_claimAutoreleasedReturnValue(), v11, v12))
      {
        objc_msgSend(v7, "setScopedIdentifier:", v12);
      }
      else
      {
        v12 = v7;
        v7 = 0;
      }

      if (!v7)
        goto LABEL_24;
    }
    if (objc_msgSend(v7, "supportsResources") && objc_msgSend(v7, "hasChangeType:", 8))
    {
      objc_msgSend(v7, "scopedIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      objc_msgSend(v7, "resources");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v24 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "setItemScopedIdentifier:", v13);
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v16);
      }

      -[CPLRecordChange resourceCopyFromScopedIdentifier](self, "resourceCopyFromScopedIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v22 = 0;
        objc_msgSend(v6, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v19, &v22);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v20)
          v20 = (void *)objc_msgSend(v19, "copy");
        objc_msgSend(v7, "setResourceCopyFromScopedIdentifier:", v20);

      }
    }
    goto LABEL_24;
  }
LABEL_25:

  return v7;
}

- (id)translateToClientChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSObject *v19;
  id *v21;
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  CPLRecordChange *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)-[CPLRecordChange copy](self, "copy");
  v27 = 0;
  -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v8, &v27);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
    }
    else
    {
      -[CPLRecordChange proposedLocalScopedIdentifier](self, "proposedLocalScopedIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "addCloudScopedIdentifier:forLocalScopedIdentifier:isFinal:direction:error:", v8, v10, 1, 2, a4))
      {
        v11 = v7;
        v7 = 0;
        goto LABEL_28;
      }
    }
    objc_msgSend(v7, "setScopedIdentifier:", v10);
    if (!v7
      || !objc_msgSend(v7, "supportsResources")
      || !objc_msgSend(v7, "hasChangeType:", 8))
    {
      goto LABEL_29;
    }
    v21 = a4;
    objc_msgSend(v7, "scopedIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v7, "resources");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "setItemScopedIdentifier:", v11);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      }
      while (v14);
    }

    v22 = 0;
    -[CPLRecordChange resourceCopyFromScopedIdentifier](self, "resourceCopyFromScopedIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v6, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v17, &v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(v7, "setResourceCopyFromScopedIdentifier:", v18);
      }
      else
      {
        if (v21)
        {
          +[CPLErrors invalidClientCacheErrorWithReason:](CPLErrors, "invalidClientCacheErrorWithReason:", 0);
          *v21 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (!_CPLSilentLogging)
        {
          __CPLGenericOSLogDomain();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v29 = v17;
            v30 = 2112;
            v31 = self;
            _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_ERROR, "Can't map cloud \"resourceCopyFromScopedIdentifier\" (%@) of %@", buf, 0x16u);
          }

        }
        v7 = 0;
      }

    }
LABEL_28:

LABEL_29:
  }

  return v7;
}

- (id)proposedCloudScopedIdentifierWithError:(id *)a3
{
  void *v3;
  void *v4;

  -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (id)compactedChangeWithRelatedChanges:(id)a3 isOnlyChange:(BOOL)a4 fullRecord:(id)a5 usingStorageView:(id)a6
{
  CPLRecordChange *v6;

  if (a4)
    v6 = 0;
  else
    v6 = self;
  return v6;
}

+ (id)descriptionForDirection:(unint64_t)a3
{
  __CFString *v3;

  if (a3 >= 3)
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unknown direction %lu"), a3);
  else
    v3 = off_1E60DAD78[a3];
  return v3;
}

+ (BOOL)supportsResources
{
  return 0;
}

+ (BOOL)supportsResourceType:(unint64_t)a3
{
  return 1;
}

+ (BOOL)requiresStableHashForResourceType:(unint64_t)a3
{
  return 0;
}

+ (BOOL)supportsDeletion
{
  return 0;
}

+ (BOOL)supportsDirectDeletion
{
  return 0;
}

+ (BOOL)supportsSharingScopedIdentifier
{
  return 0;
}

+ (id)newRecord
{
  void *v3;
  void *v4;

  CPLPrimaryScopeIdentifierForCurrentUniverse();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(a1, "newRecordInScopeWithIdentifier:", v3);

  return v4;
}

+ (id)newRecordInScopeWithIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  CPLScopedIdentifier *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:]([CPLScopedIdentifier alloc], "initWithScopeIdentifier:identifier:", v5, v7);
  v9 = (void *)objc_msgSend(a1, "newRecordWithScopedIdentifier:", v8);

  return v9;
}

+ (id)newRecordWithScopedIdentifier:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setScopedIdentifier:", v3);

  return v4;
}

+ (id)newChangeWithScopedIdentifier:(id)a3 changeType:(unint64_t)a4
{
  void *v5;

  v5 = (void *)objc_msgSend(a1, "newRecordWithScopedIdentifier:", a3);
  objc_msgSend(v5, "setChangeType:", a4);
  return v5;
}

+ (id)newDeleteChangeWithScopedIdentifier:(id)a3
{
  void *v3;

  v3 = (void *)objc_msgSend(a1, "newRecordWithScopedIdentifier:", a3);
  objc_msgSend(v3, "setChangeType:", 1024);
  return v3;
}

+ (id)newChangeWithType:(unint64_t)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a1, "newRecord");
  objc_msgSend(v4, "setChangeType:", a3);
  return v4;
}

+ (int64_t)maxInlineDataSize
{
  return 20480;
}

+ (id)descriptionForChangeType:(unint64_t)a3
{
  return (id)objc_msgSend(a1, "_descriptionForChangeType:isSparseFullChange:onlyUploadNewResources:", a3, 0, 0);
}

+ (id)_descriptionForChangeType:(unint64_t)a3 isSparseFullChange:(BOOL)a4 onlyUploadNewResources:(BOOL)a5
{
  _BOOL4 v5;
  __int16 v6;
  __CFString *v7;
  const __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  const __CFString *v12;

  if (a3 == 1024)
  {
    v9 = CFSTR("[D]");
    return v9;
  }
  v5 = a5;
  v6 = a3;
  if (a3)
  {
    v10 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("["));
    v9 = v10;
    if ((v6 & 2) != 0)
    {
      -[__CFString appendString:](v10, "appendString:", CFSTR("U"));
      if ((v6 & 8) == 0)
      {
LABEL_8:
        if ((v6 & 0x10) == 0)
          goto LABEL_9;
        goto LABEL_24;
      }
    }
    else if ((v6 & 8) == 0)
    {
      goto LABEL_8;
    }
    if (v5)
      v12 = CFSTR("r");
    else
      v12 = CFSTR("R");
    -[__CFString appendString:](v9, "appendString:", v12);
    if ((v6 & 0x10) == 0)
    {
LABEL_9:
      if ((v6 & 0x20) == 0)
        goto LABEL_10;
      goto LABEL_25;
    }
LABEL_24:
    -[__CFString appendString:](v9, "appendString:", CFSTR("C"));
    if ((v6 & 0x20) == 0)
    {
LABEL_10:
      if ((v6 & 0x40) == 0)
        goto LABEL_11;
      goto LABEL_26;
    }
LABEL_25:
    -[__CFString appendString:](v9, "appendString:", CFSTR("F"));
    if ((v6 & 0x40) == 0)
    {
LABEL_11:
      if ((v6 & 0x100) == 0)
      {
LABEL_13:
        -[__CFString appendString:](v9, "appendString:", CFSTR("]"));
        return v9;
      }
LABEL_12:
      -[__CFString appendString:](v9, "appendString:", CFSTR("T"));
      goto LABEL_13;
    }
LABEL_26:
    -[__CFString appendString:](v9, "appendString:", CFSTR("S"));
    if ((v6 & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (a5)
  {
    v7 = CFSTR("[Ar]");
    v8 = CFSTR("[ar]");
  }
  else
  {
    v7 = CFSTR("[A]");
    v8 = CFSTR("[a]");
  }
  if (a4)
    v7 = (__CFString *)v8;
  v9 = v7;
  return v9;
}

+ (id)equalityBlockForDirection:(unint64_t)a3
{
  return 0;
}

+ (id)copyPropertyBlockForDirection:(unint64_t)a3
{
  return 0;
}

+ (BOOL)relatedRelationshipIsWeak
{
  return 0;
}

+ (BOOL)secondaryRelationshipIsWeak
{
  return 0;
}

+ (BOOL)shouldReallyQuarantineRecord
{
  return 1;
}

- (id)_unscopedIdentifier
{
  return -[CPLScopedIdentifier identifier](self->_scopedIdentifier, "identifier");
}

- (void)setScopedIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_scopedIdentifier, a3);
}

- (void)setScopeIndex:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CPLScopedIdentifier setScopeIndex:](self->_scopedIdentifier, "setScopeIndex:");
  if (-[CPLRecordChange supportsResources](self, "supportsResources")
    && -[CPLRecordChange hasChangeType:](self, "hasChangeType:", 8))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[CPLRecordChange resources](self, "resources", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "itemScopedIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setScopeIndex:", a3);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (id)realScopedIdentifier
{
  void *v3;
  CPLScopedIdentifier *v4;
  void *v5;
  id v6;

  -[CPLRecordChange realIdentifier](self, "realIdentifier");
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

- (BOOL)isInScopeWithIdentifier:(id)a3
{
  id v5;
  CPLScopedIdentifier *scopedIdentifier;
  void *v7;
  char v8;
  NSObject *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  CPLRecordChange *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  scopedIdentifier = self->_scopedIdentifier;
  if (!scopedIdentifier)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = self;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Missing scope identifier in %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v12, 120, CFSTR("Missing scope identifier in %@"), self);

    abort();
  }
  -[CPLScopedIdentifier scopeIdentifier](scopedIdentifier, "scopeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v5);

  return v8;
}

- (BOOL)hasChangeType:(unint64_t)a3
{
  _BOOL4 v5;
  unint64_t changeType;
  BOOL v8;

  if ((a3 & 8) == 0 || (v5 = -[CPLRecordChange supportsResources](self, "supportsResources")))
  {
    changeType = self->_changeType;
    if (changeType == a3)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v8 = (a3 & ~changeType) == 0 || changeType == 0;
      LOBYTE(v5) = a3 != 1024 && v8;
    }
  }
  return v5;
}

- (BOOL)isFullRecord
{
  return self->_changeType == 0;
}

- (BOOL)isDelete
{
  return self->_changeType == 1024;
}

- (BOOL)supportsResources
{
  return objc_msgSend((id)objc_opt_class(), "supportsResources");
}

- (BOOL)supportsResourceType:(unint64_t)a3
{
  return objc_msgSend((id)objc_opt_class(), "supportsResourceType:", a3);
}

- (BOOL)requiresStableHashForResourceType:(unint64_t)a3
{
  return objc_msgSend((id)objc_opt_class(), "requiresStableHashForResourceType:", a3);
}

- (BOOL)supportsDeletion
{
  return objc_msgSend((id)objc_opt_class(), "supportsDeletion");
}

- (BOOL)supportsDirectDeletion
{
  BOOL v3;
  void *v4;

  if ((objc_msgSend((id)objc_opt_class(), "supportsDirectDeletion") & 1) != 0)
    return 1;
  -[CPLRecordChange realIdentifier](self, "realIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "length") != 0;

  return v3;
}

- (BOOL)supportsSharing
{
  return objc_msgSend((id)objc_opt_class(), "supportsSharing");
}

- (BOOL)supportsSharingScopedIdentifier
{
  return objc_msgSend((id)objc_opt_class(), "supportsSharingScopedIdentifier");
}

- (void)setSharingScopeIdentifier:(id)a3
{
  NSString *v4;
  NSString *sharingScopeIdentifier;
  id v6;

  v6 = a3;
  if (-[CPLRecordChange supportsSharingScopedIdentifier](self, "supportsSharingScopedIdentifier"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    sharingScopeIdentifier = self->_sharingScopeIdentifier;
    self->_sharingScopeIdentifier = v4;

  }
}

- (id)sharingRecordScopedIdentifier
{
  CPLScopedIdentifier *v2;

  if (self->_sharingScopeIdentifier && self->_sharingRecordIdentifier)
    v2 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:]([CPLScopedIdentifier alloc], "initWithScopeIdentifier:identifier:", self->_sharingScopeIdentifier, self->_sharingRecordIdentifier);
  else
    v2 = 0;
  return v2;
}

- (void)setSharingRecordScopedIdentifier:(id)a3
{
  id v4;
  NSString *v5;
  NSString *sharingScopeIdentifier;
  NSString *v7;
  NSString *sharingRecordIdentifier;
  NSString *v9;
  id v10;

  v4 = a3;
  v10 = v4;
  if (v4)
  {
    objc_msgSend(v4, "scopeIdentifier");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    sharingScopeIdentifier = self->_sharingScopeIdentifier;
    self->_sharingScopeIdentifier = v5;

    objc_msgSend(v10, "identifier");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    sharingRecordIdentifier = self->_sharingRecordIdentifier;
    self->_sharingRecordIdentifier = v7;
  }
  else
  {
    v9 = self->_sharingScopeIdentifier;
    self->_sharingScopeIdentifier = 0;

    sharingRecordIdentifier = self->_sharingRecordIdentifier;
    self->_sharingRecordIdentifier = 0;
  }

}

- (BOOL)isSharedInScopeWithIdentifier:(id)a3
{
  id v5;
  NSString *sharingScopeIdentifier;
  BOOL v7;
  NSObject *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  CPLRecordChange *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[CPLRecordChange hasChangeType:](self, "hasChangeType:", 64))
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = self;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Trying to get sharing scope identifier for %@ while it does not contain the info", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v11, 228, CFSTR("Trying to get sharing scope identifier for %@ while it does not contain the info"), self);

    abort();
  }
  sharingScopeIdentifier = self->_sharingScopeIdentifier;
  if (sharingScopeIdentifier)
    v7 = -[NSString isEqualToString:](sharingScopeIdentifier, "isEqualToString:", v5);
  else
    v7 = 0;

  return v7;
}

- (NSArray)sharingContributorUserIdentifiers
{
  NSArray *v3;

  v3 = -[NSArray count](self->_sharingContributorUserIdentifiers, "count");
  if (v3)
    v3 = self->_sharingContributorUserIdentifiers;
  return v3;
}

- (void)setSharingContributorUserIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  NSArray *v6;
  NSArray *sharingContributorUserIdentifiers;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") > 1)
  {
    objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_msgSend(v4, "copy");
  }
  v6 = (NSArray *)v5;

  sharingContributorUserIdentifiers = self->_sharingContributorUserIdentifiers;
  self->_sharingContributorUserIdentifiers = v6;

}

- (NSArray)updateSharingContributorUserIdentifiers
{
  NSArray *v3;

  v3 = -[NSArray count](self->_updateSharingContributorUserIdentifiers, "count");
  if (v3)
    v3 = self->_updateSharingContributorUserIdentifiers;
  return v3;
}

- (void)setUpdateSharingContributorUserIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  NSArray *v6;
  NSArray *updateSharingContributorUserIdentifiers;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") > 1)
  {
    objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_msgSend(v4, "copy");
  }
  v6 = (NSArray *)v5;

  updateSharingContributorUserIdentifiers = self->_updateSharingContributorUserIdentifiers;
  self->_updateSharingContributorUserIdentifiers = v6;

}

- (void)_noteRelatedRecordShouldBeShared
{
  self->_relatedRecordShouldBeShared = 1;
}

- (BOOL)_relatedRecordShouldBeShared
{
  return self->_relatedRecordShouldBeShared;
}

- (id)_ignoredRecord
{
  return self->_ignoredRecord;
}

- (void)_setIgnoredRecord:(id)a3
{
  objc_storeStrong((id *)&self->_ignoredRecord, a3);
}

- (void)updateScopeIdentifier:(id)a3
{
  void *v4;
  CPLScopedIdentifier *v5;
  void *v6;
  CPLScopedIdentifier *v7;
  id v8;

  v8 = a3;
  -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = [CPLScopedIdentifier alloc];
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CPLScopedIdentifier initWithScopeIdentifier:identifier:](v5, "initWithScopeIdentifier:identifier:", v8, v6);
    -[CPLRecordChange setScopedIdentifier:](self, "setScopedIdentifier:", v7);

    -[CPLRecordChange awakeFromStorage](self, "awakeFromStorage");
  }

}

- (id)resources
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v5, 292, CFSTR("%@ does not supports resources"), objc_opt_class());

  abort();
}

- (void)setResources:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 297, CFSTR("%@ does not supports resources"), objc_opt_class());

  abort();
}

- (id)resourceForType:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CPLRecordChange resources](self, "resources", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "resourceType") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (unint64_t)totalResourceSize
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CPLRecordChange resources](self, "resources", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "identity");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "fileSize");

        v5 += v9;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)effectiveResourceSizeToUploadUsingStorage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  unint64_t cachedRealResourceSizeInStorage;

  v4 = a3;
  if (!self->_didCacheRealResourceSizeInStorage)
  {
    -[CPLRecordPushContext uploadIdentifier](self->_pushContext, "uploadIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5
      && (v6 = (void *)v5, v7 = -[CPLRecordChange hasChangeType:](self, "hasChangeType:", 8), v6, v7))
    {
      -[CPLRecordPushContext uploadIdentifier](self->_pushContext, "uploadIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      self->_cachedRealResourceSizeInStorage = objc_msgSend(v4, "effectiveResourceSizeToUploadForUploadIdentifier:", v8);

    }
    else
    {
      self->_cachedRealResourceSizeInStorage = 0;
    }
    self->_didCacheRealResourceSizeInStorage = 1;
  }
  cachedRealResourceSizeInStorage = self->_cachedRealResourceSizeInStorage;

  return cachedRealResourceSizeInStorage;
}

- (unint64_t)realResourceSize
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CPLRecordChange resources](self, "resources", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "identity");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "fileURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          v5 += objc_msgSend(v8, "fileSize");

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)realUploadResourceSize
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CPLRecordChange resources](self, "resources", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v8, "resourceType") <= 0x1D)
        {
          objc_msgSend(v8, "identity");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "fileURL");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
            v5 += objc_msgSend(v9, "fileSize");

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)originalResourceSize
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CPLRecordChange resources](self, "resources", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v7, "resourceType") == 1
          || objc_msgSend(v7, "resourceType") == 17
          || objc_msgSend(v7, "resourceType") == 18
          || objc_msgSend(v7, "resourceType") == 23
          || objc_msgSend(v7, "resourceType") == 24)
        {
          objc_msgSend(v7, "identity");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "fileURL");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          if (v8)
            v8 = (void *)objc_msgSend(v9, "fileSize");

          goto LABEL_18;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v8 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_18:

  return (unint64_t)v8;
}

- (id)propertiesDescription
{
  return &stru_1E60DF6B8;
}

- (id)description
{
  void *v3;
  void *v4;
  NSData *sharingRecordChangeData;
  const __CFString *v6;
  unint64_t changeType;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL4 v11;
  const char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v18;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@ %@"), objc_opt_class(), self->_scopedIdentifier);
  v4 = v3;
  if (self->_realIdentifier)
    objc_msgSend(v3, "appendFormat:", CFSTR(" real: %@"), self->_realIdentifier);
  sharingRecordChangeData = self->_sharingRecordChangeData;
  if (self->_recordChangeData)
  {
    if (sharingRecordChangeData)
      v6 = CFSTR(" [tag/shared tag]");
    else
      v6 = CFSTR(" [tag]");
  }
  else
  {
    if (!sharingRecordChangeData)
      goto LABEL_10;
    v6 = CFSTR(" [shared tag]");
  }
  objc_msgSend(v4, "appendString:", v6);
LABEL_10:
  changeType = self->_changeType;
  if ((changeType & 0x400) == 0)
  {
    objc_msgSend((id)objc_opt_class(), "_descriptionForChangeType:isSparseFullChange:onlyUploadNewResources:", changeType, self->_isSparseFullChange, -[CPLRecordChange shouldOnlyUploadNewResources](self, "shouldOnlyUploadNewResources"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" %@"), v8);

    -[CPLRecordChange propertiesDescription](self, "propertiesDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");
    v11 = -[CPLRecordChange inTrash](self, "inTrash");
    if (v10)
    {
      v12 = "";
      if (v11)
        v12 = "[trash] ";
      objc_msgSend(v4, "appendFormat:", CFSTR(" %s%@"), v12, v9);
    }
    else if (v11)
    {
      objc_msgSend(v4, "appendString:", CFSTR(" [trash]"));
    }
    if (!-[CPLRecordChange supportsSharingScopedIdentifier](self, "supportsSharingScopedIdentifier"))
      goto LABEL_27;
    -[CPLRecordChange sharingScopeIdentifier](self, "sharingScopeIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLRecordChange sharingContributorUserIdentifiers](self, "sharingContributorUserIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    if (v15)
    {
      if (v13)
      {
        objc_msgSend(v4, "appendFormat:", CFSTR(" [shared %tu cont.]"), v15);
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
      v18 = v15;
      v16 = CFSTR(" [%tu cont.]");
    }
    else
    {
      if (!v13)
        goto LABEL_26;
      v16 = CFSTR(" [shared]");
    }
    objc_msgSend(v4, "appendFormat:", v16, v18);
    goto LABEL_26;
  }
  objc_msgSend(v4, "appendString:", CFSTR(" [D]"));
LABEL_28:
  objc_msgSend(v4, "appendString:", CFSTR(">"));
  return v4;
}

- (id)redactedDescription
{
  void *v3;
  unint64_t changeType;
  void *v5;
  const __CFString *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@ %@"), objc_opt_class(), self->_scopedIdentifier);
  changeType = self->_changeType;
  if ((changeType & 0x400) != 0)
  {
    v6 = CFSTR(" [D]");
    goto LABEL_5;
  }
  objc_msgSend((id)objc_opt_class(), "_descriptionForChangeType:isSparseFullChange:onlyUploadNewResources:", changeType, self->_isSparseFullChange, -[CPLRecordChange shouldOnlyUploadNewResources](self, "shouldOnlyUploadNewResources"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@"), v5);

  if (-[CPLRecordChange inTrash](self, "inTrash"))
  {
    v6 = CFSTR(" [trash]");
LABEL_5:
    objc_msgSend(v3, "appendString:", v6);
  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3;
  if (self->_changeType == 1024)
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "scopedIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v6 = v7 && v8 && (objc_msgSend((id)v7, "isEqual:", v8) & 1) != 0 || (v7 | v9) == 0;

    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = -[NSObject cplIsEqual:](self, "cplIsEqual:", v4);
  }

  return v6;
}

- (BOOL)applyChange:(id)a3 copyPropertiesToFinalChange:(id)a4 forChangeType:(unint64_t)a5 direction:(unint64_t)a6 diffTracker:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  char v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  unint64_t v39;
  _QWORD v40[4];
  id v41;
  id v42;
  CPLRecordChange *v43;
  id v44;
  unint64_t v45;
  _QWORD v46[4];
  id v47;
  unint64_t v48;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  if (a5 == 256)
  {
    -[CPLRecordChange recordModificationDate](self, "recordModificationDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recordModificationDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (!v16)
      goto LABEL_7;
    if (!v15)
      goto LABEL_11;
    objc_msgSend(v16, "timeIntervalSinceDate:", v15);
    if (v18 < 0.0)
      v18 = -v18;
    if (v18 >= 0.00100000005)
    {
LABEL_11:
      objc_msgSend(v13, "setRecordModificationDate:", v17);
      -[CPLRecordChange setRecordModificationDate:](self, "setRecordModificationDate:", v17);
      objc_msgSend(v14, "noteObjectsDifferOnProperty:", CFSTR("recordModificationDate"));
      v19 = 1;
    }
    else
    {
LABEL_7:
      v19 = 0;
    }
LABEL_20:

    goto LABEL_21;
  }
  -[CPLRecordChange propertiesForChangeType:](self, "propertiesForChangeType:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend((id)objc_opt_class(), "equalityBlockForDirection:", a6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v20;
    if (v20)
    {
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __95__CPLRecordChange_applyChange_copyPropertiesToFinalChange_forChangeType_direction_diffTracker___block_invoke;
      v46[3] = &unk_1E60DABB8;
      v47 = v20;
      v48 = a6;
      v21 = (void *)MEMORY[0x1B5E08DC4](v46);

    }
    else
    {
      v21 = 0;
    }
    v22 = -[NSObject cplProperties:areEqualToPropertiesOf:diffTracker:withEqualityBlock:](self, "cplProperties:areEqualToPropertiesOf:diffTracker:withEqualityBlock:", v15, v12, v14, v21);
    if (!v22)
    {
      objc_msgSend((id)objc_opt_class(), "copyPropertyBlockForDirection:", a6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      v35 = v17;
      if (v23)
      {
        v25 = MEMORY[0x1E0C809B0];
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __95__CPLRecordChange_applyChange_copyPropertiesToFinalChange_forChangeType_direction_diffTracker___block_invoke_2;
        v40[3] = &unk_1E60DABE0;
        v32 = v23;
        v26 = v23;
        v44 = v26;
        v41 = v13;
        v33 = v21;
        v27 = v12;
        v42 = v27;
        v43 = self;
        v45 = a6;
        v34 = (void *)MEMORY[0x1B5E08DC4](v40);
        v36[0] = v25;
        v36[1] = 3221225472;
        v36[2] = __95__CPLRecordChange_applyChange_copyPropertiesToFinalChange_forChangeType_direction_diffTracker___block_invoke_3;
        v36[3] = &unk_1E60DAC08;
        v28 = v26;
        v24 = v32;
        v38 = v28;
        v36[4] = self;
        v29 = v27;
        v21 = v33;
        v37 = v29;
        v39 = a6;
        v30 = (void *)MEMORY[0x1B5E08DC4](v36);

      }
      else
      {
        v34 = 0;
        v30 = 0;
      }
      objc_msgSend(v13, "cplCopyProperties:fromObject:withCopyBlock:", v15, v12, v34, v32);
      -[NSObject cplCopyProperties:fromObject:withCopyBlock:](self, "cplCopyProperties:fromObject:withCopyBlock:", v15, v12, v30);

      v17 = v35;
    }
    v19 = !v22;

    goto LABEL_20;
  }
  v19 = 0;
LABEL_21:

  return v19;
}

- (id)realRecordChangeFromRecordChange:(id)a3 direction:(unint64_t)a4 newRecord:(id *)a5 changeType:(unint64_t)a6 diffTracker:(id)a7
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void (**v26)(_QWORD, _QWORD);
  id v27;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  _BYTE *v45;
  uint64_t *v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  _BYTE buf[24];
  char v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a7;
  if ((a6 & 0x400) != 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v13;
        _os_log_impl(&dword_1B03C2000, v29, OS_LOG_TYPE_ERROR, "Trying to compute changes for a delete change: %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v31, 609, CFSTR("Trying to compute changes for a delete change: %@"), v13);

    abort();
  }
  v15 = v14;
  objc_msgSend(v13, "scopedIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqual:", v17);

  if ((v18 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "scopedIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v33;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v34;
        _os_log_impl(&dword_1B03C2000, v32, OS_LOG_TYPE_ERROR, "Mismatched identifier between change (%@) and record (%@)", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scopedIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v36, 610, CFSTR("Mismatched identifier between change (%@) and record (%@)"), v37, v38);

    abort();
  }
  *a5 = 0;
  v19 = (void *)-[CPLRecordChange copy](self, "copy");
  v20 = (void *)objc_opt_class();
  -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "newRecordWithScopedIdentifier:", v21);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v54 = 0;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __95__CPLRecordChange_realRecordChangeFromRecordChange_direction_newRecord_changeType_diffTracker___block_invoke;
  v40[3] = &unk_1E60DAC58;
  v47 = a6;
  v39 = v15;
  v41 = v39;
  v23 = v19;
  v42 = v23;
  v24 = v13;
  v43 = v24;
  v25 = v22;
  v44 = v25;
  v45 = buf;
  v48 = a4;
  v46 = &v49;
  v26 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E08DC4](v40);
  -[CPLRecordChange enumerateChangeTypesForChangeType:block:](self, "enumerateChangeTypesForChangeType:block:", 0, v26);
  v26[2](v26, 256);
  if (v50[3] == 256)
  {
    *(_BYTE *)(*(_QWORD *)&buf[8] + 24) = 0;
LABEL_7:

    v25 = 0;
    goto LABEL_8;
  }
  if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
    goto LABEL_7;
  objc_msgSend(v23, "setChangeType:", 0);
  *a5 = objc_retainAutorelease(v23);
  v50[3] &= ~0x100uLL;
  objc_msgSend(v25, "setChangeType:");
LABEL_8:
  v27 = v25;

  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(buf, 8);

  return v27;
}

- (id)realRecordChangeFromRecordChange:(id)a3 direction:(unint64_t)a4 newRecord:(id *)a5 diffTracker:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v10 = a6;
  v11 = a3;
  v12 = objc_msgSend(v11, "changeType");
  if (v12)
    v13 = v12 | 0x100;
  else
    v13 = 378;
  -[CPLRecordChange realRecordChangeFromRecordChange:direction:newRecord:changeType:diffTracker:](self, "realRecordChangeFromRecordChange:direction:newRecord:changeType:diffTracker:", v11, a4, a5, v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)realRecordChangeFromRecordChange:(id)a3 direction:(unint64_t)a4 newRecord:(id *)a5
{
  return -[CPLRecordChange realRecordChangeFromRecordChange:direction:newRecord:diffTracker:](self, "realRecordChangeFromRecordChange:direction:newRecord:diffTracker:", a3, a4, a5, 0);
}

- (void)attachDiffTracker:(id)a3
{
  objc_storeStrong((id *)&self->_attachedDiffTracker, a3);
}

- (id)attachedDiffTracker
{
  return self->_attachedDiffTracker;
}

- (BOOL)resourceChangeWillOnlyChangeDerivatives:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  char v25;
  BOOL v26;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t v39[128];
  uint8_t buf[4];
  id v41;
  __int16 v42;
  CPLRecordChange *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[CPLRecordChange supportsResources](self, "supportsResources")
    || !-[CPLRecordChange isFullRecord](self, "isFullRecord")
    || (objc_msgSend(v5, "hasChangeType:", 8) & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v41 = v5;
        v42 = 2112;
        v43 = self;
        _os_log_impl(&dword_1B03C2000, v28, OS_LOG_TYPE_ERROR, "Incorrectly trying to filter out derivatives change %@ from %@", buf, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v30, 688, CFSTR("Incorrectly trying to filter out derivatives change %@ from %@"), v5, self);

    abort();
  }
  -[CPLRecordChange propertiesForChangeType:](self, "propertiesForChangeType:", 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "removeObject:", CFSTR("resources"));
  if (-[NSObject cplProperties:areEqualToPropertiesOf:withEqualityBlock:](self, "cplProperties:areEqualToPropertiesOf:withEqualityBlock:", v7, v5, 0))
  {
    -[CPLRecordChange resources](self, "resources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resources");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "count");
    if (v10 == objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "objectEnumerator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v12 = v8;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      if (v13)
      {
        v14 = v13;
        v31 = v9;
        v32 = v8;
        v33 = v7;
        v34 = v5;
        v15 = *(_QWORD *)v36;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v36 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_msgSend(v11, "nextObject");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (!-[CPLRecordChange isResourceTypeAGeneratedDerivative:](self, "isResourceTypeAGeneratedDerivative:", objc_msgSend(v17, "resourceType")))
            {
              objc_msgSend(v17, "identity");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v19, "isAvailable");

              if (!v20)
                goto LABEL_22;
              objc_msgSend(v18, "identity");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "fileURL");
              v22 = objc_claimAutoreleasedReturnValue();
              if (v22)
              {
                v23 = (void *)v22;
                objc_msgSend(v21, "setFileURL:", 0);
                v24 = objc_msgSend(v17, "isEqual:", v18);
                objc_msgSend(v21, "setFileURL:", v23);

                if ((v24 & 1) == 0)
                  goto LABEL_22;
              }
              else
              {
                v25 = objc_msgSend(v17, "isEqual:", v18);

                if ((v25 & 1) == 0)
                {
LABEL_22:

                  v26 = 0;
                  goto LABEL_23;
                }
              }
            }

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          if (v14)
            continue;
          break;
        }
        v26 = 1;
LABEL_23:
        v7 = v33;
        v5 = v34;
        v9 = v31;
        v8 = v32;
      }
      else
      {
        v26 = 1;
      }

    }
    else
    {
      v26 = 0;
    }

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)mergeRecordChangeWithNewRecordChange:(id)a3 direction:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  CPLRecordChange *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  CPLRecordChange *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void *v33;
  CPLRecordChange *v34;
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t v39;
  BOOL v40;
  _QWORD v41[4];
  id v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  unint64_t v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  unint64_t v52;

  v6 = a3;
  v7 = objc_msgSend(v6, "changeType");
  if (v7)
  {
    v8 = v7;
    if (v7 == 1024)
    {
      if (-[CPLRecordChange changeType](self, "changeType") == 1024)
        v9 = self;
      else
        v9 = (CPLRecordChange *)v6;
      v17 = v9;
    }
    else
    {
      v44 = 0;
      v45 = &v44;
      v46 = 0x2020000000;
      v47 = 0;
      v47 = -[CPLRecordChange changeType](self, "changeType");
      v18 = v45[3];
      if (v18 == 1024)
      {
        v17 = (CPLRecordChange *)v6;
      }
      else
      {
        v19 = (void *)-[CPLRecordChange copy](self, "copy");
        objc_msgSend((id)objc_opt_class(), "copyPropertyBlockForDirection:", a4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        v22 = MEMORY[0x1E0C809B0];
        if (v20)
        {
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __66__CPLRecordChange_mergeRecordChangeWithNewRecordChange_direction___block_invoke_2;
          v41[3] = &unk_1E60DAC80;
          v42 = v20;
          v43 = a4;
          v23 = (void *)MEMORY[0x1B5E08DC4](v41);

        }
        else
        {
          v23 = 0;
        }
        v30 = v22;
        v31 = 3221225472;
        v32 = __66__CPLRecordChange_mergeRecordChangeWithNewRecordChange_direction___block_invoke_3;
        v33 = &unk_1E60DACA8;
        v39 = v8;
        v34 = self;
        v24 = v19;
        v35 = v24;
        v36 = v6;
        v25 = v23;
        v40 = v18 != 0;
        v37 = v25;
        v38 = &v44;
        -[CPLRecordChange enumerateChangeTypesForChangeType:block:](self, "enumerateChangeTypesForChangeType:block:", 0, &v30);
        if (v18)
          objc_msgSend(v24, "setChangeType:", v45[3], v30, v31, v32, v33, v34, v35, v36);
        -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier", v30, v31, v32, v33, v34);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "scopeIndex");

        if (v27 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v24, "setScopeIndex:", v27);
        v28 = v37;
        v17 = (CPLRecordChange *)v24;

      }
      _Block_object_dispose(&v44, 8);
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "copyPropertyBlockForDirection:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)-[CPLRecordChange copy](self, "copy");
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __66__CPLRecordChange_mergeRecordChangeWithNewRecordChange_direction___block_invoke;
      v48[3] = &unk_1E60DAC08;
      v51 = v10;
      v12 = v11;
      v49 = v12;
      v13 = v6;
      v50 = v13;
      v52 = a4;
      objc_msgSend(v12, "cplCopyPropertiesFromObject:withCopyBlock:", v13, v48);
      objc_msgSend(v12, "setChangeType:", 0);
      objc_msgSend(v13, "scopedIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "scopeIndex");

      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v12, "setScopeIndex:", v15);
      v16 = v50;
      v17 = (CPLRecordChange *)v12;

    }
    else
    {
      v17 = (CPLRecordChange *)v6;
    }

  }
  return v17;
}

- (id)propertiesForChangeType:(unint64_t)a3
{
  id v3;
  void *v4;
  id v5;
  CPLRecordChange *v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  if (a3 == 256)
  {
    if (propertiesForChangeType__onceToken_118 != -1)
      dispatch_once(&propertiesForChangeType__onceToken_118, &__block_literal_global_119);
    v4 = (void *)propertiesForChangeType__modificationDateProperty;
    goto LABEL_13;
  }
  if (a3 == 64)
  {
    if (propertiesForChangeType__onceToken_121 != -1)
      dispatch_once(&propertiesForChangeType__onceToken_121, &__block_literal_global_122);
    v4 = (void *)propertiesForChangeType__sharingProperties;
LABEL_13:
    v5 = v4;
LABEL_15:
    v3 = v5;
    return v3;
  }
  if (a3 != 2)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    goto LABEL_15;
  }
  if (propertiesForChangeType__onceToken_13136 != -1)
  {
    v7 = self;
    dispatch_once(&propertiesForChangeType__onceToken_13136, &__block_literal_global_94);
    self = v7;
  }
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__13081;
  v13 = __Block_byref_object_dispose__13082;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__CPLRecordChange_propertiesForChangeType___block_invoke_97;
  v8[3] = &unk_1E60DC8A0;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync((dispatch_queue_t)propertiesForChangeType__lock, v8);
  v3 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v3;
}

- (BOOL)relatedRelationshipIsWeak
{
  return objc_msgSend((id)objc_opt_class(), "relatedRelationshipIsWeak");
}

- (id)relatedIdentifier
{
  return 0;
}

- (id)relatedScopedIdentifier
{
  void *v3;
  CPLScopedIdentifier *v4;
  void *v5;
  id v6;

  -[CPLRecordChange relatedIdentifier](self, "relatedIdentifier");
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

- (BOOL)secondaryRelationshipIsWeak
{
  return objc_msgSend((id)objc_opt_class(), "secondaryRelationshipIsWeak");
}

- (id)secondaryIdentifier
{
  return 0;
}

- (id)secondaryScopedIdentifier
{
  void *v3;
  CPLScopedIdentifier *v4;
  void *v5;
  id v6;

  -[CPLRecordChange secondaryIdentifier](self, "secondaryIdentifier");
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

- (id)proposedLocalScopedIdentifier
{
  void *v2;
  void *v3;

  -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)allRelatedScopedIdentifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;

  -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLRecordChange relatedScopedIdentifier](self, "relatedScopedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLRecordChange secondaryScopedIdentifier](self, "secondaryScopedIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3 || v4 || v5)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 3);
    v7 = v8;
    if (v3)
      objc_msgSend(v8, "addObject:", v3);
    if (v4)
      objc_msgSend(v7, "addObject:", v4);
    if (v6)
      objc_msgSend(v7, "addObject:", v6);
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  }

  return v7;
}

- (void)clearIdentifiers
{
  CPLScopedIdentifier *scopedIdentifier;

  scopedIdentifier = self->_scopedIdentifier;
  self->_scopedIdentifier = 0;

  -[CPLRecordChange setRelatedIdentifier:](self, "setRelatedIdentifier:", 0);
  -[CPLRecordChange setSecondaryIdentifier:](self, "setSecondaryIdentifier:", 0);
}

- (void)prepareForStorage
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[CPLRecordChange supportsResources](self, "supportsResources"))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    -[CPLRecordChange resources](self, "resources", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "setItemScopedIdentifier:", 0);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void)awakeFromStorage
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (-[CPLRecordChange supportsResources](self, "supportsResources"))
  {
    -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[CPLRecordChange resources](self, "resources", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setItemScopedIdentifier:", v3);
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)restoreRelationshipsFromFullRecord:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!-[CPLRecordChange hasChangeType:](self, "hasChangeType:", 2))
  {
    objc_msgSend(v6, "relatedIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLRecordChange setRelatedIdentifier:](self, "setRelatedIdentifier:", v4);

    objc_msgSend(v6, "secondaryIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLRecordChange setSecondaryIdentifier:](self, "setSecondaryIdentifier:", v5);

  }
}

- (int64_t)dequeueOrder
{
  void *v2;
  void *v3;
  double v4;
  int64_t v5;

  -[CPLRecordChange recordModificationDate](self, "recordModificationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "timeIntervalSinceReferenceDate");
    v5 = (uint64_t)v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)cplFullDescription
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void (**v13)(_QWORD, _QWORD);
  id v14;
  _QWORD v16[4];
  id v17;
  CPLRecordChange *v18;
  unint64_t v19;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("======\n%@: {\n"), objc_opt_class());
  v4 = -[CPLRecordChange changeType](self, "changeType");
  objc_msgSend((id)objc_opt_class(), "_descriptionForChangeType:isSparseFullChange:onlyUploadNewResources:", v4, self->_isSparseFullChange, -[CPLRecordChange shouldOnlyUploadNewResources](self, "shouldOnlyUploadNewResources"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  changeType: %@\n"), v5);

  -[CPLRecordChange recordModificationDate](self, "recordModificationDate");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    objc_msgSend(v3, "appendFormat:", CFSTR("  recordModificationDate: %@\n"), v6);
  -[CPLRecordChange recordChangeData](self, "recordChangeData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v3, "appendFormat:", CFSTR("  recordChangeDataSize: %lu\n"), objc_msgSend(v8, "length"));
  -[CPLRecordChange sharingRecordChangeData](self, "sharingRecordChangeData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v3, "appendFormat:", CFSTR("  sharingRecordChangeDataSize: %lu\n"), objc_msgSend(v10, "length"));
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __37__CPLRecordChange_cplFullDescription__block_invoke;
  v16[3] = &unk_1E60DACF0;
  v19 = v4;
  v12 = v3;
  v17 = v12;
  v18 = self;
  v13 = (void (**)(_QWORD, _QWORD))MEMORY[0x1B5E08DC4](v16);
  v13[2](v13, 256);
  -[CPLRecordChange enumerateChangeTypesForChangeType:block:](self, "enumerateChangeTypesForChangeType:block:", -[CPLRecordChange changeType](self, "changeType"), v13);
  objc_msgSend(v12, "appendString:", CFSTR("}"));
  v14 = v12;

  return v14;
}

- (id)resourcesDescription
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  __CFString *v18;
  _BOOL4 v19;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = -[CPLRecordChange changeType](self, "changeType");
  -[CPLRecordChange resources](self, "resources");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLRecordChange resourceCopyFromScopedIdentifier](self, "resourceCopyFromScopedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
LABEL_2:
    v6 = objc_msgSend(v4, "count");
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu resources (from %@)"), v6, v5, v21);
LABEL_32:
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v22 = v6;
      v10 = 0;
      v11 = 0;
      v12 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "identity");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "fileURL");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
          {
            ++v11;
            v10 += objc_msgSend(v14, "isAvailable") ^ 1;
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);

      v16 = &stru_1E60DF6B8;
      v6 = v22;
      if (v22)
      {
        v5 = 0;
        if (v11)
        {
          if (v11 == v22)
          {
            v16 = CFSTR("sparse ");
            if (!v10)
              goto LABEL_31;
          }
          else
          {
            v19 = -[CPLRecordChange allowsToOnlyUploadNewResources](self, "allowsToOnlyUploadNewResources");
            v16 = CFSTR("MIXED! ");
            if (v19)
              v16 = CFSTR("mixed ");
            if (!v10)
              goto LABEL_31;
          }
LABEL_27:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu %@resources (%lu unav.)"), v22, v16, v10);
          goto LABEL_32;
        }
      }
      else
      {
        v5 = 0;
      }
      if (v10)
        goto LABEL_27;
    }
    else
    {

      v16 = &stru_1E60DF6B8;
    }
LABEL_31:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu %@resources"), v6, v16, v21);
    goto LABEL_32;
  }
  if (v3)
  {
    if ((v3 & 8) != 0)
      goto LABEL_2;
  }
  else if (v5)
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("(from %@)"), v5);
LABEL_33:
    v18 = (__CFString *)v17;
    goto LABEL_34;
  }
  v18 = &stru_1E60DF6B8;
LABEL_34:

  return v18;
}

- (unint64_t)largestResourceSize
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[CPLRecordChange supportsResources](self, "supportsResources")
    || !-[CPLRecordChange hasChangeType:](self, "hasChangeType:", 8))
  {
    return 0;
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[CPLRecordChange resources](self, "resources", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "identity");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "fileSize");

        if (v6 <= v10)
          v6 = v10;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)fingerprintScheme
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v5, 1108, CFSTR("%@ should be implemented by subclasses"), v6);

  abort();
}

- (BOOL)shouldApplyPropertiesWithSelector:(SEL)a3
{
  uint64_t v5;
  void *v6;
  int v7;

  if (self->_shouldFilterDefaultValuesForNewProperties)
  {
    -[CPLRecordChange checkDefaultValueBlockForPropertyWithSelector:](self, "checkDefaultValueBlockForPropertyWithSelector:");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = (*(uint64_t (**)(uint64_t, CPLRecordChange *, SEL))(v5 + 16))(v5, self, a3) ^ 1;
    else
      LOBYTE(v7) = 1;

  }
  else
  {
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (void)setShouldFilterDefaultValuesForNewProperties:(BOOL)a3
{
  if (self->_shouldFilterDefaultValuesForNewProperties != a3)
    self->_shouldFilterDefaultValuesForNewProperties = a3;
}

- (BOOL)shouldFilterDefaultValuesForNewProperties
{
  return self->_shouldFilterDefaultValuesForNewProperties;
}

- (id)checkDefaultValueBlockForPropertyWithSelector:(SEL)a3
{
  if (sel_dateDeleted == a3)
    return &__block_literal_global_169_13094;
  if (sel_sharingScopeIdentifier == a3)
    return (id)MEMORY[0x1B5E08DC4](_CPLDefaultValueObjectNil, a2);
  return 0;
}

- (BOOL)isSparseFullChange
{
  return self->_isSparseFullChange;
}

- (void)markAsSparseFullChange
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t buf[4];
  CPLRecordChange *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!self->_isSparseFullChange)
  {
    if (!-[CPLRecordChange isFullRecord](self, "isFullRecord"))
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v8 = self;
          _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "Trying to mark a non full record as sparse: %@", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v6, 1152, CFSTR("Trying to mark a non full record as sparse: %@"), self);

      abort();
    }
    self->_isSparseFullChange = 1;
  }
}

- (void)markToOnlyUploadNewResources
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t buf[4];
  CPLRecordChange *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!-[CPLRecordChange allowsToOnlyUploadNewResources](self, "allowsToOnlyUploadNewResources"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v8 = self;
        _os_log_impl(&dword_1B03C2000, v4, OS_LOG_TYPE_ERROR, "Trying to mark as uploading only new resources for %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v6, 1158, CFSTR("Trying to mark as uploading only new resources for %@"), self);

    abort();
  }
  if (!self->_shouldOnlyUploadNewResources)
    self->_shouldOnlyUploadNewResources = 1;
}

- (BOOL)shouldOnlyUploadNewResources
{
  return self->_shouldOnlyUploadNewResources;
}

- (BOOL)allowsToOnlyUploadNewResources
{
  return 0;
}

- (BOOL)changeIsOnlyAddingResourcesToRecord:(id)a3 addedResources:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _BOOL4 v13;
  BOOL v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  BOOL v25;
  void *v26;
  char v27;
  void *v28;
  void *v30;
  void *v31;
  uint64_t (**v32)(_QWORD, _QWORD);
  unint64_t v33;
  _QWORD v34[5];
  BOOL v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v6 = a3;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__13081;
  v40 = __Block_byref_object_dispose__13082;
  v41 = 0;
  -[CPLRecordChange resourceCopyFromScopedIdentifier](self, "resourceCopyFromScopedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __70__CPLRecordChange_changeIsOnlyAddingResourcesToRecord_addedResources___block_invoke;
  v34[3] = &unk_1E60DAD38;
  v35 = v8;
  v34[4] = &v36;
  v32 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1B5E08DC4](v34);
  *a4 = 0;
  v30 = v6;
  objc_msgSend(v6, "resources");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLRecordChange resources](self, "resources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v9, "count");
  v10 = objc_msgSend(v31, "count");
  v11 = v10;
  v12 = 0;
  v13 = v33 != 0;
  v14 = v10 != 0;
  if (v33 && v10)
  {
    v15 = 0;
    v12 = 0;
    while (1)
    {
      v16 = v9;
      objc_msgSend(v9, "objectAtIndexedSubscript:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectAtIndexedSubscript:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "resourceType");
      v20 = objc_msgSend(v18, "resourceType");
      if (v19 == v20)
      {
        if ((((uint64_t (**)(_QWORD, void *))v32)[2](v32, v17) & 1) == 0)
        {
          objc_msgSend(v17, "identity");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "identity");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (!v21 || !v22)
          {

LABEL_27:
            v25 = 0;
            v9 = v16;
            goto LABEL_28;
          }
          v24 = objc_msgSend(v21, "cplIsEqual:withEqualityBlock:", v22, &__block_literal_global_178);

          if (!v24)
            goto LABEL_27;
        }
        ++v15;
      }
      else if (v19 >= v20 || (((uint64_t (**)(_QWORD, void *))v32)[2](v32, v17) & 1) == 0)
      {
        goto LABEL_27;
      }
      ++v12;

      v14 = v15 < v11;
      v13 = v12 < v33;
      if (v12 >= v33)
        break;
      v9 = v16;
      if (v15 >= v11)
        goto LABEL_14;
    }
    v9 = v16;
    if (v15 < v11)
      goto LABEL_15;
  }
  else
  {
LABEL_14:
    if (v14)
    {
LABEL_15:
      v25 = 0;
      goto LABEL_28;
    }
  }
  if (v12 >= v33)
    v13 = 0;
  if (v13)
  {
    do
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v12);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = ((uint64_t (**)(_QWORD, void *))v32)[2](v32, v26);

      if ((v27 & 1) == 0)
        goto LABEL_15;
    }
    while (v33 != ++v12);
  }
  if (v37[5])
    v28 = (void *)v37[5];
  else
    v28 = (void *)MEMORY[0x1E0C9AA60];
  *a4 = objc_retainAutorelease(v28);
  v25 = 1;
LABEL_28:

  _Block_object_dispose(&v36, 8);
  return v25;
}

- (id)onlyAddedResources
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[CPLRecordChange resources](self, "resources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  -[CPLRecordChange resourceCopyFromScopedIdentifier](self, "resourceCopyFromScopedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        objc_msgSend(v11, "identity", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "fileURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {

LABEL_8:
          objc_msgSend(v4, "addObject:", v11);
          goto LABEL_9;
        }
        if (v5)
        {
          v14 = objc_msgSend(v11, "sourceResourceType");

          if (v14)
            goto LABEL_8;
        }
        else
        {

        }
LABEL_9:
        ++v10;
      }
      while (v8 != v10);
      v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v8 = v15;
    }
    while (v15);
  }

  return v4;
}

- (BOOL)validateFullRecord
{
  return 1;
}

- (BOOL)validateChangeWithError:(id *)a3
{
  CPLScopedIdentifier *scopedIdentifier;

  scopedIdentifier = self->_scopedIdentifier;
  if (a3 && !scopedIdentifier)
  {
    +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 18, CFSTR("%@ has no identifier"), self);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return scopedIdentifier != 0;
}

- (unint64_t)estimatedRecordSize
{
  void *v3;
  void *v4;
  unint64_t v5;

  v3 = (void *)MEMORY[0x1B5E08BF0](self, a2);
  objc_msgSend(MEMORY[0x1E0CB36F8], "cpl_archivedDataWithRootObject:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  objc_autoreleasePoolPop(v3);
  return v5;
}

- (id)_pushContext
{
  return self->_pushContext;
}

- (void)_setPushContext:(id)a3
{
  objc_storeStrong((id *)&self->_pushContext, a3);
}

- (BOOL)_shouldNotTrustCloudCache
{
  return self->_shouldNotTrustCloudCache;
}

- (void)_setShouldNotTrustCloudCache:(BOOL)a3
{
  self->_shouldNotTrustCloudCache = a3;
}

- (BOOL)canLowerQuota
{
  return 0;
}

- (unint64_t)fullChangeTypeForFullRecord
{
  unint64_t v3;

  if (-[CPLRecordChange supportsResources](self, "supportsResources"))
    v3 = 10;
  else
    v3 = 2;
  if (-[CPLRecordChange supportsSharingScopedIdentifier](self, "supportsSharingScopedIdentifier"))
    return v3 | 0x40;
  else
    return v3;
}

- (BOOL)isResourceTypeAGeneratedDerivative:(unint64_t)a3
{
  return +[CPLResource isDerivativeResourceType:](CPLResource, "isDerivativeResourceType:", a3);
}

- (BOOL)allResourcesAreAvailable
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[CPLRecordChange supportsSharingScopedIdentifier](self, "supportsSharingScopedIdentifier"))
  {
    -[CPLRecordChange sharingScopeIdentifier](self, "sharingScopeIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      return 1;
  }
  if (!-[CPLRecordChange supportsResources](self, "supportsResources")
    || !-[CPLRecordChange hasChangeType:](self, "hasChangeType:", 8))
  {
    return 1;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CPLRecordChange resources](self, "resources", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "identity");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isAvailable");

        if (!v10)
        {
          v11 = 0;
          goto LABEL_17;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_17:

  return v11;
}

- (id)resourcePerType
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v5, 1339, CFSTR("%@ should be implemented in subclasses"), v6);

  abort();
}

- (unint64_t)baseDerivativeResourceType
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v5, 1343, CFSTR("%@ should be implemented in subclasses"), v6);

  abort();
}

- (unint64_t)baseVideoComplemenentResourceType
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v5, 1347, CFSTR("%@ should be implemented in subclasses"), v6);

  abort();
}

- (void)copyDerivatives:(unint64_t *)a3 count:(int)a4 avoidResourceType:(unint64_t)a5 fromRecord:(id)a6 inResourcePerType:(id)a7
{
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a6;
  v12 = a7;
  if (a4 >= 1)
  {
    v13 = a4;
    do
    {
      v15 = *a3++;
      v14 = v15;
      if (v15 != a5)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          objc_msgSend(v25, "resourceForType:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v18;
          if (v18)
          {
            objc_msgSend(v18, "identity");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "isAvailable");

            if (v21)
            {
              v22 = (void *)objc_msgSend(v19, "copy");
              -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "setItemScopedIdentifier:", v23);

              objc_msgSend(v22, "setSourceResourceType:", v14);
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, v24);

            }
          }

        }
      }
      --v13;
    }
    while (v13);
  }

}

- (void)copyDerivativesFromRecordIfPossible:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 1371, CFSTR("%@ should be implemented by subclass"), v8);

  abort();
}

- (void)enumerateChangeTypesForChangeType:(unint64_t)a3 block:(id)a4
{
  char v6;
  void (**v7)(id, uint64_t);

  v7 = (void (**)(id, uint64_t))a4;
  v6 = -[CPLRecordChange supportedChangeTypes](self, "supportedChangeTypes");
  if ((v6 & 2) != 0 && (!a3 || (a3 & 2) != 0))
    v7[2](v7, 2);
  if ((v6 & 8) != 0 && (!a3 || (a3 & 8) != 0))
    v7[2](v7, 8);
  if ((v6 & 0x10) != 0 && (!a3 || (a3 & 0x10) != 0))
    v7[2](v7, 16);
  if ((v6 & 0x20) != 0 && (!a3 || (a3 & 0x20) != 0))
    v7[2](v7, 32);
  if ((v6 & 0x40) != 0 && (!a3 || (a3 & 0x40) != 0))
    v7[2](v7, 64);

}

- (id)copyChangeType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void *v16;
  CPLRecordChange *v17;
  id v18;

  if (!a3)
    return (id)-[CPLRecordChange copy](self, "copy");
  if (!-[CPLRecordChange hasChangeType:](self, "hasChangeType:"))
    return 0;
  v5 = (void *)objc_opt_class();
  -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "newChangeWithScopedIdentifier:changeType:", v6, a3);

  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __34__CPLRecordChange_copyChangeType___block_invoke;
  v16 = &unk_1E60DCD80;
  v17 = self;
  v8 = v7;
  v18 = v8;
  -[CPLRecordChange enumerateChangeTypesForChangeType:block:](self, "enumerateChangeTypesForChangeType:block:", a3, &v13);
  -[CPLRecordChange recordModificationDate](self, "recordModificationDate", v13, v14, v15, v16, v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRecordModificationDate:", v9);

  objc_msgSend(v8, "restoreRelationshipsFromFullRecord:", self);
  v10 = v18;
  v11 = v8;

  return v11;
}

- (void)clearChangeType:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__CPLRecordChange_clearChangeType___block_invoke;
  v3[3] = &unk_1E60DCD30;
  v3[4] = self;
  -[CPLRecordChange enumerateChangeTypesForChangeType:block:](self, "enumerateChangeTypesForChangeType:block:", a3, v3);
}

- (void)applyChange:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  CPLRecordChange *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v5 = -[CPLRecordChange changeType](self, "changeType");
  if (v5 == 1024)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v13;
        _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Can't apply %@ to a delete", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLRecordChange.m");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v12, 1417, CFSTR("Can't apply %@ to a delete"), v13);

    abort();
  }
  v6 = v5;
  v7 = objc_msgSend(v13, "changeType");
  if (v7 == 1024)
  {
    v8 = self;
    goto LABEL_7;
  }
  if (v7)
  {
    -[CPLRecordChange applyChangeType:fromChange:](self, "applyChangeType:fromChange:", v7, v13);
    objc_msgSend(v13, "recordModificationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLRecordChange setRecordModificationDate:](self, "setRecordModificationDate:", v9);

    goto LABEL_9;
  }
  -[NSObject cplCopyPropertiesFromObject:withCopyBlock:](self, "cplCopyPropertiesFromObject:withCopyBlock:", v13, 0);
  if (v6)
  {
    v8 = self;
    v7 = 0;
LABEL_7:
    -[CPLRecordChange setChangeType:](v8, "setChangeType:", v7);
  }
LABEL_9:

}

- (void)applyChangeType:(unint64_t)a3 fromChange:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void *v14;
  CPLRecordChange *v15;
  id v16;

  v6 = a4;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __46__CPLRecordChange_applyChangeType_fromChange___block_invoke;
  v14 = &unk_1E60DCD80;
  v15 = self;
  v16 = v6;
  v7 = v6;
  -[CPLRecordChange enumerateChangeTypesForChangeType:block:](self, "enumerateChangeTypesForChangeType:block:", a3, &v11);
  v8 = -[CPLRecordChange changeType](self, "changeType", v11, v12, v13, v14, v15);
  if (v8)
    v9 = a3 == 0;
  else
    v9 = 1;
  if (v9)
    v10 = 0;
  else
    v10 = v8 | a3;
  if (v8 != v10)
    -[CPLRecordChange setChangeType:](self, "setChangeType:");

}

- (BOOL)isMasterChange
{
  return 0;
}

- (BOOL)isAssetChange
{
  return 0;
}

- (BOOL)isScopeChange
{
  return 0;
}

- (id)_recordKnownByCloudCache
{
  return self->_recordKnownByCloudCache;
}

- (void)_setRecordKnownByCloudCache:(id)a3
{
  objc_storeStrong((id *)&self->_recordKnownByCloudCache, a3);
}

- (CPLScopedIdentifier)scopedIdentifier
{
  return self->_scopedIdentifier;
}

- (NSDate)recordModificationDate
{
  return self->_recordModificationDate;
}

- (void)setRecordModificationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (unint64_t)changeType
{
  return self->_changeType;
}

- (void)setChangeType:(unint64_t)a3
{
  self->_changeType = a3;
}

- (NSDate)dateDeleted
{
  return self->_dateDeleted;
}

- (void)setDateDeleted:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (CPLScopedIdentifier)resourceCopyFromScopedIdentifier
{
  return self->_resourceCopyFromScopedIdentifier;
}

- (void)setResourceCopyFromScopedIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)inTrash
{
  return self->_inTrash;
}

- (void)setInTrash:(BOOL)a3
{
  self->_inTrash = a3;
}

- (BOOL)inExpunged
{
  return self->_inExpunged;
}

- (void)setInExpunged:(BOOL)a3
{
  self->_inExpunged = a3;
}

- (NSString)sharingScopeIdentifier
{
  return self->_sharingScopeIdentifier;
}

- (NSString)realIdentifier
{
  return self->_realIdentifier;
}

- (void)setRealIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSData)recordChangeData
{
  return self->_recordChangeData;
}

- (void)setRecordChangeData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSData)sharingRecordChangeData
{
  return self->_sharingRecordChangeData;
}

- (void)setSharingRecordChangeData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (BOOL)serverRecordIsCorrupted
{
  return self->_serverRecordIsCorrupted;
}

- (void)setServerRecordIsCorrupted:(BOOL)a3
{
  self->_serverRecordIsCorrupted = a3;
}

- (NSString)sharingRecordIdentifier
{
  return self->_sharingRecordIdentifier;
}

- (void)setSharingRecordIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingRecordIdentifier, 0);
  objc_storeStrong((id *)&self->_sharingRecordChangeData, 0);
  objc_storeStrong((id *)&self->_recordChangeData, 0);
  objc_storeStrong((id *)&self->_realIdentifier, 0);
  objc_storeStrong((id *)&self->_sharingScopeIdentifier, 0);
  objc_storeStrong((id *)&self->_resourceCopyFromScopedIdentifier, 0);
  objc_storeStrong((id *)&self->_dateDeleted, 0);
  objc_storeStrong((id *)&self->_recordModificationDate, 0);
  objc_storeStrong((id *)&self->_scopedIdentifier, 0);
  objc_storeStrong((id *)&self->_updateSharingContributorUserIdentifiers, 0);
  objc_storeStrong((id *)&self->_sharingContributorUserIdentifiers, 0);
  objc_storeStrong((id *)&self->_ignoredRecord, 0);
  objc_storeStrong((id *)&self->_pushContext, 0);
  objc_storeStrong((id *)&self->_recordKnownByCloudCache, 0);
  objc_storeStrong((id *)&self->_attachedDiffTracker, 0);
}

void __46__CPLRecordChange_applyChangeType_fromChange___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "propertiesForChangeType:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cplCopyProperties:fromObject:withCopyBlock:", v3, *(_QWORD *)(a1 + 40), 0);

}

void __35__CPLRecordChange_clearChangeType___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "hasChangeType:", a2))
  {
    objc_msgSend(*(id *)(a1 + 32), "propertiesForChangeType:", a2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cplClearProperties:", v4);

  }
}

void __34__CPLRecordChange_copyChangeType___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "propertiesForChangeType:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "cplCopyProperties:fromObject:withCopyBlock:", v3, *(_QWORD *)(a1 + 32), 0);

}

uint64_t __70__CPLRecordChange_changeIsOnlyAddingResourcesToRecord_addedResources___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(v3, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      v11 = objc_msgSend(v3, "sourceResourceType");

      if (v11)
        goto LABEL_3;
    }
    else
    {

    }
    v10 = 0;
    goto LABEL_11;
  }

LABEL_3:
  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v6, "addObject:", v3);
  v10 = 1;
LABEL_11:

  return v10;
}

uint64_t __70__CPLRecordChange_changeIsOnlyAddingResourcesToRecord_addedResources___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("available")))
    return 2;
  else
    return 0;
}

BOOL __65__CPLRecordChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "dateDeleted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

void __37__CPLRecordChange_cplFullDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  BOOL v3;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    v3 = (v2 & a2) == 0;
  else
    v3 = 0;
  if (!v3)
  {
    v5 = a1;
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("  ----\n"));
    objc_msgSend(*(id *)(v5 + 40), "propertiesForChangeType:", a2);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      v11 = CFSTR("  %@: [%lu bytes]\n");
      v24 = *(_QWORD *)v28;
      v25 = v5;
      do
      {
        v12 = 0;
        v26 = v9;
        do
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v12);
          objc_msgSend(*(id *)(v5 + 40), "valueForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(*(id *)(v5 + 32), "appendFormat:", v11, v13, objc_msgSend(v14, "length"));
          }
          else
          {
            v15 = (void *)MEMORY[0x1B5E08BF0]();
            objc_msgSend(v14, "cplFullDescription");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if ((unint64_t)objc_msgSend(v16, "length") >= 0x2801)
            {
              v17 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v16, "substringToIndex:", 1000);
              v18 = v7;
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "substringFromIndex:", objc_msgSend(v16, "length") - 1000);
              v20 = v11;
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "stringWithFormat:", CFSTR("%@...%@"), v19, v21);
              v22 = objc_claimAutoreleasedReturnValue();

              v11 = v20;
              v7 = v18;
              v16 = (void *)v22;
              v10 = v24;
              v5 = v25;
            }
            objc_msgSend(*(id *)(v5 + 32), "appendFormat:", CFSTR("  %@: %@\n"), v13, v16);

            objc_autoreleasePoolPop(v15);
            v9 = v26;
          }

          ++v12;
        }
        while (v9 != v12);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v9);
    }

  }
}

void __43__CPLRecordChange_propertiesForChangeType___block_invoke_97(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v2 = objc_opt_class();
  objc_msgSend((id)propertiesForChangeType__classToProperties, "objectForKey:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend((id)objc_opt_class(), "cplAllPropertyNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(*(id *)(a1 + 32), "propertiesForChangeType:", 64);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v17, "minusSet:", v7);
    objc_msgSend(*(id *)(a1 + 32), "propertiesForChangeType:", 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v17, "minusSet:", v8);
    objc_msgSend(*(id *)(a1 + 32), "propertiesForChangeType:", 16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      objc_msgSend(v17, "minusSet:", v9);
    objc_msgSend(*(id *)(a1 + 32), "propertiesForChangeType:", 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v17, "minusSet:", v10);
    objc_msgSend(*(id *)(a1 + 32), "propertiesForChangeType:", 256);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v17, "minusSet:", v11);
    objc_msgSend(v17, "removeObject:", CFSTR("changeType"));
    objc_msgSend(v17, "removeObject:", CFSTR("recordChangeData"));
    objc_msgSend(v17, "removeObject:", CFSTR("sharingRecordChangeData"));
    if (!+[CPLAssetChange serverSupportsSharedLibrarySharingState](CPLAssetChange, "serverSupportsSharedLibrarySharingState"))objc_msgSend(v17, "removeObject:", CFSTR("sharedLibrarySharingState"));
    if (!+[CPLAssetChange serverSupportsDeletedByUserIdentifier](CPLAssetChange, "serverSupportsDeletedByUserIdentifier"))objc_msgSend(v17, "removeObject:", CFSTR("deletedByUserIdentifier"));
    if (!+[CPLAssetChange serverSupportsLastViewedDate](CPLAssetChange, "serverSupportsLastViewedDate"))
      objc_msgSend(v17, "removeObject:", CFSTR("lastViewedDate"));
    if (!+[CPLPersonChange serverSupportsDetectionType](CPLPersonChange, "serverSupportsDetectionType"))
      objc_msgSend(v17, "removeObject:", CFSTR("detectionType"));
    v12 = +[CPLPersonChange serverSupportsAssetSortOrder](CPLPersonChange, "serverSupportsAssetSortOrder");
    v13 = v17;
    if (!v12)
    {
      objc_msgSend(v17, "removeObject:", CFSTR("assetSortOrder"));
      v13 = v17;
    }
    objc_msgSend(v13, "removeObject:", CFSTR("serverRecordIsCorrupted"));
    v14 = objc_msgSend(v17, "copy");
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    objc_msgSend((id)propertiesForChangeType__classToProperties, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
  }
}

void __43__CPLRecordChange_propertiesForChangeType___block_invoke_3()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("sharingScopeIdentifier"), CFSTR("sharingContributorUserIdentifiers"), CFSTR("updateSharingContributorUserIdentifiers"), 0);
  v1 = (void *)propertiesForChangeType__sharingProperties;
  propertiesForChangeType__sharingProperties = v0;

}

void __43__CPLRecordChange_propertiesForChangeType___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("recordModificationDate"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)propertiesForChangeType__modificationDateProperty;
  propertiesForChangeType__modificationDateProperty = v0;

}

void __43__CPLRecordChange_propertiesForChangeType___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  id v2;
  void *v3;

  v0 = dispatch_queue_create("com.apple.changeproperties", 0);
  v1 = (void *)propertiesForChangeType__lock;
  propertiesForChangeType__lock = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)propertiesForChangeType__classToProperties;
  propertiesForChangeType__classToProperties = (uint64_t)v2;

}

uint64_t __66__CPLRecordChange_mergeRecordChangeWithNewRecordChange_direction___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], a1[4], a4, a5, a6, a1[7]);
}

uint64_t __66__CPLRecordChange_mergeRecordChangeWithNewRecordChange_direction___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, a3, a2, a4, a5, a6, *(_QWORD *)(a1 + 40));
}

void __66__CPLRecordChange_mergeRecordChangeWithNewRecordChange_direction___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  id v8;

  if ((*(_QWORD *)(a1 + 72) & a2) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "propertiesForChangeType:", a2);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "cplCopyProperties:fromObject:withCopyBlock:");
    if (*(_BYTE *)(a1 + 80))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v5 = *(_QWORD *)(v4 + 24);
      if (v5)
        v6 = a2 == 0;
      else
        v6 = 1;
      v7 = v5 | a2;
      if (v6)
        v7 = 0;
      *(_QWORD *)(v4 + 24) = v7;
    }

  }
}

void __95__CPLRecordChange_realRecordChangeFromRecordChange_direction_newRecord_changeType_diffTracker___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  if ((*(_QWORD *)(a1 + 80) & a2) != 0)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 0;
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __95__CPLRecordChange_realRecordChangeFromRecordChange_direction_newRecord_changeType_diffTracker___block_invoke_2;
      v12[3] = &unk_1E60DAC30;
      v16 = &v19;
      v13 = *(id *)(a1 + 40);
      v14 = *(id *)(a1 + 48);
      v15 = *(id *)(a1 + 56);
      v5 = *(_QWORD *)(a1 + 88);
      v17 = a2;
      v18 = v5;
      objc_msgSend(v4, "withTrackerForChangeType:block:", a2, v12);

      if (!*((_BYTE *)v20 + 24))
        goto LABEL_14;
    }
    else
    {
      v6 = objc_msgSend(*(id *)(a1 + 40), "applyChange:copyPropertiesToFinalChange:forChangeType:direction:diffTracker:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2, *(_QWORD *)(a1 + 88), 0);
      *((_BYTE *)v20 + 24) = v6;
      if (!v6)
      {
LABEL_14:
        _Block_object_dispose(&v19, 8);
        return;
      }
    }
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    if (*(_BYTE *)(v7 + 24))
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v9 = *(_QWORD *)(v8 + 24);
      if (v9)
        v10 = a2 == 0;
      else
        v10 = 1;
      v11 = v9 | a2;
      if (v10)
        v11 = 0;
      *(_QWORD *)(v8 + 24) = v11;
    }
    else
    {
      *(_BYTE *)(v7 + 24) = 1;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = a2;
    }
    goto LABEL_14;
  }
}

uint64_t __95__CPLRecordChange_realRecordChangeFromRecordChange_direction_newRecord_changeType_diffTracker___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "applyChange:copyPropertiesToFinalChange:forChangeType:direction:diffTracker:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

uint64_t __95__CPLRecordChange_applyChange_copyPropertiesToFinalChange_forChangeType_direction_diffTracker___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, a3, a4, a5, *(_QWORD *)(a1 + 40));
}

uint64_t __95__CPLRecordChange_applyChange_copyPropertiesToFinalChange_forChangeType_direction_diffTracker___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, _QWORD))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], a4, a5, a6, a1[8]);
}

uint64_t __95__CPLRecordChange_applyChange_copyPropertiesToFinalChange_forChangeType_direction_diffTracker___block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5], a1[4], a4, a5, a6, a1[7]);
}

- (id)asRecordView
{
  return -[CPLSimpleRecordView initWithRecord:]([CPLSimpleRecordView alloc], "initWithRecord:", self);
}

- (BOOL)validateRecordForTracker:(id)a3
{
  id v4;
  BOOL v5;
  CPLRecordChange *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  CPLRecordChange *v14;
  void *v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v21;
  void *v22;
  void *v23;
  CPLRecordChange *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  uint8_t v30[128];
  uint8_t buf[4];
  CPLRecordChange *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29 = 0;
  v5 = -[CPLRecordChange validateChangeWithError:](self, "validateChangeWithError:", &v29);
  v6 = (CPLRecordChange *)v29;
  if (!v5)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain_14133();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v6;
        _os_log_impl(&dword_1B03C2000, v18, OS_LOG_TYPE_ERROR, "Client pushed an invalid record: %@", buf, 0xCu);
      }

    }
    objc_msgSend(v4, "pushChangeTasks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTask:forRecordWithScopedIdentifier:", 0, v9);
LABEL_25:
    v17 = 0;
    goto LABEL_26;
  }
  -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scopeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "checkScopeIdentifier:", v8) & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLSessionOSLogDomain_14133();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v32 = self;
        _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_ERROR, "Client pushed a record to an invalid scope: %@", buf, 0xCu);
      }

    }
    objc_msgSend(v4, "pushChangeTasks");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTask:forRecordWithScopedIdentifier:", 6, v15);
LABEL_24:

    goto LABEL_25;
  }
  if (!-[CPLRecordChange supportsResources](self, "supportsResources")
    || !-[CPLRecordChange hasChangeType:](self, "hasChangeType:", 8))
  {
    v17 = 1;
    goto LABEL_27;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[CPLRecordChange resources](self, "resources");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v10)
  {
    v11 = v10;
    v24 = v6;
    v12 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(CPLRecordChange **)(*((_QWORD *)&v25 + 1) + 8 * i);
        -[CPLRecordChange identity](v14, "identity");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "fileUTI");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16)
        {
          v6 = v24;
          if (!_CPLSilentLogging)
          {
            __CPLSessionOSLogDomain_14133();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v32 = v14;
              _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_ERROR, "Client pushed a resource with no fileUTI: %@", buf, 0xCu);
            }

          }
          objc_msgSend(v4, "pushChangeTasks");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addTask:forRecordWithScopedIdentifier:", 0, v23);

          goto LABEL_24;
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      v17 = 1;
      if (v11)
        continue;
      break;
    }
    v6 = v24;
  }
  else
  {
    v17 = 1;
  }
LABEL_26:

LABEL_27:
  return v17;
}

- (Class)relatedRecordClass
{
  return (Class)objc_msgSend((id)objc_opt_class(), "relatedRecordClass");
}

+ (Class)relatedRecordClass
{
  return (Class)objc_opt_class();
}

@end
