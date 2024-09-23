@implementation FlexMobileAssetV2SongAsset

- (FlexMobileAssetV2SongAsset)initWithAssetID:(id)a3 localURL:(id)a4 cloudManager:(id)a5 contentVersion:(int64_t)a6 compatibilityVersion:(int64_t)a7
{
  FlexMobileAssetV2SongAsset *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  FlexMobileAssetV2SongAsset *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)FlexMobileAssetV2SongAsset;
  v9 = -[FlexCloudSongAsset initWithAssetID:assetStatus:localURL:cloudManager:contentVersion:compatibilityVersion:](&v18, sel_initWithAssetID_assetStatus_localURL_cloudManager_contentVersion_compatibilityVersion_, a3, a4 == 0, a4, a5, a6, a7);
  v13 = v9;
  if (v9)
  {
    objc_msgSend_setNewestContentVersion_(v9, v10, a6, v11, v12);
    objc_msgSend_setNewestCompatibilityVersion_(v13, v14, a7, v15, v16);
  }
  return v13;
}

- (int64_t)contentVersionForAssetLocation:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 1)
    return objc_msgSend_newestContentVersion(self, a2, 1, v3, v4);
  if (a3)
    return 0;
  return objc_msgSend_contentVersion(self, a2, 0, v3, v4);
}

- (int64_t)compatibilityVersionForAssetLocation:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3 == 1)
    return objc_msgSend_newestCompatibilityVersion(self, a2, 1, v3, v4);
  if (a3)
    return 0;
  return objc_msgSend_compatibilityVersion(self, a2, 0, v3, v4);
}

- (unint64_t)assetStatus
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  char isKindOfClass;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  char isDownloadingAsset;
  void *v21;

  objc_msgSend_cloudManager(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_6;
  objc_msgSend_cloudManager(self, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend__isPurgingAsset_(v12, v13, (uint64_t)self, v14, v15))
  {

    return 4;
  }
  isDownloadingAsset = objc_msgSend__isDownloadingAsset_(v12, v16, (uint64_t)self, v17, v18);

  if ((isDownloadingAsset & 1) != 0)
    return 2;
LABEL_6:
  objc_msgSend_localURL(self, v8, v9, v10, v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21 == 0;
}

- (BOOL)contentUpdateAvailable
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_msgSend_contentVersionForAssetLocation_(self, a2, 0, v2, v3);
  return objc_msgSend_contentVersionForAssetLocation_(self, v6, 1, v7, v8) > v5;
}

- (int64_t)newestContentVersion
{
  return self->_newestContentVersion;
}

- (void)setNewestContentVersion:(int64_t)a3
{
  self->_newestContentVersion = a3;
}

- (int64_t)newestCompatibilityVersion
{
  return self->_newestCompatibilityVersion;
}

- (void)setNewestCompatibilityVersion:(int64_t)a3
{
  self->_newestCompatibilityVersion = a3;
}

@end
