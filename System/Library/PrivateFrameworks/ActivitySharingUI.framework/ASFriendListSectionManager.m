@implementation ASFriendListSectionManager

- (id)sectionForFriendsInvitedByMe
{
  return -[ASFriendListSectionManager _sectionForDataVisibilityConditionalUsingBlock:](self, "_sectionForDataVisibilityConditionalUsingBlock:", &__block_literal_global_241);
}

- (id)sectionForFriendsCompetingWithMe
{
  return -[ASFriendListSectionManager _sectionForDataVisibilityConditionalUsingBlock:comparator:](self, "_sectionForDataVisibilityConditionalUsingBlock:comparator:", &__block_literal_global_247, &__block_literal_global_249);
}

uint64_t __54__ASFriendListSectionManager_hasInitializedFriendData__block_invoke(uint64_t result)
{
  _BYTE *v1;
  BOOL v2;

  v1 = *(_BYTE **)(result + 32);
  v2 = v1[105] && v1[106] || v1[104] != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

void __86__ASFriendListSectionManager_initWithModel_activitySharingClient_workoutDataProvider___block_invoke_3(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __86__ASFriendListSectionManager_initWithModel_activitySharingClient_workoutDataProvider___block_invoke_4;
  v3[3] = &unk_24EE9D6A8;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);

}

uint64_t __75__ASFriendListSectionManager__createSectionsForFriends_withDisplayContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isFriendshipCurrentlyActive") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isMe");

  return v3;
}

uint64_t __75__ASFriendListSectionManager__createSectionsForFriends_withDisplayContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isActivityDataCurrentlyVisibleToMe") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isMe");

  return v3;
}

void __54__ASFriendListSectionManager__queue_startFriendsQuery__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  _QWORD *WeakRetained;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD block[5];
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  ASLoggingInitialize();
  v7 = (os_log_t *)MEMORY[0x24BE01E88];
  v8 = (void *)*MEMORY[0x24BE01E88];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE01E88], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)buf = 134349314;
    v21 = objc_msgSend(v5, "count");
    v22 = 2114;
    v23 = v6;
    _os_log_impl(&dword_226B38000, v9, OS_LOG_TYPE_DEFAULT, "Friend Query returned results, friend count: %{public}lu, error: %{public}@.", buf, 0x16u);

  }
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    ASLoggingInitialize();
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      __54__ASFriendListSectionManager__queue_startFriendsQuery__block_invoke_cold_1();
      if (!WeakRetained)
        goto LABEL_10;
    }
    else if (!WeakRetained)
    {
LABEL_10:

      goto LABEL_11;
    }
    v11 = WeakRetained[4];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __54__ASFriendListSectionManager__queue_startFriendsQuery__block_invoke_264;
    v16[3] = &unk_24EE9D658;
    v16[4] = WeakRetained;
    dispatch_async(v11, v16);
    goto LABEL_10;
  }
  if (v5)
  {
    v12 = objc_loadWeakRetained((id *)(a1 + 40));
    WeakRetained = v12;
    if (v12)
    {
      v13 = *((_QWORD *)v12 + 4);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __54__ASFriendListSectionManager__queue_startFriendsQuery__block_invoke_263;
      block[3] = &unk_24EE9D9E0;
      block[4] = v12;
      v14 = v5;
      v15 = *(_QWORD *)(a1 + 32);
      v18 = v14;
      v19 = v15;
      dispatch_async(v13, block);

    }
    goto LABEL_10;
  }
LABEL_11:

}

- (id)sectionsForDisplayContext:(id)a3
{
  id v4;
  NSObject *readWriteQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  readWriteQueue = self->_readWriteQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__ASFriendListSectionManager_sectionsForDisplayContext___block_invoke;
  block[3] = &unk_24EE9D720;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(readWriteQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)hasInitializedFriendData
{
  NSObject *readWriteQueue;
  NSObject *v4;
  int v5;
  _BOOL4 hasReceivedFriendListQueryResult;
  _BOOL4 hasReceivedMeQueryResult;
  char v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  readWriteQueue = self->_readWriteQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__ASFriendListSectionManager_hasInitializedFriendData__block_invoke;
  v10[3] = &unk_24EE9D6F8;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(readWriteQueue, v10);
  ASLoggingInitialize();
  v4 = *MEMORY[0x24BE01E88];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE01E88], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *((unsigned __int8 *)v12 + 24);
    hasReceivedFriendListQueryResult = self->_hasReceivedFriendListQueryResult;
    hasReceivedMeQueryResult = self->_hasReceivedMeQueryResult;
    *(_DWORD *)buf = 67109632;
    v16 = v5;
    v17 = 1024;
    v18 = hasReceivedFriendListQueryResult;
    v19 = 1024;
    v20 = hasReceivedMeQueryResult;
    _os_log_impl(&dword_226B38000, v4, OS_LOG_TYPE_DEFAULT, "Returning hasInitializedFriendData value: %d, _hasReceivedFriendListQueryResult: %d, _hasReceivedMeQueryResult: %d", buf, 0x14u);
  }
  v8 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t __43__ASFriendListSectionManager__startQueries__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  ASLoggingInitialize();
  v2 = *MEMORY[0x24BE01E88];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE01E88], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_226B38000, v2, OS_LOG_TYPE_DEFAULT, "Application is active, starting me and friend queries if needed.", v4, 2u);
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_queue_startMeQuery");
  return objc_msgSend(*(id *)(a1 + 32), "_queue_startFriendsQuery");
}

- (void)_queue_startMeQuery
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  HKActivitySummaryQuery *v13;
  HKActivitySummaryQuery *meQuery;
  HKActivitySummaryQuery *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_readWriteQueue);
  if (!self->_meQuery)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 16, 1 - *MEMORY[0x24BE01F70], v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hk_activitySummaryDateComponentsFromDate:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hk_activitySummaryDateComponentsFromDate:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)v6;
    objc_msgSend(MEMORY[0x24BDD3E88], "predicateForActivitySummariesBetweenStartDateComponents:endDateComponents:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v9 = objc_alloc(MEMORY[0x24BDD38F0]);
    v10 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke;
    v19[3] = &unk_24EE9DA58;
    objc_copyWeak(&v22, &location);
    v11 = v4;
    v20 = v11;
    v12 = v5;
    v21 = v12;
    v13 = (HKActivitySummaryQuery *)objc_msgSend(v9, "initWithPredicate:resultsHandler:", v8, v19);
    meQuery = self->_meQuery;
    self->_meQuery = v13;

    v15 = self->_meQuery;
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_3;
    v17[3] = &unk_24EE9DAA8;
    v17[4] = self;
    objc_copyWeak(&v18, &location);
    -[HKActivitySummaryQuery setUpdateHandler:](v15, "setUpdateHandler:", v17);
    -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", self->_meQuery);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);

  }
}

