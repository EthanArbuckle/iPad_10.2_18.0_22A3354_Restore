@implementation ANAnnouncementManager

+ (id)managerWithEndpointID:(id)a3
{
  id v3;
  ANAnnouncementManager *v4;

  v3 = a3;
  v4 = -[ANAnnouncementManager initWithEndpointID:]([ANAnnouncementManager alloc], "initWithEndpointID:", v3);

  return v4;
}

- (ANAnnouncementManager)initWithEndpointID:(id)a3
{
  id v5;
  ANAnnouncementManager *v6;
  ANAnnouncementManager *v7;
  uint64_t v8;
  OS_os_log *log;
  uint64_t v10;
  NSMutableDictionary *homeAnnouncements;
  uint64_t v12;
  NSMutableDictionary *timers;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *serialQueue;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ANAnnouncementManager;
  v6 = -[ANAnnouncementManager init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpointID, a3);
    ANLogBuildCategoryName();
    ANLogWithCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

    v10 = objc_opt_new();
    homeAnnouncements = v7->_homeAnnouncements;
    v7->_homeAnnouncements = (NSMutableDictionary *)v10;

    v12 = objc_opt_new();
    timers = v7->_timers;
    v7->_timers = (NSMutableDictionary *)v12;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.announce.announcementManager", v14);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v15;

    -[ANAnnouncementManager _loadStoredAnnouncements](v7, "_loadStoredAnnouncements");
    -[ANAnnouncementManager _cleanDirectory](v7, "_cleanDirectory");

  }
  return v7;
}

