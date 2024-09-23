@implementation CKChatItemSizeCache

+ (id)sharedInstance
{
  if (CKIsRunningInCKTester())
    return 0;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_25);
  return (id)sharedInstance_sSizeCache;
}

void __37__CKChatItemSizeCache_sharedInstance__block_invoke()
{
  CKChatItemSizeCache *v0;
  void *v1;

  if (CKIsRunningInMessages())
  {
    v0 = objc_alloc_init(CKChatItemSizeCache);
    v1 = (void *)sharedInstance_sSizeCache;
    sharedInstance_sSizeCache = (uint64_t)v0;

  }
}

- (CKChatItemSizeCache)init
{
  CKChatItemSizeCache *v2;
  CKChatItemSizeCache *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKChatItemSizeCache;
  v2 = -[CKChatItemSizeCache init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CKChatItemSizeCache _commonInit](v2, "_commonInit");
  return v3;
}

- (void)_commonInit
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *cacheDiskQueue;
  void *v10;
  id v11;

  if (!CKIsRunningInIMTranscoderAgent())
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[CKChatItemSizeCache setCache:](self, "setCache:");
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[CKChatItemSizeCache setChatItemGUIDToCacheKeyMap:](self, "setChatItemGUIDToCacheKeyMap:", v3);
    v4 = objc_alloc_init(MEMORY[0x1E0D36A20]);
    -[CKChatItemSizeCache setOrderedKeys:](self, "setOrderedKeys:", v4);
    -[CKChatItemSizeCache _inflateCache](self, "_inflateCache");
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR("-"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKChatItemSizeCache setPreferredLocalization:](self, "setPreferredLocalization:", v6);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D36AC8]), "initWithTarget:action:", self, sel__evictIfNeeded);
    -[CKChatItemSizeCache setEvictionUpdater:](self, "setEvictionUpdater:", v7);
    v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.messages.chatitemsizemetricdiskqueue", 0);
    cacheDiskQueue = self->_cacheDiskQueue;
    self->_cacheDiskQueue = v8;

    if (CKIsRunningInMacCatalyst())
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_applicationWillResignActive, *MEMORY[0x1E0CEB358], 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addListener:", self);
    }

  }
}

- (void)setPreferredLocalization:(id)a3
{
  objc_storeStrong((id *)&self->_preferredLocalization, a3);
}

- (void)setOrderedKeys:(id)a3
{
  objc_storeStrong((id *)&self->_orderedKeys, a3);
}

- (void)setEvictionUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_evictionUpdater, a3);
}

