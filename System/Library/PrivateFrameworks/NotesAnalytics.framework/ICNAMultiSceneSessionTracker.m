@implementation ICNAMultiSceneSessionTracker

- (ICNAMultiSceneSessionTracker)init
{
  ICNAMultiSceneSessionTracker *v2;
  ICNASceneSessionTracker *v3;
  ICNASceneSessionTracker *v4;
  ICNASceneSessionTracker *v5;
  uint64_t v6;
  NSDictionary *sceneSessionTrackers;
  dispatch_queue_t v8;
  OS_dispatch_queue *isolationQueue;
  objc_super v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)ICNAMultiSceneSessionTracker;
  v2 = -[ICNAMultiSceneSessionTracker init](&v11, sel_init);
  if (v2)
  {
    v12[0] = CFSTR("notes");
    v3 = -[ICNASceneSessionTracker initWithSessionTypeEnum:]([ICNASceneSessionTracker alloc], "initWithSessionTypeEnum:", 2);
    v13[0] = v3;
    v12[1] = CFSTR("paper");
    v4 = -[ICNASceneSessionTracker initWithSessionTypeEnum:]([ICNASceneSessionTracker alloc], "initWithSessionTypeEnum:", 1);
    v13[1] = v4;
    v12[2] = CFSTR("notesAndPaper");
    v5 = -[ICNASceneSessionTracker initWithSessionTypeEnum:]([ICNASceneSessionTracker alloc], "initWithSessionTypeEnum:", 3);
    v13[2] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v6 = objc_claimAutoreleasedReturnValue();
    sceneSessionTrackers = v2->_sceneSessionTrackers;
    v2->_sceneSessionTrackers = (NSDictionary *)v6;

    v8 = dispatch_queue_create("com.apple.notes.analytics.multiSceneSessionTracker", MEMORY[0x1E0C80D50]);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v8;

  }
  return v2;
}

- (void)startNotesSession
{
  NSObject *v3;
  _QWORD block[5];

  -[ICNAMultiSceneSessionTracker isolationQueue](self, "isolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ICNAMultiSceneSessionTracker_startNotesSession__block_invoke;
  block[3] = &unk_1E771BE80;
  block[4] = self;
  dispatch_barrier_async(v3, block);

}

void __49__ICNAMultiSceneSessionTracker_startNotesSession__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  if ((objc_msgSend(*(id *)(a1 + 32), "isInvalidatedThreadUnsafe") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "sceneSessionTrackers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("notes"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startTimer");

    objc_msgSend(*(id *)(a1 + 32), "sceneSessionTrackers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("paper"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "timerIsOn");

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "sceneSessionTrackers");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("notesAndPaper"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "startTimer");

    }
  }
}

- (void)endNotesSession
{
  NSObject *v3;
  _QWORD block[5];

  -[ICNAMultiSceneSessionTracker isolationQueue](self, "isolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ICNAMultiSceneSessionTracker_endNotesSession__block_invoke;
  block[3] = &unk_1E771BE80;
  block[4] = self;
  dispatch_barrier_async(v3, block);

}

void __47__ICNAMultiSceneSessionTracker_endNotesSession__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "isInvalidatedThreadUnsafe") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "sceneSessionTrackers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("notes"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endTimer");

    objc_msgSend(*(id *)(a1 + 32), "sceneSessionTrackers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("notesAndPaper"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endTimer");

  }
}

- (void)startPaperSession
{
  NSObject *v3;
  _QWORD block[5];

  -[ICNAMultiSceneSessionTracker isolationQueue](self, "isolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__ICNAMultiSceneSessionTracker_startPaperSession__block_invoke;
  block[3] = &unk_1E771BE80;
  block[4] = self;
  dispatch_barrier_async(v3, block);

}

void __49__ICNAMultiSceneSessionTracker_startPaperSession__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  if ((objc_msgSend(*(id *)(a1 + 32), "isInvalidatedThreadUnsafe") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "sceneSessionTrackers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("paper"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startTimer");

    objc_msgSend(*(id *)(a1 + 32), "sceneSessionTrackers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("notes"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "timerIsOn");

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "sceneSessionTrackers");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("notesAndPaper"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "startTimer");

    }
  }
}

- (void)endPaperSession
{
  NSObject *v3;
  _QWORD block[5];

  -[ICNAMultiSceneSessionTracker isolationQueue](self, "isolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ICNAMultiSceneSessionTracker_endPaperSession__block_invoke;
  block[3] = &unk_1E771BE80;
  block[4] = self;
  dispatch_barrier_async(v3, block);

}

void __47__ICNAMultiSceneSessionTracker_endPaperSession__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "isInvalidatedThreadUnsafe") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "sceneSessionTrackers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("paper"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endTimer");

    objc_msgSend(*(id *)(a1 + 32), "sceneSessionTrackers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("notesAndPaper"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endTimer");

  }
}

