@implementation CPLChangedRecordView

- (Class)recordClass
{
  void *v2;
  void *v3;

  -[CPLChangedRecordView change](self, "change");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (CPLChangedRecordView)initWithChange:(id)a3 overRecordView:(id)a4
{
  id v8;
  id v9;
  CPLChangedRecordView *v10;
  CPLChangedRecordView *v11;
  NSObject *v13;
  id v14;
  void *v15;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "isDelete"))
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v19 = (id)objc_opt_class();
        v20 = 2112;
        v21 = v8;
        v14 = v19;
        _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_ERROR, "Should not create a %@ with %@", buf, 0x16u);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLChangedRecordStorageView.m");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v16, 37, CFSTR("Should not create a %@ with %@"), objc_opt_class(), v8);

    abort();
  }
  v17.receiver = self;
  v17.super_class = (Class)CPLChangedRecordView;
  v10 = -[CPLChangedRecordView init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_baseRecordView, a4);
    objc_storeStrong((id *)&v11->_change, a3);
  }

  return v11;
}

- (id)scopedIdentifier
{
  return -[CPLRecordChange scopedIdentifier](self->_change, "scopedIdentifier");
}

- (id)synthesizedRecord
{
  _BOOL4 v4;
  CPLRecordChange *change;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = -[CPLRecordChange isFullRecord](self->_change, "isFullRecord");
  change = self->_change;
  if (v4)
    return change;
  v7 = -[CPLRecordChange changeType](change, "changeType");
  v8 = -[CPLRecordChange fullChangeTypeForFullRecord](self->_change, "fullChangeTypeForFullRecord");
  if ((v8 & ~v7) != 0)
  {
    v10 = v8;
    -[CPLRecordView synthesizedRecord](self->_baseRecordView, "synthesizedRecord");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isFullRecord") & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        __CPLGenericOSLogDomain();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v11;
          _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_ERROR, "%@ should be a full record", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLChangedRecordStorageView.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v15, 63, CFSTR("%@ should be a full record"), v11);

      abort();
    }
    v12 = (void *)objc_msgSend(v11, "copyChangeType:", v10 & ~v7);
    objc_msgSend(v12, "applyChange:", self->_change);
    objc_msgSend(v12, "setChangeType:", 0);

    return v12;
  }
  else
  {
    v9 = (void *)-[CPLRecordChange copy](self->_change, "copy");
    objc_msgSend(v9, "setChangeType:", 0);
    return v9;
  }
}

- (id)placeholderRecord
{
  CPLPlaceholderRecord *v3;

  if (-[CPLRecordChange hasChangeType:](self->_change, "hasChangeType:", 2))
  {
    v3 = -[CPLPlaceholderRecord initWithRecord:]([CPLPlaceholderRecord alloc], "initWithRecord:", self->_change);
  }
  else
  {
    -[CPLRecordView placeholderRecord](self->_baseRecordView, "placeholderRecord");
    v3 = (CPLPlaceholderRecord *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)changeForType:(unint64_t)a3
{
  _BOOL4 v5;
  CPLRecordChange *change;
  CPLRecordChange *v7;
  unint64_t v8;
  CPLRecordChange *v9;
  void *v11;

  if (a3)
  {
    v5 = -[CPLRecordChange isFullRecord](self->_change, "isFullRecord");
    change = self->_change;
    if (v5)
    {
      v7 = change;
    }
    else
    {
      v8 = -[CPLRecordChange changeType](change, "changeType") & a3;
      if (v8)
      {
        if (v8 != a3)
        {
          -[CPLRecordView changeForType:](self->_baseRecordView, "changeForType:", v8 ^ a3);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (CPLRecordChange *)objc_msgSend(v11, "copy");

          -[CPLRecordChange applyChangeType:fromChange:](v9, "applyChangeType:fromChange:", v8, self->_change);
          return v9;
        }
        v7 = self->_change;
      }
      else
      {
        -[CPLRecordView changeForType:](self->_baseRecordView, "changeForType:", a3);
        v7 = (CPLRecordChange *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    -[CPLChangedRecordView synthesizedRecord](self, "synthesizedRecord");
    v7 = (CPLRecordChange *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v7;
  return v9;
}

- (id)recordChangeData
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[CPLRecordChange recordChangeData](self->_change, "recordChangeData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[CPLRecordView recordChangeData](self->_baseRecordView, "recordChangeData");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)sharingRecordChangeData
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[CPLRecordChange sharingRecordChangeData](self->_change, "sharingRecordChangeData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[CPLRecordView sharingRecordChangeData](self->_baseRecordView, "sharingRecordChangeData");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@+[%@]"), self->_baseRecordView, self->_change);
}

- (id)redactedDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[CPLRecordView redactedDescription](self->_baseRecordView, "redactedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPLRecordChange redactedDescription](self->_change, "redactedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@+[%@]"), v4, v5);

  return v6;
}

- (CPLRecordView)baseRecordView
{
  return self->_baseRecordView;
}

- (CPLRecordChange)change
{
  return self->_change;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_change, 0);
  objc_storeStrong((id *)&self->_baseRecordView, 0);
}

@end