- (void)_inflateCache
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CKChatItemSizeCache *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  char *v40;
  void *v41;
  int v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  char *v47;
  void *v48;
  void *v49;
  id obj;
  id v52[2];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  id v61;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  id v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _QWORD v68[7];

  v68[4] = *MEMORY[0x1E0C80C00];
  -[CKChatItemSizeCache test_cacheData](self, "test_cacheData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CKChatItemSizeCache test_cacheData](self, "test_cacheData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99D50];
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(CFSTR("/var/mobile/Library/SMS/"), "stringByAppendingString:", CFSTR("com.apple.messages.geometrycache_v%d.plist"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithValidatedFormat:validFormatSpecifiers:error:", v7, CFSTR("%d"), 0, 15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataWithContentsOfFile:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v4)
  {
    v49 = v4;
    v9 = (void *)MEMORY[0x1E0C99E60];
    v68[0] = objc_opt_class();
    v68[1] = objc_opt_class();
    v68[2] = objc_opt_class();
    v68[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = 0;
    v11 = self;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v48, v4, &v61);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (char *)v61;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (-[CKChatItemSizeCache test_throwExceptionDuringInflate](self, "test_throwExceptionDuringInflate"))
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("TestException"), CFSTR("CKChatItemSizeCache test exception"), 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "raise");

        v11 = self;
      }
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ChatItemSizeMetricCache"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v14;
      if (v14)
      {
        v15 = v14;

        v12 = v15;
        v11 = self;
      }
      v16 = (void *)objc_msgSend(v12, "mutableCopy");
      -[CKChatItemSizeCache setCache:](v11, "setCache:", v16);

      objc_msgSend(v12, "allKeys");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v17, "count"));
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      obj = v17;
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v58 != v20)
              objc_enumerationMutation(obj);
            v22 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i);
            objc_msgSend(v12, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setKey:", v22);
            objc_msgSend(v18, "addObject:", v23);

          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
        }
        while (v19);
      }

      objc_msgSend(v18, "sortUsingComparator:", &__block_literal_global_136_0);
      -[CKChatItemSizeCache orderedKeys](self, "orderedKeys");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 0u;
      v56 = 0u;
      v53 = 0u;
      v54 = 0u;
      v25 = v18;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
      if (v26)
      {
        v27 = *(_QWORD *)v54;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v54 != v27)
              objc_enumerationMutation(v25);
            v29 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
            v30 = objc_alloc(MEMORY[0x1E0D36A28]);
            objc_msgSend(v29, "key");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = (void *)objc_msgSend(v30, "initWithObject:", v31);

            objc_msgSend(v29, "setNode:", v32);
            objc_msgSend(v24, "pushLinkedListNode:", v32);

          }
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
        }
        while (v26);
      }

      -[CKChatItemSizeCache cache](self, "cache");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKChatItemSizeCache _generateChatItemGuidToCacheKeyMapWithCache:](self, "_generateChatItemGuidToCacheKeyMapWithCache:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKChatItemSizeCache setChatItemGUIDToCacheKeyMap:](self, "setChatItemGUIDToCacheKeyMap:", v34);
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v63 = v47;
        _os_log_impl(&dword_18DFCD000, v36, OS_LOG_TYPE_INFO, "CKChatItemSizeCache: Failed to unarchive with error %@", buf, 0xCu);
      }

    }
    v4 = v49;
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v63 = "-[CKChatItemSizeCache _inflateCache]";
      _os_log_impl(&dword_18DFCD000, v35, OS_LOG_TYPE_INFO, "%s No size metrics cache found on disk", buf, 0xCu);
    }

  }
  v37 = 0;
  do
  {
    v38 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(CFSTR("/var/mobile/Library/SMS/"), "stringByAppendingString:", CFSTR("com.apple.messages.geometrycache_v%d.plist"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringWithValidatedFormat:validFormatSpecifiers:error:", v39, CFSTR("%d"), 0, v37);
    v40 = (char *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "fileExistsAtPath:", v40);

    if (v42)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = 0;
      objc_msgSend(v43, "removeItemAtPath:error:", v40, v52);
      v44 = v52[0];

      if (v44 && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v63 = v40;
          v64 = 2112;
          v65 = v44;
          _os_log_impl(&dword_18DFCD000, v45, OS_LOG_TYPE_INFO, "CKChatItemSizeCache: Failed to purge legacy cache at path %@ with error %@", buf, 0x16u);
        }

      }
    }

    v37 = (v37 + 1);
  }
  while ((_DWORD)v37 != 15);
}

- (void)setChatItemGUIDToCacheKeyMap:(id)a3
{
  objc_storeStrong((id *)&self->_chatItemGUIDToCacheKeyMap, a3);
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (BOOL)test_throwExceptionDuringInflate
{
  return self->_test_throwExceptionDuringInflate;
}

- (NSData)test_cacheData
{
  return self->_test_cacheData;
}

- (IMDoubleLinkedList)orderedKeys
{
  return self->_orderedKeys;
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (id)_generateChatItemGuidToCacheKeyMapWithCache:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "allValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "chatItemGUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "key");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v12)
          v15 = v13 == 0;
        else
          v15 = 1;
        if (!v15)
          -[CKChatItemSizeCache _updateKeyMap:forKey:sizeCacheKey:](self, "_updateKeyMap:forKey:sizeCacheKey:", v5, v12, v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)dealloc
{
  IMScheduledUpdater *evictionUpdater;
  objc_super v4;

  -[IMScheduledUpdater invalidate](self->_evictionUpdater, "invalidate");
  evictionUpdater = self->_evictionUpdater;
  self->_evictionUpdater = 0;

  v4.receiver = self;
  v4.super_class = (Class)CKChatItemSizeCache;
  -[CKChatItemSizeCache dealloc](&v4, sel_dealloc);
}

