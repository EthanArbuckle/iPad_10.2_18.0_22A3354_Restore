@implementation CKPreviewDispatchCache

+ (int64_t)_defaultPreviewPriority
{
  if (IMIsRunningInMessagesUIProcess())
    return 0;
  else
    return -32768;
}

+ (id)transcriptPreviewCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CKPreviewDispatchCache_transcriptPreviewCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transcriptPreviewCache_once != -1)
    dispatch_once(&transcriptPreviewCache_once, block);
  return (id)transcriptPreviewCache_sPreviewDispatchCache;
}

void __48__CKPreviewDispatchCache_transcriptPreviewCache__block_invoke(uint64_t a1)
{
  CKPreviewDispatchCache *v1;
  void *v2;

  v1 = -[CKPreviewDispatchCache initWithCacheLimit:dispatchPriority:isConcurrent:]([CKPreviewDispatchCache alloc], "initWithCacheLimit:dispatchPriority:isConcurrent:", 0, objc_msgSend(*(id *)(a1 + 32), "_defaultPreviewPriority"), 0);
  v2 = (void *)transcriptPreviewCache_sPreviewDispatchCache;
  transcriptPreviewCache_sPreviewDispatchCache = (uint64_t)v1;

}

+ (id)detailsPreviewCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__CKPreviewDispatchCache_detailsPreviewCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (detailsPreviewCache_once != -1)
    dispatch_once(&detailsPreviewCache_once, block);
  return (id)detailsPreviewCache_sDetailsDispatchCache;
}

void __45__CKPreviewDispatchCache_detailsPreviewCache__block_invoke(uint64_t a1)
{
  CKPreviewDispatchCache *v1;
  void *v2;

  v1 = -[CKPreviewDispatchCache initWithCacheLimit:dispatchPriority:isConcurrent:]([CKPreviewDispatchCache alloc], "initWithCacheLimit:dispatchPriority:isConcurrent:", 250, objc_msgSend(*(id *)(a1 + 32), "_defaultPreviewPriority"), 0);
  v2 = (void *)detailsPreviewCache_sDetailsDispatchCache;
  detailsPreviewCache_sDetailsDispatchCache = (uint64_t)v1;

}

+ (id)snapshotCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__CKPreviewDispatchCache_snapshotCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (snapshotCache_once != -1)
    dispatch_once(&snapshotCache_once, block);
  return (id)snapshotCache_sSnapshotDispatchCache;
}

void __39__CKPreviewDispatchCache_snapshotCache__block_invoke(uint64_t a1)
{
  CKPreviewDispatchCache *v1;
  void *v2;

  v1 = -[CKPreviewDispatchCache initWithCacheLimit:dispatchPriority:isConcurrent:]([CKPreviewDispatchCache alloc], "initWithCacheLimit:dispatchPriority:isConcurrent:", 0, objc_msgSend(*(id *)(a1 + 32), "_defaultPreviewPriority"), 0);
  v2 = (void *)snapshotCache_sSnapshotDispatchCache;
  snapshotCache_sSnapshotDispatchCache = (uint64_t)v1;

}

+ (id)genmojiPreviewCache
{
  if (genmojiPreviewCache_once != -1)
    dispatch_once(&genmojiPreviewCache_once, &__block_literal_global_270);
  return (id)genmojiPreviewCache_sSnapshotDispatchCache;
}

void __45__CKPreviewDispatchCache_genmojiPreviewCache__block_invoke()
{
  CKPreviewDispatchCache *v0;
  void *v1;

  v0 = -[CKPreviewDispatchCache initWithCacheLimit:dispatchPriority:isConcurrent:]([CKPreviewDispatchCache alloc], "initWithCacheLimit:dispatchPriority:isConcurrent:", 0, 2, 1);
  v1 = (void *)genmojiPreviewCache_sSnapshotDispatchCache;
  genmojiPreviewCache_sSnapshotDispatchCache = (uint64_t)v0;

}

