@implementation MPHomeSharingRentalTracker

- (id)_init
{
  MPHomeSharingRentalTracker *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *rentalTrackerQueue;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *rentals;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)MPHomeSharingRentalTracker;
  v2 = -[MPHomeSharingRentalTracker init](&v15, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.mobileipod.home-sharing-rental-tracker", 0);
    rentalTrackerQueue = v2->_rentalTrackerQueue;
    v2->_rentalTrackerQueue = (OS_dispatch_queue *)v3;

    v5 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Media/HomeSharingRentals.plist"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v6;
      _os_log_impl(&dword_193B9B000, v5, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalTracker] Loading rentals from %{public}@", buf, 0xCu);

    }
    v7 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Media/HomeSharingRentals.plist"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithContentsOfFile:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    rentals = v2->_rentals;
    v2->_rentals = v12;

  }
  return v2;
}

- (void)addRentalWithItemID:(unint64_t)a3 databaseID:(id)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *rentalTrackerQueue;
  id v11;
  void *v12;
  _QWORD block[4];
  id v14;
  MPHomeSharingRentalTracker *v15;
  unint64_t v16;
  uint8_t buf[4];
  unint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  if (!a3 || !v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPHomeSharingRentalTracker.m"), 62, CFSTR("attempted to add rental with item ID: %llu, databaseID: %@"), a3, v8);

  }
  v9 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v18 = a3;
    v19 = 2114;
    v20 = v8;
    _os_log_impl(&dword_193B9B000, v9, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalTracker] Adding rental with item ID: %llu, database ID: %{public}@", buf, 0x16u);
  }

  rentalTrackerQueue = self->_rentalTrackerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MPHomeSharingRentalTracker_addRentalWithItemID_databaseID___block_invoke;
  block[3] = &unk_1E3162690;
  v14 = v8;
  v15 = self;
  v16 = a3;
  v11 = v8;
  dispatch_sync(rentalTrackerQueue, block);

}

- (void)removeRentalWithItemID:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  NSObject *rentalTrackerQueue;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  MPHomeSharingRentalTracker *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD block[5];
  id v35;
  __int128 *p_buf;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint8_t v42[128];
  __int128 buf;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPHomeSharingRentalTracker.m"), 75, CFSTR("attempted to remove rental with no item ID"));

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalTracker] Removing rental with item ID: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__32073;
  v46 = __Block_byref_object_dispose__32074;
  v47 = 0;
  rentalTrackerQueue = self->_rentalTrackerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__MPHomeSharingRentalTracker_removeRentalWithItemID___block_invoke;
  block[3] = &unk_1E31635A8;
  p_buf = &buf;
  block[4] = self;
  v24 = v5;
  v35 = v24;
  dispatch_sync(rentalTrackerQueue, block);
  v8 = *(void **)(*((_QWORD *)&buf + 1) + 40);
  if (v8)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("databaseID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    +[MPMediaLibrary mediaLibraries](MPMediaLibrary, "mediaLibraries");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v31;
LABEL_8:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v13);
        objc_msgSend(v14, "uniqueIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqual:", v9);

        if (v16)
          break;
        if (v11 == (void *)++v13)
        {
          v11 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
          if (v11)
            goto LABEL_8;
          goto LABEL_14;
        }
      }
      objc_msgSend(v14, "itemWithPersistentID:", a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "libraryDataProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
        goto LABEL_23;
      objc_msgSend(v17, "valueForProperty:", CFSTR("storeAccountID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "valueForProperty:", CFSTR("storeRentalID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "unsignedLongLongValue") && objc_msgSend(v18, "unsignedLongLongValue"))
      {
        v38 = 0;
        v39 = &v38;
        v40 = 0x2050000000;
        v19 = (void *)getSSRentalCheckinRequestClass_softClass;
        v41 = getSSRentalCheckinRequestClass_softClass;
        if (!getSSRentalCheckinRequestClass_softClass)
        {
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __getSSRentalCheckinRequestClass_block_invoke;
          v37[3] = &unk_1E31639A0;
          v37[4] = &v38;
          __getSSRentalCheckinRequestClass_block_invoke((uint64_t)v37);
          v19 = (void *)v39[3];
        }
        v20 = objc_retainAutorelease(v19);
        _Block_object_dispose(&v38, 8);
        v21 = (void *)objc_msgSend([v20 alloc], "initWithAccountIdentifier:rentalKeyIdentifier:", v10, v18);
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __53__MPHomeSharingRentalTracker_removeRentalWithItemID___block_invoke_2;
        v25[3] = &unk_1E31636C0;
        v26 = v11;
        v27 = v17;
        v28 = self;
        v29 = v24;
        objc_msgSend(v21, "startWithCompletionBlock:", v25);

      }
    }
    else
    {
LABEL_14:
      v17 = 0;
    }

