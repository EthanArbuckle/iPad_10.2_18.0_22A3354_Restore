@implementation _MPCQueueControllerBehaviorMusicSharePlay

- (void)getExpectedCurrentItemModelObjectWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  SEL v11;

  v5 = a3;
  -[_MPCQueueControllerBehaviorMusicSharePlay queue](self, "queue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_MPCQueueControllerBehaviorMusicSharePlay queue](self, "queue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __93___MPCQueueControllerBehaviorMusicSharePlay_getExpectedCurrentItemModelObjectWithCompletion___block_invoke;
    v9[3] = &unk_24CAB5D00;
    v9[4] = self;
    v10 = v5;
    v11 = a2;
    objc_msgSend(v7, "getExpectedCurrentItemWithCompletion:", v9);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 14, CFSTR("Cannot get model object before the live link queue has loaded"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v8);

  }
}

- (_MPCQueueControllerBehaviorMusicSharePlay)initWithSessionID:(id)a3
{
  id v4;
  _MPCQueueControllerBehaviorMusicSharePlay *v5;
  uint64_t v6;
  NSString *sessionID;
  uint64_t v8;
  NSMutableArray *pendingActions;
  uint64_t v10;
  NSMutableSet *knownContainerIDs;
  MPRequestResponseController *v12;
  MPRequestResponseController *requestController;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_MPCQueueControllerBehaviorMusicSharePlay;
  v5 = -[_MPCQueueControllerBehaviorMusicSharePlay init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    sessionID = v5->_sessionID;
    v5->_sessionID = (NSString *)v6;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    pendingActions = v5->_pendingActions;
    v5->_pendingActions = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    knownContainerIDs = v5->_knownContainerIDs;
    v5->_knownContainerIDs = (NSMutableSet *)v10;

    v12 = (MPRequestResponseController *)objc_alloc_init(MEMORY[0x24BDDCB90]);
    requestController = v5->_requestController;
    v5->_requestController = v12;

    -[MPRequestResponseController setDelegate:](v5->_requestController, "setDelegate:", v5);
    -[MPRequestResponseController beginAutomaticResponseLoading](v5->_requestController, "beginAutomaticResponseLoading");
  }

  return v5;
}

- (void)connectToHost:(id)a3
{
  objc_storeWeak((id *)&self->_host, a3);
}

- (void)didConnectToHost:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "eventStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("session-id");
  -[_MPCQueueControllerBehaviorMusicSharePlay sessionID](self, "sessionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = v6;
  v10[1] = CFSTR("shared-session-id");
  -[_MPCQueueControllerBehaviorMusicSharePlay sessionID](self, "sessionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v8;
  v11[2] = &unk_24CB16C20;
  v10[2] = CFSTR("shared-session-type");
  v10[3] = CFSTR("shared-session-event-reason");
  v11[3] = CFSTR("MusicSharePlayBehavior Setup");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emitEventType:payload:", CFSTR("shared-session-begin"), v9);

  if (!v7)
  if (!v5)

}

- (void)disconnectFromHost:(id)a3
{
  MPCQueueControllerBehaviorHost **p_host;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  -[_MPCQueueControllerBehaviorMusicSharePlay endSynchronizedPlayback](self, "endSynchronizedPlayback", a3);
  p_host = &self->_host;
  WeakRetained = objc_loadWeakRetained((id *)&self->_host);
  objc_msgSend(WeakRetained, "eventStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("session-id");
  -[_MPCQueueControllerBehaviorMusicSharePlay sessionID](self, "sessionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = CFSTR("shared-session-event-reason");
  v11[0] = v8;
  v11[1] = CFSTR("MusicSharePlayBehavior Teardown");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "emitEventType:payload:", CFSTR("shared-session-end"), v9);

  if (!v7)
  objc_storeWeak((id *)p_host, 0);
}

- (int64_t)playbackPositionRestorationPolicy
{
  return 0;
}

- (id)performLoadCommand:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  MPCPlaybackRequestEnvironment *v18;
  MPCPlaybackRequestEnvironment *playbackRequestEnvironment;
  void *v20;
  MPCModelGenericAVItemUserIdentityPropertySet *v21;
  id v22;
  MPCModelGenericAVItemUserIdentityPropertySet *identityPropertySet;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  id loadingCompletionHandler;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  ICLiveLink *liveLink;
  id v45;
  void *v46;
  uint64_t v47;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  id v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  v9 = (void *)objc_opt_class();
  objc_msgSend(v7, "playbackQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  v11 = objc_msgSend(v9, "canLoadQueue:reason:", v10, &v55);
  v12 = v55;

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCQueueControllerBehaviorMusicSharePlay.m"), 289, CFSTR("unsupported playback queue: %@"), v12);

  }
  -[_MPCQueueControllerBehaviorMusicSharePlay host](self, "host");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaRemoteOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("sharedListeningToken"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "playbackQueue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      self->_joiningAsInitiator = objc_msgSend(v17, "isRequestingImmediatePlayback");

      +[MPCPlaybackRequestEnvironment activeAccountRequestEnvironment](MPCPlaybackRequestEnvironment, "activeAccountRequestEnvironment");
      v18 = (MPCPlaybackRequestEnvironment *)objc_claimAutoreleasedReturnValue();
      playbackRequestEnvironment = self->_playbackRequestEnvironment;
      self->_playbackRequestEnvironment = v18;

      -[MPCPlaybackRequestEnvironment _createStoreRequestContext](self->_playbackRequestEnvironment, "_createStoreRequestContext");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 0;
      v21 = -[MPCModelGenericAVItemUserIdentityPropertySet initWithRequestContext:error:]([MPCModelGenericAVItemUserIdentityPropertySet alloc], "initWithRequestContext:error:", v20, &v54);
      v22 = v54;
      identityPropertySet = self->_identityPropertySet;
      self->_identityPropertySet = v21;

      v52 = v14;
      if (v22 || !self->_identityPropertySet)
      {
        v24 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v14, "engineID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusicSharePlay sessionID](self, "sessionID");
          v26 = v12;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v57 = v25;
          v58 = 2114;
          v59 = v27;
          v60 = 2114;
          v61 = v22;
          _os_log_impl(&dword_210BD8000, v24, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] performLoadCommand:completion: | failing command [failed to load identity properties] error=%{public}@", buf, 0x20u);

          v12 = v26;
          v14 = v52;

        }
        objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 2, v22, CFSTR("failed to load identity properties"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v8[2](v8, v28);
      }
      v32 = _Block_copy(v8);
      loadingCompletionHandler = self->_loadingCompletionHandler;
      self->_loadingCompletionHandler = v32;

      objc_msgSend(v16, "sharedListeningProperties");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "sessionIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "identity");
      v36 = objc_claimAutoreleasedReturnValue();
      +[MPCSharedListeningLiveLinkReusePool sharedReusePool](MPCSharedListeningLiveLinkReusePool, "sharedReusePool");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "liveLinkForSessionID:", v35);
      v37 = objc_claimAutoreleasedReturnValue();
      v53 = (void *)v36;
      if (v37)
      {
        v38 = (void *)v37;
        v39 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v14, "engineID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusicSharePlay sessionID](self, "sessionID");
          v49 = v12;
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v57 = v40;
          v58 = 2114;
          v59 = v41;
          v60 = 2048;
          v61 = v38;
          v62 = 2114;
          v63 = v35;
          _os_log_impl(&dword_210BD8000, v39, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] performLoadCommand:completion: | reusing live link [] liveLink=%p sessionID=%{public}@", buf, 0x2Au);

          v12 = v49;
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x24BEC8830], "linkWithSessionIdentifier:identity:", v35, v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v14, "engineID");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusicSharePlay sessionID](self, "sessionID");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v57 = v43;
          v58 = 2114;
          v59 = v50;
          v60 = 2048;
          v61 = v38;
          v62 = 2114;
          v63 = v35;
          _os_log_impl(&dword_210BD8000, v42, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] performLoadCommand:completion: | allocating live link [] liveLink=%p sessionID=%{public}@", buf, 0x2Au);

        }
        objc_msgSend(v51, "storeLiveLink:forSessionID:", v38, v35);
      }
      objc_msgSend(v38, "setDelegate:", self);
      liveLink = self->_liveLink;
      self->_liveLink = (ICLiveLink *)v38;
      v45 = v38;

      v46 = v53;
      -[ICLiveLink updateWithIdentity:](self->_liveLink, "updateWithIdentity:", v53);
      if ((-[ICLiveLink isStarted](self->_liveLink, "isStarted") & 1) != 0)
      {
        objc_msgSend(v45, "queue");
        v47 = objc_claimAutoreleasedReturnValue();

        if (v47)
        {
          -[_MPCQueueControllerBehaviorMusicSharePlay _initializeWithQueue:](self, "_initializeWithQueue:", v47);
          v45 = (id)v47;
        }
        else
        {
          v45 = 0;
        }
        v14 = v52;
        v46 = v53;
      }
      else
      {
        -[ICLiveLink start](self->_liveLink, "start");
        v14 = v52;
      }

    }
    else
    {
      v29 = (void *)MEMORY[0x24BDD1540];
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 1, CFSTR("Unsupported playback queue for SharePlay behavior [sharedListeningToken is unknown type: %@]"), v20);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v31);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 1, CFSTR("Unsupported playback queue for SharePlay behavior [options did not contain 'sharedListeningToken']"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v20);
  }

  return 0;
}

- (void)activeItemFlagsDidChange:(unsigned __int16)a3
{
  self->_activeItemFlags = a3;
}