- (void)endAllSessionsAndInvalidate
{
  NSObject *v3;
  _QWORD block[5];

  -[ICNAMultiSceneSessionTracker isolationQueue](self, "isolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ICNAMultiSceneSessionTracker_endAllSessionsAndInvalidate__block_invoke;
  block[3] = &unk_1E771BE80;
  block[4] = self;
  dispatch_barrier_async(v3, block);

}

uint64_t __59__ICNAMultiSceneSessionTracker_endAllSessionsAndInvalidate__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;
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
  result = objc_msgSend(*(id *)(a1 + 32), "isInvalidatedThreadUnsafe");
  if ((result & 1) == 0)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "sceneSessionTrackers", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

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
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "endTimer");
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

    return objc_msgSend(*(id *)(a1 + 32), "setInvalidated:", 1);
  }
  return result;
}

- (ICASSessionSummaryData)sessionSummaryData
{
  NSObject *v3;
  ICASSessionSummaryData *v4;
  ICASSessionSummaryData *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  v13 = 0;
  -[ICNAMultiSceneSessionTracker isolationQueue](self, "isolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__ICNAMultiSceneSessionTracker_sessionSummaryData__block_invoke;
  v7[3] = &unk_1E771BED0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v3, v7);

  v4 = [ICASSessionSummaryData alloc];
  v5 = -[ICASSessionSummaryData initWithSessionSummaryArray:](v4, "initWithSessionSummaryArray:", v9[5]);
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __50__ICNAMultiSceneSessionTracker_sessionSummaryData__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "sceneSessionTrackers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

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
        v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "sessionSummaryItemData");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "ic_addNonNilObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (BOOL)hasLiveTimers
{
  ICNAMultiSceneSessionTracker *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ICNAMultiSceneSessionTracker isolationQueue](self, "isolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__ICNAMultiSceneSessionTracker_hasLiveTimers__block_invoke;
  v5[3] = &unk_1E771C218;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __45__ICNAMultiSceneSessionTracker_hasLiveTimers__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isInvalidatedThreadUnsafe") & 1) == 0)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "sceneSessionTrackers", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
LABEL_4:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "timerIsOn");
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
          break;
        if (v5 == ++v7)
        {
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
          if (v5)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

- (int64_t)sessionDetailType
{
  NSObject *v3;
  int64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[ICNAMultiSceneSessionTracker isolationQueue](self, "isolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__ICNAMultiSceneSessionTracker_sessionDetailType__block_invoke;
  v6[3] = &unk_1E771C218;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __49__ICNAMultiSceneSessionTracker_sessionDetailType__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  int v11;

  if ((objc_msgSend(*(id *)(a1 + 32), "isInvalidatedThreadUnsafe") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "sceneSessionTrackers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("notesAndPaper"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "timerIsOn");

    if ((v4 & 1) != 0)
    {
      v5 = 3;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "sceneSessionTrackers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("notes"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "timerIsOn");

      if ((v8 & 1) != 0)
      {
        v5 = 2;
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "sceneSessionTrackers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("paper"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "timerIsOn");

        if (!v11)
          return;
        v5 = 1;
      }
    }
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;
  }
}

- (NSString)sessionDetailDescription
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  __CFString *v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = CFSTR("unknown");
  -[ICNAMultiSceneSessionTracker isolationQueue](self, "isolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__ICNAMultiSceneSessionTracker_sessionDetailDescription__block_invoke;
  v6[3] = &unk_1E771C218;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

void __56__ICNAMultiSceneSessionTracker_sessionDetailDescription__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  int v14;

  if ((objc_msgSend(*(id *)(a1 + 32), "isInvalidatedThreadUnsafe") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "sceneSessionTrackers");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("notesAndPaper"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "timerIsOn");

    if (v4)
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = CFSTR("notesAndPaper");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "sceneSessionTrackers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("notes"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "timerIsOn");

      if (v9)
      {
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v6 = *(void **)(v10 + 40);
        v11 = CFSTR("notes");
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "sceneSessionTrackers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("paper"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "timerIsOn");

        if (!v14)
          return;
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v6 = *(void **)(v10 + 40);
        v11 = CFSTR("paper");
      }
      *(_QWORD *)(v10 + 40) = v11;
    }

  }
}

- (BOOL)invalidated
{
  ICNAMultiSceneSessionTracker *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ICNAMultiSceneSessionTracker isolationQueue](self, "isolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__ICNAMultiSceneSessionTracker_invalidated__block_invoke;
  v5[3] = &unk_1E771BED0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __43__ICNAMultiSceneSessionTracker_invalidated__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (BOOL)isInvalidatedThreadUnsafe
{
  return self->_invalidated;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSDictionary)sceneSessionTrackers
{
  return self->_sceneSessionTrackers;
}

- (void)setSceneSessionTrackers:(id)a3
{
  objc_storeStrong((id *)&self->_sceneSessionTrackers, a3);
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (void)setIsolationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_isolationQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_sceneSessionTrackers, 0);
}

@end
