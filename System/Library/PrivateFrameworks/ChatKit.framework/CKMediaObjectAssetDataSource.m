@implementation CKMediaObjectAssetDataSource

- (CKMediaObjectAssetDataSource)initWithChatItems:(id)a3 parentChatItemGUID:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  CKMediaObjectAssetDataSource *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;

  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __69__CKMediaObjectAssetDataSource_initWithChatItems_parentChatItemGUID___block_invoke;
  v18 = &unk_1E2759A80;
  v19 = v9;
  v20 = v10;
  v11 = v10;
  v12 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v15);
  v13 = -[CKMediaObjectAssetDataSource initWithChatItems:parentChatItemGUID:displayAssets:chatItemGUIDMap:](self, "initWithChatItems:parentChatItemGUID:displayAssets:chatItemGUIDMap:", v8, v7, v12, v11, v15, v16, v17, v18);

  return v13;
}

void __69__CKMediaObjectAssetDataSource_initWithChatItems_parentChatItemGUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  CKMediaObjectBackedAsset *v7;

  v3 = a2;
  v7 = -[CKMediaObjectBackedAsset initWithChatItem:]([CKMediaObjectBackedAsset alloc], "initWithChatItem:", v3);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  v4 = *(void **)(a1 + 40);
  objc_msgSend(v3, "IMChatItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "guid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v3, v6);

}

- (CKMediaObjectAssetDataSource)initWithChatItems:(id)a3 parentChatItemGUID:(id)a4 displayAssets:(id)a5 chatItemGUIDMap:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CKMediaObjectAssetDataSource *v14;
  CKMediaObjectAssetDataSource *v15;
  void *v16;
  void *v17;
  CKMediaObjectAssetCollection *v18;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CKMediaObjectAssetDataSource;
  v14 = -[CKMediaObjectAssetDataSource init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    -[CKMediaObjectAssetDataSource setParentChatItemGUID:](v14, "setParentChatItemGUID:", v11);
    -[CKMediaObjectAssetDataSource setChatItems:](v15, "setChatItems:", v10);
    v16 = (void *)objc_msgSend(v13, "copy");
    -[CKMediaObjectAssetDataSource setChatItemGUIDMap:](v15, "setChatItemGUIDMap:", v16);

    v17 = (void *)objc_msgSend(v12, "copy");
    -[CKMediaObjectAssetDataSource setDisplayAssets:](v15, "setDisplayAssets:", v17);

    v18 = objc_alloc_init(CKMediaObjectAssetCollection);
    -[CKMediaObjectAssetDataSource setAssetCollection:](v15, "setAssetCollection:", v18);

  }
  return v15;
}

- (id)copyRefreshingAssetsAtIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  CKMediaObjectAssetDataSource *v10;
  void *v11;
  void *v12;
  CKMediaObjectAssetDataSource *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;
  id v20;

  v4 = a3;
  -[CKMediaObjectAssetDataSource chatItems](self, "chatItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMediaObjectAssetDataSource displayAssets](self, "displayAssets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __62__CKMediaObjectAssetDataSource_copyRefreshingAssetsAtIndexes___block_invoke;
  v18 = &unk_1E274E480;
  v19 = v5;
  v20 = v7;
  v8 = v7;
  v9 = v5;
  objc_msgSend(v4, "enumerateIndexesUsingBlock:", &v15);

  v10 = [CKMediaObjectAssetDataSource alloc];
  -[CKMediaObjectAssetDataSource parentChatItemGUID](self, "parentChatItemGUID", v15, v16, v17, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMediaObjectAssetDataSource chatItemGUIDMap](self, "chatItemGUIDMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CKMediaObjectAssetDataSource initWithChatItems:parentChatItemGUID:displayAssets:chatItemGUIDMap:](v10, "initWithChatItems:parentChatItemGUID:displayAssets:chatItemGUIDMap:", v9, v11, v8, v12);

  return v13;
}

void __62__CKMediaObjectAssetDataSource_copyRefreshingAssetsAtIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  CKMediaObjectBackedAsset *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[CKMediaObjectBackedAsset initWithChatItem:]([CKMediaObjectBackedAsset alloc], "initWithChatItem:", v5);
  objc_msgSend(*(id *)(a1 + 40), "replaceObjectAtIndex:withObject:", a2, v4);

}

