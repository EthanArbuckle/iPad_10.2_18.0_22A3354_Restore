@implementation MPCSharedListeningPlaybackIntentDataSource

- (void)buildSharedSessionIntentWithIntent:(id)a3 identity:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  _QWORD v18[5];
  id v19[2];
  id buf[2];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[MPCSharedListeningPlaybackIntentDataSource setStrongSelf:](self, "setStrongSelf:", self);
  -[MPCSharedListeningPlaybackIntentDataSource setInitialIntent:](self, "setInitialIntent:", v9);
  -[MPCSharedListeningPlaybackIntentDataSource setShuffleMode:](self, "setShuffleMode:", objc_msgSend(v9, "shuffleMode"));
  -[MPCSharedListeningPlaybackIntentDataSource setIdentity:](self, "setIdentity:", v10);
  -[MPCSharedListeningPlaybackIntentDataSource setCompletion:](self, "setCompletion:", v11);
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
  v13 = os_signpost_id_make_with_pointer(v12, v9);

  v14 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "build", ", (uint8_t *)buf, 2u);
  }

  -[MPCSharedListeningPlaybackIntentDataSource setLock:](self, "setLock:", 0);
  objc_initWeak(buf, self);
  v16 = objc_alloc(MEMORY[0x24BE65C40]);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __101__MPCSharedListeningPlaybackIntentDataSource_buildSharedSessionIntentWithIntent_identity_completion___block_invoke;
  v18[3] = &unk_24CAB0C10;
  v19[1] = (id)a2;
  v18[4] = self;
  objc_copyWeak(v19, buf);
  v17 = (void *)objc_msgSend(v16, "initWithTimeout:interruptionHandler:", v18, 25.0);
  -[MPCSharedListeningPlaybackIntentDataSource setGuard:](self, "setGuard:", v17);

  -[MPCSharedListeningPlaybackIntentDataSource _transitionToBuildState:](self, "_transitionToBuildState:", 1);
  objc_destroyWeak(v19);
  objc_destroyWeak(buf);

}

- (void)getRepresentativeObjectFromIntent:(id)a3 properties:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  _MPCQueueControllerBehaviorMusicSharePlay *v10;
  id v11;
  _MPCQueueControllerBehaviorMusicSharePlay *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _MPCQueueControllerBehaviorMusicSharePlay *v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = -[_MPCQueueControllerBehaviorMusicSharePlay initWithSessionID:]([_MPCQueueControllerBehaviorMusicSharePlay alloc], "initWithSessionID:", 0);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __102__MPCSharedListeningPlaybackIntentDataSource_getRepresentativeObjectFromIntent_properties_completion___block_invoke;
  v15[3] = &unk_24CAB0C60;
  v16 = v7;
  v17 = v10;
  v18 = v8;
  v19 = v9;
  v11 = v8;
  v12 = v10;
  v13 = v7;
  v14 = v9;
  objc_msgSend(v13, "getRemotePlaybackQueueWithDestination:completion:", 1, v15);

}

- (void)getRemotePlaybackQueueFromIntent:(id)a3 destination:(int64_t)a4 completion:(id)a5
{
  id v7;
  void (**v8)(id, void *, _QWORD);
  void *v9;
  _BOOL8 v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, void *, _QWORD))a5;
  if ((unint64_t)(a4 - 2) < 2)
    goto LABEL_4;
  if (a4 == 1)
  {
    objc_msgSend(v7, "tracklistToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "actionAfterQueueLoad") == 20;
    v11 = objc_alloc(MEMORY[0x24BDDC728]);
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    v13 = *MEMORY[0x24BE658E0];
    v18[0] = CFSTR("sharedListeningToken");
    v18[1] = v13;
    objc_msgSend(v9, "sharedListeningProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sessionIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v11, "initWithIdentifier:data:options:", CFSTR("InProcess-com.apple.music.playbackqueue.sharedlistening"), v12, v16);

    objc_msgSend(v17, "setRequestingImmediatePlayback:", v10);
    v8[2](v8, v17, 0);

    goto LABEL_6;
  }
  if (!a4)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 58, CFSTR("Cannot create a remote queue for destination: %ld"), a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v8)[2](v8, 0, v9);
LABEL_6:

  }
}

