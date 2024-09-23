@implementation FMSongAsset

- (FMSongAsset)initWithAssetID:(id)a3 assetStatus:(unint64_t)a4 localURL:(id)a5 contentVersion:(int64_t)a6 compatibilityVersion:(int64_t)a7
{
  id v13;
  id v14;
  FMSongAsset *v15;
  FMSongAsset *v16;
  objc_super v18;

  v13 = a3;
  v14 = a5;
  v18.receiver = self;
  v18.super_class = (Class)FMSongAsset;
  v15 = -[FMSongAsset init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_assetID, a3);
    v16->_assetStatus = a4;
    objc_storeStrong((id *)&v16->_localURL, a5);
    v16->_downloadProgress = 0.0;
    v16->_contentVersion = a6;
    v16->_compatibilityVersion = a7;
  }

  return v16;
}

- (FMSongAsset)initWithURL:(id)a3 assetID:(id)a4 contentVersion:(int64_t)a5 compatibilityVersion:(int64_t)a6
{
  return (FMSongAsset *)objc_msgSend_initWithAssetID_assetStatus_localURL_contentVersion_compatibilityVersion_(self, a2, (uint64_t)a4, 0, (uint64_t)a3, a5, a6);
}

- (BOOL)isCloudBacked
{
  return 0;
}

- (BOOL)localURLExists
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  objc_msgSend_localURL(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return 0;
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localURL(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_path(v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_fileExistsAtPath_(v11, v22, (uint64_t)v21, v23, v24);

  return v25;
}

- (BOOL)updateDownloadProgress:(double)a3
{
  FMSongAsset *v4;
  double downloadProgress;
  BOOL v6;

  v4 = self;
  objc_sync_enter(v4);
  downloadProgress = v4->_downloadProgress;
  if (downloadProgress != a3)
    v4->_downloadProgress = a3;
  v6 = downloadProgress != a3;
  objc_sync_exit(v4);

  return v6;
}

- (double)downloadProgress
{
  FMSongAsset *v2;
  double downloadProgress;

  v2 = self;
  objc_sync_enter(v2);
  downloadProgress = v2->_downloadProgress;
  objc_sync_exit(v2);

  return downloadProgress;
}

- (BOOL)contentUpdateAvailable
{
  return 0;
}

- (int64_t)contentVersionForAssetLocation:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
    return 0;
  else
    return objc_msgSend_contentVersion(self, a2, 0, v3, v4);
}

- (int64_t)compatibilityVersionForAssetLocation:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
    return 0;
  else
    return objc_msgSend_compatibilityVersion(self, a2, 0, v3, v4);
}

- (NSString)assetID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)songUID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSongUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)assetStatus
{
  return self->_assetStatus;
}

- (NSURL)localURL
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)contentVersion
{
  return self->_contentVersion;
}

- (int64_t)compatibilityVersion
{
  return self->_compatibilityVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localURL, 0);
  objc_storeStrong((id *)&self->_songUID, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
