@implementation MPAssistantSetQueue

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  id v6;
  AFServiceHelper *v7;
  MPCAssistantAvailability *v8;
  MPCAssistantAvailability *availability;
  void *v10;
  NSString *v11;
  NSString *requestAceHash;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  AFServiceHelper *v16;
  _BOOL4 v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  NSString *v21;
  void *v22;
  AFServiceHelper *serviceHelper;
  AFServiceHelper *v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  NSString *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD block[5];
  id v34;
  uint8_t buf[4];
  NSString *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  _BOOL4 v40;
  __int16 v41;
  _BOOL4 v42;
  __int16 v43;
  _BOOL4 v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (AFServiceHelper *)a4;
  v8 = (MPCAssistantAvailability *)objc_alloc_init(MEMORY[0x1E0D4B2F0]);
  availability = self->_availability;
  self->_availability = v8;

  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantSetQueue aceId](self, "aceId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Set Queue"), v10);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v11;

  }
  _MPLogCategoryAssistant();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v29 = self->_requestAceHash;
    -[MPAssistantSetQueue hashedRouteUIDs](self, "hashedRouteUIDs");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v31, "count");
    -[MPAssistantSetQueue assetInfo](self, "assetInfo");
    v32 = v6;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v30, "length") != 0;
    -[MPAssistantSetQueue requesterSharedUserId](self, "requesterSharedUserId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v7;
    v17 = objc_msgSend(v15, "length") != 0;
    -[MPAssistantSetQueue sharedUserIdFromPlayableMusicAccount](self, "sharedUserIdFromPlayableMusicAccount");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length") != 0;
    -[MPAssistantSetQueue startPlaying](self, "startPlaying");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544642;
    v36 = v29;
    v37 = 2048;
    v38 = v28;
    v39 = 1024;
    v40 = v14;
    v41 = 1024;
    v42 = v17;
    v7 = v16;
    v43 = 1024;
    v44 = v19;
    v45 = 2114;
    v46 = v20;
    _os_log_impl(&dword_1CC97B000, v13, OS_LOG_TYPE_DEFAULT, "Set Queue (invoke) <%{public}@>: %lu UIDs, asset info present %{BOOL}u, requester shared user id present %{BOOL}u, playable music account shared user id present %{BOOL}u, start %{public}@", buf, 0x32u);

    v6 = v32;
  }

  v21 = self->_requestAceHash;
  -[MPAssistantSetQueue hashedRouteUIDs](self, "hashedRouteUIDs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1CC994B48(CFSTR("Set Queue"), v21, v22);

  serviceHelper = self->_serviceHelper;
  self->_serviceHelper = v7;
  v24 = v7;

  sub_1CC995B9C();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = dispatch_queue_create("com.apple.mediaPlayer.assistant.setQueue", 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1CC98EEA8;
  block[3] = &unk_1E88E3AC8;
  block[4] = self;
  v34 = v6;
  v27 = v6;
  dispatch_group_notify(v25, v26, block);

}

- (void)_performWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  NSObject *v12;
  NSString *v13;
  int v14;
  const __CFString *v15;
  void *v16;
  NSString *v17;
  NSString *requestAceHash;
  NSObject *v19;
  NSString *v20;
  int v21;
  const __CFString *v22;
  const char *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSString *v28;
  NSString *v29;
  NSObject *v30;
  NSString *v31;
  int v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSString *v38;
  NSString *v39;
  NSObject *v40;
  NSString *v41;
  int v42;
  const __CFString *v43;
  uint64_t v44;
  void *v45;
  NSString *v46;
  NSString *v47;
  NSString *v48;
  int v49;
  const __CFString *v50;
  void *v51;
  NSString *v52;
  NSString *v53;
  NSObject *v54;
  NSString *v55;
  int v56;
  const __CFString *v57;
  _QWORD v58[5];
  id v59;
  void (**v60)(id, void *);
  uint8_t buf[4];
  NSString *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  const __CFString *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[MPAssistantSetQueue mediaItems](self, "mediaItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "scheme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantSetQueue aceId](self, "aceId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Queue"), v16);
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      requestAceHash = self->_requestAceHash;
      self->_requestAceHash = v17;

    }
    _MPLogCategoryAssistant();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v20 = self->_requestAceHash;
    v21 = -[MPAssistantSetQueue dryRun](self, "dryRun");
    v22 = &stru_1E88E41D0;
    *(_DWORD *)buf = 138543874;
    v62 = v20;
    v63 = 2114;
    if (v21)
      v22 = CFSTR(" ⚠️ DRY RUN");
    v64 = v6;
    v65 = 2114;
    v66 = v22;
    v23 = "Set Queue (invalid) <%{public}@>: invoke with identifier %{public}@%{public}@";
    goto LABEL_16;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("x-sampradio")))
  {
    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantSetQueue aceId](self, "aceId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Queue"), v9);
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      v11 = self->_requestAceHash;
      self->_requestAceHash = v10;

    }
    _MPLogCategoryAssistant();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_requestAceHash;
      v14 = -[MPAssistantSetQueue dryRun](self, "dryRun");
      v15 = &stru_1E88E41D0;
      *(_DWORD *)buf = 138543874;
      v62 = v13;
      v63 = 2114;
      if (v14)
        v15 = CFSTR(" ⚠️ DRY RUN");
      v64 = v6;
      v65 = 2114;
      v66 = v15;
      _os_log_impl(&dword_1CC97B000, v12, OS_LOG_TYPE_DEFAULT, "Set Queue (radio) <%{public}@>: invoke with identifier %{public}@%{public}@", buf, 0x20u);
    }

    -[MPAssistantSetQueue _performRadioStationSetQueueAsDryRun:completion:](self, "_performRadioStationSetQueueAsDryRun:completion:", -[MPAssistantSetQueue dryRun](self, "dryRun"), v4);
    goto LABEL_51;
  }
  v26 = sub_1CC9834E0(v6);
  if (v26 == 4)
    goto LABEL_21;
  if (v26 != 3)
  {
    if (v26 == 1)
    {
LABEL_21:
      if (!-[NSString length](self->_requestAceHash, "length"))
      {
        -[MPAssistantSetQueue aceId](self, "aceId");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Set Queue"), v27);
        v28 = (NSString *)objc_claimAutoreleasedReturnValue();
        v29 = self->_requestAceHash;
        self->_requestAceHash = v28;

      }
      _MPLogCategoryAssistant();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = self->_requestAceHash;
        v32 = -[MPAssistantSetQueue dryRun](self, "dryRun");
        v33 = &stru_1E88E41D0;
        *(_DWORD *)buf = 138543874;
        v62 = v31;
        v63 = 2114;
        if (v32)
          v33 = CFSTR(" ⚠️ DRY RUN");
        v64 = v6;
        v65 = 2114;
        v66 = v33;
        _os_log_impl(&dword_1CC97B000, v30, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: invoke with identifier %{public}@%{public}@", buf, 0x20u);
      }

      -[MPAssistantSetQueue _performMediaItemsSetQueueAsDryRun:completion:](self, "_performMediaItemsSetQueueAsDryRun:completion:", -[MPAssistantSetQueue dryRun](self, "dryRun"), v4);
      goto LABEL_51;
    }
    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantSetQueue aceId](self, "aceId");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Queue"), v45);
      v46 = (NSString *)objc_claimAutoreleasedReturnValue();
      v47 = self->_requestAceHash;
      self->_requestAceHash = v46;

    }
    _MPLogCategoryAssistant();
    v19 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      v24 = objc_alloc(MEMORY[0x1E0D87FE8]);
      v25 = (void *)objc_msgSend(v24, "initWithErrorCode:", *MEMORY[0x1E0D88DF8]);
      v4[2](v4, v25);

      goto LABEL_51;
    }
    v48 = self->_requestAceHash;
    v49 = -[MPAssistantSetQueue dryRun](self, "dryRun");
    v50 = &stru_1E88E41D0;
    *(_DWORD *)buf = 138543874;
    v62 = v48;
    v63 = 2114;
    if (v49)
      v50 = CFSTR(" ⚠️ DRY RUN");
    v64 = v6;
    v65 = 2114;
    v66 = v50;
    v23 = "Set Queue (invalid) <%{public}@>: invoke with invalid origin identifier %{public}@%{public}@";
