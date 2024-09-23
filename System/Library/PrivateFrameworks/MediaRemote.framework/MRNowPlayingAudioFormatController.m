@implementation MRNowPlayingAudioFormatController

- (MRNowPlayingAudioFormatContentInfo)audioFormatContentInfo
{
  return self->_audioFormatContentInfo;
}

- (MRNowPlayingAudioFormatApplication)audioFormatApplication
{
  return self->_audioFormatApplication;
}

void __41__MRNowPlayingAudioFormatController_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateForegroundBundleID");

}

- (void)updateForegroundBundleID
{
  void *v3;
  void *v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  -[FBSDisplayLayoutMonitor currentLayout](self->_layoutMonitor, "currentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "elements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MRNowPlayingAudioFormatController_updateForegroundBundleID__block_invoke;
  block[3] = &unk_1E30CB020;
  v8 = v4;
  v6 = v4;
  objc_copyWeak(&v9, &location);
  dispatch_async(queue, block);
  objc_destroyWeak(&v9);

  objc_destroyWeak(&location);
}

void __62__MRNowPlayingAudioFormatController_updateSelectedContentInfo__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  id v7;

  if (*(_BYTE *)(a1 + 64))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v2 = *(void **)(a1 + 32);
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v2, "nowPlayingAudioFormatController:didChangeAudioFormatApplication:", WeakRetained, *(_QWORD *)(a1 + 40));

    }
    v4 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v4, "updateDeprecatedApplication");

  }
  if (*(_BYTE *)(a1 + 65))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v5 = *(void **)(a1 + 32);
      v6 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v5, "nowPlayingAudioFormatController:didChangeAudioFormatContentInfo:", v6, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 24));

    }
    v7 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v7, "updateDeprecatedContentInfo");

  }
}

- (void)setContentInfos:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSArray isEqualToArray:](self->_contentInfos, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_contentInfos, a3);
    -[MRNowPlayingAudioFormatController updateSelectedContentInfo](self, "updateSelectedContentInfo");
  }

}

