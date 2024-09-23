@implementation GKGameRecord

+ (void)partitionGameRecords:(id)a3 returniOS:(id *)a4 returnMac:(id *)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v7 = a3;
  v8 = objc_msgSend(v7, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__GKGameRecord_partitionGameRecords_returniOS_returnMac___block_invoke;
  v15[3] = &unk_1E75B1CA8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v15);

  v14 = objc_retainAutorelease(v12);
  *a5 = v14;
  v13 = objc_retainAutorelease(v11);
  *a4 = v13;

}

void __57__GKGameRecord_partitionGameRecords_returniOS_returnMac___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "platform");
  v4 = 40;
  if (v3 == 2)
    v4 = 32;
  objc_msgSend(*(id *)(a1 + v4), "addObject:", v5);

}

- (GKGameRecord)initWithInternalRepresentation:(id)a3 player:(id)a4
{
  id v6;
  id v7;
  GKGameRecord *v8;
  GKGameRecord *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    +[GKInternalRepresentation internalRepresentation](GKGameRecordInternal, "internalRepresentation");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11.receiver = self;
  v11.super_class = (Class)GKGameRecord;
  v8 = -[GKGame initWithInternalRepresentation:](&v11, sel_initWithInternalRepresentation_, v6);
  v9 = v8;
  if (v8)
    -[GKGameRecord setPlayer:](v8, "setPlayer:", v7);

  return v9;
}

- (GKGameRecord)initWithInternalRepresentation:(id)a3
{
  id v4;
  GKGameRecord *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (!v4)
  {
    +[GKInternalRepresentation internalRepresentation](GKGameRecordInternal, "internalRepresentation");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8.receiver = self;
  v8.super_class = (Class)GKGameRecord;
  v5 = -[GKGame initWithInternalRepresentation:](&v8, sel_initWithInternalRepresentation_, v4);
  if (v5)
  {
    +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKGameRecord setPlayer:](v5, "setPlayer:", v6);

  }
  return v5;
}

- (GKGameRecord)init
{
  void *v3;
  GKGameRecord *v4;

  +[GKInternalRepresentation internalRepresentation](GKGameRecordInternal, "internalRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GKGameRecord initWithInternalRepresentation:](self, "initWithInternalRepresentation:", v3);

  return v4;
}

- (GKGameRecord)initWithCoder:(id)a3
{
  id v4;
  GKGameRecord *v5;
  uint64_t v6;
  GKPlayer *player;
  GKGameRecord *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GKGameRecord;
  v5 = -[GKGame initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("player"));
    v6 = objc_claimAutoreleasedReturnValue();
    player = v5->_player;
    v5->_player = (GKPlayer *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKGameRecord;
  v4 = a3;
  -[GKGame encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[GKGameRecord player](self, "player", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("player"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)played
{
  void *v2;
  BOOL v3;

  -[GKGameRecord lastPlayedDate](self, "lastPlayedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GKGameRecord;
  v3 = -[GKGame hash](&v7, sel_hash);
  -[GKGameRecord player](self, "player");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v10.receiver = self;
    v10.super_class = (Class)GKGameRecord;
    if (-[GKGame isEqual:](&v10, sel_isEqual_, v5))
    {
      -[GKGameRecord player](self, "player");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "player");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[GKGameRecord player](self, "player");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  -[GKGameRecord name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameRecord bundleIdentifier](self, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "internal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "conciseDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p> name:%@ bundleID:%@ player:<%@>"), v5, self, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)cacheKeyForPlayer:(id)a3 bundleIdentifier:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a4;
  objc_msgSend(a3, "cacheKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%@"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)cacheKeyForPlayer:(id)a3 game:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cacheKeyForPlayer:bundleIdentifier:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)cacheKeyForPlayer:(id)a3 internal:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(a4, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cacheKeyForPlayer:bundleIdentifier:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)internalRepresentationCache
{
  if (internalRepresentationCache_onceToken != -1)
    dispatch_once(&internalRepresentationCache_onceToken, &__block_literal_global_7);
  return (id)sInternalRepresentationCache;
}

void __43__GKGameRecord_internalRepresentationCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)sInternalRepresentationCache;
  sInternalRepresentationCache = (uint64_t)v0;

}

+ (void)invalidateCaches
{
  objc_msgSend((id)sInternalRepresentationCache, "removeAllObjects");
}

+ (void)invalidateCacheForPlayer:(id)a3 game:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "internalRepresentationCache");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cacheKeyForPlayer:game:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "removeObjectForKey:", v8);
}

+ (id)internalRepresentationForPlayer:(id)a3 game:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "internalRepresentationCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cacheKeyForPlayer:game:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v6, "internal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKGameRecordInternal gameRecordForGame:](GKGameRecordInternal, "gameRecordForGame:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setObject:forKey:", v10, v9);
  }

  return v10;
}