LABEL_16:
    _os_log_impl(&dword_1CC97B000, v19, OS_LOG_TYPE_ERROR, v23, buf, 0x20u);
    goto LABEL_17;
  }
  -[MPAssistantSetQueue sharedUserIdFromPlayableMusicAccount](self, "sharedUserIdFromPlayableMusicAccount");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "length"))
  {
    -[MPAssistantSetQueue assetInfo](self, "assetInfo");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "length");

    if (!v36)
    {
      if (!-[NSString length](self->_requestAceHash, "length"))
      {
        -[MPAssistantSetQueue aceId](self, "aceId");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Set Queue"), v37);
        v38 = (NSString *)objc_claimAutoreleasedReturnValue();
        v39 = self->_requestAceHash;
        self->_requestAceHash = v38;

      }
      _MPLogCategoryAssistant();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = self->_requestAceHash;
        v42 = -[MPAssistantSetQueue dryRun](self, "dryRun");
        v43 = &stru_1E88E41D0;
        *(_DWORD *)buf = 138543874;
        v62 = v41;
        v63 = 2114;
        if (v42)
          v43 = CFSTR(" ⚠️ DRY RUN");
        v64 = v6;
        v65 = 2114;
        v66 = v43;
        _os_log_impl(&dword_1CC97B000, v40, OS_LOG_TYPE_DEFAULT, "Set Queue (localstore) <%{public}@>: invoke with identifier %{public}@%{public}@", buf, 0x20u);
      }

      v44 = -[MPAssistantSetQueue dryRun](self, "dryRun");
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = sub_1CC98ED20;
      v58[3] = &unk_1E88E2B78;
      v58[4] = self;
      v59 = v6;
      v60 = v4;
      -[MPAssistantSetQueue _performMediaItemsSetQueueFromStoreIdentifiersAsDryRun:onlyPlayableItems:onlyLocalItems:completion:](self, "_performMediaItemsSetQueueFromStoreIdentifiersAsDryRun:onlyPlayableItems:onlyLocalItems:completion:", v44, 1, 0, v58);

      goto LABEL_51;
    }
  }
  else
  {

  }
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantSetQueue aceId](self, "aceId");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Set Queue"), v51);
    v52 = (NSString *)objc_claimAutoreleasedReturnValue();
    v53 = self->_requestAceHash;
    self->_requestAceHash = v52;

  }
  _MPLogCategoryAssistant();
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    v55 = self->_requestAceHash;
    v56 = -[MPAssistantSetQueue dryRun](self, "dryRun");
    v57 = &stru_1E88E41D0;
    *(_DWORD *)buf = 138543874;
    v62 = v55;
    v63 = 2114;
    if (v56)
      v57 = CFSTR(" ⚠️ DRY RUN");
    v64 = v6;
    v65 = 2114;
    v66 = v57;
    _os_log_impl(&dword_1CC97B000, v54, OS_LOG_TYPE_DEFAULT, "Set Queue (store) <%{public}@>: invoke with identifier %{public}@%{public}@", buf, 0x20u);
  }

  -[MPAssistantSetQueue _performStoreItemsSetQueueAsDryRun:completion:](self, "_performStoreItemsSetQueueAsDryRun:completion:", -[MPAssistantSetQueue dryRun](self, "dryRun"), v4);