- (BOOL)itemExistsForContentItemID:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v13;

  v5 = a3;
  -[_MPCQueueControllerBehaviorMusicSharePlay _componentsForContentItemID:](self, "_componentsForContentItemID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!self->_liveLinkStopped)
  {
    if (self->_queue)
    {
      objc_msgSend(v6, "itemID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      switch(objc_msgSend(v7, "type"))
      {
        case 0:
          -[ICSharedListeningQueue itemForIdentifier:](self->_queue, "itemForIdentifier:", v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            LODWORD(self) = !-[_MPCQueueControllerBehaviorMusicSharePlay _useItemPlaceholderForContentItemID:](self, "_useItemPlaceholderForContentItemID:", v5);
          else
            LOBYTE(self) = 0;
          goto LABEL_19;
        case 1:
          objc_msgSend(v7, "itemSpecificContentItemID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(self) = -[_MPCQueueControllerBehaviorMusicSharePlay _useItemPlaceholderForContentItemID:](self, "_useItemPlaceholderForContentItemID:", v11);
LABEL_19:

          goto LABEL_5;
        case 2:
          LOBYTE(self) = self->_queue != 0;
          goto LABEL_5;
        case 3:
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCQueueControllerBehaviorMusicSharePlay.m"), 382, CFSTR("Unexpected contentItemID in itemExistsForContentItemID (MPCQueueControllerBehaviorItemTypeEndOfQueuePlaceholder): %@"), v5);

          goto LABEL_17;
        default:
LABEL_17:
          LOBYTE(self) = 0;
          break;
      }
      goto LABEL_5;
    }
    if (objc_msgSend(v6, "type") == 2)
    {
      objc_msgSend(v7, "sectionID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("WaitingForFirstQueue");
      goto LABEL_4;
    }
LABEL_12:
    LOBYTE(self) = 0;
    goto LABEL_13;
  }
  if (objc_msgSend(v6, "type") != 2)
    goto LABEL_12;
  objc_msgSend(v7, "sectionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = CFSTR("LiveLinkStopped");
LABEL_4:
  LOBYTE(self) = objc_msgSend(v8, "isEqualToString:", v10);
LABEL_5:

LABEL_13:
  return (char)self;
}

- (BOOL)canJumpToContentItemID:(id)a3 reason:(id *)a4
{
  void *v6;
  ICSharedListeningQueue *queue;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[_MPCQueueControllerBehaviorMusicSharePlay _componentsForContentItemID:](self, "_componentsForContentItemID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  objc_msgSend(v6, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSharedListeningQueue itemForIdentifier:](queue, "itemForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && !v9)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "itemID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("ICSharedListeningQueue does not contain itemID: %@"), v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9 != 0;
}

- (BOOL)canPreviousItemFromContentItemID:(id)a3 reason:(id *)a4
{
  void *v6;
  ICSharedListeningQueue *queue;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[_MPCQueueControllerBehaviorMusicSharePlay _componentsForContentItemID:](self, "_componentsForContentItemID:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  objc_msgSend(v6, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSharedListeningQueue itemForIdentifier:](queue, "itemForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && !v9)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "itemID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("ICSharedListeningQueue does not contain itemID: %@"), v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9 != 0;
}

- (BOOL)canNextItemFromContentItemID:(id)a3 reason:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  ICSharedListeningQueue *queue;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  -[_MPCQueueControllerBehaviorMusicSharePlay _componentsForContentItemID:](self, "_componentsForContentItemID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "type") == 3)
  {
    if (a4)
    {
      v8 = 0;
      *a4 = CFSTR("tail placeholder");
      goto LABEL_12;
    }
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  queue = self->_queue;
  objc_msgSend(v7, "itemID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSharedListeningQueue itemForIdentifier:](queue, "itemForIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    if (a4)
    {
      v14 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v7, "itemID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("ICSharedListeningQueue does not contain itemID: %@"), v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_11;
  }
  -[_MPCQueueControllerBehaviorMusicSharePlay contentItemIDEnumeratorStartingAfterContentItemID:mode:options:](self, "contentItemIDEnumeratorStartingAfterContentItemID:mode:options:", v6, 2, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nextObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13 != 0;
  if (a4 && !v13)
    *a4 = CFSTR("end of shared listening queue");

LABEL_12:
  return v8;
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[ICSharedListeningQueue items](self->_queue, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (id)contentItemIDEnumeratorStartingAfterContentItemID:(id)a3 mode:(int64_t)a4 options:(unint64_t)a5
{
  char v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[2];

  v5 = a5;
  v23[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!self->_liveLinkStopped)
  {
    v13 = (void *)-[NSArray copy](self->_enumeratorContentItemIDs, "copy");
    v8 = v13;
    if (v7)
    {
      v14 = objc_msgSend(v13, "indexOfObject:", v7);
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[_MPCQueueControllerBehaviorMusicSharePlay _componentsForContentItemID:](self, "_componentsForContentItemID:", v7);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "itemSpecificContentItemID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16
          || (objc_msgSend(v15, "itemSpecificContentItemID"),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              v18 = objc_msgSend(v8, "indexOfObject:", v17),
              v17,
              v18 == 0x7FFFFFFFFFFFFFFFLL)
          || ((v5 & 1) != 0 ? (v14 = v18 + 1) : (v14 = v18 - 1), v14 == 0x7FFFFFFFFFFFFFFFLL))
        {
          objc_msgSend(MEMORY[0x24BDBD1A8], "objectEnumerator");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_5;
        }

      }
    }
    else
    {
      v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (!self->_queue)
    {
      +[MPCQueueControllerBehaviorMusicIdentifierComponents placeholderComponentsWithLoadingSectionID:](MPCQueueControllerBehaviorMusicIdentifierComponents, "placeholderComponentsWithLoadingSectionID:", CFSTR("WaitingForFirstQueue"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "contentItemID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v22, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectEnumerator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_3;
    }
    if ((v5 & 1) != 0)
    {
      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v8, "subarrayWithRange:", 0, v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "reverseObjectEnumerator");
        v21 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      }
      objc_msgSend(v8, "reverseObjectEnumerator");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v8, "subarrayWithRange:", v14 + 1, objc_msgSend(v8, "count") + ~v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectEnumerator");
        v21 = objc_claimAutoreleasedReturnValue();
LABEL_26:
        v11 = (void *)v21;
        goto LABEL_4;
      }
      objc_msgSend(v8, "objectEnumerator");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v19;
    goto LABEL_5;
  }
  +[MPCQueueControllerBehaviorMusicIdentifierComponents placeholderComponentsWithLoadingSectionID:](MPCQueueControllerBehaviorMusicIdentifierComponents, "placeholderComponentsWithLoadingSectionID:", CFSTR("LiveLinkStopped"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentItemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectEnumerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:

LABEL_4:
LABEL_5:

  return v11;
}

- (id)_stateDictionaryIncludingQueue:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const __CFString *v11;
  _QWORD v12[2];

  v3 = a3;
  v12[1] = *MEMORY[0x24BDAC8D0];
  v11 = CFSTR("_obj");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    -[_MPCQueueControllerBehaviorMusicSharePlay _queueAsStateDictionary](self, "_queueAsStateDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("queue"));

    v9 = objc_msgSend(v7, "copy");
    v6 = (void *)v9;
  }
  return v6;
}

- (id)_itemForContentItemID:(id)a3
{
  MPCModelGenericAVItem *v4;
  void *v5;
  MPCModelGenericAVItem *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSDictionary *resultsIndexPathMap;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  MPCModelGenericAVItem *v24;
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
  NSObject *v37;
  void *v38;
  void *v39;
  void *v41;
  MPCModelGenericAVItem *v42;
  void *v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  MPCModelGenericAVItem *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = (MPCModelGenericAVItem *)a3;
  -[_MPCQueueControllerBehaviorMusicSharePlay host](self, "host");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCQueueControllerBehaviorMusicSharePlay _componentsForContentItemID:](self, "_componentsForContentItemID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "type"))
  {
    v6 = (MPCModelGenericAVItem *)objc_alloc_init(MEMORY[0x24BDDCB00]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.MediaPlayer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("LOADING_AUDIO_LABEL"), &stru_24CABB5D0, CFSTR("MediaPlayer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelGenericAVItem setMainTitle:](v6, "setMainTitle:", v8);

    -[_MPCQueueControllerBehaviorMusicSharePlay queue](self, "queue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "itemForIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mediaIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelGenericAVItem setStoreItemInt64ID:](v6, "setStoreItemInt64ID:", objc_msgSend(v12, "longLongValue"));

    objc_msgSend(v5, "itemID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelGenericAVItem setQueueIdentifier:](v6, "setQueueIdentifier:", v13);

    objc_msgSend(v5, "contentItemID");
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sectionID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelGenericAVItem setContentItemID:queueSectionID:queueItemID:](v6, "setContentItemID:queueSectionID:queueItemID:", v14, v15, v16);
    goto LABEL_5;
  }
  -[MPRequestResponseController response](self->_requestController, "response");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "modelResponse");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "results");
  v14 = objc_claimAutoreleasedReturnValue();

  resultsIndexPathMap = self->_resultsIndexPathMap;
  objc_msgSend(v5, "itemID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](resultsIndexPathMap, "objectForKeyedSubscript:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[NSObject itemAtIndexPath:](v14, "itemAtIndexPath:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject sectionAtIndex:](v14, "sectionAtIndex:", objc_msgSend(v15, "section"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPRequestResponseController request](self->_requestController, "request");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "modelRequest");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "playbackRequestEnvironment");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = [MPCModelGenericAVItem alloc];
    -[MPRequestResponseController request](self->_requestController, "request");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "modelRequest");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "itemProperties");
    v42 = v4;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[MPCModelGenericAVItem initWithGenericObject:itemProperties:playbackRequestEnvironment:identityPropertySet:](v24, "initWithGenericObject:itemProperties:playbackRequestEnvironment:identityPropertySet:", v16, v27, v23, self->_identityPropertySet);

    objc_msgSend(v5, "itemID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelGenericAVItem setQueueIdentifier:](v6, "setQueueIdentifier:", v28);

    objc_msgSend(v5, "contentItemID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sectionID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelGenericAVItem setContentItemID:queueSectionID:queueItemID:](v6, "setContentItemID:queueSectionID:queueItemID:", v29, v30, v31);

    v4 = v42;
    objc_msgSend(v23, "userIdentity");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCMediaLibraryPlaybackAssetCacheProvider deviceLibraryProviderWithUserIdentity:](MPCMediaLibraryPlaybackAssetCacheProvider, "deviceLibraryProviderWithUserIdentity:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelGenericAVItem setAssetCacheProvider:](v6, "setAssetCacheProvider:", v33);

    objc_msgSend(MEMORY[0x24BDDC938], "playEventWithModelObject:featureName:", v41, CFSTR("MusicSharePlayBehavior"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCModelGenericAVItem setModelPlayEvent:](v6, "setModelPlayEvent:", v34);

    -[MPCModelGenericAVItem setAutoPlayItem:](v6, "setAutoPlayItem:", objc_msgSend(v5, "behaviorFlags") & 1);
LABEL_5:

    v14 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v43, "engineID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MPCQueueControllerBehaviorMusicSharePlay sessionID](self, "sessionID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v45 = v35;
      v46 = 2114;
      v47 = v36;
      v48 = 2114;
      v49 = v6;
      _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "[ITFIT:%{public}@:%{public}@] _itemForComponents | returning item [] item=%{public}@", buf, 0x20u);

    }
    goto LABEL_10;
  }
  v37 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v43, "engineID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCQueueControllerBehaviorMusicSharePlay sessionID](self, "sessionID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v45 = v38;
    v46 = 2114;
    v47 = v39;
    v48 = 2114;
    v49 = v4;
    _os_log_impl(&dword_210BD8000, v37, OS_LOG_TYPE_DEFAULT, "[ITFIT:%{public}@:%{public}@] _itemForContentItemID: | returning nil [unknown contentItemID] contentItemID=%{public}@", buf, 0x20u);

  }
  v6 = 0;
LABEL_10:

  return v6;
}

- (void)didReachEndOfQueueWithReason:(id)a3
{
  self->_queueRanDry = 1;
  -[ICLiveLink stop](self->_liveLink, "stop", a3);
}

- (void)connectToExternalSyncHost:(id)a3
{
  objc_storeWeak((id *)&self->_externalSyncHost, a3);
}

- (void)disconnectFromExternalSyncHost:(id)a3
{
  objc_storeWeak((id *)&self->_externalSyncHost, 0);
}

- (void)didJumpToTargetContentItemID:(id)a3
{
  ICLiveLink *liveLink;
  void *v5;
  id v6;

  -[_MPCQueueControllerBehaviorMusicSharePlay _componentsForContentItemID:](self, "_componentsForContentItemID:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  liveLink = self->_liveLink;
  objc_msgSend(v6, "itemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLiveLink broadcastDirectCurrentItemChangedToItemIdentifier:](liveLink, "broadcastDirectCurrentItemChangedToItemIdentifier:", v5);

}

- (BOOL)canUserChangeRepeatTypeWithReason:(id *)a3
{
  if (a3)
    *a3 = CFSTR("in shared listening mode");
  return 0;
}

- (void)setRepeatType:(int64_t)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = a4;
  objc_msgSend(v5, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 3, CFSTR("Repeat is not supported in SharePlay."));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (BOOL)canUserChangeShuffleModeWithReason:(id *)a3
{
  if (a3)
    *a3 = CFSTR("in shared listening mode");
  return 0;
}

- (void)setShuffleType:(int64_t)a3 targetContentItemID:(id)a4 completion:(id)a5
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x24BDD1540];
  v7 = a5;
  objc_msgSend(v6, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 3, CFSTR("Shuffle is not supported in SharePlay."));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v7, v8);

}

- (void)reshuffleWithTargetContentItemID:(id)a3 completion:(id)a4
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = a4;
  objc_msgSend(v5, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 3, CFSTR("Shuffle is not supported in SharePlay."));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v6, v7);

}

- (BOOL)autoPlayEnabled
{
  return -[ICSharedListeningQueue isAutoPlayEnabled](self->_queue, "isAutoPlayEnabled");
}

- (BOOL)canUserEnableAutoPlayWithReason:(id *)a3
{
  BOOL result;

  result = -[ICSharedListeningQueue isAutoPlayAvailable](self->_queue, "isAutoPlayAvailable");
  if (a3)
  {
    if (!result)
      *a3 = CFSTR("AutoPlay unavailable in this SharePlay session");
  }
  return result;
}

- (void)setAutoPlayEnabled:(BOOL)a3 targetContentItemID:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  ICSharedListeningQueue *queue;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  BOOL v15;
  id location;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __95___MPCQueueControllerBehaviorMusicSharePlay_setAutoPlayEnabled_targetContentItemID_completion___block_invoke;
  v12[3] = &unk_24CAB5D50;
  objc_copyWeak(&v14, &location);
  v15 = v6;
  v11 = v9;
  v13 = v11;
  -[ICSharedListeningQueue setAutoPlayEnabled:completion:](queue, "setAutoPlayEnabled:completion:", v6, v12);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (BOOL)isAutoPlayContentItemID:(id)a3
{
  void *v3;
  BOOL v4;

  -[_MPCQueueControllerBehaviorMusicSharePlay _componentsForContentItemID:](self, "_componentsForContentItemID:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "behaviorFlags") & 1;

  return v4;
}

- (void)getSharedQueueTracklistWithStartingContentItemID:(id)a3 completion:(id)a4
{
  id v6;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCQueueControllerBehaviorMusicSharePlay.m"), 634, CFSTR("Cannot get a shared queue tracklist from an existing shared queue."));

}

- (void)findFirstContentItemIDForItemIntersectingIdentifierSet:(id)a3 completion:(id)a4
{
  MPRequestResponseController *requestController;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(id, void *, _QWORD);

  v16 = (void (**)(id, void *, _QWORD))a4;
  requestController = self->_requestController;
  v7 = a3;
  -[MPRequestResponseController response](requestController, "response");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modelResponse");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "results");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "indexPathForItemWithIdentifiersIntersectingSet:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v10, "identifiersForItemAtIndexPath:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "vendorID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCQueueControllerBehaviorMusicSharePlay _componentsForSharedListeningItemID:](self, "_componentsForSharedListeningItemID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "contentItemID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, v15, 0);

  }
  else
  {
    v16[2](v16, 0, 0);
  }

}

- (void)setHostingSharedSessionID:(id)a3 reason:(id)a4
{
  id v5;

  if (a3)
  {
    -[_MPCQueueControllerBehaviorMusicSharePlay musicSharePlayBehaviorDelegate](self, "musicSharePlayBehaviorDelegate", a3, a4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "behavior:didEndSharePlaySessionWithReason:", self, 2);

  }
}

- (id)contentItemIDWithoutRepeatIteration:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  MPCQueueControllerBehaviorMusicIdentifierComponentsFromContentItemID(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "repeatIteration"))
  {
    v4 = objc_msgSend(v3, "copyWithRepeatIteration:", 0);

    v3 = (void *)v4;
  }
  objc_msgSend(v3, "contentItemID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyContentItemID:(id)a3 repeatIteration:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  MPCQueueControllerBehaviorMusicIdentifierComponentsFromContentItemID(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "repeatIteration") != a4)
  {
    v6 = objc_msgSend(v5, "copyWithRepeatIteration:", a4);

    v5 = (void *)v6;
  }
  objc_msgSend(v5, "contentItemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)lastSectionContentItemIDForTargetContentItemID:(id)a3
{
  return 0;
}

- (void)endSynchronizedPlayback
{
  _MPCQueueControllerBehaviorMusicSharePlay *v3;
  AVPlayerPlaybackCoordinator *playbackCoordinator;
  AVPlayerPlaybackCoordinator *v5;

  v5 = self->_playbackCoordinator;
  -[AVPlayerPlaybackCoordinator delegate](v5, "delegate");
  v3 = (_MPCQueueControllerBehaviorMusicSharePlay *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
    -[AVPlayerPlaybackCoordinator setDelegate:](v5, "setDelegate:", 0);
  playbackCoordinator = self->_playbackCoordinator;
  self->_playbackCoordinator = 0;

  -[ICLiveLink endSynchronizedPlayback](self->_liveLink, "endSynchronizedPlayback");
}

- (void)updatePlaybackCoordinator:(id)a3
{
  AVPlayerPlaybackCoordinator *v5;
  AVPlayerPlaybackCoordinator *playbackCoordinator;
  _MPCQueueControllerBehaviorMusicSharePlay *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  AVPlayerPlaybackCoordinator *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  AVPlayerPlaybackCoordinator *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = (AVPlayerPlaybackCoordinator *)a3;
  playbackCoordinator = self->_playbackCoordinator;
  if (playbackCoordinator != v5)
  {
    -[AVPlayerPlaybackCoordinator delegate](playbackCoordinator, "delegate");
    v7 = (_MPCQueueControllerBehaviorMusicSharePlay *)objc_claimAutoreleasedReturnValue();

    if (v7 == self)
      -[AVPlayerPlaybackCoordinator setDelegate:](self->_playbackCoordinator, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_playbackCoordinator, a3);
    -[AVPlayerPlaybackCoordinator setDelegate:](self->_playbackCoordinator, "setDelegate:", self);
    if (self->_playbackCoordinator)
    {
      -[_MPCQueueControllerBehaviorMusicSharePlay queue](self, "queue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[_MPCQueueControllerBehaviorMusicSharePlay host](self, "host");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v9, "engineID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusicSharePlay sessionID](self, "sessionID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = self->_playbackCoordinator;
          v14 = 138543874;
          v15 = v11;
          v16 = 2114;
          v17 = v12;
          v18 = 2114;
          v19 = v13;
          _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] updatePlaybackCoordinator: | begin synchronized playback with AVPlaybackCoordinator [] playbackCoordinator=%{public}@", (uint8_t *)&v14, 0x20u);

        }
        -[ICLiveLink beginSynchronizedPlaybackWithAVPlaybackCoordinator:](self->_liveLink, "beginSynchronizedPlaybackWithAVPlaybackCoordinator:", self->_playbackCoordinator);

      }
    }
  }

}

- (int64_t)queueExplicitContentState
{
  int64_t result;

  result = -[ICSharedListeningQueue explicitContentState](self->_queue, "explicitContentState");
  if (result != 2)
    return result == 1;
  return result;
}

- (void)setRequestedPropertySetForEvents:(id)a3
{
  MPPropertySet *v4;
  MPPropertySet *v5;
  MPPropertySet *requestedPropertySetForEvents;
  MPPropertySet *v7;

  v4 = (MPPropertySet *)a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDDCB30], "emptyPropertySet");
    v4 = (MPPropertySet *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_requestedPropertySetForEvents != v4)
  {
    v7 = v4;
    v5 = (MPPropertySet *)-[MPPropertySet copy](v4, "copy");
    requestedPropertySetForEvents = self->_requestedPropertySetForEvents;
    self->_requestedPropertySetForEvents = v5;

    v4 = v7;
  }

}

- (void)canReuseQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "replaceIntent") == 3)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:
    if (+[_MPCQueueControllerBehaviorMusic canLoadQueue:reason:](_MPCQueueControllerBehaviorMusic, "canLoadQueue:reason:", v6, 0)&& self->_queue)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __70___MPCQueueControllerBehaviorMusicSharePlay_canReuseQueue_completion___block_invoke;
      v9[3] = &unk_24CAB7CC0;
      v9[4] = self;
      v10 = v7;
      objc_msgSend(v6, "getMusicPlaybackContextWithOptions:completion:", 0, v9);

      goto LABEL_10;
    }
