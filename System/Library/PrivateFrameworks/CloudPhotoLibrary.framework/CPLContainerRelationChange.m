@implementation CPLContainerRelationChange

- (id)scopedIdentifiersForMapping
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v9.receiver = self;
  v9.super_class = (Class)CPLContainerRelationChange;
  -[CPLRecordChange scopedIdentifiersForMapping](&v9, sel_scopedIdentifiersForMapping);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  -[CPLContainerRelationChange itemScopedIdentifier](self, "itemScopedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "addObject:", v6);

  -[CPLContainerRelationChange containerScopedIdentifier](self, "containerScopedIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v5, "addObject:", v7);

  return v5;
}

- (id)translateToCloudChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v24;
  char v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  CPLContainerRelationChange *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)-[CPLContainerRelationChange copy](self, "copy");
  v25 = 0;
  -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v6, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v8, &v25);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v7, "setScopedIdentifier:", v9);
    v24 = 0;
    -[CPLContainerRelationChange itemScopedIdentifier](self, "itemScopedIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v6, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v10, &v24);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        objc_msgSend(v7, "setItemScopedIdentifier:", v11);
      }
      else
      {
        if (a4)
        {
          +[CPLErrors invalidClientCacheErrorWithReason:](CPLErrors, "invalidClientCacheErrorWithReason:", 0);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (!_CPLSilentLogging)
        {
          __CPLGenericOSLogDomain();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v27 = v10;
            v28 = 2112;
            v29 = self;
            _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_ERROR, "Can't map local \"itemScopedIdentifier\" (%@) of %@", buf, 0x16u);
          }

        }
        v7 = 0;
      }

    }
    v24 = 0;
    -[CPLContainerRelationChange containerScopedIdentifier](self, "containerScopedIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v6, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v13, &v24);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v7, "setContainerScopedIdentifier:", v14);
      }
      else
      {
        if (a4)
        {
          +[CPLErrors invalidClientCacheErrorWithReason:](CPLErrors, "invalidClientCacheErrorWithReason:", 0);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (!_CPLSilentLogging)
        {
          __CPLGenericOSLogDomain();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v27 = v13;
            v28 = 2112;
            v29 = self;
            _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_ERROR, "Can't map local \"containerScopedIdentifier\" (%@) of %@", buf, 0x16u);
          }

        }
        v7 = 0;
      }

    }
    if (v9 || !v7)
      goto LABEL_37;
    objc_msgSend(v7, "itemIdentifier");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
      goto LABEL_32;
    v17 = (void *)v16;
    objc_msgSend(v7, "relation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "containerIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v7, "relation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "itemScopedIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "proposedScopedIdentifierForItemScopedIdentifier:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
      {
LABEL_31:

        v9 = 0;
        goto LABEL_36;
      }
    }
    else
    {
LABEL_32:
      -[CPLRecordChange proposedCloudScopedIdentifierWithError:](self, "proposedCloudScopedIdentifierWithError:", a4);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
        goto LABEL_31;
    }
    objc_msgSend(v6, "setupCloudScopedIdentifier:forLocalScopedIdentifier:isFinal:direction:error:", v22, v8, 0, 1, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v7, "setScopedIdentifier:", v9);
LABEL_37:

      goto LABEL_38;
    }

LABEL_36:
    v7 = 0;
    goto LABEL_37;
  }
LABEL_38:

  return v7;
}

- (id)translateToClientChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v24;
  char v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  CPLContainerRelationChange *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)-[CPLContainerRelationChange copy](self, "copy");
  v25 = 0;
  -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v24 = 0;
    -[CPLContainerRelationChange itemScopedIdentifier](self, "itemScopedIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v6, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v9, &v24);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v7, "setItemScopedIdentifier:", v10);
      }
      else
      {
        if (a4)
        {
          +[CPLErrors invalidClientCacheErrorWithReason:](CPLErrors, "invalidClientCacheErrorWithReason:", 0);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (!_CPLSilentLogging)
        {
          __CPLGenericOSLogDomain();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v27 = v9;
            v28 = 2112;
            v29 = self;
            _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "Can't map cloud \"itemScopedIdentifier\" (%@) of %@", buf, 0x16u);
          }

        }
        v7 = 0;
      }

    }
    v24 = 0;
    -[CPLContainerRelationChange containerScopedIdentifier](self, "containerScopedIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v6, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v12, &v24);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(v7, "setContainerScopedIdentifier:", v13);
      }
      else
      {
        if (a4)
        {
          +[CPLErrors invalidClientCacheErrorWithReason:](CPLErrors, "invalidClientCacheErrorWithReason:", 0);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        if (!_CPLSilentLogging)
        {
          __CPLGenericOSLogDomain();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v27 = v12;
            v28 = 2112;
            v29 = self;
            _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "Can't map cloud \"containerScopedIdentifier\" (%@) of %@", buf, 0x16u);
          }

        }
        v7 = 0;
      }

    }
    if (v7)
    {
      objc_msgSend(v6, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v8, &v25);
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;
      }
      else
      {
        objc_msgSend(v7, "itemIdentifier");
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v17)
          goto LABEL_30;
        v18 = (void *)v17;
        objc_msgSend(v7, "relation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "containerIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v7, "relation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "itemScopedIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "proposedScopedIdentifierForItemScopedIdentifier:", v22);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
