@implementation MPCContentAgeRequirementManager

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

+ (MPCContentAgeRequirementManager)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_20156);
  return (MPCContentAgeRequirementManager *)(id)sharedManager___sharedManager;
}

void __48__MPCContentAgeRequirementManager_sharedManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[MPCContentAgeRequirementManager _init]([MPCContentAgeRequirementManager alloc], "_init");
  v1 = (void *)sharedManager___sharedManager;
  sharedManager___sharedManager = (uint64_t)v0;

}

- (id)_init
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPCContentAgeRequirementManager;
  result = -[MPCContentAgeRequirementManager init](&v3, sel_init);
  if (result)
    *((_QWORD *)result + 2) = 3;
  return result;
}

- (BOOL)isItemAuthorized:(id)a3
{
  return -[MPCContentAgeRequirementManager isItemAuthorized:shouldAskForAuthorization:](self, "isItemAuthorized:shouldAskForAuthorization:", a3, 0);
}

- (BOOL)isItemAuthorized:(id)a3 shouldAskForAuthorization:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint8_t buf[4];
  MPCContentAgeRequirementManager *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(v6, "mediaType") == 2048)
  {
    objc_msgSend(MEMORY[0x24BDDCB98], "sharedRestrictionsMonitor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "allowsMusicVideos");

    if ((v8 & 1) == 0)
    {
      v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v20 = self;
        v21 = 2114;
        v22 = v6;
        _os_log_impl(&dword_210BD8000, v10, OS_LOG_TYPE_DEFAULT, "MPCContentAgeRequirementManager %p - Music Video playback is not allowed for item - %{public}@", buf, 0x16u);
      }
      v13 = 0;
      goto LABEL_23;
    }
  }
  if (objc_msgSend(v6, "isExplicitTrack"))
  {
    objc_msgSend(v6, "playbackRequestEnvironment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userIdentity");
    v10 = objc_claimAutoreleasedReturnValue();

    -[MPCContentAgeRequirementManager _retrieveAgeVerificationStateForUserIdentity:](self, "_retrieveAgeVerificationStateForUserIdentity:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MPCContentAgeRequirementManager _updateAuthorizationStatusWithAuthorizationState:forItem:](self, "_updateAuthorizationStatusWithAuthorizationState:forItem:", v11, v6);
    if (-[MPCContentAgeRequirementManager status](self, "status") == 2)
    {
      v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v20 = self;
        v21 = 2114;
        v22 = v6;
        _os_log_impl(&dword_210BD8000, v12, OS_LOG_TYPE_DEFAULT, "MPCContentAgeRequirementManager %p - Age Requirements satisfied for item: %{public}@", buf, 0x16u);
      }

      v13 = 1;
      goto LABEL_22;
    }
    if (-[MPCContentAgeRequirementManager status](self, "status") == 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MPCContentAgeRequirementManager %p - Explicit content playback is not allowed for any item - %@"), self, v6);
      v14 = objc_claimAutoreleasedReturnValue();
      -[MPCContentAgeRequirementManager authorizationError](self, "authorizationError");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[MPCContentAgeRequirementManager _explicitContentErrorWithUnderlyingError:message:](self, "_explicitContentErrorWithUnderlyingError:message:", v15, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setItemError:", v16);

      v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        v20 = self;
        v21 = 2114;
        v22 = v6;
        _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_ERROR, "MPCContentAgeRequirementManager %p - Age Requirements prohibit playback for item: %{public}@", buf, 0x16u);
      }

    }
    else
    {
      if (v4
        && -[MPCContentAgeRequirementManager _shouldAskPlaybackAuthorizationForItem:reason:](self, "_shouldAskPlaybackAuthorizationForItem:reason:", v6, -[MPCContentAgeRequirementManager authorizationReason](self, "authorizationReason")))
      {
        v13 = -[MPCContentAgeRequirementManager _askPlaybackAuthorizationForItem:reason:](self, "_askPlaybackAuthorizationForItem:reason:", v6, -[MPCContentAgeRequirementManager authorizationReason](self, "authorizationReason"));
LABEL_22:

LABEL_23:
        goto LABEL_24;
      }
      v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v20 = self;
        v21 = 2114;
        v22 = v6;
        _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "MPCContentAgeRequirementManager %p - Age Requirements not satisfied and will not request authorization for item: %{public}@", buf, 0x16u);
      }
    }

    v13 = 0;
    goto LABEL_22;
  }
  v13 = 1;
