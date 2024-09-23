@implementation CPLFileStorageItem

- (CPLFileStorageItem)initWithIdentity:(id)a3 original:(BOOL)a4 markedForDelete:(BOOL)a5 lastAccessDate:(id)a6
{
  id v12;
  id v13;
  CPLFileStorageItem *v14;
  CPLFileStorageItem *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSDate *lastAccessDate;
  NSObject *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  SEL v26;
  CPLFileStorageItem *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  uint8_t v32[16];
  objc_super v33;

  v12 = a3;
  v13 = a6;
  v33.receiver = self;
  v33.super_class = (Class)CPLFileStorageItem;
  v14 = -[CPLFileStorageItem init](&v33, sel_init);
  v15 = v14;
  if (v14)
  {
    if (v12)
    {
      objc_storeStrong((id *)&v14->_identity, a3);
      objc_msgSend(v12, "fingerPrint");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        objc_msgSend(v12, "fileUTI");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v15->_original = a4;
          v15->_markedForDelete = a5;
          v18 = objc_msgSend(v13, "copy");
          lastAccessDate = v15->_lastAccessDate;
          v15->_lastAccessDate = (NSDate *)v18;

          goto LABEL_6;
        }
        if (!_CPLSilentLogging)
        {
          __CPLItemOSLogDomain();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v32 = 0;
            _os_log_impl(&dword_1B03C2000, v31, OS_LOG_TYPE_ERROR, "Can't create a file storage item without a type identifier", v32, 2u);
          }

        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineFileStorage.m");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = CFSTR("Can't create a file storage item without a type identifier");
        v25 = v22;
        v26 = a2;
        v27 = v15;
        v28 = v23;
        v29 = 694;
      }
      else
      {
        if (!_CPLSilentLogging)
        {
          __CPLItemOSLogDomain();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v32 = 0;
            _os_log_impl(&dword_1B03C2000, v30, OS_LOG_TYPE_ERROR, "Can't create a file storage item without an identity finger print", v32, 2u);
          }

        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineFileStorage.m");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = CFSTR("Can't create a file storage item without an identity finger print");
        v25 = v22;
        v26 = a2;
        v27 = v15;
        v28 = v23;
        v29 = 693;
      }
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        __CPLItemOSLogDomain();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_ERROR, "Can't create a file storage item without an identity", v32, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineFileStorage.m");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("Can't create a file storage item without an identity");
      v25 = v22;
      v26 = a2;
      v27 = v15;
      v28 = v23;
      v29 = 690;
    }
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", v26, v27, v28, v29, v24);

    abort();
  }
LABEL_6:

  return v15;
}

- (BOOL)getResourceValue:(id *)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  char v11;

  v8 = a4;
  -[CPLResourceIdentity fileURL](self->_identity, "fileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "getResourceValue:forKey:error:", a3, v8, a5);
  }
  else
  {
    *a3 = 0;
    v11 = 1;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  CPLFileStorageItem *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  char v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;

  v4 = (CPLFileStorageItem *)a3;
  if (v4 == self)
  {
    v7 = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[CPLFileStorageItem isOriginal](self, "isOriginal");
    if (v5 == -[CPLFileStorageItem isOriginal](v4, "isOriginal"))
    {
      v6 = -[CPLFileStorageItem isMarkedForDelete](self, "isMarkedForDelete");
      if (v6 == -[CPLFileStorageItem isMarkedForDelete](v4, "isMarkedForDelete"))
      {
        -[CPLFileStorageItem lastAccessDate](self, "lastAccessDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        -[CPLFileStorageItem lastAccessDate](v4, "lastAccessDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v9)
        {
          if (!v10)
            goto LABEL_5;
          -[CPLFileStorageItem lastAccessDate](self, "lastAccessDate");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[CPLFileStorageItem lastAccessDate](v4, "lastAccessDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if ((v14 & 1) == 0)
            goto LABEL_5;
        }
        else
        {

          if (v11)
            goto LABEL_5;
        }
        -[CPLFileStorageItem identity](self, "identity");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPLFileStorageItem identity](v4, "identity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v15, "isEqual:", v16);

        goto LABEL_7;
      }
    }
  }
LABEL_5:
  v7 = 0;
LABEL_7:

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[CPLFileStorageItem identity](self, "identity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fingerPrint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  return v4;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const char *v9;
  _BOOL4 v10;
  const char *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CPLFileStorageItem identity](self, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fingerPrint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLFileStorageItem identity](self, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fileUTI");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CPLFileStorageItem isOriginal](self, "isOriginal"))
    v9 = " [original]";
  else
    v9 = "";
  v10 = -[CPLFileStorageItem isMarkedForDelete](self, "isMarkedForDelete");
  v11 = " [to be deleted]";
  if (!v10)
    v11 = "";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ [%@ %@]%s%s>"), v4, v6, v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (CPLResourceIdentity)identity
{
  return self->_identity;
}

- (BOOL)isOriginal
{
  return self->_original;
}

- (BOOL)isMarkedForDelete
{
  return self->_markedForDelete;
}

- (NSDate)lastAccessDate
{
  return self->_lastAccessDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAccessDate, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