- (id)initForTestAndThrowException:(BOOL)a3 cacheFileData:(id)a4
{
  _BOOL8 v4;
  id v6;
  CKChatItemSizeCache *v7;
  CKChatItemSizeCache *v8;
  objc_super v10;

  v4 = a3;
  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CKChatItemSizeCache;
  v7 = -[CKChatItemSizeCache init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    -[CKChatItemSizeCache setTest_throwExceptionDuringInflate:](v7, "setTest_throwExceptionDuringInflate:", v4);
    -[CKChatItemSizeCache setTest_cacheData:](v8, "setTest_cacheData:", v6);
    -[CKChatItemSizeCache _commonInit](v8, "_commonInit");
  }

  return v8;
}

- (BOOL)cachedSizeForChatItem:(id)a3 size:(CGSize *)a4 textAlignmentInsets:(UIEdgeInsets *)a5 fittingSize:(CGSize)a6
{
  double height;
  double width;
  id v11;
  BOOL v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;

  height = a6.height;
  width = a6.width;
  v11 = a3;
  if (CKDisableChatItemSizeCache() || CKIsRunningInIMTranscoderAgent())
  {
    v12 = 0;
    goto LABEL_4;
  }
  -[CKChatItemSizeCache cacheKeyForChatItem:fittingSize:](self, "cacheKeyForChatItem:fittingSize:", v11, width, height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatItemSizeCache cache](self, "cache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v16 != 0;
  if (!v16)
  {
    v25 = *MEMORY[0x1E0C9D820];
    v27 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v29 = *MEMORY[0x1E0CEB4B0];
    v31 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v33 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v35 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    if (!a4)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(v16, "node");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x1E0D36A28]);
  objc_msgSend(v17, "object");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithObject:", v19);

  objc_msgSend(v16, "setKey:", v14);
  objc_msgSend(v16, "setNode:", v20);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLastAccess:", v21);

  -[CKChatItemSizeCache orderedKeys](self, "orderedKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "removeLinkedListNode:", v17);

  -[CKChatItemSizeCache orderedKeys](self, "orderedKeys");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "pushLinkedListNode:", v20);

  objc_msgSend(v16, "size");
  v25 = v24;
  v27 = v26;
  objc_msgSend(v16, "textAlignmentInsets");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;

  if (a4)
  {
LABEL_7:
    a4->width = v25;
    a4->height = v27;
  }
LABEL_8:
  if (a5)
  {
    a5->top = v29;
    a5->left = v31;
    a5->bottom = v33;
    a5->right = v35;
  }

LABEL_4:
  return v12;
}

