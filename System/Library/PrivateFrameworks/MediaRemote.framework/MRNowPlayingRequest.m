@implementation MRNowPlayingRequest

- (void)triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  __CFString *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("[MRNowPlaying triggerAudioFadeOut]"), v9);
  -[MRNowPlayingRequest destination](self, "destination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MRNowPlayingRequest destination](self, "destination");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendFormat:", CFSTR(" for %@"), v13);

  }
  _MRLogForCategory(0xAuLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v27 = v11;
    _os_log_impl(&dword_193827000, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  -[MRNowPlayingRequest destination](self, "destination");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __103__MRNowPlayingRequest_AudioFade__triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue_completion___block_invoke;
  v20[3] = &unk_1E30C7930;
  v24 = v10;
  v25 = v7;
  v21 = CFSTR("[MRNowPlaying triggerAudioFadeOut]");
  v22 = v9;
  v23 = v6;
  v16 = v10;
  v17 = v6;
  v18 = v9;
  v19 = v7;
  +[MRDestinationResolver resolveDestination:level:timeout:completion:](MRDestinationResolver, "resolveDestination:level:timeout:completion:", v15, 2, v20, 5.0);

}

void __103__MRNowPlayingRequest_AudioFade__triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  MRAudioFadeMessage *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "playerPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    _MRLogForCategory(0xAuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v21 = v8;
      v22 = 2114;
      v23 = v9;
      v24 = 2112;
      v25 = v6;
      _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    v10 = -[MRAudioFadeMessage initWithPlayerPath:fadeType:]([MRAudioFadeMessage alloc], "initWithPlayerPath:fadeType:", v6, 0);
    v11 = (void *)MRGetSharedService();
    v12 = *(void **)(a1 + 48);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __103__MRNowPlayingRequest_AudioFade__triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue_completion___block_invoke_11;
    v14[3] = &unk_1E30C7908;
    v19 = *(id *)(a1 + 64);
    v15 = v6;
    v16 = *(id *)(a1 + 32);
    v17 = *(id *)(a1 + 40);
    v18 = *(id *)(a1 + 56);
    MRMediaRemoteServiceTriggerAudioFade(v11, v10, v12, v14);

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 64);
    if (v13)
      (*(void (**)(uint64_t, _QWORD, id))(v13 + 16))(v13, 0, v5);
  }

}

void __103__MRNowPlayingRequest_AudioFade__triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue_completion___block_invoke_11(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1[8])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v5, "fadeDuration");
    (*(void (**)(void))(a1[8] + 16))();
    v7 = a1[4];
    _MRLogForCategory(0xAuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6)
    {
      v10 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
      if (!v7)
      {
        if (v10)
          __103__MRNowPlayingRequest_AudioFade__triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue_completion___block_invoke_11_cold_1();
        goto LABEL_17;
      }
      if (v10)
      {
        v12 = a1[5];
        v11 = a1[6];
        v13 = a1[4];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", a1[7]);
        v27 = 138544386;
        v28 = v12;
        v29 = 2114;
        v30 = v11;
        v31 = 2114;
        v32 = v6;
        v33 = 2114;
        v34 = v13;
        v35 = 2048;
        v36 = v15;
        _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v27, 0x34u);
LABEL_16:

      }
LABEL_17:

      goto LABEL_18;
    }
    v16 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v16)
        goto LABEL_17;
      v18 = a1[5];
      v17 = a1[6];
      v19 = (void *)a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", a1[7]);
      v27 = 138544130;
      v28 = v18;
      v29 = 2114;
      v30 = v17;
      v31 = 2114;
      v32 = v19;
      v33 = 2048;
      v34 = v20;
      v21 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v22 = v9;
      v23 = 42;
    }
    else
    {
      if (!v16)
        goto LABEL_17;
      v24 = a1[5];
      v25 = a1[6];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", a1[7]);
      v27 = 138543874;
      v28 = v24;
      v29 = 2114;
      v30 = v25;
      v31 = 2048;
      v32 = v26;
      v21 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v22 = v9;
      v23 = 32;
    }
    _os_log_impl(&dword_193827000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v27, v23);
    goto LABEL_16;
  }
LABEL_18:

}

- (void)triggerAudioFadeInWithReplyQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  __CFString *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("[MRNowPlaying triggerAudioFadeIn]"), v9);
  -[MRNowPlayingRequest destination](self, "destination");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MRNowPlayingRequest destination](self, "destination");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "appendFormat:", CFSTR(" for %@"), v13);

  }
  _MRLogForCategory(0xAuLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v27 = v11;
    _os_log_impl(&dword_193827000, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  -[MRNowPlayingRequest destination](self, "destination");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __78__MRNowPlayingRequest_AudioFade__triggerAudioFadeInWithReplyQueue_completion___block_invoke;
  v20[3] = &unk_1E30C7930;
  v24 = v10;
  v25 = v7;
  v21 = CFSTR("[MRNowPlaying triggerAudioFadeIn]");
  v22 = v9;
  v23 = v6;
  v16 = v10;
  v17 = v6;
  v18 = v9;
  v19 = v7;
  +[MRDestinationResolver resolveDestination:level:timeout:completion:](MRDestinationResolver, "resolveDestination:level:timeout:completion:", v15, 2, v20, 5.0);

}

void __78__MRNowPlayingRequest_AudioFade__triggerAudioFadeInWithReplyQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  MRAudioFadeMessage *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "playerPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    _MRLogForCategory(0xAuLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v21 = v8;
      v22 = 2114;
      v23 = v9;
      v24 = 2112;
      v25 = v6;
      _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    v10 = -[MRAudioFadeMessage initWithPlayerPath:fadeType:]([MRAudioFadeMessage alloc], "initWithPlayerPath:fadeType:", v6, 1);
    v11 = (void *)MRGetSharedService();
    v12 = *(void **)(a1 + 48);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __78__MRNowPlayingRequest_AudioFade__triggerAudioFadeInWithReplyQueue_completion___block_invoke_17;
    v14[3] = &unk_1E30C7908;
    v19 = *(id *)(a1 + 64);
    v15 = v6;
    v16 = *(id *)(a1 + 32);
    v17 = *(id *)(a1 + 40);
    v18 = *(id *)(a1 + 56);
    MRMediaRemoteServiceTriggerAudioFade(v11, v10, v12, v14);

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 64);
    if (v13)
      (*(void (**)(uint64_t, id))(v13 + 16))(v13, v5);
  }

}

void __78__MRNowPlayingRequest_AudioFade__triggerAudioFadeInWithReplyQueue_completion___block_invoke_17(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = a1[8];
  if (v7)
  {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v6);
    v8 = a1[4];
    _MRLogForCategory(0xAuLL);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v6)
    {
      v11 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      if (!v8)
      {
        if (v11)
          __103__MRNowPlayingRequest_AudioFade__triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue_completion___block_invoke_11_cold_1();
        goto LABEL_15;
      }
      if (v11)
      {
        v13 = a1[5];
        v12 = a1[6];
        v14 = a1[4];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "timeIntervalSinceDate:", a1[7]);
        v28 = 138544386;
        v29 = v13;
        v30 = 2114;
        v31 = v12;
        v32 = 2114;
        v33 = v6;
        v34 = 2114;
        v35 = v14;
        v36 = 2048;
        v37 = v16;
        _os_log_error_impl(&dword_193827000, v10, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v28, 0x34u);
LABEL_14:

      }
LABEL_15:

      goto LABEL_16;
    }
    v17 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (!v17)
        goto LABEL_15;
      v19 = a1[5];
      v18 = a1[6];
      v20 = (void *)a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceDate:", a1[7]);
      v28 = 138544130;
      v29 = v19;
      v30 = 2114;
      v31 = v18;
      v32 = 2114;
      v33 = v20;
      v34 = 2048;
      v35 = v21;
      v22 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v23 = v10;
      v24 = 42;
    }
    else
    {
      if (!v17)
        goto LABEL_15;
      v25 = a1[5];
      v26 = a1[6];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceDate:", a1[7]);
      v28 = 138543874;
      v29 = v25;
      v30 = 2114;
      v31 = v26;
      v32 = 2048;
      v33 = v27;
      v22 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v23 = v10;
      v24 = 32;
    }
    _os_log_impl(&dword_193827000, v23, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v28, v24);
    goto LABEL_14;
  }
LABEL_16:

}

- (MRNowPlayingRequest)init
{
  void *v3;
  MRNowPlayingRequest *v4;

  +[MRDestination localDestination](MRDestination, "localDestination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MRNowPlayingRequest initWithDestination:](self, "initWithDestination:", v3);

  return v4;
}

- (MRNowPlayingRequest)initWithDestination:(id)a3
{
  id v4;
  MRNowPlayingRequest *v5;
  uint64_t v6;
  MRDestination *destination;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRNowPlayingRequest;
  v5 = -[MRNowPlayingRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    destination = v5->_destination;
    v5->_destination = (MRDestination *)v6;

  }
  return v5;
}

- (MRNowPlayingRequest)initWithPlayerPath:(id)a3
{
  id v4;
  MRDestination *v5;
  MRNowPlayingRequest *v6;

  v4 = a3;
  v5 = -[MRDestination initWithPlayerPath:]([MRDestination alloc], "initWithPlayerPath:", v4);

  v6 = -[MRNowPlayingRequest initWithDestination:](self, "initWithDestination:", v5);
  return v6;
}

- (MRNowPlayingRequest)initWithOrigin:(id)a3
{
  id v4;
  MRPlayerPath *v5;
  MRNowPlayingRequest *v6;

  v4 = a3;
  v5 = -[MRPlayerPath initWithOrigin:client:player:]([MRPlayerPath alloc], "initWithOrigin:client:player:", v4, 0, 0);

  v6 = -[MRNowPlayingRequest initWithPlayerPath:](self, "initWithPlayerPath:", v5);
  return v6;
}

- (void)requestIsPlayingOnQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__MRNowPlayingRequest_requestIsPlayingOnQueue_completion___block_invoke;
  v8[3] = &unk_1E30C99C0;
  v9 = v6;
  v7 = v6;
  -[MRNowPlayingRequest requestPlaybackStateOnQueue:completion:](self, "requestPlaybackStateOnQueue:completion:", a3, v8);

}

