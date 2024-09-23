@implementation ANPlaybackManager

- (ANPlaybackManager)initWithEndpointID:(id)a3
{
  id v5;
  ANPlaybackManager *v6;
  ANPlaybackManager *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *playbackQueue;
  uint64_t v11;
  NSMutableDictionary *playbackInfo;
  uint64_t v13;
  OS_os_log *log;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ANPlaybackManager;
  v6 = -[ANPlaybackManager init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpointID, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.announce.playbackQueue", v8);
    playbackQueue = v7->_playbackQueue;
    v7->_playbackQueue = (OS_dispatch_queue *)v9;

    v11 = objc_opt_new();
    playbackInfo = v7->_playbackInfo;
    v7->_playbackInfo = (NSMutableDictionary *)v11;

    ANLogBuildCategoryName();
    ANLogWithCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    log = v7->_log;
    v7->_log = (OS_os_log *)v13;

  }
  return v7;
}

+ (id)managerWithEndpointID:(id)a3
{
  id v3;
  ANPlaybackManager *v4;

  v3 = a3;
  v4 = -[ANPlaybackManager initWithEndpointID:]([ANPlaybackManager alloc], "initWithEndpointID:", v3);

  return v4;
}

- (void)performPlaybackCommand:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[ANPlaybackManager playbackQueue](self, "playbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__ANPlaybackManager_performPlaybackCommand_completionHandler___block_invoke;
  v11[3] = &unk_1E938FBD8;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __62__ANPlaybackManager_performPlaybackCommand_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v26 = v4;
    _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_DEFAULT, "Performing Playback Command: %@", buf, 0xCu);
  }

  switch(objc_msgSend(*(id *)(a1 + 32), "operation"))
  {
    case 0:
      objc_msgSend(*(id *)(a1 + 32), "announcementIdentifiers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(WeakRetained, "_playAnnouncementsWithIDs:options:completionHandler:", v5, objc_msgSend(*(id *)(a1 + 32), "options"), *(_QWORD *)(a1 + 40));

      if (v6)
      {
        objc_msgSend(WeakRetained, "announcementsToPlay");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(WeakRetained, "endpointID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          +[ANAnalyticsContext contextWithEndpointID:](ANAnalyticsContext, "contextWithEndpointID:", v9);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          +[ANAnalytics shared](ANAnalytics, "shared");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "creationTimestamp");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "timeIntervalSinceDate:", v12);
          v14 = v13;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "playbackDeadline");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "timeIntervalSinceDate:", v16);
          v18 = v17;
          v19 = (void *)MEMORY[0x1E0CF7DF8];
          objc_msgSend(*(id *)(a1 + 32), "clientIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v19, "sourceFromString:", v20);
          objc_msgSend(WeakRetained, "announcementsToPlay");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "announcementPlayed:withTime:deadlineViolation:playbackSource:ofGroupCount:context:", v8, v21, objc_msgSend(v22, "count"), v24, v14, v18);

        }
        goto LABEL_8;
      }
      break;
    case 1:
      objc_msgSend(WeakRetained, "_stopPlayingAnnouncementsWithCompletionHandler:", *(_QWORD *)(a1 + 40));
      break;
    case 2:
      objc_msgSend(WeakRetained, "_nextAnnouncementWithCompletionHandler:", *(_QWORD *)(a1 + 40));
      break;
    case 3:
      objc_msgSend(WeakRetained, "_previousAnnouncementWithCompletionHandler:", *(_QWORD *)(a1 + 40));
      break;
    default:
      v23 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 1050, *MEMORY[0x1E0CF7C60]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v23 + 16))(v23, v8);
LABEL_8:

      break;
  }

}

