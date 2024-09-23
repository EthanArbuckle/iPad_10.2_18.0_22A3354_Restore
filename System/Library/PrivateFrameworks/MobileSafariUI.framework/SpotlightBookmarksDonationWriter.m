@implementation SpotlightBookmarksDonationWriter

- (SpotlightBookmarksDonationWriter)init
{
  SpotlightBookmarksDonationWriter *v2;
  id v3;
  const char *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *internalQueue;
  uint64_t v8;
  WBSSiriIntelligenceDonor *siriIntelligenceDonor;
  NSObject *v10;
  SpotlightBookmarksDonationWriter *v11;
  void *v12;
  SpotlightBookmarksDonationWriter *v13;
  _QWORD block[4];
  SpotlightBookmarksDonationWriter *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SpotlightBookmarksDonationWriter;
  v2 = -[SpotlightBookmarksDonationWriter init](&v17, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.MobileSafari.SpotlightBookmarksDonationWriter.%@.%p._internalQueue"), objc_opt_class(), v2);
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = (const char *)objc_msgSend(v3, "UTF8String");
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create(v4, v5);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v6;

    objc_msgSend(MEMORY[0x1E0D8AC68], "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    siriIntelligenceDonor = v2->_siriIntelligenceDonor;
    v2->_siriIntelligenceDonor = (WBSSiriIntelligenceDonor *)v8;

    v10 = v2->_internalQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__SpotlightBookmarksDonationWriter_init__block_invoke;
    block[3] = &unk_1E9CF31B0;
    v11 = v2;
    v16 = v11;
    dispatch_async(v10, block);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, sel__bookmarksWereChanged_, *MEMORY[0x1E0DCCC00], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, sel__bookmarksWereChanged_, *MEMORY[0x1E0DCCC48], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, sel__bookmarksWereChanged_, *MEMORY[0x1E0DCCC10], 0);
    -[SpotlightBookmarksDonationWriter _scheduleBookmarksDonationAfterDelay:](v11, "_scheduleBookmarksDonationAfterDelay:", *MEMORY[0x1E0D8B108]);
    v13 = v11;

  }
  return v2;
}

void __40__SpotlightBookmarksDonationWriter_init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0DCCB18], "readonlySafariBookmarkCollectionConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSkipsExternalNotifications:", 1);
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0DCCBA0]), "initWithConfiguration:checkIntegrity:", v5, 0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

}

- (void)dealloc
{
  void *v3;
  WBSDispatchSourceTimer *donationTimer;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[WBSDispatchSourceTimer invalidate](self->_donationTimer, "invalidate");
  donationTimer = self->_donationTimer;
  self->_donationTimer = 0;

  v5.receiver = self;
  v5.super_class = (Class)SpotlightBookmarksDonationWriter;
  -[SpotlightBookmarksDonationWriter dealloc](&v5, sel_dealloc);
}

- (void)donateAllBookmarks
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SpotlightBookmarksDonationWriter_donateAllBookmarks__block_invoke;
  block[3] = &unk_1E9CF31B0;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

uint64_t __54__SpotlightBookmarksDonationWriter_donateAllBookmarks__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_donateBookmarksToCoreSpotlight");
}

- (void)_bookmarksWereChanged:(id)a3
{
  -[SpotlightBookmarksDonationWriter _scheduleBookmarksDonationAfterDelay:](self, "_scheduleBookmarksDonationAfterDelay:", a3, *MEMORY[0x1E0D8AEB0]);
}

- (void)_scheduleBookmarksDonationAfterDelay:(double)a3
{
  NSObject *internalQueue;
  _QWORD v6[5];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__SpotlightBookmarksDonationWriter__scheduleBookmarksDonationAfterDelay___block_invoke;
  v6[3] = &unk_1E9CFA460;
  v6[4] = self;
  v7[1] = *(id *)&a3;
  objc_copyWeak(v7, &location);
  dispatch_async(internalQueue, v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __73__SpotlightBookmarksDonationWriter__scheduleBookmarksDonationAfterDelay___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
  v2 = (void *)MEMORY[0x1E0D8A8C8];
  v3 = *(double *)(a1 + 48);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__SpotlightBookmarksDonationWriter__scheduleBookmarksDonationAfterDelay___block_invoke_2;
  v8[3] = &unk_1E9CF39C8;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  objc_msgSend(v2, "scheduledTimerWithInterval:repeats:queue:handler:", 0, v4, v8, v3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v5;

  objc_destroyWeak(&v9);
}

void __73__SpotlightBookmarksDonationWriter__scheduleBookmarksDonationAfterDelay___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_donateBookmarksToCoreSpotlight");

}

- (void)_donateBookmarksToCoreSpotlight
{
  id v3;

  -[SpotlightBookmarksDonationWriter _bookmarksToDonate](self, "_bookmarksToDonate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSSiriIntelligenceDonor donateSafariBookmarksToCoreSpotlight:withCompletionHandler:](self->_siriIntelligenceDonor, "donateSafariBookmarksToCoreSpotlight:withCompletionHandler:");

}

- (void)getBookmarksToDonateWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __78__SpotlightBookmarksDonationWriter_getBookmarksToDonateWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E9CF40E8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(internalQueue, v7);

}

void __78__SpotlightBookmarksDonationWriter_getBookmarksToDonateWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_bookmarksToDonate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_bookmarksToDonate
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WebBookmarkCollection listWithID:skipOffset:includeHidden:includeDescendantsAsChildren:filteredUsingString:](self->_bookmarkCollection, "listWithID:skipOffset:includeHidden:includeDescendantsAsChildren:filteredUsingString:", *MEMORY[0x1E0DCCB08], 0, 1, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v4, "bookmarkArraySkippingDecodeSyncData", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isFolder") & 1) == 0)
          -[SpotlightBookmarksDonationWriter _addBookmark:toBookmarksToDonate:](self, "_addBookmark:toBookmarksToDonate:", v9, v3);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (void)_addBookmark:(id)a3 toBookmarksToDonate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0D8AC70]);
  objc_msgSend(v10, "displayTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBookmarkTitle:", v7);

  objc_msgSend(v10, "address");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBookmarkURLString:", v8);

  objc_msgSend(v6, "setIsReadingListItem:", objc_msgSend(v10, "isReadingListItem"));
  objc_msgSend(v10, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUuidString:", v9);

  objc_msgSend(v5, "addObject:", v6);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriIntelligenceDonor, 0);
  objc_storeStrong((id *)&self->_donationTimer, 0);
  objc_storeStrong((id *)&self->_bookmarkCollection, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
