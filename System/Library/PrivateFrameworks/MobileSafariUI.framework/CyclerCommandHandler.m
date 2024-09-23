@implementation CyclerCommandHandler

- (CyclerCommandHandler)init
{

  return 0;
}

- (CyclerCommandHandler)initWithBookmarkCollection:(id)a3
{
  id v5;
  CyclerCommandHandler *v6;
  CyclerCommandHandler *v7;
  uint64_t v8;
  NSMutableArray *blocksAwaitingDatabaseLock;
  uint64_t v10;
  WBDatabaseLockAcquisitor *bookmarkDatabaseLockAcquisitor;
  CyclerCommandHandler *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CyclerCommandHandler;
  v6 = -[CyclerCommandHandler init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bookmarkCollection, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    blocksAwaitingDatabaseLock = v7->_blocksAwaitingDatabaseLock;
    v7->_blocksAwaitingDatabaseLock = (NSMutableArray *)v8;

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0DCCB20]), "initWithWebBookmarkCollectionClass:", objc_opt_class());
    bookmarkDatabaseLockAcquisitor = v7->_bookmarkDatabaseLockAcquisitor;
    v7->_bookmarkDatabaseLockAcquisitor = (WBDatabaseLockAcquisitor *)v10;

    -[WBDatabaseLockAcquisitor setDelegate:](v7->_bookmarkDatabaseLockAcquisitor, "setDelegate:", v7);
    v12 = v7;
  }

  return v7;
}

- (void)fetchTopLevelBookmarkList:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a3;
  -[WebBookmarkCollection rootBookmark](self->_bookmarkCollection, "rootBookmark");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CyclerCommandHandler _cyclerRepresentationOfBookmark:](self, "_cyclerRepresentationOfBookmark:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WebBookmarkCollection favoritesFolder](self->_bookmarkCollection, "favoritesFolder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[CyclerCommandHandler _cyclerRepresentationOfBookmark:](self, "_cyclerRepresentationOfBookmark:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertChild:atIndex:", v7, 0);

  }
  v8[2](v8, v5);

}

- (void)clearBookmarksWithOptions:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  const __CFString *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  unint64_t v12;
  char v13;
  uint8_t buf[4];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = CFSTR("local and remote");
    if ((a3 & 1) == 0)
      v8 = CFSTR("local");
    *(_DWORD *)buf = 138543362;
    v15 = v8;
    _os_log_impl(&dword_1D7CA3000, v7, OS_LOG_TYPE_INFO, "Told to clear %{public}@ bookmarks", buf, 0xCu);
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__CyclerCommandHandler_clearBookmarksWithOptions_completionHandler___block_invoke;
  v10[3] = &unk_1E9CF25F0;
  v13 = a3 & 1;
  v10[4] = self;
  v11 = v6;
  v12 = a3;
  v9 = v6;
  -[CyclerCommandHandler _tryToAcquireDatabaseLockWithCompletionHandler:](self, "_tryToAcquireDatabaseLockWithCompletionHandler:", v10);

}

void __68__CyclerCommandHandler_clearBookmarksWithOptions_completionHandler___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  NSObject *v16;
  void (*v17)(void);
  void *v18;
  int v19;
  id v20;
  void (*v21)(void);
  NSObject *v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) == 0)
  {
    v16 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      __68__CyclerCommandHandler_clearBookmarksWithOptions_completionHandler___block_invoke_cold_2();
    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_24:
    v17();
    return;
  }
  if (*(_BYTE *)(a1 + 56))
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "rootList");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bookmarkArray");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v30 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deleteBookmark:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v6);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "favoritesFolderList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bookmarkArray");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v26 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deleteBookmark:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v12);
    }

    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_usesCloudKit")
      && (*(_BYTE *)(a1 + 48) & 2) == 0)
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __68__CyclerCommandHandler_clearBookmarksWithOptions_completionHandler___block_invoke_6;
      v23[3] = &unk_1E9CF25C8;
      v15 = *(void **)(a1 + 32);
      v24 = *(id *)(a1 + 40);
      objc_msgSend(v15, "syncBookmarksWithCompletionHandler:", v23);

      return;
    }
    v17 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_24;
  }
  v18 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v33 = 0;
  v19 = objc_msgSend(v18, "mergeWithBookmarksDictionary:clearHidden:error:", MEMORY[0x1E0C9AA70], 1, &v33);
  v20 = v33;
  if (v19)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "postBookmarksDidReloadNotification");
    v21 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v22 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      __68__CyclerCommandHandler_clearBookmarksWithOptions_completionHandler___block_invoke_cold_1(v22, v20);
    v21 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v21();

}