- (void)cleanForExit
{
  NSObject *v3;
  _QWORD block[5];

  -[ANAnnouncementManager serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__ANAnnouncementManager_cleanForExit__block_invoke;
  block[3] = &unk_1E938F9B0;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __37__ANAnnouncementManager_cleanForExit__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "timers");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

- (void)addAnnouncement:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16;
  uint64_t *v17;
  _QWORD *v18;
  id v19;
  _QWORD v20[6];
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ANAnnouncementManager serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__8;
  v27 = __Block_byref_object_dispose__8;
  v28 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__8;
  v21[4] = __Block_byref_object_dispose__8;
  v22 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __59__ANAnnouncementManager_addAnnouncement_completionHandler___block_invoke;
  v20[3] = &unk_1E93909F8;
  v20[4] = &v23;
  v20[5] = v21;
  if (!-[ANAnnouncementManager _shouldAccept:accept:](self, "_shouldAccept:accept:", v6, v20))
  {
    if (!v7)
      goto LABEL_10;
    goto LABEL_9;
  }
  +[ANUserNotificationController sharedController](ANUserNotificationController, "sharedController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "canPostUserNotificationForAnnouncement:home:", v6, v24[5]);

  if ((v11 & 1) != 0)
  {
    objc_initWeak(location, self);
    -[ANAnnouncementManager serialQueue](self, "serialQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __59__ANAnnouncementManager_addAnnouncement_completionHandler___block_invoke_6;
    block[3] = &unk_1E9390A20;
    objc_copyWeak(&v19, location);
    v15 = v6;
    v17 = &v23;
    v18 = v21;
    v16 = v7;
    dispatch_async(v12, block);

    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
    goto LABEL_10;
  }
  -[ANAnnouncementManager log](self, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(location[0]) = 138412290;
    *(id *)((char *)location + 4) = v6;
    _os_log_impl(&dword_1D23A0000, v13, OS_LOG_TYPE_DEFAULT, "Can't post user notification. Dropping announcement: %@", (uint8_t *)location, 0xCu);
  }

  if (v7)
LABEL_9:
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
LABEL_10:
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(&v23, 8);
}

void __59__ANAnnouncementManager_addAnnouncement_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __59__ANAnnouncementManager_addAnnouncement_completionHandler___block_invoke_6(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "announcementForID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(WeakRetained, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "Received duplicate announcement and updating existing: %@", (uint8_t *)&v10, 0xCu);

    }
    v7 = objc_msgSend(WeakRetained, "_updateAnnouncement:withContentsOfAnnouncement:home:groupID:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  else
  {
    v7 = objc_msgSend(WeakRetained, "_addAnnouncement:home:groupID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v8);

}

- (void)updateAnnouncement:(id)a3 statusFlags:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  ANAnnouncementManager *v12;
  unint64_t v13;

  v6 = a3;
  -[ANAnnouncementManager serialQueue](self, "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  -[ANAnnouncementManager serialQueue](self, "serialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__ANAnnouncementManager_updateAnnouncement_statusFlags___block_invoke;
  block[3] = &unk_1E938F6B8;
  v12 = self;
  v13 = a4;
  v11 = v6;
  v9 = v6;
  dispatch_sync(v8, block);

}

void __56__ANAnnouncementManager_updateAnnouncement_statusFlags___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "setStatusFlags:", *(_QWORD *)(a1 + 48) | objc_msgSend(*(id *)(a1 + 32), "statusFlags"));
  objc_msgSend(*v2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __56__ANAnnouncementManager_updateAnnouncement_statusFlags___block_invoke_cold_1(v2, v10);

    +[ANAnalytics shared](ANAnalytics, "shared");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "endpointID");
    v11 = objc_claimAutoreleasedReturnValue();
    +[ANAnalyticsContext contextWithEndpointID:](ANAnalyticsContext, "contextWithEndpointID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "error:context:", 5005, v12);

    goto LABEL_11;
  }
  +[ANHomeManager shared](ANHomeManager, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "homeForID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __56__ANAnnouncementManager_updateAnnouncement_statusFlags___block_invoke_cold_2();
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "groupID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "announcementsForGroupID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    +[ANUserNotificationController sharedController](ANUserNotificationController, "sharedController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateNotificationForAnnouncements:home:groupID:", v8, v6, v7);

  }
LABEL_12:

}

- (id)announcementsForGroupID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[NSMutableDictionary objectForKey:](self->_homeAnnouncements, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (id)announcementForID:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSMutableDictionary *obj;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_homeAnnouncements;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = MEMORY[0x1E0C809B0];
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKey:](self->_homeAnnouncements, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = v8;
        v15[1] = 3221225472;
        v15[2] = __43__ANAnnouncementManager_announcementForID___block_invoke;
        v15[3] = &unk_1E93904A0;
        v16 = v4;
        v11 = objc_msgSend(v10, "indexOfObjectPassingTest:", v15);
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v10, "objectAtIndex:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }

        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

uint64_t __43__ANAnnouncementManager_announcementForID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)announcementsForIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[ANAnnouncementManager announcementForID:](self, "announcementForID:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (NSArray)allAnnouncementsSortedByReceipt
{
  void *v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = self->_homeAnnouncements;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKey:](self->_homeAnnouncements, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v17;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v17 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13++));
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          }
          while (v11);
        }

        ++v8;
      }
      while (v8 != v6);
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_27);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v14;
}