LABEL_9:
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0, 0);
    goto LABEL_10;
  }
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(CFSTR("InProcess-com.apple.music.playbackqueue.sharedlistening"), "isEqualToString:", v8))
  {

    goto LABEL_6;
  }
  (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v7 + 2))(v7, 0, 0, 0, 0);

LABEL_10:
}

- (BOOL)allowsQueueModifications
{
  return 1;
}

- (void)setAllowsQueueModifications:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[_MPCQueueControllerBehaviorMusicSharePlay host](self, "host", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "engineID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCQueueControllerBehaviorMusicSharePlay sessionID](self, "sessionID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_ERROR, "[BMSP:%{public}@:%{public}@] setAllowsQueueModifications: | ignoring unsupported option [cannot disable queue modifications]", (uint8_t *)&v8, 0x16u);

  }
}

- (BOOL)isSupportedInsertionPosition:(int64_t)a3 fromContentItemID:(id)a4 reason:(id *)a5
{
  id v8;
  BOOL v9;
  __CFString *v10;

  v8 = a4;
  v9 = 1;
  switch(a3)
  {
    case 0:
    case 3:
      goto LABEL_16;
    case 1:
      if (!a5)
        goto LABEL_15;
      v10 = CFSTR("cannot insert at Tail");
      goto LABEL_14;
    case 2:
      if ((self->_activeItemFlags & 1) != 0)
      {
        if (a5)
        {
          v10 = CFSTR("active item from auto play");
          goto LABEL_14;
        }
      }
      else
      {
        if (!-[ICSharedListeningQueue hasActiveRadioStation](self->_queue, "hasActiveRadioStation"))
          goto LABEL_16;
        if (a5)
        {
          v10 = CFSTR("queue contains radio station");
LABEL_14:
          v9 = 0;
          *a5 = v10;
          goto LABEL_16;
        }
      }
LABEL_15:
      v9 = 0;
LABEL_16:

      return v9;
    case 4:
      if (!a5)
        goto LABEL_15;
      v10 = CFSTR("cannot insert at Start");
      goto LABEL_14;
    default:
      if (!a5)
        goto LABEL_15;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unknown insertion position: %d"), a3);
      v10 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
  }
}

