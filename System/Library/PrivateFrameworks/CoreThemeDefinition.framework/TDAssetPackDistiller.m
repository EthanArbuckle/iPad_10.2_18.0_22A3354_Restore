@implementation TDAssetPackDistiller

- (TDAssetPackDistiller)initWithDocument:(id)a3 outputPath:(id)a4 versionString:(id)a5 usingAssetPackMapping:(id)a6 attemptIncremental:(BOOL)a7
{
  _BOOL4 v7;
  TDAssetPackDistiller *v11;
  TDAssetPackDistiller *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  Class *v20;
  void *v21;
  NSString *v22;
  TDAssetPackDistiller *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  uint64_t v30;
  char v31;
  _BYTE v32[128];
  uint64_t v33;

  v7 = a7;
  v33 = *MEMORY[0x24BDAC8D0];
  v31 = 0;
  v29.receiver = self;
  v29.super_class = (Class)TDAssetPackDistiller;
  v30 = 0;
  v11 = -[TDDistiller initWithDocument:outputPath:attemptIncremental:versionString:](&v29, sel_initWithDocument_outputPath_attemptIncremental_versionString_, a3, a4, a7, a5);
  v12 = v11;
  if (v11)
  {
    -[TDAssetPackDistiller setAssetPackMap:](v11, "setAssetPackMap:", a6);
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v13 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    if (v13)
    {
      v14 = v13;
      v24 = v12;
      v15 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(a6);
          v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v18 = (void *)objc_msgSend(v17, "outputPath");
          v19 = objc_msgSend(v18, "stringByDeletingLastPathComponent");
          if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "fileExistsAtPath:isDirectory:", v19, &v31) & 1) == 0)
          {
            v30 = 0;
            if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v19, 1, 0, &v30) & 1) == 0)
            {
              v22 = NSStringFromSelector(a2);
              NSLog(CFSTR("-[TDAssetPackDistiller %@ Can't create directory exiting '%@'"), v22, v30);

              return 0;
            }
          }
          v20 = (Class *)off_24EF2B490;
          if (!v7)
            v20 = (Class *)0x24BE28C40;
          v21 = (void *)objc_msgSend(objc_alloc(*v20), "initWithPath:", v18);
          objc_msgSend(v21, "setUuid:", objc_msgSend(a3, "uuid"));
          objc_msgSend(v17, "setAssetStore:", v21);
          objc_msgSend((id)objc_msgSend(v17, "assetStore"), "setExternalTags:", objc_msgSend(v17, "tags"));

        }
        v14 = objc_msgSend(a6, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
        if (v14)
          continue;
        break;
      }
      return v24;
    }
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[TDAssetPackDistiller setAssetPackMap:](self, "setAssetPackMap:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller dealloc](&v3, sel_dealloc);
}

- (id)assetPackForTags:(id)a3
{
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[TDAssetPackDistiller assetPackMap](self, "assetPackMap", 0);
  v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend((id)objc_msgSend(v9, "tags"), "isEqualToSet:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (BOOL)setAsset:(id)a3 withKey:(const _renditionkeytoken *)a4 fromRenditionSpec:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  BOOL v16;
  CUIMutableCommonAssetStorage *assetStore;
  id v18;
  _QWORD v20[5];

  v8 = (void *)MEMORY[0x2276A576C](self, a2);
  v9 = -[TDDistiller _keyDataFromKey:](self, "_keyDataFromKey:", objc_msgSend((id)objc_msgSend(a5, "keySpec"), "key"));
  v10 = (void *)objc_msgSend((id)objc_msgSend(a5, "production"), "tags");
  if (objc_msgSend(v10, "count"))
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __59__TDAssetPackDistiller_setAsset_withKey_fromRenditionSpec___block_invoke;
    v20[3] = &unk_24EF2BF20;
    v20[4] = v11;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v20);
    v12 = -[TDAssetPackDistiller assetPackForTags:](self, "assetPackForTags:", v11);
    v13 = (void *)objc_msgSend(v12, "assetStore");
    if (v13)
    {
      v14 = objc_msgSend(v13, "setAsset:forKey:", a3, v9);
      objc_msgSend(v12, "setWasModified:", 1);
      if (!v14)
      {
        v16 = 0;
        goto LABEL_11;
      }
      if (a3)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C20]), "initWithExternalReference:tags:", objc_msgSend(v12, "assetPackIdentifier"), v11);
        objc_msgSend(v15, "setScaleFactor:", CUIRenditionKeyValueForAttribute());
        objc_msgSend(v15, "setName:", CFSTR("External"));
        v16 = -[CUIMutableCommonAssetStorage setAsset:forKey:](self->super._assetStore, "setAsset:forKey:", objc_msgSend(v15, "CSIRepresentationWithCompression:", 1), v9);

LABEL_11:
        goto LABEL_12;
      }
      assetStore = self->super._assetStore;
      v18 = 0;
    }
    else
    {
      assetStore = self->super._assetStore;
      v18 = a3;
    }
    v16 = -[CUIMutableCommonAssetStorage setAsset:forKey:](assetStore, "setAsset:forKey:", v18, v9);
    goto LABEL_11;
  }
  v16 = -[CUIMutableCommonAssetStorage setAsset:forKey:](self->super._assetStore, "setAsset:forKey:", a3, v9);
LABEL_12:
  objc_autoreleasePoolPop(v8);
  return v16;
}

uint64_t __59__TDAssetPackDistiller_setAsset_withKey_fromRenditionSpec___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(a2, "identifier"));
}