uint64_t __56__ANAnnouncementManager_allAnnouncementsSortedByReceipt__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "receiptTimestamp");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        objc_msgSend(v5, "receiptTimestamp"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    objc_msgSend(v4, "receiptTimestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "receiptTimestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "compare:", v10);

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)removeOldAnnouncements
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[ANAnnouncementManager serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__ANAnnouncementManager_removeOldAnnouncements__block_invoke;
  v4[3] = &unk_1E938F518;
  objc_copyWeak(&v5, &location);
  dispatch_sync(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__ANAnnouncementManager_removeOldAnnouncements__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_removeAnnouncementsHittingStorageAgeLimit");

}

- (void)removeAllAnnouncements
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[ANAnnouncementManager serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__ANAnnouncementManager_removeAllAnnouncements__block_invoke;
  v4[3] = &unk_1E938F518;
  objc_copyWeak(&v5, &location);
  dispatch_sync(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__ANAnnouncementManager_removeAllAnnouncements__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cleanDirectory");

}

- (void)pauseAllTimers
{
  NSObject *v3;
  _QWORD block[5];

  -[ANAnnouncementManager serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__ANAnnouncementManager_pauseAllTimers__block_invoke;
  block[3] = &unk_1E938F9B0;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __39__ANAnnouncementManager_pauseAllTimers__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "timersSuspended");
  if ((result & 1) == 0)
  {
    +[ANUserNotificationController sharedController](ANUserNotificationController, "sharedController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "homeAnnouncements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pauseExpirationForNotificationsWithGroupIDs:", v5);

    objc_msgSend(*(id *)(a1 + 32), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "timers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v22 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1D23A0000, v6, OS_LOG_TYPE_DEFAULT, "Pausing All Timers: (%lu) timers", buf, 0xCu);

    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "timers", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
          objc_msgSend(*(id *)(a1 + 32), "timers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            objc_msgSend(*(id *)(a1 + 32), "_suspendTimer:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    return objc_msgSend(*(id *)(a1 + 32), "setTimersSuspended:", 1);
  }
  return result;
}

- (void)resumeAllTimers
{
  NSObject *v3;
  _QWORD block[5];

  -[ANAnnouncementManager serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ANAnnouncementManager_resumeAllTimers__block_invoke;
  block[3] = &unk_1E938F9B0;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __40__ANAnnouncementManager_resumeAllTimers__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "timersSuspended");
  if ((_DWORD)result)
  {
    +[ANUserNotificationController sharedController](ANUserNotificationController, "sharedController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "homeAnnouncements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resumeExpirationForNotificationsWithGroupIDs:", v5);

    objc_msgSend(*(id *)(a1 + 32), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "timers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v22 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1D23A0000, v6, OS_LOG_TYPE_DEFAULT, "Resuming All Timers: (%lu) timers", buf, 0xCu);

    }
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "timers", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
          objc_msgSend(*(id *)(a1 + 32), "timers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKey:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            objc_msgSend(*(id *)(a1 + 32), "_startTimer:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    return objc_msgSend(*(id *)(a1 + 32), "setTimersSuspended:", 0);
  }
  return result;
}

- (void)resetAllTimers
{
  NSObject *v3;
  _QWORD block[5];

  -[ANAnnouncementManager serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__ANAnnouncementManager_resetAllTimers__block_invoke;
  block[3] = &unk_1E938F9B0;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __39__ANAnnouncementManager_resetAllTimers__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "timers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 32), "_resetTimer:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)_addAnnouncement:(id)a3 home:(id)a4 groupID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  NSObject *v29;
  dispatch_semaphore_t v30;
  CFAbsoluteTime Current;
  NSObject *v32;
  dispatch_time_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v39[5];
  dispatch_semaphore_t v40;
  CFAbsoluteTime v41;
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[ANAnnouncementManager serialQueue](self, "serialQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  objc_msgSend(MEMORY[0x1E0CF7EA8], "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0CF7DB8];
  -[ANAnnouncementManager endpointID](self, "endpointID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transaction:forEndpointUUID:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CF7EA8], "sharedManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "transaction:setActive:", v15, 1);

  if (!-[ANAnnouncementManager timersSuspended](self, "timersSuspended"))
  {
    +[ANUserNotificationController sharedController](ANUserNotificationController, "sharedController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hasDeliveredNotificationsWithGroupID:", v9);

    if ((v18 & 1) == 0)
    {
      -[ANAnnouncementManager log](self, "log");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v9;
        _os_log_impl(&dword_1D23A0000, v19, OS_LOG_TYPE_DEFAULT, "No existing notifications for Group ID (%@). Will wipe announcements if any.", buf, 0xCu);
      }

      -[ANAnnouncementManager _removeAnnouncementsForGroupID:](self, "_removeAnnouncementsForGroupID:", v9);
    }
  }
  if (!-[ANAnnouncementManager timersSuspended](self, "timersSuspended"))
    -[ANAnnouncementManager _removeAnnouncementsHittingStorageAgeLimit](self, "_removeAnnouncementsHittingStorageAgeLimit");
  +[ANAnnouncementStorageManager sharedManager](ANAnnouncementStorageManager, "sharedManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnouncementManager endpointID](self, "endpointID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "saveAnnouncement:endpointID:", v8, v21);

  -[ANAnnouncementManager _startTimerWithID:](self, "_startTimerWithID:", v9);
  objc_msgSend(v8, "transcriptionText");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22
    || (objc_msgSend(v8, "transcriptionText"),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        v24 = objc_msgSend(v23, "isEqualToString:", &stru_1E93913D0),
        v23,
        v24))
  {
    if (_AXSShowAudioTranscriptions())
    {
      objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "numberForDefault:", *MEMORY[0x1E0CF7C00]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "doubleValue");
      v28 = v27;

      -[ANAnnouncementManager log](self, "log");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D23A0000, v29, OS_LOG_TYPE_DEFAULT, "Processing audio transcriptions", buf, 2u);
      }

      v30 = dispatch_semaphore_create(0);
      Current = CFAbsoluteTimeGetCurrent();
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __55__ANAnnouncementManager__addAnnouncement_home_groupID___block_invoke;
      v39[3] = &unk_1E9390A88;
      v41 = Current;
      v39[4] = self;
      v40 = v30;
      v32 = v30;
      objc_msgSend(v8, "processAudioTranscription:", v39);
      v33 = dispatch_time(0, (uint64_t)(v28 * 1000000000.0));
      dispatch_semaphore_wait(v32, v33);

    }
  }
  -[ANAnnouncementManager _addAnnouncementToReceiveQueue:](self, "_addAnnouncementToReceiveQueue:", v8);
  +[ANUserNotificationController sharedController](ANUserNotificationController, "sharedController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnouncementManager homeAnnouncements](self, "homeAnnouncements");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", v9);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "postNotificationForAnnouncement:groupAnnouncements:home:groupID:", v8, v37, v10, v9);

  -[ANAnnouncementManager _notifyDelegateAnnouncementsChangedForGroupID:](self, "_notifyDelegateAnnouncementsChangedForGroupID:", v9);
  return 1;
}

intptr_t __55__ANAnnouncementManager__addAnnouncement_home_groupID___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  CFAbsoluteTime v5;
  _DWORD v7[2];
  __int16 v8;
  CFAbsoluteTime v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 48);
    v7[0] = 67109376;
    v7[1] = a2;
    v8 = 2048;
    v9 = v5;
    _os_log_impl(&dword_1D23A0000, v4, OS_LOG_TYPE_DEFAULT, "Processed audio transcription: %d in %f seconds", (uint8_t *)v7, 0x12u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (BOOL)_updateAnnouncement:(id)a3 withContentsOfAnnouncement:(id)a4 home:(id)a5 groupID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  char v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint8_t v20[16];

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = a3;
  -[ANAnnouncementManager serialQueue](self, "serialQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  v15 = objc_msgSend(v13, "updateWithContentsOfAnnouncement:", v12);
  if ((v15 & 1) != 0)
  {
    -[ANAnnouncementManager announcementsForGroupID:](self, "announcementsForGroupID:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count"))
    {
      +[ANUserNotificationController sharedController](ANUserNotificationController, "sharedController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "updateNotificationForAnnouncements:home:groupID:", v16, v10, v11);

    }
    -[ANAnnouncementManager _notifyDelegateAnnouncementsChangedForGroupID:](self, "_notifyDelegateAnnouncementsChangedForGroupID:", v11);

  }
  else
  {
    -[ANAnnouncementManager log](self, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_1D23A0000, v18, OS_LOG_TYPE_INFO, "No announcement updates.", v20, 2u);
    }

  }
  return v15;
}