- (id)tailInsertionContentItemIDForTargetContentItemID:(id)a3
{
  return 0;
}

- (void)performInsertCommand:(id)a3 targetContentItemID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _MPCQueueControllerBehaviorMusicSharePlay *v21;
  id v22;
  SEL v23;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "playbackQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCQueueControllerBehaviorMusicSharePlay externalSyncHost](self, "externalSyncHost");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "beginExternalSyncEditWithReason:", CFSTR("PerformInsertCommand"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __97___MPCQueueControllerBehaviorMusicSharePlay_performInsertCommand_targetContentItemID_completion___block_invoke;
  v17[3] = &unk_24CAB5DF0;
  v18 = v10;
  v19 = v12;
  v20 = v8;
  v21 = self;
  v22 = v9;
  v23 = a2;
  v13 = v8;
  v14 = v12;
  v15 = v9;
  v16 = v10;
  objc_msgSend(v16, "getMusicPlaybackContextWithOptions:completion:", 0, v17);

}

- (void)moveContentItemID:(id)a3 beforeContentItemID:(id)a4 completion:(id)a5
{
  void (**v8)(id, _QWORD);
  void *v9;
  ICSharedListeningQueue *queue;
  void *v11;
  void *v12;
  void *v13;
  ICSharedListeningQueue *v14;
  void *v15;
  void *v16;
  ICSharedListeningQueue *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  -[_MPCQueueControllerBehaviorMusicSharePlay _componentsForContentItemID:](self, "_componentsForContentItemID:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  objc_msgSend(v9, "itemID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSharedListeningQueue itemForIdentifier:](queue, "itemForIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_MPCQueueControllerBehaviorMusicSharePlay _componentsForContentItemID:](self, "_componentsForContentItemID:", v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_queue;
    objc_msgSend(v13, "itemID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSharedListeningQueue itemForIdentifier:](v14, "itemForIdentifier:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = self->_queue;
      objc_msgSend(v9, "itemID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "itemID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICSharedListeningQueue moveItemIdentifier:beforeItemIdentifier:](v17, "moveItemIdentifier:beforeItemIdentifier:", v18, v19);

      v8[2](v8, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 8, CFSTR("Received a move command but the target is not available in the queue."));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v8)[2](v8, v20);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 8, CFSTR("Received a move command but the source is not available in the queue."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v8)[2](v8, v13);
  }

}

- (void)moveContentItemID:(id)a3 afterContentItemID:(id)a4 completion:(id)a5
{
  void (**v8)(id, _QWORD);
  void *v9;
  ICSharedListeningQueue *queue;
  void *v11;
  void *v12;
  void *v13;
  ICSharedListeningQueue *v14;
  void *v15;
  void *v16;
  ICSharedListeningQueue *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  -[_MPCQueueControllerBehaviorMusicSharePlay _componentsForContentItemID:](self, "_componentsForContentItemID:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  objc_msgSend(v9, "itemID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSharedListeningQueue itemForIdentifier:](queue, "itemForIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_MPCQueueControllerBehaviorMusicSharePlay _componentsForContentItemID:](self, "_componentsForContentItemID:", v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = self->_queue;
    objc_msgSend(v13, "itemID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSharedListeningQueue itemForIdentifier:](v14, "itemForIdentifier:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = self->_queue;
      objc_msgSend(v9, "itemID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "itemID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICSharedListeningQueue moveItemIdentifier:afterItemIdentifier:](v17, "moveItemIdentifier:afterItemIdentifier:", v18, v19);

      v8[2](v8, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 8, CFSTR("Received a move command but the target is not available in the queue."));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v8)[2](v8, v20);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 8, CFSTR("Received a move command but the source is not available in the queue."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v8)[2](v8, v13);
  }

}

- (BOOL)canRemoveContentItemID:(id)a3 reason:(id *)a4
{
  return 1;
}

- (void)removeContentItemID:(id)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  ICSharedListeningQueue *queue;
  void *v9;
  void *v10;
  ICSharedListeningQueue *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v6 = (void (**)(id, _QWORD))a4;
  -[_MPCQueueControllerBehaviorMusicSharePlay _componentsForContentItemID:](self, "_componentsForContentItemID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v14 = v7;
  objc_msgSend(v7, "itemID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSharedListeningQueue itemForIdentifier:](queue, "itemForIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = self->_queue;
    objc_msgSend(v14, "itemID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSharedListeningQueue removeItemIdentifier:](v11, "removeItemIdentifier:", v12);

    v6[2](v6, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCMusicSharePlayBehaviorError"), 8, CFSTR("Received a remove command but the item is not available in the queue."));
    v13 = objc_claimAutoreleasedReturnValue();
    v6[2](v6, v13);

    v6 = (void (**)(id, _QWORD))v13;
  }

}

- (void)clearAllItemsAfterContentItemID:(id)a3
{
  void *v4;
  ICSharedListeningQueue *queue;
  void *v6;
  void *v7;
  ICSharedListeningQueue *v8;
  void *v9;
  id v10;

  -[_MPCQueueControllerBehaviorMusicSharePlay _componentsForContentItemID:](self, "_componentsForContentItemID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v10 = v4;
  objc_msgSend(v4, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSharedListeningQueue itemForIdentifier:](queue, "itemForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = self->_queue;
    objc_msgSend(v10, "itemID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSharedListeningQueue removeAllItemIdentifiersAfterItemIdentifier:](v8, "removeAllItemIdentifiersAfterItemIdentifier:", v9);

  }
}

- (int64_t)displayItemCount
{
  void *v2;
  int64_t v3;

  -[ICSharedListeningQueue tracklist](self->_queue, "tracklist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "totalItemCount");

  return v3;
}

- (BOOL)controller:(id)a3 shouldRetryFailedRequestWithError:(id)a4
{
  return 1;
}

- (void)controller:(id)a3 defersResponseReplacement:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82___MPCQueueControllerBehaviorMusicSharePlay_controller_defersResponseReplacement___block_invoke;
  v7[3] = &unk_24CAB9830;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

- (id)playbackCoordinator:(id)a3 identifierForPlayerItem:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a4, "contentItemID", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCQueueControllerBehaviorMusicSharePlay _componentsForContentItemID:](self, "_componentsForContentItemID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)liveLinkDidReconnect:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66___MPCQueueControllerBehaviorMusicSharePlay_liveLinkDidReconnect___block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)didStopLiveLink:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61___MPCQueueControllerBehaviorMusicSharePlay_didStopLiveLink___block_invoke;
  block[3] = &unk_24CABA2D0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)liveLink:(id)a3 didEncounterError:(id)a4 willRetry:(BOOL)a5
{
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didEncounterError_willRetry___block_invoke;
  block[3] = &unk_24CAB5E20;
  v11 = a5;
  block[4] = self;
  v10 = v7;
  v8 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)liveLink:(id)a3 didUpdateParticipants:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didUpdateParticipants___block_invoke;
  block[3] = &unk_24CABAA28;
  block[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)liveLink:(id)a3 didUpdateQueue:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didUpdateQueue___block_invoke;
  v7[3] = &unk_24CABA1D0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

- (void)liveLink:(id)a3 didReceiveDirectCurrentItemChanged:(id)a4 fromParticipant:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __105___MPCQueueControllerBehaviorMusicSharePlay_liveLink_didReceiveDirectCurrentItemChanged_fromParticipant___block_invoke;
  v12[3] = &unk_24CAB86C0;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a2;
  v10 = v9;
  v11 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v12);

}

- (void)liveLink:(id)a3 didReceiveEvent:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  msv_dispatch_on_main_queue();

}

- (id)_componentsForContentItemID:(id)a3
{
  id v5;
  void *v6;
  ICSharedListeningQueue *queue;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCQueueControllerBehaviorMusicSharePlay.m"), 1191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contentItemID.length > 0"));

  }
  MPCQueueControllerBehaviorMusicIdentifierComponentsFromContentItemID(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  objc_msgSend(v6, "itemID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSharedListeningQueue itemForIdentifier:](queue, "itemForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v6, "copyWithBehaviorFlags:", objc_msgSend(v9, "isAutoPlayItem"));
  return v10;
}

