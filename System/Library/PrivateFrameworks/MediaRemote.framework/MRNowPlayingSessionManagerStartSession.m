@implementation MRNowPlayingSessionManagerStartSession

void __MRNowPlayingSessionManagerStartSession_block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  MRPlayerPath *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  MRPlayerPath *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  const char *v37;
  NSObject *v38;
  uint32_t v39;
  _BOOL4 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BOOL4 v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  _QWORD block[4];
  MRPlayerPath *v61;
  id v62;
  uint8_t buf[4];
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  id v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v7, "origin");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = [MRPlayerPath alloc];
    objc_msgSend(v7, "origin");
    v12 = objc_claimAutoreleasedReturnValue();
    +[MRClient localClient](MRClient, "localClient");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[MRPlayer defaultPlayer](MRPlayer, "defaultPlayer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MRPlayerPath initWithOrigin:client:player:](v11, "initWithOrigin:client:player:", v12, v13, v14);

    v7 = (id)v12;
  }
  else
  {
    +[MRPlayerPath localPlayerPath](MRPlayerPath, "localPlayerPath");
    v15 = (MRPlayerPath *)objc_claimAutoreleasedReturnValue();
  }

  -[MRPlayerPath origin](v15, "origin");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isHosted");

  if (v17)
  {
    +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlayerPath origin](v15, "origin");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "routingContextID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "createCustomOriginClientForOrigin:routingContextID:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  MRMediaRemoteSetNowPlayingApplicationOverrideEnabled(1);
  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "currentSessionPlayerPath");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MRNowPlayingSessionManagerStartSession(__strong dispatch_queue_t, void (^__strong)(MRPlayerPath *__strong))_block_invoke");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInFunction:file:lineNumber:description:", v59, CFSTR("MRNowPlayingSessionManagerDataSource.m"), 61, CFSTR("Unbalanced calls to start/stop session: currentSessionPlayerPath should be nil when starting"));

  }
  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCurrentSessionPlayerPath:", v15);

  v25 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v8, "routingContextID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v25, "initWithFormat:", CFSTR("playerPath=%@ routingContext=%@"), v15, v26);

  v28 = a1[4];
  _MRLogForCategory(0xAuLL);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (!v9 && v27)
  {
    v31 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    if (v28)
    {
      if (!v31)
        goto LABEL_29;
      v33 = a1[5];
      v32 = a1[6];
      v34 = a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "timeIntervalSinceDate:", a1[7]);
      *(_DWORD *)buf = 138544386;
      v64 = v33;
      v65 = 2114;
      v66 = v32;
      v67 = 2112;
      v68 = v27;
      v69 = 2114;
      v70 = v34;
      v71 = 2048;
      v72 = v36;
      v37 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v38 = v30;
      v39 = 52;
      goto LABEL_23;
    }
    if (!v31)
      goto LABEL_29;
    v50 = a1[5];
    v51 = a1[6];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "timeIntervalSinceDate:", a1[7]);
    *(_DWORD *)buf = 138544130;
    v64 = v50;
    v65 = 2114;
    v66 = v51;
    v67 = 2112;
    v68 = v27;
    v69 = 2048;
    v70 = v52;
    v37 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    goto LABEL_22;
  }
  if (v9)
  {
    v40 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v28)
    {
      if (!v40)
        goto LABEL_29;
      v42 = a1[5];
      v41 = a1[6];
      v43 = a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "timeIntervalSinceDate:", a1[7]);
      *(_DWORD *)buf = 138544386;
      v64 = v42;
      v65 = 2114;
      v66 = v41;
      v67 = 2114;
      v68 = v9;
      v69 = 2114;
      v70 = v43;
      v71 = 2048;
      v72 = v44;
      _os_log_error_impl(&dword_193827000, v30, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
      goto LABEL_24;
    }
    if (v40)
      __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke_cold_1(a1, (uint64_t)v9, v30);
  }
  else
  {
    v45 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
    if (v28)
    {
      if (!v45)
        goto LABEL_29;
      v47 = a1[5];
      v46 = a1[6];
      v48 = (void *)a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "timeIntervalSinceDate:", a1[7]);
      *(_DWORD *)buf = 138544130;
      v64 = v47;
      v65 = 2114;
      v66 = v46;
      v67 = 2114;
      v68 = v48;
      v69 = 2048;
      v70 = v49;
      v37 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_22:
      v38 = v30;
      v39 = 42;
LABEL_23:
      _os_log_impl(&dword_193827000, v38, OS_LOG_TYPE_DEFAULT, v37, buf, v39);
LABEL_24:

      goto LABEL_29;
    }
    if (v45)
    {
      v53 = a1[5];
      v54 = a1[6];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "timeIntervalSinceDate:", a1[7]);
      *(_DWORD *)buf = 138543874;
      v64 = v53;
      v65 = 2114;
      v66 = v54;
      v67 = 2048;
      v68 = v55;
      v37 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v38 = v30;
      v39 = 32;
      goto LABEL_23;
    }
  }