- (void)_queue_startFriendsQuery
{
  id v3;
  ASActivitySharingClient *activitySharingClient;
  ASActivitySharingFriendQuery *v5;
  ASActivitySharingFriendQuery *friendQuery;
  _QWORD v7[5];
  id v8;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_readWriteQueue);
  if (!self->_friendQuery)
  {
    objc_initWeak(&location, self);
    v3 = objc_alloc(MEMORY[0x24BE01FC8]);
    activitySharingClient = self->_activitySharingClient;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __54__ASFriendListSectionManager__queue_startFriendsQuery__block_invoke;
    v7[3] = &unk_24EE9DA08;
    objc_copyWeak(&v8, &location);
    v7[4] = self;
    v5 = (ASActivitySharingFriendQuery *)objc_msgSend(v3, "initWithActivitySharingClient:updateHandler:", activitySharingClient, v7);
    friendQuery = self->_friendQuery;
    self->_friendQuery = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (id)_createSectionsForFriends:(id)a3 withDisplayContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  ASFriendListSection *v22;
  void *v23;
  ASFriendListSection *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  uint64_t *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  v6 = a4;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_287);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "displayFilter") == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_288);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filteredArrayUsingPredicate:", v10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startOfDayForDate:", v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[ASFriendListSectionManager _sortFriends:forDisplayMode:cacheIndex:](self, "_sortFriends:forDisplayMode:cacheIndex:", v29, objc_msgSend(v6, "displayMode"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v15 = v13;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v35;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v35 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v18);
          v20 = (void *)objc_opt_new();
          objc_msgSend(v20, "setFriend:", v19);
          objc_msgSend(v19, "currentSnapshotWithGoalsCarriedForward");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setSnapshot:", v21);

          objc_msgSend(v14, "addObject:", v20);
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      }
      while (v16);
    }

    v22 = [ASFriendListSection alloc];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[ASFriendListSection initWithDate:andRows:](v22, "initWithDate:andRows:", v28, v23);

    objc_msgSend((id)v39[5], "insertObject:atIndex:", v24, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __75__ASFriendListSectionManager__createSectionsForFriends_withDisplayContext___block_invoke_3;
    v31[3] = &unk_24EE9DBE0;
    v31[4] = self;
    v32 = v6;
    v33 = &v38;
    -[ASFriendListSectionManager _enumerateVisibleDaysForFriends:usingBlock:](self, "_enumerateVisibleDaysForFriends:usingBlock:", v25, v31);

  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v39[5], v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v38, 8);
  return v26;
}

- (id)_sortFriends:(id)a3 forDisplayMode:(int64_t)a4 cacheIndex:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  int64_t v18;

  v7 = a5;
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __69__ASFriendListSectionManager__sortFriends_forDisplayMode_cacheIndex___block_invoke;
  v16 = &unk_24EE9DC30;
  v17 = v7;
  v18 = a4;
  v8 = v7;
  objc_msgSend(a3, "sortedArrayUsingComparator:", &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reverseObjectEnumerator", v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)allDestinationsForActiveOrPendingFriends
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = -[ASFriendListSectionManager _copyFriends](self, "_copyFriends");
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v5)
    goto LABEL_18;
  v6 = v5;
  v7 = *(_QWORD *)v21;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v21 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
      if ((objc_msgSend(v9, "isMe", (_QWORD)v20) & 1) == 0)
      {
        objc_msgSend(v9, "contact");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "destinations");
        v11 = objc_claimAutoreleasedReturnValue();
        if (!v11)
          goto LABEL_12;
        v12 = (void *)v11;
        if ((objc_msgSend(v9, "isFriendshipCurrentlyActive") & 1) != 0
          || objc_msgSend(v9, "isAwaitingInviteResponseFromMe"))
        {

LABEL_11:
          objc_msgSend(v9, "contact");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "destinations");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setByAddingObjectsFromSet:", v13);
          v14 = objc_claimAutoreleasedReturnValue();

          v3 = (void *)v14;
LABEL_12:

          goto LABEL_13;
        }
        v15 = objc_msgSend(v9, "hasInviteRequestFromMe");

        if (v15)
          goto LABEL_11;
      }
LABEL_13:
      ++v8;
    }
    while (v6 != v8);
    v16 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    v6 = v16;
  }
  while (v16);
LABEL_18:

  if (objc_msgSend(v3, "count"))
    v17 = v3;
  else
    v17 = 0;
  v18 = v17;

  return v18;
}

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  -[ASFriendListSectionManager _startQueriesIfRequired](self, "_startQueriesIfRequired", a3);
  if (-[ASFriendListSectionManager hasAnyFriendsSetup](self, "hasAnyFriendsSetup"))
  {
    ASLoggingInitialize();
    v4 = *MEMORY[0x24BE01E88];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE01E88], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_226B38000, v4, OS_LOG_TYPE_DEFAULT, "Fetching data because app came into foreground.", v5, 2u);
    }
    -[ASFriendListSectionManager fetchActivitySharingDataIfTimeSinceLastFetchIsGreaterThan:completion:](self, "fetchActivitySharingDataIfTimeSinceLastFetchIsGreaterThan:completion:", 600, 0);
  }
}

void __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke(id *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  os_log_t *v8;
  void *v9;
  NSObject *v10;
  NSObject **WeakRetained;
  NSObject **v12;
  NSObject *v13;
  NSObject **v14;
  NSObject *v15;
  _QWORD block[5];
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  ASLoggingInitialize();
  v8 = (os_log_t *)MEMORY[0x24BE01E88];
  v9 = (void *)*MEMORY[0x24BE01E88];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE01E88], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    *(_DWORD *)buf = 134349314;
    v22 = objc_msgSend(v6, "count");
    v23 = 2114;
    v24 = v7;
    _os_log_impl(&dword_226B38000, v10, OS_LOG_TYPE_DEFAULT, "Me Query returned results, result count: %{public}lu, error: %{public}@.", buf, 0x16u);

  }
  if (v7)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_cold_1();
    WeakRetained = (NSObject **)objc_loadWeakRetained(a1 + 6);
    v12 = WeakRetained;
    if (WeakRetained)
    {
      v13 = WeakRetained[4];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_270;
      block[3] = &unk_24EE9D658;
      block[4] = v12;
      dispatch_async(v13, block);
    }
LABEL_11:

    goto LABEL_12;
  }
  if (objc_msgSend(v6, "count"))
  {
    v14 = (NSObject **)objc_loadWeakRetained(a1 + 6);
    v12 = v14;
    if (v14)
    {
      v15 = v14[4];
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_269;
      v17[3] = &unk_24EE9DA30;
      v17[4] = v14;
      v18 = v6;
      v19 = a1[4];
      v20 = a1[5];
      dispatch_async(v15, v17);

    }
    goto LABEL_11;
  }
LABEL_12:

}

- (BOOL)hasAnyFriendsSetup
{
  void *v2;
  NSObject **v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[ASFriendListSectionManager _sectionForDataVisibilityConditionalUsingBlock:](self, "_sectionForDataVisibilityConditionalUsingBlock:", &__block_literal_global_254);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ASLoggingInitialize();
  v3 = (NSObject **)MEMORY[0x24BE01E80];
  v4 = (void *)*MEMORY[0x24BE01E80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE01E80], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    objc_msgSend(v2, "rows");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 134217984;
    v16 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_226B38000, v5, OS_LOG_TYPE_DEFAULT, "Fitness Friends Framework checking if any friends are setup, filtered to friends that are active, invited, or inviting me: %lu", (uint8_t *)&v15, 0xCu);

  }
  objc_msgSend(v2, "rows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x24BDBCF50]);
    v11 = (void *)objc_msgSend(v10, "initWithSuiteName:", *MEMORY[0x24BE01F50]);
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BE01F68]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v12, "BOOLValue");
    ASLoggingInitialize();
    v13 = *v3;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 67109120;
      LODWORD(v16) = v9;
      _os_log_impl(&dword_226B38000, v13, OS_LOG_TYPE_DEFAULT, "Fitness Friends Framework checking defaults if any friends are setup: %{BOOL}d", (uint8_t *)&v15, 8u);
    }

  }
  return v9;
}