void __58__MRNowPlayingRequest_requestIsPlayingOnQueue_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v4;
  _BOOL8 IsAdvancing;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  IsAdvancing = MRMediaRemotePlaybackStateIsAdvancing(a2);
  (*(void (**)(uint64_t, _BOOL8, id))(v4 + 16))(v4, IsAdvancing, v6);

}

- (void)requestPlaybackStateOnQueue:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  MRNowPlayingControllerConfiguration *v9;
  void *v10;
  MRNowPlayingControllerConfiguration *v11;
  MRNowPlayingController *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingRequestResponse.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v9 = [MRNowPlayingControllerConfiguration alloc];
  -[MRNowPlayingRequest destination](self, "destination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MRNowPlayingControllerConfiguration initWithDestination:](v9, "initWithDestination:", v10);

  -[MRNowPlayingControllerConfiguration setRequestPlaybackState:](v11, "setRequestPlaybackState:", 1);
  -[MRNowPlayingControllerConfiguration setLabel:](v11, "setLabel:", CFSTR("requestPlaybackState"));
  v12 = -[MRNowPlayingController initWithConfiguration:]([MRNowPlayingController alloc], "initWithConfiguration:", v11);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__MRNowPlayingRequest_requestPlaybackStateOnQueue_completion___block_invoke;
  v16[3] = &unk_1E30C99E8;
  v17 = v7;
  v18 = v8;
  v13 = v8;
  v14 = v7;
  -[MRNowPlayingController performRequestWithCompletion:](v12, "performRequestWithCompletion:", v16);

}

void __62__MRNowPlayingRequest_requestPlaybackStateOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MRNowPlayingRequest_requestPlaybackStateOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E30C6658;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __62__MRNowPlayingRequest_requestPlaybackStateOnQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "playbackState"), *(_QWORD *)(a1 + 40));
}

- (void)requestPlaybackRateOnQueue:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  MRNowPlayingControllerConfiguration *v9;
  void *v10;
  MRNowPlayingControllerConfiguration *v11;
  MRNowPlayingController *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingRequestResponse.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v9 = [MRNowPlayingControllerConfiguration alloc];
  -[MRNowPlayingRequest destination](self, "destination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MRNowPlayingControllerConfiguration initWithDestination:](v9, "initWithDestination:", v10);

  -[MRNowPlayingControllerConfiguration setRequestPlaybackQueue:](v11, "setRequestPlaybackQueue:", 1);
  -[MRNowPlayingControllerConfiguration setLabel:](v11, "setLabel:", CFSTR("requestPlaybackRate"));
  v12 = -[MRNowPlayingController initWithConfiguration:]([MRNowPlayingController alloc], "initWithConfiguration:", v11);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__MRNowPlayingRequest_requestPlaybackRateOnQueue_completion___block_invoke;
  v16[3] = &unk_1E30C99E8;
  v17 = v7;
  v18 = v8;
  v13 = v8;
  v14 = v7;
  -[MRNowPlayingController performRequestWithCompletion:](v12, "performRequestWithCompletion:", v16);

}

void __61__MRNowPlayingRequest_requestPlaybackRateOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MRNowPlayingRequest_requestPlaybackRateOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E30C6658;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __61__MRNowPlayingRequest_requestPlaybackRateOnQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "playbackRate");
  return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 40));
}

- (void)requestNowPlayingItemMetadataOnQueue:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  MRNowPlayingControllerConfiguration *v9;
  void *v10;
  MRNowPlayingControllerConfiguration *v11;
  void *v12;
  MRNowPlayingController *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingRequestResponse.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v9 = [MRNowPlayingControllerConfiguration alloc];
  -[MRNowPlayingRequest destination](self, "destination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MRNowPlayingControllerConfiguration initWithDestination:](v9, "initWithDestination:", v10);

  +[MRPlaybackQueueRequest defaultPlaybackQueueRequest](MRPlaybackQueueRequest, "defaultPlaybackQueueRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRNowPlayingControllerConfiguration setPlaybackQueueRequest:](v11, "setPlaybackQueueRequest:", v12);

  -[MRNowPlayingControllerConfiguration setLabel:](v11, "setLabel:", CFSTR("requestNowPlayingItemMetadata"));
  v13 = -[MRNowPlayingController initWithConfiguration:]([MRNowPlayingController alloc], "initWithConfiguration:", v11);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__MRNowPlayingRequest_requestNowPlayingItemMetadataOnQueue_completion___block_invoke;
  v17[3] = &unk_1E30C99E8;
  v18 = v7;
  v19 = v8;
  v14 = v8;
  v15 = v7;
  -[MRNowPlayingController performRequestWithCompletion:](v13, "performRequestWithCompletion:", v17);

}

void __71__MRNowPlayingRequest_requestNowPlayingItemMetadataOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__MRNowPlayingRequest_requestNowPlayingItemMetadataOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E30C6658;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __71__MRNowPlayingRequest_requestNowPlayingItemMetadataOnQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "playbackQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentItemWithOffset:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v2 + 16))(v2, v4, *(_QWORD *)(a1 + 40));

}

- (void)requestNowPlayingItemLanguageOptionsOnQueue:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  MRNowPlayingControllerConfiguration *v9;
  void *v10;
  MRNowPlayingControllerConfiguration *v11;
  void *v12;
  void *v13;
  MRNowPlayingController *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingRequestResponse.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v9 = [MRNowPlayingControllerConfiguration alloc];
  -[MRNowPlayingRequest destination](self, "destination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MRNowPlayingControllerConfiguration initWithDestination:](v9, "initWithDestination:", v10);

  +[MRPlaybackQueueRequest defaultPlaybackQueueRequest](MRPlaybackQueueRequest, "defaultPlaybackQueueRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRNowPlayingControllerConfiguration setPlaybackQueueRequest:](v11, "setPlaybackQueueRequest:", v12);

  -[MRNowPlayingControllerConfiguration playbackQueueRequest](v11, "playbackQueueRequest");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIncludeLanguageOptions:", 1);

  -[MRNowPlayingControllerConfiguration setLabel:](v11, "setLabel:", CFSTR("requestNowPlayingItemLanguageOptions"));
  v14 = -[MRNowPlayingController initWithConfiguration:]([MRNowPlayingController alloc], "initWithConfiguration:", v11);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__MRNowPlayingRequest_requestNowPlayingItemLanguageOptionsOnQueue_completion___block_invoke;
  v18[3] = &unk_1E30C99E8;
  v19 = v7;
  v20 = v8;
  v15 = v8;
  v16 = v7;
  -[MRNowPlayingController performRequestWithCompletion:](v14, "performRequestWithCompletion:", v18);

}

void __78__MRNowPlayingRequest_requestNowPlayingItemLanguageOptionsOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__MRNowPlayingRequest_requestNowPlayingItemLanguageOptionsOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E30C6B98;
  v12 = v5;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __78__MRNowPlayingRequest_requestNowPlayingItemLanguageOptionsOnQueue_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "playbackQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentItemWithOffset:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v3 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v6, "availableLanguageOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentLanguageOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, _QWORD))(v3 + 16))(v3, v4, v5, *(_QWORD *)(a1 + 40));

}

- (void)requestNowPlayingItemArtworkOnQueue:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  MRNowPlayingControllerConfiguration *v9;
  void *v10;
  MRNowPlayingControllerConfiguration *v11;
  MRPlaybackQueueRequest *v12;
  MRNowPlayingController *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingRequestResponse.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v9 = [MRNowPlayingControllerConfiguration alloc];
  -[MRNowPlayingRequest destination](self, "destination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MRNowPlayingControllerConfiguration initWithDestination:](v9, "initWithDestination:", v10);

  v12 = -[MRPlaybackQueueRequest initWithRange:]([MRPlaybackQueueRequest alloc], "initWithRange:", 0, 1);
  -[MRPlaybackQueueRequest setArtworkHeight:](v12, "setArtworkHeight:", 600.0);
  -[MRPlaybackQueueRequest setArtworkWidth:](v12, "setArtworkWidth:", 600.0);
  -[MRNowPlayingControllerConfiguration setPlaybackQueueRequest:](v11, "setPlaybackQueueRequest:", v12);
  -[MRNowPlayingControllerConfiguration setLabel:](v11, "setLabel:", CFSTR("requestNowPlayingItemArtwork"));
  v13 = -[MRNowPlayingController initWithConfiguration:]([MRNowPlayingController alloc], "initWithConfiguration:", v11);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __70__MRNowPlayingRequest_requestNowPlayingItemArtworkOnQueue_completion___block_invoke;
  v17[3] = &unk_1E30C99E8;
  v18 = v7;
  v19 = v8;
  v14 = v8;
  v15 = v7;
  -[MRNowPlayingController performRequestWithCompletion:](v13, "performRequestWithCompletion:", v17);

}