LABEL_51:

}

- (void)_performRadioStationSetQueueAsDryRun:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[7];
  BOOL v12;

  v6 = a4;
  -[MPAssistantSetQueue mediaItems](self, "mediaItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1CC98E4B8;
  v11[3] = &unk_1E88E2BF0;
  v11[5] = v8;
  v11[6] = v6;
  v11[4] = self;
  v12 = a3;
  v9 = v8;
  v10 = v6;
  sub_1CC98E4B8((uint64_t)v11, 0);

}

- (void)_performMediaItemsSetQueueAsDryRun:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  void (**v27)(_QWORD);
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  MPAssistantSetQueue *v33;
  id v34;
  id v35;
  BOOL v36;

  v4 = a3;
  v6 = a4;
  -[MPAssistantSetQueue mediaItems](self, "mediaItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAssistantSetQueue refId](self, "refId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "MPMediaItemQueryOnlyPlayableItems:withUserIdentity:plugin:hash:", 1, self->_userIdentity, CFSTR("Set Queue"), self->_requestAceHash);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "_countOfItems"))
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = sub_1CC98E384;
    v29[3] = &unk_1E88E2C18;
    v24 = v9;
    v30 = v24;
    v10 = v25;
    v31 = v10;
    v32 = v7;
    v33 = self;
    v11 = v8;
    v34 = v11;
    v36 = v4;
    v12 = v6;
    v35 = v12;
    v13 = (void (**)(_QWORD))MEMORY[0x1D17B0600](v29);
    objc_msgSend(v10, "scheme");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isEqualToString:", CFSTR("x-sampmeditem")) & 1) != 0)
    {
      v22 = v12;
      v23 = v4;
      objc_msgSend(v24, "items");
      v15 = v6;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      v6 = v15;
      if (v17 == 1)
      {
        objc_msgSend(v24, "collections");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = sub_1CC98E49C;
        v26[3] = &unk_1E88E2C40;
        v27 = v13;
        v28 = v22;
        -[MPAssistantSetQueue _playAlbumFromMediaItems:contextID:dryRun:completion:](self, "_playAlbumFromMediaItems:contextID:dryRun:completion:", v19, v11, v23, v26);

LABEL_8:
        goto LABEL_9;
      }
    }
    else
    {

    }
    v13[2](v13);
    goto LABEL_8;
  }
  v20 = objc_alloc(MEMORY[0x1E0D87FE8]);
  v21 = (void *)objc_msgSend(v20, "initWithErrorCode:", *MEMORY[0x1E0D88E00]);
  (*((void (**)(id, void *))v6 + 2))(v6, v21);

