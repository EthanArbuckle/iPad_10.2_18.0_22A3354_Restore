@implementation CESRSpeechItemRanker_Media

- (CESRSpeechItemRanker_Media)initWithInstance:(id)a3 speechProfileSite:(id)a4 categoryGroup:(id)a5
{
  return -[CESRSpeechItemRanker_Media initWithInstance:speechProfileSite:categoryGroup:playableLimit:artistLimit:itemIdToRank:](self, "initWithInstance:speechProfileSite:categoryGroup:playableLimit:artistLimit:itemIdToRank:", a3, a4, a5, 1500, 1500, 0);
}

- (CESRSpeechItemRanker_Media)initWithInstance:(id)a3 speechProfileSite:(id)a4 categoryGroup:(id)a5 playableLimit:(unint64_t)a6 artistLimit:(unint64_t)a7 itemIdToRank:(id)a8
{
  id v15;
  CESRSpeechItemRanker_Media *v16;
  CESRSpeechItemRanker_Media *v17;
  NSString *trialMediaRankingStrategy;
  uint64_t v19;
  NSMutableSet *codepathIds;
  objc_super v22;

  v15 = a8;
  v22.receiver = self;
  v22.super_class = (Class)CESRSpeechItemRanker_Media;
  v16 = -[CESRSpeechItemRanker initWithInstance:speechProfileSite:categoryGroup:](&v22, sel_initWithInstance_speechProfileSite_categoryGroup_, a3, a4, a5);
  v17 = v16;
  if (v16)
  {
    trialMediaRankingStrategy = v16->_trialMediaRankingStrategy;
    v16->_trialMediaRankingStrategy = 0;

    v17->_playableLimit = a6;
    v17->_artistLimit = a7;
    objc_storeStrong((id *)&v17->_itemIdToRank, a8);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v19 = objc_claimAutoreleasedReturnValue();
    codepathIds = v17->_codepathIds;
    v17->_codepathIds = (NSMutableSet *)v19;

    -[CESRSpeechItemRanker_Media _activateEnrolledTrialExperiments](v17, "_activateEnrolledTrialExperiments");
  }

  return v17;
}

- (void)_activateEnrolledTrialExperiments
{
  void *v3;
  NSString *v4;
  NSString *trialMediaRankingStrategy;
  id v6;

  objc_msgSend(MEMORY[0x1E0DC09C8], "clientWithIdentifier:", 111);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "levelForFactor:withNamespaceName:", CFSTR("music_ranking_strategy"), CFSTR("SIRI_SPEECH_SV_SPEECH_PROFILE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  trialMediaRankingStrategy = self->_trialMediaRankingStrategy;
  self->_trialMediaRankingStrategy = v4;

}

- (id)getAllCodepathIds
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("eb18055e-87c4-44c2-ab94-9275bec61c52"), CFSTR("c852375e-0091-4dbd-b2f7-792507612de5"), 0);
}

- (id)getActivatedCodepathIds
{
  objc_super v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CESRSpeechItemRanker_Media;
  if (-[CESRSpeechItemRanker enumeratedItemCount](&v5, sel_enumeratedItemCount) >= 1)
    -[NSMutableSet addObject:](self->_codepathIds, "addObject:", CFSTR("eb18055e-87c4-44c2-ab94-9275bec61c52"));
  v4.receiver = self;
  v4.super_class = (Class)CESRSpeechItemRanker_Media;
  if (-[CESRSpeechItemRanker enumeratedItemCount](&v4, sel_enumeratedItemCount) >= (int64_t)(self->_artistLimit + self->_playableLimit))
    -[NSMutableSet addObject:](self->_codepathIds, "addObject:", CFSTR("c852375e-0091-4dbd-b2f7-792507612de5"));
  return self->_codepathIds;
}