- (void)didStartLiveLink:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
  v6 = os_signpost_id_make_with_pointer(v5, self->_initialIntent);

  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v8, OS_SIGNPOST_INTERVAL_END, v6, "link:start", ", v11, 2u);
  }

  -[MPCSharedListeningPlaybackIntentDataSource _transitionToLiveLinkState:](self, "_transitionToLiveLinkState:", 3);
  +[MPCSharedListeningLiveLinkReusePool sharedReusePool](MPCSharedListeningLiveLinkReusePool, "sharedReusePool");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "storeLiveLink:forSessionID:", v4, v10);

}

- (void)liveLink:(id)a3 didEncounterError:(id)a4 willRetry:(BOOL)a5
{
  id v6;

  if (!a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCError"), 1, a4, CFSTR("Live link connection failed"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[MPCSharedListeningPlaybackIntentDataSource _transitionToLiveLinkState:error:](self, "_transitionToLiveLinkState:error:", 2, v6);

  }
}

- (void)liveLink:(id)a3 didUpdateQueue:(id)a4
{
  id v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t buf[4];
  MPCSharedListeningPlaybackIntentDataSource *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  v6 = -[MPCSharedListeningPlaybackIntentDataSource linkState](self, "linkState");
  os_unfair_lock_unlock(&self->_lock);
  if (v6 == 3)
  {
    objc_msgSend(v5, "items");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      v9 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(v5, "items");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 28, CFSTR("Canceling intent loading because live link already had content %@"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[MPCSharedListeningPlaybackIntentDataSource _transitionToLiveLinkState:error:](self, "_transitionToLiveLinkState:error:", 2, v11);
    }
    else
    {
      -[MPCSharedListeningPlaybackIntentDataSource _transitionToLiveLinkState:](self, "_transitionToLiveLinkState:", 4);
    }
  }
  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v14 = self;
    _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_INFO, "%{public}@ didUpdateQueue:", buf, 0xCu);
  }

}

- (void)_transitionToBuildState:(int64_t)a3
{
  -[MPCSharedListeningPlaybackIntentDataSource _transitionToBuildState:intent:error:](self, "_transitionToBuildState:intent:error:", a3, 0, 0);
}