- (id)_sectionForDataVisibilityConditionalUsingBlock:(id)a3
{
  return -[ASFriendListSectionManager _sectionForDataVisibilityConditionalUsingBlock:comparator:](self, "_sectionForDataVisibilityConditionalUsingBlock:comparator:", a3, &__block_literal_global_251);
}

void __56__ASFriendListSectionManager_sectionsForDisplayContext___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_createSectionsForFriends:withDisplayContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(a1 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = *(void **)(a1 + 40);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v11 = (id)objc_msgSend(v8, "copy");
    objc_msgSend(v9, "setObject:forKey:", v10, v11);

  }
}

void __42__ASFriendListSectionManager__copyFriends__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (ASFriendListSectionManager)initWithModel:(id)a3 activitySharingClient:(id)a4 workoutDataProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  ASFriendListSectionManager *v12;
  uint64_t v13;
  OS_dispatch_queue *readWriteQueue;
  uint64_t v15;
  HKHealthStore *healthStore;
  FIUIWorkoutDataProvider *v17;
  FIUIWorkoutDataProvider *workoutDataProvider;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSSet *allFriends;
  NSCache *v23;
  NSCache *displayContextToSortedSectionsCache;
  void *v25;
  id v26;
  void *v27;
  char v28;
  HKHealthStore *v29;
  ASFriendListSectionManager *v30;
  _QWORD v32[4];
  ASFriendListSectionManager *v33;
  _QWORD aBlock[4];
  id v35;
  id location;
  objc_super v37;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v37.receiver = self;
  v37.super_class = (Class)ASFriendListSectionManager;
  v12 = -[ASFriendListSectionManager init](&v37, sel_init);
  if (v12)
  {
    HKCreateSerialDispatchQueue();
    v13 = objc_claimAutoreleasedReturnValue();
    readWriteQueue = v12->_readWriteQueue;
    v12->_readWriteQueue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v12->_model, a3);
    objc_msgSend(v9, "healthStore");
    v15 = objc_claimAutoreleasedReturnValue();
    healthStore = v12->_healthStore;
    v12->_healthStore = (HKHealthStore *)v15;

    objc_storeStrong((id *)&v12->_activitySharingClient, a4);
    if (v11)
      v17 = (FIUIWorkoutDataProvider *)v11;
    else
      v17 = (FIUIWorkoutDataProvider *)objc_msgSend(objc_alloc(MEMORY[0x24BE37958]), "initWithHealthStore:", v12->_healthStore);
    workoutDataProvider = v12->_workoutDataProvider;
    v12->_workoutDataProvider = v17;

    objc_initWeak(&location, v12);
    v19 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __86__ASFriendListSectionManager_initWithModel_activitySharingClient_workoutDataProvider___block_invoke;
    aBlock[3] = &unk_24EE9D680;
    objc_copyWeak(&v35, &location);
    v20 = _Block_copy(aBlock);
    -[FIUIWorkoutDataProvider addUpdateHandler:](v12->_workoutDataProvider, "addUpdateHandler:", v20);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v21 = objc_claimAutoreleasedReturnValue();
    allFriends = v12->_allFriends;
    v12->_allFriends = (NSSet *)v21;

    v12->_meQueryRetries = 0;
    v12->_friendQueryRetries = 0;
    v23 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    displayContextToSortedSectionsCache = v12->_displayContextToSortedSectionsCache;
    v12->_displayContextToSortedSectionsCache = v23;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v12, sel__calendarDayChangedNotification_, *MEMORY[0x24BDBC9E8], 0);
    objc_msgSend(v25, "addObserver:selector:name:object:", v12, sel__applicationWillEnterForegroundNotification_, *MEMORY[0x24BEBE008], 0);
    v26 = objc_alloc(MEMORY[0x24BDBCF50]);
    v27 = (void *)objc_msgSend(v26, "initWithSuiteName:", *MEMORY[0x24BE01F50]);
    if ((objc_msgSend(MEMORY[0x24BEBD3C8], "isRunningInStoreDemoMode") & 1) != 0)
      v28 = 1;
    else
      v28 = objc_msgSend(v27, "BOOLForKey:", *MEMORY[0x24BE01F60]);
    v12->_shouldGenerateDemoData = v28;
    v29 = v12->_healthStore;
    v32[0] = v19;
    v32[1] = 3221225472;
    v32[2] = __86__ASFriendListSectionManager_initWithModel_activitySharingClient_workoutDataProvider___block_invoke_3;
    v32[3] = &unk_24EE9D6D0;
    v30 = v12;
    v33 = v30;
    -[HKHealthStore _shouldGenerateDemoDataPreferenceIsSet:](v29, "_shouldGenerateDemoDataPreferenceIsSet:", v32);
    -[ASFriendListSectionManager _startQueriesIfRequired](v30, "_startQueriesIfRequired");

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __65__ASFriendListSectionManager__postFriendsListChangedNotification__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", *MEMORY[0x24BE01F58], 0);

}

- (void)_startQueries
{
  NSObject *readWriteQueue;
  _QWORD block[5];

  readWriteQueue = self->_readWriteQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__ASFriendListSectionManager__startQueries__block_invoke;
  block[3] = &unk_24EE9D658;
  block[4] = self;
  dispatch_async(readWriteQueue, block);
}

- (void)_startQueriesIfRequired
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_shouldGenerateDemoData)
  {
    ASLoggingInitialize();
    v3 = *MEMORY[0x24BE01E88];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE01E88], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_226B38000, v3, OS_LOG_TYPE_DEFAULT, "Generating fake friends.", v4, 2u);
    }
    -[ASFriendListSectionManager _stopQueries](self, "_stopQueries");
    -[ASFriendListSectionManager _createFakeFriends](self, "_createFakeFriends");
  }
  else
  {
    -[ASFriendListSectionManager _startQueries](self, "_startQueries");
  }
}

- (void)_queue_handleActivitySummaryUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSSet *v8;
  NSSet *allFriends;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 hasReceivedMeQueryResult;
  void *v22;
  ASFriendListSectionManager *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  _BOOL4 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_readWriteQueue);
  -[ASFriendListSectionManager _queue_me](self, "_queue_me");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = (void *)-[NSSet mutableCopy](self->_allFriends, "mutableCopy");
    v7 = objc_alloc(MEMORY[0x24BE01F30]);
    v5 = (void *)objc_msgSend(v7, "initWithActivitySnapshots:friendAchievements:friendWorkouts:contact:competitions:", 0, 0, 0, 0, MEMORY[0x24BDBD1A8]);
    objc_msgSend(v6, "addObject:", v5);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v6);
    v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
    allFriends = self->_allFriends;
    self->_allFriends = v8;

  }
  v23 = self;
  objc_msgSend(v5, "snapshots", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (!v11)
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = v4;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD41F0], "snapshotWithActivitySummary:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v17, "_activitySummaryIndex"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v18, v19);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v14);
  }

  objc_msgSend(v22, "setSnapshots:", v11);
  v23->_hasReceivedMeQueryResult = 1;
  ASLoggingInitialize();
  v20 = *MEMORY[0x24BE01E88];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE01E88], OS_LOG_TYPE_DEFAULT))
  {
    hasReceivedMeQueryResult = v23->_hasReceivedMeQueryResult;
    *(_DWORD *)buf = 67109120;
    v29 = hasReceivedMeQueryResult;
    _os_log_impl(&dword_226B38000, v20, OS_LOG_TYPE_DEFAULT, "Updating _hasReceivedMeQueryResult: %d", buf, 8u);
  }
  -[ASFriendListSectionManager _queue_updateWithNewData](v23, "_queue_updateWithNewData");

}