- (void)setCachedSizeForChatItem:(id)a3 size:(CGSize)a4 textAlignmentInsets:(UIEdgeInsets)a5 fittingSize:(CGSize)a6
{
  double height;
  double width;
  double right;
  double bottom;
  double left;
  double top;
  double v12;
  double v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CKChatItemCachedSizeMetrics *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  height = a6.height;
  width = a6.width;
  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v12 = a4.height;
  v13 = a4.width;
  v25 = a3;
  if (!CKDisableChatItemSizeCache()
    && !CKIsRunningInIMTranscoderAgent()
    && !+[CKApplicationState isResizing](CKApplicationState, "isResizing"))
  {
    objc_msgSend(v25, "IMChatItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "guid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKChatItemSizeCache cacheKeyForChatItem:fittingSize:](self, "cacheKeyForChatItem:fittingSize:", v25, width, height);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D36A28]), "initWithObject:", v17);
    v19 = objc_alloc_init(CKChatItemCachedSizeMetrics);
    -[CKChatItemCachedSizeMetrics setChatItemGUID:](v19, "setChatItemGUID:", v16);
    -[CKChatItemCachedSizeMetrics setSize:](v19, "setSize:", v13, v12);
    -[CKChatItemCachedSizeMetrics setTextAlignmentInsets:](v19, "setTextAlignmentInsets:", top, left, bottom, right);
    -[CKChatItemCachedSizeMetrics setKey:](v19, "setKey:", v17);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatItemCachedSizeMetrics setLastAccess:](v19, "setLastAccess:", v20);

    -[CKChatItemCachedSizeMetrics setNode:](v19, "setNode:", v18);
    -[CKChatItemSizeCache cache](self, "cache");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKey:", v19, v17);

    -[CKChatItemSizeCache orderedKeys](self, "orderedKeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "pushLinkedListNode:", v18);

    -[CKChatItemSizeCache chatItemGUIDToCacheKeyMap](self, "chatItemGUIDToCacheKeyMap");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatItemSizeCache _updateKeyMap:forKey:sizeCacheKey:](self, "_updateKeyMap:forKey:sizeCacheKey:", v23, v16, v17);

    -[CKChatItemSizeCache evictionUpdater](self, "evictionUpdater");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setNeedsUpdate");

  }
}

- (void)invalidateCachedSizeForChatItems:(id)a3 reason:(id)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  os_signpost_id_t spid;
  unint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v30 = a4;
  IMLogHandleForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  v29 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18DFCD000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "InvalidateChatItems", ", buf, 2u);
  }
  spid = v8;

  v11 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v32 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "IMChatItem");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "guid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        -[CKChatItemSizeCache chatItemGUIDToCacheKeyMap](self, "chatItemGUIDToCacheKeyMap");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKey:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "unionSet:", v20);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v14);
  }

  -[CKChatItemSizeCache chatItemGUIDToCacheKeyMap](self, "chatItemGUIDToCacheKeyMap");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  v23 = objc_msgSend(v11, "count");
  -[CKChatItemSizeCache ___invalidateSizeCacheMetricsForKeys:](self, "___invalidateSizeCacheMetricsForKeys:", v11);
  -[CKChatItemSizeCache chatItemGUIDToCacheKeyMap](self, "chatItemGUIDToCacheKeyMap");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  v26 = v10;
  v27 = v26;
  if (v29 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_DWORD *)buf = 134218754;
    v36 = v22;
    v37 = 2048;
    v38 = v23;
    v39 = 2048;
    v40 = v25;
    v41 = 2112;
    v42 = v30;
    _os_signpost_emit_with_name_impl(&dword_18DFCD000, v27, OS_SIGNPOST_INTERVAL_END, spid, "InvalidateChatItems", "InvalidateChatItems: old number of cached size = %lu, number of invalidated sizes = %lu, number of new chaches size = %lu, reason: %@", buf, 0x2Au);
  }

}

