@implementation CPLClientCacheRecordView

- (id)relatedScopedIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v8;

  -[CPLClientCacheRecordView cloudRecord](self, "cloudRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relatedScopedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v8 = 0;
    -[CPLClientCacheRecordView idMapping](self, "idMapping");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v4, &v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)secondaryScopedIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v8;

  -[CPLClientCacheRecordView cloudRecord](self, "cloudRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secondaryScopedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v8 = 0;
    -[CPLClientCacheRecordView idMapping](self, "idMapping");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v4, &v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (Class)recordClass
{
  void *v2;
  void *v3;

  -[CPLClientCacheRecordView cloudRecord](self, "cloudRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (id)relation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v11;

  -[CPLClientCacheRecordView cloudRecord](self, "cloudRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerScopedIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v11 = 0;
    -[CPLClientCacheRecordView idMapping](self, "idMapping");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v4, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "relation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContainerIdentifier:", v9);

  }
  else
  {
    objc_msgSend(v3, "relation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (CPLClientCacheRecordView)initWithLocalScopedIdentifier:(id)a3 cloudRecord:(id)a4 idMapping:(id)a5
{
  id v9;
  id v10;
  id v11;
  CPLClientCacheRecordView *v12;
  CPLClientCacheRecordView *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CPLClientCacheRecordView;
  v12 = -[CPLClientCacheRecordView init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_localScopedIdentifier, a3);
    objc_storeStrong((id *)&v13->_cloudRecord, a4);
    objc_storeStrong((id *)&v13->_idMapping, a5);
  }

  return v13;
}

- (CPLScopedIdentifier)localScopedIdentifier
{
  CPLScopedIdentifier *localScopedIdentifier;
  CPLEngineIDMapping *idMapping;
  void *v5;
  CPLScopedIdentifier *v6;
  CPLScopedIdentifier *v7;
  CPLScopedIdentifier *v8;
  CPLScopedIdentifier *v9;
  char v11;

  localScopedIdentifier = self->_localScopedIdentifier;
  if (!localScopedIdentifier)
  {
    v11 = 0;
    idMapping = self->_idMapping;
    -[CPLRecordChange scopedIdentifier](self->_cloudRecord, "scopedIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPLEngineIDMapping localScopedIdentifierForCloudScopedIdentifier:isFinal:](idMapping, "localScopedIdentifierForCloudScopedIdentifier:isFinal:", v5, &v11);
    v6 = (CPLScopedIdentifier *)objc_claimAutoreleasedReturnValue();
    v7 = self->_localScopedIdentifier;
    self->_localScopedIdentifier = v6;

    localScopedIdentifier = self->_localScopedIdentifier;
    if (!localScopedIdentifier)
    {
      -[CPLRecordChange proposedLocalScopedIdentifier](self->_cloudRecord, "proposedLocalScopedIdentifier");
      v8 = (CPLScopedIdentifier *)objc_claimAutoreleasedReturnValue();
      v9 = self->_localScopedIdentifier;
      self->_localScopedIdentifier = v8;

      localScopedIdentifier = self->_localScopedIdentifier;
    }
  }
  return localScopedIdentifier;
}

- (id)synthesizedRecord
{
  CPLRecordChange *cloudRecord;
  CPLEngineIDMapping *idMapping;
  void *v6;
  id v7;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  cloudRecord = self->_cloudRecord;
  idMapping = self->_idMapping;
  v12 = 0;
  -[CPLRecordChange translateToClientChangeUsingIDMapping:error:](cloudRecord, "translateToClientChangeUsingIDMapping:error:", idMapping, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (!v6)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v7;
        _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Failed to remap cloud record to local record: %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStorageViews.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v11, 242, CFSTR("Failed to remap cloud record to local record: %@"), v7);

    abort();
  }
  objc_msgSend(v6, "setRecordChangeData:", 0);
  objc_msgSend(v6, "setSharingRecordChangeData:", 0);

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@+idMapping"), self->_cloudRecord);
}

- (id)redactedDescription
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[CPLRecordChange redactedDescription](self->_cloudRecord, "redactedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@+idMapping"), v4);

  return v5;
}

- (id)recordChangeData
{
  return 0;
}

- (id)sharingRecordChangeData
{
  return 0;
}

- (CPLRecordChange)cloudRecord
{
  return self->_cloudRecord;
}

- (CPLEngineIDMapping)idMapping
{
  return self->_idMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idMapping, 0);
  objc_storeStrong((id *)&self->_cloudRecord, 0);
  objc_storeStrong((id *)&self->_localScopedIdentifier, 0);
}

@end