- (void)updatePlaybackForAnnouncementID:(id)a3 options:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  -[ANPlaybackManager playbackQueue](self, "playbackQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__ANPlaybackManager_updatePlaybackForAnnouncementID_options___block_invoke;
  block[3] = &unk_1E938F6B8;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

uint64_t __61__ANPlaybackManager_updatePlaybackForAnnouncementID_options___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updatePlaybackInfoForAnnouncementID:options:player:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

- (NSDictionary)lastPlayedAnnouncementInfo
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[ANPlaybackManager playbackQueue](self, "playbackQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v3);

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__3;
  v12 = __Block_byref_object_dispose__3;
  v13 = 0;
  -[ANPlaybackManager playbackQueue](self, "playbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__ANPlaybackManager_lastPlayedAnnouncementInfo__block_invoke;
  v7[3] = &unk_1E938FC00;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSDictionary *)v5;
}

void __47__ANPlaybackManager_lastPlayedAnnouncementInfo__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "playbackInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (unint64_t)playbackState
{
  void *v2;
  unint64_t v3;

  -[ANPlaybackManager audioPlayer](self, "audioPlayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "playbackState");

  return v3;
}

- (unint64_t)playbackItemCount
{
  void *v2;
  unint64_t v3;

  -[ANPlaybackManager announcementsToPlay](self, "announcementsToPlay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)_updatePlaybackInfoForAnnouncementID:(id)a3 options:(unint64_t)a4 player:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint8_t buf[4];
  id v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[ANPlaybackManager playbackQueue](self, "playbackQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[ANPlaybackManager log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4 & 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v59 = v8;
    v60 = 2112;
    v61 = v12;
    _os_log_impl(&dword_1D23A0000, v11, OS_LOG_TYPE_DEFAULT, "Updating Playback Info with Announcement ID = %@, Playing = %@", buf, 0x16u);

  }
  -[ANPlaybackManager log](self, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[ANPlaybackManager playbackInfo](self, "playbackInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v59 = v14;
    _os_log_impl(&dword_1D23A0000, v13, OS_LOG_TYPE_DEFAULT, "[BEFORE] Playback Info: %@", buf, 0xCu);

  }
  if ((a4 & 1) == 0)
  {
    -[ANPlaybackManager playbackInfo](self, "playbackInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0CF7A30];
    objc_msgSend(v15, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7A30]);
    v17 = objc_claimAutoreleasedReturnValue();

    -[ANPlaybackManager playbackInfo](self, "playbackInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x1E0CF7A10];
    objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CF7A10]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v21 = -[NSObject BOOLValue](v17, "BOOLValue");
      if (v8)
      {
        if (!v21 && v20 && objc_msgSend(v20, "isEqualToString:", v8))
        {
          -[ANPlaybackManager log](self, "log");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v59 = v8;
            _os_log_impl(&dword_1D23A0000, v22, OS_LOG_TYPE_DEFAULT, "Ignoring dupe stop update for Announcement %@", buf, 0xCu);
          }

          goto LABEL_39;
        }
      }
    }
    -[ANPlaybackManager playbackInfo](self, "playbackInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", &unk_1E939CD98, v16);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", mach_absolute_time());
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANPlaybackManager playbackInfo](self, "playbackInfo");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, *MEMORY[0x1E0CF7A28]);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANPlaybackManager playbackInfo](self, "playbackInfo");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0CF7A20]);

    if (v9)
    {
      v36 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(v9, "queuePlayer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v37)
      {
        objc_msgSend(v37, "currentTime");
      }
      else
      {
        v52 = 0;
        v53 = 0;
        v54 = 0;
      }
      objc_msgSend(v36, "valueWithCMTime:", &v52);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[ANPlaybackManager playbackInfo](self, "playbackInfo");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v39, *MEMORY[0x1E0CF7A18]);

    }
    if (!v8)
      goto LABEL_31;
    goto LABEL_30;
  }
  if (v8)
  {
    -[ANPlaybackManager playbackInfo](self, "playbackInfo");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", &unk_1E939CD80, *MEMORY[0x1E0CF7A30]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", mach_absolute_time());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANPlaybackManager playbackInfo](self, "playbackInfo");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CF7A48]);

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANPlaybackManager playbackInfo](self, "playbackInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0CF7A40]);

    if (v9)
    {
      v28 = (void *)MEMORY[0x1E0CB3B18];
      objc_msgSend(v9, "queuePlayer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29)
      {
        objc_msgSend(v29, "currentTime");
      }
      else
      {
        v55 = 0;
        v56 = 0;
        v57 = 0;
      }
      objc_msgSend(v28, "valueWithCMTime:", &v55);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[ANPlaybackManager playbackInfo](self, "playbackInfo");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setObject:forKeyedSubscript:", v41, *MEMORY[0x1E0CF7A38]);

    }
    -[ANPlaybackManager playbackInfo](self, "playbackInfo");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CF7A28]);

    -[ANPlaybackManager playbackInfo](self, "playbackInfo");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CF7A20]);

    -[ANPlaybackManager playbackInfo](self, "playbackInfo");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0CF7A18]);

    v19 = *MEMORY[0x1E0CF7A10];
LABEL_30:
    -[ANPlaybackManager playbackInfo](self, "playbackInfo", v52, v53, v54, v55, v56, v57);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setObject:forKeyedSubscript:", v8, v19);

LABEL_31:
    -[ANPlaybackManager playbackInfo](self, "playbackInfo", v52, v53, v54);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectForKeyedSubscript:", v19);
    v17 = objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[ANPlaybackManager delegate](self, "delegate");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v48;
      if ((a4 & 1) != 0)
        objc_msgSend(v48, "playbackManager:didStartPlayingAnnouncement:", self, v17);
      else
        objc_msgSend(v48, "playbackManager:didFinishPlayingAnnouncement:withOptions:", self, v17, a4);

    }
    -[ANPlaybackManager log](self, "log");
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      -[ANPlaybackManager playbackInfo](self, "playbackInfo");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v59 = v51;
      _os_log_impl(&dword_1D23A0000, v50, OS_LOG_TYPE_DEFAULT, "[AFTER] Playback Info: %@", buf, 0xCu);

    }
    goto LABEL_39;
  }
  -[ANPlaybackManager log](self, "log");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[ANPlaybackManager _updatePlaybackInfoForAnnouncementID:options:player:].cold.1(v17);
LABEL_39:

}

- (void)_stopPlayingAnnouncementsWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = (void (**)(id, _QWORD))a3;
  -[ANPlaybackManager log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "Stopping Playback", v8, 2u);
  }

  -[ANPlaybackManager _stopAudioPlayer](self, "_stopAudioPlayer");
  objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 1037, *MEMORY[0x1E0CF7C60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANPlaybackManager audioPlayer](self, "audioPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANPlaybackManager _handlePlaybackEndedForPlayer:withError:](self, "_handlePlaybackEndedForPlayer:withError:", v7, v6);

  v4[2](v4, 0);
}