LABEL_9:
}

- (void)_performStoreItemsSetQueueAsDryRun:(BOOL)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[7];
  BOOL v11;

  v6 = a4;
  -[MPAssistantSetQueue mediaItems](self, "mediaItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1CC98D4C4;
  v10[3] = &unk_1E88E2BF0;
  v10[5] = v7;
  v10[6] = v6;
  v10[4] = self;
  v11 = a3;
  v8 = v7;
  v9 = v6;
  sub_1CC98D4C4((uint64_t)v10, 0);

}

- (void)_performMediaItemsSetQueueFromStoreIdentifiersAsDryRun:(BOOL)a3 onlyPlayableItems:(BOOL)a4 onlyLocalItems:(BOOL)a5 completion:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  NSString *requestAceHash;
  NSObject *v16;
  NSString *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  NSString *v31;
  NSString *v32;
  NSString *v33;
  uint64_t *v34;
  NSObject *v35;
  void (**v36)(void);
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  NSString *v52;
  NSString *v53;
  NSObject *v54;
  NSString *v55;
  NSObject *v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  NSString *v69;
  void *v70;
  NSString *v71;
  NSString *v72;
  NSObject *v73;
  NSString *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  BOOL v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  id v88;
  void *v89;
  NSString *v90;
  NSString *v91;
  NSObject *v92;
  NSString *v93;
  void *v94;
  void *v95;
  NSString *v96;
  NSString *v97;
  NSObject *v98;
  NSString *v99;
  id v100;
  void *v101;
  NSString *v102;
  NSString *v103;
  NSObject *v104;
  NSString *v105;
  void *v106;
  uint64_t v107;
  id v108;
  void *v109;
  void *v110;
  NSString *v111;
  NSString *v112;
  NSObject *v113;
  NSString *v114;
  NSObject *v115;
  void *v116;
  NSString *v117;
  NSString *v118;
  NSObject *v119;
  NSString *v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  _BOOL4 v127;
  int v128;
  uint64_t v129;
  id v130;
  _BOOL4 v131;
  id v132;
  void (**v133)(void);
  _BOOL4 v134;
  void *v135;
  id v136;
  void *v137;
  uint64_t j;
  NSObject *obj;
  _QWORD v140[4];
  void (**v141)(void);
  id v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  _QWORD v155[5];
  id v156;
  id v157;
  uint64_t *v158;
  BOOL v159;
  uint64_t v160;
  id *v161;
  uint64_t v162;
  uint64_t (*v163)(uint64_t, uint64_t);
  void (*v164)(uint64_t);
  id v165;
  _BYTE v166[128];
  _QWORD v167[2];
  _QWORD v168[2];
  _BYTE v169[128];
  uint8_t v170[128];
  uint8_t buf[4];
  NSString *v172;
  __int16 v173;
  NSObject *v174;
  uint64_t v175;

  v134 = a5;
  v127 = a4;
  v131 = a3;
  v175 = *MEMORY[0x1E0C80C00];
  v7 = a6;
  -[MPAssistantSetQueue mediaItems](self, "mediaItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v137 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPAssistantSetQueue refId](self, "refId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = 0;
  v161 = (id *)&v160;
  v162 = 0x3032000000;
  v163 = sub_1CC98D2B0;
  v164 = sub_1CC98D2C0;
  v165 = 0;
  v155[0] = MEMORY[0x1E0C809B0];
  v155[1] = 3221225472;
  v155[2] = sub_1CC98D2C8;
  v155[3] = &unk_1E88E2C90;
  v158 = &v160;
  v155[4] = self;
  v132 = v7;
  v157 = v132;
  v130 = v9;
  v156 = v130;
  v159 = v131;
  v133 = (void (**)(void))MEMORY[0x1D17B0600](v155);
  objc_msgSend(v137, "scheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v10, "isEqualToString:", CFSTR("x-sampplaylist"));

  if ((_DWORD)v9)
  {
    objc_msgSend(MEMORY[0x1E0CC2438], "playlistsQuery");
    obj = objc_claimAutoreleasedReturnValue();
    if (self->_userIdentity)
    {
      objc_msgSend(MEMORY[0x1E0CC2408], "deviceMediaLibraryWithUserIdentity:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setMediaLibrary:](obj, "setMediaLibrary:", v11);

    }
    objc_msgSend(v137, "lastPathComponent");
    v136 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v136, "length"))
    {
      v81 = objc_alloc(MEMORY[0x1E0D87FE8]);
      v16 = objc_msgSend(v81, "initWithErrorCode:", *MEMORY[0x1E0D88E08]);
      (*((void (**)(id, uint64_t, NSObject *))v132 + 2))(v132, 1, v16);
      goto LABEL_90;
    }
    objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", v136, *MEMORY[0x1E0CC2008]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addFilterPredicate:](obj, "addFilterPredicate:", v12);

    objc_storeStrong(v161 + 5, obj);
    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantSetQueue aceId](self, "aceId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Queue"), v13);
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      requestAceHash = self->_requestAceHash;
      self->_requestAceHash = v14;

    }
    _MPLogCategoryAssistant();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_requestAceHash;
      -[NSObject collections](obj, "collections");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v19 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v172 = v17;
      v173 = 2114;
      v174 = v19;
      _os_log_impl(&dword_1CC97B000, v16, OS_LOG_TYPE_DEFAULT, "Set Queue (store) <%{public}@>: playlist %{public}@", buf, 0x16u);

    }
    goto LABEL_99;
  }
  objc_msgSend(v137, "scheme");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("x-sampmeditem"));

  if (!v21)
  {
    objc_msgSend(v137, "scheme");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "isEqualToString:", CFSTR("x-sampcollection-album"));

    if (!v58)
    {
LABEL_100:
      v133[2]();
      goto LABEL_101;
    }
    v59 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v137, "lastPathComponent");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "numberWithLongLong:", objc_msgSend(v60, "longLongValue"));
    obj = objc_claimAutoreleasedReturnValue();

    if (!-[NSObject longLongValue](obj, "longLongValue"))
    {
      if (!-[NSString length](self->_requestAceHash, "length"))
      {
        -[MPAssistantSetQueue aceId](self, "aceId");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Set Queue"), v95);
        v96 = (NSString *)objc_claimAutoreleasedReturnValue();
        v97 = self->_requestAceHash;
        self->_requestAceHash = v96;

      }
      _MPLogCategoryAssistant();
      v98 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
      {
        v99 = self->_requestAceHash;
        *(_DWORD *)buf = 138543362;
        v172 = v99;
        _os_log_impl(&dword_1CC97B000, v98, OS_LOG_TYPE_ERROR, "Set Queue (store) <%{public}@>: no identifier received", buf, 0xCu);
      }

      v100 = objc_alloc(MEMORY[0x1E0D87FE8]);
      v136 = (id)objc_msgSend(v100, "initWithErrorCode:", *MEMORY[0x1E0D88E08]);
      (*((void (**)(id, _QWORD, id))v132 + 2))(v132, 0, v136);
      goto LABEL_91;
    }
    v136 = objc_alloc_init(MEMORY[0x1E0CC2438]);
    if (self->_userIdentity)
    {
      objc_msgSend(MEMORY[0x1E0CC2408], "deviceMediaLibraryWithUserIdentity:");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "setMediaLibrary:", v61);

    }
    objc_msgSend(v136, "setIgnoreSystemFilterPredicates:", 1);
    objc_msgSend(v136, "setShouldIncludeNonLibraryEntities:", 1);
    objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", obj, *MEMORY[0x1E0CC1FA8]);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v136, "addFilterPredicate:", v62);

    v63 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v136, "items");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "firstObject");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = *MEMORY[0x1E0CC1D80];
    objc_msgSend(v65, "valueForProperty:", *MEMORY[0x1E0CC1D80]);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "numberWithUnsignedLongLong:", objc_msgSend(v67, "unsignedLongLongValue"));
    v16 = objc_claimAutoreleasedReturnValue();

    v68 = -[NSObject longLongValue](v16, "longLongValue");
    v69 = self->_requestAceHash;
    if (!v68)
    {
      if (!-[NSString length](v69, "length"))
      {
        -[MPAssistantSetQueue aceId](self, "aceId");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1CC994A10(CFSTR("Set Queue"), v116);
        v117 = (NSString *)objc_claimAutoreleasedReturnValue();
        v118 = self->_requestAceHash;
        self->_requestAceHash = v117;

      }
      _MPLogCategoryAssistant();
      v119 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
      {
        v120 = self->_requestAceHash;
        *(_DWORD *)buf = 138543618;
        v172 = v120;
        v173 = 2114;
        v174 = obj;
        _os_log_impl(&dword_1CC97B000, v119, OS_LOG_TYPE_ERROR, "Set Queue (store) <%{public}@>: no local item %{public}@.", buf, 0x16u);
      }

      v121 = objc_alloc(MEMORY[0x1E0D87FE8]);
      v56 = objc_msgSend(v121, "initWithErrorCode:", *MEMORY[0x1E0D88E00]);
      (*((void (**)(id, uint64_t, NSObject *))v132 + 2))(v132, 1, v56);
      goto LABEL_89;
    }
    if (!-[NSString length](v69, "length"))
    {
      -[MPAssistantSetQueue aceId](self, "aceId");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Queue"), v70);
      v71 = (NSString *)objc_claimAutoreleasedReturnValue();
      v72 = self->_requestAceHash;
      self->_requestAceHash = v71;

    }
    _MPLogCategoryAssistant();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      v74 = self->_requestAceHash;
      objc_msgSend(v136, "items");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "firstObject");
      v76 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v172 = v74;
      v173 = 2114;
      v174 = v76;
      _os_log_impl(&dword_1CC97B000, v73, OS_LOG_TYPE_DEFAULT, "Set Queue (store) <%{public}@>: pilot item %{public}@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CC2438], "albumsQuery");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_userIdentity)
    {
      objc_msgSend(MEMORY[0x1E0CC2408], "deviceMediaLibraryWithUserIdentity:");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setMediaLibrary:", v78);

    }
    objc_msgSend(v77, "setIgnoreSystemFilterPredicates:", 1);
    objc_msgSend(v77, "setShouldIncludeNonLibraryEntities:", 1);
    objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", v16, v66);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "addFilterPredicate:", v79);

    v80 = v161[5];
    v161[5] = v77;

LABEL_99:
    goto LABEL_100;
  }
  obj = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MPAssistantSetQueue mediaItems](self, "mediaItems");
  v136 = (id)objc_claimAutoreleasedReturnValue();
  v153 = 0u;
  v154 = 0u;
  v151 = 0u;
  v152 = 0u;
  objc_msgSend(v136, "items");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v151, v170, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v152;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v152 != v24)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v151 + 1) + 8 * i), "identifier");
        v26 = objc_claimAutoreleasedReturnValue();
        if (sub_1CC9834E0(v26) == 3)
        {
          -[NSObject lastPathComponent](v26, "lastPathComponent");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "longLongValue");

          if (!v28)
            goto LABEL_23;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v28);
          v29 = objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](obj, "addObject:", v29);
        }
        else
        {
          if (!-[NSString length](self->_requestAceHash, "length"))
          {
            -[MPAssistantSetQueue aceId](self, "aceId");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            sub_1CC994A10(CFSTR("Set Queue"), v30);
            v31 = (NSString *)objc_claimAutoreleasedReturnValue();
            v32 = self->_requestAceHash;
            self->_requestAceHash = v31;

          }
          _MPLogCategoryAssistant();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v33 = self->_requestAceHash;
            *(_DWORD *)buf = 138543618;
            v172 = v33;
            v173 = 2114;
            v174 = v26;
            _os_log_impl(&dword_1CC97B000, v29, OS_LOG_TYPE_ERROR, "Set Queue (store) <%{public}@>: content origin %{public}@", buf, 0x16u);
          }
        }