- (void)invalidateCachedSizeForGUIDPrefix:(id)a3 reason:(id)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  os_signpost_id_t spid;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = a4;
  IMLogHandleForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18DFCD000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "InvalidateChatItems", ", buf, 2u);
  }
  spid = v8;

  -[CKChatItemSizeCache chatItemGUIDToCacheKeyMap](self, "chatItemGUIDToCacheKeyMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v20, "containsString:", v6, spid))
          objc_msgSend(v14, "addObject:", v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    }
    while (v17);
  }

  -[CKChatItemSizeCache chatItemGUIDToCacheKeyMap](self, "chatItemGUIDToCacheKeyMap");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  v23 = objc_msgSend(v14, "count");
  -[CKChatItemSizeCache ___invalidateSizeCacheMetricsForKeys:](self, "___invalidateSizeCacheMetricsForKeys:", v14);
  -[CKChatItemSizeCache chatItemGUIDToCacheKeyMap](self, "chatItemGUIDToCacheKeyMap");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  v26 = v10;
  v27 = v26;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_DWORD *)buf = 134218754;
    v35 = v22;
    v36 = 2048;
    v37 = v23;
    v38 = 2048;
    v39 = v25;
    v40 = 2112;
    v41 = v29;
    _os_signpost_emit_with_name_impl(&dword_18DFCD000, v27, OS_SIGNPOST_INTERVAL_END, spid, "InvalidateChatItems", "InvalidateChatItems: old number of cached size = %lu, number of invalidated sizes = %lu, number of new chaches size = %lu, reason: %@", buf, 0x2Au);
  }

}

- (void)___invalidateSizeCacheMetricsForKeys:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v40;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v9);
        -[CKChatItemSizeCache cache](self, "cache");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v12, "chatItemGUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = !v13 || v10 == 0;
          v15 = !v14;

          if (v15)
            objc_msgSend(v5, "addObject:", v10);
        }

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    }
    while (v7);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      -[CKChatItemSizeCache cache](self, "cache");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");
      v19 = objc_msgSend(v5, "count");
      -[CKChatItemSizeCache cache](self, "cache");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");
      v22 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 134218496;
      v45 = v18;
      v46 = 2048;
      v47 = v19;
      v48 = 2048;
      v49 = v21 - v22;
      _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "___invalidateSizeCacheMetrics: Current cache count: %ld – invalidation count: %ld – expected new count: %ld", buf, 0x20u);

    }
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v23 = v5;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v36;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v36 != v25)
          objc_enumerationMutation(v23);
        v27 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v26);
        -[CKChatItemSizeCache cache](self, "cache", (_QWORD)v35);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        -[CKChatItemSizeCache chatItemGUIDToCacheKeyMap](self, "chatItemGUIDToCacheKeyMap");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "chatItemGUID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "removeObjectForKey:", v31);

        -[CKChatItemSizeCache orderedKeys](self, "orderedKeys");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "node");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "removeLinkedListNode:", v33);

        -[CKChatItemSizeCache cache](self, "cache");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "removeObjectForKey:", v27);

        ++v26;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    }
    while (v24);
  }

}

- (id)cacheKeyForChatItem:(id)a3 fittingSize:(CGSize)a4
{
  CGFloat width;
  id v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  width = a4.width;
  v6 = a3;
  -[CKChatItemSizeCache _fontSizeCategory](self, "_fontSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatItemSizeCache _systemVersion](self, "_systemVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CKChatItemSizeCache _boldTextEnabled](self, "_boldTextEnabled");
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "IMChatItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "guid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatItemSizeCache preferredLocalization](self, "preferredLocalization");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@-%f-%@-%@-%@-%@>"), v12, *(_QWORD *)&width, v7, v8, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_systemVersion
{
  if (_systemVersion_onceToken != -1)
    dispatch_once(&_systemVersion_onceToken, &__block_literal_global_111);
  return (id)_systemVersion_sSystemVersion;
}

void __37__CKChatItemSizeCache__systemVersion__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "productOSVersion");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_systemVersion_sSystemVersion;
  _systemVersion_sSystemVersion = v0;

}

- (id)_fontSizeCategory
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_evictIfNeeded
{
  void *v3;
  unint64_t v4;
  NSObject *v5;
  void *i;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  unint64_t v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[CKChatItemSizeCache orderedKeys](self, "orderedKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4 >= 0xBB9 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v10 = 136315650;
      v11 = "-[CKChatItemSizeCache _evictIfNeeded]";
      v12 = 2048;
      v13 = v4;
      v14 = 1024;
      v15 = 3000;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "%s - Current %tu max %d will evict", (uint8_t *)&v10, 0x1Cu);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); v4 > 0xBB8; --v4)
  {
    objc_msgSend(v3, "last");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "object");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(i, "addObject:", v9);

    }
  }
  -[CKChatItemSizeCache ___invalidateSizeCacheMetricsForKeys:](self, "___invalidateSizeCacheMetricsForKeys:", i);

}