- (void)_queue_updateWithNewData
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_readWriteQueue);
  -[NSCache removeAllObjects](self->_displayContextToSortedSectionsCache, "removeAllObjects");
  -[ASFriendListSectionManager _postFriendsListChangedNotification](self, "_postFriendsListChangedNotification");
}

- (id)_queue_me
{
  NSSet *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_readWriteQueue);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_allFriends;
  v4 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v7, "isMe", (_QWORD)v9) & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)_postFriendsListChangedNotification
{
  NSObject *v2;
  uint8_t v3[16];

  ASLoggingInitialize();
  v2 = *MEMORY[0x24BE01E88];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE01E88], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_226B38000, v2, OS_LOG_TYPE_DEFAULT, "Updating _postFriendsListChangedNotification", v3, 2u);
  }
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_260);
}

- (id)allFriends
{
  return -[ASFriendListSectionManager _copyFriends](self, "_copyFriends");
}

- (id)_sectionForDataVisibilityConditionalUsingBlock:(id)a3 comparator:(id)a4
{
  unsigned int (**v6)(id, void *);
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
  void *v14;
  ASFriendListRow *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  ASFriendListSection *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = (unsigned int (**)(id, void *))a3;
  v7 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = -[ASFriendListSectionManager _copyFriends](self, "_copyFriends");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    v12 = (void *)MEMORY[0x24BDBD1A8];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v14, "isMe", (_QWORD)v21) & 1) == 0 && v6[2](v6, v14))
        {
          v15 = objc_alloc_init(ASFriendListRow);
          -[ASFriendListRow setFriend:](v15, "setFriend:", v14);
          if (objc_msgSend(v14, "isActivityDataCurrentlyVisibleToMe"))
          {
            objc_msgSend(v14, "currentSnapshotWithGoalsCarriedForward");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[ASFriendListRow setSnapshot:](v15, "setSnapshot:", v16);

          }
          objc_msgSend(v12, "arrayByAddingObject:", v15);
          v17 = objc_claimAutoreleasedReturnValue();

          v12 = (void *)v17;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDBD1A8];
  }

  objc_msgSend(v12, "sortedArrayUsingComparator:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = -[ASFriendListSection initWithDate:andRows:]([ASFriendListSection alloc], "initWithDate:andRows:", 0, v18);
  return v19;
}

- (id)_copyFriends
{
  NSObject *readWriteQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  readWriteQueue = self->_readWriteQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__ASFriendListSectionManager__copyFriends__block_invoke;
  v5[3] = &unk_24EE9D6F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(readWriteQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __86__ASFriendListSectionManager_initWithModel_activitySharingClient_workoutDataProvider___block_invoke_4(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) |= *(_BYTE *)(a1 + 40);
  return objc_msgSend(*(id *)(a1 + 32), "_startQueriesIfRequired");
}

- (ASFriendListSectionManager)init
{

  return 0;
}

- (ASFriendListSectionManager)initWithModel:(id)a3 andWorkoutDataProvider:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  ASFriendListSectionManager *v10;

  v6 = (objc_class *)MEMORY[0x24BE01FC0];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(v9, "activateWithCompletionHandler:", &__block_literal_global);
  v10 = -[ASFriendListSectionManager initWithModel:activitySharingClient:workoutDataProvider:](self, "initWithModel:activitySharingClient:workoutDataProvider:", v8, v9, v7);

  return v10;
}

void __86__ASFriendListSectionManager_initWithModel_activitySharingClient_workoutDataProvider___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[4];
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __86__ASFriendListSectionManager_initWithModel_activitySharingClient_workoutDataProvider___block_invoke_2;
    block[3] = &unk_24EE9D658;
    v5 = WeakRetained;
    dispatch_async(v3, block);

  }
}

uint64_t __86__ASFriendListSectionManager_initWithModel_activitySharingClient_workoutDataProvider___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleMyWorkoutsUpdate");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ASFriendListSectionManager;
  -[ASFriendListSectionManager dealloc](&v4, sel_dealloc);
}

- (void)_stopQueries
{
  NSObject *readWriteQueue;
  _QWORD block[5];

  readWriteQueue = self->_readWriteQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__ASFriendListSectionManager__stopQueries__block_invoke;
  block[3] = &unk_24EE9D658;
  block[4] = self;
  dispatch_async(readWriteQueue, block);
}

uint64_t __42__ASFriendListSectionManager__stopQueries__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_stopQueries");
}

- (void)enumerateValidDisplayModesForFilter:(int64_t)a3 usingBlock:(id)a4
{
  id v6;
  uint64_t i;
  void (**v8)(id, _QWORD);

  v8 = (void (**)(id, _QWORD))a4;
  v6 = -[ASFriendListSectionManager _copyFriends](self, "_copyFriends");
  for (i = 0; i != 5; ++i)
    v8[2](v8, i);
  if (-[ASFriendListSectionManager _isWheelchairUserDisplayModeValidForFriends:filter:](self, "_isWheelchairUserDisplayModeValidForFriends:filter:", v6, a3))
  {
    v8[2](v8, 5);
  }

}

- (id)sectionForFriendsInvitingMe
{
  return -[ASFriendListSectionManager _sectionForDataVisibilityConditionalUsingBlock:](self, "_sectionForDataVisibilityConditionalUsingBlock:", &__block_literal_global_240);
}

uint64_t __57__ASFriendListSectionManager_sectionForFriendsInvitingMe__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "sentInviteRequestToMe"))
    v3 = objc_msgSend(v2, "isFriendshipCurrentlyActive") ^ 1;
  else
    v3 = 0;

  return v3;
}

uint64_t __58__ASFriendListSectionManager_sectionForFriendsInvitedByMe__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "hasInviteRequestFromMe"))
    v3 = objc_msgSend(v2, "isFriendshipCurrentlyActive") ^ 1;
  else
    v3 = 0;

  return v3;
}

- (id)sectionForFriendsHidingDataFromMe
{
  return -[ASFriendListSectionManager _sectionForDataVisibilityConditionalUsingBlock:](self, "_sectionForDataVisibilityConditionalUsingBlock:", &__block_literal_global_242);
}

uint64_t __63__ASFriendListSectionManager_sectionForFriendsHidingDataFromMe__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isFriendshipCurrentlyActive"))
    v3 = objc_msgSend(v2, "isCurrentlyHidingActivityDataFromMe");
  else
    v3 = 0;

  return v3;
}

- (id)sectionForFriendsMyDataIsHiddenFrom
{
  return -[ASFriendListSectionManager _sectionForDataVisibilityConditionalUsingBlock:](self, "_sectionForDataVisibilityConditionalUsingBlock:", &__block_literal_global_243);
}

uint64_t __65__ASFriendListSectionManager_sectionForFriendsMyDataIsHiddenFrom__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isFriendshipCurrentlyActive"))
    v3 = objc_msgSend(v2, "isMyActivityDataCurrentlyHidden");
  else
    v3 = 0;

  return v3;
}

- (id)sectionForFriendsWithNoHiding
{
  return -[ASFriendListSectionManager _sectionForDataVisibilityConditionalUsingBlock:](self, "_sectionForDataVisibilityConditionalUsingBlock:", &__block_literal_global_244);
}

uint64_t __59__ASFriendListSectionManager_sectionForFriendsWithNoHiding__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isFriendshipCurrentlyActive")
    && objc_msgSend(v2, "canSeeMyActivityData"))
  {
    v3 = objc_msgSend(v2, "isActivityDataCurrentlyVisibleToMe");
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)sectionForFriendsRequestingMeToCompete
{
  return -[ASFriendListSectionManager _sectionForDataVisibilityConditionalUsingBlock:](self, "_sectionForDataVisibilityConditionalUsingBlock:", &__block_literal_global_245);
}