void __70__MRNowPlayingRequest_requestNowPlayingItemArtworkOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__MRNowPlayingRequest_requestNowPlayingItemArtworkOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E30C6658;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __70__MRNowPlayingRequest_requestNowPlayingItemArtworkOnQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "playbackQueue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentItemWithOffset:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "artwork");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v2 + 16))(v2, v4, *(_QWORD *)(a1 + 40));

}

- (void)requestNowPlayingInfoOnQueue:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  MRNowPlayingControllerConfiguration *v9;
  void *v10;
  MRNowPlayingControllerConfiguration *v11;
  void *v12;
  MRNowPlayingController *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingRequestResponse.m"), 133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v9 = [MRNowPlayingControllerConfiguration alloc];
  -[MRNowPlayingRequest destination](self, "destination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MRNowPlayingControllerConfiguration initWithDestination:](v9, "initWithDestination:", v10);

  +[MRPlaybackQueueRequest defaultPlaybackQueueRequest](MRPlaybackQueueRequest, "defaultPlaybackQueueRequest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRNowPlayingControllerConfiguration setPlaybackQueueRequest:](v11, "setPlaybackQueueRequest:", v12);

  -[MRNowPlayingControllerConfiguration setLabel:](v11, "setLabel:", CFSTR("requestNowPlayingInfo"));
  v13 = -[MRNowPlayingController initWithConfiguration:]([MRNowPlayingController alloc], "initWithConfiguration:", v11);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __63__MRNowPlayingRequest_requestNowPlayingInfoOnQueue_completion___block_invoke;
  v17[3] = &unk_1E30C99E8;
  v18 = v7;
  v19 = v8;
  v14 = v8;
  v15 = v7;
  -[MRNowPlayingController performRequestWithCompletion:](v13, "performRequestWithCompletion:", v17);

}

void __63__MRNowPlayingRequest_requestNowPlayingInfoOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MRNowPlayingRequest_requestNowPlayingInfoOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E30C6658;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __63__MRNowPlayingRequest_requestNowPlayingInfoOnQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "playbackQueue");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nowPlayingInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));

}

- (void)requestSupportedCommandsOnQueue:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  MRNowPlayingControllerConfiguration *v9;
  void *v10;
  MRNowPlayingControllerConfiguration *v11;
  MRNowPlayingController *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingRequestResponse.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v9 = [MRNowPlayingControllerConfiguration alloc];
  -[MRNowPlayingRequest destination](self, "destination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MRNowPlayingControllerConfiguration initWithDestination:](v9, "initWithDestination:", v10);

  -[MRNowPlayingControllerConfiguration setRequestSupportedCommands:](v11, "setRequestSupportedCommands:", 1);
  -[MRNowPlayingControllerConfiguration setLabel:](v11, "setLabel:", CFSTR("requestSupportedCommands"));
  v12 = -[MRNowPlayingController initWithConfiguration:]([MRNowPlayingController alloc], "initWithConfiguration:", v11);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __66__MRNowPlayingRequest_requestSupportedCommandsOnQueue_completion___block_invoke;
  v16[3] = &unk_1E30C99E8;
  v17 = v7;
  v18 = v8;
  v13 = v8;
  v14 = v7;
  -[MRNowPlayingController performRequestWithCompletion:](v12, "performRequestWithCompletion:", v16);

}

void __66__MRNowPlayingRequest_requestSupportedCommandsOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__MRNowPlayingRequest_requestSupportedCommandsOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E30C6658;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __66__MRNowPlayingRequest_requestSupportedCommandsOnQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "supportedCommands");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));

}

- (void)requestShuffleAndRepeatModeOnQueue:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  MRNowPlayingControllerConfiguration *v9;
  void *v10;
  MRNowPlayingControllerConfiguration *v11;
  MRNowPlayingController *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingRequestResponse.m"), 163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v9 = [MRNowPlayingControllerConfiguration alloc];
  -[MRNowPlayingRequest destination](self, "destination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MRNowPlayingControllerConfiguration initWithDestination:](v9, "initWithDestination:", v10);

  -[MRNowPlayingControllerConfiguration setRequestSupportedCommands:](v11, "setRequestSupportedCommands:", 1);
  -[MRNowPlayingControllerConfiguration setLabel:](v11, "setLabel:", CFSTR("requestShuffleAndRepeatModeOnQueue"));
  v12 = -[MRNowPlayingController initWithConfiguration:]([MRNowPlayingController alloc], "initWithConfiguration:", v11);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__MRNowPlayingRequest_requestShuffleAndRepeatModeOnQueue_completion___block_invoke;
  v16[3] = &unk_1E30C99E8;
  v17 = v7;
  v18 = v8;
  v13 = v8;
  v14 = v7;
  -[MRNowPlayingController performRequestWithCompletion:](v12, "performRequestWithCompletion:", v16);

}

void __69__MRNowPlayingRequest_requestShuffleAndRepeatModeOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__MRNowPlayingRequest_requestShuffleAndRepeatModeOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E30C6658;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

uint64_t __69__MRNowPlayingRequest_requestShuffleAndRepeatModeOnQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "shuffleMode"), objc_msgSend(*(id *)(a1 + 32), "repeatMode"), *(_QWORD *)(a1 + 40));
}

- (void)requestProxiableSupportedCommandsOnQueue:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  MRNowPlayingControllerConfiguration *v9;
  void *v10;
  MRNowPlayingControllerConfiguration *v11;
  MRNowPlayingController *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingRequestResponse.m"), 178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v9 = [MRNowPlayingControllerConfiguration alloc];
  -[MRNowPlayingRequest destination](self, "destination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MRNowPlayingControllerConfiguration initWithDestination:](v9, "initWithDestination:", v10);

  -[MRNowPlayingControllerConfiguration setRequestSupportedCommands:](v11, "setRequestSupportedCommands:", 1);
  -[MRNowPlayingControllerConfiguration setLabel:](v11, "setLabel:", CFSTR("requestProxiableSupportedCommands"));
  v12 = -[MRNowPlayingController initWithConfiguration:]([MRNowPlayingController alloc], "initWithConfiguration:", v11);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__MRNowPlayingRequest_requestProxiableSupportedCommandsOnQueue_completion___block_invoke;
  v16[3] = &unk_1E30C99E8;
  v17 = v7;
  v18 = v8;
  v13 = v8;
  v14 = v7;
  -[MRNowPlayingController performRequestWithCompletion:](v12, "performRequestWithCompletion:", v16);

}

void __75__MRNowPlayingRequest_requestProxiableSupportedCommandsOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__MRNowPlayingRequest_requestProxiableSupportedCommandsOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E30C6658;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __75__MRNowPlayingRequest_requestProxiableSupportedCommandsOnQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "proxiableSupportedCommands");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));

}

- (void)requestLastPlayingDateOnQueue:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  __CFString *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingRequestResponse.m"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("[MRNowPlaying requestLastPlayingDate]"), v10);
  -[MRNowPlayingRequest destination](self, "destination");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[MRNowPlayingRequest destination](self, "destination");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR(" for %@"), v14);

  }
  _MRLogForCategory(0xAuLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v29 = v12;
    _os_log_impl(&dword_193827000, v15, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  -[MRNowPlayingRequest destination](self, "destination");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __64__MRNowPlayingRequest_requestLastPlayingDateOnQueue_completion___block_invoke;
  v22[3] = &unk_1E30C9A38;
  v23 = CFSTR("[MRNowPlaying requestLastPlayingDate]");
  v24 = v10;
  v25 = v11;
  v26 = v7;
  v27 = v8;
  v17 = v8;
  v18 = v7;
  v19 = v11;
  v20 = v10;
  +[MRDestinationResolver resolveDestination:level:timeout:completion:](MRDestinationResolver, "resolveDestination:level:timeout:completion:", v16, 2, v22, 5.0);

}

void __64__MRNowPlayingRequest_requestLastPlayingDateOnQueue_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "playerPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __64__MRNowPlayingRequest_requestLastPlayingDateOnQueue_completion___block_invoke_2;
  v19 = &unk_1E30C9A10;
  v7 = v6;
  v20 = v7;
  v21 = a1[4];
  v22 = a1[5];
  v23 = a1[6];
  v24 = a1[7];
  v25 = a1[8];
  v8 = MEMORY[0x194036C44](&v16);
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    _MRLogForCategory(0xAuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = a1[4];
      v12 = a1[5];
      *(_DWORD *)buf = 138543874;
      v27 = v11;
      v28 = 2114;
      v29 = v12;
      v30 = 2112;
      v31 = v7;
      _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    v13 = (void *)MRGetSharedService();
    MRMediaRemoteServiceGetLastPlayingDateForPlayer(v13, v7, a1[7], v9);
  }
  else if (v5)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v8 + 16))(v8, 0, v5);
  }
  else
  {
    v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = (void *)objc_msgSend(v14, "initWithMRError:", 27, v16, v17, v18, v19, v20, v21, v22, v23, v24);
    ((void (**)(_QWORD, _QWORD, void *))v9)[2](v9, 0, v15);

  }
}