- (void)_notifyDelegateAnnouncementsChangedForGroupID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ANAnnouncementManager log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "Announcements changed for GroupID %@", (uint8_t *)&v8, 0xCu);
  }

  -[ANAnnouncementManager announcementsForGroupID:](self, "announcementsForGroupID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnouncementManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "announcementManager:announcements:didChangeForGroupID:", self, v6, v4);

}

- (BOOL)_shouldAccept:(id)a3 accept:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
  double v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v38;
  void *v39;
  uint8_t buf[4];
  double v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberForDefault:", *MEMORY[0x1E0CF7AC8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dateByAddingTimeInterval:", (double)-objc_msgSend(v9, "integerValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "creationTimestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSince1970");
  v14 = v13;
  objc_msgSend(v11, "timeIntervalSince1970");
  v16 = v14 - v15;

  if (v16 <= 0.0)
  {
    -[ANAnnouncementManager log](self, "log");
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = -v16;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v41 = v24;
      _os_log_impl(&dword_1D23A0000, v23, OS_LOG_TYPE_DEFAULT, "Removing Old Announcement. Exceeded limit by: %f", buf, 0xCu);
    }

    -[ANAnnouncementManager endpointID](self, "endpointID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[ANAnalyticsContext contextWithEndpointID:](ANAnalyticsContext, "contextWithEndpointID:", v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    +[ANAnalytics shared](ANAnalytics, "shared");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "announcementEntryAgeLimit:timeExceeded:context:", v6, v18, v24);

    goto LABEL_12;
  }
  objc_msgSend(v6, "location");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "homeUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    -[ANAnnouncementManager log](self, "log");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[ANAnnouncementManager _shouldAccept:accept:].cold.1(v6, v27);

    +[ANAnalytics shared](ANAnalytics, "shared");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANAnnouncementManager endpointID](self, "endpointID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[ANAnalyticsContext contextWithEndpointID:](ANAnalyticsContext, "contextWithEndpointID:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "error:context:", 5005, v30);