LABEL_29:

  v56 = (void *)a1[9];
  if (v56)
  {
    v57 = a1[8];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __MRNowPlayingSessionManagerStartSession_block_invoke_33;
    block[3] = &unk_1E30C6568;
    v62 = v56;
    v61 = v15;
    dispatch_async(v57, block);

  }
}

uint64_t __MRNowPlayingSessionManagerStartSession_block_invoke_33(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __MRNowPlayingSessionManagerStartSession_block_invoke_2()
{
  id v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (id)objc_msgSend(v1, "addObserverForName:object:queue:usingBlock:", CFSTR("_MRMediaRemoteWillSendCommandToPlayerNotification"), 0, 0, &__block_literal_global_38);

}

void __MRNowPlayingSessionManagerStartSession_block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentSessionPlayerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v2, "playerPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "client");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E31435A0, &unk_1E31435B8, &unk_1E31435D0, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionCommandType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "containsObject:", v11))
      {
        v12 = objc_msgSend(v11, "intValue");
        objc_msgSend(v2, "userInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        MRMediaRemoteCommandCreateDescription(v12, v13, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        MRLogCategoryConnections();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v2, "playerPath");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "client");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v20 = v14;
          v21 = 2114;
          v22 = v17;
          _os_log_impl(&dword_193827000, v15, OS_LOG_TYPE_DEFAULT, "[MRNowPlayingSessionManagerDataSource] [MRNowPlayingSessionManager] Got command preview that will cause a hijack (%{public}@) playerPath %{public}@. Posting MRNowPlayingSessionManagerActiveSessionWillBeHijackedByNativePlayback", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "postNotificationName:object:", CFSTR("MRNowPlayingSessionManagerActiveSessionWillBeHijackedByNativePlayback"), 0);

      }
    }
  }

}

void __MRNowPlayingSessionManagerStartSession_block_invoke_43(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
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
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "code") == 1)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("xpc error, likely mediaremoted crash, so retrying.."));
    _MRLogForCategory(0xAuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v21 = v9;
      v22 = 2114;
      v23 = v10;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
    }

    +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "service");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mrXPCConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 48);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __MRNowPlayingSessionManagerStartSession_block_invoke_46;
    v16[3] = &unk_1E30CA7A8;
    v17 = v5;
    v19 = *(id *)(a1 + 56);
    v18 = v6;
    objc_msgSend(v13, "sendMessageWithType:queue:reply:", 0x300000000000023, v14, v16);

  }
  else
  {
    MRCreatePlayerPathFromXPCMessage(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    MRCreateDeviceInfoFromXPCMessage(v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

void __MRNowPlayingSessionManagerStartSession_block_invoke_46(uint64_t a1)
{
  void *v2;
  id v3;

  MRCreatePlayerPathFromXPCMessage(*(void **)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  MRCreateDeviceInfoFromXPCMessage(*(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