- (NSArray)mediaObjects
{
  NSArray *mediaObjects;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSArray *v9;
  NSArray *v10;
  _QWORD v12[4];
  id v13;

  mediaObjects = self->_mediaObjects;
  if (!mediaObjects)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
    -[CKMediaObjectAssetDataSource chatItems](self, "chatItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

    -[CKMediaObjectAssetDataSource chatItems](self, "chatItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __44__CKMediaObjectAssetDataSource_mediaObjects__block_invoke;
    v12[3] = &unk_1E2754978;
    v13 = v6;
    v8 = v6;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

    v9 = (NSArray *)objc_msgSend(v8, "copy");
    v10 = self->_mediaObjects;
    self->_mediaObjects = v9;

    mediaObjects = self->_mediaObjects;
  }
  return mediaObjects;
}

void __44__CKMediaObjectAssetDataSource_mediaObjects__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "mediaObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (NSURL)momentShareURL
{
  NSURL *momentShareURL;
  void *v4;
  NSURL *v5;
  NSURL *v6;

  momentShareURL = self->_momentShareURL;
  if (!momentShareURL)
  {
    if (self->_hasCheckedForMomentShareURL)
    {
      momentShareURL = 0;
    }
    else
    {
      self->_hasCheckedForMomentShareURL = 1;
      -[CKMediaObjectAssetDataSource mediaObjects](self, "mediaObjects");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      CKMomentShareURLForMediaObjects(v4);
      v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
      v6 = self->_momentShareURL;
      self->_momentShareURL = v5;

      momentShareURL = self->_momentShareURL;
    }
  }
  return momentShareURL;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)assetTypeCounts
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = self;
  v19 = *MEMORY[0x1E0C80C00];
  if (!BYTE1(self[5].var2))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[$F99D9A4FB75BC57F3386B8DC8EE08D7A displayAssets](self, "displayAssets", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v5);
          v13 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "mediaType");
          if (v13 == 2)
          {
            ++v8;
          }
          else if (v13 == 1)
          {
            ++v10;
          }
          else
          {
            ++v9;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
    }

    v3[8].var1 = v10;
    v3[8].var2 = v8;
    v3[9].var0 = v9;
    BYTE1(v3[5].var2) = 1;
  }
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&v3[8].var1;
  retstr->var2 = v3[9].var0;
  return self;
}