- (void)_transitionToBuildState:(int64_t)a3 intent:(id)a4 error:(id)a5
{
  __CFString *v9;
  id v10;
  os_unfair_lock_s *p_lock;
  int64_t buildState;
  int64_t v13;
  int v14;
  int v15;
  int v16;
  NSObject *v17;
  MPCPlaybackIntent *v18;
  unint64_t v19;
  int v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  id v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  os_signpost_id_t v30;
  NSObject *v31;
  NSObject *v32;
  int v33;
  void *v34;
  MPCPlayerCommandStatus *v35;
  void *v36;
  MPCPlayerCommandStatus *v37;
  NSObject *v38;
  MPCPlaybackIntent *v39;
  NSObject *v40;
  os_signpost_id_t v41;
  NSObject *v42;
  NSObject *v43;
  void (**v44)(_QWORD, _QWORD, _QWORD);
  NSObject *v45;
  id v46;
  __CFString *v47;
  MPCPlaybackIntent *initialIntent;
  unint64_t v49;
  __CFString *v50;
  void *v51;
  unint64_t v52;
  __CFString *v53;
  __CFString *v54;
  __CFString *v55;
  __CFString *v56;
  id v57;
  __CFString *v58;
  _QWORD v59[6];
  uint8_t buf[4];
  MPCPlaybackIntent *v61;
  __int16 v62;
  __CFString *v63;
  __int16 v64;
  __CFString *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v9 = (__CFString *)a4;
  v10 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  buildState = self->_buildState;
  v13 = a3 | (buildState << 16);
  if (v13 > 65539)
  {
    if ((unint64_t)(v13 - 262149) >= 2)
    {
      if (v13 == 65540)
      {
        v14 = 0;
        v16 = 0;
        v15 = 1;
        goto LABEL_7;
      }
      goto LABEL_33;
    }
LABEL_6:
    v15 = 0;
    v16 = 0;
    v14 = 1;
    goto LABEL_7;
  }
  if ((unint64_t)(v13 - 65538) < 2)
    goto LABEL_6;
  if (v13 != 1)
  {
LABEL_33:
    if (buildState == 7)
    {
      v45 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = v10;
        v47 = v9;
        initialIntent = self->_initialIntent;
        v49 = self->_buildState;
        if (v49 >= 8)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown/state=%ld"), self->_buildState);
          v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v50 = off_24CAB0D58[v49];
        }
        v54 = v50;
        if ((unint64_t)a3 >= 8)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown/state=%ld"), a3);
          v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v55 = off_24CAB0D58[a3];
        }
        *(_DWORD *)buf = 138543874;
        v61 = initialIntent;
        v62 = 2114;
        v63 = v54;
        v64 = 2114;
        v65 = v55;
        _os_log_impl(&dword_210BD8000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@ _transitionToBuildState [ignoring] %{public}@ -> %{public}@", buf, 0x20u);

        v9 = v47;
        v10 = v46;
      }

      os_unfair_lock_unlock(p_lock);
      goto LABEL_30;
    }
    if (a3 != 7)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = self->_buildState;
      if (v52 >= 8)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown/state=%ld"), self->_buildState);
        v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v53 = off_24CAB0D58[v52];
      }
      if ((unint64_t)a3 >= 7)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown/state=%ld"), a3);
        v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v56 = off_24CAB0D20[a3];
      }
      objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCSharedListeningPlaybackIntentDataSource.m"), 300, CFSTR("Unexpected state transition %@ -> %@"), v53, v56);

      v14 = 0;
      v15 = 0;
      v16 = 0;
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v14 = 0;
  v15 = 0;
  v16 = 1;
LABEL_7:
  v17 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
  v58 = v9;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v57 = v10;
    v18 = self->_initialIntent;
    v19 = self->_buildState;
    v20 = v14;
    if (v19 >= 8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown/state=%ld"), self->_buildState);
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_24CAB0D58[v19];
    }
    v22 = v21;
    if ((unint64_t)a3 >= 8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown/state=%ld"), a3);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_24CAB0D58[a3];
    }
    *(_DWORD *)buf = 138543874;
    v61 = v18;
    v62 = 2114;
    v63 = v22;
    v64 = 2114;
    v65 = v23;
    _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ _transitionToBuildState %{public}@ -> %{public}@", buf, 0x20u);

    v9 = v58;
    v14 = v20;
    v10 = v57;
  }

  self->_buildState = a3;
  os_unfair_lock_unlock(&self->_lock);
  if (v16)
  {
    -[MPCSharedListeningPlaybackIntentDataSource _transitionToSourceState:](self, "_transitionToSourceState:", 1);
    -[MPCSharedListeningPlaybackIntentDataSource _transitionToLiveLinkState:](self, "_transitionToLiveLinkState:", 1);
    if (!v15)
    {
LABEL_17:
      if (!v14)
        goto LABEL_30;
      goto LABEL_24;
    }
  }
  else if (!v15)
  {
    goto LABEL_17;
  }
  v24 = v10;
  v25 = v14;
  os_unfair_lock_lock(&self->_lock);
  -[ICLiveLink queue](self->_liveLink, "queue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCSharedListeningPlaybackIntentDataSource initialTracklist](self, "initialTracklist");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPCSharedListeningPlaybackIntentDataSource startIndexPath](self, "startIndexPath");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  v29 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
  v30 = os_signpost_id_make_with_pointer(v29, self->_initialIntent);

  v31 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
  v32 = v31;
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "build:replace", ", buf, 2u);
  }

  v59[0] = MEMORY[0x24BDAC760];
  v59[1] = 3221225472;
  v59[2] = __83__MPCSharedListeningPlaybackIntentDataSource__transitionToBuildState_intent_error___block_invoke;
  v59[3] = &unk_24CAB0C88;
  v59[4] = self;
  v59[5] = v30;
  objc_msgSend(v26, "replaceTracklist:preferredStartIndexPath:completion:", v27, v28, v59);

  v33 = v25;
  v10 = v24;
  v9 = v58;
  if (v33)
  {
LABEL_24:
    -[MPCSharedListeningPlaybackIntentDataSource guard](self, "guard");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "disarm");

    v35 = [MPCPlayerCommandStatus alloc];
    objc_msgSend(v10, "mpc_remoteCommandStatus");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[MPCPlayerCommandStatus initWithMPStatus:request:](v35, "initWithMPStatus:request:", v36, 0);

    v38 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = self->_initialIntent;
      *(_DWORD *)buf = 138543874;
      v61 = v39;
      v62 = 2114;
      v63 = v9;
      v64 = 2114;
      v65 = (__CFString *)v37;
      _os_log_impl(&dword_210BD8000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: calling completion intent=%{public}@ status=%{public}@", buf, 0x20u);
    }

    v40 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    v41 = os_signpost_id_make_with_pointer(v40, self->_initialIntent);

    v42 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    v43 = v42;
    if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
    {
      *(_DWORD *)buf = 138543618;
      v61 = (MPCPlaybackIntent *)v9;
      v62 = 2114;
      v63 = (__CFString *)v37;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v43, OS_SIGNPOST_INTERVAL_END, v41, "build", "intent=%{public}@ status=%{public}@", buf, 0x16u);
    }

    -[MPCSharedListeningPlaybackIntentDataSource completion](self, "completion");
    v44 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, __CFString *, MPCPlayerCommandStatus *))v44)[2](v44, v9, v37);

    -[MPCSharedListeningPlaybackIntentDataSource setCompletion:](self, "setCompletion:", 0);
    -[MPCSharedListeningPlaybackIntentDataSource setStrongSelf:](self, "setStrongSelf:", 0);

  }
