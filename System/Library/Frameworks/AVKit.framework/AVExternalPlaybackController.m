@implementation AVExternalPlaybackController

- (void)willBeginPlaybackWithCompletionHandler:(id)a3
{
  -[AVExternalPlaybackController willBeginPlaybackFromAppWithBundleID:completionHandler:](self, "willBeginPlaybackFromAppWithBundleID:completionHandler:", 0, a3);
}

- (void)willBeginPlaybackFromAppWithBundleID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  uint64_t v23;
  objc_class *v24;
  id v25;
  void *v26;
  objc_class *v27;
  MPMediaControls *v28;
  MPMediaControls *mediaControls;
  MPMediaControls *v30;
  NSObject *v31;
  void *v32;
  id clientCompletionHandler;
  NSObject *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE buf[24];
  void *v50;
  uint64_t *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasRouteSharingPolicyLongFormVideo:", v6);

  _AVLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[AVExternalPlaybackController willBeginPlaybackFromAppWithBundleID:completionHandler:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v10;
    _os_log_impl(&dword_1AC4B1000, v11, OS_LOG_TYPE_DEFAULT, "%s isLongFormVideoApp = %i", buf, 0x12u);
  }

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C8B360], "longFormVideoRoutingSessionManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentRoutingSession");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _AVLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v12, "prefersLikelyDestinationsOverCurrentRoutingSession");
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[AVExternalPlaybackController willBeginPlaybackFromAppWithBundleID:completionHandler:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v13;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v50) = v15;
      _os_log_impl(&dword_1AC4B1000, v14, OS_LOG_TYPE_DEFAULT, "%s Current routing session: %@, routingSessionManager.prefersLikelyDestinationsOverCurrentRoutingSession: %i", buf, 0x1Cu);
    }

    if (v13 && (objc_msgSend(v12, "prefersLikelyDestinationsOverCurrentRoutingSession") & 1) == 0)
    {
      objc_msgSend(v13, "destination");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "providesExternalVideoPlayback");

      v38 = v37;
      _AVLog();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        +[AVExternalPlaybackController externalPlaybackStateDescriptionForState:](AVExternalPlaybackController, "externalPlaybackStateDescriptionForState:", v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "-[AVExternalPlaybackController willBeginPlaybackFromAppWithBundleID:completionHandler:]";
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v40;
        _os_log_impl(&dword_1AC4B1000, v39, OS_LOG_TYPE_DEFAULT, "%s Using current routing session. Calling client completion handler with playbackState: %@", buf, 0x16u);

      }
      v7[2](v7, v38);
    }
    else
    {
      _AVLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "likelyExternalDestinations");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");
        objc_msgSend(v12, "likelyExternalDestinations");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "-[AVExternalPlaybackController willBeginPlaybackFromAppWithBundleID:completionHandler:]";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v18;
        *(_WORD *)&buf[22] = 2112;
        v50 = v19;
        _os_log_impl(&dword_1AC4B1000, v16, OS_LOG_TYPE_DEFAULT, "%s Not using current routing session. AVRoutingSessionManager has %lu likely external destinations: %@", buf, 0x20u);

      }
      objc_msgSend(v12, "likelyExternalDestinations");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count") == 0;

      if (v21)
      {
        _AVLog();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          +[AVExternalPlaybackController externalPlaybackStateDescriptionForState:](AVExternalPlaybackController, "externalPlaybackStateDescriptionForState:", 0);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[AVExternalPlaybackController willBeginPlaybackFromAppWithBundleID:completionHandler:]";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v42;
          _os_log_impl(&dword_1AC4B1000, v41, OS_LOG_TYPE_DEFAULT, "%s No likely external destinations. Calling client completion handler with playback state: %@", buf, 0x16u);

        }
        v7[2](v7, 0);
      }
      else
      {
        if (!self->_mediaControls)
        {
          v45 = 0;
          v46 = &v45;
          v47 = 0x2050000000;
          v22 = (void *)getMPMediaControlsConfigurationClass_softClass;
          v48 = getMPMediaControlsConfigurationClass_softClass;
          v23 = MEMORY[0x1E0C809B0];
          if (!getMPMediaControlsConfigurationClass_softClass)
          {
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __getMPMediaControlsConfigurationClass_block_invoke;
            v50 = &unk_1E5BB4748;
            v51 = &v45;
            __getMPMediaControlsConfigurationClass_block_invoke((uint64_t)buf);
            v22 = (void *)v46[3];
          }
          v24 = objc_retainAutorelease(v22);
          _Block_object_dispose(&v45, 8);
          v25 = objc_alloc_init(v24);
          objc_msgSend(v25, "setStyle:", 7);
          v45 = 0;
          v46 = &v45;
          v47 = 0x2050000000;
          v26 = (void *)getMPMediaControlsClass_softClass;
          v48 = getMPMediaControlsClass_softClass;
          if (!getMPMediaControlsClass_softClass)
          {
            *(_QWORD *)buf = v23;
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __getMPMediaControlsClass_block_invoke;
            v50 = &unk_1E5BB4748;
            v51 = &v45;
            __getMPMediaControlsClass_block_invoke((uint64_t)buf);
            v26 = (void *)v46[3];
          }
          v27 = objc_retainAutorelease(v26);
          _Block_object_dispose(&v45, 8);
          v28 = (MPMediaControls *)objc_msgSend([v27 alloc], "initWithConfiguration:", v25);
          mediaControls = self->_mediaControls;
          self->_mediaControls = v28;

          -[MPMediaControls startPrewarming](self->_mediaControls, "startPrewarming");
          objc_initWeak((id *)buf, self);
          v30 = self->_mediaControls;
          v43[0] = v23;
          v43[1] = 3221225472;
          v43[2] = __87__AVExternalPlaybackController_willBeginPlaybackFromAppWithBundleID_completionHandler___block_invoke;
          v43[3] = &unk_1E5BB2B88;
          objc_copyWeak(&v44, (id *)buf);
          -[MPMediaControls setDismissHandlerWithReason:](v30, "setDismissHandlerWithReason:", v43);
          objc_destroyWeak(&v44);
          objc_destroyWeak((id *)buf);

        }
        _AVLog();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "-[AVExternalPlaybackController willBeginPlaybackFromAppWithBundleID:completionHandler:]";
          _os_log_impl(&dword_1AC4B1000, v31, OS_LOG_TYPE_DEFAULT, "%s Showing medium confidence picker.", buf, 0xCu);
        }

        -[MPMediaControls present](self->_mediaControls, "present");
        v32 = (void *)objc_msgSend(v7, "copy");
        clientCompletionHandler = self->_clientCompletionHandler;
        self->_clientCompletionHandler = v32;

      }
    }

  }
  else
  {
    _AVLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      +[AVExternalPlaybackController externalPlaybackStateDescriptionForState:](AVExternalPlaybackController, "externalPlaybackStateDescriptionForState:", 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[AVExternalPlaybackController willBeginPlaybackFromAppWithBundleID:completionHandler:]";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v35;
      _os_log_impl(&dword_1AC4B1000, v34, OS_LOG_TYPE_DEFAULT, "%s Not a long-form video app. Calling client completion handler with playback state: %@", buf, 0x16u);

    }
    v7[2](v7, 0);
  }

}