- (void)_nextAnnouncementWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[ANPlaybackManager log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315138;
    v19 = "-[ANPlaybackManager _nextAnnouncementWithCompletionHandler:]";
    _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v18, 0xCu);
  }

  -[ANPlaybackManager audioPlayer](self, "audioPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "playbackState");

  if (v7 == 1)
  {
    -[ANPlaybackManager audioPlayer](self, "audioPlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "numberActiveTracks");

    if (v9 > 1)
    {
      -[ANPlaybackManager audioPlayer](self, "audioPlayer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "nextWithCompletionHandler:", v4);
      goto LABEL_9;
    }
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CF7C60];
    v12 = 1021;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CF7C60];
    v12 = 1020;
  }
  objc_msgSend(v10, "an_errorWithCode:component:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v13);
  +[ANAnalytics shared](ANAnalytics, "shared");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "code");
  -[ANPlaybackManager endpointID](self, "endpointID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[ANAnalyticsContext contextWithEndpointID:](ANAnalyticsContext, "contextWithEndpointID:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "error:context:", v15, v17);

LABEL_9:
}

- (void)_previousAnnouncementWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *);
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[ANPlaybackManager log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315138;
    v14 = "-[ANPlaybackManager _previousAnnouncementWithCompletionHandler:]";
    _os_log_impl(&dword_1D23A0000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v13, 0xCu);
  }

  -[ANPlaybackManager audioPlayer](self, "audioPlayer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "playbackState");

  if (v7 == 1)
  {
    -[ANPlaybackManager audioPlayer](self, "audioPlayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "previousWithCompletionHandler:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 1020, *MEMORY[0x1E0CF7C60]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v8);
    +[ANAnalytics shared](ANAnalytics, "shared");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "code");
    -[ANPlaybackManager endpointID](self, "endpointID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[ANAnalyticsContext contextWithEndpointID:](ANAnalyticsContext, "contextWithEndpointID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "error:context:", v10, v12);

  }
}

- (BOOL)_playAnnouncements:(id)a3 announceIDToStart:(id)a4 options:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  BOOL v33;
  NSObject *v34;
  void *v35;
  void *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t v42[128];
  uint8_t buf[4];
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD))a6;
  -[ANPlaybackManager audioPlayer](self, "audioPlayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "playbackState");

  if (v14)
  {
    -[ANPlaybackManager log](self, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      v44 = v14;
      _os_log_impl(&dword_1D23A0000, v15, OS_LOG_TYPE_DEFAULT, "Already playing. Current playback state = %{public}lu. Stopping before proceeding.", buf, 0xCu);
    }

    -[ANPlaybackManager _stopAudioPlayer](self, "_stopAudioPlayer");
    -[ANPlaybackManager audioPlayer](self, "audioPlayer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANPlaybackManager _handlePlaybackEndedForPlayer:withError:](self, "_handlePlaybackEndedForPlayer:withError:", v16, 0);

  }
  self->_playbackOptions = a5;
  -[ANPlaybackManager setLastAnnoucementIndex:](self, "setLastAnnoucementIndex:", 0);
  -[ANPlaybackManager dataSource](self, "dataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cleanUpOldAnnouncementsForPlaybackManager:", self);

  v18 = objc_alloc(MEMORY[0x1E0C99E10]);
  -[ANPlaybackManager _announcementsForPlaybackOptions:fromAnnouncements:](self, "_announcementsForPlaybackOptions:fromAnnouncements:", a5, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithArray:", v19);
  -[ANPlaybackManager setAnnouncementsToPlay:](self, "setAnnouncementsToPlay:", v20);

  if (v11)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    -[ANPlaybackManager announcementsToPlay](self, "announcementsToPlay", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v39;
LABEL_8:
      v25 = 0;
      while (1)
      {
        if (*(_QWORD *)v39 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v25), "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEqual:", v11);

        if ((v27 & 1) != 0)
          break;
        -[ANPlaybackManager setLastAnnoucementIndex:](self, "setLastAnnoucementIndex:", -[ANPlaybackManager lastAnnoucementIndex](self, "lastAnnoucementIndex") + 1);
        if (v23 == ++v25)
        {
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
          if (v23)
            goto LABEL_8;
          break;
        }
      }
    }

    v28 = -[ANPlaybackManager lastAnnoucementIndex](self, "lastAnnoucementIndex");
    -[ANPlaybackManager announcementsToPlay](self, "announcementsToPlay");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count");

    if (v28 >= v30)
      -[ANPlaybackManager setLastAnnoucementIndex:](self, "setLastAnnoucementIndex:", 0);
  }
  -[ANPlaybackManager announcementsToPlay](self, "announcementsToPlay");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v32)
  {
    -[ANPlaybackManager setPlaybackCompletionHandler:](self, "setPlaybackCompletionHandler:", v12);
    v33 = -[ANPlaybackManager _startPlayingAnnouncements](self, "_startPlayingAnnouncements");
  }
  else
  {
    -[ANPlaybackManager log](self, "log");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D23A0000, v34, OS_LOG_TYPE_DEFAULT, "Received playback request but there is nothing to play. Not returning error.", buf, 2u);
    }

    -[ANPlaybackManager setAnnouncementsToPlay:](self, "setAnnouncementsToPlay:", 0);
    v12[2](v12, 0);
    -[ANPlaybackManager delegate](self, "delegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANPlaybackManager audioPlayer](self, "audioPlayer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "playbackManager:didUpdatePlaybackState:announcement:", self, objc_msgSend(v36, "playbackState"), 0);

    v33 = 0;
  }

  return v33;
}