uint64_t __68__CyclerCommandHandler_clearBookmarksWithOptions_completionHandler___block_invoke_6(uint64_t result, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) < 2 || !a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)createBookmarkWithTitle:(id)a3 url:(id)a4 inListWithIdentifier:(id)a5 atIndex:(unint64_t)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id v25;
  unint64_t v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544130;
    v28 = v12;
    v29 = 2114;
    v30 = v13;
    v31 = 2114;
    v32 = v14;
    v33 = 1024;
    v34 = a6;
    _os_log_impl(&dword_1D7CA3000, v16, OS_LOG_TYPE_INFO, "Told to create a bookmark (title: %{public}@, url: %{public}@) in list (identifier: %{public}@) at index %d", buf, 0x26u);
  }
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __87__CyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke;
  v21[3] = &unk_1E9CF2618;
  v25 = v15;
  v26 = a6;
  v21[4] = self;
  v22 = v14;
  v23 = v12;
  v24 = v13;
  v17 = v13;
  v18 = v12;
  v19 = v14;
  v20 = v15;
  -[CyclerCommandHandler _tryToAcquireDatabaseLockWithCompletionHandler:](self, "_tryToAcquireDatabaseLockWithCompletionHandler:", v21);

}

void __87__CyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void (*v12)(void);
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v17[16];

  if ((a2 & 1) == 0)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __87__CyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke_cold_5();
    goto LABEL_7;
  }
  v3 = objc_msgSend(*(id *)(a1 + 32), "_adjustInsertionIndex:forInsertionIntoListWithIdentifier:", *(_QWORD *)(a1 + 72), objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1D7CA3000, v4, OS_LOG_TYPE_INFO, "Insertion index is not valid; bailing", v17, 2u);
    }
LABEL_7:
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    return;
  }
  v6 = v3;
  v7 = objc_alloc(MEMORY[0x1E0DCCB98]);
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "safari_originalDataAsString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithTitle:address:collectionType:", v8, v9, objc_msgSend(v10, "collectionType"));

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "moveBookmark:toFolderWithID:", v11, objc_msgSend(*(id *)(a1 + 40), "integerValue")) & 1) == 0)
  {
    v13 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __87__CyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke_cold_4();
    goto LABEL_21;
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "saveBookmark:", v11) & 1) == 0)
  {
    v14 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      __87__CyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke_cold_3();
    goto LABEL_21;
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "reorderBookmark:toIndex:", v11, v6) & 1) == 0)
  {
    v15 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      __87__CyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke_cold_2();
    goto LABEL_21;
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "saveBookmark:", v11) & 1) == 0)
  {
    v16 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      __87__CyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke_cold_1();
LABEL_21:
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    goto LABEL_22;
  }
  v12 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_22:
  v12();

}

- (void)createBookmarkListWithTitle:(id)a3 inListWithIdentifier:(id)a4 atIndex:(unint64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v23 = v10;
    v24 = 2114;
    v25 = v11;
    v26 = 1024;
    v27 = a5;
    _os_log_impl(&dword_1D7CA3000, v13, OS_LOG_TYPE_INFO, "Told to create a list (title: %{public}@) in list (identifier: %{public}@) at index %d", buf, 0x1Cu);
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __87__CyclerCommandHandler_createBookmarkListWithTitle_inListWithIdentifier_atIndex_reply___block_invoke;
  v17[3] = &unk_1E9CF2640;
  v20 = v12;
  v21 = a5;
  v17[4] = self;
  v18 = v11;
  v19 = v10;
  v14 = v10;
  v15 = v11;
  v16 = v12;
  -[CyclerCommandHandler _tryToAcquireDatabaseLockWithCompletionHandler:](self, "_tryToAcquireDatabaseLockWithCompletionHandler:", v17);

}