LABEL_12:
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    v22 = 0;
    goto LABEL_21;
  }
  +[ANHomeManager shared](ANHomeManager, "shared");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "homeForID:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v6, "groupID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21 != 0;
    if (v21)
    {
      (*((void (**)(id, void *, void *))v7 + 2))(v7, v20, v21);
    }
    else
    {
      -[ANAnnouncementManager log](self, "log");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[ANAnnouncementManager _shouldAccept:accept:].cold.3(v6, v35);

      +[ANAnalytics shared](ANAnalytics, "shared");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[ANAnnouncementManager endpointID](self, "endpointID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      +[ANAnalyticsContext contextWithEndpointID:](ANAnalyticsContext, "contextWithEndpointID:", v39);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "error:context:", 5007, v36);

      (*((void (**)(id, void *, _QWORD))v7 + 2))(v7, v20, 0);
    }

  }
  else
  {
    -[ANAnnouncementManager log](self, "log");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      __56__ANAnnouncementManager_updateAnnouncement_statusFlags___block_invoke_cold_2();

    +[ANAnalytics shared](ANAnalytics, "shared");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANAnnouncementManager endpointID](self, "endpointID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[ANAnalyticsContext contextWithEndpointID:](ANAnalyticsContext, "contextWithEndpointID:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "error:context:", 5006, v34);

    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    v22 = 0;
  }

LABEL_21:
  return v22;
}

- (void)_addAnnouncementToReceiveQueue:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ANAnnouncementManager serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnouncementManager homeAnnouncements](self, "homeAnnouncements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v8 = (void *)objc_opt_new();
    -[ANAnnouncementManager homeAnnouncements](self, "homeAnnouncements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v6);

  }
  -[ANAnnouncementManager log](self, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v11;
    _os_log_impl(&dword_1D23A0000, v10, OS_LOG_TYPE_DEFAULT, "Adding Announcement to received queue: %@", (uint8_t *)&v12, 0xCu);

  }
  objc_msgSend(v8, "addObject:", v4);

}

- (void)_removeAnnouncementsForGroupID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSMutableDictionary *homeAnnouncements;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_homeAnnouncements, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  if (objc_msgSend(v6, "count"))
  {
    -[ANAnnouncementManager log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v27 = v8;
      _os_log_impl(&dword_1D23A0000, v7, OS_LOG_TYPE_DEFAULT, "Removing (%@) Announcements", buf, 0xCu);

    }
    homeAnnouncements = self->_homeAnnouncements;
    v10 = (void *)objc_opt_new();
    v20 = v4;
    -[NSMutableDictionary setObject:forKey:](homeAnnouncements, "setObject:forKey:", v10, v4);

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v15);
          +[ANAnnouncementStorageManager sharedManager](ANAnnouncementStorageManager, "sharedManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[ANAnnouncementManager endpointID](self, "endpointID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "deleteAnnouncementWithID:endpointID:", v18, v19);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v13);
    }

    v4 = v20;
  }

}

