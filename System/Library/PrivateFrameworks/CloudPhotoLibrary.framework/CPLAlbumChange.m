@implementation CPLAlbumChange

- (id)scopedIdentifiersForMapping
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v8.receiver = self;
  v8.super_class = (Class)CPLAlbumChange;
  -[CPLRecordChange scopedIdentifiersForMapping](&v8, sel_scopedIdentifiersForMapping);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  -[CPLAlbumChange parentScopedIdentifier](self, "parentScopedIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "addObject:", v6);

  return v5;
}

- (id)translateToCloudChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  char v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  CPLAlbumChange *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLAlbumChange;
  -[CPLRecordChange translateToCloudChangeUsingIDMapping:error:](&v13, sel_translateToCloudChangeUsingIDMapping_error_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v12 = 0;
    -[CPLAlbumChange parentScopedIdentifier](self, "parentScopedIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v6, "cloudScopedIdentifierForLocalScopedIdentifier:isFinal:", v8, &v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v7, "setParentScopedIdentifier:", v9);
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
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v15 = v8;
            v16 = 2112;
            v17 = self;
            _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Can't map local \"parentScopedIdentifier\" (%@) of %@", buf, 0x16u);
          }

        }
        v7 = 0;
      }

    }
  }

  return v7;
}

- (id)translateToClientChangeUsingIDMapping:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  char v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  CPLAlbumChange *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLAlbumChange;
  -[CPLRecordChange translateToClientChangeUsingIDMapping:error:](&v13, sel_translateToClientChangeUsingIDMapping_error_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v12 = 0;
    -[CPLAlbumChange parentScopedIdentifier](self, "parentScopedIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v6, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v8, &v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v7, "setParentScopedIdentifier:", v9);
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
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v15 = v8;
            v16 = 2112;
            v17 = self;
            _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Can't map cloud \"parentScopedIdentifier\" (%@) of %@", buf, 0x16u);
          }

        }
        v7 = 0;
      }

    }
  }

  return v7;
}

- (BOOL)validateRecordForTracker:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  CPLAlbumChange *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPLAlbumChange;
  if (-[CPLRecordChange validateRecordForTracker:](&v10, sel_validateRecordForTracker_, v4))
  {
    if (-[CPLRecordChange hasChangeType:](self, "hasChangeType:", 2))
    {
      -[CPLAlbumChange parentScopedIdentifier](self, "parentScopedIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 && (objc_msgSend(v4, "knowsClientRecordWithScopedIdentifier:", v5) & 1) == 0)
      {
        if (!_CPLSilentLogging)
        {
          __CPLSessionOSLogDomain_14133();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v12 = v5;
            v13 = 2112;
            v14 = self;
            _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Client pushed an album with missing parent album %@: %@", buf, 0x16u);
          }

        }
        objc_msgSend(v4, "pushChangeTasks");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addTask:forRecordWithScopedIdentifier:", 5, v5);

        v6 = 0;
      }
      else
      {
        v6 = 1;
      }

    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (Class)relatedRecordClass
{
  return (Class)objc_opt_class();
}

- (id)parentScopedIdentifier
{
  void *v3;
  CPLScopedIdentifier *v4;
  void *v5;
  id v6;

  -[CPLAlbumChange parentIdentifier](self, "parentIdentifier");
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

- (void)setParentScopedIdentifier:(id)a3
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLAlbumChange.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLRecordChange scopedIdentifier](self, "scopedIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scopeIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "scopeIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v15, 21, CFSTR("Invalid call to %@ with mismatched scope: %@ vs. %@"), v16, v18, v19);

      abort();
    }
  }
  objc_msgSend(v21, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLAlbumChange setParentIdentifier:](self, "setParentIdentifier:", v20);

}

- (id)propertiesDescription
{
  unint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  uint64_t v11;

  v3 = -[CPLAlbumChange albumType](self, "albumType");
  if (v3 >= 8)
    v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unknown (%lu)"), -[CPLAlbumChange albumType](self, "albumType"));
  else
    v4 = off_1E60DDC60[v3];
  -[CPLAlbumChange parentIdentifier](self, "parentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  -[CPLAlbumChange name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CPLAlbumChange position](self, "position");
  if (v5)
    objc_msgSend(v6, "stringWithFormat:", CFSTR("[%@] title: %@, @%ld in: %@"), v4, v7, v8, v5);
  else
    objc_msgSend(v6, "stringWithFormat:", CFSTR("[%@] title: %@, @%ld"), v4, v7, v8, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)checkDefaultValueBlockForPropertyWithSelector:(SEL)a3
{
  void *v3;
  objc_super v5;

  if (sel_importedByBundleIdentifier == a3)
  {
    v3 = &__block_literal_global_21563;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CPLAlbumChange;
    -[CPLRecordChange checkDefaultValueBlockForPropertyWithSelector:](&v5, sel_checkDefaultValueBlockForPropertyWithSelector_);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (unint64_t)albumType
{
  return self->_albumType;
}

- (void)setAlbumType:(unint64_t)a3
{
  self->_albumType = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (int64_t)position
{
  return self->_position;
}

- (void)setPosition:(int64_t)a3
{
  self->_position = a3;
}

- (NSString)parentIdentifier
{
  return self->_parentIdentifier;
}

- (void)setParentIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (unint64_t)albumSortType
{
  return self->_albumSortType;
}

- (void)setAlbumSortType:(unint64_t)a3
{
  self->_albumSortType = a3;
}

- (BOOL)albumSortAscending
{
  return self->_albumSortAscending;
}

- (void)setAlbumSortAscending:(BOOL)a3
{
  self->_albumSortAscending = a3;
}

- (NSString)projectDocumentType
{
  return self->_projectDocumentType;
}

- (void)setProjectDocumentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSData)projectData
{
  return self->_projectData;
}

- (void)setProjectData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (NSData)projectPreviewImageData
{
  return self->_projectPreviewImageData;
}

- (void)setProjectPreviewImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (NSString)importedByBundleIdentifier
{
  return self->_importedByBundleIdentifier;
}

- (void)setImportedByBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importedByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_projectPreviewImageData, 0);
  objc_storeStrong((id *)&self->_projectData, 0);
  objc_storeStrong((id *)&self->_projectDocumentType, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

BOOL __64__CPLAlbumChange_checkDefaultValueBlockForPropertyWithSelector___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "importedByBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

@end