- (void)updateSelectedContentInfo
{
  NSArray *contentInfos;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  MRClient *v12;
  NSString *v13;
  void *v14;
  void *v15;
  MRNowPlayingAudioFormatContentInfo *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  MRNowPlayingAudioFormatApplication *v30;
  MRNowPlayingAudioFormatApplication *v31;
  MRNowPlayingAudioFormatApplication *audioFormatApplication;
  BOOL v33;
  MRNowPlayingAudioFormatApplication *v34;
  BOOL v35;
  NSString *v36;
  NSObject *v37;
  MRNowPlayingAudioFormatApplication *v38;
  MRNowPlayingAudioFormatContentInfo *v39;
  MRNowPlayingAudioFormatContentInfo *audioFormatContentInfo;
  BOOL v41;
  MRNowPlayingAudioFormatContentInfo *v42;
  BOOL v43;
  NSObject *v44;
  uint64_t v45;
  MRNowPlayingAudioFormatContentInfo *v46;
  void *v47;
  id v48;
  MRNowPlayingAudioFormatApplication *v49;
  MRClient *v50;
  void *v51;
  _QWORD block[4];
  id v53;
  MRNowPlayingAudioFormatApplication *v54;
  MRNowPlayingAudioFormatController *v55;
  id v56;
  BOOL v57;
  BOOL v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  MRNowPlayingAudioFormatApplication *v62;
  _QWORD v63[3];

  v63[2] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  contentInfos = self->_contentInfos;
  v4 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_isEligibleForSpatialization);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortDescriptorWithKey:ascending:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v6;
  v7 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_channelCount);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortDescriptorWithKey:ascending:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray sortedArrayUsingDescriptors:](contentInfos, "sortedArrayUsingDescriptors:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = self->_activeClient;
  v13 = self->_foregroundBundleID;
  -[MRNowPlayingAudioFormatController faceTimeBundleSet](self, "faceTimeBundleSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v14, "containsObject:", v13);

  if (!(_DWORD)v8
    || (-[MRNowPlayingAudioFormatController faceTimeBundleSet](self, "faceTimeBundleSet"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        -[MRNowPlayingAudioFormatController firstContentInfoMatchingSet:contentInfos:](self, "firstContentInfoMatchingSet:contentInfos:", v15, v11), v16 = (MRNowPlayingAudioFormatContentInfo *)objc_claimAutoreleasedReturnValue(), v15, !v16))
  {
    -[MRNowPlayingAudioFormatController contentInfoForBundleID:contentInfos:](self, "contentInfoForBundleID:contentInfos:", v13, v11);
    v16 = (MRNowPlayingAudioFormatContentInfo *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      -[MRClient bundleIdentifier](v12, "bundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRNowPlayingAudioFormatController contentInfoForBundleID:contentInfos:](self, "contentInfoForBundleID:contentInfos:", v17, v11);
      v16 = (MRNowPlayingAudioFormatContentInfo *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        -[MRNowPlayingAudioFormatController firstEligibleContentInfoFor:](self, "firstEligibleContentInfoFor:", v11);
        v16 = (MRNowPlayingAudioFormatContentInfo *)objc_claimAutoreleasedReturnValue();
        if (!v16)
        {
          -[MRNowPlayingAudioFormatController faceTimeBundleSet](self, "faceTimeBundleSet");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[MRNowPlayingAudioFormatController firstContentInfoMatchingSet:contentInfos:](self, "firstContentInfoMatchingSet:contentInfos:", v18, v11);
          v16 = (MRNowPlayingAudioFormatContentInfo *)objc_claimAutoreleasedReturnValue();

        }
      }
    }
  }
  -[MRClient bundleIdentifier](v12, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRNowPlayingAudioFormatContentInfo bundleID](v16, "bundleID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isEqualToString:", v20);

  if (v21)
  {
    -[MRClient representedBundleID](v12, "representedBundleID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      v24 = v22;
    }
    else
    {
      -[MRNowPlayingAudioFormatContentInfo bundleID](v16, "bundleID");
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v25 = v24;

    -[MRClient displayName](v12, "displayName");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MRNowPlayingAudioFormatContentInfo bundleID](v16, "bundleID");
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[MRNowPlayingAudioFormatController faceTimeBundleSet](self, "faceTimeBundleSet");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "containsObject:", v25);

    if (v27)
    {

      v25 = CFSTR("com.apple.facetime");
      -[MRNowPlayingAudioFormatContentInfo setBundleID:](v16, "setBundleID:", CFSTR("com.apple.facetime"));
    }
    -[MRNowPlayingAudioFormatController displayNameForBundleID:](self, "displayNameForBundleID:", v25);
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v28;
  v51 = (void *)v11;
  if (-[__CFString length](v25, "length") && objc_msgSend(v29, "length"))
    v30 = -[MRNowPlayingAudioFormatApplication initWithBundleID:displayName:]([MRNowPlayingAudioFormatApplication alloc], "initWithBundleID:displayName:", v25, v29);
  else
    v30 = 0;
  v31 = self->_audioFormatApplication;
  audioFormatApplication = v30;
  v33 = v31 != v30;
  v50 = v12;
  if (v31 != v30)
  {
    v34 = v31;
    v35 = -[MRNowPlayingAudioFormatApplication isEqual:](v31, "isEqual:", v30);

    if (v35)
    {
      v36 = v13;
      v33 = 0;
      goto LABEL_26;
    }
    _MRLogForCategory(0);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v60 = objc_opt_class();
      v61 = 2114;
      v62 = v30;
      _os_log_impl(&dword_193827000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ updating audio format application: %{public}@", buf, 0x16u);
    }

    v38 = v30;
    audioFormatApplication = self->_audioFormatApplication;
    self->_audioFormatApplication = v38;
  }
  v36 = v13;

LABEL_26:
  v39 = self->_audioFormatContentInfo;
  audioFormatContentInfo = v16;
  v41 = v39 != v16;
  if (v39 == v16)
  {
LABEL_32:

    goto LABEL_33;
  }
  v42 = v39;
  v43 = -[MRNowPlayingAudioFormatContentInfo isEqual:](v39, "isEqual:", v16);

  if (!v43)
  {
    _MRLogForCategory(0);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v60 = v45;
      v61 = 2114;
      v62 = (MRNowPlayingAudioFormatApplication *)v16;
      _os_log_impl(&dword_193827000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@ updating audio format content info: %{public}@", buf, 0x16u);
    }

    v46 = v16;
    audioFormatContentInfo = self->_audioFormatContentInfo;
    self->_audioFormatContentInfo = v46;
    goto LABEL_32;
  }
  v41 = 0;
LABEL_33:
  -[MRNowPlayingAudioFormatController delegate](self, "delegate");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MRNowPlayingAudioFormatController_updateSelectedContentInfo__block_invoke;
  block[3] = &unk_1E30CB048;
  v57 = v33;
  v53 = v47;
  v48 = v47;
  objc_copyWeak(&v56, (id *)buf);
  v58 = v41;
  v54 = v30;
  v55 = self;
  v49 = v30;
  dispatch_sync(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v56);
  objc_destroyWeak((id *)buf);

}

- (id)faceTimeBundleSet
{
  if (faceTimeBundleSet_onceToken != -1)
    dispatch_once(&faceTimeBundleSet_onceToken, &__block_literal_global_58);
  return (id)faceTimeBundleSet___set;
}

- (void)updateDeprecatedContentInfo
{
  void *v3;
  id v4;

  -[MRNowPlayingAudioFormatController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MRNowPlayingAudioFormatController audioFormatDescription](self, "audioFormatDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nowPlayingAudioFormatController:didChangeAudioFormatDescription:", self, v3);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "nowPlayingAudioFormatController:didChangeMultichannel:", self, -[MRNowPlayingAudioFormatController isMultichannel](self, "isMultichannel"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "nowPlayingAudioFormatController:didChangeBestAvailableAudioFormat:", self, -[MRNowPlayingAudioFormatController bestAvailableAudioFormat](self, "bestAvailableAudioFormat"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "nowPlayingAudioFormatController:didChangeIsEligibleForSpatialization:", self, -[MRNowPlayingAudioFormatController isEligibleForSpatialization](self, "isEligibleForSpatialization"));

}

- (MRNowPlayingAudioFormatControllerDelegate)delegate
{
  return (MRNowPlayingAudioFormatControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)displayNameForBundleID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v10;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CA5870], "bundleRecordWithApplicationIdentifier:error:", v4, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    if (v6)
    {
      _MRLogForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[MRNowPlayingAudioFormatController displayNameForBundleID:].cold.1((uint64_t)self, (uint64_t)v6, v7);

    }
    objc_msgSend(v5, "localizedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)contentInfoForBundleID:(id)a3 contentInfos:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v6;
    v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "bundleID", (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v5);

          if ((v14 & 1) != 0)
          {
            v9 = v12;
            goto LABEL_12;
          }
        }
        v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __61__MRNowPlayingAudioFormatController_updateForegroundBundleID__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  BOOL v10;
  void *v11;
  char v12;
  void *v13;
  id WeakRetained;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v9, "isUIApplicationElement", (_QWORD)v15))
          v10 = v6 == 0;
        else
          v10 = 0;
        if (v10)
        {
          objc_msgSend(v9, "bundleIdentifier");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v9, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.pineboard.now-playing"));

        v5 |= v12;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);

    if ((v5 & 1) != 0)
      v13 = 0;
    else
      v13 = v6;
  }
  else
  {

    v6 = 0;
    v13 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setForegroundBundleID:", v13);

}

- (void)setForegroundBundleID:(id)a3
{
  id v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((-[NSString isEqual:](self->_foregroundBundleID, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_foregroundBundleID, a3);
    _MRLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543618;
      v8 = objc_opt_class();
      v9 = 2114;
      v10 = v5;
      _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ foreground bundle id changed: %{public}@", (uint8_t *)&v7, 0x16u);
    }

    -[MRNowPlayingAudioFormatController updateSelectedContentInfo](self, "updateSelectedContentInfo");
  }

}

void __41__MRNowPlayingAudioFormatController_init__block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__MRNowPlayingAudioFormatController_init__block_invoke_2;
  block[3] = &unk_1E30C6AA0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __65__MRNowPlayingAudioFormatController_updateAudioFormatContentInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  id v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _MRLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v10 = 138543874;
    v11 = objc_opt_class();
    v12 = 2114;
    v13 = v5;
    v14 = 2114;
    v15 = v6;
    _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ audio format content changed: %{public}@ %{public}@", (uint8_t *)&v10, 0x20u);

  }
  v9 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v9, "setContentInfos:", v5);

}