- (BOOL)_playAnnouncementsWithIDs:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANPlaybackManager log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315650;
    v19 = "-[ANPlaybackManager _playAnnouncementsWithIDs:options:completionHandler:]";
    v20 = 2112;
    v21 = v10;
    v22 = 2048;
    v23 = a4;
    _os_log_impl(&dword_1D23A0000, v11, OS_LOG_TYPE_DEFAULT, "%s: announceIDToStart %@, options %ld", (uint8_t *)&v18, 0x20u);
  }

  v12 = objc_msgSend(v8, "count");
  -[ANPlaybackManager dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
    objc_msgSend(v13, "playbackManager:announcementsForIdentifiers:", self, v8);
  else
    objc_msgSend(v13, "announcementsForPlaybackManager:", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[ANPlaybackManager _playAnnouncements:announceIDToStart:options:completionHandler:](self, "_playAnnouncements:announceIDToStart:options:completionHandler:", v15, v10, a4, v9);
  return v16;
}

- (id)_announcementsForPlaybackOptions:(unint64_t)a3 fromAnnouncements:(id)a4
{
  char v4;
  char v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = ~(_BYTE)a3;
  v6 = a4;
  v7 = v6;
  if ((v5 & 0xC0) == 0)
    goto LABEL_2;
  if (v4 < 0)
  {
    objc_msgSend(v6, "unplayedAnnouncements");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if ((v4 & 0x40) != 0)
  {
    objc_msgSend(v6, "playedAnnouncements");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_2:
    v8 = v6;
  }
LABEL_7:
  v9 = v8;

  return v9;
}

- (id)_nextAnnouncementToPlay
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  char v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  NSObject *v37;
  int64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  unint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if ((-[ANPlaybackManager playbackOptions](self, "playbackOptions") & 0x20) != 0)
  {
    -[ANPlaybackManager log](self, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_DEFAULT, "Checking for new announcements to play", buf, 2u);
    }

    -[ANPlaybackManager dataSource](self, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "announcementsForPlaybackManager:", self);
    v5 = objc_claimAutoreleasedReturnValue();

    v43 = (void *)v5;
    -[ANPlaybackManager _announcementsForPlaybackOptions:fromAnnouncements:](self, "_announcementsForPlaybackOptions:fromAnnouncements:", -[ANPlaybackManager playbackOptions](self, "playbackOptions"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANPlaybackManager log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = -[ANPlaybackManager playbackOptions](self, "playbackOptions");
      v9 = objc_msgSend(v6, "count");
      *(_DWORD *)buf = 134218240;
      v49 = v8;
      v50 = 2048;
      v51 = v9;
      _os_log_impl(&dword_1D23A0000, v7, OS_LOG_TYPE_DEFAULT, "Current Announcements in Storage for Playback Options (%lu): %lu", buf, 0x16u);
    }

    -[ANPlaybackManager log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[ANPlaybackManager announcementsToPlay](self, "announcementsToPlay");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      *(_DWORD *)buf = 134217984;
      v49 = v12;
      _os_log_impl(&dword_1D23A0000, v10, OS_LOG_TYPE_DEFAULT, "Current Announcements in Playback Queue: = %lu", buf, 0xCu);

    }
    -[ANPlaybackManager announcementsToPlay](self, "announcementsToPlay");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v15 = v6;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v45 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v14, "receiptTimestamp");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "timeIntervalSince1970");
          v23 = v22;
          objc_msgSend(v20, "receiptTimestamp");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "timeIntervalSince1970");
          v26 = v25;

          if (v23 <= v26)
          {
            -[ANPlaybackManager announcementsToPlay](self, "announcementsToPlay");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "containsObject:", v20);

            if ((v28 & 1) == 0)
            {
              -[ANPlaybackManager announcementsToPlay](self, "announcementsToPlay");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "addObject:", v20);

              -[ANPlaybackManager log](self, "log");
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v20, "identifier");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v49 = (unint64_t)v31;
                _os_log_impl(&dword_1D23A0000, v30, OS_LOG_TYPE_DEFAULT, "Added Announcement to Play Queue: %@", buf, 0xCu);

              }
            }
          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
      }
      while (v17);
    }

  }
  -[ANPlaybackManager announcementsToPlay](self, "announcementsToPlay");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    -[ANPlaybackManager announcementsToPlay](self, "announcementsToPlay");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "count");
    v35 = -[ANPlaybackManager lastAnnoucementIndex](self, "lastAnnoucementIndex");

    if (v34 <= v35)
    {
      v32 = 0;
    }
    else
    {
      -[ANPlaybackManager announcementsToPlay](self, "announcementsToPlay");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectAtIndex:", -[ANPlaybackManager lastAnnoucementIndex](self, "lastAnnoucementIndex"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      -[ANPlaybackManager log](self, "log");
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        v38 = -[ANPlaybackManager lastAnnoucementIndex](self, "lastAnnoucementIndex") + 1;
        -[ANPlaybackManager announcementsToPlay](self, "announcementsToPlay");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "count");
        objc_msgSend(v32, "identifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v49 = v38;
        v50 = 2048;
        v51 = v40;
        v52 = 2112;
        v53 = v41;
        _os_log_impl(&dword_1D23A0000, v37, OS_LOG_TYPE_DEFAULT, "Next Announcement To Play (%ld of %ld): %@", buf, 0x20u);

      }
      -[ANPlaybackManager setLastAnnoucementIndex:](self, "setLastAnnoucementIndex:", -[ANPlaybackManager lastAnnoucementIndex](self, "lastAnnoucementIndex") + 1);
    }
  }
  return v32;
}