void __87__CyclerCommandHandler_createBookmarkListWithTitle_inListWithIdentifier_atIndex_reply___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void (*v11)(void);
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[16];

  if ((a2 & 1) == 0)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __87__CyclerCommandHandler_createBookmarkListWithTitle_inListWithIdentifier_atIndex_reply___block_invoke_cold_4();
    goto LABEL_7;
  }
  v3 = objc_msgSend(*(id *)(a1 + 32), "_adjustInsertionIndex:forInsertionIntoListWithIdentifier:", *(_QWORD *)(a1 + 64), objc_msgSend(*(id *)(a1 + 40), "integerValue"));
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1D7CA3000, v4, OS_LOG_TYPE_INFO, "Insertion index is not valid; bailing", v15, 2u);
    }
LABEL_7:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    return;
  }
  v6 = v3;
  v7 = objc_alloc(MEMORY[0x1E0DCCB98]);
  v8 = objc_msgSend(*(id *)(a1 + 40), "integerValue");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initFolderWithParentID:collectionType:", v8, objc_msgSend(v9, "collectionType"));

  objc_msgSend(v10, "setTitle:", *(_QWORD *)(a1 + 48));
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "saveBookmark:", v10) & 1) == 0)
  {
    v12 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __87__CyclerCommandHandler_createBookmarkListWithTitle_inListWithIdentifier_atIndex_reply___block_invoke_cold_3();
    goto LABEL_19;
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "reorderBookmark:toIndex:", v10, v6) & 1) == 0)
  {
    v13 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __87__CyclerCommandHandler_createBookmarkListWithTitle_inListWithIdentifier_atIndex_reply___block_invoke_cold_2();
    goto LABEL_19;
  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "saveBookmark:", v10) & 1) == 0)
  {
    v14 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      __87__CyclerCommandHandler_createBookmarkListWithTitle_inListWithIdentifier_atIndex_reply___block_invoke_cold_1();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deleteBookmark:", v10);
LABEL_19:
    v11 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_20;
  }
  v11 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_20:
  v11();

}

- (void)deleteBookmarkWithIdentifier:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v15 = v6;
    _os_log_impl(&dword_1D7CA3000, v8, OS_LOG_TYPE_INFO, "Told to delete a bookmark (identifier: %{public}@)", buf, 0xCu);
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__CyclerCommandHandler_deleteBookmarkWithIdentifier_reply___block_invoke;
  v11[3] = &unk_1E9CF2668;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  -[CyclerCommandHandler _tryToAcquireDatabaseLockWithCompletionHandler:](self, "_tryToAcquireDatabaseLockWithCompletionHandler:", v11);

}