- (id)_componentsForSharedListeningItemID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _MPCQueueControllerBehaviorMusicSharePlay *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__16650;
  v17 = __Block_byref_object_dispose__16651;
  v18 = 0;
  -[ICSharedListeningQueue tracklist](self->_queue, "tracklist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __81___MPCQueueControllerBehaviorMusicSharePlay__componentsForSharedListeningItemID___block_invoke;
  v9[3] = &unk_24CAB5EB8;
  v6 = v4;
  v10 = v6;
  v11 = self;
  v12 = &v13;
  objc_msgSend(v5, "enumerateItemsUsingBlock:", v9);

  v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

- (void)_dequeuePendingActions
{
  uint64_t v3;
  uint64_t i;
  NSObject *v5;
  void *v6;
  void *v7;
  ICSharedListeningQueue *queue;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSDictionary *resultsIndexPathMap;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void (**v28)(_QWORD, _QWORD);
  void *v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void (**v35)(_QWORD, _QWORD);
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  _MPCQueueControllerBehaviorMusicSharePlay *v40;
  void *v41;
  NSMutableArray *obj;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  NSObject *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCQueueControllerBehaviorMusicSharePlay host](self, "host");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = self->_pendingActions;
  v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  v3 = 0;
  if (v44)
  {
    v43 = *(_QWORD *)v47;
    v40 = self;
    while (2)
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v47 != v43)
          objc_enumerationMutation(obj);
        v5 = *(NSObject **)(*((_QWORD *)&v46 + 1) + 8 * i);
        -[NSObject expirationDate](v5, "expirationDate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "laterDate:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7 == v45)
        {
          v25 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v41, "engineID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MPCQueueControllerBehaviorMusicSharePlay sessionID](self, "sessionID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v51 = v26;
            v52 = 2114;
            v53 = v27;
            v54 = 2114;
            v55 = v5;
            _os_log_impl(&dword_210BD8000, v25, OS_LOG_TYPE_ERROR, "[BMSP:%{public}@:%{public}@] _dequeuePendingActions | calling action [expired] action=%{public}@", buf, 0x20u);

          }
          ++v3;
          -[NSObject block](v5, "block");
          v28 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v28[2](v28, 1);

        }
        else
        {
          queue = self->_queue;
          -[NSObject itemIdentifier](v5, "itemIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICSharedListeningQueue itemForIdentifier:](queue, "itemForIdentifier:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v10)
          {
            v36 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v41, "engineID");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MPCQueueControllerBehaviorMusicSharePlay sessionID](self, "sessionID");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject itemIdentifier](v5, "itemIdentifier");
              v39 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v51 = v37;
              v52 = 2114;
              v53 = v38;
              v54 = 2114;
              v55 = v39;
              _os_log_impl(&dword_210BD8000, v36, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] _dequeuePendingActions | stopping [no such item] missingItemID=%{public}@", buf, 0x20u);

            }
            goto LABEL_29;
          }
          -[MPRequestResponseController response](self->_requestController, "response");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "modelResponse");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "results");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          resultsIndexPathMap = self->_resultsIndexPathMap;
          -[NSObject itemIdentifier](v5, "itemIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](resultsIndexPathMap, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            v17 = v3;
            objc_msgSend(v13, "identifiersForItemAtIndexPath:", v16);
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = -[NSObject isPlaceholder](v18, "isPlaceholder");
            v20 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
            v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
            if (v19)
            {
              if (v21)
              {
                objc_msgSend(v41, "engineID");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                -[_MPCQueueControllerBehaviorMusicSharePlay sessionID](self, "sessionID");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v51 = v22;
                v52 = 2114;
                v53 = v23;
                v54 = 2114;
                v55 = v18;
                _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] _dequeuePendingActions | stopping [placeholder item] idSet=%{public}@", buf, 0x20u);

              }
              v24 = 0;
              v3 = v17;
            }
            else
            {
              if (v21)
              {
                objc_msgSend(v41, "engineID");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                -[_MPCQueueControllerBehaviorMusicSharePlay sessionID](self, "sessionID");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v51 = v33;
                v52 = 2114;
                v53 = v34;
                v54 = 2114;
                v55 = v5;
                _os_log_impl(&dword_210BD8000, v20, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] _dequeuePendingActions | calling action [satisfied] action=%{public}@", buf, 0x20u);

                self = v40;
              }

              -[NSObject block](v5, "block");
              v35 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              v35[2](v35, 0);

              v3 = v17 + 1;
              v24 = 1;
            }
          }
          else
          {
            v18 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v41, "engineID");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[_MPCQueueControllerBehaviorMusicSharePlay sessionID](self, "sessionID");
              v30 = v3;
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject itemIdentifier](v5, "itemIdentifier");
              v32 = objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v51 = v29;
              v52 = 2114;
              v53 = v31;
              v54 = 2114;
              v55 = v32;
              _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] _dequeuePendingActions | stopping [waiting for item metadata] itemID=%{public}@", buf, 0x20u);

              v3 = v30;
            }
            v24 = 0;
          }

          if (!v24)
            goto LABEL_29;
        }
      }
      v44 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      if (v44)
        continue;
      break;
    }
  }
LABEL_29:

  -[NSMutableArray removeObjectsInRange:](self->_pendingActions, "removeObjectsInRange:", 0, v3);
}

- (void)_emitEventsForAddedSharedListeningContainer:(id)a3
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
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_MPCQueueControllerBehaviorMusicSharePlay host](self, "host");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "eventStream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = CFSTR("queue-section-id");
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v5;
  v18[1] = CFSTR("account-id");
  +[MPCPlaybackAccountManager sharedManager](MPCPlaybackAccountManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hashedDSID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19[1] = v9;
  v19[2] = &unk_24CB16C38;
  v18[2] = CFSTR("private-listening-source");
  v18[3] = CFSTR("queue-reporting-metadata");
  v16[0] = CFSTR("feature-name");
  objc_msgSend(v4, "featureName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = v11;
  v17[1] = CFSTR("MusicSharePlayBehavior");
  v16[1] = CFSTR("playback-context-class-name");
  v16[2] = CFSTR("private-listening-enabled");
  v17[2] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "emitEventType:payload:", CFSTR("queue-add"), v13);

  if (!v10)
  if (!v8)

}

- (void)_emitEventsForParticipants:(id)a3 localUserIdentity:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *(*v19)(uint64_t, void *);
  void *v20;
  id v21;
  _QWORD v22[3];
  _QWORD v23[4];

  v23[3] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __90___MPCQueueControllerBehaviorMusicSharePlay__emitEventsForParticipants_localUserIdentity___block_invoke;
  v20 = &unk_24CAB5EF0;
  v7 = v6;
  v21 = v7;
  objc_msgSend(a3, "msv_compactMap:", &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCQueueControllerBehaviorMusicSharePlay host](self, "host", v17, v18, v19, v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "eventStream");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = CFSTR("session-id");
  -[_MPCQueueControllerBehaviorMusicSharePlay sessionID](self, "sessionID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[0] = v12;
  v22[1] = CFSTR("shared-session-id");
  -[_MPCQueueControllerBehaviorMusicSharePlay sessionID](self, "sessionID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = CFSTR("participants");
  v15 = (void *)MEMORY[0x24BDBD1A8];
  if (v8)
    v15 = v8;
  v23[1] = v14;
  v23[2] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emitEventType:payload:", CFSTR("shared-session-participants-changed"), v16);

  if (!v13)
  if (!v11)

}

- (void)_emitEventsForPlaybackBehaviorChange
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  if (-[_MPCQueueControllerBehaviorMusicSharePlay canUserEnableAutoPlayWithReason:](self, "canUserEnableAutoPlayWithReason:", 0))
  {
    if (-[_MPCQueueControllerBehaviorMusicSharePlay autoPlayEnabled](self, "autoPlayEnabled"))
      v3 = 2;
    else
      v3 = 1;
  }
  else
  {
    v3 = 3;
  }
  -[_MPCQueueControllerBehaviorMusicSharePlay host](self, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = CFSTR("session-id");
  -[_MPCQueueControllerBehaviorMusicSharePlay sessionID](self, "sessionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = CFSTR("playback-behavior-metadata");
  v14[0] = v7;
  v11 = CFSTR("autoplay-mode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emitEventType:payload:", CFSTR("playback-behavior-changed"), v10);

  if (!v6)
}

- (void)_enqueuePendingActionWithLabel:(id)a3 itemIdentifier:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  _MPCQCBMSPPendingAction *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  _MPCQCBMSPPendingAction *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[NSDictionary objectForKeyedSubscript:](self->_resultsIndexPathMap, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[MPRequestResponseController response](self->_requestController, "response");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "modelResponse");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "results");
    v14 = (_MPCQCBMSPPendingAction *)objc_claimAutoreleasedReturnValue();

    -[_MPCQCBMSPPendingAction identifiersForItemAtIndexPath:](v14, "identifiersForItemAtIndexPath:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "isPlaceholder") & 1) == 0)
    {
      v10[2](v10, 0);
      goto LABEL_8;
    }

  }
  v14 = objc_alloc_init(_MPCQCBMSPPendingAction);
  -[_MPCQCBMSPPendingAction setLabel:](v14, "setLabel:", v8);
  -[_MPCQCBMSPPendingAction setItemIdentifier:](v14, "setItemIdentifier:", v9);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 5.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MPCQCBMSPPendingAction setExpirationDate:](v14, "setExpirationDate:", v16);

  -[_MPCQCBMSPPendingAction setBlock:](v14, "setBlock:", v10);
  -[NSMutableArray addObject:](self->_pendingActions, "addObject:", v14);
  -[_MPCQueueControllerBehaviorMusicSharePlay host](self, "host");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v15, "engineID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MPCQueueControllerBehaviorMusicSharePlay sessionID](self, "sessionID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543874;
    v21 = v18;
    v22 = 2114;
    v23 = v19;
    v24 = 2114;
    v25 = v14;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] _enqueuePendingActionWithLabel:itemIdentifier:block: | enqueuing [] action=%{public}@", (uint8_t *)&v20, 0x20u);

  }