- (id)_createTrackPlayerWithAnnouncement:(id)a3 options:(unint64_t)a4 anchorPoint:(unint64_t *)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  ANSimpleTrackPlayer *v11;
  void *v12;
  ANSimpleTrackPlayer *v13;
  ANAnchorTrackPlayer *v14;
  void *v15;
  ANAnchorTrackPlayer *v16;
  unint64_t v17;
  OpaqueCMClock *HostTimeClock;
  CMTimeValue v19;
  CMTimeValue v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  Float64 v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  CMTime v57;
  CMTime rhs;
  CMTime time2;
  CMTime v60;
  CMTime time1;
  CMTime buf;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(v8, "playbackDeadline");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANPlaybackManager log](self, "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.value) = 138412290;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v9;
    _os_log_impl(&dword_1D23A0000, v10, OS_LOG_TYPE_DEFAULT, "PlaybackDeadline: %@", (uint8_t *)&buf, 0xCu);
  }

  if ((a4 & 0x10) != 0)
  {
    v14 = [ANAnchorTrackPlayer alloc];
    -[ANPlaybackManager endpointID](self, "endpointID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[ANTrackPlayer initWithOptions:endpointUUID:](v14, "initWithOptions:endpointUUID:", a4, v15);

    v13 = v16;
    memset(&buf, 0, sizeof(buf));
    if (v8)
      objc_msgSend(v8, "cmStartTime");
    v17 = objc_msgSend(v8, "machStartTime");
    if ((a4 & 4) != 0)
    {
      memset(&v60, 0, sizeof(v60));
      HostTimeClock = CMClockGetHostTimeClock();
      CMClockGetTime(&v60, HostTimeClock);
      time1 = v60;
      time2 = buf;
      if (CMTimeCompare(&time1, &time2) == 1)
      {
        objc_msgSend(MEMORY[0x1E0CF7E98], "machTimeToSeconds:", v17);
        v20 = v19;
        if ((objc_msgSend(v8, "statusFlags") & 3) == 0)
        {
          -[ANPlaybackManager log](self, "log");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(MEMORY[0x1E0CF7E98], "machTimeToSeconds:", mach_absolute_time());
            LODWORD(time1.value) = 134218240;
            *(CMTimeValue *)((char *)&time1.value + 4) = v20;
            LOWORD(time1.flags) = 2048;
            *(_QWORD *)((char *)&time1.flags + 2) = v22;
            _os_log_impl(&dword_1D23A0000, v21, OS_LOG_TYPE_DEFAULT, "Announcement will play in the past: %f, now: %f", (uint8_t *)&time1, 0x16u);
          }

          +[ANAnalytics shared](ANAnalytics, "shared");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[ANPlaybackManager endpointID](self, "endpointID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[ANAnalyticsContext contextWithEndpointID:](ANAnalyticsContext, "contextWithEndpointID:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "error:context:", 5003, v25);

        }
        objc_msgSend(MEMORY[0x1E0CF7E98], "machTimeToSeconds:", mach_absolute_time());
        v27 = v26;
        objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "numberForDefault:", *MEMORY[0x1E0CF7AD0]);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "doubleValue");
        v31 = v30;

        CMTimeMakeWithSeconds(&rhs, v31, v60.timescale);
        time2 = v60;
        CMTimeAdd(&time1, &time2, &rhs);
        buf = time1;
        v17 = objc_msgSend(MEMORY[0x1E0CF7E98], "secondsToMachTime:", v27 + v31);
        -[ANPlaybackManager log](self, "log");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(time1.value) = 134218240;
          *(CMTimeValue *)((char *)&time1.value + 4) = buf.value / buf.timescale;
          LOWORD(time1.flags) = 2048;
          *(_QWORD *)((char *)&time1.flags + 2) = v17;
          _os_log_impl(&dword_1D23A0000, v32, OS_LOG_TYPE_DEFAULT, "Updated CM Start Time = %lld, Mach Start Time = %llu", (uint8_t *)&time1, 0x16u);
        }

      }
    }
    v57 = buf;
    -[ANSimpleTrackPlayer setStartTime:](v13, "setStartTime:", &v57);
    *a5 = v17;

  }
  else
  {
    v11 = [ANSimpleTrackPlayer alloc];
    -[ANPlaybackManager endpointID](self, "endpointID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ANTrackPlayer initWithOptions:endpointUUID:](v11, "initWithOptions:endpointUUID:", a4, v12);

    *a5 = mach_absolute_time();
  }
  -[ANTrackPlayer setDelegate:](v13, "setDelegate:", self);
  -[ANPlaybackManager playbackQueue](self, "playbackQueue");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANTrackPlayer setDelegateQueue:](v13, "setDelegateQueue:", v33);

  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "numberForDefault:", *MEMORY[0x1E0CF7AE8]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "doubleValue");
  -[ANTrackPlayer setSilenceBetweenEachTrack:](v13, "setSilenceBetweenEachTrack:", v36 / 1000.0);

  if ((a4 & 2) != 0)
  {
    v37 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "pathForResource:ofType:", CFSTR("AnnounceNotification"), CFSTR("wav"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "fileURLWithPath:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANTrackPlayer setAudioFileAtStart:](v13, "setAudioFileAtStart:", v40);

    objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "numberForDefault:", *MEMORY[0x1E0CF7AF0]);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "doubleValue");
    v44 = v43;

    -[ANTrackPlayer setTrimStartTone:](v13, "setTrimStartTone:", v44);
  }
  if ((a4 & 8) == 0)
  {
    v45 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "pathForResource:ofType:", CFSTR("AnnounceInBetween"), CFSTR("wav"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "fileURLWithPath:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANTrackPlayer setAudioFileTransition:](v13, "setAudioFileTransition:", v48);

    objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "numberForDefault:", *MEMORY[0x1E0CF7B00]);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "doubleValue");
    v52 = v51;

    -[ANTrackPlayer setTrimTransitionTone:](v13, "setTrimTransitionTone:", v52);
  }
  objc_msgSend(MEMORY[0x1E0CF7E30], "sharedInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "numberForDefault:", *MEMORY[0x1E0CF7AD8]);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "doubleValue");
  -[ANTrackPlayer setPreviousSkipGoesToPreviousTrackDelta:](v13, "setPreviousSkipGoesToPreviousTrackDelta:", v55 / 1000.0);

  return v13;
}

