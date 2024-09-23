@implementation MPAssistantLoadPredefinedQueue

- (void)performWithCompletion:(id)a3 serviceHelper:(id)a4
{
  void (**v6)(id, NSObject *);
  id v7;
  MPCAssistantAvailability *v8;
  MPCAssistantAvailability *availability;
  void *v10;
  NSString *v11;
  NSString *requestAceHash;
  NSObject *v13;
  NSString *v14;
  void *v15;
  int v16;
  const __CFString *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  NSString *v22;
  NSString *v23;
  NSObject *v24;
  NSString *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  _QWORD v29[5];
  void (**v30)(id, NSObject *);
  uint8_t buf[4];
  NSString *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, NSObject *))a3;
  v7 = a4;
  v8 = (MPCAssistantAvailability *)objc_alloc_init(MEMORY[0x1E0D4B2F0]);
  availability = self->_availability;
  self->_availability = v8;

  objc_storeStrong((id *)&self->_serviceHelper, a4);
  if (qword_1EF9DDBE0 != -1)
    dispatch_once(&qword_1EF9DDBE0, &unk_1E88E3A50);
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantLoadPredefinedQueue aceId](self, "aceId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Load Predefined Queue"), v10);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v11;

  }
  _MPLogCategoryAssistant();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = self->_requestAceHash;
    -[MPAssistantLoadPredefinedQueue mediaItemType](self, "mediaItemType");
    stringForSAMPType();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[MPAssistantLoadPredefinedQueue dryRun](self, "dryRun");
    v17 = &stru_1E88E41D0;
    *(_DWORD *)buf = 138543874;
    v32 = v14;
    v33 = 2114;
    if (v16)
      v17 = CFSTR(" ⚠️ DRY RUN");
    v34 = v15;
    v35 = 2114;
    v36 = v17;
    _os_log_impl(&dword_1CC97B000, v13, OS_LOG_TYPE_DEFAULT, "Load Predefined Queue (invoke) <%{public}@>: media item type %{public}@%{public}@", buf, 0x20u);

  }
  v18 = self->_requestAceHash;
  -[MPAssistantLoadPredefinedQueue hashedRouteUIDs](self, "hashedRouteUIDs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1CC994B48(CFSTR("Load Predefined Queue"), v18, v19);

  -[MPAssistantLoadPredefinedQueue _validate](self, "_validate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantLoadPredefinedQueue aceId](self, "aceId");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Load Predefined Queue"), v21);
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      v23 = self->_requestAceHash;
      self->_requestAceHash = v22;

    }
    _MPLogCategoryAssistant();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = self->_requestAceHash;
      objc_msgSend(v20, "dictionary");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v25;
      v33 = 2114;
      v34 = v26;
      _os_log_impl(&dword_1CC97B000, v24, OS_LOG_TYPE_DEFAULT, "Load Predefined Queue (completion) <%{public}@>: notifying assistant %{public}@", buf, 0x16u);

    }
    objc_msgSend(v20, "dictionary");
    v27 = objc_claimAutoreleasedReturnValue();
    v6[2](v6, v27);
  }
  else
  {
    sub_1CC995B9C();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = dispatch_queue_create("com.apple.mediaPlayer.assistant.loadPredefinedQueue", 0);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = sub_1CC9A8164;
    v29[3] = &unk_1E88E3AC8;
    v29[4] = self;
    v30 = v6;
    dispatch_group_notify(v27, v28, v29);

  }
}

