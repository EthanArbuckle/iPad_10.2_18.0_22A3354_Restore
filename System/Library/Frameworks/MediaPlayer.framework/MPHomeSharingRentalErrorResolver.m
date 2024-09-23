@implementation MPHomeSharingRentalErrorResolver

- (MPHomeSharingRentalErrorResolver)initWithItemID:(unint64_t)a3 homeSharingID:(unint64_t)a4 rentalID:(unint64_t)a5 accountID:(unint64_t)a6
{
  MPHomeSharingRentalErrorResolver *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MPHomeSharingRentalErrorResolver;
  result = -[MPHomeSharingRentalErrorResolver init](&v11, sel_init);
  if (result)
  {
    result->_itemID = a3;
    result->_homeSharingID = a4;
    result->_rentalID = a5;
    result->_accountID = a6;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[SSRentalCheckoutRequest cancel](self->_request, "cancel");
  -[SSRentalCheckoutRequest setDelegate:](self->_request, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MPHomeSharingRentalErrorResolver;
  -[MPHomeSharingRentalErrorResolver dealloc](&v3, sel_dealloc);
}

- (void)resolveError:(id)a3
{
  id v5;
  NSObject *v6;
  unint64_t itemID;
  unint64_t homeSharingID;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  unint64_t v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[MPHomeSharingRentalErrorResolver _errorIsFairPlayError:](self, "_errorIsFairPlayError:", v5))
  {
    objc_storeStrong((id *)&self->_error, a3);
    v6 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      itemID = self->_itemID;
      homeSharingID = self->_homeSharingID;
      *(_DWORD *)buf = 134218240;
      v13 = itemID;
      v14 = 2048;
      v15 = homeSharingID;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalErrorResolver] Checking in rental on iTunes side with item ID: %llu homesharing ID: %llu", buf, 0x16u);
    }

    -[MPHomeSharingML3DataProvider homeSharingLibrary](self->_dataProvider, "homeSharingLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D335B0], "requestWithDatabaseID:itemID:", objc_msgSend(v9, "databaseID"), self->_homeSharingID);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __49__MPHomeSharingRentalErrorResolver_resolveError___block_invoke;
    v11[3] = &unk_1E315CA70;
    v11[4] = self;
    objc_msgSend(v9, "sendRequest:withResponseHandler:", v10, v11);

  }
  else
  {
    -[MPAVErrorResolver sendDidResolveError:withResolution:](self, "sendDidResolveError:withResolution:", v5, 0);
  }

}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  SSRentalCheckoutRequest *request;
  NSObject *v8;
  unint64_t itemID;
  unint64_t homeSharingID;
  void *v11;
  void *v12;
  NSError *error;
  int v14;
  unint64_t v15;
  __int16 v16;
  unint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543362;
    v15 = (unint64_t)v5;
    _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalErrorResolver] Rental checkout failed: %{public}@", (uint8_t *)&v14, 0xCu);
  }

  -[SSRentalCheckoutRequest setDelegate:](self->_request, "setDelegate:", 0);
  request = self->_request;
  self->_request = 0;

  v8 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    itemID = self->_itemID;
    homeSharingID = self->_homeSharingID;
    v14 = 134218240;
    v15 = itemID;
    v16 = 2048;
    v17 = homeSharingID;
    _os_log_impl(&dword_193B9B000, v8, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalErrorResolver] Checking out rental on iTunes side after failure with item ID: %llu homesharing ID: %llu", (uint8_t *)&v14, 0x16u);
  }

  -[MPHomeSharingML3DataProvider homeSharingLibrary](self->_dataProvider, "homeSharingLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D335B8], "requestWithDatabaseID:itemID:", objc_msgSend(v11, "databaseID"), self->_homeSharingID);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendRequest:withResponseHandler:", v12, &__block_literal_global_33019);
  -[MPAVErrorResolver sendDidResolveError:withResolution:](self, "sendDidResolveError:withResolution:", self->_error, 0);
  error = self->_error;
  self->_error = 0;

}

