@implementation MCBookmarkManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_17);
  return (id)sharedManager_manager;
}

void __34__MCBookmarkManager_sharedManager__block_invoke()
{
  MCBookmarkManager *v0;
  void *v1;

  v0 = objc_alloc_init(MCBookmarkManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

- (MCBookmarkManager)init
{
  MCBookmarkManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *memberQueue;
  int *p_notificationToken;
  NSObject *v6;
  NSObject *v7;
  uint8_t v9[8];
  _QWORD handler[4];
  MCBookmarkManager *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MCBookmarkManager;
  v2 = -[MCBookmarkManager init](&v12, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("memberQueue", MEMORY[0x1E0C80D50]);
    memberQueue = v2->_memberQueue;
    v2->_memberQueue = (OS_dispatch_queue *)v3;

    p_notificationToken = &v2->_notificationToken;
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __25__MCBookmarkManager_init__block_invoke;
    handler[3] = &unk_1E41E0C90;
    v2 = v2;
    v11 = v2;
    LODWORD(p_notificationToken) = notify_register_dispatch("com.apple.managedconfiguration.bookmarkCacheFlush", p_notificationToken, v6, handler);

    if ((_DWORD)p_notificationToken)
    {
      v7 = _MCLogObjects;
      if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_19ECC4000, v7, OS_LOG_TYPE_ERROR, "Could not register for notification.", v9, 2u);
      }

      v2 = 0;
    }
    else
    {
      -[MCBookmarkManager memberQueueRereadBookmarks](v2, "memberQueueRereadBookmarks");
    }

  }
  return v2;
}

void __25__MCBookmarkManager_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "memberQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__MCBookmarkManager_init__block_invoke_2;
  block[3] = &unk_1E41E0C18;
  v4 = *(id *)(a1 + 32);
  dispatch_barrier_async(v2, block);

}

uint64_t __25__MCBookmarkManager_init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "memberQueueRereadBookmarks");
}

- (void)memberQueueRereadBookmarks
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  MCBookmark *v16;
  NSArray *memberQueueCurrentUserBookmarks;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  NSDictionary *v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  MCBookmark *v33;
  NSDictionary *memberQueueStashedBookmarksByLabel;
  NSDictionary *v35;
  void *v36;
  MCBookmarkManager *v37;
  uint64_t v38;
  NSDictionary *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[16];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = _MCLogObjects;
  if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19ECC4000, v3, OS_LOG_TYPE_DEBUG, "Rereading bookmarks", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MCSystemWebContentFilterCurrentUserBookmarksPath();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v5, 0);

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C99D20];
    MCSystemWebContentFilterCurrentUserBookmarksPath();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayWithContentsOfFile:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v11 = v9;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v50 != v14)
            objc_enumerationMutation(v11);
          v16 = -[MCBookmark initWithSerializableDictionary:]([MCBookmark alloc], "initWithSerializableDictionary:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
          -[NSArray addObject:](v10, "addObject:", v16);

        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      }
      while (v13);
    }

    memberQueueCurrentUserBookmarks = self->_memberQueueCurrentUserBookmarks;
    self->_memberQueueCurrentUserBookmarks = v10;

  }
  else
  {
    v11 = self->_memberQueueCurrentUserBookmarks;
    self->_memberQueueCurrentUserBookmarks = 0;
  }

  MCSystemWebContentFilterStashedUserBookmarksPath();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v18, 0);

  v20 = (void *)MEMORY[0x1E0C99D80];
  if (v19)
  {
    v36 = v4;
    v37 = self;
    MCSystemWebContentFilterStashedUserBookmarksPath();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dictionaryWithContentsOfFile:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v22, "count"));
    v39 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v23 = v22;
    v40 = -[NSDictionary countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    if (v40)
    {
      v38 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v40; ++j)
        {
          if (*(_QWORD *)v46 != v38)
            objc_enumerationMutation(v23);
          v25 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
          -[NSDictionary objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v26, "count"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v28 = v26;
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
          if (v29)
          {
            v30 = v29;
            v31 = *(_QWORD *)v42;
            do
            {
              for (k = 0; k != v30; ++k)
              {
                if (*(_QWORD *)v42 != v31)
                  objc_enumerationMutation(v28);
                v33 = -[MCBookmark initWithSerializableDictionary:]([MCBookmark alloc], "initWithSerializableDictionary:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * k));
                objc_msgSend(v27, "addObject:", v33);

              }
              v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
            }
            while (v30);
          }

          -[NSDictionary setObject:forKeyedSubscript:](v39, "setObject:forKeyedSubscript:", v27, v25);
        }
        v40 = -[NSDictionary countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      }
      while (v40);
    }

    memberQueueStashedBookmarksByLabel = v37->_memberQueueStashedBookmarksByLabel;
    v37->_memberQueueStashedBookmarksByLabel = v39;

    v4 = v36;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v35 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v23 = self->_memberQueueStashedBookmarksByLabel;
    self->_memberQueueStashedBookmarksByLabel = v35;
  }

}

- (void)memberQueueSetUserBookmarks:(id)a3
{
  id v5;
  NSArray *memberQueueCurrentUserBookmarks;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_memberQueueCurrentUserBookmarks, a3);
  memberQueueCurrentUserBookmarks = self->_memberQueueCurrentUserBookmarks;
  if (memberQueueCurrentUserBookmarks)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](memberQueueCurrentUserBookmarks, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = self->_memberQueueCurrentUserBookmarks;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "serializableDictionary", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    MCSystemWebContentFilterCurrentUserBookmarksPath();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeToFile:atomically:", v14, 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MCSystemWebContentFilterCurrentUserBookmarksPath();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeItemAtPath:error:", v14, 0);
  }

}

- (void)setUserBookmarks:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MCBookmarkManager memberQueue](self, "memberQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__MCBookmarkManager_setUserBookmarks___block_invoke;
  v7[3] = &unk_1E41E0D70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, v7);

}

uint64_t __38__MCBookmarkManager_setUserBookmarks___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  v1 = *(void **)(a1 + 32);
  v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v1, "memberQueueSetUserBookmarks:", v2);

  return notify_post("com.apple.managedconfiguration.bookmarkCacheFlush");
}

- (NSArray)userBookmarks
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  -[MCBookmarkManager memberQueue](self, "memberQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__MCBookmarkManager_userBookmarks__block_invoke;
  v6[3] = &unk_1E41E0CF8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __34__MCBookmarkManager_userBookmarks__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "memberQueueCurrentUserBookmarks");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (OS_dispatch_queue)memberQueue
{
  return self->_memberQueue;
}

- (void)setMemberQueue:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueue, a3);
}

- (NSArray)memberQueueCurrentUserBookmarks
{
  return self->_memberQueueCurrentUserBookmarks;
}

- (void)setMemberQueueCurrentUserBookmarks:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueCurrentUserBookmarks, a3);
}

- (NSDictionary)memberQueueStashedBookmarksByLabel
{
  return self->_memberQueueStashedBookmarksByLabel;
}

- (void)setMemberQueueStashedBookmarksByLabel:(id)a3
{
  objc_storeStrong((id *)&self->_memberQueueStashedBookmarksByLabel, a3);
}

- (int)notificationToken
{
  return self->_notificationToken;
}

- (void)setNotificationToken:(int)a3
{
  self->_notificationToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberQueueStashedBookmarksByLabel, 0);
  objc_storeStrong((id *)&self->_memberQueueCurrentUserBookmarks, 0);
  objc_storeStrong((id *)&self->_memberQueue, 0);
}

@end