void __64__MRNowPlayingRequest_requestLastPlayingDateOnQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  id v41;
  id v42;
  id v43;
  _QWORD block[4];
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  id v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "timeIntervalSinceNow");
  objc_msgSend(v8, "numberWithDouble:", -v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("lastPlayingDate = %@. Time since playing = %@ seconds."), v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory(0xAuLL);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v6 && v11)
  {
    v15 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v15)
      {
        v17 = *(_QWORD *)(a1 + 40);
        v16 = *(_QWORD *)(a1 + 48);
        v18 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138544386;
        v49 = v17;
        v50 = 2114;
        v51 = v16;
        v52 = 2112;
        v53 = v11;
        v54 = 2114;
        v55 = v18;
        v56 = 2048;
        v57 = v20;
        v21 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v22 = v14;
        v23 = 52;
LABEL_16:
        _os_log_impl(&dword_193827000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v15)
      goto LABEL_22;
    v34 = *(_QWORD *)(a1 + 40);
    v35 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138544130;
    v49 = v34;
    v50 = 2114;
    v51 = v35;
    v52 = 2112;
    v53 = v11;
    v54 = 2048;
    v55 = v36;
    v21 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    v22 = v14;
    v23 = 42;
    goto LABEL_16;
  }
  if (v6)
  {
    v24 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v12)
    {
      if (v24)
      {
        v26 = *(_QWORD *)(a1 + 40);
        v25 = *(_QWORD *)(a1 + 48);
        v27 = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138544386;
        v49 = v26;
        v50 = 2114;
        v51 = v25;
        v52 = 2114;
        v53 = v6;
        v54 = 2114;
        v55 = v27;
        v56 = 2048;
        v57 = v28;
        _os_log_error_impl(&dword_193827000, v14, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v24)
    {
      __64__MRNowPlayingRequest_requestLastPlayingDateOnQueue_completion___block_invoke_2_cold_1(a1);
    }
    goto LABEL_22;
  }
  v29 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (!v29)
      goto LABEL_22;
    v37 = *(_QWORD *)(a1 + 40);
    v38 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138543874;
    v49 = v37;
    v50 = 2114;
    v51 = v38;
    v52 = 2048;
    v53 = v39;
    v21 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v22 = v14;
    v23 = 32;
    goto LABEL_16;
  }
  if (v29)
  {
    v31 = *(_QWORD *)(a1 + 40);
    v30 = *(_QWORD *)(a1 + 48);
    v32 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 138544130;
    v49 = v31;
    v50 = 2114;
    v51 = v30;
    v52 = 2114;
    v53 = v32;
    v54 = 2048;
    v55 = v33;
    v21 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__MRNowPlayingRequest_requestLastPlayingDateOnQueue_completion___block_invoke_51;
  block[3] = &unk_1E30C6658;
  v40 = *(NSObject **)(a1 + 64);
  v41 = *(id *)(a1 + 72);
  v46 = v6;
  v47 = v41;
  v45 = v5;
  v42 = v6;
  v43 = v5;
  dispatch_async(v40, block);

}

uint64_t __64__MRNowPlayingRequest_requestLastPlayingDateOnQueue_completion___block_invoke_51(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)requestDeviceLastPlayingDateOnQueue:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  char v23;
  MRPlayerPath *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[2];
  _QWORD v35[4];
  id v36;
  __CFString *v37;
  id v38;
  id v39;
  __int128 *v40;
  _QWORD v41[4];
  __CFString *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingRequestResponse.m"), 225, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("[MRNowPlaying requestDeviceLastPlayingDate]"), v10);
  -[MRNowPlayingRequest destination](self, "destination");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[MRNowPlayingRequest destination](self, "destination");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR(" for %@"), v14);

  }
  _MRLogForCategory(0xAuLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_193827000, v15, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__15;
  v51 = __Block_byref_object_dispose__15;
  v52 = 0;
  v16 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke;
  v41[3] = &unk_1E30C9A60;
  p_buf = &buf;
  v42 = CFSTR("[MRNowPlaying requestDeviceLastPlayingDate]");
  v17 = v10;
  v43 = v17;
  v18 = v11;
  v44 = v18;
  v19 = v7;
  v45 = v19;
  v20 = v8;
  v46 = v20;
  v21 = (void *)MEMORY[0x194036C44](v41);
  -[MRNowPlayingRequest destination](self, "destination");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isLocal");

  if ((v23 & 1) != 0)
  {
    v24 = [MRPlayerPath alloc];
    +[MROrigin localOrigin](MROrigin, "localOrigin");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[MRPlayerPath initWithOrigin:client:player:](v24, "initWithOrigin:client:player:", v25, 0, 0);
    v27 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v26;

    v28 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    v35[0] = v16;
    v35[1] = 3221225472;
    v35[2] = __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke_2;
    v35[3] = &unk_1E30C9AB0;
    v40 = &buf;
    v36 = v19;
    v39 = v21;
    v37 = CFSTR("[MRNowPlaying requestDeviceLastPlayingDate]");
    v38 = v17;
    MRMediaRemoteNowPlayingResolvePlayerPath(v28, v36, v35);

    v29 = &v36;
  }
  else
  {
    -[MRNowPlayingRequest destination](self, "destination");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v16;
    v32[1] = 3221225472;
    v32[2] = __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke_63;
    v32[3] = &unk_1E30C9AD8;
    v34[0] = v21;
    v34[1] = &buf;
    v32[4] = self;
    v33 = v19;
    +[MRDestinationResolver resolveDestination:level:timeout:completion:](MRDestinationResolver, "resolveDestination:level:timeout:completion:", v30, 0, v32, 5.0);

    v29 = (id *)v34;
  }

  _Block_object_dispose(&buf, 8);
}

void __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  id v41;
  id v42;
  id v43;
  _QWORD block[4];
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  id v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "timeIntervalSinceNow");
  objc_msgSend(v8, "numberWithDouble:", -v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("lastPlayingDate = %@. Time since playing = %@ seconds."), v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  _MRLogForCategory(0xAuLL);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v6 && v11)
  {
    v15 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v15)
      {
        v16 = *(_QWORD *)(a1 + 32);
        v17 = *(_QWORD *)(a1 + 40);
        v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        *(_DWORD *)buf = 138544386;
        v49 = v16;
        v50 = 2114;
        v51 = v17;
        v52 = 2112;
        v53 = v11;
        v54 = 2114;
        v55 = v18;
        v56 = 2048;
        v57 = v20;
        v21 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v22 = v14;
        v23 = 52;
LABEL_16:
        _os_log_impl(&dword_193827000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v15)
      goto LABEL_22;
    v34 = *(_QWORD *)(a1 + 32);
    v35 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    *(_DWORD *)buf = 138544130;
    v49 = v34;
    v50 = 2114;
    v51 = v35;
    v52 = 2112;
    v53 = v11;
    v54 = 2048;
    v55 = v36;
    v21 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    v22 = v14;
    v23 = 42;
    goto LABEL_16;
  }
  if (v6)
  {
    v24 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (v12)
    {
      if (v24)
      {
        v25 = *(_QWORD *)(a1 + 32);
        v26 = *(_QWORD *)(a1 + 40);
        v27 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        *(_DWORD *)buf = 138544386;
        v49 = v25;
        v50 = 2114;
        v51 = v26;
        v52 = 2114;
        v53 = v6;
        v54 = 2114;
        v55 = v27;
        v56 = 2048;
        v57 = v28;
        _os_log_error_impl(&dword_193827000, v14, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v24)
    {
      __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke_cold_1(a1);
    }
    goto LABEL_22;
  }
  v29 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (!v29)
      goto LABEL_22;
    v37 = *(_QWORD *)(a1 + 32);
    v38 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    *(_DWORD *)buf = 138543874;
    v49 = v37;
    v50 = 2114;
    v51 = v38;
    v52 = 2048;
    v53 = v39;
    v21 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v22 = v14;
    v23 = 32;
    goto LABEL_16;
  }
  if (v29)
  {
    v30 = *(_QWORD *)(a1 + 32);
    v31 = *(_QWORD *)(a1 + 40);
    v32 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    *(_DWORD *)buf = 138544130;
    v49 = v30;
    v50 = 2114;
    v51 = v31;
    v52 = 2114;
    v53 = v32;
    v54 = 2048;
    v55 = v33;
    v21 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke_57;
  block[3] = &unk_1E30C6658;
  v40 = *(NSObject **)(a1 + 56);
  v41 = *(id *)(a1 + 64);
  v46 = v6;
  v47 = v41;
  v45 = v5;
  v42 = v6;
  v43 = v5;
  dispatch_async(v40, block);

}

uint64_t __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke_57(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originClientRequestsForPlayerPath:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a2, "isResolved"))
  {
    v6 = (void *)MRGetSharedService();
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    v8 = *(void **)(a1 + 32);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke_3;
    v14[3] = &unk_1E30C9A88;
    v15 = v5;
    v16 = *(id *)(a1 + 56);
    MRMediaRemoteServiceGetLastPlayingDateForPlayer(v6, v7, v8, v14);

    v9 = v15;
  }
  else
  {
    _MRLogForCategory(0xAuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543874;
      v18 = v11;
      v19 = 2114;
      v20 = v12;
      v21 = 2112;
      v22 = CFSTR("Using cache.");
      _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "originClientRequestsForPlayerPath:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "handleLastPlayingDateRequestWithCompletion:", *(_QWORD *)(a1 + 56));
  }

}

void __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "setLastPlayingDate:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke_63(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  MRPlayerPath *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(a2, "origin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = [MRPlayerPath alloc];
    objc_msgSend(*(id *)(a1 + 32), "destination");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "origin");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MRPlayerPath initWithOrigin:client:player:](v6, "initWithOrigin:client:player:", v8, 0, 0);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v12 = (void *)MRGetSharedService();
    MRMediaRemoteServiceGetLastPlayingDateForPlayer(v12, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(void **)(a1 + 40), *(void **)(a1 + 48));
  }
  else
  {
    v13 = *(_QWORD *)(a1 + 48);
    if (v15)
    {
      (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, 0);
    }
    else
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 5);
      (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);

    }
  }

}