- (BOOL)addSet:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (objc_msgSend(v4, "itemType") == 18540)
  {
    v7.receiver = self;
    v7.super_class = (Class)CESRSpeechItemRanker_Media;
    v5 = -[CESRSpeechItemRanker addSet:](&v7, sel_addSet_, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)enumerateRankedItemsWithError:(id *)a3 usingBlock:(id)a4
{
  id v6;
  NSObject *v7;
  NSDictionary *itemIdToRank;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  NSUInteger v12;
  uint64_t v13;
  NSDictionary *v14;
  uint64_t *v15;
  unint64_t artistLimit;
  NSObject *v17;
  const __CFString *v18;
  id v19;
  id v20;
  BOOL v21;
  objc_super v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  unint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[NSString isEqualToString:](self->_trialMediaRankingStrategy, "isEqualToString:", CFSTR("PlayCountSongTitleSelection")))
  {
    -[CESRSpeechItemRanker_Media _loadRankedItemCache](self, "_loadRankedItemCache");
    v7 = *MEMORY[0x1E0CFE6C0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
      goto LABEL_9;
    *(_DWORD *)buf = 136315394;
    v39 = "-[CESRSpeechItemRanker_Media enumerateRankedItemsWithError:usingBlock:]";
    v40 = 2112;
    v41 = CFSTR("PlayCountSongTitleSelection");
LABEL_7:
    _os_log_impl(&dword_1B3E5F000, v7, OS_LOG_TYPE_INFO, "%s Active ASR A/B trial experiment for Media Ranking. Treatment = %@", buf, 0x16u);
    goto LABEL_9;
  }
  if (-[NSString isEqualToString:](self->_trialMediaRankingStrategy, "isEqualToString:", CFSTR("RandomSongTitleSelection")))
  {
    itemIdToRank = self->_itemIdToRank;
    self->_itemIdToRank = 0;

    v7 = *MEMORY[0x1E0CFE6C0];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
      goto LABEL_9;
    *(_DWORD *)buf = 136315394;
    v39 = "-[CESRSpeechItemRanker_Media enumerateRankedItemsWithError:usingBlock:]";
    v40 = 2112;
    v41 = CFSTR("RandomSongTitleSelection");
    goto LABEL_7;
  }
  -[CESRSpeechItemRanker_Media _loadRankedItemCache](self, "_loadRankedItemCache");
LABEL_9:
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  if (-[NSDictionary count](self->_itemIdToRank, "count"))
  {
    +[CESRSpeechItemRanker_Media queryRecentMediaEntities](CESRSpeechItemRanker_Media, "queryRecentMediaEntities");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_artistLimit + self->_playableLimit;
    v11 = (id)*MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = -[NSDictionary count](self->_itemIdToRank, "count");
      v13 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 136315906;
      v39 = "-[CESRSpeechItemRanker_Media enumerateRankedItemsWithError:usingBlock:]";
      v40 = 2048;
      v41 = (const __CFString *)v12;
      v42 = 2048;
      v43 = v13;
      v44 = 2048;
      v45 = v10;
      _os_log_impl(&dword_1B3E5F000, v11, OS_LOG_TYPE_INFO, "%s Ranked media items available. rankedItemCount=%tu, recentItemCount=%tu, limit=%tu", buf, 0x2Au);
    }

  }
  else
  {
    v14 = self->_itemIdToRank;
    self->_itemIdToRank = 0;

    v15 = v35;
    v35[3] = self->_playableLimit;
    artistLimit = self->_artistLimit;
    v31[3] = artistLimit;
    v17 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v18 = (const __CFString *)v15[3];
      *(_DWORD *)buf = 136315650;
      v39 = "-[CESRSpeechItemRanker_Media enumerateRankedItemsWithError:usingBlock:]";
      v40 = 2048;
      v41 = v18;
      v42 = 2048;
      v43 = artistLimit;
      _os_log_impl(&dword_1B3E5F000, v17, OS_LOG_TYPE_INFO, "%s No ranked media items available. Limiting to %tu playable entities and %tu artist entities.", buf, 0x20u);
    }
    v10 = 0;
    v9 = 0;
  }
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __71__CESRSpeechItemRanker_Media_enumerateRankedItemsWithError_usingBlock___block_invoke;
  v24[3] = &unk_1E6733D00;
  v24[4] = self;
  v29 = v10;
  v19 = v9;
  v25 = v19;
  v20 = v6;
  v26 = v20;
  v27 = &v34;
  v28 = &v30;
  v23.receiver = self;
  v23.super_class = (Class)CESRSpeechItemRanker_Media;
  v21 = -[CESRSpeechItemRanker enumerateRankedItemsWithError:usingBlock:](&v23, sel_enumerateRankedItemsWithError_usingBlock_, a3, v24);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v21;
}

