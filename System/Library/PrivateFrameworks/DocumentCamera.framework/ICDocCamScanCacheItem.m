@implementation ICDocCamScanCacheItem

- (ICDocCamScanCacheItem)init
{

  return 0;
}

- (ICDocCamScanCacheItem)initWithImageCache:(id)a3 docInfos:(id)a4
{
  id v7;
  id v8;
  ICDocCamScanCacheItem *v9;
  ICDocCamScanCacheItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICDocCamScanCacheItem;
  v9 = -[ICDocCamScanCacheItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imageCache, a3);
    objc_storeStrong((id *)&v10->_docInfos, a4);
  }

  return v10;
}

- (id)docInfoForScanDataDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ICDocCamScanCacheItem docInfos](self, "docInfos", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "scanDataDelegateIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)imageForScanDataDelegateIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[ICDocCamScanCacheItem docInfoForScanDataDelegate:](self, "docInfoForScanDataDelegate:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "croppedAndFilteredImageUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ICDocCamScanCacheItem imageCache](self, "imageCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getImage:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)deleteCacheImages
{
  OUTLINED_FUNCTION_1_2(&dword_20CE8E000, a1, a3, "ICDocCamScanCache deleteCacheImages", a5, a6, a7, a8, 0);
}

- (void)doneBuildingCache
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__ICDocCamScanCacheItem_doneBuildingCache__block_invoke;
  block[3] = &unk_24C5B7AE0;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x24BDAC9B8], block);
}

void __42__ICDocCamScanCacheItem_doneBuildingCache__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  +[ICDocCamScanCache cachedItem](ICDocCamScanCache, "cachedItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);

  if (v2 == v3)
  {
    v4 = os_log_create("com.apple.documentcamera", ");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __42__ICDocCamScanCacheItem_doneBuildingCache__block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

    +[ICDocCamScanCache setCachedItem:](ICDocCamScanCache, "setCachedItem:", 0);
  }
}

- (ICDocCamImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (NSArray)docInfos
{
  return self->_docInfos;
}

- (void)setDocInfos:(id)a3
{
  objc_storeStrong((id *)&self->_docInfos, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_docInfos, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

void __42__ICDocCamScanCacheItem_doneBuildingCache__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_20CE8E000, a1, a3, "ICDocCamScanCache doneBuildingCache", a5, a6, a7, a8, 0);
}

@end