uint64_t __68__ASFriendListSectionManager_sectionForFriendsRequestingMeToCompete__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isFriendshipCurrentlyActive"))
    v3 = objc_msgSend(v2, "isAwaitingCompetitionResponseFromMe");
  else
    v3 = 0;

  return v3;
}

- (id)sectionForFriendsRequestedToCompeteByMe
{
  return -[ASFriendListSectionManager _sectionForDataVisibilityConditionalUsingBlock:](self, "_sectionForDataVisibilityConditionalUsingBlock:", &__block_literal_global_246);
}

uint64_t __69__ASFriendListSectionManager_sectionForFriendsRequestedToCompeteByMe__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t IsStillVisible;
  void *v5;

  v2 = a2;
  if (objc_msgSend(v2, "isFriendshipCurrentlyActive")
    && objc_msgSend(v2, "hasCompetitionRequestFromMe")
    && (objc_msgSend(v2, "isCompetitionActive") & 1) == 0)
  {
    objc_msgSend(v2, "dateForLatestOutgoingCompetitionRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    IsStillVisible = ASCompetitionRequestIsStillVisible();

  }
  else
  {
    IsStillVisible = 0;
  }

  return IsStillVisible;
}

uint64_t __62__ASFriendListSectionManager_sectionForFriendsCompetingWithMe__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCompetitionActive");
}

uint64_t __62__ASFriendListSectionManager_sectionForFriendsCompetingWithMe__block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "friend");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentCompetition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "friend");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentCompetition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "compare:", v11);

  if (!v12)
  {
    objc_msgSend(v4, "friend");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uppercaseString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "friend");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "displayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uppercaseString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v15, "compare:", v18);

    if (!v12)
    {
      objc_msgSend(v4, "friend");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dateForLatestRelationshipStart");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "friend");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dateForLatestRelationshipStart");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v20, "compare:", v22);

    }
  }

  return v12;
}

- (id)sectionForFriendsRequestedToDowngradeByMe
{
  return -[ASFriendListSectionManager _sectionForDataVisibilityConditionalUsingBlock:](self, "_sectionForDataVisibilityConditionalUsingBlock:", &__block_literal_global_250);
}

uint64_t __71__ASFriendListSectionManager_sectionForFriendsRequestedToDowngradeByMe__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isFriendshipCurrentlyActive"))
    v3 = objc_msgSend(v2, "needsDowngradeRequestAcknowledgment");
  else
    v3 = 0;

  return v3;
}

uint64_t __77__ASFriendListSectionManager__sectionForDataVisibilityConditionalUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a2, "friend");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fullName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uppercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "friend");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "fullName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uppercaseString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "compare:", v10);

  return v11;
}

- (id)friendWithUUID:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = -[ASFriendListSectionManager _copyFriends](self, "_copyFriends");
  -[ASFriendListSectionManager _friendWithUUID:fromFriends:](self, "_friendWithUUID:fromFriends:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_friendWithUUID:(id)a3 fromFriends:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a4;
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "UUID", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v5);

        if ((v12 & 1) != 0)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)me
{
  NSObject *readWriteQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  readWriteQueue = self->_readWriteQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __32__ASFriendListSectionManager_me__block_invoke;
  v5[3] = &unk_24EE9D6F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(readWriteQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __32__ASFriendListSectionManager_me__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_me");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __48__ASFriendListSectionManager_hasAnyFriendsSetup__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isFriendshipCurrentlyActive") & 1) != 0
    || (objc_msgSend(v2, "hasInviteRequestFromMe") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "sentInviteRequestToMe");
  }

  return v3;
}

- (id)allActiveFriendsAsRecipients
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = -[ASFriendListSectionManager _copyFriends](self, "_copyFriends");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v3)
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_16;
  }
  v4 = v3;
  v5 = *(_QWORD *)v17;
  v6 = (void *)MEMORY[0x24BDBD1A8];
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v17 != v5)
        objc_enumerationMutation(v2);
      v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
      if ((objc_msgSend(v8, "isMe", (_QWORD)v16) & 1) == 0)
      {
        objc_msgSend(v8, "contact");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "primaryDestinationForMessaging");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 && objc_msgSend(v8, "isFriendshipCurrentlyActive"))
        {
          v11 = objc_msgSend(v8, "isActivityDataCurrentlyVisibleToMe");

          if (!v11)
            continue;
          objc_msgSend(v8, "contact");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "primaryDestinationForMessaging");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "arrayByAddingObject:", v10);
          v12 = objc_claimAutoreleasedReturnValue();

          v6 = (void *)v12;
        }

      }
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v4);
LABEL_16:

  if (objc_msgSend(v6, "count"))
    v13 = v6;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

- (unint64_t)numberOfFriendsWithInvitesAwaitingResponseFromMe
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[ASFriendListSectionManager sectionForFriendsInvitingMe](self, "sectionForFriendsInvitingMe");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_258);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filteredArrayUsingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "count");
  return v6;
}

uint64_t __78__ASFriendListSectionManager_numberOfFriendsWithInvitesAwaitingResponseFromMe__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "friend");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAwaitingInviteResponseFromMe");

  return v3;
}

- (unint64_t)numberOfFriendsWithCompetitionRequestsAwaitingResponseFromMe
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[ASFriendListSectionManager sectionForFriendsRequestingMeToCompete](self, "sectionForFriendsRequestingMeToCompete");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (unint64_t)totalNumberOfPendingRequests
{
  unint64_t v3;

  v3 = -[ASFriendListSectionManager numberOfFriendsWithInvitesAwaitingResponseFromMe](self, "numberOfFriendsWithInvitesAwaitingResponseFromMe");
  return -[ASFriendListSectionManager numberOfFriendsWithCompetitionRequestsAwaitingResponseFromMe](self, "numberOfFriendsWithCompetitionRequestsAwaitingResponseFromMe")+ v3;
}

- (void)fetchActivitySharingDataIfTimeSinceLastFetchIsGreaterThan:(unint64_t)a3 completion:(id)a4
{
  id v6;
  ASActivitySharingClient *activitySharingClient;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  activitySharingClient = self->_activitySharingClient;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __99__ASFriendListSectionManager_fetchActivitySharingDataIfTimeSinceLastFetchIsGreaterThan_completion___block_invoke;
  v9[3] = &unk_24EE9D948;
  v10 = v6;
  v8 = v6;
  -[ASActivitySharingClient fetchActivityDataIfGreaterThanLastFetchElapsedMinimum:completion:](activitySharingClient, "fetchActivityDataIfGreaterThanLastFetchElapsedMinimum:completion:", a3, v9);

}

void __99__ASFriendListSectionManager_fetchActivitySharingDataIfTimeSinceLastFetchIsGreaterThan_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint8_t v8[16];

  v5 = a3;
  ASLoggingInitialize();
  v6 = *MEMORY[0x24BE01E88];
  if (v5 || !(_DWORD)a2)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE01E88], OS_LOG_TYPE_ERROR))
      __99__ASFriendListSectionManager_fetchActivitySharingDataIfTimeSinceLastFetchIsGreaterThan_completion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE01E88], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_226B38000, v6, OS_LOG_TYPE_DEFAULT, "Finished fetching new friend data successfully.", v8, 2u);
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);

}