- (BOOL)refreshRankedItemCache:(id *)a3
{
  void *v4;
  char v5;
  int v6;
  os_log_t *v8;
  NSObject *v9;
  NSDictionary *v10;
  NSDictionary *itemIdToRank;
  void *v12;
  os_log_t v13;
  NSDictionary *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!+[CESRUtilities isSiriMuxSupported](CESRUtilities, "isSiriMuxSupported")
    && (-[CESRSpeechItemRanker instance](self, "instance"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "options"),
        v4,
        (v5 & 1) != 0))
  {
    v8 = (os_log_t *)MEMORY[0x1E0CFE6C0];
    v9 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v18 = 136315138;
      v19 = "-[CESRSpeechItemRanker_Media refreshRankedItemCache:]";
      _os_log_impl(&dword_1B3E5F000, v9, OS_LOG_TYPE_INFO, "%s Starting refresh of ranked item cache.", (uint8_t *)&v18, 0xCu);
    }
    -[CESRSpeechItemRanker_Media _queryAndRankMediaItems](self, "_queryAndRankMediaItems");
    v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    itemIdToRank = self->_itemIdToRank;
    self->_itemIdToRank = v10;

    if (-[NSDictionary count](self->_itemIdToRank, "count"))
    {
      -[CESRSpeechItemRanker_Media _rankedItemCacheFile](self, "_rankedItemCacheFile");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CESRSpeechItemRanker_Media _dataProtectionClass](self, "_dataProtectionClass");
      v6 = SFWritePropertyList();

      if (v6)
      {
        v13 = *v8;
        LOBYTE(v6) = 1;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
        {
          v14 = self->_itemIdToRank;
          v15 = v13;
          v16 = -[NSDictionary count](v14, "count");
          v18 = 136315394;
          v19 = "-[CESRSpeechItemRanker_Media refreshRankedItemCache:]";
          v20 = 2048;
          v21 = v16;
          _os_log_impl(&dword_1B3E5F000, v15, OS_LOG_TYPE_INFO, "%s Wrote ranked item cache with numIds=%tu", (uint8_t *)&v18, 0x16u);

        }
      }
    }
    else
    {
      v17 = *v8;
      LOBYTE(v6) = 1;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        v18 = 136315138;
        v19 = "-[CESRSpeechItemRanker_Media refreshRankedItemCache:]";
        _os_log_impl(&dword_1B3E5F000, v17, OS_LOG_TYPE_INFO, "%s No ranked items found.", (uint8_t *)&v18, 0xCu);
      }
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (id)_queryAndRankMediaItems
{
  os_log_t *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v4 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v44 = "-[CESRSpeechItemRanker_Media _queryAndRankMediaItems]";
    _os_log_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_INFO, "%s Querying the media library for songs and playlists.", buf, 0xCu);
  }
  +[CESRSpeechItemRanker_Media queryTopPlayableIds](CESRSpeechItemRanker_Media, "queryTopPlayableIds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v44 = "-[CESRSpeechItemRanker_Media _queryAndRankMediaItems]";
    _os_log_impl(&dword_1B3E5F000, v9, OS_LOG_TYPE_INFO, "%s Enumerating the SV media set to find album and artist IDs for songs found from the media library.", buf, 0xCu);
  }
  v42 = 0;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __53__CESRSpeechItemRanker_Media__queryAndRankMediaItems__block_invoke;
  v37[3] = &unk_1E6733D28;
  v10 = v5;
  v38 = v10;
  v31 = v7;
  v39 = v31;
  v11 = v8;
  v40 = v11;
  v30 = v6;
  v41 = v30;
  v36.receiver = self;
  v36.super_class = (Class)CESRSpeechItemRanker_Media;
  -[CESRSpeechItemRanker enumerateRankedItemsWithError:usingBlock:](&v36, sel_enumerateRankedItemsWithError_usingBlock_, &v42, v37);
  v29 = v42;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v49, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v12, "addObject:", v19);
        objc_msgSend(v30, "objectForKey:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          objc_msgSend(v12, "addObject:", v20);
        objc_msgSend(v31, "objectForKey:", v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          objc_msgSend(v13, "addObject:", v21);
        objc_msgSend(v11, "objectForKey:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          objc_msgSend(v13, "addObject:", v22);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v32, v49, 16);
    }
    while (v16);
  }

  v23 = (void *)*MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_DEBUG))
  {
    v26 = v23;
    v27 = objc_msgSend(v12, "count");
    v28 = objc_msgSend(v13, "count");
    *(_DWORD *)buf = 136315650;
    v44 = "-[CESRSpeechItemRanker_Media _queryAndRankMediaItems]";
    v45 = 2048;
    v46 = v27;
    v47 = 2048;
    v48 = v28;
    _os_log_debug_impl(&dword_1B3E5F000, v26, OS_LOG_TYPE_DEBUG, "%s topPlayableIds=%tu, topAristIds=%tu", buf, 0x20u);

  }
  +[CESRSpeechItemRanker_Media _rankedItemIdsFromTopPlayables:topArtists:playableLimit:artistLimit:](CESRSpeechItemRanker_Media, "_rankedItemIdsFromTopPlayables:topArtists:playableLimit:artistLimit:", v12, v13, 1500, 1500);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (BOOL)_loadRankedItemCache
{
  BOOL v2;
  void *v4;
  void *v5;
  id v6;
  NSDictionary *v7;
  NSDictionary *itemIdToRank;
  NSDictionary *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_itemIdToRank)
  {
    -[CESRSpeechItemRanker_Media _rankedItemCacheFile](self, "_rankedItemCacheFile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    SFReadPropertyList();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v5;
      if (-[NSDictionary count](v7, "count"))
      {
        itemIdToRank = self->_itemIdToRank;
        self->_itemIdToRank = v7;
        v9 = v7;

        v2 = 1;
LABEL_12:

        return v2;
      }
      v11 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "-[CESRSpeechItemRanker_Media _loadRankedItemCache]";
        _os_log_error_impl(&dword_1B3E5F000, v11, OS_LOG_TYPE_ERROR, "%s Ranked media item cache is empty.", buf, 0xCu);
      }

    }
    else
    {
      v10 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "-[CESRSpeechItemRanker_Media _loadRankedItemCache]";
        v15 = 2112;
        v16 = v6;
        _os_log_error_impl(&dword_1B3E5F000, v10, OS_LOG_TYPE_ERROR, "%s Couldn't read ranked media item cache from disk: %@", buf, 0x16u);
      }
    }
    v2 = 0;
    goto LABEL_12;
  }
  return 1;
}