- (void)requestClientPropertiesOnQueue:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  MRNowPlayingControllerConfiguration *v9;
  void *v10;
  MRNowPlayingControllerConfiguration *v11;
  MRNowPlayingController *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingRequestResponse.m"), 279, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v9 = [MRNowPlayingControllerConfiguration alloc];
  -[MRNowPlayingRequest destination](self, "destination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MRNowPlayingControllerConfiguration initWithDestination:](v9, "initWithDestination:", v10);

  -[MRNowPlayingControllerConfiguration setRequestClientProperties:](v11, "setRequestClientProperties:", 1);
  -[MRNowPlayingControllerConfiguration setLabel:](v11, "setLabel:", CFSTR("requestClientProperties"));
  v12 = -[MRNowPlayingController initWithConfiguration:]([MRNowPlayingController alloc], "initWithConfiguration:", v11);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__MRNowPlayingRequest_requestClientPropertiesOnQueue_completion___block_invoke;
  v16[3] = &unk_1E30C99E8;
  v17 = v7;
  v18 = v8;
  v13 = v8;
  v14 = v7;
  -[MRNowPlayingController performRequestWithCompletion:](v12, "performRequestWithCompletion:", v16);

}

void __65__MRNowPlayingRequest_requestClientPropertiesOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__MRNowPlayingRequest_requestClientPropertiesOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E30C6658;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __65__MRNowPlayingRequest_requestClientPropertiesOnQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "clientProperties");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));

}

- (void)nowPlayingPlayerPathOnQueue:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  MRNowPlayingControllerConfiguration *v9;
  void *v10;
  MRNowPlayingControllerConfiguration *v11;
  MRNowPlayingController *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRNowPlayingRequestResponse.m"), 294, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  v9 = [MRNowPlayingControllerConfiguration alloc];
  -[MRNowPlayingRequest destination](self, "destination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MRNowPlayingControllerConfiguration initWithDestination:](v9, "initWithDestination:", v10);

  -[MRNowPlayingControllerConfiguration setLabel:](v11, "setLabel:", CFSTR("requestNowPlayingClient"));
  v12 = -[MRNowPlayingController initWithConfiguration:]([MRNowPlayingController alloc], "initWithConfiguration:", v11);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__MRNowPlayingRequest_nowPlayingPlayerPathOnQueue_completion___block_invoke;
  v16[3] = &unk_1E30C99E8;
  v17 = v7;
  v18 = v8;
  v13 = v8;
  v14 = v7;
  -[MRNowPlayingController performRequestWithCompletion:](v12, "performRequestWithCompletion:", v16);

}

void __62__MRNowPlayingRequest_nowPlayingPlayerPathOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MRNowPlayingRequest_nowPlayingPlayerPathOnQueue_completion___block_invoke_2;
  block[3] = &unk_1E30C6658;
  v7 = *(NSObject **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v12 = v5;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

}

void __62__MRNowPlayingRequest_nowPlayingPlayerPathOnQueue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "playerPath");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));

}

- (void)sendCommand:(unsigned int)a3 options:(id)a4 queue:(id)a5 completion:(id)a6
{
  -[MRNowPlayingRequest sendCommand:options:appOptions:queue:completion:](self, "sendCommand:options:appOptions:queue:completion:", *(_QWORD *)&a3, a4, 0, a5, a6);
}

- (void)sendCommand:(unsigned int)a3 options:(id)a4 appOptions:(unsigned int)a5 queue:(id)a6 completion:(id)a7
{
  uint64_t v8;
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  MRNowPlayingControllerConfiguration *v15;
  void *v16;
  MRNowPlayingControllerConfiguration *v17;
  MRNowPlayingController *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v8 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a3;
  v12 = a6;
  v13 = a7;
  v14 = a4;
  v15 = [MRNowPlayingControllerConfiguration alloc];
  -[MRNowPlayingRequest destination](self, "destination");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[MRNowPlayingControllerConfiguration initWithDestination:](v15, "initWithDestination:", v16);

  -[MRNowPlayingControllerConfiguration setLabel:](v17, "setLabel:", CFSTR("sendCommand"));
  v18 = -[MRNowPlayingController initWithConfiguration:]([MRNowPlayingController alloc], "initWithConfiguration:", v17);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __71__MRNowPlayingRequest_sendCommand_options_appOptions_queue_completion___block_invoke;
  v21[3] = &unk_1E30C9B00;
  v22 = v12;
  v23 = v13;
  v19 = v12;
  v20 = v13;
  -[MRNowPlayingController sendCommand:options:appOptions:completion:](v18, "sendCommand:options:appOptions:completion:", v10, v14, v8, v21);

}

void __71__MRNowPlayingRequest_sendCommand_options_appOptions_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __71__MRNowPlayingRequest_sendCommand_options_appOptions_queue_completion___block_invoke_2;
    v6[3] = &unk_1E30C6568;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __71__MRNowPlayingRequest_sendCommand_options_appOptions_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (BOOL)localIsPlaying
{
  return MRMediaRemotePlaybackStateIsAdvancing(objc_msgSend(a1, "localPlaybackState"));
}

+ (unsigned)localPlaybackState
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t uint64;
  __CFString *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  void *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _BOOL4 v37;
  void *v38;
  uint64_t v39;
  const char *v40;
  NSObject *v41;
  uint32_t v42;
  void *v43;
  void *v45;
  void *v46;
  id v47;
  uint8_t buf[4];
  const __CFString *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("NowPlayingRequest.localPlaybackState"), v6);
  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[MROrigin localOrigin](MROrigin, "localOrigin");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString appendFormat:](v7, "appendFormat:", CFSTR(" for %@"), v9);

  }
  _MRLogForCategory(0xAuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v49 = v7;
    _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  objc_msgSend(a1, "localNowPlayingPlayerPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isResolved"))
  {
    LODWORD(uint64) = 0;
    goto LABEL_9;
  }
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "playerClientRequestsForPlayerPath:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "playbackState");
  if (v14)
  {
    LODWORD(uint64) = v14;

    goto LABEL_9;
  }
  _MRLogForCategory(0xAuLL);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v49 = CFSTR("NowPlayingRequest.localPlaybackState");
    v50 = 2114;
    v51 = v6;
    v52 = 2112;
    v53 = 0;
    v54 = 2112;
    v55 = v4;
    _os_log_impl(&dword_193827000, v30, OS_LOG_TYPE_DEFAULT, "Cache Miss: Request: %{public}@<%{public}@> for %@ %@", buf, 0x2Au);
  }
  v46 = v4;

  MRCreateXPCMessage(0x200000000000012uLL);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  MRAddPlayerPathToXPCMessage(v31, v11);
  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "service");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "mrXPCConnection");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  objc_msgSend(v34, "sendSyncMessage:error:", v31, &v47);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v47;

  uint64 = xpc_dictionary_get_uint64(v35, "MRXPC_PLAYBACK_STATE_KEY");
  objc_msgSend(v13, "updatePlaybackStateIfUninitialized:", uint64);

  if (!v36)
  {
    v4 = v46;
    v3 = 0x1E0C99000;
LABEL_9:
    v16 = (__CFString *)MRMediaRemoteCopyPlaybackStateDescription(uint64);

    _MRLogForCategory(0xAuLL);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v11)
      {
        if (v18)
        {
          v19 = (void *)MRMediaRemoteCopyPlaybackStateDescription(uint64);
          objc_msgSend(*(id *)(v3 + 3432), "date");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "timeIntervalSinceDate:", v4);
          *(_DWORD *)buf = 138544386;
          v49 = CFSTR("NowPlayingRequest.localPlaybackState");
          v50 = 2114;
          v51 = v6;
          v52 = 2112;
          v53 = v19;
          v54 = 2114;
          v55 = v11;
          v56 = 2048;
          v57 = v21;
          v22 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
          v23 = v17;
          v24 = 52;
LABEL_18:
          _os_log_impl(&dword_193827000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);

LABEL_28:
        }
      }
      else if (v18)
      {
        v19 = (void *)MRMediaRemoteCopyPlaybackStateDescription(uint64);
        objc_msgSend(*(id *)(v3 + 3432), "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSinceDate:", v4);
        *(_DWORD *)buf = 138544130;
        v49 = CFSTR("NowPlayingRequest.localPlaybackState");
        v50 = 2114;
        v51 = v6;
        v52 = 2112;
        v53 = v19;
        v54 = 2048;
        v55 = v29;
        v22 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        v23 = v17;
        v24 = 42;
        goto LABEL_18;
      }
LABEL_29:
      v36 = 0;
      goto LABEL_30;
    }
    if (v11)
    {
      if (!v18)
        goto LABEL_29;
      objc_msgSend(*(id *)(v3 + 3432), "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceDate:", v4);
      *(_DWORD *)buf = 138544130;
      v49 = CFSTR("NowPlayingRequest.localPlaybackState");
      v50 = 2114;
      v51 = v6;
      v52 = 2114;
      v53 = v11;
      v54 = 2048;
      v55 = v25;
      v26 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v27 = v17;
      v28 = 42;
    }
    else
    {
      if (!v18)
        goto LABEL_29;
      objc_msgSend(*(id *)(v3 + 3432), "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceDate:", v4);
      *(_DWORD *)buf = 138543874;
      v49 = CFSTR("NowPlayingRequest.localPlaybackState");
      v50 = 2114;
      v51 = v6;
      v52 = 2048;
      v53 = v43;
      v26 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v27 = v17;
      v28 = 32;
    }
    _os_log_impl(&dword_193827000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
    goto LABEL_28;
  }
  _MRLogForCategory(0xAuLL);
  v17 = objc_claimAutoreleasedReturnValue();
  v37 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
  if (!v11)
  {
    v4 = v46;
    if (!v37)
      goto LABEL_30;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "timeIntervalSinceDate:", v46);
    *(_DWORD *)buf = 138544130;
    v49 = CFSTR("NowPlayingRequest.localPlaybackState");
    v50 = 2114;
    v51 = v6;
    v52 = 2114;
    v53 = v36;
    v54 = 2048;
    v55 = v45;
    v40 = "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds";
    v41 = v17;
    v42 = 42;
