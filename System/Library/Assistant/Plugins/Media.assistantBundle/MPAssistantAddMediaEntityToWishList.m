@implementation MPAssistantAddMediaEntityToWishList

- (void)performWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSString *v6;
  NSString *requestAceHash;
  NSObject *v8;
  NSString *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  NSString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantAddMediaEntityToWishList aceId](self, "aceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Add Media Entity To Wish List"), v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    -[SAMPAddMediaEntityToWishList adamId](self, "adamId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v9;
    v22 = 2114;
    v23 = v10;
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Add Media Entity To Wish List (invoke) <%{public}@>: adam ID %{public}@", buf, 0x16u);

  }
  v11 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = sub_1CC9AD6A8;
  v18[3] = &unk_1E88E3FA0;
  v12 = v4;
  v18[4] = self;
  v19 = v12;
  v13 = (void *)MEMORY[0x1D17B0600](v18);
  -[SAMPAddMediaEntityToWishList adamId](self, "adamId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[SAMPAddMediaEntityToWishList adamId](self, "adamId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPAssistantAddMediaEntityToWishList _addTrackToWishListWithStoreID:completion:](self, "_addTrackToWishListWithStoreID:completion:", objc_msgSend(v15, "longLongValue"), v13);

  }
  else
  {
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = sub_1CC9AD80C;
    v16[3] = &unk_1E88E3FC8;
    v16[4] = self;
    v17 = v13;
    -[MPAssistantAddMediaEntityToWishList _fetchCurrentRadioTrackInfoWithCompletion:](self, "_fetchCurrentRadioTrackInfoWithCompletion:", v16);

  }
}

- (void)_addTrackToWishListWithStoreID:(unint64_t)a3 completion:(id)a4
{
  void (**v5)(id, void *);
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  void (**v13)(id, void *);
  unint64_t v14;

  v5 = (void (**)(id, void *))a4;
  if (a3
    && (objc_msgSend(MEMORY[0x1E0CC2408], "defaultMediaLibrary"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "itemWithStoreID:", a3),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    if (v5)
    {
      v8 = objc_alloc(MEMORY[0x1E0D87FE8]);
      v9 = (void *)objc_msgSend(v8, "initWithErrorCode:", *MEMORY[0x1E0D88DA8]);
      v5[2](v5, v9);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = sub_1CC9AD2BC;
    v12[3] = &unk_1E88E4040;
    v13 = v5;
    v14 = a3;
    objc_msgSend(v10, "getPropertiesForUserIdentity:completionHandler:", v11, v12);

  }
}

- (void)_addRadioTrackToWishListWithStoreID:(unint64_t)a3 stationHash:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if (!a3
    || (objc_msgSend(MEMORY[0x1E0CC2408], "defaultMediaLibrary"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "itemWithStoreID:", a3),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v9,
        !v10))
  {
    v20[0] = *MEMORY[0x1E0D4CD28];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = *MEMORY[0x1E0D4CCC0];
    v21[0] = v13;
    v21[1] = CFSTR("com.apple.MediaAssistant.siri");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D4B338], "systemMediaApplicationDestination");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(MEMORY[0x1E0D4B2F8]);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = sub_1CC9AD230;
    v17[3] = &unk_1E88E4068;
    v18 = v15;
    v19 = v8;
    v16 = v15;
    objc_msgSend(v16, "sendCommand:toDestination:withOptions:completion:", 23, v14, v12, v17);

    goto LABEL_6;
  }
  if (v8)
  {
    v11 = objc_alloc(MEMORY[0x1E0D87FE8]);
    v12 = (void *)objc_msgSend(v11, "initWithErrorCode:", *MEMORY[0x1E0D88DA8]);
    (*((void (**)(id, void *))v8 + 2))(v8, v12);
LABEL_6:

  }
}

- (void)_fetchCurrentRadioTrackInfoWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  dispatch_get_global_queue(0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  v5 = v3;
  MRMediaRemoteGetNowPlayingInfo();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

@end