- (void)_removeAnnouncementsHittingStorageAgeLimit
{
  NSObject *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  float v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  id obj;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  const __CFString *v58;
  void *v59;
  uint8_t buf[4];
  double v61;
  __int16 v62;
  double v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  -[ANAnnouncementManager serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  -[NSMutableDictionary allKeys](self->_homeAnnouncements, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v55;
    v45 = *MEMORY[0x1E0CF7AF8];
    *(_QWORD *)&v5 = 134217984;
    v40 = v5;
    v41 = *(_QWORD *)v55;
    do
    {
      v8 = 0;
      v42 = v6;
      do
      {
        if (*(_QWORD *)v55 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v8);
        -[NSMutableDictionary objectForKey:](self->_homeAnnouncements, "objectForKey:", v9, v40);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v10, "copy");

        if (objc_msgSend(v11, "count"))
        {
          objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "numberForDefault:", v45);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "dateByAddingTimeInterval:", (double)-objc_msgSend(v13, "integerValue"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = (void *)objc_opt_new();
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v16 = v11;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
          if (v17)
          {
            v18 = v17;
            v44 = v9;
            v46 = v13;
            v47 = v11;
            v48 = v8;
            v19 = 0;
            v20 = *(_QWORD *)v51;
            v21 = v16;
LABEL_9:
            v22 = 0;
            while (1)
            {
              if (*(_QWORD *)v51 != v20)
                objc_enumerationMutation(v21);
              v23 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v22);
              objc_msgSend(v23, "creationTimestamp");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "timeIntervalSince1970");
              v26 = v25;
              objc_msgSend(v49, "timeIntervalSince1970");
              v28 = v26 - v27;

              -[ANAnnouncementManager log](self, "log");
              v29 = objc_claimAutoreleasedReturnValue();
              v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
              if (v28 > 0.0)
                break;
              if (v30)
              {
                objc_msgSend(v23, "identifier");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v61 = *(double *)&v31;
                v62 = 2048;
                v63 = -v28;
                _os_log_impl(&dword_1D23A0000, v29, OS_LOG_TYPE_DEFAULT, "Removing Old Announcement %@. Exceeded limit by: %f", buf, 0x16u);

              }
              v58 = CFSTR("timeExceeded");
              v32 = v28;
              *(float *)&v33 = -v32;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v59 = v34;
              v19 = 1;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "addAnnouncement:metadata:", v23, v35);

              objc_msgSend(v23, "identifier");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[ANAnnouncementManager _removeAnnouncementWithID:](self, "_removeAnnouncementWithID:", v36);

              if (v18 == ++v22)
              {
                v18 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
                v19 = 1;
                if (v18)
                  goto LABEL_9;

                v7 = v41;
                v6 = v42;
                v11 = v47;
                v8 = v48;
                v13 = v46;
                goto LABEL_21;
              }
            }
            if (v30)
            {
              *(_DWORD *)buf = v40;
              v61 = v28;
              _os_log_impl(&dword_1D23A0000, v29, OS_LOG_TYPE_DEFAULT, "Announcement has not reached age limit. Remaining time: %f", buf, 0xCu);
            }

            v7 = v41;
            v6 = v42;
            v11 = v47;
            v8 = v48;
            v13 = v46;
            if ((v19 & 1) != 0)
LABEL_21:
              -[ANAnnouncementManager _notifyDelegateAnnouncementsChangedForGroupID:](self, "_notifyDelegateAnnouncementsChangedForGroupID:", v44);
          }
          else
          {

          }
          -[ANAnnouncementManager endpointID](self, "endpointID");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          +[ANAnalyticsContext contextWithEndpointID:](ANAnalyticsContext, "contextWithEndpointID:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          +[ANAnalytics shared](ANAnalytics, "shared");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "announcementsStorageAgeLimit:context:", v15, v38);

        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v65, 16);
    }
    while (v6);
  }

}

