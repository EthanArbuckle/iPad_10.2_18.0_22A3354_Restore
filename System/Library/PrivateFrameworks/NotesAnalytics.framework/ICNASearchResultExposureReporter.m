@implementation ICNASearchResultExposureReporter

- (ICNASearchResultExposureReporter)initWithWindow:(id)a3
{
  id v4;
  ICNASearchResultExposureReporter *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *isolationQueue;
  NSMutableArray *v9;
  NSMutableArray *searchResultExposureItems;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICNASearchResultExposureReporter;
  v5 = -[ICNASearchResultExposureReporter init](&v13, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.notes.analytics.searchResultExposureReporter", v6);
    isolationQueue = v5->_isolationQueue;
    v5->_isolationQueue = (OS_dispatch_queue *)v7;

    objc_storeWeak((id *)&v5->_window, v4);
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    searchResultExposureItems = v5->_searchResultExposureItems;
    v5->_searchResultExposureItems = v9;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v5, sel_analyticsSessionWillEnd_, CFSTR("ICNASessionWillEndNotification"), 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICNASearchResultExposureReporter;
  -[ICNASearchResultExposureReporter dealloc](&v4, sel_dealloc);
}

- (void)updateSearchSessionID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICNASearchResultExposureReporter isolationQueue](self, "isolationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__ICNASearchResultExposureReporter_updateSearchSessionID___block_invoke;
  v7[3] = &unk_1E771BEA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, v7);

}

void __58__ICNASearchResultExposureReporter_updateSearchSessionID___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setSearchSessionID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "searchResultExposureItems");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)invalidateSearchSessionID
{
  NSObject *v3;
  _QWORD block[5];

  -[ICNASearchResultExposureReporter isolationQueue](self, "isolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__ICNASearchResultExposureReporter_invalidateSearchSessionID__block_invoke;
  block[3] = &unk_1E771BE80;
  block[4] = self;
  dispatch_barrier_async(v3, block);

}

void __61__ICNASearchResultExposureReporter_invalidateSearchSessionID__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setSearchSessionID:", 0);
  objc_msgSend(*(id *)(a1 + 32), "searchResultExposureItems");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (void)startTrackingNewSearchString:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICNASearchResultExposureReporter isolationQueue](self, "isolationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__ICNASearchResultExposureReporter_startTrackingNewSearchString___block_invoke;
  v7[3] = &unk_1E771BEA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(v5, v7);

}

void __65__ICNASearchResultExposureReporter_startTrackingNewSearchString___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  ICNASearchResultExposureItem *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "searchSessionID");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(*(id *)(a1 + 32), "searchResultExposureItems");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "searchString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 40));

    if ((v7 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "searchResultExposureItems");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v8 = -[ICNASearchResultExposureItem initWithSearchString:]([ICNASearchResultExposureItem alloc], "initWithSearchString:", *(_QWORD *)(a1 + 40));
      objc_msgSend(v9, "addObject:", v8);

    }
  }
}

- (void)updateWithTopHitResultCount:(unint64_t)a3 nonTopHitResultCount:(unint64_t)a4 attachmentSectionCount:(unint64_t)a5
{
  NSObject *v9;
  _QWORD v10[8];

  -[ICNASearchResultExposureReporter isolationQueue](self, "isolationQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __108__ICNASearchResultExposureReporter_updateWithTopHitResultCount_nonTopHitResultCount_attachmentSectionCount___block_invoke;
  v10[3] = &unk_1E771C1C8;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a4;
  v10[7] = a5;
  dispatch_barrier_async(v9, v10);

}

void __108__ICNASearchResultExposureReporter_updateWithTopHitResultCount_nonTopHitResultCount_attachmentSectionCount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "searchSessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "searchResultExposureItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "updateWithTopHitResultCount:nonTopHitResultCount:attachmentSectionCount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
}