LABEL_24:

  return v13;
}

- (int64_t)authorizationReason
{
  int64_t v2;

  v2 = -[MPCContentAgeRequirementManager status](self, "status");
  if (v2)
    return v2 == 1;
  else
    return 2;
}

- (id)_retrieveAgeVerificationStateForUserIdentity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  dispatch_block_t v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEC8750], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ageVerificationStateForUserIdentity:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEC8750], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ageVerificationStateForUserIdentity:", v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__20125;
    v19 = __Block_byref_object_dispose__20126;
    v20 = 0;
    v8 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_5);
    objc_msgSend(MEMORY[0x24BEC8750], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __80__MPCContentAgeRequirementManager__retrieveAgeVerificationStateForUserIdentity___block_invoke_2;
    v12[3] = &unk_24CAB7078;
    v14 = &v15;
    v10 = v8;
    v13 = v10;
    objc_msgSend(v9, "getAgeVerificationStateWithCompletion:", v12);

    dispatch_block_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    v7 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }

  return v7;
}

- (void)_updateAuthorizationStatusWithAuthorizationState:(id)a3 forItem:(id)a4
{
  id v6;

  v6 = a4;
  -[MPCContentAgeRequirementManager _setupWithAgeVerificationState:](self, "_setupWithAgeVerificationState:", a3);
  if (-[MPCContentAgeRequirementManager status](self, "status") == 2)
    -[MPCContentAgeRequirementManager _setupWithAgeGateForItem:](self, "_setupWithAgeGateForItem:", v6);

}