- (int64_t)numberOfNewFriendsAllowed
{
  id v2;
  int64_t v3;

  v2 = -[ASFriendListSectionManager _copyFriends](self, "_copyFriends");
  v3 = ASNumberOfNewFriendsAllowedForFriends();

  return v3;
}

- (BOOL)hasReachedMaxNumberOfFriends
{
  return -[ASFriendListSectionManager numberOfNewFriendsAllowed](self, "numberOfNewFriendsAllowed") < 1;
}

- (void)_calendarDayChangedNotification:(id)a3
{
  NSObject *readWriteQueue;
  _QWORD block[5];

  readWriteQueue = self->_readWriteQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__ASFriendListSectionManager__calendarDayChangedNotification___block_invoke;
  block[3] = &unk_24EE9D658;
  block[4] = self;
  dispatch_async(readWriteQueue, block);
}

uint64_t __62__ASFriendListSectionManager__calendarDayChangedNotification___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_stopQueries");
  return objc_msgSend(*(id *)(a1 + 32), "_startQueriesIfRequired");
}

- (BOOL)_isWheelchairUserDisplayModeValidForFriends:(id)a3 filter:(int64_t)a4
{
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v5 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__ASFriendListSectionManager__isWheelchairUserDisplayModeValidForFriends_filter___block_invoke;
  v7[3] = &unk_24EE9D990;
  v7[4] = self;
  v7[5] = &v8;
  -[ASFriendListSectionManager _enumerateVisibleDaysForFriends:usingBlock:](self, "_enumerateVisibleDaysForFriends:usingBlock:", v5, v7);
  LOBYTE(self) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

void __81__ASFriendListSectionManager__isWheelchairUserDisplayModeValidForFriends_filter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_filterFriends:withWheelchairUseAtCacheIndex:", a4, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

}

- (void)_queue_restartQueryAfterErrorCount:(int64_t)a3 withBlock:(id)a4
{
  id v6;
  int64_t v7;
  dispatch_time_t v8;
  NSObject *readWriteQueue;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_readWriteQueue);
  v7 = 5;
  if (a3 < 5)
    v7 = a3;
  v8 = dispatch_time(0, 1000000000 * v7);
  readWriteQueue = self->_readWriteQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__ASFriendListSectionManager__queue_restartQueryAfterErrorCount_withBlock___block_invoke;
  v11[3] = &unk_24EE9D9B8;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  dispatch_after(v8, readWriteQueue, v11);

}

uint64_t __75__ASFriendListSectionManager__queue_restartQueryAfterErrorCount_withBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  ASLoggingInitialize();
  v2 = *MEMORY[0x24BE01E88];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE01E88], OS_LOG_TYPE_ERROR))
    __75__ASFriendListSectionManager__queue_restartQueryAfterErrorCount_withBlock___block_invoke_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __54__ASFriendListSectionManager__queue_startFriendsQuery__block_invoke_263(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  int v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_queue_me");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v3;

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setByAddingObject:", v2);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 48);
    *(_QWORD *)(v7 + 48) = v6;

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 48) + 105) = 1;
  ASLoggingInitialize();
  v9 = *MEMORY[0x24BE01E88];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE01E88], OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 105);
    v11[0] = 67109120;
    v11[1] = v10;
    _os_log_impl(&dword_226B38000, v9, OS_LOG_TYPE_DEFAULT, "Updating _hasReceivedFriendListQueryResult: %d", (uint8_t *)v11, 8u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_queue_updateWithNewData");

}

uint64_t __54__ASFriendListSectionManager__queue_startFriendsQuery__block_invoke_264(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  void *v6;
  uint64_t v7;

  v1 = *(_QWORD **)(a1 + 32);
  ++v1[11];
  v3 = MEMORY[0x24BDAC760];
  v4 = 3221225472;
  v5 = __54__ASFriendListSectionManager__queue_startFriendsQuery__block_invoke_2;
  v6 = &unk_24EE9D658;
  v7 = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v1, "_queue_restartQueryAfterErrorCount:withBlock:");
}

uint64_t __54__ASFriendListSectionManager__queue_startFriendsQuery__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 56);
  *(_QWORD *)(v2 + 56) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_queue_startFriendsQuery");
}

void __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_269(uint64_t a1)
{
  void *v2;
  id v3;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_queue_handleActivitySummaryUpdate:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(*(id *)(a1 + 48), "startOfDayForDate:", *(_QWORD *)(a1 + 56));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startFetchingFromDate:", v3);

}

void __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_270(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stopQuery:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "applicationState");

  v4 = *(_QWORD **)(a1 + 32);
  if (v3)
  {
    v5 = (void *)v4[8];
    v4[8] = 0;

  }
  else
  {
    ++v4[10];
    objc_msgSend(v4, "_queue_restartQueryAfterErrorCount:withBlock:");
  }
}

uint64_t __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  *(_QWORD *)(v2 + 64) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_queue_startMeQuery");
}

void __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  os_log_t *v8;
  void *v9;
  NSObject *v10;
  NSObject **WeakRetained;
  NSObject **v12;
  NSObject *v13;
  NSObject **v14;
  NSObject *v15;
  _QWORD block[5];
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  ASLoggingInitialize();
  v8 = (os_log_t *)MEMORY[0x24BE01E88];
  v9 = (void *)*MEMORY[0x24BE01E88];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE01E88], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    *(_DWORD *)buf = 134349314;
    v20 = objc_msgSend(v6, "count");
    v21 = 2114;
    v22 = v7;
    _os_log_impl(&dword_226B38000, v10, OS_LOG_TYPE_DEFAULT, "Me Query received updates, object count: %{public}lu, error: %{public}@.", buf, 0x16u);

  }
  if (v7)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_cold_1();
    WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
    v12 = WeakRetained;
    if (WeakRetained)
    {
      v13 = WeakRetained[4];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_273;
      block[3] = &unk_24EE9D658;
      block[4] = v12;
      dispatch_async(v13, block);
    }
LABEL_11:

    goto LABEL_12;
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) = 0;
  if (objc_msgSend(v6, "count"))
  {
    v14 = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
    v12 = v14;
    if (v14)
    {
      v15 = v14[4];
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_272;
      v17[3] = &unk_24EE9DA80;
      v17[4] = v14;
      v18 = v6;
      dispatch_async(v15, v17);

    }
    goto LABEL_11;
  }
LABEL_12:

}

uint64_t __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_272(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_handleActivitySummaryUpdate:", *(_QWORD *)(a1 + 40));
}

uint64_t __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_273(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stopQuery:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  v2 = *(_QWORD **)(a1 + 32);
  ++v2[10];
  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_2_274;
  v7 = &unk_24EE9D658;
  v8 = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "_queue_restartQueryAfterErrorCount:withBlock:");
}

uint64_t __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_2_274(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 64);
  *(_QWORD *)(v2 + 64) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_queue_startMeQuery");
}

- (void)_queue_stopQueries
{
  ASActivitySharingFriendQuery *friendQuery;
  HKActivitySummaryQuery *meQuery;
  FIUIClientToken *modelQueryToken;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_readWriteQueue);
  if (self->_meQuery)
  {
    -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:");
    -[FIUIWorkoutDataProvider stopFetching](self->_workoutDataProvider, "stopFetching");
  }
  if (self->_modelQueryToken)
    -[FIUIModel stopCurrentActivitySummaryQueryForClientToken:](self->_model, "stopCurrentActivitySummaryQueryForClientToken:");
  self->_meQueryRetries = 0;
  self->_friendQueryRetries = 0;
  friendQuery = self->_friendQuery;
  self->_friendQuery = 0;

  meQuery = self->_meQuery;
  self->_meQuery = 0;

  modelQueryToken = self->_modelQueryToken;
  self->_modelQueryToken = 0;

}

