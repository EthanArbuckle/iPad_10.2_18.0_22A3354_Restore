@implementation FlexCloudSongAsset

- (FlexCloudSongAsset)initWithAssetID:(id)a3 assetStatus:(unint64_t)a4 localURL:(id)a5 cloudManager:(id)a6 contentVersion:(int64_t)a7 compatibilityVersion:(int64_t)a8
{
  id v14;
  FlexCloudSongAsset *v15;
  FlexCloudSongAsset *v16;
  objc_super v18;

  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)FlexCloudSongAsset;
  v15 = -[FMSongAsset initWithAssetID:assetStatus:localURL:contentVersion:compatibilityVersion:](&v18, sel_initWithAssetID_assetStatus_localURL_contentVersion_compatibilityVersion_, a3, a4, a5, a7, a8);
  v16 = v15;
  if (v15)
    objc_storeWeak((id *)&v15->_cloudManager, v14);

  return v16;
}

- (BOOL)isCloudBacked
{
  return 1;
}

- (void)requestDownload
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = (id)objc_opt_new();
  objc_msgSend_requestDownloadWithOptions_(self, v3, (uint64_t)v6, v4, v5);

}

- (void)requestDownloadWithOptions:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  if (objc_msgSend_assetStatus(self, v4, v5, v6, v7) == 1
    || objc_msgSend_assetStatus(self, v8, v9, v10, v11) == 4
    || objc_msgSend_contentUpdateAvailable(self, v8, v9, v10, v11))
  {
    objc_msgSend_cloudManager(self, v8, v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_requestDownloadOfAsset_withOptions_(v12, v13, (uint64_t)self, (uint64_t)v15, v14);

  }
}

- (void)cancelDownload
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  if (objc_msgSend_assetStatus(self, a2, v2, v3, v4) == 2 || objc_msgSend_assetStatus(self, v6, v7, v8, v9) == 3)
  {
    objc_msgSend_cloudManager(self, v6, v7, v8, v9);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cancelDownloadOfAsset_(v13, v10, (uint64_t)self, v11, v12);

  }
}

- (void)purgeLocalCache
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  if (objc_msgSend_assetStatus(self, a2, v2, v3, v4) != 1 && objc_msgSend_assetStatus(self, v6, v7, v8, v9) != 4)
  {
    objc_msgSend_cloudManager(self, v10, v11, v12, v13);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_requestPurgeOfAsset_(v17, v14, (uint64_t)self, v15, v16);

  }
}

- (unint64_t)assetStatus
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  objc_msgSend_cloudManager(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_assetStatus_(v6, v7, (uint64_t)self, v8, v9);

  return v10;
}

- (BOOL)contentUpdateAvailable
{
  return 0;
}

- (int64_t)contentVersionForAssetLocation:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 1)
    return objc_msgSend_contentVersion(self, a2, 1, v3, v4);
  else
    return 0;
}

- (int64_t)compatibilityVersionForAssetLocation:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 1)
    return objc_msgSend_compatibilityVersion(self, a2, 1, v3, v4);
  else
    return 0;
}

- (FlexCloudManager)cloudManager
{
  return (FlexCloudManager *)objc_loadWeakRetained((id *)&self->_cloudManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cloudManager);
}

@end