LABEL_23:
  }

  _Block_object_dispose(&buf, 8);
}

- (void)removeAllRentalsForDatabaseID:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *rentalTrackerQueue;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD block[6];
  uint8_t v20[128];
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalTracker] Removing all rentals for database ID: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__32073;
  v24 = __Block_byref_object_dispose__32074;
  v25 = 0;
  rentalTrackerQueue = self->_rentalTrackerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__MPHomeSharingRentalTracker_removeAllRentalsForDatabaseID___block_invoke;
  block[3] = &unk_1E3163580;
  block[4] = self;
  block[5] = &buf;
  dispatch_sync(rentalTrackerQueue, block);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", CFSTR("databaseID"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v3);

        if (v13)
          -[MPHomeSharingRentalTracker removeRentalWithItemID:](self, "removeRentalWithItemID:", objc_msgSend(v10, "longLongValue"));
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v7);
  }

  _Block_object_dispose(&buf, 8);
}

- (void)_saveRentals
{
  NSObject *v3;
  void *v4;
  NSMutableDictionary *rentals;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Media/HomeSharingRentals.plist"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v4;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalTracker] Saving rentals to %{public}@", (uint8_t *)&v7, 0xCu);

  }
  rentals = self->_rentals;
  objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Media/HomeSharingRentals.plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary writeToFile:atomically:](rentals, "writeToFile:atomically:", v6, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rentals, 0);
  objc_storeStrong((id *)&self->_rentalTrackerQueue, 0);
}

void __60__MPHomeSharingRentalTracker_removeAllRentalsForDatabaseID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __53__MPHomeSharingRentalTracker_removeRentalWithItemID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __53__MPHomeSharingRentalTracker_removeRentalWithItemID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];
  _QWORD v8[5];
  id v9;

  if (a2)
  {
    v2 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_ERROR, "Failed to checkin rental to iTunes Store.", v7, 2u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "homeSharingLibrary");
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "valueForProperty:", CFSTR("homeSharingID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D335B8], "requestWithDatabaseID:itemID:", -[NSObject databaseID](v2, "databaseID"), objc_msgSend(v4, "unsignedLongLongValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__MPHomeSharingRentalTracker_removeRentalWithItemID___block_invoke_3;
    v8[3] = &unk_1E315C770;
    v6 = *(void **)(a1 + 56);
    v8[4] = *(_QWORD *)(a1 + 48);
    v9 = v6;
    -[NSObject sendRequest:withResponseHandler:](v2, "sendRequest:withResponseHandler:", v5, v8);

  }
}

void __53__MPHomeSharingRentalTracker_removeRentalWithItemID___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = (uint64_t)v3;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalTracker] iTunes rental checkout response: %{public}@", buf, 0xCu);
  }

  if ((unint64_t)objc_msgSend(v3, "responseCode") > 0x12B)
  {
    v8 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(v3, "responseCode");
      *(_DWORD *)buf = 134217984;
      v13 = v9;
      _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_ERROR, "Failed iTunes side checkout request (response code = %lu)", buf, 0xCu);
    }

  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v7 = *(NSObject **)(v5 + 8);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__MPHomeSharingRentalTracker_removeRentalWithItemID___block_invoke_19;
    v10[3] = &unk_1E31635F8;
    v10[4] = v5;
    v11 = v6;
    dispatch_sync(v7, v10);

  }
}

uint64_t __53__MPHomeSharingRentalTracker_removeRentalWithItemID___block_invoke_19(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_saveRentals");
}

void __61__MPHomeSharingRentalTracker_addRentalWithItemID_databaseID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v6 = CFSTR("databaseID");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v3, v5);

  objc_msgSend(*(id *)(a1 + 40), "_saveRentals");
}

+ (id)sharedInstance
{
  if (sharedInstance___once != -1)
    dispatch_once(&sharedInstance___once, &__block_literal_global_32108);
  return (id)sharedInstance___sharedInstance;
}

void __44__MPHomeSharingRentalTracker_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[MPHomeSharingRentalTracker _init]([MPHomeSharingRentalTracker alloc], "_init");
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

@end