LABEL_30:

}

- (void)_transitionToSourceState:(int64_t)a3
{
  -[MPCSharedListeningPlaybackIntentDataSource _transitionToSourceState:error:](self, "_transitionToSourceState:error:", a3, 0);
}

- (void)_transitionToSourceState:(int64_t)a3 error:(id)a4
{
  id v7;
  os_unfair_lock_s *p_lock;
  NSObject *v9;
  unint64_t sourceState;
  MPCPlaybackIntent *initialIntent;
  __CFString *v12;
  int64_t v13;
  int v14;
  uint64_t v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  unint64_t v19;
  __CFString *v20;
  __CFString *v21;
  NSObject *v22;
  id v23;
  const char *v24;
  unint64_t v25;
  MPCPlaybackIntent *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  NSObject *v32;
  NSObject *v33;
  MPCPlaybackIntent *v34;
  int64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[7];
  uint8_t buf[4];
  MPCPlaybackIntent *v41;
  __int16 v42;
  __CFString *v43;
  __int16 v44;
  __CFString *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_buildState == 7)
  {
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      sourceState = self->_sourceState;
      initialIntent = self->_initialIntent;
      if (sourceState >= 4)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown/state=%ld"), self->_sourceState);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = off_24CAB0D98[sourceState];
      }
      v16 = v12;
      if ((unint64_t)a3 >= 4)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown/state=%ld"), a3);
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = off_24CAB0D98[a3];
      }
      *(_DWORD *)buf = 138543874;
      v41 = initialIntent;
      v42 = 2114;
      v43 = v16;
      v44 = 2114;
      v45 = v17;
      _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ _transitionToSourceState [ignoring] %{public}@ -> %{public}@", buf, 0x20u);

    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    v13 = a3 | (self->_sourceState << 16);
    switch(v13)
    {
      case 1:
        v38 = 0x100000000;
        v15 = 0;
        v14 = 1;
        break;
      case 65538:
        v14 = 0;
        v38 = 1;
        v15 = 2;
        break;
      case 65539:
        v38 = 0;
        v14 = 0;
        v15 = 4;
        break;
      default:
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = self->_sourceState;
        if (v19 >= 4)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown/state=%ld"), self->_sourceState);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v20 = off_24CAB0D98[v19];
        }
        if ((unint64_t)a3 >= 4)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown/state=%ld"), a3);
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = off_24CAB0D98[a3];
        }
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCSharedListeningPlaybackIntentDataSource.m"), 382, CFSTR("Unexpected state transition %@ -> %@"), v20, v21);

        v15 = 0;
        v14 = 0;
        v38 = 0x100000000;
        break;
    }
    v22 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v37 = v15;
      v23 = v7;
      v24 = a2;
      v25 = self->_sourceState;
      v26 = self->_initialIntent;
      if (v25 >= 4)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown/state=%ld"), self->_sourceState);
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v27 = off_24CAB0D98[v25];
      }
      v28 = v27;
      if ((unint64_t)a3 >= 4)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown/state=%ld"), a3);
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = off_24CAB0D98[a3];
      }
      *(_DWORD *)buf = 138543874;
      v41 = v26;
      v42 = 2114;
      v43 = v28;
      v44 = 2114;
      v45 = v29;
      _os_log_impl(&dword_210BD8000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ _transitionToSourceState %{public}@ -> %{public}@", buf, 0x20u);

      a2 = v24;
      v7 = v23;
      v15 = v37;
    }

    self->_sourceState = a3;
    os_unfair_lock_unlock(&self->_lock);
    if (v14)
    {
      v30 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
      v31 = os_signpost_id_make_with_pointer(v30, self->_initialIntent);

      v32 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
      v33 = v32;
      if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_210BD8000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "source:getPlaybackContext", ", buf, 2u);
      }

      v34 = self->_initialIntent;
      v39[0] = MEMORY[0x24BDAC760];
      v39[1] = 3221225472;
      v39[2] = __77__MPCSharedListeningPlaybackIntentDataSource__transitionToSourceState_error___block_invoke;
      v39[3] = &unk_24CAB0D00;
      v39[4] = self;
      v39[5] = a2;
      v39[6] = v31;
      -[MPCPlaybackIntent getRemotePlaybackQueueWithDestination:completion:](v34, "getRemotePlaybackQueueWithDestination:completion:", 1, v39);
    }
    if ((v38 & 0x100000000) == 0)
    {
      os_unfair_lock_lock(&self->_lock);
      v35 = -[MPCSharedListeningPlaybackIntentDataSource buildState](self, "buildState");
      v36 = -[MPCSharedListeningPlaybackIntentDataSource linkState](self, "linkState");
      os_unfair_lock_unlock(&self->_lock);
      if (v35 == 1)
      {
        if ((_DWORD)v38)
        {
          -[MPCSharedListeningPlaybackIntentDataSource _transitionToBuildState:intent:error:](self, "_transitionToBuildState:intent:error:", 2, 0, v7);
        }
        else if (v36 == 4)
        {
          -[MPCSharedListeningPlaybackIntentDataSource _transitionToBuildState:](self, "_transitionToBuildState:", v15);
        }
      }
    }
  }

}