- (id)assetReferenceForMediaObject:(id)a3
{
  _OWORD v5[2];
  __int128 v6;
  __int128 v7;

  v6 = 0u;
  v7 = 0u;
  -[CKMediaObjectAssetDataSource _indexPathForMediaObject:](self, "_indexPathForMediaObject:", a3);
  if (!*MEMORY[0x1E0D7C2D8])
    return 0;
  v5[0] = v6;
  v5[1] = v7;
  -[CKMediaObjectAssetDataSource assetReferenceAtItemIndexPath:](self, "assetReferenceAtItemIndexPath:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)chatItemForAssetReference:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "indexPath");
    v6 = v16;
  }
  else
  {
    v6 = 0;
    v15 = 0u;
    v16 = 0u;
  }
  -[CKMediaObjectAssetDataSource chatItems](self, "chatItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 >= v8)
  {
    v11 = 0;
  }
  else
  {
    -[CKMediaObjectAssetDataSource chatItems](self, "chatItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v5, "indexPath");
      v10 = v14;
    }
    else
    {
      v10 = 0;
      v13 = 0u;
      v14 = 0u;
    }
    objc_msgSend(v9, "objectAtIndex:", v10, v13, v14, v15, v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)chatItemForAsset:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__72;
    v17 = __Block_byref_object_dispose__72;
    v18 = 0;
    -[CKMediaObjectAssetDataSource chatItems](self, "chatItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __49__CKMediaObjectAssetDataSource_chatItemForAsset___block_invoke;
    v10[3] = &unk_1E27589B8;
    v7 = v5;
    v11 = v7;
    v12 = &v13;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

    v8 = (id)v14[5];
    _Block_object_dispose(&v13, 8);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __49__CKMediaObjectAssetDataSource_chatItemForAsset___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "mediaObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transfer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributionInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D37F40]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v10, "isEqualToString:", v11);

  if ((_DWORD)v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)temporaryChatItemForAssetReference:(id)a3
{
  id v4;
  CKTransientAttachmentMessagePartChatItem *v5;
  void *v6;
  CKTransientAttachmentMessagePartChatItem *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CKTransientFileTransfer *v17;
  CKMediaObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [CKTransientAttachmentMessagePartChatItem alloc];
  -[CKMediaObjectAssetDataSource parentChatItemGUID](self, "parentChatItemGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CKTransientAttachmentMessagePartChatItem initWithParentChatItem:](v5, "initWithParentChatItem:", v6);

  v24[0] = *MEMORY[0x1E0D37F40];
  objc_msgSend(v4, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v9;
  v24[1] = *MEMORY[0x1E0D37F68];
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[CKMediaObjectAssetDataSource chatItems](self, "chatItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "message");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fileTransferGUIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[CKTransientFileTransfer initWithAttributionInfo:]([CKTransientFileTransfer alloc], "initWithAttributionInfo:", v16);
  v18 = -[CKMediaObject initWithTransfer:context:forceInlinePreview:]([CKMediaObject alloc], "initWithTransfer:context:forceInlinePreview:", v17, 0, 0);
  -[CKAttachmentMessagePartChatItem setMediaObject:](v7, "setMediaObject:", v18);
  -[CKMediaObjectAssetDataSource chatItems](self, "chatItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "message");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "guid");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKTransientAttachmentMessagePartChatItem setParentGUID:](v7, "setParentGUID:", v22);

  return v7;
}

- (PXSimpleIndexPath)_indexPathForMediaObject:(SEL)a3
{
  __int128 v6;
  id v7;
  void *v8;
  int64_t v9;
  PXSimpleIndexPath *result;

  v6 = *(_OWORD *)(MEMORY[0x1E0D7C820] + 16);
  *(_OWORD *)&retstr->dataSourceIdentifier = *MEMORY[0x1E0D7C820];
  *(_OWORD *)&retstr->item = v6;
  v7 = a4;
  -[CKMediaObjectAssetDataSource mediaObjects](self, "mediaObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfObject:", v7);

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    result = (PXSimpleIndexPath *)-[CKMediaObjectAssetDataSource identifier](self, "identifier");
    retstr->dataSourceIdentifier = (int64_t)result;
    retstr->section = 0;
    retstr->item = v9;
    retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  NSObject *v4;
  id v5;
  void *v7;
  int64_t v8;
  int v9;
  id v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v9 = 138412802;
        v10 = (id)objc_opt_class();
        v11 = 2080;
        v12 = "-[CKMediaObjectAssetDataSource numberOfItemsInSection:]";
        v13 = 2048;
        v14 = a3;
        v5 = v10;
        _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "%@ %s asked for section %ld, does not exist!", (uint8_t *)&v9, 0x20u);

      }
    }
    return 0;
  }
  else
  {
    -[CKMediaObjectAssetDataSource mediaObjects](self, "mediaObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    return v8;
  }
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  NSObject *v4;
  void *v5;
  int64_t section;
  id v7;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3->dataSourceIdentifier != *MEMORY[0x1E0D7C2D8])
  {
    if (a3->item == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (a3->section != 0x7FFFFFFFFFFFFFFFLL)
      {
        -[CKMediaObjectAssetDataSource assetCollection](self, "assetCollection");
        return (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (a3->subitem == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[CKMediaObjectAssetDataSource displayAssets](self, "displayAssets");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", a3->item);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      return v10;
    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (void *)objc_opt_class();
      section = a3->section;
      v11 = 138412802;
      v12 = v5;
      v13 = 2080;
      v14 = "-[CKMediaObjectAssetDataSource objectAtIndexPath:]";
      v15 = 2048;
      v16 = section;
      v7 = v5;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "%@ %s asked for section %ld, does not exist!", (uint8_t *)&v11, 0x20u);

    }
  }
  return 0;
}

- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3
{
  NSObject *v6;
  void *v7;
  int64_t section;
  id v9;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a3->dataSourceIdentifier != *MEMORY[0x1E0D7C2D8]
    && a3->section != 0x7FFFFFFFFFFFFFFFLL
    && a3->item == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CKMediaObjectAssetDataSource displayAssets](self, "displayAssets");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PXDisplayAssetFetchResultFromArray();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return v12;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = (void *)objc_opt_class();
        section = a3->section;
        v13 = 138412802;
        v14 = v7;
        v15 = 2080;
        v16 = "-[CKMediaObjectAssetDataSource objectsInIndexPath:]";
        v17 = 2048;
        v18 = section;
        v9 = v7;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "%@ %s asked for section %ld, does not exist!", (uint8_t *)&v13, 0x20u);

      }
    }
    return 0;
  }
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v6;
  void *v7;
  void *v8;
  PXSimpleIndexPath *result;
  __int128 v10;
  __int128 v11;
  objc_super v12;

  v6 = a4;
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  v12.receiver = self;
  v12.super_class = (Class)CKMediaObjectAssetDataSource;
  -[PXSimpleIndexPath indexPathForObjectReference:](&v12, sel_indexPathForObjectReference_, v6);
  if (retstr->dataSourceIdentifier == *MEMORY[0x1E0D7C2D8])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "asset");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "mediaObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKMediaObjectAssetDataSource _indexPathForMediaObject:](self, "_indexPathForMediaObject:", v8);
        *(_OWORD *)&retstr->dataSourceIdentifier = v10;
        *(_OWORD *)&retstr->item = v11;

      }
    }
  }

  return result;
}

- (NSString)parentChatItemGUID
{
  return self->_parentChatItemGUID;
}

- (void)setParentChatItemGUID:(id)a3
{
  objc_storeStrong((id *)&self->_parentChatItemGUID, a3);
}

- (NSArray)chatItems
{
  return self->_chatItems;
}

- (void)setChatItems:(id)a3
{
  objc_storeStrong((id *)&self->_chatItems, a3);
}

- (NSDictionary)chatItemGUIDMap
{
  return self->_chatItemGUIDMap;
}

- (void)setChatItemGUIDMap:(id)a3
{
  objc_storeStrong((id *)&self->_chatItemGUIDMap, a3);
}

- (NSArray)displayAssets
{
  return self->_displayAssets;
}

- (void)setDisplayAssets:(id)a3
{
  objc_storeStrong((id *)&self->_displayAssets, a3);
}

- (PXDisplayAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void)setAssetCollection:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->_displayAssets, 0);
  objc_storeStrong((id *)&self->_chatItemGUIDMap, 0);
  objc_storeStrong((id *)&self->_chatItems, 0);
  objc_storeStrong((id *)&self->_parentChatItemGUID, 0);
  objc_storeStrong((id *)&self->_mediaObjects, 0);
  objc_storeStrong((id *)&self->_momentShareURL, 0);
}

@end