void __59__CyclerCommandHandler_deleteBookmarkWithIdentifier_reply___block_invoke(uint64_t a1, char a2)
{
  uint64_t *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void (*v9)(void);
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    v3 = (uint64_t *)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "bookmarkWithID:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "_isSpecialBookmark:", v4))
      {
        v5 = WBS_LOG_CHANNEL_PREFIXCycler();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          v6 = *v3;
          v11 = 138543362;
          v12 = v6;
          _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_INFO, "Not deleting bookmark with identifier %{public}@ as it's a special bookmark", (uint8_t *)&v11, 0xCu);
        }
      }
      else
      {
        if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "deleteBookmark:", v4) & 1) != 0)
        {
          v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_16:
          v9();

          return;
        }
        v10 = WBS_LOG_CHANNEL_PREFIXCycler();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          __59__CyclerCommandHandler_deleteBookmarkWithIdentifier_reply___block_invoke_cold_2();
      }
    }
    else
    {
      v8 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        __59__CyclerCommandHandler_deleteBookmarkWithIdentifier_reply___block_invoke_cold_1();
    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_16;
  }
  v7 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    __59__CyclerCommandHandler_deleteBookmarkWithIdentifier_reply___block_invoke_cold_3();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)moveBookmarkWithIdentifier:(id)a3 intoListWithIdentifier:(id)a4 atIndex:(unint64_t)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v23 = v10;
    v24 = 2114;
    v25 = v11;
    v26 = 1024;
    v27 = a5;
    _os_log_impl(&dword_1D7CA3000, v13, OS_LOG_TYPE_INFO, "Told to move a bookmark (identifier: %{public}@) into list (identifier: %{public}@) at index %d", buf, 0x1Cu);
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __88__CyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke;
  v17[3] = &unk_1E9CF2640;
  v17[4] = self;
  v18 = v10;
  v20 = v12;
  v21 = a5;
  v19 = v11;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  -[CyclerCommandHandler _tryToAcquireDatabaseLockWithCompletionHandler:](self, "_tryToAcquireDatabaseLockWithCompletionHandler:", v17);

}

void __88__CyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke(uint64_t a1, char a2)
{
  uint64_t *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    v3 = (uint64_t *)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "bookmarkWithID:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v11 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        __88__CyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke_cold_1();
      goto LABEL_25;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "_isSpecialBookmark:", v4))
    {
      v5 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = *v3;
        v18 = 138543362;
        v19 = v6;
        v7 = "Not moving bookmark with identifier %{public}@ as it's a special bookmark";
        v8 = v5;
        v9 = 12;
LABEL_14:
        _os_log_impl(&dword_1D7CA3000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v18, v9);
      }
    }
    else
    {
      v12 = objc_msgSend(*(id *)(a1 + 32), "_adjustInsertionIndex:forInsertionIntoListWithIdentifier:", *(_QWORD *)(a1 + 64), objc_msgSend(*(id *)(a1 + 48), "integerValue"));
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = WBS_LOG_CHANNEL_PREFIXCycler();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          LOWORD(v18) = 0;
          v7 = "Insertion index is not valid; bailing";
          v8 = v13;
          v9 = 2;
          goto LABEL_14;
        }
      }
      else
      {
        v14 = v12;
        if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "moveBookmark:toFolderWithID:", v4, objc_msgSend(*(id *)(a1 + 48), "integerValue")) & 1) != 0)
        {
          if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "reorderBookmark:toIndex:", v4, v14) & 1) != 0)
          {
            if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "saveBookmark:", v4) & 1) != 0)
            {
              (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 1);
LABEL_26:

              return;
            }
            v17 = WBS_LOG_CHANNEL_PREFIXCycler();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
              __88__CyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke_cold_2();
          }
          else
          {
            v16 = WBS_LOG_CHANNEL_PREFIXCycler();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
              __88__CyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke_cold_3();
          }
        }
        else
        {
          v15 = WBS_LOG_CHANNEL_PREFIXCycler();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            __88__CyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke_cold_4();
        }
      }
    }
LABEL_25:
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 0);
    goto LABEL_26;
  }
  v10 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    __88__CyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke_cold_5();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)setTitle:(id)a3 forBookmarkWithIdentifier:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v20 = v9;
    v21 = 2114;
    v22 = v8;
    _os_log_impl(&dword_1D7CA3000, v11, OS_LOG_TYPE_INFO, "Told to change title of bookmark (identifier: %{public}@) to %{public}@", buf, 0x16u);
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__CyclerCommandHandler_setTitle_forBookmarkWithIdentifier_reply___block_invoke;
  v15[3] = &unk_1E9CF2690;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  -[CyclerCommandHandler _tryToAcquireDatabaseLockWithCompletionHandler:](self, "_tryToAcquireDatabaseLockWithCompletionHandler:", v15);

}