- (void)_transitionToLiveLinkState:(int64_t)a3
{
  -[MPCSharedListeningPlaybackIntentDataSource _transitionToLiveLinkState:error:](self, "_transitionToLiveLinkState:error:", a3, 0);
}

- (void)_transitionToLiveLinkState:(int64_t)a3 error:(id)a4
{
  id v7;
  os_unfair_lock_s *p_lock;
  NSObject *v9;
  MPCPlaybackIntent *initialIntent;
  unint64_t linkState;
  __CFString *v12;
  int64_t v13;
  char v14;
  int v15;
  uint64_t v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  unint64_t v20;
  __CFString *v21;
  __CFString *v22;
  NSObject *v23;
  MPCPlaybackIntent *v24;
  unint64_t v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  NSObject *v32;
  NSObject *v33;
  int64_t v34;
  int64_t v35;
  MPCSharedListeningPlaybackIntentDataSource *v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint8_t buf[4];
  MPCPlaybackIntent *v41;
  __int16 v42;
  __CFString *v43;
  __int16 v44;
  __CFString *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_buildState == 7)
  {
    v9 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      initialIntent = self->_initialIntent;
      linkState = self->_linkState;
      if (linkState >= 5)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown/state=%ld"), self->_linkState);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = off_24CAB0DB8[linkState];
      }
      v17 = v12;
      if ((unint64_t)a3 >= 5)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown/state=%ld"), a3);
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = off_24CAB0DB8[a3];
      }
      *(_DWORD *)buf = 138543874;
      v41 = initialIntent;
      v42 = 2114;
      v43 = v17;
      v44 = 2114;
      v45 = v18;
      _os_log_impl(&dword_210BD8000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ _transitionToLiveLinkState [ignoring] %{public}@ -> %{public}@", buf, 0x20u);

    }
    os_unfair_lock_unlock(p_lock);
    goto LABEL_49;
  }
  v13 = a3 | (self->_linkState << 16);
  if (v13 <= 65538)
  {
    if (v13 == 1)
    {
      v39 = 0;
      v38 = 0;
      v14 = 1;
      v15 = 1;
      goto LABEL_29;
    }
    if (v13 != 65538)
      goto LABEL_21;
    goto LABEL_12;
  }
  if (v13 != 65539)
  {
    if (v13 != 196610)
    {
      if (v13 == 196612)
      {
        v14 = 0;
        v39 = 0;
        v15 = 0;
        v16 = 4;
LABEL_13:
        v38 = v16;
        goto LABEL_29;
      }
LABEL_21:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = self->_linkState;
      if (v20 >= 5)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown/state=%ld"), self->_linkState);
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v21 = off_24CAB0DB8[v20];
      }
      if ((unint64_t)a3 >= 5)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown/state=%ld"), a3);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = off_24CAB0DB8[a3];
      }
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCSharedListeningPlaybackIntentDataSource.m"), 481, CFSTR("Unexpected state transition %@ -> %@"), v21, v22);

      goto LABEL_28;
    }