- (BOOL)_startPlayingAnnouncements
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v40;
  _QWORD v41[6];
  uint64_t v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[ANPlaybackManager log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[ANPlaybackManager announcementsToPlay](self, "announcementsToPlay");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    v6 = v5 - -[ANPlaybackManager lastAnnoucementIndex](self, "lastAnnoucementIndex");
    -[ANPlaybackManager announcementsToPlay](self, "announcementsToPlay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218240;
    v44 = v6;
    v45 = 2048;
    v46 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1D23A0000, v3, OS_LOG_TYPE_DEFAULT, "Will Play (%ld of %ld) Announcements", buf, 0x16u);

  }
  -[ANPlaybackManager _nextAnnouncementToPlay](self, "_nextAnnouncementToPlay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[ANPlaybackManager endpointID](self, "endpointID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "an_isLocalDevice");

    if (v10)
    {
      v11 = -[ANPlaybackManager playbackOptions](self, "playbackOptions") & 2;
      v12 = v11 & 0xFFFFFFFFFFFFFFFELL | (-[ANPlaybackManager playbackOptions](self, "playbackOptions") >> 8) & 1;
      objc_msgSend(MEMORY[0x1E0CF7EA0], "sharedController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setVolumeWithOptions:", v12);

    }
    v42 = 0;
    -[ANPlaybackManager _createTrackPlayerWithAnnouncement:options:anchorPoint:](self, "_createTrackPlayerWithAnnouncement:options:anchorPoint:", v8, -[ANPlaybackManager playbackOptions](self, "playbackOptions"), &v42);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANPlaybackManager setAudioPlayer:](self, "setAudioPlayer:", v14);

    v15 = v8;
    *(_QWORD *)&v16 = 138412546;
    v40 = v16;
    while (1)
    {
      objc_msgSend(v15, "filePath", v40);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17 != 0;
      if (!v17)
        break;
      v19 = (void *)v17;
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        objc_msgSend(v20, "audioDuration");
        if (v22 == 0.0)
        {
          v23 = *(_QWORD *)&v22;
          -[ANPlaybackManager log](self, "log");
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v40;
            v44 = (uint64_t)v21;
            v45 = 2048;
            v46 = v23;
            _os_log_error_impl(&dword_1D23A0000, v24, OS_LOG_TYPE_ERROR, "Adding empty audio file to player: %@, duration = %f seconds", buf, 0x16u);
          }

          +[ANAnalytics shared](ANAnalytics, "shared");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[ANPlaybackManager endpointID](self, "endpointID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          +[ANAnalyticsContext contextWithEndpointID:](ANAnalyticsContext, "contextWithEndpointID:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "error:context:", 5032, v27);

        }
      }
      -[ANPlaybackManager audioPlayer](self, "audioPlayer");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "filePath");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "add:announcementID:", v29, v30);

      -[ANPlaybackManager _nextAnnouncementToPlay](self, "_nextAnnouncementToPlay");
      v31 = objc_claimAutoreleasedReturnValue();

      v15 = (id)v31;
      if (!v31)
      {
        -[ANPlaybackManager audioPlayer](self, "audioPlayer");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __47__ANPlaybackManager__startPlayingAnnouncements__block_invoke;
        v41[3] = &unk_1E938FC28;
        v41[4] = self;
        v41[5] = v42;
        objc_msgSend(v15, "playWithCompletionHandler:", v41);
        goto LABEL_19;
      }
    }
    -[ANPlaybackManager log](self, "log");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[ANPlaybackManager _startPlayingAnnouncements].cold.1((uint64_t)v15, v33);

    +[ANAnalytics shared](ANAnalytics, "shared");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANPlaybackManager endpointID](self, "endpointID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[ANAnalyticsContext contextWithEndpointID:](ANAnalyticsContext, "contextWithEndpointID:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "error:context:", 5034, v36);

    -[ANPlaybackManager audioPlayer](self, "audioPlayer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 5034, *MEMORY[0x1E0CF7C60]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANPlaybackManager _handlePlaybackEndedForPlayer:withError:](self, "_handlePlaybackEndedForPlayer:withError:", v37, v38);

LABEL_19:
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 1022, *MEMORY[0x1E0CF7C60]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[ANPlaybackManager _handlePlaybackEndedForPlayer:withError:](self, "_handlePlaybackEndedForPlayer:withError:", 0, v32);

    v18 = 0;
  }

  return v18;
}