+ (id)gameRecordForPlayer:(id)a3 game:(id)a4
{
  id v6;
  void *v7;
  GKGameRecord *v8;

  v6 = a3;
  objc_msgSend(a1, "internalRepresentationForPlayer:game:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[GKGameRecord initWithInternalRepresentation:player:]([GKGameRecord alloc], "initWithInternalRepresentation:player:", v7, v6);

  return v8;
}

+ (void)loadGameRecordForPlayer:(id)a3 game:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = a3;
  objc_msgSend(v9, "arrayWithObject:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__GKGameRecord_loadGameRecordForPlayer_game_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E75B1CF0;
  v14 = v8;
  v12 = v8;
  objc_msgSend(a1, "loadGameRecordsForPlayer:games:withCompletionHandler:", v10, v11, v13);

}

void __67__GKGameRecord_loadGameRecordForPlayer_game_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "count");
  if (v6 || v7 != 1)
  {
    v8 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v9 = GKOSLoggers();
      v8 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __67__GKGameRecord_loadGameRecordForPlayer_game_withCompletionHandler___block_invoke_cold_1(v8, v5);
  }
  v10 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "objectAtIndex:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);

}

+ (void)loadGameRecordsForPlayer:(id)a3 games:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "setWithArray:", a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_gkValuesForKeyPath:", CFSTR("bundleIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadGameRecordsForPlayer:bundleIDs:withCompletionHandler:", v10, v11, v9);

}

+ (void)loadGameRecordsForPlayer:(id)a3 bundleIDs:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, void *);
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "count");
  objc_msgSend(a1, "internalRepresentationCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __73__GKGameRecord_loadGameRecordsForPlayer_bundleIDs_withCompletionHandler___block_invoke;
  v26 = &unk_1E75B1D68;
  v13 = v10;
  v30 = v13;
  v31 = v11;
  v14 = v9;
  v27 = v14;
  v32 = a1;
  v15 = v8;
  v28 = v15;
  v16 = v12;
  v29 = v16;
  v17 = _Block_copy(&v23);
  v18 = v17;
  if (v11)
  {
    +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer", v23, v24, v25, v26, v27, v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDaemonProxy proxyForPlayer:](GKDaemonProxy, "proxyForPlayer:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "gameServicePrivate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "internal");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "getGameStatsForPlayer:bundleIDs:handler:", v22, v14, v18);

  }
  else
  {
    (*((void (**)(void *, _QWORD, _QWORD))v17 + 2))(v17, 0, 0);
  }

}

void __73__GKGameRecord_loadGameRecordsForPlayer_bundleIDs_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 56))
  {
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __73__GKGameRecord_loadGameRecordsForPlayer_bundleIDs_withCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E75B1D40;
    v8 = v5;
    v9 = *(_QWORD *)(a1 + 64);
    v13 = v8;
    v19 = v9;
    v10 = *(id *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 72);
    v14 = v10;
    v20 = v11;
    v15 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 48);
    v18 = *(id *)(a1 + 56);
    v17 = v6;
    dispatch_async(v7, v12);

  }
}

void __73__GKGameRecord_loadGameRecordsForPlayer_bundleIDs_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  void *v18;
  GKGameRecord *v19;
  _QWORD block[4];
  id v21;
  id v22;
  uint64_t *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "count");
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__2;
  v36 = __Block_byref_object_dispose__2;
  v37 = 0;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v29 = 0u;
    v28 = 0u;
    v4 = *(id *)(a1 + 32);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v29 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v8, "bundleIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
            objc_msgSend(v3, "setObject:forKey:", v8, v9);

        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
      }
      while (v5);
    }

    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 80));
    v11 = (void *)v33[5];
    v33[5] = v10;

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v12 = *(id *)(a1 + 40);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v12);
          v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
          objc_msgSend(*(id *)(a1 + 88), "cacheKeyForPlayer:bundleIdentifier:", *(_QWORD *)(a1 + 48), v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKey:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v18, v17);
          }
          else
          {
            +[GKInternalRepresentation internalRepresentation](GKGameRecordInternal, "internalRepresentation");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v19 = -[GKGameRecord initWithInternalRepresentation:player:]([GKGameRecord alloc], "initWithInternalRepresentation:player:", v18, *(_QWORD *)(a1 + 48));
          objc_msgSend((id)v33[5], "addObject:", v19);

        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
      }
      while (v13);
    }

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__GKGameRecord_loadGameRecordsForPlayer_bundleIDs_withCompletionHandler___block_invoke_27;
  block[3] = &unk_1E75B1D18;
  v22 = *(id *)(a1 + 72);
  v23 = &v32;
  v21 = *(id *)(a1 + 64);
  dispatch_async(MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(&v32, 8);
}

uint64_t __73__GKGameRecord_loadGameRecordsForPlayer_bundleIDs_withCompletionHandler___block_invoke_27(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[4]);
}

- (GKPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
}

void __67__GKGameRecord_loadGameRecordForPlayer_game_withCompletionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = 134218242;
  v5 = objc_msgSend(a2, "count");
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_1BCDE3000, v3, OS_LOG_TYPE_DEBUG, "passed in 1 game and got %lu records: %@, will only use the first one", (uint8_t *)&v4, 0x16u);

}

@end