LABEL_23:
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v151, v170, 16);
    }
    while (v23);
  }

  if (!-[NSObject count](obj, "count"))
  {
    objc_msgSend(v136, "identifier");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v82 == 0;

    if (!v83)
    {
      objc_msgSend(v136, "identifier");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "lastPathComponent");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v85, "longLongValue");

      if (v86)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v86);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](obj, "addObject:", v87);

      }
    }
  }
  if (!-[NSObject count](obj, "count"))
  {
    v88 = objc_alloc(MEMORY[0x1E0D87FE8]);
    v16 = objc_msgSend(v88, "initWithErrorCode:", *MEMORY[0x1E0D88E08]);
    (*((void (**)(id, uint64_t, NSObject *))v132 + 2))(v132, 1, v16);
    goto LABEL_90;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = objc_claimAutoreleasedReturnValue();
  v149 = 0u;
  v150 = 0u;
  v147 = 0u;
  v148 = 0u;
  obj = obj;
  v126 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v147, v169, 16);
  if (!v126)
    goto LABEL_49;
  v129 = *(_QWORD *)v148;
  v124 = *MEMORY[0x1E0CC1FA0];
  v123 = *MEMORY[0x1E0CC1FC8];
  v122 = *MEMORY[0x1E0D88E00];
  v128 = v134 || v127;
  if (v134)
    v34 = (uint64_t *)MEMORY[0x1E0CC1E80];
  else
    v34 = (uint64_t *)MEMORY[0x1E0CC1E98];
  v125 = *v34;
  while (2)
  {
    for (j = 0; j != v126; ++j)
    {
      if (*(_QWORD *)v148 != v129)
        objc_enumerationMutation(obj);
      v35 = *(NSObject **)(*((_QWORD *)&v147 + 1) + 8 * j);
      v36 = (void (**)(void))objc_alloc_init(MEMORY[0x1E0CC2438]);
      if (self->_userIdentity)
      {
        objc_msgSend(MEMORY[0x1E0CC2408], "deviceMediaLibraryWithUserIdentity:");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setMediaLibrary:", v37);

      }
      objc_msgSend(v36, "setIgnoreSystemFilterPredicates:", 1, v122);
      objc_msgSend(v36, "setShouldIncludeNonLibraryEntities:", 1);
      if (!v128
        || (objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", MEMORY[0x1E0C9AAB0], v125),
            (v135 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        if (!-[NSString length](self->_requestAceHash, "length"))
        {
          -[MPAssistantSetQueue aceId](self, "aceId");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1CC994A10(CFSTR("Set Queue"), v89);
          v90 = (NSString *)objc_claimAutoreleasedReturnValue();
          v91 = self->_requestAceHash;
          self->_requestAceHash = v90;

        }
        _MPLogCategoryAssistant();
        v92 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
        {
          v93 = self->_requestAceHash;
          *(_DWORD *)buf = 138543362;
          v172 = v93;
          _os_log_impl(&dword_1CC97B000, v92, OS_LOG_TYPE_ERROR, "Set Queue (store) <%{public}@>: no playable type set", buf, 0xCu);
        }

        v94 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", CFSTR("no playable type set"));
        (*((void (**)(id, uint64_t, void *))v132 + 2))(v132, 1, v94);

        goto LABEL_87;
      }
      v38 = (void *)MEMORY[0x1E0CC23B8];
      v39 = (void *)MEMORY[0x1E0CC23C0];
      objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", v35, v124);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v167[0] = v40;
      objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", v35, v123);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v167[1] = v41;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v167, 2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "predicateMatchingPredicates:", v42);
      v43 = objc_claimAutoreleasedReturnValue();
      v168[0] = v43;
      v168[1] = v135;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v168, 2);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "predicateMatchingPredicates:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "addFilterPredicate:", v45);
      objc_msgSend(v36, "items");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v43) = objc_msgSend(v46, "count") == 0;

      if ((v43 & 1) != 0)
      {
        if (!-[NSString length](self->_requestAceHash, "length"))
        {
          -[MPAssistantSetQueue aceId](self, "aceId");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1CC994A10(CFSTR("Set Queue"), v101);
          v102 = (NSString *)objc_claimAutoreleasedReturnValue();
          v103 = self->_requestAceHash;
          self->_requestAceHash = v102;

        }
        _MPLogCategoryAssistant();
        v104 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
        {
          v105 = self->_requestAceHash;
          *(_DWORD *)buf = 138543618;
          v172 = v105;
          v173 = 2114;
          v174 = v35;
          _os_log_impl(&dword_1CC97B000, v104, OS_LOG_TYPE_ERROR, "Set Queue (store) <%{public}@>: no local item %{public}@", buf, 0x16u);
        }

        v106 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithErrorCode:", v122);
        (*((void (**)(id, uint64_t, void *))v132 + 2))(v132, 1, v106);

LABEL_87:
        v56 = obj;
        goto LABEL_88;
      }
      v145 = 0u;
      v146 = 0u;
      v143 = 0u;
      v144 = 0u;
      objc_msgSend(v36, "items");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v143, v166, 16);
      if (v48)
      {
        v49 = *(_QWORD *)v144;
        do
        {
          for (k = 0; k != v48; ++k)
          {
            if (*(_QWORD *)v144 != v49)
              objc_enumerationMutation(v47);
            -[NSObject addObject:](v16, "addObject:", *(_QWORD *)(*((_QWORD *)&v143 + 1) + 8 * k));
          }
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v143, v166, 16);
        }
        while (v48);
      }

    }
    v126 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v147, v169, 16);
    if (v126)
      continue;
    break;
  }