- (id)_rankedItemCacheFile
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0C99E98]);
  -[CESRSpeechItemRanker speechProfileSite](self, "speechProfileSite");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "speechProfileSiteURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithString:relativeToURL:", CFSTR("ranked_item_cache-media.plist"), v5);

  return v6;
}

- (int)_dataProtectionClass
{
  void *v2;
  int v3;

  -[CESRSpeechItemRanker speechProfileSite](self, "speechProfileSite");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dataProtectionClass");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codepathIds, 0);
  objc_storeStrong((id *)&self->_itemIdToRank, 0);
  objc_storeStrong((id *)&self->_trialMediaRankingStrategy, 0);
}

+ (BOOL)_isPlayableItem:(id)a3
{
  void *v3;
  unsigned int v4;
  unsigned int v5;

  objc_msgSend(a3, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "entityType");
    if (v4 <= 6)
      v5 = (0x68u >> v4) & 1;
    else
      LOBYTE(v5) = 0;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (BOOL)_isArtistItem:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a3, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "entityType") - 1 < 2;

  return v4;
}

+ (id)_itemIdsFromMediaEntities:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
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

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = v5;
    v20 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
              objc_msgSend(v14, "_tokenBinaryIdentifierAsString");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "length");

              if (v16)
              {
                objc_msgSend(v14, "_tokenBinaryIdentifierAsString");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "addObject:", v17);

              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v11);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v6);
  }

  return v4;
}

