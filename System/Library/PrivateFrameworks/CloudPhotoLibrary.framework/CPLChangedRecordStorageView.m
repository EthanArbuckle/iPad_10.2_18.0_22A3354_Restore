@implementation CPLChangedRecordStorageView

- (id)relatedScopedIdentifierForRecordWithScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v11;

  v4 = a3;
  -[CPLChangedRecordStorageView changeStorage](self, "changeStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = objc_msgSend(v5, "getRelatedScopedIdentifier:forRecordWithScopedIdentifier:", &v11, v4);
  v7 = v11;

  if ((v6 & 1) == 0)
  {
    -[CPLChangedRecordStorageView baseStorageView](self, "baseStorageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "relatedScopedIdentifierForRecordWithScopedIdentifier:", v4);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v9;
  }

  return v7;
}

- (BOOL)hasRecordWithScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  char v7;
  void *v8;
  uint64_t v10;

  v4 = a3;
  v10 = 0;
  -[CPLChangedRecordStorageView changeStorage](self, "changeStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "getStoredChangeType:forRecordWithScopedIdentifier:", &v10, v4);

  if (v6)
  {
    v7 = v10 != 1024;
  }
  else
  {
    -[CPLChangedRecordStorageView baseStorageView](self, "baseStorageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "hasRecordWithScopedIdentifier:", v4);

  }
  return v7;
}

- (unint64_t)countOfRecordsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  -[CPLChangedRecordStorageView changeStorage](self, "changeStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasChangesWithRelatedScopedIdentifier:class:", v6, a4);

  if ((v8 & 1) != 0)
  {
    v12.receiver = self;
    v12.super_class = (Class)CPLChangedRecordStorageView;
    v9 = -[CPLRecordStorageView countOfRecordsWithRelatedScopedIdentifier:class:](&v12, sel_countOfRecordsWithRelatedScopedIdentifier_class_, v6, a4);
  }
  else
  {
    -[CPLChangedRecordStorageView baseStorageView](self, "baseStorageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v10, "countOfRecordsWithRelatedScopedIdentifier:class:", v6, a4);

  }
  return (unint64_t)v9;
}

- (id)resourceOfType:(unint64_t)a3 forRecordWithScopedIdentifier:(id)a4 recordClass:(Class *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  objc_super v19;

  v10 = a4;
  -[CPLChangedRecordStorageView changeStorage](self, "changeStorage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "changeWithScopedIdentifier:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12 || (objc_msgSend(v12, "isDelete") & 1) == 0 && !objc_msgSend(v12, "hasChangeType:", 8))
    goto LABEL_16;
  if (objc_msgSend(v12, "isDelete"))
  {
    +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 25, CFSTR("Record %@ has just been deleted"), v10);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if ((objc_msgSend(v12, "supportsResources") & 1) == 0)
  {
    +[CPLErrors incorrectParametersErrorForParameter:](CPLErrors, "incorrectParametersErrorForParameter:", CFSTR("itemScopedIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v16 = (id)v13;
    if (v13)
      goto LABEL_12;
    goto LABEL_16;
  }
  objc_msgSend(v12, "resourceForType:", a3);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    if (a5)
    {
      v16 = 0;
      *a5 = (Class)objc_opt_class();
      goto LABEL_18;
    }
LABEL_17:
    v16 = 0;
    goto LABEL_18;
  }
  +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CPLErrors cplErrorWithCode:description:](CPLErrors, "cplErrorWithCode:description:", 26, CFSTR("Record %@ has just been modified and has no resource of type %@"), v10, v17);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
LABEL_16:
    v19.receiver = self;
    v19.super_class = (Class)CPLChangedRecordStorageView;
    -[CPLRecordStorageView resourceOfType:forRecordWithScopedIdentifier:recordClass:error:](&v19, sel_resourceOfType_forRecordWithScopedIdentifier_recordClass_error_, a3, v10, a5, a6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
LABEL_12:
  if (a6)
  {
    v16 = objc_retainAutorelease(v16);
    v15 = 0;
    *a6 = v16;
  }
  else
  {
    v15 = 0;
  }
LABEL_18:

  return v15;
}

- (CPLChangedRecordStorageView)initWithChangeStorage:(id)a3 overStorageView:(id)a4
{
  id v7;
  id v8;
  CPLChangedRecordStorageView *v9;
  CPLChangedRecordStorageView *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CPLChangedRecordStorageView;
  v9 = -[CPLChangedRecordStorageView init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseStorageView, a4);
    objc_storeStrong((id *)&v10->_changeStorage, a3);
  }

  return v10;
}

- (id)recordViewWithScopedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CPLChangedRecordView *v8;
  uint64_t v10;
  void *v11;

  v4 = a3;
  -[CPLChangeStorage changeWithScopedIdentifier:](self->_changeStorage, "changeWithScopedIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    -[CPLRecordStorageView recordViewWithScopedIdentifier:](self->_baseStorageView, "recordViewWithScopedIdentifier:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(v5, "isFullRecord"))
  {
    objc_msgSend(v6, "asRecordView");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (CPLChangedRecordView *)v7;
    goto LABEL_6;
  }
  if ((objc_msgSend(v6, "isDelete") & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[CPLRecordStorageView recordViewWithScopedIdentifier:](self->_baseStorageView, "recordViewWithScopedIdentifier:", v4);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      _CPLBaseRecordViewFailure(self, v6);
    v11 = (void *)v10;
    v8 = -[CPLChangedRecordView initWithChange:overRecordView:]([CPLChangedRecordView alloc], "initWithChange:overRecordView:", v6, v10);

  }
LABEL_6:

  return v8;
}

- (id)recordViewsWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  CPLChangedRecordStorageView *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  CPLChangedRecordView *v23;
  CPLRecordStorageView *baseStorageView;
  void *v25;
  CPLChangedRecordView *v26;
  CPLChangedRecordView *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  char v38;
  unint64_t v39;
  void *v40;
  CPLChangedRecordView *v41;
  void *v42;
  CPLChangedRecordView *v43;
  void *v44;
  void *v46;
  void *v47;
  unint64_t v49;
  CPLChangedRecordStorageView *v50;
  id v51;
  id obj;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v49 = (unint64_t)a3;
  v50 = self;
  -[CPLRecordStorageView recordViewsWithRelatedScopedIdentifier:class:](self->_baseStorageView, "recordViewsWithRelatedScopedIdentifier:class:");
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v62 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        if (!v9)
          v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v12, "scopedIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
          v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, v13);
        objc_msgSend(v8, "addObject:", v13);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }

  v14 = v50;
  -[CPLChangeStorage changesWithRelatedScopedIdentifier:class:](v50->_changeStorage, "changesWithRelatedScopedIdentifier:class:", v49, a4);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v51 = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v58 != v17)
          objc_enumerationMutation(v51);
        v19 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
        objc_msgSend(v19, "scopedIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObject:", v20);
        objc_msgSend(v9, "objectForKeyedSubscript:", v20);
        v21 = objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = (void *)v21;
          if (objc_msgSend(v19, "isDelete"))
          {
            objc_msgSend(v9, "removeObjectForKey:", v20);
          }
          else
          {
            if (objc_msgSend(v19, "isFullRecord"))
            {
              objc_msgSend(v19, "asRecordView");
              v23 = (CPLChangedRecordView *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v23 = -[CPLChangedRecordView initWithChange:overRecordView:]([CPLChangedRecordView alloc], "initWithChange:overRecordView:", v19, v22);
            }
            v27 = v23;
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v23, v20);

          }
        }
        else if (objc_msgSend(v19, "isFullRecord"))
        {
          if (!v9)
            v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v19, "asRecordView");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, v20);
        }
        else
        {
          if ((objc_msgSend(v19, "isDelete") & 1) != 0)
            goto LABEL_34;
          baseStorageView = v14->_baseStorageView;
          objc_msgSend(v19, "scopedIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[CPLRecordStorageView recordViewWithScopedIdentifier:](baseStorageView, "recordViewWithScopedIdentifier:", v25);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v22)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLChangedRecordStorageView.m");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, v19, v50);

            abort();
          }
          v26 = -[CPLChangedRecordView initWithChange:overRecordView:]([CPLChangedRecordView alloc], "initWithChange:overRecordView:", v19, v22);
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v26, v20);

          v14 = v50;
        }