LABEL_8:

}

- (void)_initializeWithQueue:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _MPCQueueControllerBehaviorMusicSharePlay *v13;
  id v14;
  id v15;
  SEL v16;

  v5 = a3;
  -[_MPCQueueControllerBehaviorMusicSharePlay host](self, "host");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginEditWithReason:", CFSTR("BehaviorMusicSharePlay-initialLoad"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __66___MPCQueueControllerBehaviorMusicSharePlay__initializeWithQueue___block_invoke;
  v11[3] = &unk_24CAB5F28;
  v12 = v6;
  v13 = self;
  v15 = v5;
  v16 = a2;
  v14 = v7;
  v8 = v5;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "getExpectedCurrentItemWithCompletion:", v11);

}

- (id)_itemObjectForSharedListeningItemID:(id)a3
{
  MPRequestResponseController *requestController;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  requestController = self->_requestController;
  v5 = a3;
  -[MPRequestResponseController response](requestController, "response");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modelResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "results");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKeyedSubscript:](self->_resultsIndexPathMap, "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "itemAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_mpcSharedListeningEventForICLiveLinkEvent:(id)a3
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
  void *v13;
  uint64_t v14;
  uint64_t v15;
  MPCSharedListeningSessionEvent *v16;
  uint64_t v17;
  uint64_t v18;
  MPCSharedListeningPlaybackEvent *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  MPCSharedListeningQueueEventContentAdded *v27;
  MPCSharedListeningQueueEventContentAdded *v28;
  void *v29;
  void *v30;
  NSDictionary *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  MPCSharedListeningReactionEvent *v36;
  void *v37;
  void *v38;
  MPCSharedListeningReactionEvent *v39;
  void *v40;
  MPCSharedListeningCustomEvent *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void *v47;
  NSDictionary *resultsIndexPathMap;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSDictionary *v53;
  void *v54;
  MPCSharedListeningQueueEventContentUpdatedMessage *v55;
  void *v56;
  void *v57;
  MPCSharedListeningQueueEventContentReordered *v58;
  uint64_t v59;
  uint64_t v60;
  MPCSharedListeningQueueEventPlaybackModeChanged *v61;
  uint64_t (**v62)(void);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSDictionary *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  MPCSharedListeningQueueEventContentPlayedNow *v76;
  MPCSharedListeningQueueEventContentPlayedNow *v77;
  MPCSharedListeningQueueEventContentUpdatedMessage *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  MPCSharedListeningQueueEventContentRemoved *v82;
  MPCSharedListeningQueueEventPlaybackModeChanged *v83;
  MPCSharedListeningQueueEventPlaybackModeChanged *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v88;
  uint64_t v89;
  void (*v90)(uint64_t, void *, uint64_t, _BYTE *);
  void *v91;
  id v92;
  id v93;
  _MPCQueueControllerBehaviorMusicSharePlay *v94;
  id v95;
  id v96;
  _BYTE *v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t (*v102)(uint64_t, uint64_t);
  void (*v103)(uint64_t);
  id v104;
  _QWORD v105[4];
  id v106;
  id v107;
  _MPCQueueControllerBehaviorMusicSharePlay *v108;
  id v109;
  _BYTE *v110;
  _BYTE buf[24];
  uint64_t (*v112)(uint64_t, uint64_t);
  void (*v113)(uint64_t);
  id v114;
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "participant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "participant");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "externalIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MPCSharedListeningEventParticipant participantWithSharedListeningIdentifier:externalIdentifier:](MPCSharedListeningEventParticipant, "participantWithSharedListeningIdentifier:externalIdentifier:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MPRequestResponseController response](self->_requestController, "response");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "modelResponse");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "results");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  switch(objc_msgSend(v4, "type"))
  {
    case 1:
      objc_msgSend(v4, "sessionEvent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "kind");
      if ((unint64_t)(v14 - 1) >= 5)
        v15 = 0;
      else
        v15 = v14;
      v16 = -[MPCSharedListeningSessionEvent initWithKind:]([MPCSharedListeningSessionEvent alloc], "initWithKind:", v15);
      +[MPCSharedListeningEvent eventWithSessionEvent:participant:](MPCSharedListeningEvent, "eventWithSessionEvent:participant:", v16, v9);
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 2:
      objc_msgSend(v4, "playbackEvent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v13, "kind");
      if ((unint64_t)(v18 - 1) <= 3
        && (v19 = -[MPCSharedListeningPlaybackEvent initWithKind:]([MPCSharedListeningPlaybackEvent alloc], "initWithKind:", v18)) != 0)
      {
        v16 = (MPCSharedListeningSessionEvent *)v19;
        +[MPCSharedListeningEvent eventWithPlaybackEvent:participant:](MPCSharedListeningEvent, "eventWithPlaybackEvent:participant:", v19, v9);
        v17 = objc_claimAutoreleasedReturnValue();
LABEL_15:
        v40 = (void *)v17;

      }
      else
      {
        v40 = 0;
      }

      goto LABEL_58;
    case 3:
      objc_msgSend(v4, "queueEvent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      switch(objc_msgSend(v20, "kind"))
      {
        case 1:
          objc_msgSend(v20, "contentAdded");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v112 = __Block_byref_object_copy__16650;
          v113 = __Block_byref_object_dispose__16651;
          v114 = 0;
          objc_msgSend(v21, "containerIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "itemIdentifiers");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v23, "count"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v105[0] = MEMORY[0x24BDAC760];
          v105[1] = 3221225472;
          v105[2] = __88___MPCQueueControllerBehaviorMusicSharePlay__mpcSharedListeningEventForICLiveLinkEvent___block_invoke;
          v105[3] = &unk_24CAB5F78;
          v25 = v22;
          v106 = v25;
          v110 = buf;
          v107 = v12;
          v108 = self;
          v26 = v24;
          v109 = v26;
          objc_msgSend(v107, "enumerateSectionsUsingBlock:", v105);
          v27 = [MPCSharedListeningQueueEventContentAdded alloc];
          v28 = -[MPCSharedListeningQueueEventContentAdded initWithItems:container:](v27, "initWithItems:container:", v26, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
          +[MPCSharedListeningQueueEvent queueEventWithAddedContent:](MPCSharedListeningQueueEvent, "queueEventWithAddedContent:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          _Block_object_dispose(buf, 8);
          goto LABEL_54;
        case 2:
          objc_msgSend(v20, "contentRemoved");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          resultsIndexPathMap = self->_resultsIndexPathMap;
          objc_msgSend(v47, "itemIdentifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](resultsIndexPathMap, "objectForKeyedSubscript:", v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();

          if (v50)
          {
            objc_msgSend(v12, "itemAtIndexPath:", v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = (void *)objc_msgSend(v51, "copyWithPropertySet:", self->_requestedPropertySetForEvents);

          }
          else
          {
            v52 = 0;
          }
          v82 = -[MPCSharedListeningQueueEventContentRemoved initWithItem:]([MPCSharedListeningQueueEventContentRemoved alloc], "initWithItem:", v52);
          +[MPCSharedListeningQueueEvent queueEventWithRemovedContent:](MPCSharedListeningQueueEvent, "queueEventWithRemovedContent:", v82);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_53;
        case 3:
          objc_msgSend(v20, "contentReordered");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = self->_resultsIndexPathMap;
          objc_msgSend(v47, "itemIdentifier");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](v53, "objectForKeyedSubscript:", v54);
          v55 = (MPCSharedListeningQueueEventContentUpdatedMessage *)objc_claimAutoreleasedReturnValue();

          if (!v55)
            goto LABEL_39;
          objc_msgSend(v12, "itemAtIndexPath:", v55);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = (void *)objc_msgSend(v56, "copyWithPropertySet:", self->_requestedPropertySetForEvents);

          if (!v57)
            goto LABEL_39;
          v58 = -[MPCSharedListeningQueueEventContentReordered initWithItem:]([MPCSharedListeningQueueEventContentReordered alloc], "initWithItem:", v57);
          +[MPCSharedListeningQueueEvent queueEventWithReorderedContent:](MPCSharedListeningQueueEvent, "queueEventWithReorderedContent:", v58);
          v59 = objc_claimAutoreleasedReturnValue();
          goto LABEL_38;
        case 4:
          objc_msgSend(v20, "playbackModeChanged");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v47, "kind");
          switch(v60)
          {
            case 3:
              v83 = [MPCSharedListeningQueueEventPlaybackModeChanged alloc];
              objc_msgSend(v47, "autoPlayEnabled");
              v62 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
              v65 = -[MPCSharedListeningQueueEventPlaybackModeChanged initWithUpdatedAutoPlayEnabled:](v83, "initWithUpdatedAutoPlayEnabled:", v62[2]());
              break;
            case 2:
              v84 = [MPCSharedListeningQueueEventPlaybackModeChanged alloc];
              objc_msgSend(v47, "repeatType");
              v62 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
              v85 = v62[2]();
              if (v85 == 3)
                v86 = 2;
              else
                v86 = v85 == 2;
              v65 = -[MPCSharedListeningQueueEventPlaybackModeChanged initWithUpdatedRepeatType:](v84, "initWithUpdatedRepeatType:", v86);
              break;
            case 1:
              v61 = [MPCSharedListeningQueueEventPlaybackModeChanged alloc];
              objc_msgSend(v47, "shuffleType");
              v62 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
              v63 = v62[2]();
              if (v63 == 3)
                v64 = 2;
              else
                v64 = v63 == 2;
              v65 = -[MPCSharedListeningQueueEventPlaybackModeChanged initWithUpdatedShuffleType:](v61, "initWithUpdatedShuffleType:", v64);
              break;
            default:
LABEL_59:
              v29 = 0;
              goto LABEL_53;
          }
          v55 = (MPCSharedListeningQueueEventContentUpdatedMessage *)v65;

          if (!v55)
            goto LABEL_59;
          +[MPCSharedListeningQueueEvent queueEventWithPlaybackModeChanged:](MPCSharedListeningQueueEvent, "queueEventWithPlaybackModeChanged:", v55);
          v81 = objc_claimAutoreleasedReturnValue();
LABEL_51:
          v29 = (void *)v81;
LABEL_52:

LABEL_53:
LABEL_54:
          if (v29)
          {
            +[MPCSharedListeningEvent eventWithQueueEvent:participant:](MPCSharedListeningEvent, "eventWithQueueEvent:participant:", v29, v9);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
LABEL_56:
            v40 = 0;
          }

LABEL_58:
          return v40;
        case 5:
          objc_msgSend(v20, "contentReplaced");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = self->_resultsIndexPathMap;
          objc_msgSend(v47, "startItemIdentifier");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](v66, "objectForKeyedSubscript:", v67);
          v55 = (MPCSharedListeningQueueEventContentUpdatedMessage *)objc_claimAutoreleasedReturnValue();

          if (v55
            && (objc_msgSend(v12, "itemAtIndexPath:", v55),
                v68 = (void *)objc_claimAutoreleasedReturnValue(),
                v57 = (void *)objc_msgSend(v68, "copyWithPropertySet:", self->_requestedPropertySetForEvents),
                v68,
                v57))
          {
            v58 = -[MPCSharedListeningQueueEventContentReplaced initWithStartItem:]([MPCSharedListeningQueueEventContentReplaced alloc], "initWithStartItem:", v57);
            +[MPCSharedListeningQueueEvent queueEventWithReplacedContent:](MPCSharedListeningQueueEvent, "queueEventWithReplacedContent:", v58);
            v59 = objc_claimAutoreleasedReturnValue();
LABEL_38:
            v29 = (void *)v59;

          }
          else
          {
LABEL_39:
            v29 = 0;
          }
          goto LABEL_52;
        case 6:
          objc_msgSend(v20, "contentPlayedNow");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v112 = __Block_byref_object_copy__16650;
          v113 = __Block_byref_object_dispose__16651;
          v114 = 0;
          objc_msgSend(v69, "containerIdentifier");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = 0;
          v100 = &v99;
          v101 = 0x3032000000;
          v102 = __Block_byref_object_copy__16650;
          v103 = __Block_byref_object_dispose__16651;
          v104 = 0;
          objc_msgSend(v69, "itemIdentifiers");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v71, "count"));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = MEMORY[0x24BDAC760];
          v89 = 3221225472;
          v90 = __88___MPCQueueControllerBehaviorMusicSharePlay__mpcSharedListeningEventForICLiveLinkEvent___block_invoke_3;
          v91 = &unk_24CAB5FC8;
          v73 = v70;
          v92 = v73;
          v97 = buf;
          v93 = v12;
          v94 = self;
          v74 = v69;
          v95 = v74;
          v98 = &v99;
          v75 = v72;
          v96 = v75;
          objc_msgSend(v93, "enumerateSectionsUsingBlock:", &v88);
          v76 = [MPCSharedListeningQueueEventContentPlayedNow alloc];
          v77 = -[MPCSharedListeningQueueEventContentPlayedNow initWithItems:container:startItem:](v76, "initWithItems:container:startItem:", v75, *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v100[5], v88, v89, v90, v91);
          +[MPCSharedListeningQueueEvent queueEventWithPlayedNowContent:](MPCSharedListeningQueueEvent, "queueEventWithPlayedNowContent:", v77);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          _Block_object_dispose(&v99, 8);
          _Block_object_dispose(buf, 8);

          goto LABEL_54;
        case 7:
          objc_msgSend(v20, "contentUpdatedMessage");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = [MPCSharedListeningQueueEventContentUpdatedMessage alloc];
          objc_msgSend(v47, "localizedTitle");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "localizedMessage");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = -[MPCSharedListeningQueueEventContentUpdatedMessage initWithLocalizedTitle:localizedMessage:](v78, "initWithLocalizedTitle:localizedMessage:", v79, v80);

          +[MPCSharedListeningQueueEvent queueEventWithContentUpdatedMessage:](MPCSharedListeningQueueEvent, "queueEventWithContentUpdatedMessage:", v55);
          v81 = objc_claimAutoreleasedReturnValue();
          goto LABEL_51;
        default:
          goto LABEL_56;
      }
    case 4:
      objc_msgSend(v4, "reactionEvent");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = self->_resultsIndexPathMap;
      objc_msgSend(v30, "itemIdentifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](v31, "objectForKeyedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33
        && (objc_msgSend(v12, "itemAtIndexPath:", v33),
            v34 = (void *)objc_claimAutoreleasedReturnValue(),
            v35 = (void *)objc_msgSend(v34, "copyWithPropertySet:", self->_requestedPropertySetForEvents),
            v34,
            v35))
      {
        v36 = [MPCSharedListeningReactionEvent alloc];
        objc_msgSend(v30, "reaction");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "reactionIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[MPCSharedListeningReactionEvent initWithReaction:reactionIdentifier:item:](v36, "initWithReaction:reactionIdentifier:item:", v37, v38, v35);

        +[MPCSharedListeningEvent eventWithReactionEvent:participant:](MPCSharedListeningEvent, "eventWithReactionEvent:participant:", v39, v9);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[_MPCQueueControllerBehaviorMusicSharePlay host](self, "host");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v35, "engineID");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusicSharePlay sessionID](self, "sessionID");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "itemIdentifier");
          v46 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v44;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v45;
          *(_WORD *)&buf[22] = 2114;
          v112 = v46;
          _os_log_impl(&dword_210BD8000, v43, OS_LOG_TYPE_ERROR, "[BMSP:%{public}@:%{public}@] _mpcSharedListeningEventForICLiveLinkEvent: | dropping event [unknown item] event=Reaction itemIdentifier=%{public}@", buf, 0x20u);

        }
        v40 = 0;
      }

      goto LABEL_58;
    case 5:
      objc_msgSend(v4, "customEvent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = [MPCSharedListeningCustomEvent alloc];
      objc_msgSend(v13, "localizedMessage");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[MPCSharedListeningCustomEvent initWithLocalizedMessage:](v41, "initWithLocalizedMessage:", v42);

      +[MPCSharedListeningEvent eventWithCustomEvent:participant:](MPCSharedListeningEvent, "eventWithCustomEvent:participant:", v16, v9);
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    default:
      v40 = 0;
      goto LABEL_58;
  }
}