- (void)_queue_handleMyWorkoutsUpdate
{
  void *v3;
  id v4;
  NSSet *v5;
  NSSet *allFriends;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  id obj;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_readWriteQueue);
  -[ASFriendListSectionManager _queue_me](self, "_queue_me");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    v3 = (void *)-[NSSet mutableCopy](self->_allFriends, "mutableCopy");
    v4 = objc_alloc(MEMORY[0x24BE01F30]);
    v14 = (void *)objc_msgSend(v4, "initWithActivitySnapshots:friendAchievements:friendWorkouts:contact:competitions:", 0, 0, 0, 0, MEMORY[0x24BDBD1A8]);
    objc_msgSend(v3, "addObject:");
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v3);
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    allFriends = self->_allFriends;
    self->_allFriends = v5;

  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutDataProvider allWorkouts](self->_workoutDataProvider, "allWorkouts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v8, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v17 = 0;
        v18 = &v17;
        v19 = 0x3032000000;
        v20 = __Block_byref_object_copy_;
        v21 = __Block_byref_object_dispose_;
        objc_msgSend(MEMORY[0x24BDBCF20], "set");
        v22 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = __59__ASFriendListSectionManager__queue_handleMyWorkoutsUpdate__block_invoke;
        v16[3] = &unk_24EE9DAD0;
        v16[4] = &v17;
        objc_msgSend(v13, "enumerateObjectsUsingBlock:", v16);
        objc_msgSend(v7, "setObject:forKey:", v18[5], v12);

        _Block_object_dispose(&v17, 8);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

  objc_msgSend(v14, "setFriendWorkouts:", v7);
  -[ASFriendListSectionManager _queue_updateWithNewData](self, "_queue_updateWithNewData");

}

void __59__ASFriendListSectionManager__queue_handleMyWorkoutsUpdate__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(MEMORY[0x24BDD41F8], "fitnessFriendWorkoutFromHKWorkout:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObject:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)_enumerateVisibleDaysForFriends:(id)a3 usingBlock:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id obj;
  uint64_t v33;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  id v40;
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
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v31 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v5;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v35)
  {
    v33 = *(_QWORD *)v50;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v50 != v33)
          objc_enumerationMutation(obj);
        v37 = v7;
        v8 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v7);
        objc_msgSend(v8, "currentDateComponents");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASFriendListSectionManager _datesToShowSnapshotsForFriend:startingFromCurrentDateComponents:](self, "_datesToShowSnapshotsForFriend:startingFromCurrentDateComponents:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v46 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
              objc_msgSend(v6, "objectForKeyedSubscript:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v15)
              {
                objc_msgSend(MEMORY[0x24BDBCF20], "set");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
              }
              objc_msgSend(v15, "setByAddingObject:", v8);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v14);
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
          }
          while (v11);
        }

        v7 = v37 + 1;
      }
      while (v37 + 1 != v35);
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v35);
  }

  objc_msgSend(v6, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sortedArrayUsingComparator:", &__block_literal_global_282);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v42;
    while (2)
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v42 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
        objc_msgSend(v6, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "count") != 1)
        {

          goto LABEL_29;
        }
        objc_msgSend(v25, "anyObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "isMe"))
          objc_msgSend(v6, "removeObjectForKey:", v24);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
      if (v21)
        continue;
      break;
    }
  }
LABEL_29:

  objc_msgSend(v6, "allKeys");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "sortedArrayUsingComparator:", &__block_literal_global_283);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __73__ASFriendListSectionManager__enumerateVisibleDaysForFriends_usingBlock___block_invoke_3;
  v38[3] = &unk_24EE9DB58;
  v39 = v6;
  v40 = v31;
  v29 = v6;
  v30 = v31;
  objc_msgSend(v28, "enumerateObjectsUsingBlock:", v38);

}

uint64_t __73__ASFriendListSectionManager__enumerateVisibleDaysForFriends_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __73__ASFriendListSectionManager__enumerateVisibleDaysForFriends_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __73__ASFriendListSectionManager__enumerateVisibleDaysForFriends_usingBlock___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a2;
  objc_msgSend(v3, "hk_gregorianCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HKActivityCacheDateComponentsFromDate();
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", _HKCacheIndexFromDateComponents());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, void *))(v7 + 16))(v7, v4, v6, v9);

}

- (id)_datesToShowSnapshotsForFriend:(id)a3 startingFromCurrentDateComponents:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BE01F70];
  v9 = 1 - *MEMORY[0x24BE01F70];
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDay:", objc_msgSend(v6, "day") + 1);
  v32 = v6;
  objc_msgSend(v10, "dateFromComponents:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startOfDayForDate:", v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v31 = (void *)v12;
  objc_msgSend(v10, "dateByAddingUnit:value:toDate:options:", 128, -1, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startOfDayForDate:", v14);
  v15 = objc_claimAutoreleasedReturnValue();

  v30 = (void *)v15;
  objc_msgSend(v10, "dateByAddingUnit:value:toDate:options:", 16, 2 - v8, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startOfDayForDate:", v16);
  v17 = objc_claimAutoreleasedReturnValue();

  v29 = (void *)v17;
  objc_msgSend(v10, "dateByAddingUnit:value:toDate:options:", 128, -1, v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isMe") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "dateForLatestRelationshipStart");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startOfDayForDate:", v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v10, "dateFromComponents:", v32);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startOfDayForDate:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 <= 0)
  {
    v26 = 0;
    while (!objc_msgSend(v13, "hk_isBeforeDate:", v19)
         || (objc_msgSend(v13, "hk_isBeforeDate:", v22) & 1) == 0)
    {
      if ((objc_msgSend(v5, "isMe") & 1) != 0
        || objc_msgSend(v5, "isActivityDataVisibleToMeForDate:", v13))
      {
        objc_msgSend(v10, "startOfDayForDate:", v13);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v27);

      }
      objc_msgSend(v10, "dateByAddingUnit:value:toDate:options:", 16, -1, v13, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v23, "hk_isBeforeDate:", v18) & 1) == 0)
      {
        v13 = v23;
        if (v26-- > v9)
          continue;
      }
      goto LABEL_6;
    }
  }
  v23 = v13;
LABEL_6:
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", v7);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

void __75__ASFriendListSectionManager__createSectionsForFriends_withDisplayContext___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  ASFriendListSection *v18;
  void *v19;
  ASFriendListSection *v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v22 = a2;
  v7 = a3;
  v21 = a4;
  objc_msgSend(*(id *)(a1 + 32), "_sortFriends:forDisplayMode:cacheIndex:", v21, objc_msgSend(*(id *)(a1 + 40), "displayMode"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v14);
        v16 = (void *)objc_opt_new();
        objc_msgSend(v16, "setFriend:", v15);
        objc_msgSend(v15, "snapshotWithGoalsCarriedForwardForSnapshotIndex:", v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setSnapshot:", v17);

        objc_msgSend(v9, "addObject:", v16);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

  v18 = [ASFriendListSection alloc];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[ASFriendListSection initWithDate:andRows:](v18, "initWithDate:andRows:", v22, v19);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "insertObject:atIndex:", v20, 0);
}