- (void)_invokeClientCompletionHandlerWithPlaybackState:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  id clientCompletionHandler;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_clientCompletionHandler)
  {
    _AVLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      +[AVExternalPlaybackController externalPlaybackStateDescriptionForState:](AVExternalPlaybackController, "externalPlaybackStateDescriptionForState:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 136315394;
      v9 = "-[AVExternalPlaybackController _invokeClientCompletionHandlerWithPlaybackState:]";
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s Calling client completion handler with playbackState: %@", (uint8_t *)&v8, 0x16u);

    }
    (*((void (**)(void))self->_clientCompletionHandler + 2))();
    clientCompletionHandler = self->_clientCompletionHandler;
    self->_clientCompletionHandler = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientCompletionHandler, 0);
  objc_storeStrong((id *)&self->_mediaControls, 0);
}

void __87__AVExternalPlaybackController_willBeginPlaybackFromAppWithBundleID_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *WeakRetained;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[6];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a2)
    {
      if (a2 != 1)
      {
        v5 = 0;
        goto LABEL_21;
      }
      _AVLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[AVExternalPlaybackController willBeginPlaybackFromAppWithBundleID:completionHandler:]_block_invoke";
        _os_log_impl(&dword_1AC4B1000, v4, OS_LOG_TYPE_DEFAULT, "%s Medium confidence picker dismissed because MPMediaControlsDismissalReasonUserCancelled.", buf, 0xCu);
      }
      v5 = 2;
    }
    else
    {
      _AVLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v23 = "-[AVExternalPlaybackController willBeginPlaybackFromAppWithBundleID:completionHandler:]_block_invoke";
        _os_log_impl(&dword_1AC4B1000, v6, OS_LOG_TYPE_DEFAULT, "%s Medium confidence picker dismissed because MPMediaControlsDismissalReasonUnknown.", buf, 0xCu);
      }

      v7 = (void *)MEMORY[0x1E0C8B2A8];
      objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "routingContextUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "outputContextForID:", v9);
      v4 = objc_claimAutoreleasedReturnValue();

      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      -[NSObject outputDevices](v4, "outputDevices");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v18;
        v5 = 1;
LABEL_11:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "deviceType"))
            break;
          if (v12 == ++v14)
          {
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
            if (v12)
              goto LABEL_11;
            goto LABEL_17;
          }
        }
      }
      else
      {
LABEL_17:
        v5 = 0;
      }

    }
LABEL_21:
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __87__AVExternalPlaybackController_willBeginPlaybackFromAppWithBundleID_completionHandler___block_invoke_10;
    v16[3] = &unk_1E5BB4660;
    v16[4] = WeakRetained;
    v16[5] = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v16);
    v15 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;

  }
}

uint64_t __87__AVExternalPlaybackController_willBeginPlaybackFromAppWithBundleID_completionHandler___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invokeClientCompletionHandlerWithPlaybackState:", *(_QWORD *)(a1 + 40));
}

+ (id)externalPlaybackStateDescriptionForState:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return off_1E5BB2BC0[a3];
}

@end