LABEL_49:

  if (-[NSObject count](v16, "count") != 1)
  {
    v107 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC2438]), "initWithEntities:entityType:", v16, 0);
    v108 = v161[5];
    v161[5] = (id)v107;

    if (self->_userIdentity)
    {
      objc_msgSend(MEMORY[0x1E0CC2408], "deviceMediaLibraryWithUserIdentity:");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v161[5], "setMediaLibrary:", v109);

    }
    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantSetQueue aceId](self, "aceId");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Queue"), v110);
      v111 = (NSString *)objc_claimAutoreleasedReturnValue();
      v112 = self->_requestAceHash;
      self->_requestAceHash = v111;

    }
    _MPLogCategoryAssistant();
    v113 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
    {
      v114 = self->_requestAceHash;
      v115 = v161[5];
      *(_DWORD *)buf = 138543618;
      v172 = v114;
      v173 = 2114;
      v174 = v115;
      _os_log_impl(&dword_1CC97B000, v113, OS_LOG_TYPE_DEFAULT, "Set Queue (store) <%{public}@>: queue from %{public}@", buf, 0x16u);
    }

    goto LABEL_99;
  }
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantSetQueue aceId](self, "aceId");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Set Queue"), v51);
    v52 = (NSString *)objc_claimAutoreleasedReturnValue();
    v53 = self->_requestAceHash;
    self->_requestAceHash = v52;

  }
  _MPLogCategoryAssistant();
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    v55 = self->_requestAceHash;
    *(_DWORD *)buf = 138543618;
    v172 = v55;
    v173 = 2114;
    v174 = v16;
    _os_log_impl(&dword_1CC97B000, v54, OS_LOG_TYPE_DEFAULT, "Set Queue (store) <%{public}@>: album from %{public}@", buf, 0x16u);
  }

  v56 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC2400]), "initWithItems:", v16);
  v140[0] = MEMORY[0x1E0C809B0];
  v140[1] = 3221225472;
  v140[2] = sub_1CC98D48C;
  v140[3] = &unk_1E88E2C40;
  v141 = v133;
  v142 = v132;
  -[MPAssistantSetQueue _playAlbumFromMediaItems:contextID:dryRun:completion:](self, "_playAlbumFromMediaItems:contextID:dryRun:completion:", v56, v130, v131, v140);

  v36 = v141;