- (void)updateSearchResultWasSelected:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[ICNASearchResultExposureReporter isolationQueue](self, "isolationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__ICNASearchResultExposureReporter_updateSearchResultWasSelected___block_invoke;
  v6[3] = &unk_1E771C1F0;
  v6[4] = self;
  v7 = a3;
  dispatch_barrier_async(v5, v6);

}

void __66__ICNASearchResultExposureReporter_updateSearchResultWasSelected___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "searchSessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "searchResultExposureItems");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setSearchResultWasSelected:", *(unsigned __int8 *)(a1 + 40));
  }
}

- (void)submitEventIfApplicable
{
  NSObject *v3;
  _QWORD block[5];

  -[ICNASearchResultExposureReporter isolationQueue](self, "isolationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ICNASearchResultExposureReporter_submitEventIfApplicable__block_invoke;
  block[3] = &unk_1E771BE80;
  block[4] = self;
  dispatch_async(v3, block);

}

void __59__ICNASearchResultExposureReporter_submitEventIfApplicable__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "searchSessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_exposureDataThreadUnsafe");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "eventReporter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "searchSessionID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "submitSearchResultExposureSummaryEventWithSearchResultExposureData:searchSessionID:", v5, v4);

  }
}

- (id)_exposureDataThreadUnsafe
{
  unint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  ICASSearchBufferArrayData *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  ICASSearchBufferArrayData *v21;
  ICASSearchResultExposureData *v22;
  void *v23;
  void *v24;
  void *v25;
  ICASSearchResultExposureData *v26;
  id obj;
  uint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[ICNASearchResultExposureReporter searchResultExposureItems](self, "searchResultExposureItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v34)
  {
    v31 = 0;
    v32 = 0;
    v3 = 0;
    v29 = *(_QWORD *)v37;
    v30 = 0;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v37 != v29)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v5, "searchString");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "length");
        v8 = objc_msgSend(v6, "length");
        v9 = v8;
        if (v7 <= v3)
        {
          v35 = v3;
          if (v8 == v3)
          {
            v10 = objc_msgSend(v5, "topHitResultCount");
            v11 = v30;
            if (v30 <= v10)
              v11 = v10;
            v30 = v11;
            v12 = objc_msgSend(v5, "attachmentSectionCount");
            v13 = v32;
            if (v32 <= v12)
              v13 = v12;
            v32 = v13;
            v31 |= objc_msgSend(v5, "nonTopHitResultCount") != 0;
          }
        }
        else
        {
          v30 = objc_msgSend(v5, "topHitResultCount");
          v32 = objc_msgSend(v5, "attachmentSectionCount");
          v31 = objc_msgSend(v5, "nonTopHitResultCount") != 0;
          v35 = v9;
        }
        v14 = [ICASSearchBufferArrayData alloc];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v6, "length")));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v5, "topHitResultCount")));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "nonTopHitResultCount") != 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "searchResultWasSelected"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(objc_msgSend(v5, "nonTopHitResultCount")));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "attachmentSectionCount"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[ICASSearchBufferArrayData initWithSearchStringLength:topHitCount:nonTopHitCount:isResultSelected:nonTopHitRawCount:attachmentHitCount:](v14, "initWithSearchStringLength:topHitCount:nonTopHitCount:isResultSelected:nonTopHitRawCount:attachmentHitCount:", v15, v16, v17, v18, v19, v20);

        objc_msgSend(v33, "ic_addNonNilObject:", v21);
        v3 = v35;
      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v34);
  }
  else
  {
    v31 = 0;
    v32 = 0;
    v30 = 0;
  }

  v22 = [ICASSearchResultExposureData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v30));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v31 & 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v32);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[ICASSearchResultExposureData initWithTopHitCountForLongestSearchString:hasNonTopHitResultsForLongestSearchString:attachmentHitCountForLongestSearchString:searchBufferArray:](v22, "initWithTopHitCountForLongestSearchString:hasNonTopHitResultsForLongestSearchString:attachmentHitCountForLongestSearchString:searchBufferArray:", v23, v24, v25, v33);

  return v26;
}

