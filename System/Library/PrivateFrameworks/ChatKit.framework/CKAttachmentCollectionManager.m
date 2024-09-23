@implementation CKAttachmentCollectionManager

- (CKAttachmentCollectionManager)initWithChat:(id)a3 photoTransferGUIDs:(id)a4
{
  id v6;
  id v7;
  CKAttachmentCollectionManager *v8;
  CKAttachmentCollectionManager *v9;
  uint64_t v10;
  NSSet *photoTransferGUIDs;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CKAttachmentCollectionManager;
  v8 = -[CKAttachmentCollectionManager init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    -[CKAttachmentCollectionManager setChat:](v8, "setChat:", v6);
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
      v10 = objc_claimAutoreleasedReturnValue();
      photoTransferGUIDs = v9->_photoTransferGUIDs;
      v9->_photoTransferGUIDs = (NSSet *)v10;

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0D35328];
    -[CKAttachmentCollectionManager chat](v9, "chat");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel_chatItemsChanged_, v13, v14);

    -[CKAttachmentCollectionManager updateCollections](v9, "updateCollections");
  }

  return v9;
}

- (CKAttachmentCollectionManager)initWithChat:(id)a3
{
  return -[CKAttachmentCollectionManager initWithChat:photoTransferGUIDs:](self, "initWithChat:photoTransferGUIDs:", a3, 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKAttachmentCollectionManager;
  -[CKAttachmentCollectionManager dealloc](&v4, sel_dealloc);
}

- (void)chatItemsChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;

  v4 = a3;
  -[CKAttachmentCollectionManager photosVideosItems](self, "photosVideosItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[CKAttachmentCollectionManager otherContentsItems](self, "otherContentsItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  objc_msgSend(v4, "userInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D35340]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "chatItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D35330]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __50__CKAttachmentCollectionManager_chatItemsChanged___block_invoke;
  v38[3] = &unk_1E2758A78;
  v38[4] = self;
  v14 = v12;
  v39 = v14;
  v15 = v6;
  v40 = v15;
  v16 = v8;
  v41 = v16;
  v42 = &v43;
  objc_msgSend(v13, "enumerateIndexesWithOptions:usingBlock:", 2, v38);
  v27 = v14;
  v28 = v13;
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D35358]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __50__CKAttachmentCollectionManager_chatItemsChanged___block_invoke_2;
  v35[3] = &unk_1E2758AA0;
  v35[4] = self;
  v19 = v11;
  v36 = v19;
  v20 = v17;
  v37 = v20;
  objc_msgSend(v18, "enumerateIndexesUsingBlock:", v35);
  if (objc_msgSend(v20, "count"))
  {
    v26 = v4;
    *((_BYTE *)v44 + 24) = 1;
    v21 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __50__CKAttachmentCollectionManager_chatItemsChanged___block_invoke_3;
    v32[3] = &unk_1E2758AC8;
    v22 = v20;
    v33 = v22;
    v23 = v21;
    v34 = v23;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v32);
    objc_msgSend(v15, "removeObjectsAtIndexes:", v23);
    objc_msgSend(v23, "removeAllIndexes");
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __50__CKAttachmentCollectionManager_chatItemsChanged___block_invoke_4;
    v29[3] = &unk_1E2758AC8;
    v30 = v22;
    v24 = v23;
    v31 = v24;
    objc_msgSend(v16, "enumerateObjectsUsingBlock:", v29);
    objc_msgSend(v16, "removeObjectsAtIndexes:", v24);

    v4 = v26;
  }
  if (*((_BYTE *)v44 + 24))
  {
    -[CKAttachmentCollectionManager setPhotosVideosItems:](self, "setPhotosVideosItems:", v15);
    -[CKAttachmentCollectionManager setOtherContentsItems:](self, "setOtherContentsItems:", v16);
    -[CKAttachmentCollectionManager delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "attachmentCollectionManagerDidUpdateAttachmentItems:", self);

  }
  _Block_object_dispose(&v43, 8);

}