- (void)_performWithNowPlayingItem:(id)a3 audioRoutingInfo:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  unsigned int v15;
  MPCAssistantAvailability *availability;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  NSString *v23;
  NSString *requestAceHash;
  NSObject *v25;
  NSString *v26;
  const char *v27;
  void *v28;
  NSString *v29;
  NSString *v30;
  NSObject *v31;
  NSString *v32;
  uint64_t v33;
  void *v34;
  NSString *v35;
  NSString *v36;
  NSString *v37;
  void *v38;
  NSString *v39;
  NSString *v40;
  NSString *v41;
  NSObject *v42;
  void *v43;
  NSString *v44;
  NSString *v45;
  NSString *v46;
  void *v47;
  NSString *v48;
  NSString *v49;
  NSString *v50;
  void *v51;
  NSString *v52;
  NSString *v53;
  NSObject *v54;
  NSString *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  _BOOL4 v62;
  NSUInteger v63;
  void *v64;
  NSString *v65;
  NSString *v66;
  NSObject *v67;
  NSString *v68;
  id v69;
  _QWORD *v70;
  void *v71;
  NSString *v72;
  NSString *v73;
  NSObject *v74;
  NSString *v75;
  void *v76;
  uint64_t v77;
  id v78;
  void *v79;
  void *v80;
  _QWORD v81[5];
  id v82;
  id v83;
  id v84;
  _QWORD v85[5];
  id v86;
  id v87;
  id v88;
  id v89;
  int v90;
  $294CB042FB18EDF8FD74FDF4F765ED39 v91;
  _QWORD v92[5];
  id v93;
  _QWORD v94[5];
  id v95;
  id v96;
  uint8_t buf[4];
  NSString *v98;
  __int16 v99;
  uint64_t v100;
  uint64_t v101;
  _QWORD v102[4];

  v102[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v101 = *MEMORY[0x1E0D4CCC0];
  v102[0] = CFSTR("com.apple.MediaAssistant.siri");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, &v101, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v94[0] = MEMORY[0x1E0C809B0];
  v94[1] = 3221225472;
  v94[2] = sub_1CC9A6EE4;
  v94[3] = &unk_1E88E3AF0;
  v94[4] = self;
  v12 = v10;
  v95 = v12;
  v13 = v9;
  v96 = v13;
  v92[0] = v11;
  v92[1] = 3221225472;
  v92[2] = sub_1CC9A6FE4;
  v92[3] = &unk_1E88E3B68;
  v92[4] = self;
  v14 = (id)MEMORY[0x1D17B0600](v94);
  v93 = v14;
  v79 = (void *)MEMORY[0x1D17B0600](v92);
  v15 = -[MPAssistantLoadPredefinedQueue mediaItemType](self, "mediaItemType");
  -[MPAssistantLoadPredefinedQueue refId](self, "refId");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 == 3)
  {
    if ((MRMediaRemoteIsBooksAppInstalled() & 1) == 0)
    {
      v18 = objc_alloc_init(MEMORY[0x1E0D87FE8]);
      (*((void (**)(id, id))v13 + 2))(v13, v18);

    }
    objc_msgSend(MEMORY[0x1E0CC2438], "audiobooksQuery");
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v20 = (id)v19;
    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CC2408], "deviceMediaLibraryWithUserIdentity:", self->_userIdentity);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setMediaLibrary:", v21);

      v77 = a4;
      v78 = v8;
      switch(-[MPCAssistantAvailability assistantStreamingGetAvailability:](self->_availability, "assistantStreamingGetAvailability:", *(unsigned int *)&a4))
      {
        case 0:
          if (!-[NSString length](self->_requestAceHash, "length"))
          {
            -[MPAssistantLoadPredefinedQueue aceId](self, "aceId");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            sub_1CC994A10(CFSTR("Load Predefined Queue"), v22);
            v23 = (NSString *)objc_claimAutoreleasedReturnValue();
            requestAceHash = self->_requestAceHash;
            self->_requestAceHash = v23;

          }
          _MPLogCategoryAssistant();
          v25 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            goto LABEL_30;
          v26 = self->_requestAceHash;
          *(_DWORD *)buf = 138543362;
          v98 = v26;
          v27 = "Load Predefined Queue (query) <%{public}@>: streaming not available";
          break;
        case 1:
          if (!-[NSString length](self->_requestAceHash, "length"))
          {
            -[MPAssistantLoadPredefinedQueue aceId](self, "aceId");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            sub_1CC994A10(CFSTR("Load Predefined Queue"), v34);
            v35 = (NSString *)objc_claimAutoreleasedReturnValue();
            v36 = self->_requestAceHash;
            self->_requestAceHash = v35;

          }
          _MPLogCategoryAssistant();
          v25 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            goto LABEL_30;
          v37 = self->_requestAceHash;
          *(_DWORD *)buf = 138543362;
          v98 = v37;
          v27 = "Load Predefined Queue (query) <%{public}@>: network conditions do not permit streaming";
          break;
        case 2:
          if (!-[NSString length](self->_requestAceHash, "length"))
          {
            -[MPAssistantLoadPredefinedQueue aceId](self, "aceId");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            sub_1CC994A10(CFSTR("Load Predefined Queue"), v38);
            v39 = (NSString *)objc_claimAutoreleasedReturnValue();
            v40 = self->_requestAceHash;
            self->_requestAceHash = v39;

          }
          _MPLogCategoryAssistant();
          v25 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            goto LABEL_30;
          v41 = self->_requestAceHash;
          *(_DWORD *)buf = 138543362;
          v98 = v41;
          v27 = "Load Predefined Queue (query) <%{public}@>: companion not available";
          break;
        case 3:
          if (!-[NSString length](self->_requestAceHash, "length"))
          {
            -[MPAssistantLoadPredefinedQueue aceId](self, "aceId");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            sub_1CC994A10(CFSTR("Load Predefined Queue"), v43);
            v44 = (NSString *)objc_claimAutoreleasedReturnValue();
            v45 = self->_requestAceHash;
            self->_requestAceHash = v44;

          }
          _MPLogCategoryAssistant();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            v46 = self->_requestAceHash;
            *(_DWORD *)buf = 138543362;
            v98 = v46;
            _os_log_impl(&dword_1CC97B000, v42, OS_LOG_TYPE_DEFAULT, "Load Predefined Queue (query) <%{public}@>: companion will be used", buf, 0xCu);
          }
          v33 = 0;
          goto LABEL_41;
        case 4:
          if (!-[NSString length](self->_requestAceHash, "length"))
          {
            -[MPAssistantLoadPredefinedQueue aceId](self, "aceId");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            sub_1CC994A10(CFSTR("Load Predefined Queue"), v47);
            v48 = (NSString *)objc_claimAutoreleasedReturnValue();
            v49 = self->_requestAceHash;
            self->_requestAceHash = v48;

          }
          _MPLogCategoryAssistant();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            v50 = self->_requestAceHash;
            *(_DWORD *)buf = 138543362;
            v98 = v50;
            _os_log_impl(&dword_1CC97B000, v42, OS_LOG_TYPE_DEFAULT, "Load Predefined Queue (query) <%{public}@>: streaming available", buf, 0xCu);
          }
          v33 = 1;
          goto LABEL_41;
        default:
          v33 = 1;
          goto LABEL_42;
      }
      _os_log_impl(&dword_1CC97B000, v25, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);
