@implementation CKMediaItemMaker

- (CKMediaItemMaker)initWithAssetStreamHandle:(id)a3
{
  id v5;
  CKMediaItemMaker *v6;
  CKMediaItemMaker *v7;
  _TtC8CloudKit28CloudAssetsAssetStreamHandle *cloudAssetsAssetStreamHandle;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKMediaItemMaker;
  v6 = -[CKMediaItemMaker init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetStreamHandle, a3);
    cloudAssetsAssetStreamHandle = v7->_cloudAssetsAssetStreamHandle;
    v7->_cloudAssetsAssetStreamHandle = 0;

  }
  return v7;
}

- (CKMediaItemMaker)initWithCloudAssetsAssetStreamHandle:(id)a3
{
  id v5;
  CKMediaItemMaker *v6;
  CKMediaItemMaker *v7;
  _TtC8CloudKit17AssetStreamHandle *assetStreamHandle;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKMediaItemMaker;
  v6 = -[CKMediaItemMaker init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    assetStreamHandle = v6->_assetStreamHandle;
    v6->_assetStreamHandle = 0;

    objc_storeStrong((id *)&v7->_cloudAssetsAssetStreamHandle, a3);
  }

  return v7;
}

- (id)makeAVPlayerItemWithURL:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;

  v6 = a4;
  v7 = a3;
  objc_msgSend_assetStreamHandle(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    objc_msgSend_assetStreamHandle(self, v12, v13, v14);
  else
    objc_msgSend_cloudAssetsAssetStreamHandle(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_makeAVPlayerItemWith_options_(v15, v16, (uint64_t)v7, (uint64_t)v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)makeAVPlayerItemWithURL:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;

  v4 = a3;
  objc_msgSend_assetStreamHandle(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend_assetStreamHandle(self, v9, v10, v11);
  else
    objc_msgSend_cloudAssetsAssetStreamHandle(self, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_makeAVPlayerItemWith_options_(v12, v13, (uint64_t)v4, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)makeAVAssetExportSession:(id)a3 options:(id)a4 presetName:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend_assetStreamHandle(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend_assetStreamHandle(self, v15, v16, v17);
  else
    objc_msgSend_cloudAssetsAssetStreamHandle(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_makeAVAssetExportSessionWith_options_presetName_(v18, v19, (uint64_t)v10, (uint64_t)v9, v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (CKMediaItemMaker)initWithData:(id)a3 error:(id *)a4
{
  id v6;
  CKMediaItemMaker *v7;
  _TtC8CloudKit17AssetStreamHandle *v8;
  const char *v9;
  uint64_t v10;
  _TtC8CloudKit17AssetStreamHandle *assetStreamHandle;
  _TtC8CloudKit28CloudAssetsAssetStreamHandle *cloudAssetsAssetStreamHandle;
  _TtC8CloudKit28CloudAssetsAssetStreamHandle *v13;
  const char *v14;
  uint64_t v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKMediaItemMaker;
  v7 = -[CKMediaItemMaker init](&v17, sel_init);
  if (v7)
  {
    v8 = [_TtC8CloudKit17AssetStreamHandle alloc];
    v10 = objc_msgSend_initFrom_error_(v8, v9, (uint64_t)v6, (uint64_t)a4);
    assetStreamHandle = v7->_assetStreamHandle;
    v7->_assetStreamHandle = (_TtC8CloudKit17AssetStreamHandle *)v10;

    if (v7->_assetStreamHandle)
    {
      cloudAssetsAssetStreamHandle = v7->_cloudAssetsAssetStreamHandle;
      v7->_cloudAssetsAssetStreamHandle = 0;
    }
    else
    {
      v13 = [_TtC8CloudKit28CloudAssetsAssetStreamHandle alloc];
      v15 = objc_msgSend_initFrom_error_(v13, v14, (uint64_t)v6, (uint64_t)a4);
      cloudAssetsAssetStreamHandle = v7->_cloudAssetsAssetStreamHandle;
      v7->_cloudAssetsAssetStreamHandle = (_TtC8CloudKit28CloudAssetsAssetStreamHandle *)v15;
    }

  }
  return v7;
}

- (id)dataRepresentationWithError:(id *)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;

  objc_msgSend_assetStreamHandle(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend_assetStreamHandle(self, v7, v8, v9);
  else
    objc_msgSend_cloudAssetsAssetStreamHandle(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serializedDataAndReturnError_(v10, v11, (uint64_t)a3, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (_TtC8CloudKit17AssetStreamHandle)assetStreamHandle
{
  return self->_assetStreamHandle;
}

- (_TtC8CloudKit28CloudAssetsAssetStreamHandle)cloudAssetsAssetStreamHandle
{
  return self->_cloudAssetsAssetStreamHandle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudAssetsAssetStreamHandle, 0);
  objc_storeStrong((id *)&self->_assetStreamHandle, 0);
}

@end