void __65__CyclerCommandHandler_setTitle_forBookmarkWithIdentifier_reply___block_invoke(uint64_t a1, char a2)
{
  uint64_t *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void (*v9)(void);
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    v3 = (uint64_t *)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "bookmarkWithID:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "_isSpecialBookmark:", v4))
      {
        v5 = WBS_LOG_CHANNEL_PREFIXCycler();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          v6 = *v3;
          v11 = 138543362;
          v12 = v6;
          _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_INFO, "Not changing title of bookmark with identifier %{public}@ as it's a special bookmark", (uint8_t *)&v11, 0xCu);
        }
      }
      else
      {
        objc_msgSend(v4, "setTitle:", *(_QWORD *)(a1 + 48));
        if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "saveBookmark:", v4) & 1) != 0)
        {
          v9 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_16:
          v9();

          return;
        }
        v10 = WBS_LOG_CHANNEL_PREFIXCycler();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          __65__CyclerCommandHandler_setTitle_forBookmarkWithIdentifier_reply___block_invoke_cold_2();
      }
    }
    else
    {
      v8 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        __65__CyclerCommandHandler_setTitle_forBookmarkWithIdentifier_reply___block_invoke_cold_1();
    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_16;
  }
  v7 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    __65__CyclerCommandHandler_setTitle_forBookmarkWithIdentifier_reply___block_invoke_cold_3();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)setURL:(id)a3 forBookmarkWithIdentifier:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v20 = v9;
    v21 = 2114;
    v22 = v8;
    _os_log_impl(&dword_1D7CA3000, v11, OS_LOG_TYPE_INFO, "Told to change URL of bookmark (identifier: %{public}@) to %{public}@", buf, 0x16u);
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__CyclerCommandHandler_setURL_forBookmarkWithIdentifier_reply___block_invoke;
  v15[3] = &unk_1E9CF2690;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v8;
  v13 = v9;
  v14 = v10;
  -[CyclerCommandHandler _tryToAcquireDatabaseLockWithCompletionHandler:](self, "_tryToAcquireDatabaseLockWithCompletionHandler:", v15);

}

void __63__CyclerCommandHandler_setURL_forBookmarkWithIdentifier_reply___block_invoke(uint64_t a1, char a2)
{
  uint64_t *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void (*v10)(void);
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((a2 & 1) != 0)
  {
    v3 = (uint64_t *)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "bookmarkWithID:", objc_msgSend(*(id *)(a1 + 40), "integerValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "_isSpecialBookmark:", v4))
      {
        v5 = WBS_LOG_CHANNEL_PREFIXCycler();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          v6 = *v3;
          v12 = 138543362;
          v13 = v6;
          _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_INFO, "Not changing URL of bookmark with identifier %{public}@ as it's a special bookmark", (uint8_t *)&v12, 0xCu);
        }
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "safari_originalDataAsString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setAddress:", v9);

        if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "saveBookmark:", v4) & 1) != 0)
        {
          v10 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_16:
          v10();

          return;
        }
        v11 = WBS_LOG_CHANNEL_PREFIXCycler();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
          __63__CyclerCommandHandler_setURL_forBookmarkWithIdentifier_reply___block_invoke_cold_2();
      }
    }
    else
    {
      v8 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        __63__CyclerCommandHandler_setURL_forBookmarkWithIdentifier_reply___block_invoke_cold_1();
    }
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_16;
  }
  v7 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    __63__CyclerCommandHandler_setURL_forBookmarkWithIdentifier_reply___block_invoke_cold_3();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)syncBookmarksWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_INFO, "Told to sync bookmarks", buf, 2u);
  }
  if (-[CyclerCommandHandler _isBookmarkSyncEnabled](self, "_isBookmarkSyncEnabled"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__CyclerCommandHandler_syncBookmarksWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E9CF26B8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v7);

  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7CA3000, v6, OS_LOG_TYPE_INFO, "Not syncing because bookmark sync is disabled", buf, 2u);
    }
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 2);
  }

}