LABEL_88:

LABEL_89:
LABEL_90:

LABEL_91:
LABEL_101:

  _Block_object_dispose(&v160, 8);
}

- (void)_playAlbumFromMediaItems:(id)a3 contextID:(id)a4 dryRun:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSString *v14;
  NSString *requestAceHash;
  NSObject *v16;
  NSString *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[8];
  BOOL v22;
  uint8_t buf[4];
  NSString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantSetQueue aceId](self, "aceId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Set Queue"), v13);
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v14;

  }
  _MPLogCategoryAssistant();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = self->_requestAceHash;
    *(_DWORD *)buf = 138543618;
    v24 = v17;
    v25 = 2114;
    v26 = v10;
    _os_log_impl(&dword_1CC97B000, v16, OS_LOG_TYPE_DEFAULT, "Set Queue (local) <%{public}@>: find album with pid %{public}@", buf, 0x16u);
  }

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = sub_1CC98C5F8;
  v21[3] = &unk_1E88E2D08;
  v21[4] = self;
  v21[5] = v10;
  v21[6] = v11;
  v21[7] = v12;
  v22 = a5;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  sub_1CC98C5F8((uint64_t)v21, 0);

}

- (void)_playMediaItems:(id)a3 contextID:(id)a4 dryRun:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[8];
  BOOL v17;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1CC98BDE0;
  v16[3] = &unk_1E88E2D08;
  v16[4] = self;
  v16[5] = v10;
  v16[6] = v11;
  v16[7] = v12;
  v17 = a5;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  sub_1CC98BDE0((uint64_t)v16, 0);

}

