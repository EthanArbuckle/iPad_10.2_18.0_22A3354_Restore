@implementation CPLChangeStorage

- (BOOL)getRelatedScopedIdentifier:(id *)a3 forRecordWithScopedIdentifier:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  -[CPLChangeStorage changeWithScopedIdentifier:](self, "changeWithScopedIdentifier:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((objc_msgSend(v5, "isDelete") & 1) != 0)
    {
      v7 = 0;
LABEL_6:
      *a3 = v7;
      goto LABEL_7;
    }
    if (objc_msgSend(v6, "hasChangeType:", 2))
    {
      objc_msgSend(v6, "relatedScopedIdentifier");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
LABEL_7:

  return v6 != 0;
}

- (BOOL)getStoredChangeType:(unint64_t *)a3 forRecordWithScopedIdentifier:(id)a4
{
  void *v5;
  void *v6;

  -[CPLChangeStorage changeWithScopedIdentifier:](self, "changeWithScopedIdentifier:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    *a3 = objc_msgSend(v5, "changeType");

  return v6 != 0;
}

- (BOOL)hasChangesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  void *v4;
  BOOL v5;
  __int128 v7;
  _BYTE v8[128];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[CPLChangeStorage changesWithRelatedScopedIdentifier:class:](self, "changesWithRelatedScopedIdentifier:class:", a3, a4, 0, 0, 0, 0, 0, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v7, v8, 16) != 0;

  return v5;
}

- (id)changeWithScopedIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLChangedRecordStorageView.m");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v7, 18, CFSTR("%@ should be implemented by subclasses"), v8);

  abort();
}

- (id)changesWithRelatedScopedIdentifier:(id)a3 class:(Class)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLChangedRecordStorageView.m");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v8, 23, CFSTR("%@ should be implemented by subclasses"), v9);

  abort();
}

- (NSString)storageDescription
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLChangedRecordStorageView.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v5, 28, CFSTR("%@ should be implemented by subclasses"), v6);

  abort();
}

@end