void __59__CyclerCommandHandler_syncBookmarksWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  uint8_t buf[16];

  v2 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7CA3000, v2, OS_LOG_TYPE_INFO, "Posting bookmark change notification", buf, 2u);
  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__CyclerCommandHandler_syncBookmarksWithCompletionHandler___block_invoke_10;
  v4[3] = &unk_1E9CF25C8;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_startMonitoringSyncStatusWithCompletionHandler:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "_postBookmarksChangedSyncNotification");

}

uint64_t __59__CyclerCommandHandler_syncBookmarksWithCompletionHandler___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)databaseLockAcquisitor:(id)a3 acquiredLock:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CyclerCommandHandler_databaseLockAcquisitor_acquiredLock___block_invoke;
  block[3] = &unk_1E9CF1D28;
  v10 = a4;
  block[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __60__CyclerCommandHandler_databaseLockAcquisitor_acquiredLock___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t result;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 40), "releaseLock", (_QWORD)v8);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects", (_QWORD)v8);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 0;
  return result;
}

- (void)_startMonitoringSyncStatusWithCompletionHandler:(id)a3
{
  id v4;
  __CFString *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  WBSDistributedNotificationObserver *v9;
  WBSDistributedNotificationObserver *syncAgentNotificationObserver;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint8_t buf[8];
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  if (-[WebBookmarkCollection _usesCloudKit](self->_bookmarkCollection, "_usesCloudKit"))
  {
    v5 = (__CFString *)(id)*MEMORY[0x1E0D89F48];
    v6 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7CA3000, v6, OS_LOG_TYPE_INFO, "In CloudKit mode – waiting for notification from sync agent", buf, 2u);
    }
    v7 = 0;
  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXCycler();
    v7 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v7 = 1;
      _os_log_impl(&dword_1D7CA3000, v8, OS_LOG_TYPE_INFO, "In DAV mode – waiting for notification from DAV client", buf, 2u);
    }
    v5 = CFSTR("com.apple.bookmarks.BookmarksFileChanged");
  }
  -[WBSDistributedNotificationObserver stopWaiting](self->_syncAgentNotificationObserver, "stopWaiting");
  v9 = (WBSDistributedNotificationObserver *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8A8D0]), "initWithNotificationName:type:", v5, v7);
  syncAgentNotificationObserver = self->_syncAgentNotificationObserver;
  self->_syncAgentNotificationObserver = v9;

  v11 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __72__CyclerCommandHandler__startMonitoringSyncStatusWithCompletionHandler___block_invoke;
  v20[3] = &unk_1E9CF26E0;
  objc_copyWeak(&v22, &location);
  v12 = v4;
  v21 = v12;
  -[WBSDistributedNotificationObserver setNotificationHandler:](self->_syncAgentNotificationObserver, "setNotificationHandler:", v20);
  v14 = v11;
  v15 = 3221225472;
  v16 = __72__CyclerCommandHandler__startMonitoringSyncStatusWithCompletionHandler___block_invoke_14;
  v17 = &unk_1E9CF2708;
  objc_copyWeak(&v19, &location);
  v13 = v12;
  v18 = v13;
  -[WBSDistributedNotificationObserver setTimeoutHandler:](self->_syncAgentNotificationObserver, "setTimeoutHandler:", &v14);
  -[WBSDistributedNotificationObserver waitWithTimeout:](self->_syncAgentNotificationObserver, "waitWithTimeout:", 60.0, v14, v15, v16, v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
}

uint64_t __72__CyclerCommandHandler__startMonitoringSyncStatusWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void (*v10)(void);
  void *v11;
  uint8_t v13[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_6;
  if (objc_msgSend(*((id *)WeakRetained + 1), "_usesCloudKit"))
  {
    objc_msgSend(v3, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D89F68]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7 || objc_msgSend(v7, "integerValue"))
    {

LABEL_6:
      v8 = 0;
      goto LABEL_11;
    }

  }
  v9 = WBS_LOG_CHANNEL_PREFIXCycler();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1D7CA3000, v9, OS_LOG_TYPE_INFO, "Received notification from sync agent indicating sync has finished", v13, 2u);
  }
  v10 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  v8 = 1;
  v10();
  v11 = (void *)v5[3];
  v5[3] = 0;