LABEL_12:
    v14 = 0;
    v15 = 0;
    v39 = 1;
    v16 = 3;
    goto LABEL_13;
  }
LABEL_28:
  v39 = 0;
  v38 = 0;
  v15 = 0;
  v14 = 1;
LABEL_29:
  v23 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = self->_initialIntent;
    v25 = self->_linkState;
    if (v25 >= 5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown/state=%ld"), self->_linkState);
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = off_24CAB0DB8[v25];
    }
    v27 = v26;
    if ((unint64_t)a3 >= 5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown/state=%ld"), a3);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = off_24CAB0DB8[a3];
    }
    *(_DWORD *)buf = 138543874;
    v41 = v24;
    v42 = 2114;
    v43 = v27;
    v44 = 2114;
    v45 = v28;
    _os_log_impl(&dword_210BD8000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ _transitionToLiveLinkState %{public}@ -> %{public}@", buf, 0x20u);

  }
  self->_linkState = a3;
  os_unfair_lock_unlock(&self->_lock);
  if (v15)
  {
    os_unfair_lock_lock(&self->_lock);
    objc_msgSend(MEMORY[0x24BEC8830], "linkWithIdentity:", self->_identity);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setDelegate:", self);
    objc_storeStrong((id *)&self->_liveLink, v29);
    os_unfair_lock_unlock(&self->_lock);
    v30 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    v31 = os_signpost_id_make_with_pointer(v30, self->_initialIntent);

    v32 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
    v33 = v32;
    if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_210BD8000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "link:start", ", buf, 2u);
    }

    -[ICLiveLink start](self->_liveLink, "start");
  }
  if ((v14 & 1) == 0)
  {
    os_unfair_lock_lock(&self->_lock);
    v34 = -[MPCSharedListeningPlaybackIntentDataSource buildState](self, "buildState");
    v35 = -[MPCSharedListeningPlaybackIntentDataSource sourceState](self, "sourceState");
    os_unfair_lock_unlock(&self->_lock);
    if (v34 == 1)
    {
      if (v39)
      {
        v36 = self;
        v37 = 3;
      }
      else
      {
        if (v35 != 3)
          goto LABEL_49;
        v36 = self;
        v37 = v38;
      }
      -[MPCSharedListeningPlaybackIntentDataSource _transitionToBuildState:intent:error:](v36, "_transitionToBuildState:intent:error:", v37, 0, v7);
    }
  }