void __50__CKAttachmentCollectionManager_chatItemsChanged___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  id *v15;
  id v16;
  id v17;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "guidFromChatItem:", v4);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v17;
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transferForGUID:", v17);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "localPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "__ck_stringByExpandingTildeInPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createdDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shareURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKAttachmentItemManager attachmentWithFileURL:size:transferGUID:guid:createdDate:shareURL:](CKAttachmentItemManager, "attachmentWithFileURL:size:transferGUID:guid:createdDate:shareURL:", v10, v17, v17, v11, v12, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = (const __CFString *)objc_msgSend(v13, "UTIType");
      if (UTTypeConformsTo(v14, (CFStringRef)*MEMORY[0x1E0CA5B90])
        || UTTypeConformsTo(v14, (CFStringRef)*MEMORY[0x1E0CA5BF8]))
      {
        v15 = (id *)(a1 + 48);
      }
      else
      {
        v15 = (id *)(a1 + 56);
      }
      v16 = *v15;
      objc_msgSend(v16, "addObject:", v13);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;

    v5 = v17;
  }

}

void __50__CKAttachmentCollectionManager_chatItemsChanged___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "guidFromChatItem:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
    v5 = v6;
  }

}

void __50__CKAttachmentCollectionManager_chatItemsChanged___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "guid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6);

  if ((_DWORD)v5)
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
}

void __50__CKAttachmentCollectionManager_chatItemsChanged___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "guid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6);

  if ((_DWORD)v5)
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
}

- (id)guidFromChatItem:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "transferGUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)updateCollections
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  CKAttachmentCollectionManager *v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CKAttachmentCollectionManager chat](self, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chatItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __50__CKAttachmentCollectionManager_updateCollections__block_invoke;
  v17[3] = &unk_1E274DE40;
  v18 = v3;
  v19 = v4;
  v8 = v4;
  v9 = v3;
  objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", 2, v17);

  -[CKAttachmentCollectionManager setPhotosVideosItems:](self, "setPhotosVideosItems:", v9);
  -[CKAttachmentCollectionManager setOtherContentsItems:](self, "setOtherContentsItems:", v8);
  -[CKAttachmentCollectionManager delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attachmentCollectionManagerDidUpdateAttachmentItems:", self);

  v11 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v11, "startTimingForKey:", CFSTR("loadAttachments Query"));
  -[CKAttachmentCollectionManager chat](self, "chat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __50__CKAttachmentCollectionManager_updateCollections__block_invoke_2;
  v14[3] = &unk_1E2758B18;
  v15 = v11;
  v16 = self;
  v13 = v11;
  objc_msgSend(v12, "loadAttachments:", v14);

}

void __50__CKAttachmentCollectionManager_updateCollections__block_invoke(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  id *v17;
  id v18;
  id v19;

  v19 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v19;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v19, "transferGUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "transferForGUID:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "localPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "__ck_stringByExpandingTildeInPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v5;
      v11 = v10;
      if (objc_msgSend(v7, "isSticker"))
      {
        CKStickerPreviewCacheKeyForFileTransfer(v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v9, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "createdDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "shareURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[CKAttachmentItemManager attachmentWithFileURL:size:transferGUID:guid:createdDate:shareURL:](CKAttachmentItemManager, "attachmentWithFileURL:size:transferGUID:guid:createdDate:shareURL:", v12, v10, v11, v13, v14, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = (const __CFString *)objc_msgSend(v15, "UTIType");
          if (UTTypeConformsTo(v16, (CFStringRef)*MEMORY[0x1E0CA5B90])
            || UTTypeConformsTo(v16, (CFStringRef)*MEMORY[0x1E0CA5BF8]))
          {
            v17 = (id *)(a1 + 32);
          }
          else
          {
            v17 = (id *)(a1 + 40);
          }
          v18 = *v17;
          objc_msgSend(v18, "addObject:", v15);

        }
      }

    }
    v4 = v19;
  }

}

void __50__CKAttachmentCollectionManager_updateCollections__block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "stopTimingForKey:", CFSTR("loadAttachments Query"));
  if (a2)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(*(id *)(a1 + 32), "startTimingForKey:", CFSTR("loadAttachments buildup attachments"));
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __50__CKAttachmentCollectionManager_updateCollections__block_invoke_3;
    v16[3] = &unk_1E2758AF0;
    v16[4] = *(_QWORD *)(a1 + 40);
    v11 = v9;
    v17 = v11;
    v12 = v10;
    v18 = v12;
    objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", 2, v16);
    objc_msgSend(*(id *)(a1 + 32), "stopTimingForKey:", CFSTR("loadAttachments buildup attachments"));
    objc_msgSend(*(id *)(a1 + 40), "setPhotosVideosItems:", v11);
    objc_msgSend(*(id *)(a1 + 40), "setOtherContentsItems:", v12);
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "attachmentCollectionManagerDidUpdateAttachmentItems:", *(_QWORD *)(a1 + 40));

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v20 = v15;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "timing = %@", buf, 0xCu);
      }

    }
  }

}

