@implementation FCReadingHistoryMigrator

- (BOOL)keyValueStore:(id)a3 canMigrateFromVersion:(unint64_t)a4
{
  return a4 == 8;
}

- (id)keyValueStore:(id)a3 migrateObject:(id)a4 forKey:(id)a5 fromVersion:(unint64_t)a6
{
  id v7;
  BOOL v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  uint64_t v32;
  void *v33;
  int v34;

  v7 = a4;
  v8 = +[FCPrivateDataController isLocalStoreKeyInternal:](FCReadingHistory, "isLocalStoreKeyInternal:", a5);
  v9 = v7;
  if (!v8)
  {
    v10 = v7;
    v9 = objc_alloc_init(MEMORY[0x1E0D627E8]);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("articleID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setArticleID:", v11);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("sourceChannelTagID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSourceChannelTagID:", v12);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("deviceID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDeviceID:", v13);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("lastVisited"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLastVisitedAt:", v14);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("articleRead"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHasArticleBeenRead:", objc_msgSend(v15, "BOOLValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("articleSeen"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHasArticleBeenSeen:", objc_msgSend(v16, "BOOLValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("completedListening"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHasArticleCompletedListening:", objc_msgSend(v17, "BOOLValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("completedReading"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHasArticleCompletedReading:", objc_msgSend(v18, "BOOLValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("articleConsumed"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHasArticleBeenConsumed:", objc_msgSend(v19, "BOOLValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("offensive"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHasArticleBeenMarkedOffensive:", objc_msgSend(v20, "BOOLValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("removedFromAudio"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHasArticleBeenRemovedFromAudio:", objc_msgSend(v21, "BOOLValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("listenedCount"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setListenedCount:", (int)objc_msgSend(v22, "intValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("listeningProgress"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    objc_msgSend(v9, "setListeningProgress:");

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("listeningProgressLastSaved"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setListeningProgressSavedAt:", v24);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("lastListened"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLastListenedAt:", v25);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("readingPosition"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setReadingPosition:", v26);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("readingPositionLastSaved"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setReadingPositionSavedAt:", v27);

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("readCount"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setReadCount:", (int)objc_msgSend(v28, "intValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("pruningDisabled"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPruningDisabled:", objc_msgSend(v29, "BOOLValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("liked"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "BOOLValue");

    if ((v31 & 1) != 0)
    {
      v32 = 1;
    }
    else
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("disliked"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "BOOLValue");

      if (!v34)
      {
LABEL_7:

        goto LABEL_8;
      }
      v32 = 2;
    }
    objc_msgSend(v9, "setArticleLikingStatus:", v32);
    goto LABEL_7;
  }
LABEL_8:

  return v9;
}

@end