- (id)_filterFriends:(id)a3 withSnapshotDataAtCacheIndex:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = (void *)MEMORY[0x24BDD1758];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__ASFriendListSectionManager__filterFriends_withSnapshotDataAtCacheIndex___block_invoke;
  v12[3] = &unk_24EE9DC08;
  v13 = v5;
  v7 = v5;
  v8 = a3;
  objc_msgSend(v6, "predicateWithBlock:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

BOOL __74__ASFriendListSectionManager__filterFriends_withSnapshotDataAtCacheIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "snapshots");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (id)_filterFriends:(id)a3 withActiveFriendshipAtEndOfDay:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = (void *)MEMORY[0x24BDD1758];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __76__ASFriendListSectionManager__filterFriends_withActiveFriendshipAtEndOfDay___block_invoke;
  v12[3] = &unk_24EE9DC08;
  v13 = v5;
  v7 = v5;
  v8 = a3;
  objc_msgSend(v6, "predicateWithBlock:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __76__ASFriendListSectionManager__filterFriends_withActiveFriendshipAtEndOfDay___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(v3, "isMe") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isActivityDataVisibleToMeForDate:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)_filterFriends:(id)a3 withWheelchairUseAtCacheIndex:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = (void *)MEMORY[0x24BDD1758];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __75__ASFriendListSectionManager__filterFriends_withWheelchairUseAtCacheIndex___block_invoke;
  v12[3] = &unk_24EE9DC08;
  v13 = v5;
  v7 = v5;
  v8 = a3;
  objc_msgSend(v6, "predicateWithBlock:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __75__ASFriendListSectionManager__filterFriends_withWheelchairUseAtCacheIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "snapshots");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "wheelchairUse");
  v5 = FIUIIsWheelchairUserForWheelchairUse();

  return v5;
}

uint64_t __69__ASFriendListSectionManager__sortFriends_forDisplayMode_cacheIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v5, "snapshots");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "snapshots");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "currentSnapshot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentSnapshot");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  switch(*(_QWORD *)(a1 + 40))
  {
    case 1:
      v11 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v8, "energyBurnedGoalPercentage");
      v13 = v12;
      objc_msgSend(v8, "mmgp");
      objc_msgSend(v11, "numberWithDouble:", v13 + v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v10, "energyBurnedGoalPercentage");
      v18 = v17;
      objc_msgSend(v10, "mmgp");
      v20 = v18 + v19;
      goto LABEL_12;
    case 2:
      v22 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v8, "briskMinutesGoalPercentage");
      objc_msgSend(v22, "numberWithDouble:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v10, "briskMinutesGoalPercentage");
      goto LABEL_12;
    case 3:
      v23 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v8, "stepCount");
      objc_msgSend(v23, "numberWithDouble:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v10, "stepCount");
      goto LABEL_12;
    case 4:
      v24 = *(void **)(a1 + 32);
      if (v24)
      {
        v25 = v24;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v8, "snapshotIndex"));
        v25 = (id)objc_claimAutoreleasedReturnValue();
      }
      v28 = v25;
      v29 = *(void **)(a1 + 32);
      v68 = v8;
      if (v29)
      {
        v30 = v29;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v10, "snapshotIndex"));
        v30 = (id)objc_claimAutoreleasedReturnValue();
      }
      v31 = v30;
      v67 = v10;
      v69 = v5;
      objc_msgSend(v5, "friendWorkouts");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectForKeyedSubscript:", v28);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "friendWorkouts");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v31;
      objc_msgSend(v34, "objectForKeyedSubscript:", v31);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      v35 = (void *)MEMORY[0x24BDD3E50];
      objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "quantityWithUnit:doubleValue:", v36, 0.0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v38 = v33;
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
      if (v39)
      {
        v40 = v39;
        v41 = *(_QWORD *)v75;
        do
        {
          v42 = 0;
          v43 = v37;
          do
          {
            if (*(_QWORD *)v75 != v41)
              objc_enumerationMutation(v38);
            objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * v42), "totalEnergyBurned", v64);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "_quantityByAddingQuantity:", v44);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            ++v42;
            v43 = v37;
          }
          while (v40 != v42);
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
        }
        while (v40);
      }
      v66 = v28;

      v45 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "doubleValueForUnit:", v46);
      objc_msgSend(v45, "numberWithDouble:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = (void *)MEMORY[0x24BDD3E50];
      objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "quantityWithUnit:doubleValue:", v48, 0.0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v50 = v64;
      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
      if (v51)
      {
        v52 = v51;
        v53 = *(_QWORD *)v71;
        do
        {
          v54 = 0;
          v55 = v49;
          do
          {
            if (*(_QWORD *)v71 != v53)
              objc_enumerationMutation(v50);
            objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * v54), "totalEnergyBurned", v64);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "_quantityByAddingQuantity:", v56);
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            ++v54;
            v55 = v49;
          }
          while (v52 != v54);
          v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
        }
        while (v52);
      }

      v57 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "doubleValueForUnit:", v58);
      objc_msgSend(v57, "numberWithDouble:");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v68;
      v5 = v69;
      v10 = v67;
      if (!v15)
        goto LABEL_35;
      goto LABEL_13;
    case 5:
      v26 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v8, "pushCount");
      objc_msgSend(v26, "numberWithDouble:");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v10, "pushCount");
LABEL_12:
      objc_msgSend(v16, "numberWithDouble:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
        goto LABEL_35;
LABEL_13:
      if (!v21 || (v27 = objc_msgSend(v15, "compare:", v21)) == 0)
      {
LABEL_35:
        objc_msgSend(v5, "displayName", v64);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "displayName");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v60, "caseInsensitiveCompare:", v59);

        if (!v27)
        {
          objc_msgSend(v5, "dateForLatestRelationshipStart");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "dateForLatestRelationshipStart");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v61, "compare:", v62);

        }
      }

      return v27;
    default:
      v21 = 0;
      v15 = 0;
      goto LABEL_35;
  }
}

- (void)_createFakeFriends
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *readWriteQueue;
  NSObject *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x24BE01F28], "fakeAppFriendListForMarketing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v5 = MEMORY[0x24BDAC760];
  readWriteQueue = self->_readWriteQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__ASFriendListSectionManager__createFakeFriends__block_invoke;
  block[3] = &unk_24EE9D658;
  block[4] = self;
  dispatch_async(readWriteQueue, block);
  v7 = self->_readWriteQueue;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __48__ASFriendListSectionManager__createFakeFriends__block_invoke_2;
  v9[3] = &unk_24EE9DA80;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(v7, v9);

}

uint64_t __48__ASFriendListSectionManager__createFakeFriends__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_startMeQuery");
}

uint64_t __48__ASFriendListSectionManager__createFakeFriends__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateWithNewData");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelQueryToken, 0);
  objc_storeStrong((id *)&self->_workoutDataProvider, 0);
  objc_storeStrong((id *)&self->_meQuery, 0);
  objc_storeStrong((id *)&self->_friendQuery, 0);
  objc_storeStrong((id *)&self->_allFriends, 0);
  objc_storeStrong((id *)&self->_displayContextToSortedSectionsCache, 0);
  objc_storeStrong((id *)&self->_readWriteQueue, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_activitySharingClient, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __99__ASFriendListSectionManager_fetchActivitySharingDataIfTimeSinceLastFetchIsGreaterThan_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_226B38000, v0, v1, "Failed to fetch new friend data, error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75__ASFriendListSectionManager__queue_restartQueryAfterErrorCount_withBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_226B38000, a2, a3, "Restarting HKActivitySummaryQuery (me) query. Retry attempt: %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __54__ASFriendListSectionManager__queue_startFriendsQuery__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_226B38000, v0, v1, "Error returned from Fitness Friends Query: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __49__ASFriendListSectionManager__queue_startMeQuery__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_226B38000, v0, v1, "Error returned from HKActivitySummaryQuery: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