+ (id)stickerPreviewCache
{
  void *v3;
  CKPreviewDispatchCache *v4;
  void *v5;

  v3 = (void *)sStickerPreviewCache;
  if (!sStickerPreviewCache)
  {
    v4 = -[CKPreviewDispatchCache initWithCacheLimit:dispatchPriority:isConcurrent:]([CKPreviewDispatchCache alloc], "initWithCacheLimit:dispatchPriority:isConcurrent:", 0, objc_msgSend(a1, "_defaultPreviewPriority"), 0);
    v5 = (void *)sStickerPreviewCache;
    sStickerPreviewCache = (uint64_t)v4;

    objc_msgSend((id)sStickerPreviewCache, "resume");
    v3 = (void *)sStickerPreviewCache;
  }
  return v3;
}

+ (void)_invalidateStickerPreviewCache
{
  void *v2;

  v2 = (void *)sStickerPreviewCache;
  sStickerPreviewCache = 0;

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeListener:", self);

  -[CKPreviewDispatchCache notificationCenter](self, "notificationCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)CKPreviewDispatchCache;
  -[CKPreviewDispatchCache dealloc](&v5, sel_dealloc);
}

- (CKPreviewDispatchCache)initWithCacheLimit:(unint64_t)a3 dispatchPriority:(int64_t)a4 isConcurrent:(BOOL)a5
{
  _BOOL8 v5;
  CKPreviewDispatchCache *v8;
  void *v9;
  void *v10;
  CKDispatchCache *v11;
  CKMultiDict *v12;
  objc_super v14;

  v5 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKPreviewDispatchCache;
  v8 = -[CKPreviewDispatchCache init](&v14, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addListener:", v8);

    -[CKPreviewDispatchCache notificationCenter](v8, "notificationCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v8, sel_didReceiveMemoryWarning, *MEMORY[0x1E0CEB298], 0);

    v11 = -[CKDispatchCache initWithCacheLimit:dispatchPriority:isConcurrent:]([CKDispatchCache alloc], "initWithCacheLimit:dispatchPriority:isConcurrent:", a3, a4, v5);
    -[CKPreviewDispatchCache setDispatchCache:](v8, "setDispatchCache:", v11);
    v12 = objc_alloc_init(CKMultiDict);
    -[CKPreviewDispatchCache setPendingBlocks:](v8, "setPendingBlocks:", v12);

  }
  return v8;
}

- (CKPreviewDispatchCache)init
{
  uint64_t v3;

  v3 = CKDefaultCacheLimit();
  return -[CKPreviewDispatchCache initWithCacheLimit:dispatchPriority:isConcurrent:](self, "initWithCacheLimit:dispatchPriority:isConcurrent:", v3, objc_msgSend((id)objc_opt_class(), "_defaultPreviewPriority"), 0);
}

- (void)enqueueSaveBlock:(id)a3 withPriority:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[CKPreviewDispatchCache dispatchCache](self, "dispatchCache");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enqueueBlock:withPriority:", v6, a4);

}

- (void)enqueueGenerationBlock:(id)a3 completion:(id)a4 withPriority:(int64_t)a5 forKey:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[CKPreviewDispatchCache dispatchCache](self, "dispatchCache");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "enqueueGenerationBlock:completion:withPriority:forKey:", v12, v11, a5, v10);

}

- (id)cachedPreviewForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CKPreviewDispatchCache dispatchCache](self, "dispatchCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedObjectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setCachedPreview:(id)a3 key:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[CKPreviewDispatchCache cachedPreviewForKey:](self, "cachedPreviewForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKPreviewDispatchCache shouldReplaceCachedPreview:withPreview:](self, "shouldReplaceCachedPreview:withPreview:", v7, v9))
  {
    -[CKPreviewDispatchCache dispatchCache](self, "dispatchCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCachedObject:forKey:", v9, v6);

  }
}

- (BOOL)isGeneratingPreviewForKey:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CKPreviewDispatchCache dispatchCache](self, "dispatchCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isGeneratingForKey:", v4);

  return v6;
}

- (void)beginGeneratingForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKPreviewDispatchCache dispatchCache](self, "dispatchCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginGeneratingForKey:", v4);

}

- (void)endGeneratingForKey:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKPreviewDispatchCache dispatchCache](self, "dispatchCache");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endGeneratingForKey:", v4);

}

- (void)resume
{
  id v2;

  -[CKPreviewDispatchCache dispatchCache](self, "dispatchCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resume");

}

- (void)suspend
{
  id v2;

  -[CKPreviewDispatchCache dispatchCache](self, "dispatchCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suspend");

}