- (void)_setupWithAgeGateForItem:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  objc_msgSend(a3, "genericObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flattenedGenericObject");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "type") == 8)
  {
    objc_msgSend(v13, "tvEpisode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "explicitRating");
    objc_msgSend(MEMORY[0x24BDDCB98], "sharedRestrictionsMonitor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "maximumTVShowRatingForAgeGate");

    if (v6 >= v8)
      goto LABEL_5;
  }
  if (objc_msgSend(v13, "type") == 9)
  {
    objc_msgSend(v13, "movie");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "explicitRating");
    objc_msgSend(MEMORY[0x24BDDCB98], "sharedRestrictionsMonitor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "maximumMovieRatingForAgeGate");

    if (v10 >= v12)
LABEL_5:
      -[MPCContentAgeRequirementManager setStatus:](self, "setStatus:", 1);
  }

}

- (void)_setupWithAgeVerificationState:(id)a3
{
  void *v5;
  MPCContentAgeRequirementManager *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  switch(objc_msgSend(v8, "status"))
  {
    case 0:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 1:
      v6 = self;
      v7 = 2;
      goto LABEL_9;
    case 2:
      v6 = self;
      v7 = 0;
      goto LABEL_9;
    case 3:
      if (objc_msgSend(v8, "isExplicitContentAllowed"))
        v7 = 2;
      else
        v7 = 3;
      v6 = self;
LABEL_9:
      -[MPCContentAgeRequirementManager setStatus:](v6, "setStatus:", v7);
      break;
    default:
      break;
  }

}

- (BOOL)_shouldAskPlaybackAuthorizationForItem:(id)a3 reason:(int64_t)a4
{
  BOOL result;

  if (a4 == 1)
    return 1;
  result = objc_msgSend(a3, "isStartItem");
  if (a4 != 2)
    return 0;
  return result;
}

- (BOOL)_askPlaybackAuthorizationForItem:(id)a3 reason:(int64_t)a4
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  dispatch_semaphore_t v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  BOOL v18;
  _QWORD v20[4];
  id v21;
  NSObject *v22;
  uint64_t *v23;
  uint64_t *v24;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint8_t buf[4];
  MPCContentAgeRequirementManager *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__20125;
  v30 = __Block_byref_object_dispose__20126;
  v31 = 0;
  -[MPCContentAgeRequirementManager delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x24BE65C40]);
    v10 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __75__MPCContentAgeRequirementManager__askPlaybackAuthorizationForItem_reason___block_invoke;
    v25[3] = &unk_24CAB90B0;
    v25[4] = self;
    v25[5] = a2;
    v11 = (void *)objc_msgSend(v9, "initWithDeallocHandler:", v25);
    v12 = dispatch_semaphore_create(0);
    v20[0] = v10;
    v20[1] = 3221225472;
    v20[2] = __75__MPCContentAgeRequirementManager__askPlaybackAuthorizationForItem_reason___block_invoke_2;
    v20[3] = &unk_24CAB70A0;
    v13 = v11;
    v21 = v13;
    v23 = &v26;
    v24 = &v32;
    v14 = v12;
    v22 = v14;
    objc_msgSend(v8, "requestAuthorizationForExplicitItem:reason:completion:", v7, a4, v20);
    dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);

  }
  if (*((_BYTE *)v33 + 24))
  {
    v15 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v37 = self;
      v38 = 2114;
      v39 = v7;
      _os_log_impl(&dword_210BD8000, v15, OS_LOG_TYPE_DEFAULT, "MPCContentAgeRequirementManager %p - Explicit content playback authorization has been granted by client for: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MPCContentAgeRequirementManager %p - Explicit content playback authorization has been denied by client for: %@"), self, v7);
    v15 = objc_claimAutoreleasedReturnValue();
    -[MPCContentAgeRequirementManager _explicitContentErrorWithUnderlyingError:message:](self, "_explicitContentErrorWithUnderlyingError:message:", v27[5], v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setItemError:", v16);

    v17 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      v37 = self;
      v38 = 2114;
      v39 = v7;
      _os_log_impl(&dword_210BD8000, v17, OS_LOG_TYPE_ERROR, "MPCContentAgeRequirementManager %p - Explicit content playback authorization has been denied by client for: %{public}@", buf, 0x16u);
    }

  }
  v18 = *((_BYTE *)v33 + 24) != 0;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v18;
}

- (id)_explicitContentErrorWithUnderlyingError:(id)a3 message:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
  v8 = v7;
  if (v5)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BDD1398]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDD0BA0]);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MPCError"), 41, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (MPCContentAgeRequirementDelegate)delegate
{
  return (MPCContentAgeRequirementDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSError)authorizationError
{
  return self->_authorizationError;
}

- (void)setAuthorizationError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (ICAgeVerificationState)lastKnownAgeVerificationState
{
  return self->_lastKnownAgeVerificationState;
}

- (void)setLastKnownAgeVerificationState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownAgeVerificationState, 0);
  objc_storeStrong((id *)&self->_authorizationError, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __75__MPCContentAgeRequirementManager__askPlaybackAuthorizationForItem_reason___block_invoke(uint64_t a1)
{
  id v2;

  if (MSVDeviceOSIsInternalInstall())
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("MPCContentAgeRequirementManager.m"), 197, CFSTR("MPCGenericAVItem authorization handler was released and not called."));

  }
}

void __75__MPCContentAgeRequirementManager__askPlaybackAuthorizationForItem_reason___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  char v8;
  id v9;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "disarm");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v9 = v5;

  if (v9)
    v8 = 0;
  else
    v8 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v8;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __80__MPCContentAgeRequirementManager__retrieveAgeVerificationStateForUserIdentity___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