- (void)_removeAnnouncementWithID:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSMutableDictionary *obj;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = self->_homeAnnouncements;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKey:](self->_homeAnnouncements, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __51__ANAnnouncementManager__removeAnnouncementWithID___block_invoke;
        v16[3] = &unk_1E93904A0;
        v10 = v4;
        v17 = v10;
        v11 = objc_msgSend(v9, "indexOfObjectPassingTest:", v16);
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v9, "removeObjectAtIndex:", v11);
          -[ANAnnouncementManager log](self, "log");
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v23 = v10;
            _os_log_impl(&dword_1D23A0000, v12, OS_LOG_TYPE_DEFAULT, "Removed Announcement from queue: %@", buf, 0xCu);
          }

          goto LABEL_13;
        }

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:

  +[ANAnnouncementStorageManager sharedManager](ANAnnouncementStorageManager, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANAnnouncementManager endpointID](self, "endpointID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "deleteAnnouncementWithID:endpointID:", v4, v14);

}

uint64_t __51__ANAnnouncementManager__removeAnnouncementWithID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)_loadStoredAnnouncements
{
  NSObject *v3;
  _QWORD block[5];

  -[ANAnnouncementManager serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ANAnnouncementManager__loadStoredAnnouncements__block_invoke;
  block[3] = &unk_1E938F9B0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __49__ANAnnouncementManager__loadStoredAnnouncements__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
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
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint8_t v35[128];
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  +[ANAnnouncementStorageManager sharedManager](ANAnnouncementStorageManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endpointID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storedAnnouncementsForEndpointID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v37 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "Loaded Stored Announcements: %lu announcements", buf, 0xCu);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "_shouldAccept:accept:", v11, &__block_literal_global_27))
        {
          objc_msgSend(*(id *)(a1 + 32), "_addAnnouncementToReceiveQueue:", v11);
        }
        else
        {
          +[ANAnnouncementStorageManager sharedManager](ANAnnouncementStorageManager, "sharedManager");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "endpointID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "deleteAnnouncementWithID:endpointID:", v13, v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(a1 + 32), "homeAnnouncements");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 32), "homeAnnouncements", (_QWORD)v26);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "count");

        if (v25)
          objc_msgSend(*(id *)(a1 + 32), "_startTimerWithID:", v22);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v19);
  }

}

- (void)_cleanDirectory
{
  NSObject *v3;
  _QWORD block[5];

  -[ANAnnouncementManager serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ANAnnouncementManager__cleanDirectory__block_invoke;
  block[3] = &unk_1E938F9B0;
  block[4] = self;
  dispatch_async(v3, block);

}

void __40__ANAnnouncementManager__cleanDirectory__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "allAnnouncementsSortedByReceipt");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_29);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  +[ANAnnouncementStorageManager sharedManager](ANAnnouncementStorageManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "endpointID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAnnouncementDataExcludingDataForAnnouncementIDs:endpointID:", v5, v4);

}