- (void)_persistCache
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD aBlock[4];
  id v9;

  -[CKChatItemSizeCache evictionUpdater](self, "evictionUpdater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

  -[CKChatItemSizeCache cache](self, "cache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__CKChatItemSizeCache__persistCache__block_invoke;
  aBlock[3] = &unk_1E274A208;
  v9 = v5;
  v6 = v5;
  v7 = _Block_copy(aBlock);
  dispatch_async((dispatch_queue_t)self->_cacheDiskQueue, v7);

}

void __36__CKChatItemSizeCache__persistCache__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v1, 1, &v13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v13;
  if (v3)
    goto LABEL_13;
  v4 = CKIsRunningInMacCatalyst() ? 1 : 1073741825;
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(CFSTR("/var/mobile/Library/SMS/"), "stringByAppendingString:", CFSTR("com.apple.messages.geometrycache_v%d.plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%d"), 0, 15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v2, "writeToFile:options:error:", v7, v4, &v12);
  v3 = v12;

  if (v3)
  {
LABEL_13:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(CFSTR("/var/mobile/Library/SMS/"), "stringByAppendingString:", CFSTR("com.apple.messages.geometrycache_v%d.plist"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%d"), 0, 15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v15 = v3;
        v16 = 2112;
        v17 = v11;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "CKChatItemSizeCache: failed serializing or persisting serialized cache %@ %@", buf, 0x16u);

      }
    }
  }

}

uint64_t __36__CKChatItemSizeCache__inflateCache__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "lastAccess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastAccess");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 || !v6)
    v7 = objc_msgSend(v5, "compare:", v6);
  else
    v7 = 1;

  return v7;
}

- (void)_updateKeyMap:(id)a3 forKey:(id)a4 sizeCacheKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a5;
  if (a3 && a4 && v7)
  {
    v12 = v7;
    v8 = a4;
    v9 = a3;
    objc_msgSend(v9, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = v10;
      objc_msgSend(v10, "addObject:", v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "setObject:forKey:", v11, v8);

    v7 = v12;
  }

}

+ (id)test_cachePath
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(CFSTR("/var/mobile/Library/SMS/"), "stringByAppendingString:", CFSTR("com.apple.messages.geometrycache_v%d.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithValidatedFormat:validFormatSpecifiers:error:", v3, CFSTR("%d"), 0, 15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSMutableDictionary)chatItemGUIDToCacheKeyMap
{
  return self->_chatItemGUIDToCacheKeyMap;
}

- (OS_dispatch_queue)cacheDiskQueue
{
  return self->_cacheDiskQueue;
}

- (void)setCacheDiskQueue:(id)a3
{
  objc_storeStrong((id *)&self->_cacheDiskQueue, a3);
}

- (IMScheduledUpdater)evictionUpdater
{
  return self->_evictionUpdater;
}

- (NSString)preferredLocalization
{
  return self->_preferredLocalization;
}

- (void)setTest_throwExceptionDuringInflate:(BOOL)a3
{
  self->_test_throwExceptionDuringInflate = a3;
}

- (void)setTest_cacheData:(id)a3
{
  objc_storeStrong((id *)&self->_test_cacheData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_test_cacheData, 0);
  objc_storeStrong((id *)&self->_preferredLocalization, 0);
  objc_storeStrong((id *)&self->_evictionUpdater, 0);
  objc_storeStrong((id *)&self->_cacheDiskQueue, 0);
  objc_storeStrong((id *)&self->_orderedKeys, 0);
  objc_storeStrong((id *)&self->_chatItemGUIDToCacheKeyMap, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