LABEL_11:
  return v8;
}

void __72__CyclerCommandHandler__startMonitoringSyncStatusWithCompletionHandler___block_invoke_14(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCycler();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __72__CyclerCommandHandler__startMonitoringSyncStatusWithCompletionHandler___block_invoke_14_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = (void *)WeakRetained[3];
    WeakRetained[3] = 0;

  }
}

- (BOOL)_isSpecialBookmark:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "identifier"))
    v4 = objc_msgSend(v3, "specialID") != 0;
  else
    v4 = 1;

  return v4;
}

- (unint64_t)_adjustInsertionIndex:(unint64_t)a3 forInsertionIntoListWithIdentifier:(int)a4
{
  unint64_t v4;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  unint64_t v9;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  uint64_t v13;

  v4 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    if (a3)
    {
      -[WebBookmarkCollection favoritesFolder](self->_bookmarkCollection, "favoritesFolder");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        v7 = 4;
      else
        v7 = 3;
      v8 = WBS_LOG_CHANNEL_PREFIXCycler();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = v7 + v4;
        v10[0] = 67109376;
        v10[1] = v4;
        v11 = 1024;
        v12 = v9;
        _os_log_impl(&dword_1D7CA3000, v8, OS_LOG_TYPE_INFO, "Adjusting insertion index %d to %d because it's offset by special bookmarks in the root folder", (uint8_t *)v10, 0xEu);
        return v9;
      }
      else
      {
        v4 += v7;
      }
    }
    else
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v4;
}

- (id)_cyclerRepresentationOfBookmark:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isFolder"))
  {
    v5 = objc_alloc(MEMORY[0x1E0D8A8B0]);
    objc_msgSend(v4, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "initWithTitle:uniqueIdentifier:", v6, v8);

    -[WebBookmarkCollection listWithID:](self->_bookmarkCollection, "listWithID:", objc_msgSend(v4, "identifier"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v10, "bookmarkArray", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          -[CyclerCommandHandler _cyclerRepresentationOfBookmark:](self, "_cyclerRepresentationOfBookmark:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addChild:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v13);
    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "address");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "safari_URLWithDataAsString:", v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_alloc(MEMORY[0x1E0D8A8A0]);
    objc_msgSend(v4, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v4, "identifier"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v19, "initWithURL:title:uniqueIdentifier:", v10, v11, v21);

  }
  if (-[WebBookmarkCollection _usesCloudKit](self->_bookmarkCollection, "_usesCloudKit"))
  {
    objc_msgSend(v4, "extraAttributes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setExtraAttributes:", v22);

  }
  return v9;
}

- (void)_tryToAcquireDatabaseLockWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__CyclerCommandHandler__tryToAcquireDatabaseLockWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E9CF26B8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __71__CyclerCommandHandler__tryToAcquireDatabaseLockWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = _Block_copy(*(const void **)(a1 + 40));
  objc_msgSend(v2, "addObject:", v3);

  v4 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v4 + 40))
  {
    objc_msgSend(*(id *)(v4 + 32), "acquireLockWithTimeout:retryInterval:", 5.0, 0.1);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  }
}

- (BOOL)_isBookmarkSyncEnabled
{
  void *v2;
  int v3;
  id v4;
  void *v5;
  char v6;

  +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCloudSyncAvailable");

  if (!v3)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  objc_msgSend(v4, "aa_primaryAppleAccountWithPreloadedDataclasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEnabledForDataclass:", *MEMORY[0x1E0C8F368]);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkDatabaseLockAcquisitor, 0);
  objc_storeStrong((id *)&self->_syncAgentNotificationObserver, 0);
  objc_storeStrong((id *)&self->_blocksAwaitingDatabaseLock, 0);
  objc_storeStrong((id *)&self->_bookmarkCollection, 0);
}

void __68__CyclerCommandHandler_clearBookmarksWithOptions_completionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_fault_impl(&dword_1D7CA3000, v3, OS_LOG_TYPE_FAULT, "Failed to clear local bookmarks - %{public}@", (uint8_t *)&v5, 0xCu);

}