void __50__CKAttachmentCollectionManager_updateCollections__block_invoke_3(id *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  id *v18;
  id v19;
  id v20;

  v20 = a2;
  objc_msgSend(v20, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__ck_stringByExpandingTildeInPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "guid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v20, "isSticker") & 1) != 0 || !objc_msgSend(v20, "isTransferComplete"))
  {
    v6 = 0;
  }
  else
  {
    v6 = v5;
    objc_msgSend(a1[4], "photoTransferGUIDs");
    v7 = objc_claimAutoreleasedReturnValue();
    if (!v7
      || (v8 = (void *)v7,
          objc_msgSend(a1[4], "photoTransferGUIDs"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "containsObject:", v6),
          v9,
          v8,
          v10))
    {
      objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "transferForGUID:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "createdDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shareURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKAttachmentItemManager attachmentWithFileURL:size:transferGUID:guid:createdDate:shareURL:](CKAttachmentItemManager, "attachmentWithFileURL:size:transferGUID:guid:createdDate:shareURL:", v13, v6, v6, v14, v15, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = (const __CFString *)objc_msgSend(v16, "UTIType");
        if (UTTypeConformsTo(v17, (CFStringRef)*MEMORY[0x1E0CA5B90])
          || UTTypeConformsTo(v17, (CFStringRef)*MEMORY[0x1E0CA5BF8]))
        {
          v18 = a1 + 5;
        }
        else
        {
          v18 = a1 + 6;
        }
        v19 = *v18;
        objc_msgSend(v19, "addObject:", v16);
        objc_msgSend(v16, "setIsSticker:", objc_msgSend(v20, "isSticker"));

      }
    }
  }

}

- (void)deleteAttachmentItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  CKAttachmentCollectionManager *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v46 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v11, "transferGUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "transferGUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
  {
    -[CKAttachmentCollectionManager photosVideosItems](self, "photosVideosItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)objc_msgSend(v14, "mutableCopy");

    -[CKAttachmentCollectionManager otherContentsItems](self, "otherContentsItems");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v35 = self;
    -[CKAttachmentCollectionManager photosVideosItems](self, "photosVideosItems");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v42 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
          objc_msgSend(v22, "transferGUID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v5, "containsObject:", v23);

          if (v24)
            objc_msgSend(v36, "removeObject:", v22);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      }
      while (v19);
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    -[CKAttachmentCollectionManager otherContentsItems](v35, "otherContentsItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v38;
      do
      {
        for (k = 0; k != v27; ++k)
        {
          if (*(_QWORD *)v38 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * k);
          objc_msgSend(v30, "transferGUID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v5, "containsObject:", v31);

          if (v32)
            objc_msgSend(v16, "removeObject:", v30);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      }
      while (v27);
    }

    -[CKAttachmentCollectionManager setPhotosVideosItems:](v35, "setPhotosVideosItems:", v36);
    -[CKAttachmentCollectionManager setOtherContentsItems:](v35, "setOtherContentsItems:", v16);
    -[CKAttachmentCollectionManager chat](v35, "chat");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "deleteTransfers:", v5);

    -[CKAttachmentCollectionManager delegate](v35, "delegate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "attachmentCollectionManagerDidUpdateAttachmentItems:", v35);

  }
}

- (CKAttachmentCollectionManagerDelegate)delegate
{
  return (CKAttachmentCollectionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)photosVideosItems
{
  return self->_photosVideosItems;
}

- (void)setPhotosVideosItems:(id)a3
{
  objc_storeStrong((id *)&self->_photosVideosItems, a3);
}

- (NSArray)webLinksItems
{
  return self->_webLinksItems;
}

- (void)setWebLinksItems:(id)a3
{
  objc_storeStrong((id *)&self->_webLinksItems, a3);
}

- (NSArray)otherContentsItems
{
  return self->_otherContentsItems;
}

- (void)setOtherContentsItems:(id)a3
{
  objc_storeStrong((id *)&self->_otherContentsItems, a3);
}

- (IMChat)chat
{
  return self->_chat;
}

- (void)setChat:(id)a3
{
  objc_storeStrong((id *)&self->_chat, a3);
}

- (NSSet)photoTransferGUIDs
{
  return self->_photoTransferGUIDs;
}

- (void)setPhotoTransferGUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_photoTransferGUIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoTransferGUIDs, 0);
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_otherContentsItems, 0);
  objc_storeStrong((id *)&self->_webLinksItems, 0);
  objc_storeStrong((id *)&self->_photosVideosItems, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