void __47__ANPlaybackManager__startPlayingAnnouncements__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "playbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__ANPlaybackManager__startPlayingAnnouncements__block_invoke_2;
  block[3] = &unk_1E938F6B8;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v5;
  v11 = v6;
  v7 = v3;
  dispatch_async(v4, block);

}

void __47__ANPlaybackManager__startPlayingAnnouncements__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "audioPlayer");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_handlePlaybackEndedForPlayer:withError:");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "playbackManager:didStartPlayingAnnouncementsAtMachAbsoluteTime:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

- (void)_stopAudioPlayer
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  NSObject *v8;

  -[ANPlaybackManager audioPlayer](self, "audioPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    -[ANPlaybackManager audioPlayer](self, "audioPlayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__ANPlaybackManager__stopAudioPlayer__block_invoke;
    v7[3] = &unk_1E938F9B0;
    v8 = v4;
    v6 = v4;
    objc_msgSend(v5, "stopWithCompletionHandler:", v7);

    dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __37__ANPlaybackManager__stopAudioPlayer__block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_handlePlaybackEndedForPlayer:(id)a3 withError:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  v6 = a3;
  -[ANPlaybackManager setAnnouncementsToPlay:](self, "setAnnouncementsToPlay:", 0);
  objc_msgSend(v6, "end");
  if (v17)
    v7 = 10;
  else
    v7 = 14;
  objc_msgSend(v6, "activelyPlayingAnnouncementID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANPlaybackManager _updatePlaybackInfoForAnnouncementID:options:player:](self, "_updatePlaybackInfoForAnnouncementID:options:player:", v8, v7, v6);

  if (v17)
  {
    v9 = v17;
    if (objc_msgSend(v17, "code") != 1037)
      goto LABEL_8;

  }
  v9 = 0;
LABEL_8:
  -[ANPlaybackManager playbackCompletionHandler](self, "playbackCompletionHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ANPlaybackManager playbackCompletionHandler](self, "playbackCompletionHandler");
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v9);

    -[ANPlaybackManager setPlaybackCompletionHandler:](self, "setPlaybackCompletionHandler:", 0);
  }
  if (v9)
  {
    +[ANAnalytics shared](ANAnalytics, "shared");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "code");
    -[ANPlaybackManager endpointID](self, "endpointID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[ANAnalyticsContext contextWithEndpointID:](ANAnalyticsContext, "contextWithEndpointID:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "error:context:", v13, v15);

  }
  -[ANPlaybackManager delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "playbackManagerDidFinishPlayingAnnouncements:", self);

}

- (void)trackPlayer:(id)a3 didUpdatePlaybackState:(unint64_t)a4 announcementID:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a3;
  -[ANPlaybackManager playbackQueue](self, "playbackQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[ANPlaybackManager log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134218242;
    v16 = a4;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_1D23A0000, v11, OS_LOG_TYPE_DEFAULT, "Did Update Playback State: %lu, AnnouncementID: %@", (uint8_t *)&v15, 0x16u);
  }

  -[ANPlaybackManager delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANPlaybackManager audioPlayer](self, "audioPlayer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "playbackManager:didUpdatePlaybackState:announcement:", self, objc_msgSend(v13, "playbackState"), v8);

  if (a4 == 1)
    v14 = 3;
  else
    v14 = 2;
  -[ANPlaybackManager _updatePlaybackInfoForAnnouncementID:options:player:](self, "_updatePlaybackInfoForAnnouncementID:options:player:", v8, v14, v9);

}