LABEL_49:

}

- (MSVBlockGuard)guard
{
  return self->_guard;
}

- (void)setGuard:(id)a3
{
  objc_storeStrong((id *)&self->_guard, a3);
}

- (int64_t)shuffleMode
{
  return self->_shuffleMode;
}

- (void)setShuffleMode:(int64_t)a3
{
  self->_shuffleMode = a3;
}

- (id)strongSelf
{
  return self->_strongSelf;
}

- (void)setStrongSelf:(id)a3
{
  objc_storeStrong(&self->_strongSelf, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (int64_t)buildState
{
  return self->_buildState;
}

- (void)setBuildState:(int64_t)a3
{
  self->_buildState = a3;
}

- (int64_t)sourceState
{
  return self->_sourceState;
}

- (void)setSourceState:(int64_t)a3
{
  self->_sourceState = a3;
}

- (MPCPlaybackIntent)initialIntent
{
  return self->_initialIntent;
}

- (void)setInitialIntent:(id)a3
{
  objc_storeStrong((id *)&self->_initialIntent, a3);
}

- (NSIndexPath)startIndexPath
{
  return self->_startIndexPath;
}

- (void)setStartIndexPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (MSVSectionedCollection)initialTracklist
{
  return self->_initialTracklist;
}

- (void)setInitialTracklist:(id)a3
{
  objc_storeStrong((id *)&self->_initialTracklist, a3);
}

- (int64_t)linkState
{
  return self->_linkState;
}

- (void)setLinkState:(int64_t)a3
{
  self->_linkState = a3;
}

- (ICLiveLink)liveLink
{
  return self->_liveLink;
}

- (void)setLiveLink:(id)a3
{
  objc_storeStrong((id *)&self->_liveLink, a3);
}

- (ICLiveLinkIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_liveLink, 0);
  objc_storeStrong((id *)&self->_initialTracklist, 0);
  objc_storeStrong((id *)&self->_startIndexPath, 0);
  objc_storeStrong((id *)&self->_initialIntent, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_strongSelf, 0);
  objc_storeStrong((id *)&self->_guard, 0);
}

void __77__MPCSharedListeningPlaybackIntentDataSource__transitionToSourceState_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  __int128 v6;
  uint64_t v7;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a1[5], *(_QWORD *)(a1[4] + 64));

  }
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __77__MPCSharedListeningPlaybackIntentDataSource__transitionToSourceState_error___block_invoke_2;
  v5[3] = &unk_24CAB0CD8;
  v6 = *((_OWORD *)a1 + 2);
  v7 = a1[6];
  objc_msgSend(v3, "getMusicPlaybackContextWithOptions:completion:", 0, v5);

}

void __77__MPCSharedListeningPlaybackIntentDataSource__transitionToSourceState_error___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  __int128 v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a1[5], *(_QWORD *)(a1[4] + 64));

  }
  v7 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
  v8 = v7;
  v9 = a1[6];
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v6;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v8, OS_SIGNPOST_INTERVAL_END, v9, "source:getPlaybackContext", "error=%{public}@", buf, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 8));
  v10 = a1[4];
  v11 = *(_QWORD *)(v10 + 48);
  os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 8));
  if (v11 != 7)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __77__MPCSharedListeningPlaybackIntentDataSource__transitionToSourceState_error___block_invoke_40;
    v14[3] = &unk_24CAB0CB0;
    v15 = *((_OWORD *)a1 + 2);
    v12 = (id)objc_msgSend(v5, "getSharedListeningTracklistWithCompletion:", v14);
  }

}

void __77__MPCSharedListeningPlaybackIntentDataSource__transitionToSourceState_error___block_invoke_40(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlayerEnqueueError"), 3, v8, CFSTR("Content type is not supported in live link"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_transitionToSourceState:error:", 2, v9);

  }
  else
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("MPCSharedListeningPlaybackIntentDataSource.m"), 415, CFSTR("Missing required parameters (tracklist) [error == nil]"));

    }
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(a1 + 32), "setInitialTracklist:", v11);
    objc_msgSend(*(id *)(a1 + 32), "setStartIndexPath:", v7);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(a1 + 32), "_transitionToSourceState:", 3);
  }

}