- (id)mediaObjectManager
{
  return +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
}

- (id)notificationCenter
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
}

- (void)flush
{
  void *v3;
  void *v4;
  id v5;

  -[CKPreviewDispatchCache dispatchCache](self, "dispatchCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearQueue");

  -[CKPreviewDispatchCache pendingBlocks](self, "pendingBlocks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[CKPreviewDispatchCache notificationCenter](self, "notificationCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("CKFileTransferFinishedNotification"), 0);
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("CKFileTransferRemovedNotification"), 0);

}

- (void)transferFinished:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD);
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v5;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_DEBUG, "Transfer %@ finished. Execute its pending operations.", buf, 0xCu);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      v13 = v5;
      _CKLog();
    }
    objc_msgSend(v5, "guid", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPreviewDispatchCache pendingBlocks](self, "pendingBlocks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "popObjectForKey:", v7);
    v9 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      do
      {
        v9[2](v9);
        -[CKPreviewDispatchCache pendingBlocks](self, "pendingBlocks");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "popObjectForKey:", v7);
        v11 = objc_claimAutoreleasedReturnValue();

        v9 = (void (**)(_QWORD))v11;
      }
      while (v11);
    }
    -[CKPreviewDispatchCache notificationCenter](self, "notificationCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObserver:name:object:", self, CFSTR("CKFileTransferFinishedNotification"), 0);
    objc_msgSend(v12, "removeObserver:name:object:", self, CFSTR("CKFileTransferRemovedNotification"), 0);

  }
}

- (void)transferRemoved:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(2);
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v5;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_DEBUG, "Transfer %@ removed. Dump its pending operations.", buf, 0xCu);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      v10 = v5;
      _CKLog();
    }
    objc_msgSend(v5, "guid", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPreviewDispatchCache pendingBlocks](self, "pendingBlocks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectsForKey:", v7);

    -[CKPreviewDispatchCache notificationCenter](self, "notificationCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("CKFileTransferFinishedNotification"), 0);
    objc_msgSend(v9, "removeObserver:name:object:", self, CFSTR("CKFileTransferRemovedNotification"), 0);

  }
}

- (BOOL)shouldReplaceCachedPreview:(id)a3 withPreview:(id)a4
{
  id v5;
  id v6;
  char isKindOfClass;
  char v8;

  v5 = a4;
  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_opt_class();
    v8 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    v8 = 1;
  }

  return v8 & 1;
}

- (void)clearQueueAndCachedPreviews
{
  id v3;

  -[CKPreviewDispatchCache flush](self, "flush");
  -[CKPreviewDispatchCache dispatchCache](self, "dispatchCache");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emptyCache");

}

- (CKDispatchCache)dispatchCache
{
  return self->_dispatchCache;
}

- (void)setDispatchCache:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchCache, a3);
}

- (CKMultiDict)pendingBlocks
{
  return self->_pendingBlocks;
}

- (void)setPendingBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_pendingBlocks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingBlocks, 0);
  objc_storeStrong((id *)&self->_dispatchCache, 0);
}

- (void)enqueueSaveBlock:(id)a3 forMediaObject:(id)a4 withPriority:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  id *v15;
  NSObject *v16;
  _QWORD block[4];
  _QWORD v18[2];
  id v19;
  id v20;
  int64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (CKIsRunningInFullCKClient() || CKIsRunningUnitTests())
  {
    -[CKPreviewDispatchCache dispatchCache](self, "dispatchCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "transfer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isFileURLFinalized");

    v13 = IMOSLoggingEnabled();
    if (v12)
    {
      if (v13)
      {
        CKLogCStringForType(2);
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v9;
          _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_DEBUG, "%@ save preview.", buf, 0xCu);
        }

      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
        _CKLog();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __94__CKPreviewDispatchCache_CKMediaObject_Display__enqueueSaveBlock_forMediaObject_withPriority___block_invoke;
      v22[3] = &unk_1E274DA38;
      v24 = v8;
      v23 = v9;
      objc_msgSend(v10, "enqueueBlock:withPriority:", v22, a5);

      v15 = &v24;
    }
    else
    {
      if (v13)
      {
        CKLogCStringForType(2);
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v9;
          _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_DEBUG, "%@ transfer fileURL isn't finalized so defer saving preview.", buf, 0xCu);
        }

      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
        _CKLog();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __94__CKPreviewDispatchCache_CKMediaObject_Display__enqueueSaveBlock_forMediaObject_withPriority___block_invoke_175;
      block[3] = &unk_1E2759600;
      v18[0] = v9;
      v18[1] = self;
      v19 = v10;
      v20 = v8;
      v21 = a5;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      v15 = (id *)v18;
    }

  }
}