- (void)trackPlayer:(id)a3 didFinishPlayingTrackType:(int64_t)a4 announcementID:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  ANPlaybackManager *v18;
  id v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int v29;
  NSObject *v30;
  _BOOL4 v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  int v38;
  const char *v39;
  __int16 v40;
  int64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[ANPlaybackManager playbackQueue](self, "playbackQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  -[ANPlaybackManager log](self, "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v38 = 136315138;
    v39 = "-[ANPlaybackManager trackPlayer:didFinishPlayingTrackType:announcementID:error:]";
    _os_log_impl(&dword_1D23A0000, v14, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v38, 0xCu);
  }

  -[ANPlaybackManager audioPlayer](self, "audioPlayer");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15 == v10)
  {
    -[ANPlaybackManager log](self, "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v38 = 134218242;
      v39 = (const char *)a4;
      v40 = 2112;
      v41 = (int64_t)v11;
      _os_log_impl(&dword_1D23A0000, v16, OS_LOG_TYPE_DEFAULT, "Audio Player Finished Playing trackType: %ld, AnnouncementID: %@", (uint8_t *)&v38, 0x16u);
    }

    if (v12)
    {
      -[ANPlaybackManager log](self, "log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[ANPlaybackManager trackPlayer:didFinishPlayingTrackType:announcementID:error:].cold.1((uint64_t)v11, (uint64_t)v12, v17);

      -[ANPlaybackManager _stopAudioPlayer](self, "_stopAudioPlayer");
      v18 = self;
      v19 = v10;
      v20 = v12;
LABEL_10:
      -[ANPlaybackManager _handlePlaybackEndedForPlayer:withError:](v18, "_handlePlaybackEndedForPlayer:withError:", v19, v20);
      goto LABEL_11;
    }
    if ((-[ANPlaybackManager playbackOptions](self, "playbackOptions") & 0x20) != 0)
    {
      -[ANPlaybackManager log](self, "log");
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v38) = 0;
        _os_log_impl(&dword_1D23A0000, v21, OS_LOG_TYPE_DEFAULT, "Looking for new announcements", (uint8_t *)&v38, 2u);
      }

      -[ANPlaybackManager _nextAnnouncementToPlay](self, "_nextAnnouncementToPlay");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)v22;
        do
        {
          -[ANPlaybackManager audioPlayer](self, "audioPlayer");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "filePath");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "identifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "add:announcementID:", v25, v26);

          -[ANPlaybackManager _nextAnnouncementToPlay](self, "_nextAnnouncementToPlay");
          v27 = objc_claimAutoreleasedReturnValue();

          v23 = (void *)v27;
        }
        while (v27);
      }
    }
    -[ANPlaybackManager audioPlayer](self, "audioPlayer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "numberActiveTracks");

    if (!v29)
    {
      -[ANPlaybackManager log](self, "log");
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v38) = 0;
        _os_log_impl(&dword_1D23A0000, v32, OS_LOG_TYPE_DEFAULT, "Audio Player Finished, we are done!", (uint8_t *)&v38, 2u);
      }

      -[ANPlaybackManager _stopAudioPlayer](self, "_stopAudioPlayer");
      v18 = self;
      v19 = v10;
      v20 = 0;
      goto LABEL_10;
    }
    -[ANPlaybackManager log](self, "log");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (a4)
    {
      if (v31)
      {
        v38 = 136315394;
        v39 = "-[ANPlaybackManager trackPlayer:didFinishPlayingTrackType:announcementID:error:]";
        v40 = 2048;
        v41 = a4;
        _os_log_impl(&dword_1D23A0000, v30, OS_LOG_TYPE_DEFAULT, "%s: Ignoring track player of type %ld", (uint8_t *)&v38, 0x16u);
      }

    }
    else
    {
      if (v31)
      {
        v38 = 136315138;
        v39 = "-[ANPlaybackManager trackPlayer:didFinishPlayingTrackType:announcementID:error:]";
        _os_log_impl(&dword_1D23A0000, v30, OS_LOG_TYPE_DEFAULT, "%s: there are still outstanding players. Keep Announce active", (uint8_t *)&v38, 0xCu);
      }

      -[ANPlaybackManager _updatePlaybackInfoForAnnouncementID:options:player:](self, "_updatePlaybackInfoForAnnouncementID:options:player:", v11, 14, v10);
      -[ANPlaybackManager audioPlayer](self, "audioPlayer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "playbackState");

      if (v34)
      {
        -[ANPlaybackManager audioPlayer](self, "audioPlayer");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "activelyPlayingAnnouncementID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[ANPlaybackManager _updatePlaybackInfoForAnnouncementID:options:player:](self, "_updatePlaybackInfoForAnnouncementID:options:player:", v36, 3, v10);

      }
      else
      {
        ANLogHandlePlaybackManager();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = 138412290;
          v39 = &stru_1E93913D0;
          _os_log_impl(&dword_1D23A0000, v37, OS_LOG_TYPE_DEFAULT, "%@Audio Player is stopped. Not updating playback info.", (uint8_t *)&v38, 0xCu);
        }

      }
    }
  }
LABEL_11:

}

- (NSUUID)endpointID
{
  return self->_endpointID;
}

- (void)setEndpointID:(id)a3
{
  objc_storeStrong((id *)&self->_endpointID, a3);
}

- (ANPlaybackManagerDelegate)delegate
{
  return (ANPlaybackManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ANPlaybackManagerDataSource)dataSource
{
  return (ANPlaybackManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (ANTrackPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_audioPlayer, a3);
}

- (NSMutableDictionary)playbackInfo
{
  return self->_playbackInfo;
}

- (NSMutableOrderedSet)announcementsToPlay
{
  return self->_announcementsToPlay;
}

- (void)setAnnouncementsToPlay:(id)a3
{
  objc_storeStrong((id *)&self->_announcementsToPlay, a3);
}

- (int64_t)lastAnnoucementIndex
{
  return self->_lastAnnoucementIndex;
}

- (void)setLastAnnoucementIndex:(int64_t)a3
{
  self->_lastAnnoucementIndex = a3;
}

- (unint64_t)playbackOptions
{
  return self->_playbackOptions;
}

- (OS_dispatch_queue)playbackQueue
{
  return self->_playbackQueue;
}

- (id)playbackCompletionHandler
{
  return self->_playbackCompletionHandler;
}

- (void)setPlaybackCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong(&self->_playbackCompletionHandler, 0);
  objc_storeStrong((id *)&self->_playbackQueue, 0);
  objc_storeStrong((id *)&self->_announcementsToPlay, 0);
  objc_storeStrong((id *)&self->_playbackInfo, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_endpointID, 0);
}

- (void)_updatePlaybackInfoForAnnouncementID:(os_log_t)log options:player:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D23A0000, log, OS_LOG_TYPE_ERROR, "Announcement ID nil when updating state to playing", v1, 2u);
}

- (void)_startPlayingAnnouncements
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D23A0000, a2, OS_LOG_TYPE_ERROR, "Announcement does not contain a file path. Announcement: %@", (uint8_t *)&v2, 0xCu);
}

- (void)trackPlayer:(os_log_t)log didFinishPlayingTrackType:announcementID:error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1D23A0000, log, OS_LOG_TYPE_ERROR, "Audio Player Finished Playing with error. AnnouncementID = %@, Error = %@", (uint8_t *)&v3, 0x16u);
}

@end