uint64_t __40__ANAnnouncementManager__cleanDirectory__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (void)_startTimerWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  dispatch_source_t v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  void *v12;
  _QWORD handler[4];
  NSObject *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  dispatch_source_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ANAnnouncementManager timers](self, "timers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && !-[ANAnnouncementManager timersSuspended](self, "timersSuspended"))
  {
    -[ANAnnouncementManager _resetTimer:](self, "_resetTimer:", v6);
  }
  else
  {
    -[ANAnnouncementManager serialQueue](self, "serialQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v7);

    if (v8)
    {
      -[ANAnnouncementManager log](self, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v18 = v8;
        v19 = 2112;
        v20 = v4;
        _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_DEFAULT, "Created Timer %@ for %@", buf, 0x16u);
      }

      objc_initWeak((id *)buf, self);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __43__ANAnnouncementManager__startTimerWithID___block_invoke;
      handler[3] = &unk_1E938FCC0;
      objc_copyWeak(&v16, (id *)buf);
      v10 = v8;
      v14 = v10;
      v11 = v4;
      v15 = v11;
      dispatch_source_set_event_handler(v10, handler);
      -[ANAnnouncementManager timers](self, "timers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v10, v11);

      if (!-[ANAnnouncementManager timersSuspended](self, "timersSuspended"))
        -[ANAnnouncementManager _startTimer:](self, "_startTimer:", v10);

      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }

  }
}

void __43__ANAnnouncementManager__startTimerWithID___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleExpiredTimer:withID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_handleExpiredTimer:(id)a3 withID:(id)a4
{
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[ANAnnouncementManager log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v39 = (uint64_t)v6;
    v40 = 2112;
    v41 = v7;
    _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "Timer %@ with ID %@ Expired", buf, 0x16u);
  }

  v32 = v6;
  dispatch_source_cancel(v6);
  v31 = v7;
  -[NSMutableDictionary objectForKey:](self->_homeAnnouncements, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");

  -[ANAnnouncementManager log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 134217984;
    v39 = v12;
    _os_log_impl(&dword_1D23A0000, v11, OS_LOG_TYPE_DEFAULT, "Removing %lu Announcements", buf, 0xCu);
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[ANAnnouncementManager log](self, "log");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v39 = (uint64_t)v18;
          _os_log_impl(&dword_1D23A0000, v19, OS_LOG_TYPE_DEFAULT, "Removing Announcement: %@", buf, 0xCu);
        }

        -[ANAnnouncementManager _removeAnnouncementWithID:](self, "_removeAnnouncementWithID:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v15);
  }

  -[ANAnnouncementManager timers](self, "timers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "removeObjectForKey:", v31);

  -[ANAnnouncementManager allAnnouncementsSortedByReceipt](self, "allAnnouncementsSortedByReceipt");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CF7EA8], "sharedManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x1E0CF7DB8];
    -[ANAnnouncementManager endpointID](self, "endpointID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "transaction:forEndpointUUID:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CF7EA8], "sharedManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "transaction:setActive:", v26, 0);

  }
  -[ANAnnouncementManager endpointID](self, "endpointID");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[ANAnalyticsContext contextWithEndpointID:](ANAnalyticsContext, "contextWithEndpointID:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  +[ANAnalytics shared](ANAnalytics, "shared");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "announcementsExpired:ofGroupCount:context:", v13, objc_msgSend(v13, "count"), v29);

}

- (void)_startTimer:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  dispatch_time_t v10;
  int v11;
  NSObject *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberForDefault:", *MEMORY[0x1E0CF7AE0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "integerValue");
  -[ANAnnouncementManager log](self, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v4;
    v13 = 2048;
    v14 = v7;
    _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "Starting Timer (%@) for %ld seconds", (uint8_t *)&v11, 0x16u);
  }

  v9 = 1000000000 * v7;
  v10 = dispatch_time(0, v9);
  dispatch_source_set_timer(v4, v10, v9, 0);
  dispatch_resume(v4);

}

- (void)_resetTimer:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[ANAnnouncementManager timersSuspended](self, "timersSuspended"))
  {
    dispatch_suspend(v4);
    -[ANAnnouncementManager log](self, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "Restarting Timer %@", (uint8_t *)&v6, 0xCu);
    }

    -[ANAnnouncementManager _startTimer:](self, "_startTimer:", v4);
  }

}

- (void)_suspendTimer:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ANAnnouncementManager log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "Suspending Timer %@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_suspend(v4);
}

- (NSUUID)endpointID
{
  return self->_endpointID;
}

- (ANAnnouncementManagerDelegte)delegate
{
  return (ANAnnouncementManagerDelegte *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)timers
{
  return self->_timers;
}

- (NSMutableDictionary)homeAnnouncements
{
  return self->_homeAnnouncements;
}

- (BOOL)timersSuspended
{
  return self->_timersSuspended;
}

- (void)setTimersSuspended:(BOOL)a3
{
  self->_timersSuspended = a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_homeAnnouncements, 0);
  objc_storeStrong((id *)&self->_timers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_endpointID, 0);
}

void __56__ANAnnouncementManager_updateAnnouncement_statusFlags___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1D23A0000, a2, v4, "No home identifier in announcement: %@", v5);

  OUTLINED_FUNCTION_10();
}

void __56__ANAnnouncementManager_updateAnnouncement_statusFlags___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1D23A0000, v0, v1, "Failed to find home for ID: %@", v2);
}

- (void)_shouldAccept:(void *)a1 accept:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1D23A0000, a2, v4, "No home identifier in announcement: %@", v5);

  OUTLINED_FUNCTION_10();
}

- (void)_shouldAccept:(void *)a1 accept:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1D23A0000, a2, v4, "No Group ID in Announcement: %@", v5);

  OUTLINED_FUNCTION_10();
}

@end