- (void)_purgePendingActionsWithLabel:(id)a3
{
  id v4;
  NSMutableArray *pendingActions;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  id v18;
  _MPCQueueControllerBehaviorMusicSharePlay *v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pendingActions = self->_pendingActions;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __75___MPCQueueControllerBehaviorMusicSharePlay__purgePendingActionsWithLabel___block_invoke;
  v26[3] = &unk_24CAB5FF0;
  v18 = v4;
  v27 = v18;
  -[NSMutableArray indexesOfObjectsPassingTest:](pendingActions, "indexesOfObjectsPassingTest:", v26);
  v6 = objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectsAtIndexes:](self->_pendingActions, "objectsAtIndexes:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)v6;
  -[NSMutableArray removeObjectsAtIndexes:](self->_pendingActions, "removeObjectsAtIndexes:", v6);
  v19 = self;
  -[_MPCQueueControllerBehaviorMusicSharePlay host](self, "host");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v13 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicSharePlayBehavior");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v20, "engineID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusicSharePlay sessionID](v19, "sessionID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v29 = v14;
          v30 = 2114;
          v31 = v15;
          v32 = 2114;
          v33 = v12;
          _os_log_impl(&dword_210BD8000, v13, OS_LOG_TYPE_DEFAULT, "[BMSP:%{public}@:%{public}@] _purgePendingActionsWithLabel: | calling action [purged] action=%{public}@", buf, 0x20u);

        }
        objc_msgSend(v12, "block");
        v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v16[2](v16, 2);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v9);
  }

}

- (id)_queueAsStateDictionary
{
  __CFString *v3;
  uint64_t v4;
  ICSharedListeningQueue *queue;
  __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t);
  void *v19;
  _MPCQueueControllerBehaviorMusicSharePlay *v20;
  id v21;
  id v22;
  _QWORD v23[5];
  _QWORD v24[6];

  v24[5] = *MEMORY[0x24BDAC8D0];
  if (-[ICSharedListeningQueue explicitContentState](self->_queue, "explicitContentState") == 1)
  {
    v3 = CFSTR("Explicit");
  }
  else
  {
    v4 = -[ICSharedListeningQueue explicitContentState](self->_queue, "explicitContentState");
    v3 = CFSTR("Neutral");
    if (v4 == 2)
      v3 = CFSTR("Restricted");
  }
  queue = self->_queue;
  v6 = v3;
  -[ICSharedListeningQueue tracklist](queue, "tracklist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __68___MPCQueueControllerBehaviorMusicSharePlay__queueAsStateDictionary__block_invoke;
  v19 = &unk_24CAB6040;
  v20 = self;
  v21 = v8;
  v22 = v7;
  v9 = v7;
  v10 = v8;
  objc_msgSend(v9, "enumerateSectionsUsingBlock:", &v16);
  v23[0] = CFSTR("_autoPlayAvailable");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ICSharedListeningQueue isAutoPlayAvailable](self->_queue, "isAutoPlayAvailable", v16, v17, v18, v19, v20));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  v23[1] = CFSTR("_autoPlayEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ICSharedListeningQueue isAutoPlayEnabled](self->_queue, "isAutoPlayEnabled"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v12;
  v23[2] = CFSTR("_hasActiveRadioStation");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ICSharedListeningQueue hasActiveRadioStation](self->_queue, "hasActiveRadioStation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v13;
  v24[3] = v6;
  v23[3] = CFSTR("_explicitContentState");
  v23[4] = CFSTR("tracklist");
  v24[4] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)_reloadCacheDataWithOptions:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSDictionary *v9;
  NSDictionary *resultsIndexPathMap;
  void *v11;
  id v12;
  NSArray *v13;
  NSArray *enumeratorContentItemIDs;
  id v15;
  _QWORD v16[4];
  id v17;
  _MPCQueueControllerBehaviorMusicSharePlay *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v4 = MEMORY[0x24BDAC760];
  if ((a3 & 1) != 0)
  {
    -[MPRequestResponseController response](self->_requestController, "response");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "modelResponse");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "results");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v7, "totalItemCount"));
    v20[0] = v4;
    v20[1] = 3221225472;
    v20[2] = __73___MPCQueueControllerBehaviorMusicSharePlay__reloadCacheDataWithOptions___block_invoke;
    v20[3] = &unk_24CAB6068;
    v21 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v21;
    objc_msgSend(v7, "enumerateItemIdentifiersUsingBlock:", v20);
    v9 = (NSDictionary *)objc_msgSend(v8, "copy");
    resultsIndexPathMap = self->_resultsIndexPathMap;
    self->_resultsIndexPathMap = v9;

  }
  -[ICSharedListeningQueue tracklist](self->_queue, "tracklist");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v11, "totalItemCount"));
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __73___MPCQueueControllerBehaviorMusicSharePlay__reloadCacheDataWithOptions___block_invoke_2;
  v16[3] = &unk_24CAB6040;
  v17 = v11;
  v18 = self;
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v19;
  v15 = v11;
  objc_msgSend(v15, "enumerateSectionsUsingBlock:", v16);
  v13 = (NSArray *)objc_msgSend(v12, "copy");
  enumeratorContentItemIDs = self->_enumeratorContentItemIDs;
  self->_enumeratorContentItemIDs = v13;

}