+ (id)_rankedItemIdsFromTopPlayables:(id)a3 topArtists:(id)a4 playableLimit:(unint64_t)a5 artistLimit:(unint64_t)a6
{
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;

  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "count");
  if (v12 >= a5)
    v13 = a5;
  else
    v13 = v12;
  if (v13)
  {
    v14 = 0;
    do
    {
      v15 = v14 + 1;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v16, v17);

      v14 = v15;
    }
    while (v13 != v15);
  }
  v18 = objc_msgSend(v10, "count");
  if (v18 >= a6)
    v19 = a6;
  else
    v19 = v18;
  if (v19)
  {
    for (i = 0; i != v19; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13 + i);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", i);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v21, v22);

    }
  }

  return v11;
}

+ (id)queryTopPlayableIds
{
  void *v2;
  os_log_t *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint8_t buf[4];
  const char *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v4 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "+[CESRSpeechItemRanker_Media queryTopPlayableIds]";
    _os_log_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_INFO, "%s Executing Most Recently Played Playlists query.", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CC2438], "playlistsQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = *MEMORY[0x1E0CC2018];
  v6 = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v6;
  v49 = &unk_1E6744FE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CESRSpeechItemRanker_Media _performMediaCollectionsQuery:limit:orderingProperties:orderingDirectionMappings:](CESRSpeechItemRanker_Media, "_performMediaCollectionsQuery:limit:orderingProperties:orderingDirectionMappings:", v5, 100, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
    objc_msgSend(v2, "addObject:", v9);
  v10 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "+[CESRSpeechItemRanker_Media queryTopPlayableIds]";
    _os_log_impl(&dword_1B3E5F000, v10, OS_LOG_TYPE_INFO, "%s Executing Most Recently Added Playlists query.", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CC2438], "playlistsQuery");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = *MEMORY[0x1E0CC2010];
  v12 = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v12;
  v46 = &unk_1E6744FE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CESRSpeechItemRanker_Media _performMediaCollectionsQuery:limit:orderingProperties:orderingDirectionMappings:](CESRSpeechItemRanker_Media, "_performMediaCollectionsQuery:limit:orderingProperties:orderingDirectionMappings:", v11, 100, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
    objc_msgSend(v2, "addObject:", v15);
  v16 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "+[CESRSpeechItemRanker_Media queryTopPlayableIds]";
    _os_log_impl(&dword_1B3E5F000, v16, OS_LOG_TYPE_INFO, "%s Executing Most Recently Played Songs query.", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CC2438], "songsQuery");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = *MEMORY[0x1E0CC1EB8];
  v18 = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v18;
  v43 = &unk_1E6744FE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[CESRSpeechItemRanker_Media _performMediaItemsQuery:limit:orderingProperties:orderingDirectionMappings:](CESRSpeechItemRanker_Media, "_performMediaItemsQuery:limit:orderingProperties:orderingDirectionMappings:", v17, 250, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v21, "count"))
    objc_msgSend(v2, "addObject:", v21);
  v22 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "+[CESRSpeechItemRanker_Media queryTopPlayableIds]";
    _os_log_impl(&dword_1B3E5F000, v22, OS_LOG_TYPE_INFO, "%s Executing Most Recently Added Songs query.", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CC2438], "songsQuery");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = *MEMORY[0x1E0CC1DE0];
  v24 = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v24;
  v40 = &unk_1E6744FE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[CESRSpeechItemRanker_Media _performMediaItemsQuery:limit:orderingProperties:orderingDirectionMappings:](CESRSpeechItemRanker_Media, "_performMediaItemsQuery:limit:orderingProperties:orderingDirectionMappings:", v23, 150, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v27, "count"))
    objc_msgSend(v2, "addObject:", v27);
  v28 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "+[CESRSpeechItemRanker_Media queryTopPlayableIds]";
    _os_log_impl(&dword_1B3E5F000, v28, OS_LOG_TYPE_INFO, "%s Executing Most Played Songs query.", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CC2438], "songsQuery");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = *MEMORY[0x1E0CC1ED8];
  v30 = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v30;
  v37 = &unk_1E6744FE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[CESRSpeechItemRanker_Media _performMediaItemsQuery:limit:orderingProperties:orderingDirectionMappings:](CESRSpeechItemRanker_Media, "_performMediaItemsQuery:limit:orderingProperties:orderingDirectionMappings:", v29, 3000, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v33, "count"))
    objc_msgSend(v2, "addObject:", v33);
  +[CESRSpeechItemRanker_Media _itemIdsFromMediaEntities:](CESRSpeechItemRanker_Media, "_itemIdsFromMediaEntities:", v2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

+ (id)queryRecentMediaEntities
{
  void *v2;
  os_log_t *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint8_t buf[4];
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v4 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "+[CESRSpeechItemRanker_Media queryRecentMediaEntities]";
    _os_log_impl(&dword_1B3E5F000, v4, OS_LOG_TYPE_INFO, "%s Executing Most Recently Added Playlists query.", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CC2438], "playlistsQuery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x1E0CC2010];
  v6 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v6;
  v22 = &unk_1E6744FE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CESRSpeechItemRanker_Media _performMediaCollectionsQuery:limit:orderingProperties:orderingDirectionMappings:](CESRSpeechItemRanker_Media, "_performMediaCollectionsQuery:limit:orderingProperties:orderingDirectionMappings:", v5, 15, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
    objc_msgSend(v2, "addObject:", v9);
  v10 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "+[CESRSpeechItemRanker_Media queryRecentMediaEntities]";
    _os_log_impl(&dword_1B3E5F000, v10, OS_LOG_TYPE_INFO, "%s Executing Most Recently Added Songs query.", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CC2438], "songsQuery");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x1E0CC1DE0];
  v12 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v12;
  v19 = &unk_1E6744FE8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CESRSpeechItemRanker_Media _performMediaItemsQuery:limit:orderingProperties:orderingDirectionMappings:](CESRSpeechItemRanker_Media, "_performMediaItemsQuery:limit:orderingProperties:orderingDirectionMappings:", v11, 25, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
    objc_msgSend(v2, "addObject:", v15);
  +[CESRSpeechItemRanker_Media _itemIdsFromMediaEntities:](CESRSpeechItemRanker_Media, "_itemIdsFromMediaEntities:", v2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_performMediaCollectionsQuery:(id)a3 limit:(unint64_t)a4 orderingProperties:(id)a5 orderingDirectionMappings:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  objc_msgSend(v11, "setEntityLimit:", a4);
  objc_msgSend(v11, "_setOrderingProperties:", v10);

  objc_msgSend(v11, "_setOrderingDirectionMappings:", v9);
  objc_msgSend(v11, "collections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_performMediaItemsQuery:(id)a3 limit:(unint64_t)a4 orderingProperties:(id)a5 orderingDirectionMappings:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  objc_msgSend(v11, "setEntityLimit:", a4);
  objc_msgSend(v11, "_setOrderingProperties:", v10);

  objc_msgSend(v11, "_setOrderingDirectionMappings:", v9);
  objc_msgSend(v11, "items");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