LABEL_30:

      objc_msgSend(MEMORY[0x1E0CC2430], "predicateWithValue:forProperty:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CC1E80]);
      v42 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addFilterPredicate:", v42);
      v33 = 1;
LABEL_41:

LABEL_42:
      if (objc_msgSend(v20, "_countOfItems"))
      {
        if (!-[NSString length](self->_requestAceHash, "length"))
        {
          -[MPAssistantLoadPredefinedQueue aceId](self, "aceId");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1CC994A10(CFSTR("Load Predefined Queue"), v51);
          v52 = (NSString *)objc_claimAutoreleasedReturnValue();
          v53 = self->_requestAceHash;
          self->_requestAceHash = v52;

        }
        _MPLogCategoryAssistant();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          v55 = self->_requestAceHash;
          *(_DWORD *)buf = 138543618;
          v98 = v55;
          v99 = 2048;
          v100 = v15;
          _os_log_impl(&dword_1CC97B000, v54, OS_LOG_TYPE_ERROR, "Load Predefined Queue (query) <%{public}@>: beginning playback (type %ld).", buf, 0x16u);
        }

        v56 = -[MPAssistantLoadPredefinedQueue shouldShuffle](self, "shouldShuffle");
        objc_msgSend(MEMORY[0x1E0D4B328], "queryQueueWithContextID:query:", v80, v20);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setShuffleType:", v56);
        -[MPAssistantLoadPredefinedQueue startPlaying](self, "startPlaying");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "setShouldImmediatelyStartPlayback:", objc_msgSend(v58, "BOOLValue"));

        objc_msgSend(v57, "setShouldOverrideManuallyCuratedQueue:", 1);
        objc_msgSend(MEMORY[0x1E0D4B318], "systemMediaApplicationDestination");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPAssistantLoadPredefinedQueue hashedRouteUIDs](self, "hashedRouteUIDs");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v81[0] = v11;
        v81[1] = 3221225472;
        v81[2] = sub_1CC9A7840;
        v81[3] = &unk_1E88E3BB8;
        v81[4] = self;
        v83 = v13;
        v17 = v79;
        v84 = v79;
        v82 = v57;
        v61 = v57;
        objc_msgSend(v59, "resolveWithQueue:hashedRouteIdentifiers:localPlaybackPermitted:audioRoutingInfo:completion:", v61, v60, v33, v77, v81);

        v8 = v78;
        goto LABEL_61;
      }
      v62 = sub_1CC994964(self->_userIdentity);
      v63 = -[NSString length](self->_requestAceHash, "length");
      if (v62)
      {
        if (!v63)
        {
          -[MPAssistantLoadPredefinedQueue aceId](self, "aceId");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1CC994A10(CFSTR("Load Predefined Queue"), v64);
          v65 = (NSString *)objc_claimAutoreleasedReturnValue();
          v66 = self->_requestAceHash;
          self->_requestAceHash = v65;

        }
        _MPLogCategoryAssistant();
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        {
          v68 = self->_requestAceHash;
          *(_DWORD *)buf = 138543618;
          v98 = v68;
          v99 = 2048;
          v100 = v15;
          _os_log_impl(&dword_1CC97B000, v67, OS_LOG_TYPE_ERROR, "Load Predefined Queue (query) <%{public}@>: still loading library (type %ld).", buf, 0x16u);
        }

        v69 = objc_alloc(MEMORY[0x1E0D87FE8]);
        v70 = (_QWORD *)MEMORY[0x1E0D88DF0];
      }
      else
      {
        if (!v63)
        {
          -[MPAssistantLoadPredefinedQueue aceId](self, "aceId");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1CC994A10(CFSTR("Load Predefined Queue"), v71);
          v72 = (NSString *)objc_claimAutoreleasedReturnValue();
          v73 = self->_requestAceHash;
          self->_requestAceHash = v72;

        }
        _MPLogCategoryAssistant();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        {
          v75 = self->_requestAceHash;
          *(_DWORD *)buf = 138543618;
          v98 = v75;
          v99 = 2048;
          v100 = v15;
          _os_log_impl(&dword_1CC97B000, v74, OS_LOG_TYPE_ERROR, "Load Predefined Queue (query) <%{public}@>: empty library for (type %ld).", buf, 0x16u);
        }

        v69 = objc_alloc(MEMORY[0x1E0D87FE8]);
        v70 = (_QWORD *)MEMORY[0x1E0D88DD0];
      }
      v76 = (void *)objc_msgSend(v69, "initWithErrorCode:", *v70);
      (*((void (**)(id, void *))v13 + 2))(v13, v76);