LABEL_34:
      }
      v16 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    }
    while (v16);
  }

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v28 = v8;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v54;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v54 != v31)
          objc_enumerationMutation(v28);
        v33 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * k);
        -[CPLChangeStorage changeWithScopedIdentifier:](v14->_changeStorage, "changeWithScopedIdentifier:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        if (v34)
        {
          if (objc_msgSend(v34, "isDelete"))
          {
            objc_msgSend(v9, "removeObjectForKey:", v33);
            goto LABEL_54;
          }
          if (!objc_msgSend(v35, "hasChangeType:", 2))
            goto LABEL_50;
          objc_msgSend(v35, "relatedScopedIdentifier");
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = (void *)v36;
          if (v49 && v36)
          {
            v38 = objc_msgSend((id)v36, "isEqual:", v49);

            if ((v38 & 1) == 0)
              goto LABEL_48;
LABEL_50:
            if (objc_msgSend(v35, "isFullRecord"))
            {
              objc_msgSend(v35, "asRecordView");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v40, v33);

            }
            else
            {
              v41 = [CPLChangedRecordView alloc];
              objc_msgSend(v9, "objectForKeyedSubscript:", v33);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = -[CPLChangedRecordView initWithChange:overRecordView:](v41, "initWithChange:overRecordView:", v35, v42);
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v43, v33);

            }
          }
          else
          {
            v39 = v49 | v36;

            if (!v39)
              goto LABEL_50;
LABEL_48:
            objc_msgSend(v9, "removeObjectForKey:", v33);
          }
          v14 = v50;
        }
LABEL_54:

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    }
    while (v30);
  }

  objc_msgSend(v9, "allValues");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

- (id)description
{
  id v3;
  CPLRecordStorageView *baseStorageView;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  baseStorageView = self->_baseStorageView;
  -[CPLChangeStorage storageDescription](self->_changeStorage, "storageDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@+%@"), baseStorageView, v5);

  return v6;
}

- (id)redactedDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[CPLRecordStorageView redactedDescription](self->_baseStorageView, "redactedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLChangeStorage storageDescription](self->_changeStorage, "storageDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@+%@"), v4, v5);

  return v6;
}

- (CPLChangeStorage)changeStorage
{
  return self->_changeStorage;
}

- (CPLRecordStorageView)baseStorageView
{
  return self->_baseStorageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseStorageView, 0);
  objc_storeStrong((id *)&self->_changeStorage, 0);
}

@end