LABEL_34:
    _os_log_error_impl(&dword_193827000, v41, OS_LOG_TYPE_ERROR, v40, buf, v42);

    goto LABEL_30;
  }
  v4 = v46;
  if (v37)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "timeIntervalSinceDate:", v46);
    *(_DWORD *)buf = 138544386;
    v49 = CFSTR("NowPlayingRequest.localPlaybackState");
    v50 = 2114;
    v51 = v6;
    v52 = 2114;
    v53 = v36;
    v54 = 2114;
    v55 = v11;
    v56 = 2048;
    v57 = v39;
    v40 = "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds";
    v41 = v17;
    v42 = 52;
    goto LABEL_34;
  }
LABEL_30:

  return uint64;
}

+ (NSArray)localSupportedCommands
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  void *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  _BOOL4 v37;
  void *v38;
  uint64_t v39;
  const char *v40;
  NSObject *v41;
  uint32_t v42;
  void *v43;
  void *v45;
  void *v46;
  id v47;
  uint8_t buf[4];
  const __CFString *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = 0x1E0C99000uLL;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("NowPlayingRequest.localSupportedCommands"), v6);
  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[MROrigin localOrigin](MROrigin, "localOrigin");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString appendFormat:](v7, "appendFormat:", CFSTR(" for %@"), v9);

  }
  _MRLogForCategory(0xAuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v49 = v7;
    _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  objc_msgSend(a1, "localNowPlayingPlayerPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isResolved"))
  {
    v15 = 0;
    goto LABEL_9;
  }
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "playerClientRequestsForPlayerPath:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "supportedCommands");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;

    goto LABEL_9;
  }
  _MRLogForCategory(0xAuLL);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v49 = CFSTR("NowPlayingRequest.localSupportedCommands");
    v50 = 2114;
    v51 = v6;
    v52 = 2112;
    v53 = 0;
    v54 = 2112;
    v55 = v4;
    _os_log_impl(&dword_193827000, v30, OS_LOG_TYPE_DEFAULT, "Cache Miss: Request: %{public}@<%{public}@> for %@ %@", buf, 0x2Au);
  }
  v46 = v4;

  MRCreateXPCMessage(0x200000000000030uLL);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  MRAddPlayerPathToXPCMessage(v31, v11);
  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "service");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "mrXPCConnection");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  objc_msgSend(v34, "sendSyncMessage:error:", v31, &v47);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v47;

  v15 = (void *)MRCreateSupportedCommandsFromXPCMessage(v35);
  objc_msgSend(v13, "updateSupportedCommandsIfUninitialized:", v15);

  if (!v36)
  {
    v4 = v46;
    v3 = 0x1E0C99000;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    _MRLogForCategory(0xAuLL);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v16)
    {
      if (v11)
      {
        if (v18)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v3 + 3432), "date");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "timeIntervalSinceDate:", v4);
          *(_DWORD *)buf = 138544386;
          v49 = CFSTR("NowPlayingRequest.localSupportedCommands");
          v50 = 2114;
          v51 = v6;
          v52 = 2112;
          v53 = v19;
          v54 = 2114;
          v55 = v11;
          v56 = 2048;
          v57 = v21;
          v22 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
          v23 = v17;
          v24 = 52;
LABEL_18:
          _os_log_impl(&dword_193827000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);

LABEL_28:
        }
      }
      else if (v18)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v3 + 3432), "date");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSinceDate:", v4);
        *(_DWORD *)buf = 138544130;
        v49 = CFSTR("NowPlayingRequest.localSupportedCommands");
        v50 = 2114;
        v51 = v6;
        v52 = 2112;
        v53 = v19;
        v54 = 2048;
        v55 = v29;
        v22 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        v23 = v17;
        v24 = 42;
        goto LABEL_18;
      }
LABEL_29:
      v36 = 0;
      goto LABEL_30;
    }
    if (v11)
    {
      if (!v18)
        goto LABEL_29;
      objc_msgSend(*(id *)(v3 + 3432), "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceDate:", v4);
      *(_DWORD *)buf = 138544130;
      v49 = CFSTR("NowPlayingRequest.localSupportedCommands");
      v50 = 2114;
      v51 = v6;
      v52 = 2114;
      v53 = v11;
      v54 = 2048;
      v55 = v25;
      v26 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v27 = v17;
      v28 = 42;
    }
    else
    {
      if (!v18)
        goto LABEL_29;
      objc_msgSend(*(id *)(v3 + 3432), "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSinceDate:", v4);
      *(_DWORD *)buf = 138543874;
      v49 = CFSTR("NowPlayingRequest.localSupportedCommands");
      v50 = 2114;
      v51 = v6;
      v52 = 2048;
      v53 = v43;
      v26 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v27 = v17;
      v28 = 32;
    }
    _os_log_impl(&dword_193827000, v27, OS_LOG_TYPE_DEFAULT, v26, buf, v28);
    goto LABEL_28;
  }
  _MRLogForCategory(0xAuLL);
  v17 = objc_claimAutoreleasedReturnValue();
  v37 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
  if (!v11)
  {
    v4 = v46;
    if (!v37)
      goto LABEL_30;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "timeIntervalSinceDate:", v46);
    *(_DWORD *)buf = 138544130;
    v49 = CFSTR("NowPlayingRequest.localSupportedCommands");
    v50 = 2114;
    v51 = v6;
    v52 = 2114;
    v53 = v36;
    v54 = 2048;
    v55 = v45;
    v40 = "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds";
    v41 = v17;
    v42 = 42;
LABEL_34:
    _os_log_error_impl(&dword_193827000, v41, OS_LOG_TYPE_ERROR, v40, buf, v42);

    goto LABEL_30;
  }
  v4 = v46;
  if (v37)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "timeIntervalSinceDate:", v46);
    *(_DWORD *)buf = 138544386;
    v49 = CFSTR("NowPlayingRequest.localSupportedCommands");
    v50 = 2114;
    v51 = v6;
    v52 = 2114;
    v53 = v36;
    v54 = 2114;
    v55 = v11;
    v56 = 2048;
    v57 = v39;
    v40 = "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds";
    v41 = v17;
    v42 = 52;
    goto LABEL_34;
  }
LABEL_30:

  return (NSArray *)v15;
}

+ (MRContentItem)localNowPlayingItem
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  MRPlaybackQueue *v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  uint64_t v35;
  const char *v36;
  NSObject *v37;
  uint32_t v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  uint64_t v43;
  const char *v44;
  NSObject *v45;
  uint32_t v46;
  void *v47;
  const char *v48;
  NSObject *v49;
  uint32_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v55;
  __CFString *v56;
  void *v57;
  void *v58;
  id v59;
  uint8_t buf[4];
  const __CFString *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  id v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("NowPlayingRequest.localNowPlayingItem"), v5);
  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[MROrigin localOrigin](MROrigin, "localOrigin");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString appendFormat:](v6, "appendFormat:", CFSTR(" for %@"), v8);

  }
  _MRLogForCategory(0xAuLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v61 = v6;
    _os_log_impl(&dword_193827000, v9, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  objc_msgSend(a1, "localNowPlayingPlayerPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isResolved"))
  {
    v24 = 0;
    goto LABEL_17;
  }
  v56 = v6;
  v57 = v5;
  v58 = v3;
  +[MRPlaybackQueueRequest defaultPlaybackQueueRequest](MRPlaybackQueueRequest, "defaultPlaybackQueueRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRequestIdentifier:", v13);

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "processName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("sync-%@-%d"), v16, getpid());
  objc_msgSend(v11, "setLabel:", v17);

  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "playerClientRequestsForPlayerPath:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "playbackQueue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  MRPlaybackQueueCreateFromCache(v20, v11, 3, v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "contentItemWithOffset:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    v24 = v22;
    v25 = 0;
  }
  else
  {
    _MRLogForCategory(0xAuLL);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v61 = CFSTR("NowPlayingRequest.localNowPlayingItem");
      v62 = 2114;
      v63 = v57;
      v64 = 2112;
      v65 = 0;
      v66 = 2112;
      v67 = v58;
      _os_log_impl(&dword_193827000, v26, OS_LOG_TYPE_DEFAULT, "Cache Miss: Request: %{public}@<%{public}@> for %@ %@", buf, 0x2Au);
    }

    MRCreateXPCMessage(0x200000000000007uLL);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    MRAddPlayerPathToXPCMessage(v27, v10);
    MRAddPlaybackQueueRequestToXPCMessage(v27, v11);
    +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "service");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "mrXPCConnection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    objc_msgSend(v29, "sendSyncMessage:error:", v27, &v59);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v59;

    v31 = MRCreatePlaybackQueueFromXPCMessage(v30);
    -[MRPlaybackQueue contentItemWithOffset:](v31, "contentItemWithOffset:", 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "updatePlaybackQueueIfUninitialized:", v31);

  }
  if (!v25)
  {
    v5 = v57;
    v3 = v58;
    v6 = v56;
LABEL_17:
    v39 = MRContentItemCopyMinimalReadableDescription(v24);

    _MRLogForCategory(0xAuLL);
    v32 = objc_claimAutoreleasedReturnValue();
    v40 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    if (v39)
    {
      if (v10)
      {
        if (v40)
        {
          v41 = MRContentItemCopyMinimalReadableDescription(v24);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "timeIntervalSinceDate:", v3);
          *(_DWORD *)buf = 138544386;
          v61 = CFSTR("NowPlayingRequest.localNowPlayingItem");
          v62 = 2114;
          v63 = v5;
          v64 = 2112;
          v65 = v41;
          v66 = 2114;
          v67 = v10;
          v68 = 2048;
          v69 = v43;
          v44 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
          v45 = v32;
          v46 = 52;
LABEL_26:
          _os_log_impl(&dword_193827000, v45, OS_LOG_TYPE_DEFAULT, v44, buf, v46);

LABEL_33:
        }
      }
      else if (v40)
      {
        v41 = MRContentItemCopyMinimalReadableDescription(v24);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "timeIntervalSinceDate:", v3);
        *(_DWORD *)buf = 138544130;
        v61 = CFSTR("NowPlayingRequest.localNowPlayingItem");
        v62 = 2114;
        v63 = v5;
        v64 = 2112;
        v65 = v41;
        v66 = 2048;
        v67 = v51;
        v44 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
        v45 = v32;
        v46 = 42;
        goto LABEL_26;
      }
