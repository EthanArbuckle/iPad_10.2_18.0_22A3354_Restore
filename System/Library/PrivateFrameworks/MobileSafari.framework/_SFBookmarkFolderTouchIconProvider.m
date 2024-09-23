@implementation _SFBookmarkFolderTouchIconProvider

- (BOOL)canHandleRequest:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "bookmark");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isFolder");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (_SFBookmarkFolderTouchIconProvider)init
{
  _SFBookmarkFolderTouchIconProvider *v2;
  id v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *bookmarkCollectionAccessQueue;
  NSObject *v6;
  _SFBookmarkFolderTouchIconProvider *v7;
  void *v8;
  _SFBookmarkFolderTouchIconProvider *v9;
  _QWORD block[4];
  _SFBookmarkFolderTouchIconProvider *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_SFBookmarkFolderTouchIconProvider;
  v2 = -[WBSBookmarkFolderTouchIconProvider init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.Safari._SFBookmarkFolderTouchIconProvider.internalQueue.%p"), v2);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = dispatch_queue_create((const char *)objc_msgSend(v3, "UTF8String"), 0);
    bookmarkCollectionAccessQueue = v2->_bookmarkCollectionAccessQueue;
    v2->_bookmarkCollectionAccessQueue = (OS_dispatch_queue *)v4;

    v6 = v2->_bookmarkCollectionAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42___SFBookmarkFolderTouchIconProvider_init__block_invoke;
    block[3] = &unk_1E21E2050;
    v7 = v2;
    v12 = v7;
    dispatch_async(v6, block);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__folderContentsDidChange_, *MEMORY[0x1E0DCCC10], 0);

    v9 = v7;
  }

  return v2;
}

- (id)backgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
}

- (id)defaultFolderIconForRequest:(id)a3
{
  return 0;
}

- (id)folderUUIDForRequest:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "bookmark");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)subrequestsForRequest:(id)a3 maximumNumberOfSubrequests:(unint64_t)a4
{
  void *v6;
  NSObject *bookmarkCollectionAccessQueue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  objc_msgSend(a3, "bookmark");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  bookmarkCollectionAccessQueue = self->_bookmarkCollectionAccessQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __87___SFBookmarkFolderTouchIconProvider_subrequestsForRequest_maximumNumberOfSubrequests___block_invoke;
  v11[3] = &unk_1E21E2988;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v14 = a4;
  v8 = v6;
  dispatch_sync(bookmarkCollectionAccessQueue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (void)_folderContentsDidChange:(id)a3
{
  id v4;
  NSObject *bookmarkCollectionAccessQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  bookmarkCollectionAccessQueue = self->_bookmarkCollectionAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63___SFBookmarkFolderTouchIconProvider__folderContentsDidChange___block_invoke;
  block[3] = &unk_1E21E2EA0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(bookmarkCollectionAccessQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmarkCollectionAccessQueue, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
