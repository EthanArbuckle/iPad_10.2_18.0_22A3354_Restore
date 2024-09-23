@implementation FCResource

- (FCResource)initWithPermanentURLForResourceID:(id)a3 cacheLifetimeHint:(int64_t)a4 contentContext:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  FCResource *v14;

  v8 = a5;
  v9 = a3;
  objc_msgSend(v8, "assetManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internalContentContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "contentDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assetHandleForRecordID:field:lifetimeHint:contentDatabase:", v9, 3, a4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[FCResource initWithResourceID:assetHandle:fetchDate:](self, "initWithResourceID:assetHandle:fetchDate:", v9, v13, 0);
  return v14;
}

- (FCResource)initWithResourceID:(id)a3 assetHandle:(id)a4 fetchDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  FCResource *v12;
  FCResource *v13;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "assetHandle != nil");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCResource initWithResourceID:assetHandle:fetchDate:]";
    v19 = 2080;
    v20 = "FCResource.m";
    v21 = 1024;
    v22 = 44;
    v23 = 2114;
    v24 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v16.receiver = self;
  v16.super_class = (Class)FCResource;
  v12 = -[FCResource init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_resourceID, a3);
    objc_storeStrong((id *)&v13->_assetHandle, a4);
    objc_storeStrong((id *)&v13->_fetchDate, a5);
  }

  return v13;
}

- (NSURL)fileURL
{
  void *v2;
  void *v3;

  -[FCResource assetHandle](self, "assetHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (FCAssetHandle)assetHandle
{
  return self->_assetHandle;
}

- (FCResource)initWithRecord:(id)a3 interestToken:(id)a4 assetManager:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  FCResource *v22;
  FCResource *v24;
  id v25;
  id v26;

  v24 = self;
  v8 = a3;
  v26 = a4;
  v9 = a5;
  objc_msgSend(v8, "base");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "url");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v8, "base");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "cacheLifetimeHint");
    if (v14 == 2)
      v15 = 2;
    else
      v15 = v14 == 1;
    objc_msgSend(v9, "assetHandleForCKAssetURLString:lifetimeHint:", v12, v15, v24, v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  v17 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v8, "base", v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "fetchDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dateWithPBDate:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_msgSend(v25, "initWithResourceID:assetHandle:fetchDate:", v11, v16, v20);
  v22 = (FCResource *)v21;
  if (v21)
  {
    objc_storeStrong((id *)(v21 + 32), a3);
    objc_storeStrong((id *)&v22->_interestToken, a4);
  }

  return v22;
}

- (NSString)resourceID
{
  return self->_resourceID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interestToken, 0);
  objc_storeStrong((id *)&self->_resourceRecord, 0);
  objc_storeStrong((id *)&self->_fetchDate, 0);
  objc_storeStrong((id *)&self->_assetHandle, 0);
  objc_storeStrong((id *)&self->_resourceID, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (v6)
  {
    -[FCResource resourceID](self, "resourceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resourceID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[FCResource resourceID](self, "resourceID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isOnDisk
{
  void *v2;
  void *v3;
  BOOL v4;

  -[FCResource assetHandle](self, "assetHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (FCContentArchive)contentArchive
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__FCResource_contentArchive__block_invoke;
  v5[3] = &unk_1E463AA30;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCContentArchive archiveWithChildArchives:](FCContentArchive, "archiveWithChildArchives:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (FCContentArchive *)v3;
}

void __28__FCResource_contentArchive__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "resourceRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FCContentArchive archiveWithRecord:](FCContentArchive, "archiveWithRecord:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v6);

  objc_msgSend(*(id *)(a1 + 32), "assetHandle");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentArchive");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v7);

}

- (FCContentManifest)contentManifest
{
  FCContentManifest *v3;
  void *v4;
  FCContentManifest *v5;
  _QWORD v7[5];

  v3 = [FCContentManifest alloc];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__FCResource_contentManifest__block_invoke;
  v7[3] = &unk_1E463AA30;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FCContentManifest initWithManifests:](v3, "initWithManifests:", v4);

  return v5;
}

void __29__FCResource_contentManifest__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "resourceRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "base");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentManifest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v7);

  objc_msgSend(*(id *)(a1 + 32), "assetHandle");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentManifest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fc_safelyAddObject:", v8);

}

- (NSDate)fetchDate
{
  return self->_fetchDate;
}

- (NTPBResourceRecord)resourceRecord
{
  return self->_resourceRecord;
}

- (void)setResourceRecord:(id)a3
{
  objc_storeStrong((id *)&self->_resourceRecord, a3);
}

- (FCInterestToken)interestToken
{
  return self->_interestToken;
}

- (void)setInterestToken:(id)a3
{
  objc_storeStrong((id *)&self->_interestToken, a3);
}

@end