LABEL_34:
      v25 = 0;
      goto LABEL_35;
    }
    if (v10)
    {
      if (!v40)
        goto LABEL_34;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "timeIntervalSinceDate:", v3);
      *(_DWORD *)buf = 138544130;
      v61 = CFSTR("NowPlayingRequest.localNowPlayingItem");
      v62 = 2114;
      v63 = v5;
      v64 = 2114;
      v65 = v10;
      v66 = 2048;
      v67 = v47;
      v48 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v49 = v32;
      v50 = 42;
    }
    else
    {
      if (!v40)
        goto LABEL_34;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "timeIntervalSinceDate:", v3);
      *(_DWORD *)buf = 138543874;
      v61 = CFSTR("NowPlayingRequest.localNowPlayingItem");
      v62 = 2114;
      v63 = v5;
      v64 = 2048;
      v65 = v53;
      v48 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v49 = v32;
      v50 = 32;
    }
    _os_log_impl(&dword_193827000, v49, OS_LOG_TYPE_DEFAULT, v48, buf, v50);
    goto LABEL_33;
  }
  _MRLogForCategory(0xAuLL);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
  v5 = v57;
  v3 = v58;
  v6 = v56;
  if (v10)
  {
    if (v33)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "timeIntervalSinceDate:", v58);
      *(_DWORD *)buf = 138544386;
      v61 = CFSTR("NowPlayingRequest.localNowPlayingItem");
      v62 = 2114;
      v63 = v57;
      v64 = 2114;
      v65 = v25;
      v66 = 2114;
      v67 = v10;
      v68 = 2048;
      v69 = v35;
      v36 = "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds";
      v37 = v32;
      v38 = 52;
LABEL_29:
      _os_log_error_impl(&dword_193827000, v37, OS_LOG_TYPE_ERROR, v36, buf, v38);

    }
  }
  else if (v33)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "timeIntervalSinceDate:", v58);
    *(_DWORD *)buf = 138544130;
    v61 = CFSTR("NowPlayingRequest.localNowPlayingItem");
    v62 = 2114;
    v63 = v57;
    v64 = 2114;
    v65 = v25;
    v66 = 2048;
    v67 = v52;
    v36 = "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds";
    v37 = v32;
    v38 = 42;
    goto LABEL_29;
  }
LABEL_35:

  return (MRContentItem *)v24;
}

+ (MRPlaybackQueue)localPlaybackQueue
{
  void *v2;
  MRPlaybackQueue *v3;
  void *v4;
  MRPlaybackQueue *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localNowPlayingItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = [MRPlaybackQueue alloc];
    v7[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MRPlaybackQueue initWithContentItems:location:](v3, "initWithContentItems:location:", v4, 0);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (NSDate)localLastPlayingDate
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  MRPlayerPath *v9;
  void *v10;
  MRPlayerPath *v11;
  void *v12;
  void *v13;
  MRPlayerPath *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  MRPlayerPath *v19;
  NSObject *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  _BOOL4 v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  NSObject *v32;
  uint32_t v33;
  _BOOL4 v34;
  MRPlayerPath *v35;
  MRPlayerPath *v36;
  id v37;
  void *v38;
  MRPlayerPath *v40;
  MRPlayerPath *v41;
  id v42;
  uint8_t buf[4];
  const __CFString *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  MRPlayerPath *v48;
  __int16 v49;
  MRPlayerPath *v50;
  __int16 v51;
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("NowPlayingRequest.localLastPlayingDate"), v4);
  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[MROrigin localOrigin](MROrigin, "localOrigin");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString appendFormat:](v5, "appendFormat:", CFSTR(" for %@"), v7);

  }
  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v44 = v5;
    _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v9 = [MRPlayerPath alloc];
  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MRPlayerPath initWithOrigin:client:player:](v9, "initWithOrigin:client:player:", v10, 0, 0);

  v12 = (void *)MRGetSharedService();
  v42 = 0;
  MRMediaRemoteServiceGetLastPlayingDateForPlayerSync(v12, v11, &v42);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (MRPlayerPath *)v42;
  v15 = (void *)MEMORY[0x1E0CB3940];
  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v13, "timeIntervalSinceNow");
  objc_msgSend(v16, "numberWithDouble:", -v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("deviceLastPlayingDate = %@. Time since playing = %@ seconds."), v13, v18);
  v19 = (MRPlayerPath *)objc_claimAutoreleasedReturnValue();

  _MRLogForCategory(0xAuLL);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v14 || !v19)
  {
    if (!v14)
    {
      v34 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      if (!v11)
      {
        if (!v34)
          goto LABEL_21;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "timeIntervalSinceDate:", v2);
        *(_DWORD *)buf = 138543874;
        v44 = CFSTR("NowPlayingRequest.localLastPlayingDate");
        v45 = 2114;
        v46 = v4;
        v47 = 2048;
        v48 = v40;
        v25 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v26 = v21;
        v27 = 32;
        goto LABEL_20;
      }
      if (!v34)
        goto LABEL_21;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "timeIntervalSinceDate:", v2);
      *(_DWORD *)buf = 138544130;
      v44 = CFSTR("NowPlayingRequest.localLastPlayingDate");
      v45 = 2114;
      v46 = v4;
      v47 = 2114;
      v48 = v11;
      v49 = 2048;
      v50 = v35;
      v25 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_19:
      v26 = v21;
      v27 = 42;
      goto LABEL_20;
    }
    v28 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (v11)
    {
      if (v28)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "timeIntervalSinceDate:", v2);
        *(_DWORD *)buf = 138544386;
        v44 = CFSTR("NowPlayingRequest.localLastPlayingDate");
        v45 = 2114;
        v46 = v4;
        v47 = 2114;
        v48 = v14;
        v49 = 2114;
        v50 = v11;
        v51 = 2048;
        v52 = v30;
        v31 = "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds";
        v32 = v21;
        v33 = 52;
LABEL_28:
        _os_log_error_impl(&dword_193827000, v32, OS_LOG_TYPE_ERROR, v31, buf, v33);

      }
    }
    else if (v28)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "timeIntervalSinceDate:", v2);
      *(_DWORD *)buf = 138544130;
      v44 = CFSTR("NowPlayingRequest.localLastPlayingDate");
      v45 = 2114;
      v46 = v4;
      v47 = 2114;
      v48 = v14;
      v49 = 2048;
      v50 = v41;
      v31 = "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds";
      v32 = v21;
      v33 = 42;
      goto LABEL_28;
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v37 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  v22 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (!v11)
  {
    if (!v22)
      goto LABEL_21;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSinceDate:", v2);
    *(_DWORD *)buf = 138544130;
    v44 = CFSTR("NowPlayingRequest.localLastPlayingDate");
    v45 = 2114;
    v46 = v4;
    v47 = 2112;
    v48 = v19;
    v49 = 2048;
    v50 = v36;
    v25 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    goto LABEL_19;
  }
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "timeIntervalSinceDate:", v2);
    *(_DWORD *)buf = 138544386;
    v44 = CFSTR("NowPlayingRequest.localLastPlayingDate");
    v45 = 2114;
    v46 = v4;
    v47 = 2112;
    v48 = v19;
    v49 = 2114;
    v50 = v11;
    v51 = 2048;
    v52 = v24;
    v25 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
    v26 = v21;
    v27 = 52;
LABEL_20:
    _os_log_impl(&dword_193827000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);

  }
LABEL_21:

  v37 = v13;
LABEL_24:
  v38 = v37;

  return (NSDate *)v38;
}