- (id)_sectionedCollectionForQueue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _MPCQueueControllerBehaviorMusicSharePlay *v17;

  v4 = a3;
  -[_MPCQueueControllerBehaviorMusicSharePlay host](self, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDDCA88]);
  objc_msgSend(v4, "tracklist");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __74___MPCQueueControllerBehaviorMusicSharePlay__sectionedCollectionForQueue___block_invoke;
  v13[3] = &unk_24CAB6158;
  v8 = v6;
  v14 = v8;
  v15 = v4;
  v16 = v5;
  v17 = self;
  v9 = v5;
  v10 = v4;
  objc_msgSend(v7, "enumerateSectionsUsingBlock:", v13);

  v11 = v8;
  return v11;
}

- (id)_sectionObjectForSharedListeningContainerID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  -[MPRequestResponseController response](self->_requestController, "response");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modelResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "results");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__16650;
  v18 = __Block_byref_object_dispose__16651;
  v19 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __89___MPCQueueControllerBehaviorMusicSharePlay__sectionObjectForSharedListeningContainerID___block_invoke;
  v11[3] = &unk_24CAB6180;
  v8 = v4;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v7, "enumerateSectionsUsingBlock:", v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)_setQueue:(id)a3
{
  ICSharedListeningQueue *v5;
  ICSharedListeningQueue *queue;
  id *p_queue;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  ICSharedListeningQueue *v16;
  _QWORD v17[5];

  v5 = (ICSharedListeningQueue *)a3;
  p_queue = (id *)&self->_queue;
  queue = self->_queue;
  v16 = v5;
  if (queue != v5)
  {
    if (!queue
      || (v8 = -[ICSharedListeningQueue isAutoPlayEnabled](queue, "isAutoPlayEnabled"),
          v8 != -[ICSharedListeningQueue isAutoPlayEnabled](v16, "isAutoPlayEnabled")))
    {
      -[_MPCQueueControllerBehaviorMusicSharePlay musicBehaviorDelegate](self, "musicBehaviorDelegate", v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[_MPCQueueControllerBehaviorMusicSharePlay autoPlayEnabled](self, "autoPlayEnabled"))
        v10 = 3;
      else
        v10 = 2;
      objc_msgSend(v9, "behavior:didChangeActionAtQueueEnd:", self, v10);

      -[_MPCQueueControllerBehaviorMusicSharePlay _emitEventsForPlaybackBehaviorChange](self, "_emitEventsForPlaybackBehaviorChange");
    }
    if (!*p_queue
      || (v11 = objc_msgSend(*p_queue, "explicitContentState"),
          v11 != -[ICSharedListeningQueue explicitContentState](v16, "explicitContentState")))
    {
      v12 = -[ICSharedListeningQueue explicitContentState](v16, "explicitContentState", v16);
      if (v12 == 2)
        v13 = 2;
      else
        v13 = v12 == 1;
      -[_MPCQueueControllerBehaviorMusicSharePlay musicSharePlayBehaviorDelegate](self, "musicSharePlayBehaviorDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "behavior:didChangeExplicitContentState:", self, v13);

    }
    objc_storeStrong((id *)&self->_queue, a3);
    -[ICSharedListeningQueue tracklist](self->_queue, "tracklist");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __55___MPCQueueControllerBehaviorMusicSharePlay__setQueue___block_invoke;
    v17[3] = &unk_24CAB61A8;
    v17[4] = self;
    objc_msgSend(v15, "enumerateSectionsUsingBlock:", v17);

    -[_MPCQueueControllerBehaviorMusicSharePlay _reloadCacheDataWithOptions:](self, "_reloadCacheDataWithOptions:", 0);
  }

}

- (BOOL)_useItemPlaceholderForItemID:(id)a3
{
  MPRequestResponseController *requestController;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  requestController = self->_requestController;
  v5 = a3;
  -[MPRequestResponseController response](requestController, "response");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modelResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "results");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDictionary objectForKeyedSubscript:](self->_resultsIndexPathMap, "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v8, "identifiersForItemAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isPlaceholder");

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (BOOL)_useItemPlaceholderForContentItemID:(id)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v9;

  -[_MPCQueueControllerBehaviorMusicSharePlay _componentsForContentItemID:](self, "_componentsForContentItemID:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "type"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_MPCQueueControllerBehaviorMusicSharePlay.m"), 1797, CFSTR("This method only supports MPCQueueControllerBehaviorItemTypeItem"));

  }
  objc_msgSend(v5, "itemID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_MPCQueueControllerBehaviorMusicSharePlay _useItemPlaceholderForItemID:](self, "_useItemPlaceholderForItemID:", v6);

  return v7;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (MPCQueueControllerBehaviorHost)host
{
  return (MPCQueueControllerBehaviorHost *)objc_loadWeakRetained((id *)&self->_host);
}

- (MPCQueueControllerExternalSyncBehaviorHost)externalSyncHost
{
  return (MPCQueueControllerExternalSyncBehaviorHost *)objc_loadWeakRetained((id *)&self->_externalSyncHost);
}

- (MPCQueueControllerBehaviorMusicDelegate)musicBehaviorDelegate
{
  return (MPCQueueControllerBehaviorMusicDelegate *)objc_loadWeakRetained((id *)&self->_musicBehaviorDelegate);
}

- (void)setMusicBehaviorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_musicBehaviorDelegate, a3);
}

- (int64_t)repeatType
{
  return self->_repeatType;
}

- (int64_t)shuffleType
{
  return self->_shuffleType;
}

- (MPCQueueControllerBehaviorMusicSharePlayDelegate)musicSharePlayBehaviorDelegate
{
  return (MPCQueueControllerBehaviorMusicSharePlayDelegate *)objc_loadWeakRetained((id *)&self->_musicSharePlayBehaviorDelegate);
}

- (void)setMusicSharePlayBehaviorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_musicSharePlayBehaviorDelegate, a3);
}

- (MPPropertySet)requestedPropertySetForEvents
{
  return self->_requestedPropertySetForEvents;
}

- (BOOL)hasUserMutations
{
  return self->_hasUserMutations;
}

- (ICLiveLink)liveLink
{
  return self->_liveLink;
}

- (void)setLiveLink:(id)a3
{
  objc_storeStrong((id *)&self->_liveLink, a3);
}

- (ICSharedListeningQueue)queue
{
  return self->_queue;
}

- (MPRequestResponseController)requestController
{
  return self->_requestController;
}

- (void)setRequestController:(id)a3
{
  objc_storeStrong((id *)&self->_requestController, a3);
}

- (MPCModelGenericAVItemUserIdentityPropertySet)identityPropertySet
{
  return self->_identityPropertySet;
}

- (void)setIdentityPropertySet:(id)a3
{
  objc_storeStrong((id *)&self->_identityPropertySet, a3);
}

- (NSMutableArray)pendingActions
{
  return self->_pendingActions;
}

- (void)setPendingActions:(id)a3
{
  objc_storeStrong((id *)&self->_pendingActions, a3);
}

- (NSMutableSet)knownContainerIDs
{
  return self->_knownContainerIDs;
}

- (void)setKnownContainerIDs:(id)a3
{
  objc_storeStrong((id *)&self->_knownContainerIDs, a3);
}

- (NSDictionary)resultsIndexPathMap
{
  return self->_resultsIndexPathMap;
}

- (void)setResultsIndexPathMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSArray)enumeratorContentItemIDs
{
  return self->_enumeratorContentItemIDs;
}

- (void)setEnumeratorContentItemIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BOOL)joiningAsInitiator
{
  return self->_joiningAsInitiator;
}

- (void)setJoiningAsInitiator:(BOOL)a3
{
  self->_joiningAsInitiator = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumeratorContentItemIDs, 0);
  objc_storeStrong((id *)&self->_resultsIndexPathMap, 0);
  objc_storeStrong((id *)&self->_knownContainerIDs, 0);
  objc_storeStrong((id *)&self->_pendingActions, 0);
  objc_storeStrong((id *)&self->_identityPropertySet, 0);
  objc_storeStrong((id *)&self->_requestController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_liveLink, 0);
  objc_storeStrong((id *)&self->_requestedPropertySetForEvents, 0);
  objc_destroyWeak((id *)&self->_musicSharePlayBehaviorDelegate);
  objc_destroyWeak((id *)&self->_musicBehaviorDelegate);
  objc_destroyWeak((id *)&self->_externalSyncHost);
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_playbackRequestEnvironment, 0);
  objc_storeStrong(&self->_loadingCompletionHandler, 0);
  objc_storeStrong((id *)&self->_playbackCoordinator, 0);
}

+ (BOOL)canLoadQueue:(id)a3 reason:(id *)a4
{
  id v5;
  void *v6;
  char v7;
  BOOL v8;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(CFSTR("InProcess-com.apple.music.playbackqueue.sharedlistening"), "isEqualToString:", v6);
    v8 = v7;
    if (a4 && (v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unsupported custom data playback queue: %@"), v6);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unsupported playback queue: %@"), objc_opt_class());
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