void __83__MPCSharedListeningPlaybackIntentDataSource__transitionToBuildState_intent_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  os_unfair_lock_s *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.mediaplaybackcore", "SharedSession");
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v13 = 138543362;
    v14 = v3;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v5, OS_SIGNPOST_INTERVAL_END, v6, "build:replace", "error=%{public}@", (uint8_t *)&v13, 0xCu);
  }

  v7 = *(os_unfair_lock_s **)(a1 + 32);
  if (v3)
  {
    -[os_unfair_lock_s _transitionToBuildState:intent:error:](v7, "_transitionToBuildState:intent:error:", 5, 0, v3);
  }
  else
  {
    os_unfair_lock_lock(v7 + 2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "sessionKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCPlaybackSharedListeningProperties propertiesWithSessionIdentifier:sessionKey:](MPCPlaybackSharedListeningProperties, "propertiesWithSessionIdentifier:sessionKey:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setLiveLink:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "identity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPCPlaybackIntent sharedSessionIntentWithProperties:identity:](MPCPlaybackIntent, "sharedSessionIntentWithProperties:identity:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(a1 + 32), "_transitionToBuildState:intent:error:", 6, v12, 0);

  }
}

void __102__MPCSharedListeningPlaybackIntentDataSource_getRepresentativeObjectFromIntent_properties_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  if (!v5 || a3)
  {
    v9 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3000, a3, CFSTR("Failed to build playback queue from intent %@"), *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v9 + 16))(v9, 0, 0, v6);
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCBE8]), "initWithCommand:playbackQueue:", 0, v5);
    v7 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __102__MPCSharedListeningPlaybackIntentDataSource_getRepresentativeObjectFromIntent_properties_completion___block_invoke_2;
    v10[3] = &unk_24CAB6648;
    v14 = *(id *)(a1 + 56);
    v11 = 0;
    v12 = *(id *)(a1 + 40);
    v13 = *(id *)(a1 + 48);
    v8 = (id)objc_msgSend(v7, "performLoadCommand:completion:", v6, v10);

  }
}

void __102__MPCSharedListeningPlaybackIntentDataSource_getRepresentativeObjectFromIntent_properties_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("MPCPlaybackEngineInternalError"), 3000, *(_QWORD *)(a1 + 32), CFSTR("Failed to perform load queue command"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v3 + 16))(v3, 0, 0, v5);

  }
  else
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __102__MPCSharedListeningPlaybackIntentDataSource_getRepresentativeObjectFromIntent_properties_completion___block_invoke_3;
    v6[3] = &unk_24CAB0C38;
    v4 = *(void **)(a1 + 40);
    v7 = *(id *)(a1 + 48);
    v8 = *(id *)(a1 + 56);
    objc_msgSend(v4, "getExpectedCurrentItemModelObjectWithCompletion:", v6);

  }
}

void __102__MPCSharedListeningPlaybackIntentDataSource_getRepresentativeObjectFromIntent_properties_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  objc_msgSend(a2, "flattenedGenericObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "copyWithPropertySet:", *(_QWORD *)(a1 + 32));

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __101__MPCSharedListeningPlaybackIntentDataSource_buildSharedSessionIntentWithIntent_identity_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  os_unfair_lock_s *v8;

  if (a2 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("MPCSharedListeningPlaybackIntentDataSource.m"), 154, CFSTR("Deallocated without calling live link completion"));

    WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  }
  else
  {
    WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
    if (!a2 && WeakRetained)
    {
      v8 = WeakRetained;
      objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 14, CFSTR("Build shared intent timeout"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[os_unfair_lock_s _transitionToBuildState:intent:error:](v8, "_transitionToBuildState:intent:error:", 7, 0, v5);

      os_unfair_lock_lock(v8 + 2);
      -[os_unfair_lock_s liveLink](v8, "liveLink");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      os_unfair_lock_unlock(v8 + 2);
      objc_msgSend(v6, "stop");

      WeakRetained = v8;
    }
  }

}

@end