- (void)updateAudioFormatContentInfo
{
  void *v3;
  void *v4;
  OS_dispatch_queue *queue;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)MRGetSharedService();
  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__MRNowPlayingAudioFormatController_updateAudioFormatContentInfo__block_invoke;
  v6[3] = &unk_1E30C9F50;
  objc_copyWeak(&v7, &location);
  MRMediaRemoteServiceGetAudioFormatContentInfoForOrigin(v3, v4, queue, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (MRNowPlayingAudioFormatController)init
{
  MRNowPlayingAudioFormatController *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  FBSDisplayLayoutMonitor *layoutMonitor;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MRNowPlayingAudioFormatController;
  v2 = -[MRNowPlayingAudioFormatController init](&v19, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.mediaremote.MRNowPlayingAudioFormatController", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel_contentInfoDidChange_, CFSTR("kMRMediaRemoteAudioFormatContentInfoDidChange"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v2, sel_activeClientDidChange_, CFSTR("kMRMediaRemoteActivePlayerPathsDidChange"), 0);

    objc_initWeak(&location, v2);
    -[objc_class configurationForDefaultMainDisplayMonitor](getFBSDisplayLayoutMonitorConfigurationClass(), "configurationForDefaultMainDisplayMonitor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __41__MRNowPlayingAudioFormatController_init__block_invoke;
    v16 = &unk_1E30CAFD0;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v9, "setTransitionHandler:", &v13);
    -[objc_class monitorWithConfiguration:](getFBSDisplayLayoutMonitorClass(), "monitorWithConfiguration:", v9, v13, v14, v15, v16);
    v10 = objc_claimAutoreleasedReturnValue();
    layoutMonitor = v2->_layoutMonitor;
    v2->_layoutMonitor = (FBSDisplayLayoutMonitor *)v10;

    -[MRNowPlayingAudioFormatController updateActiveClient](v2, "updateActiveClient");
    -[MRNowPlayingAudioFormatController updateAudioFormatContentInfo](v2, "updateAudioFormatContentInfo");
    -[MRNowPlayingAudioFormatController updateForegroundBundleID](v2, "updateForegroundBundleID");
    objc_destroyWeak(&v17);

    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[FBSDisplayLayoutMonitor invalidate](self->_layoutMonitor, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MRNowPlayingAudioFormatController;
  -[MRNowPlayingAudioFormatController dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p | application: %@ | content info: %@>"), objc_opt_class(), self, self->_audioFormatApplication, self->_audioFormatContentInfo);
}

- (void)setActiveClient:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[MRClient isEqual:](self->_activeClient, "isEqual:"))
  {
    objc_storeStrong((id *)&self->_activeClient, a3);
    -[MRNowPlayingAudioFormatController updateSelectedContentInfo](self, "updateSelectedContentInfo");
  }

}

- (void)updateActiveClient
{
  void *v3;
  OS_dispatch_queue *queue;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__MRNowPlayingAudioFormatController_updateActiveClient__block_invoke;
  v5[3] = &unk_1E30CAFF8;
  objc_copyWeak(&v6, &location);
  MRMediaRemoteGetNowPlayingClientForOrigin((uint64_t)v3, queue, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __55__MRNowPlayingAudioFormatController_updateActiveClient__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  id WeakRetained;
  id v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _MRLogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v9 = 138543874;
    v10 = objc_opt_class();
    v11 = 2114;
    v12 = v5;
    v13 = 2114;
    v14 = a3;
    _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ active client changed: %{public}@ %{public}@", (uint8_t *)&v9, 0x20u);

  }
  v8 = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v8, "setActiveClient:", v5);

}

- (id)firstContentInfoMatchingSet:(id)a3 contentInfos:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v6;
    v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v11, "bundleID", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v5, "containsObject:", v12);

          if ((v13 & 1) != 0)
          {
            v8 = v11;
            goto LABEL_12;
          }
        }
        v8 = (id)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)firstEligibleContentInfoFor:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = a3;
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v7, "isEligibleForSpatialization", (_QWORD)v9) & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

