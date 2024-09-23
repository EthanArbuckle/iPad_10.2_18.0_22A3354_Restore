@implementation BLTLightsAndSirensReplyInfoCache

+ (id)sharedReplyCache
{
  if (sharedReplyCache_onceToken != -1)
    dispatch_once(&sharedReplyCache_onceToken, &__block_literal_global_16);
  return (id)sharedReplyCache__sharedInstance;
}

void __52__BLTLightsAndSirensReplyInfoCache_sharedReplyCache__block_invoke()
{
  BLTLightsAndSirensReplyInfoCache *v0;
  void *v1;

  v0 = objc_alloc_init(BLTLightsAndSirensReplyInfoCache);
  v1 = (void *)sharedReplyCache__sharedInstance;
  sharedReplyCache__sharedInstance = (uint64_t)v0;

}

- (BLTLightsAndSirensReplyInfoCache)init
{
  BLTLightsAndSirensReplyInfoCache *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BLTLightsAndSirensReplyInfoCache;
  v2 = -[BLTLightsAndSirensReplyInfoCache init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.bulletindistributor.replyInfoCache", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (void *)objc_opt_new();
    -[BLTLightsAndSirensReplyInfoCache setLocalReplyInfo:](v2, "setLocalReplyInfo:", v6);

    -[BLTLightsAndSirensReplyInfoCache _setNextTimeToCheck](v2, "_setNextTimeToCheck");
  }
  return v2;
}

- (void)cacheReply:(id)a3 withSectionID:(id)a4 bulletinID:(id)a5 publicationDate:(id)a6 replyToken:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *queue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  queue = self->_queue;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __99__BLTLightsAndSirensReplyInfoCache_cacheReply_withSectionID_bulletinID_publicationDate_replyToken___block_invoke;
  v23[3] = &unk_24D763580;
  v23[4] = self;
  v24 = v16;
  v25 = v15;
  v26 = v13;
  v27 = v14;
  v28 = v12;
  v18 = v14;
  v19 = v13;
  v20 = v15;
  v21 = v12;
  v22 = v16;
  dispatch_async(queue, v23);

}

void __99__BLTLightsAndSirensReplyInfoCache_cacheReply_withSectionID_bulletinID_publicationDate_replyToken___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_firstReplyInfoWithNoReplyWithReplyToken:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = (id)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "_addReplyInfo:forReplyToken:", v3, *(_QWORD *)(a1 + 40));
    v2 = v3;
  }
  v4 = v2;
  objc_msgSend(v2, "setReply:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v4, "setBulletinPublicationDate:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setSectionID:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setPublisherMatchID:", *(_QWORD *)(a1 + 64));

}

- (id)cacheDidPlayLightsAndSirens:(unint64_t)a3 withReplyToken:(id)a4
{
  id v6;
  NSObject *queue;
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

  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7;
  v19 = __Block_byref_object_dispose__7;
  v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __79__BLTLightsAndSirensReplyInfoCache_cacheDidPlayLightsAndSirens_withReplyToken___block_invoke;
  v11[3] = &unk_24D7635A8;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v14 = a3;
  v8 = v6;
  dispatch_sync(queue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __79__BLTLightsAndSirensReplyInfoCache_cacheDidPlayLightsAndSirens_withReplyToken___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_firstReplyInfoWithNoDidPlayStateWithReplyToken:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setDidPlayLightsAndSirens:", *(_QWORD *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "_checkCache");
}

- (void)purgeReplyInfo:(id)a3 withReplyToken:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__BLTLightsAndSirensReplyInfoCache_purgeReplyInfo_withReplyToken___block_invoke;
  block[3] = &unk_24D761D70;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

void __66__BLTLightsAndSirensReplyInfoCache_purgeReplyInfo_withReplyToken___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "localReplyInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_checkCache");

}

- (id)_firstReplyInfoWithNoDidPlayStateWithReplyToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BLTLightsAndSirensReplyInfoCache localReplyInfo](self, "localReplyInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = v6;
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v11, "didPlayLightsAndSirens", (_QWORD)v13))
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)_firstReplyInfoWithNoReplyWithReplyToken:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BLTLightsAndSirensReplyInfoCache localReplyInfo](self, "localReplyInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "reply", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          v8 = v11;
          goto LABEL_11;
        }
      }
      v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)_addReplyInfo:(id)a3 forReplyToken:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[BLTLightsAndSirensReplyInfoCache _checkCache](self, "_checkCache");
  -[BLTLightsAndSirensReplyInfoCache localReplyInfo](self, "localReplyInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v8 = (void *)objc_opt_new();
    -[BLTLightsAndSirensReplyInfoCache localReplyInfo](self, "localReplyInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v6);

  }
  objc_msgSend(v8, "addObject:", v10);

}

- (void)_setNextTimeToCheck
{
  id v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 1800.0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BLTLightsAndSirensReplyInfoCache setTimeToCheck:](self, "setTimeToCheck:", v3);

}

- (BOOL)_isTimeToCheck
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTLightsAndSirensReplyInfoCache timeToCheck](self, "timeToCheck");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5 >= 0.0;

  return v6;
}

- (void)_checkCache
{
  BLTLightsAndSirensReplyInfoCache *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  void *v7;
  BLTLightsAndSirensReplyInfoCache *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v2 = self;
  v31 = *MEMORY[0x24BDAC8D0];
  if (-[BLTLightsAndSirensReplyInfoCache _isTimeToCheck](self, "_isTimeToCheck"))
  {
    v18 = (void *)objc_opt_new();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    -[BLTLightsAndSirensReplyInfoCache localReplyInfo](v2, "localReplyInfo");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v3)
    {
      v4 = v3;
      v20 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(obj);
          v6 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          v7 = (void *)objc_opt_new();
          v8 = v2;
          -[BLTLightsAndSirensReplyInfoCache localReplyInfo](v2, "localReplyInfo");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v6);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v23 = 0u;
          v24 = 0u;
          v21 = 0u;
          v22 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v22;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v22 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
                if (objc_msgSend(v16, "hasExpired"))
                {
                  objc_msgSend(v7, "addObject:", v16);
                  objc_msgSend(v16, "sendReply");
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            }
            while (v13);
          }

          objc_msgSend(v11, "removeObjectsInArray:", v7);
          if (!objc_msgSend(v11, "count"))
            objc_msgSend(v18, "addObject:", v6);

          v2 = v8;
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v4);
    }

    -[BLTLightsAndSirensReplyInfoCache localReplyInfo](v2, "localReplyInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObjectsForKeys:", v18);

    -[BLTLightsAndSirensReplyInfoCache _setNextTimeToCheck](v2, "_setNextTimeToCheck");
  }
}

- (NSMutableDictionary)localReplyInfo
{
  return self->_localReplyInfo;
}

- (void)setLocalReplyInfo:(id)a3
{
  objc_storeStrong((id *)&self->_localReplyInfo, a3);
}

- (NSDate)timeToCheck
{
  return self->_timeToCheck;
}

- (void)setTimeToCheck:(id)a3
{
  objc_storeStrong((id *)&self->_timeToCheck, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timeToCheck, 0);
  objc_storeStrong((id *)&self->_localReplyInfo, 0);
}

@end