- (void)removeRenditionsFromAssetStoreWithKey:(id)a3
{
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller removeRenditionsFromAssetStoreWithKey:](&v14, sel_removeRenditionsFromAssetStoreWithKey_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = -[TDAssetPackDistiller assetPackMap](self, "assetPackMap", 0);
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "assetStore"), "removeAssetForKey:", a3);
      }
      while (v7 != v9);
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }
}

- (void)setAssetStoreRenditionCount:(unsigned int)a3
{
  uint64_t v3;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller setAssetStoreRenditionCount:](&v14, sel_setAssetStoreRenditionCount_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = -[TDAssetPackDistiller assetPackMap](self, "assetPackMap", 0);
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "assetStore"), "setRenditionCount:", v3);
      }
      while (v7 != v9);
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }
}

- (void)setAssetStoreUuid:(id)a3
{
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller setAssetStoreUuid:](&v14, sel_setAssetStoreUuid_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = -[TDAssetPackDistiller assetPackMap](self, "assetPackMap", 0);
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "assetStore"), "setUuid:", a3);
      }
      while (v7 != v9);
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }
}

- (void)setAssetStoreAssociatedChecksum:(unsigned int)a3
{
  uint64_t v3;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller setAssetStoreAssociatedChecksum:](&v14, sel_setAssetStoreAssociatedChecksum_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = -[TDAssetPackDistiller assetPackMap](self, "assetPackMap", 0);
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "assetStore"), "setAssociatedChecksum:", v3);
      }
      while (v7 != v9);
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }
}

- (void)setAssetStoreKeyFormatData:(id)a3
{
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller setAssetStoreKeyFormatData:](&v14, sel_setAssetStoreKeyFormatData_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = -[TDAssetPackDistiller assetPackMap](self, "assetPackMap", 0);
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "assetStore"), "setKeyFormatData:", a3);
      }
      while (v7 != v9);
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }
}

- (void)setAssetStoreKeySemantics:(int)a3
{
  uint64_t v3;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller setAssetStoreKeySemantics:](&v14, sel_setAssetStoreKeySemantics_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = -[TDAssetPackDistiller assetPackMap](self, "assetPackMap", 0);
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "assetStore"), "setKeySemantics:", v3);
      }
      while (v7 != v9);
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }
}

- (void)setAssetStorageVersion:(unsigned int)a3
{
  uint64_t v3;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller setAssetStorageVersion:](&v14, sel_setAssetStorageVersion_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = -[TDAssetPackDistiller assetPackMap](self, "assetPackMap", 0);
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "assetStore"), "setStorageVersion:", v3);
      }
      while (v7 != v9);
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }
}

- (void)setAssetStorageVersionString:(const char *)a3
{
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller setAssetStorageVersionString:](&v14, sel_setAssetStorageVersionString_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = -[TDAssetPackDistiller assetPackMap](self, "assetPackMap", 0);
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "assetStore"), "setVersionString:", a3);
      }
      while (v7 != v9);
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }
}

- (void)setAssetSchemaVersion:(unsigned int)a3
{
  uint64_t v3;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller setAssetSchemaVersion:](&v14, sel_setAssetSchemaVersion_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = -[TDAssetPackDistiller assetPackMap](self, "assetPackMap", 0);
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "assetStore"), "setSchemaVersion:", v3);
      }
      while (v7 != v9);
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }
}

- (void)setAssetColorSpaceID:(unsigned int)a3
{
  uint64_t v3;
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = *(_QWORD *)&a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller setAssetColorSpaceID:](&v14, sel_setAssetColorSpaceID_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = -[TDAssetPackDistiller assetPackMap](self, "assetPackMap", 0);
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "assetStore"), "setColorSpaceID:", v3);
      }
      while (v7 != v9);
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }
}

- (void)setDeploymentPlatform:(id)a3
{
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller setDeploymentPlatform:](&v14, sel_setDeploymentPlatform_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = -[TDAssetPackDistiller assetPackMap](self, "assetPackMap", 0);
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "assetStore"), "setDeploymentPlatform:", a3);
      }
      while (v7 != v9);
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }
}

- (void)setDeploymentPlatformVersion:(id)a3
{
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller setDeploymentPlatformVersion:](&v14, sel_setDeploymentPlatformVersion_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = -[TDAssetPackDistiller assetPackMap](self, "assetPackMap", 0);
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "assetStore"), "setDeploymentPlatformVersion:", a3);
      }
      while (v7 != v9);
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }
}

- (void)setAuthoringTool:(id)a3
{
  NSSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  -[TDDistiller setAuthoringTool:](&v14, sel_setAuthoringTool_);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = -[TDAssetPackDistiller assetPackMap](self, "assetPackMap", 0);
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "assetStore"), "setAuthoringTool:", a3);
      }
      while (v7 != v9);
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v7);
  }
}

- (BOOL)assetStoreWriteToDisk
{
  unsigned int v3;
  NSSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)TDAssetPackDistiller;
  v3 = -[TDDistiller assetStoreWriteToDisk](&v14, sel_assetStoreWriteToDisk);
  if (v3)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = -[TDAssetPackDistiller assetPackMap](self, "assetPackMap", 0);
    v5 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v3 = objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "assetStore"), "writeToDiskAndCompact:", 1);
        if (!v3)
          break;
        if (v6 == ++v8)
        {
          v6 = -[NSSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
          LOBYTE(v3) = 1;
          if (v6)
            goto LABEL_4;
          return v3;
        }
      }
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (NSSet)assetPackMap
{
  return self->assetPackMap;
}

- (void)setAssetPackMap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 112);
}

@end