uint64_t __94__CKPreviewDispatchCache_CKMediaObject_Display__enqueueSaveBlock_forMediaObject_withPriority___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __94__CKPreviewDispatchCache_CKMediaObject_Display__enqueueSaveBlock_forMediaObject_withPriority___block_invoke_175(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;

  objc_msgSend(*(id *)(a1 + 32), "transferGUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transfer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "IMMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "messageContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chatContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __94__CKPreviewDispatchCache_CKMediaObject_Display__enqueueSaveBlock_forMediaObject_withPriority___block_invoke_2;
  v18[3] = &unk_1E275A780;
  v7 = *(void **)(a1 + 48);
  v18[4] = *(_QWORD *)(a1 + 40);
  v19 = v2;
  v20 = v4;
  v21 = v6;
  v22 = v7;
  v8 = *(id *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 64);
  v23 = v8;
  v24 = v9;
  v10 = v6;
  v11 = v4;
  v12 = v2;
  v13 = (void *)objc_msgSend(v18, "copy");
  objc_msgSend(*(id *)(a1 + 40), "pendingBlocks");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = _Block_copy(v13);
  objc_msgSend(v14, "pushObject:forKey:", v15, v12);

  objc_msgSend(*(id *)(a1 + 32), "transfer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 40), sel_transferFinished_, CFSTR("CKFileTransferFinishedNotification"), v16);
  objc_msgSend(v17, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 40), sel_transferRemoved_, CFSTR("CKFileTransferRemovedNotification"), v16);

}

void __94__CKPreviewDispatchCache_CKMediaObject_Display__enqueueSaveBlock_forMediaObject_withPriority___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "mediaObjectManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaObjectWithTransferGUID:imMessage:chatContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__CKPreviewDispatchCache_CKMediaObject_Display__enqueueSaveBlock_forMediaObject_withPriority___block_invoke_3;
  v8[3] = &unk_1E274DA38;
  v4 = *(void **)(a1 + 64);
  v5 = *(id *)(a1 + 72);
  v9 = v3;
  v10 = v5;
  v6 = *(_QWORD *)(a1 + 80);
  v7 = v3;
  objc_msgSend(v4, "enqueueBlock:withPriority:", v8, v6);

}

uint64_t __94__CKPreviewDispatchCache_CKMediaObject_Display__enqueueSaveBlock_forMediaObject_withPriority___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)previewPrewarmQueue
{
  if (previewPrewarmQueue_once != -1)
    dispatch_once(&previewPrewarmQueue_once, &__block_literal_global_178_4);
  return (id)previewPrewarmQueue_sPreviewPrewarmQueue;
}

void __68__CKPreviewDispatchCache_CKMediaObject_Display__previewPrewarmQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;
  NSObject *v3;

  v0 = dispatch_queue_create(0, 0);
  v1 = (void *)previewPrewarmQueue_sPreviewPrewarmQueue;
  previewPrewarmQueue_sPreviewPrewarmQueue = (uint64_t)v0;

  v2 = previewPrewarmQueue_sPreviewPrewarmQueue;
  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v2, v3);

}

+ (id)mapThumbnailQueue
{
  if (mapThumbnailQueue_once != -1)
    dispatch_once(&mapThumbnailQueue_once, &__block_literal_global_183_2);
  return (id)mapThumbnailQueue_sMapThumbnailQueue;
}

void __61__CKPreviewDispatchCache_MKMapSnapshotter__mapThumbnailQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;
  NSObject *v3;

  v0 = dispatch_queue_create(0, 0);
  v1 = (void *)mapThumbnailQueue_sMapThumbnailQueue;
  mapThumbnailQueue_sMapThumbnailQueue = (uint64_t)v0;

  v2 = mapThumbnailQueue_sMapThumbnailQueue;
  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v2, v3);

}

@end