LABEL_60:
      v17 = v79;
LABEL_61:

      goto LABEL_62;
    }
LABEL_15:
    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantLoadPredefinedQueue aceId](self, "aceId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Load Predefined Queue"), v28);
      v29 = (NSString *)objc_claimAutoreleasedReturnValue();
      v30 = self->_requestAceHash;
      self->_requestAceHash = v29;

    }
    _MPLogCategoryAssistant();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = self->_requestAceHash;
      *(_DWORD *)buf = 138543618;
      v98 = v32;
      v99 = 2048;
      v100 = v15;
      _os_log_impl(&dword_1CC97B000, v31, OS_LOG_TYPE_ERROR, "Load Predefined Queue (query) <%{public}@>: unrecognized media (type %ld).", buf, 0x16u);
    }

    v20 = objc_alloc_init(MEMORY[0x1E0D87FE8]);
    (*((void (**)(id, id))v13 + 2))(v13, v20);
    goto LABEL_60;
  }
  if (v15 == 15)
  {
    objc_msgSend(MEMORY[0x1E0CC2438], "songsQuery");
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (v15 != 14)
    goto LABEL_15;
  availability = self->_availability;
  v85[0] = v11;
  v85[1] = 3221225472;
  v85[2] = sub_1CC9A70B4;
  v85[3] = &unk_1E88E3BE0;
  v85[4] = self;
  v88 = v13;
  v86 = v8;
  v91 = a4;
  v87 = v12;
  v17 = v79;
  v89 = v79;
  v90 = 14;
  -[MPCAssistantAvailability assistantRadioGetAvailability:completion:](availability, "assistantRadioGetAvailability:completion:", *(unsigned int *)&a4, v85);

LABEL_62:
}

- (id)_validate
{
  unsigned int v2;

  v2 = -[MPAssistantLoadPredefinedQueue mediaItemType](self, "mediaItemType");
  if (v2 > 0xF || ((1 << v2) & 0xC008) == 0)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D87FE8]), "initWithReason:", CFSTR("Unsupported media item type"));
  else
    return 0;
}

- (id)_radioStations
{
  dispatch_semaphore_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, uint64_t);
  void *v15;
  NSObject *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1CC9A6D74;
  v22 = sub_1CC9A6D84;
  v23 = 0;
  v2 = dispatch_semaphore_create(0);
  objc_msgSend(MEMORY[0x1E0CC24C8], "defaultRadioLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = sub_1CC9A6D8C;
  v15 = &unk_1E88E3C08;
  v17 = &v18;
  v4 = v2;
  v16 = v4;
  objc_msgSend(v3, "getRecentStationGroupsWithCompletionHandler:", &v12);

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  v5 = (void *)v19[5];
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CC24C8], "defaultRadioLibrary", v12, v13, v14, v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "mutableCopy");
    v9 = (void *)v19[5];
    v19[5] = v8;

    v5 = (void *)v19[5];
  }
  v10 = v5;

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_requestAceHash, 0);
  objc_storeStrong((id *)&self->_availability, 0);
  objc_storeStrong((id *)&self->_serviceHelper, 0);
}

@end