void __54__MRNowPlayingAudioFormatController_faceTimeBundleSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E3143BC0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)faceTimeBundleSet___set;
  faceTimeBundleSet___set = v0;

}

- (void)updateDeprecatedApplication
{
  void *v3;
  void *v4;
  id v5;

  -[MRNowPlayingAudioFormatController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MRNowPlayingAudioFormatController bundleID](self, "bundleID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRNowPlayingAudioFormatController displayName](self, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nowPlayingAudioFormatController:didChangeBundleID:displayName:", self, v3, v4);

  }
}

- (NSString)bundleID
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[MRNowPlayingAudioFormatApplication bundleID](self->_audioFormatApplication, "bundleID");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E30D5AF8;
  v4 = v2;

  return v4;
}

- (NSString)displayName
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[MRNowPlayingAudioFormatApplication displayName](self->_audioFormatApplication, "displayName");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E30D5AF8;
  v4 = v2;

  return v4;
}

- (BOOL)hasNowPlayingApp
{
  return self->_audioFormatApplication != 0;
}

- (BOOL)isMultichannel
{
  return -[MRNowPlayingAudioFormatContentInfo isMultichannel](self->_audioFormatContentInfo, "isMultichannel");
}

- (NSString)audioFormatDescription
{
  return -[MRNowPlayingAudioFormatContentInfo audioFormatDescription](self->_audioFormatContentInfo, "audioFormatDescription");
}