void __68__CyclerCommandHandler_clearBookmarksWithOptions_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12(&dword_1D7CA3000, v0, v1, "Failed to clear %{public}@ bookmarks - could not acquire database lock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __87__CyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D7CA3000, v0, v1, "Failed to save after moving bookmark into final position", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __87__CyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D7CA3000, v0, v1, "Failed to move bookmark to final position", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __87__CyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D7CA3000, v0, v1, "Failed to save after inserting bookmark", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __87__CyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D7CA3000, v0, v1, "Failed to insert bookmark", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __87__CyclerCommandHandler_createBookmarkWithTitle_url_inListWithIdentifier_atIndex_reply___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D7CA3000, v0, v1, "Failed to create bookmark - could not acquire database lock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __87__CyclerCommandHandler_createBookmarkListWithTitle_inListWithIdentifier_atIndex_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D7CA3000, v0, v1, "Failed to save after moving bookmark list to final position", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __87__CyclerCommandHandler_createBookmarkListWithTitle_inListWithIdentifier_atIndex_reply___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D7CA3000, v0, v1, "Failed to move bookmark list to final position", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __87__CyclerCommandHandler_createBookmarkListWithTitle_inListWithIdentifier_atIndex_reply___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D7CA3000, v0, v1, "Failed to save after inserting bookmark list into initial position", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __87__CyclerCommandHandler_createBookmarkListWithTitle_inListWithIdentifier_atIndex_reply___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D7CA3000, v0, v1, "Failed to create bookmark list - could not acquire database lock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __59__CyclerCommandHandler_deleteBookmarkWithIdentifier_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12(&dword_1D7CA3000, v0, v1, "Failed to delete bookmark - no bookmark exists with identifier %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __59__CyclerCommandHandler_deleteBookmarkWithIdentifier_reply___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D7CA3000, v0, v1, "Failed to delete bookmark from database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __59__CyclerCommandHandler_deleteBookmarkWithIdentifier_reply___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D7CA3000, v0, v1, "Failed to delete bookmark - could not acquire database lock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __88__CyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12(&dword_1D7CA3000, v0, v1, "Failed to move bookmark - no bookmark exists with identifier %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __88__CyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D7CA3000, v0, v1, "Failed to save bookmarks after moving", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __88__CyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D7CA3000, v0, v1, "Failed to reorder bookmark to final position", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __88__CyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D7CA3000, v0, v1, "Failed to move bookmark to destination folder", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __88__CyclerCommandHandler_moveBookmarkWithIdentifier_intoListWithIdentifier_atIndex_reply___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D7CA3000, v0, v1, "Failed to move bookmark - could not acquire database lock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __65__CyclerCommandHandler_setTitle_forBookmarkWithIdentifier_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12(&dword_1D7CA3000, v0, v1, "Failed to change title of bookmark - no bookmark exists with identifier %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __65__CyclerCommandHandler_setTitle_forBookmarkWithIdentifier_reply___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D7CA3000, v0, v1, "Failed to save bookmarks after changing title", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __65__CyclerCommandHandler_setTitle_forBookmarkWithIdentifier_reply___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D7CA3000, v0, v1, "Failed to change title of bookmark - could not acquire database lock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __63__CyclerCommandHandler_setURL_forBookmarkWithIdentifier_reply___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_12(&dword_1D7CA3000, v0, v1, "Failed to change URL of bookmark - no bookmark exists with identifier %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_10();
}

void __63__CyclerCommandHandler_setURL_forBookmarkWithIdentifier_reply___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D7CA3000, v0, v1, "Failed to save bookmarks after changing URL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __63__CyclerCommandHandler_setURL_forBookmarkWithIdentifier_reply___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D7CA3000, v0, v1, "Failed to change URL of bookmark - could not acquire database lock", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __72__CyclerCommandHandler__startMonitoringSyncStatusWithCompletionHandler___block_invoke_14_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1D7CA3000, v0, v1, "Timed out waiting for sync agent to finish syncing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
