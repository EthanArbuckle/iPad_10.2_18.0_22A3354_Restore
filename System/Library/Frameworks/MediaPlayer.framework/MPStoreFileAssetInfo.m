@implementation MPStoreFileAssetInfo

- (MPStoreFileAssetInfo)initWithiTunesCloudStoreFileAssetInfo:(id)a3
{
  id v5;
  MPStoreFileAssetInfo *v6;
  MPStoreFileAssetInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPStoreFileAssetInfo;
  v6 = -[MPStoreFileAssetInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_internalInfo, a3);

  return v7;
}

- (NSURL)assetURL
{
  return (NSURL *)-[ICStoreFileAssetInfo assetURL](self->_internalInfo, "assetURL");
}

- (NSString)downloadKey
{
  return (NSString *)-[ICStoreFileAssetInfo downloadKey](self->_internalInfo, "downloadKey");
}

- (NSArray)fairPlayInfoList
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  MPStoreFileAssetFairPlayInfo *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[ICStoreFileAssetInfo fairPlayInfoList](self->_internalInfo, "fairPlayInfoList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = -[MPStoreFileAssetFairPlayInfo initWithiTunesCloudStoreFileAssetFairPlayInfo:]([MPStoreFileAssetFairPlayInfo alloc], "initWithiTunesCloudStoreFileAssetFairPlayInfo:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
        if (v8)
        {
          if (!v5)
            v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v5, "addObject:", v8);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return (NSArray *)v5;
}

- (int64_t)flavorType
{
  int64_t result;
  int64_t v3;

  result = -[ICStoreFileAssetInfo flavorType](self->_internalInfo, "flavorType");
  if (result > 200)
  {
    if (result != 203)
    {
      if (result == 201)
        v3 = 201;
      else
        v3 = 0;
      if (result != 202)
        return v3;
    }
  }
  else
  {
    switch(result)
    {
      case 'e':
      case 'f':
      case 'g':
      case 'h':
        return result;
      default:
        result = 0;
        break;
    }
  }
  return result;
}

- (NSString)fileExtension
{
  return (NSString *)-[ICStoreFileAssetInfo fileExtension](self->_internalInfo, "fileExtension");
}

- (unint64_t)fileSize
{
  return -[ICStoreFileAssetInfo fileSize](self->_internalInfo, "fileSize");
}

- (NSData)md5
{
  return (NSData *)-[ICStoreFileAssetInfo md5](self->_internalInfo, "md5");
}

- (int64_t)protectionType
{
  int64_t result;

  result = -[ICStoreFileAssetInfo protectionType](self->_internalInfo, "protectionType");
  if ((unint64_t)(result - 1) >= 4)
    return 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalInfo, 0);
}

@end