- (NSString)bestAvailableAudioFormatDescription
{
  return -[MRNowPlayingAudioFormatContentInfo bestAvailableAudioFormatDescription](self->_audioFormatContentInfo, "bestAvailableAudioFormatDescription");
}

- (BOOL)isEligibleForSpatialization
{
  return -[MRNowPlayingAudioFormatContentInfo isEligibleForSpatialization](self->_audioFormatContentInfo, "isEligibleForSpatialization");
}

- (int64_t)bestAvailableAudioFormat
{
  return -[MRNowPlayingAudioFormatContentInfo bestAvailableAudioFormat](self->_audioFormatContentInfo, "bestAvailableAudioFormat");
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)contentInfos
{
  return self->_contentInfos;
}

- (MRClient)activeClient
{
  return self->_activeClient;
}

- (FBSDisplayLayoutMonitor)layoutMonitor
{
  return self->_layoutMonitor;
}

- (void)setLayoutMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_layoutMonitor, a3);
}

- (NSString)foregroundBundleID
{
  return self->_foregroundBundleID;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_foregroundBundleID, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_activeClient, 0);
  objc_storeStrong((id *)&self->_contentInfos, 0);
  objc_storeStrong((id *)&self->_audioFormatContentInfo, 0);
  objc_storeStrong((id *)&self->_audioFormatApplication, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)displayNameForBundleID:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 138543618;
  v6 = objc_opt_class();
  v7 = 2114;
  v8 = a2;
  _os_log_error_impl(&dword_193827000, a3, OS_LOG_TYPE_ERROR, "%{public}@ error retreiving application record: %{public}@", (uint8_t *)&v5, 0x16u);
}

@end