- (void)requestDidFinish:(id)a3
{
  NSObject *v4;
  SSRentalCheckoutRequest *request;
  void *v6;
  unint64_t itemID;
  void *v8;
  void *v9;
  void *v10;
  NSError *error;
  uint8_t v12[16];

  v4 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalErrorResolver] Rental checkout finished", v12, 2u);
  }

  -[SSRentalCheckoutRequest setDelegate:](self->_request, "setDelegate:", 0);
  request = self->_request;
  self->_request = 0;

  +[MPHomeSharingRentalTracker sharedInstance](MPHomeSharingRentalTracker, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  itemID = self->_itemID;
  -[MPHomeSharingML3DataProvider uniqueIdentifier](self->_dataProvider, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addRentalWithItemID:databaseID:", itemID, v8);

  -[MPHomeSharingML3DataProvider setRentalPlaybackStartDateForItemID:](self->_dataProvider, "setRentalPlaybackStartDateForItemID:", self->_itemID);
  -[MPHomeSharingML3DataProvider homeSharingLibrary](self->_dataProvider, "homeSharingLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D335E0], "requestWithDatabaseID:itemID:", objc_msgSend(v9, "databaseID"), self->_homeSharingID);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendRequest:withResponseHandler:", v10, &__block_literal_global_7_33013);
  -[MPAVErrorResolver sendDidResolveError:withResolution:](self, "sendDidResolveError:withResolution:", self->_error, 2);
  error = self->_error;
  self->_error = 0;

}

- (BOOL)_errorIsFairPlayError:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  int v8;
  void *v10;

  v3 = a3;
  v4 = objc_msgSend(v3, "code");
  v5 = v4 + 49999;
  v6 = v4 + 12169;
  if (v4 == -11835)
  {
    objc_msgSend(v3, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0C8A2F8]);

  }
  else
  {
    v8 = 0;
  }
  if (v5 >> 6 < 0x7D || v6 <= 0x13)
  {
    objc_msgSend(v3, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 |= objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB2F90]);

  }
  return v8;
}

- (MPHomeSharingML3DataProvider)dataProvider
{
  return self->_dataProvider;
}

- (void)setDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_dataProvider, a3);
}

- (unint64_t)itemID
{
  return self->_itemID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
}

void __53__MPHomeSharingRentalErrorResolver_requestDidFinish___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalErrorResolver] iTunes set rental playback start date response: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __61__MPHomeSharingRentalErrorResolver_request_didFailWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_193B9B000, v3, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalErrorResolver] iTunes rental checkout response: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __49__MPHomeSharingRentalErrorResolver_resolveError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  unint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE buf[24];
  void *v28;
  uint64_t *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v3;
    _os_log_impl(&dword_193B9B000, v4, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalErrorResolver] iTunes rental check-in response: %{public}@", buf, 0xCu);
  }

  v5 = objc_msgSend(v3, "responseCode");
  v6 = os_log_create("com.apple.amp.mediaplayer", "HomeSharing");
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 > 0x12B)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalErrorResolver] iTunes rental check-in failed", buf, 2u);
    }

    v21 = *(_QWORD **)(a1 + 32);
    v20 = a1 + 32;
    objc_msgSend(v21, "sendDidResolveError:withResolution:", v21[4], 0);
    v22 = *(void **)(*(_QWORD *)v20 + 32);
    *(_QWORD *)(*(_QWORD *)v20 + 32) = 0;

  }
  else
  {
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(v8 + 56);
      v10 = *(_QWORD *)(v8 + 16);
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v9;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v10;
      _os_log_impl(&dword_193B9B000, v6, OS_LOG_TYPE_DEFAULT, "[MPHomeSharingRentalErrorResolver] Checking out rental for rental ID: %llu, account ID: %llu", buf, 0x16u);
    }

    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v11 = (void *)getSSRentalCheckoutRequestClass_softClass;
    v26 = getSSRentalCheckoutRequestClass_softClass;
    if (!getSSRentalCheckoutRequestClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getSSRentalCheckoutRequestClass_block_invoke;
      v28 = &unk_1E31639A0;
      v29 = &v23;
      __getSSRentalCheckoutRequestClass_block_invoke((uint64_t)buf);
      v11 = (void *)v24[3];
    }
    v12 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v23, 8);
    v13 = [v12 alloc];
    v15 = *(_QWORD *)(a1 + 32);
    v14 = a1 + 32;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v15 + 16), v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)v14 + 56));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v13, "initWithAccountIdentifier:rentalKeyIdentifier:", v16, v17);
    v19 = *(void **)(*(_QWORD *)v14 + 64);
    *(_QWORD *)(*(_QWORD *)v14 + 64) = v18;

    objc_msgSend(*(id *)(*(_QWORD *)v14 + 64), "setDelegate:");
    objc_msgSend(*(id *)(*(_QWORD *)v14 + 64), "start");
  }

}

@end