- (void)sendQueue:(id)a3 toDestination:(id)a4 shouldResync:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  dispatch_queue_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  MPAssistantSetQueue *v25;
  id v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  MPAssistantSetQueue *v31;
  id v32;
  BOOL v33;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_1CC98B64C;
  v29[3] = &unk_1E88E2D58;
  v14 = v10;
  v30 = v14;
  v31 = self;
  v33 = a5;
  v32 = v12;
  v15 = v12;
  v16 = (void *)MEMORY[0x1D17B0600](v29);
  v17 = dispatch_queue_create("com.apple.mediaPlayer.assistant.setQueue.sendCommand", 0);
  v18 = (void *)objc_msgSend(v11, "mutableCopy");
  objc_msgSend(v18, "setSingleGroup:", 1);
  v23[0] = v13;
  v23[1] = 3221225472;
  v23[2] = sub_1CC98B7E8;
  v23[3] = &unk_1E88E2DA8;
  v24 = v11;
  v25 = self;
  v27 = v14;
  v28 = v16;
  v26 = v18;
  v19 = v14;
  v20 = v18;
  v21 = v16;
  v22 = v11;
  MEMORY[0x1D17B0210](v17, v23);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
  objc_storeStrong((id *)&self->_privateListeningEnabled, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_availability, 0);
  objc_storeStrong((id *)&self->_serviceHelper, 0);
}

@end