- (void)analyticsSessionWillEnd:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  _QWORD v15[5];

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "persistentIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNASearchResultExposureReporter window](self, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "persistentIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "isEqual:", v12);

  if (v13)
  {
    +[ICNAController sharedController](ICNAController, "sharedController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __60__ICNASearchResultExposureReporter_analyticsSessionWillEnd___block_invoke;
    v15[3] = &unk_1E771BE80;
    v15[4] = self;
    objc_msgSend(v14, "performOnInstrumentationQueueWaitUntilDone:block:", 0, v15);

  }
}

void __60__ICNASearchResultExposureReporter_analyticsSessionWillEnd___block_invoke(uint64_t a1)
{
  NSObject *v2;
  ICASSearchData *v3;
  void *v4;
  ICASSearchData *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD block[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  objc_msgSend(*(id *)(a1 + 32), "isolationQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__ICNASearchResultExposureReporter_analyticsSessionWillEnd___block_invoke_58;
  block[3] = &unk_1E771C218;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = &v12;
  dispatch_sync(v2, block);

  if (v13[5])
  {
    v3 = [ICASSearchData alloc];
    objc_msgSend(*(id *)(a1 + 32), "searchSessionID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[ICASSearchData initWithSearchSessionID:](v3, "initWithSearchSessionID:", v4);

    +[ICNAController sharedController](ICNAController, "sharedController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    v18[0] = v13[5];
    v18[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "eventReporter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subTracker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_immediatelySubmitEventOfType:pushThenPopDataObjects:subTracker:", v7, v8, v10);

  }
  _Block_object_dispose(&v12, 8);

}

void __60__ICNASearchResultExposureReporter_analyticsSessionWillEnd___block_invoke_58(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "searchSessionID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_exposureDataThreadUnsafe");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (ICNAEventReporter)eventReporter
{
  ICNAEventReporter *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  ICNAEventReporter *v7;
  ICNAEventReporter *eventReporter;
  void *v9;

  if (!self->_eventReporter
    && +[ICNAOptedInObject isOptedInForAnalytics](ICNAEventReporter, "isOptedInForAnalytics"))
  {
    v3 = [ICNAEventReporter alloc];
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNASearchResultExposureReporter window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ICNAEventReporter initWithSubTrackerName:window:](v3, "initWithSubTrackerName:window:", v5, v6);
    eventReporter = self->_eventReporter;
    self->_eventReporter = v7;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_eventReporterLostSession_, CFSTR("ICNAEventReporterLostSessionNotification"), self->_eventReporter);

  }
  return self->_eventReporter;
}

- (void)eventReporterLostSession:(id)a3
{
  ICNAEventReporter *eventReporter;
  id v5;
  void *v6;
  id v7;

  eventReporter = self->_eventReporter;
  self->_eventReporter = 0;
  v5 = a3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("ICNAEventReporterLostSessionNotification"), v6);
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (void)setIsolationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_isolationQueue, a3);
}

- (UIWindow)window
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_window);
}

- (void)setWindow:(id)a3
{
  objc_storeWeak((id *)&self->_window, a3);
}

- (void)setEventReporter:(id)a3
{
  objc_storeStrong((id *)&self->_eventReporter, a3);
}

- (NSString)searchSessionID
{
  return self->_searchSessionID;
}

- (void)setSearchSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_searchSessionID, a3);
}

- (NSMutableArray)searchResultExposureItems
{
  return self->_searchResultExposureItems;
}

- (void)setSearchResultExposureItems:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultExposureItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResultExposureItems, 0);
  objc_storeStrong((id *)&self->_searchSessionID, 0);
  objc_storeStrong((id *)&self->_eventReporter, 0);
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

@end