+ (MRPlayerPath)localNowPlayingPlayerPath
{
  void *v2;
  MRPlayerPath *v3;
  void *v4;
  MRPlayerPath *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v17;

  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [MRPlayerPath alloc];
  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MRPlayerPath initWithOrigin:client:player:](v3, "initWithOrigin:client:player:", v4, 0, 0);

  objc_msgSend(v2, "activePlayerPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && (-[MRPlayerPath origin](v5, "origin"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "origin"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "isEqual:", v8),
        v8,
        v7,
        v9))
  {
    v10 = v6;
  }
  else
  {
    MRCreateXPCMessage(0x200000000000018uLL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MRAddPlayerPathToXPCMessage(v11, v5);
    objc_msgSend(v2, "service");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mrXPCConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v13, "sendSyncMessage:error:", v11, &v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v17;

    MRCreatePlayerPathFromXPCMessage(v14);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (MRPlayerPath *)v10;
}

+ (MSVPair)isMostRecentMediaPlaybackRelevantReason
{
  void *v3;
  void *v4;

  +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaRecentlyPlayedInterval");
  objc_msgSend(a1, "isMostRecentMediaPlaybackRelevantReasonWithinInternal:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (MSVPair *)v4;
}

+ (BOOL)isMostRecentMediaPlaybackRelevantWithinInterval:(double)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a1, "isMostRecentMediaPlaybackRelevantReasonWithinInternal:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "first");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

+ (id)isMostRecentMediaPlaybackRelevantReasonWithinInternal:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  __CFString *v29;
  void *v30;
  _BOOL4 v31;
  __CFString *v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  __CFString *v38;
  const char *v39;
  NSObject *v40;
  uint32_t v41;
  __CFString *v42;
  __CFString *v43;
  id v44;
  void *v45;
  void *v46;
  uint8_t buf[4];
  const __CFString *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  __CFString *v53;
  __int16 v54;
  __CFString *v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), CFSTR("NowPlayingRequest.isMostRecentMediaPlaybackRelevant"), v7);
  +[MROrigin localOrigin](MROrigin, "localOrigin");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[MROrigin localOrigin](MROrigin, "localOrigin");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString appendFormat:](v8, "appendFormat:", CFSTR(" for %@"), v10);

  }
  _MRLogForCategory(0xAuLL);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v49 = v8;
    _os_log_impl(&dword_193827000, v11, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  objc_msgSend(a1, "localNowPlayingPlayerPath");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[__CFString client](v12, "client");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v15 = 0;
    v16 = CFSTR("no now playing app");
    goto LABEL_19;
  }
  -[__CFString client](v12, "client");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isAirPlay"))
  {

  }
  else
  {
    objc_msgSend(a1, "localNowPlayingItem");
    v15 = objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v16 = CFSTR("no now playing item");
      goto LABEL_19;
    }
  }
  objc_msgSend(a1, "localLastPlayingDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceNow");
  v19 = v18;

  if (a3 > 0.0)
  {
    v20 = -v19;
    if (v20 > a3)
    {
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("no recent playback for %lf seconds"), *(_QWORD *)&v20);
      if (v21)
      {
        v16 = (__CFString *)v21;
        v15 = 0;
        goto LABEL_19;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      _MRLogForCategory(0xAuLL);
      v22 = objc_claimAutoreleasedReturnValue();
      v31 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      if (v30)
      {
        if (v12)
        {
          if (v31)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
            v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "timeIntervalSinceDate:", v5);
            *(_DWORD *)buf = 138544386;
            v49 = CFSTR("NowPlayingRequest.isMostRecentMediaPlaybackRelevant");
            v50 = 2114;
            v51 = v7;
            v52 = 2112;
            v53 = v32;
            v54 = 2114;
            v55 = v12;
            v56 = 2048;
            v57 = v34;
            v35 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
            v36 = v22;
            v37 = 52;
LABEL_34:
            _os_log_impl(&dword_193827000, v36, OS_LOG_TYPE_DEFAULT, v35, buf, v37);

LABEL_38:
          }
        }
        else if (v31)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
          v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "timeIntervalSinceDate:", v5);
          *(_DWORD *)buf = 138544130;
          v49 = CFSTR("NowPlayingRequest.isMostRecentMediaPlaybackRelevant");
          v50 = 2114;
          v51 = v7;
          v52 = 2112;
          v53 = v32;
          v54 = 2048;
          v55 = v42;
          v35 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
          v36 = v22;
          v37 = 42;
          goto LABEL_34;
        }
LABEL_39:
        v16 = 0;
        v15 = 0;
        goto LABEL_40;
      }
      if (v12)
      {
        if (!v31)
          goto LABEL_39;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[__CFString timeIntervalSinceDate:](v32, "timeIntervalSinceDate:", v5);
        *(_DWORD *)buf = 138544130;
        v49 = CFSTR("NowPlayingRequest.isMostRecentMediaPlaybackRelevant");
        v50 = 2114;
        v51 = v7;
        v52 = 2114;
        v53 = v12;
        v54 = 2048;
        v55 = v38;
        v39 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
        v40 = v22;
        v41 = 42;
      }
      else
      {
        if (!v31)
          goto LABEL_39;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[__CFString timeIntervalSinceDate:](v32, "timeIntervalSinceDate:", v5);
        *(_DWORD *)buf = 138543874;
        v49 = CFSTR("NowPlayingRequest.isMostRecentMediaPlaybackRelevant");
        v50 = 2114;
        v51 = v7;
        v52 = 2048;
        v53 = v43;
        v39 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v40 = v22;
        v41 = 32;
      }
      _os_log_impl(&dword_193827000, v40, OS_LOG_TYPE_DEFAULT, v39, buf, v41);
      goto LABEL_38;
    }
  }
  if (objc_msgSend(a1, "localIsPlaying"))
    v16 = CFSTR("local is playing");
  else
    v16 = CFSTR("local was playing recently");
  v15 = 1;
LABEL_19:
  _MRLogForCategory(0xAuLL);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
  if (v12)
  {
    if (v23)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "timeIntervalSinceDate:", v5);
      *(_DWORD *)buf = 138544386;
      v49 = CFSTR("NowPlayingRequest.isMostRecentMediaPlaybackRelevant");
      v50 = 2114;
      v51 = v7;
      v52 = 2114;
      v53 = v16;
      v54 = 2114;
      v55 = v12;
      v56 = 2048;
      v57 = v25;
      v26 = "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds";
      v27 = v22;
      v28 = 52;
LABEL_24:
      _os_log_error_impl(&dword_193827000, v27, OS_LOG_TYPE_ERROR, v26, buf, v28);

    }
  }
  else if (v23)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "timeIntervalSinceDate:", v5);
    *(_DWORD *)buf = 138544130;
    v49 = CFSTR("NowPlayingRequest.isMostRecentMediaPlaybackRelevant");
    v50 = 2114;
    v51 = v7;
    v52 = 2114;
    v53 = v16;
    v54 = 2048;
    v55 = v29;
    v26 = "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds";
    v27 = v22;
    v28 = 42;
    goto LABEL_24;
  }
LABEL_40:

  v44 = objc_alloc(MEMORY[0x1E0D4D0B8]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v44, "initWithFirst:second:", v45, v16);

  return v46;
}

- (MRDestination)destination
{
  return self->_destination;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destination, 0);
}

+ (void)shouldUseQuickControlsToDisplayPlatterForRouteIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __97__MRNowPlayingRequest_Siri__shouldUseQuickControlsToDisplayPlatterForRouteIdentifier_completion___block_invoke;
  v19[3] = &unk_1E30CC0A8;
  v9 = v5;
  v20 = v9;
  v21 = v7;
  v22 = v6;
  v10 = v6;
  v11 = v7;
  v12 = (void *)MEMORY[0x194036C44](v19);
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __97__MRNowPlayingRequest_Siri__shouldUseQuickControlsToDisplayPlatterForRouteIdentifier_completion___block_invoke_7;
  v16[3] = &unk_1E30CC0D0;
  v17 = v9;
  v18 = v12;
  v14 = v12;
  v15 = v9;
  objc_msgSend(v13, "resolveActiveSystemEndpointWithType:timeout:queue:completion:", 1, MEMORY[0x1E0C80D38], v16, 2.0);

}

uint64_t __97__MRNowPlayingRequest_Siri__shouldUseQuickControlsToDisplayPlatterForRouteIdentifier_completion___block_invoke(_QWORD *a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", a1[5]);
    v9 = 138543874;
    v10 = v5;
    v11 = 1024;
    v12 = a2;
    v13 = 2048;
    v14 = v7;
    _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingRequest] shouldUseQuickControlsToDisplayPlatterForRouteIdentifier: %{public}@ returned %{BOOL}u in %lf seconds.", (uint8_t *)&v9, 0x1Cu);

  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

uint64_t __97__MRNowPlayingRequest_Siri__shouldUseQuickControlsToDisplayPlatterForRouteIdentifier_completion___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("MRNowPlayingRequestLocalRouteIdentifier"));
  v6 = *(_QWORD *)(a1 + 40);
  if (v5)
    v7 = objc_msgSend(v4, "isLocalEndpoint");
  else
    v7 = objc_msgSend(v4, "containsOutputDeviceWithUID:", *(_QWORD *)(a1 + 32));
  v8 = v7;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 16))(v6, v8);
}

+ (void)homePlatterPreferredRouteIdentifier:(id)a3
{
  void *v3;
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = (void (**)(id, void *))a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeSystemEndpointOutputDeviceUIDForType:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[MRAVOutputDevice localDeviceUID](MRAVOutputDevice, "localDeviceUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {

    v7 = 0;
  }
  _MRLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v5);
    v13 = 138543618;
    v14 = v7;
    v15 = 2048;
    v16 = v12;
    _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingRequest] homePlatterPreferredRouteIdentifier returned %{public}@ in %lf seconds.", (uint8_t *)&v13, 0x16u);

  }
  v4[2](v4, v7);

}

- (void)suspendDisconnectionPauseForConfiguration:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "service");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "suspendDisconnectionPauseForConfiguration:queue:completion:", v9, v8, v7);
}

void __103__MRNowPlayingRequest_AudioFade__triggerAudioFadeOutForNowPlayingApplicationWithReplyQueue_completion___block_invoke_11_cold_1()
{
  void *v0;
  void *v1;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7(v1, v2);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_193827000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0();
}

void __64__MRNowPlayingRequest_requestLastPlayingDateOnQueue_completion___block_invoke_2_cold_1(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_193827000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0();
}

void __70__MRNowPlayingRequest_requestDeviceLastPlayingDateOnQueue_completion___block_invoke_cold_1(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1(&dword_193827000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0();
}

@end