LABEL_30:
          -[CPLRecordChange proposedLocalScopedIdentifier](self, "proposedLocalScopedIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if ((objc_msgSend(v6, "addCloudScopedIdentifier:forLocalScopedIdentifier:isFinal:direction:error:", v8, v16, 1, 2, a4) & 1) == 0)
        {

          v7 = 0;
          goto LABEL_33;
        }
      }
      objc_msgSend(v7, "setScopedIdentifier:", v16);
LABEL_33:

    }
  }

  return v7;
}

- (id)compactedChangeWithRelatedChanges:(id)a3 isOnlyChange:(BOOL)a4 fullRecord:(id)a5 usingStorageView:(id)a6
{
  return 0;
}

- (id)itemScopedIdentifier
{
  void *v3;
  CPLScopedIdentifier *v4;
  void *v5;
  id v6;

  -[CPLContainerRelationChange itemIdentifier](self, "itemIdentifier");
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

- (void)setItemScopedIdentifier:(id)a3
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLContainerChange.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scopeIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "scopeIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v15, 66, CFSTR("Invalid call to %@ with mismatched scope: %@ vs. %@"), v16, v18, v19);

      abort();
    }
  }
  objc_msgSend(v21, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLContainerRelationChange setItemIdentifier:](self, "setItemIdentifier:", v20);

}

- (id)containerScopedIdentifier
{
  void *v3;
  void *v4;
  CPLScopedIdentifier *v5;
  void *v6;
  id v7;

  -[CPLContainerRelationChange relation](self, "relation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [CPLScopedIdentifier alloc];
    -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:](v5, "initRelativeToScopedIdentifier:identifier:", v6, v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setContainerScopedIdentifier:(id)a3
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
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  objc_msgSend(v22, "scopeIdentifier");
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
          objc_msgSend(v22, "scopeIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v24 = v10;
          v25 = 2112;
          v26 = v12;
          v27 = 2112;
          v28 = v13;
          _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Invalid call to %@ with mismatched scope: %@ vs. %@", buf, 0x20u);

        }
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLContainerChange.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scopeIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "scopeIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v15, 75, CFSTR("Invalid call to %@ with mismatched scope: %@ vs. %@"), v16, v18, v19);

      abort();
    }
  }
  -[CPLContainerRelationChange relation](self, "relation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setContainerIdentifier:", v21);

}

- (id)secondaryIdentifier
{
  return -[CPLContainerRelation containerIdentifier](self->_relation, "containerIdentifier");
}

- (void)setSecondaryIdentifier:(id)a3
{
  -[CPLContainerRelation setContainerIdentifier:](self->_relation, "setContainerIdentifier:", a3);
}

- (id)description
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = -[CPLRecordChange changeType](self, "changeType");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == 1024)
  {
    objc_msgSend((id)objc_opt_class(), "descriptionForChangeType:", -[CPLRecordChange changeType](self, "changeType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %@ %@>"), v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CPLRecordChange recordModificationDate](self, "recordModificationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "descriptionForChangeType:", -[CPLRecordChange changeType](self, "changeType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLContainerRelationChange itemIdentifier](self, "itemIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLContainerRelationChange relation](self, "relation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %@ modified: %@ %@ %@ %@>"), v5, v6, v7, v9, v10, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (BOOL)validateFullRecord
{
  void *v3;
  BOOL v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPLContainerRelationChange;
  if (!-[CPLRecordChange validateFullRecord](&v6, sel_validateFullRecord) || !self->_itemIdentifier)
    return 0;
  -[CPLContainerRelation containerIdentifier](self->_relation, "containerIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (CPLContainerRelation)relation
{
  return self->_relation;
}

- (void)setRelation:(id)a3
{
  objc_storeStrong((id *)&self->_relation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relation, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

+ (id)relationToContainerWithIdentifier:(id)a3
{
  id v3;
  CPLContainerRelation *v4;

  v3 = a3;
  v4 = objc_alloc_init(CPLContainerRelation);
  -[CPLContainerRelation setContainerIdentifier:](v4, "setContainerIdentifier:", v3);

  return v4;
}

+ (id)relationWithItemScopedIdentifier:(id)a3 containerIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(a1, "relationToContainerWithIdentifier:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "proposedScopedIdentifierForItemScopedIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(a1, "newRecordWithScopedIdentifier:", v8);

  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setItemIdentifier:", v10);
  objc_msgSend(v9, "setRelation:", v7);

  return v9;
}

+ (BOOL)shouldReallyQuarantineRecord
{
  return 0;
}

+ (BOOL)supportsDeletion
{
  return 1;
}

+ (BOOL)supportsDirectDeletion
{
  return 1;
}

+ (Class)relatedRecordClass
{
  return (Class)objc_opt_class();
}

@end
