@implementation MRMediaRemoteNowPlayingResolvePlayerPathWithID

void __MRMediaRemoteNowPlayingResolvePlayerPathWithID_block_invoke(uint64_t a1, void *a2, void *a3)
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
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  id v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 72))
  {
    v7 = *(_QWORD *)(a1 + 32);
    _MRLogForCategory(0xAuLL);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v5 || v6)
    {
      if (v6)
      {
        v19 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
        if (!v7)
        {
          if (v19)
            __94__MRAVDiscoverySessionHelper_searchAVOutputDeviceForUID_timeout_identifier_reason_completion___block_invoke_cold_1((_QWORD *)a1, (uint64_t)v6, v9);
          goto LABEL_23;
        }
        if (v19)
        {
          v21 = *(_QWORD *)(a1 + 40);
          v20 = *(_QWORD *)(a1 + 48);
          v22 = *(_QWORD *)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
          *(_DWORD *)buf = 138544386;
          v42 = v21;
          v43 = 2114;
          v44 = v20;
          v45 = 2114;
          v46 = v6;
          v47 = 2114;
          v48 = v22;
          v49 = 2048;
          v50 = v23;
          _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_18:

          goto LABEL_23;
        }
        goto LABEL_23;
      }
      v24 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (!v7)
      {
        if (!v24)
          goto LABEL_23;
        v32 = *(_QWORD *)(a1 + 40);
        v33 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 138543874;
        v42 = v32;
        v43 = 2114;
        v44 = v33;
        v45 = 2048;
        v46 = v34;
        v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v17 = v9;
        v18 = 32;
        goto LABEL_17;
      }
      if (!v24)
      {
LABEL_23:

        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __MRMediaRemoteNowPlayingResolvePlayerPathWithID_block_invoke_62;
        v37[3] = &unk_1E30C6658;
        v35 = *(NSObject **)(a1 + 64);
        v40 = *(id *)(a1 + 72);
        v38 = v5;
        v39 = v6;
        MRCreateDonatedQosBlock(v37);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_async(v35, v36);

        goto LABEL_24;
      }
      v26 = *(_QWORD *)(a1 + 40);
      v25 = *(_QWORD *)(a1 + 48);
      v27 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544130;
      v42 = v26;
      v43 = 2114;
      v44 = v25;
      v45 = 2114;
      v46 = v27;
      v47 = 2048;
      v48 = v28;
      v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    }
    else
    {
      v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v10)
        {
          v12 = *(_QWORD *)(a1 + 40);
          v11 = *(_QWORD *)(a1 + 48);
          v13 = *(_QWORD *)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
          *(_DWORD *)buf = 138544386;
          v42 = v12;
          v43 = 2114;
          v44 = v11;
          v45 = 2112;
          v46 = v5;
          v47 = 2114;
          v48 = v13;
          v49 = 2048;
          v50 = v15;
          v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
          v17 = v9;
          v18 = 52;
LABEL_17:
          _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
          goto LABEL_18;
        }
        goto LABEL_23;
      }
      if (!v10)
        goto LABEL_23;
      v29 = *(_QWORD *)(a1 + 40);
      v30 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544130;
      v42 = v29;
      v43 = 2114;
      v44 = v30;
      v45 = 2112;
      v46 = v5;
      v47 = 2048;
      v48 = v31;
      v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    }
    v17 = v9;
    v18 = 42;
    goto LABEL_17;
  }
LABEL_24:

}

void __MRMediaRemoteNowPlayingResolvePlayerPathWithID_block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "origin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isLocal");

  if ((v8 & 1) == 0)
    goto LABEL_8;
  if (!*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "client");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

      goto LABEL_6;
    }
    objc_msgSend(v5, "client");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      goto LABEL_6;
LABEL_8:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_14;
  }
LABEL_6:
  v13 = (void *)MRMediaRemoteCopyLocalDeviceAirPlayReceiverBundleID();
  objc_msgSend(v5, "client");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", v13);

  if (v16)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    +[MRAVClusterController sharedController](MRAVClusterController, "sharedController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "needsCommandRedirection") & 1) != 0)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __MRMediaRemoteNowPlayingResolvePlayerPathWithID_block_invoke_7;
      v18[3] = &unk_1E30CD5B0;
      v19 = *(id *)(a1 + 40);
      v20 = *(id *)(a1 + 48);
      v22 = *(id *)(a1 + 56);
      v21 = *(id *)(a1 + 32);
      v23 = *(id *)(a1 + 64);
      objc_msgSend(v17, "getClusterLeaderEndpoint:", v18);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
LABEL_14:

}

void __MRMediaRemoteNowPlayingResolvePlayerPathWithID_block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a3;
  v6 = (void *)objc_msgSend(a2, "copy");
  objc_msgSend(v6, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasPlaceholder");

  if (v8)
  {
    objc_msgSend(v6, "origin");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __MRMediaRemoteNowPlayingResolvePlayerPathWithID_block_invoke_5;
    v11[3] = &unk_1E30CD538;
    v12 = v6;
    v13 = *(id *)(a1 + 40);
    v14 = v5;
    +[MRDeviceInfoRequest deviceInfoForOrigin:queue:completion:](MRDeviceInfoRequest, "deviceInfoForOrigin:queue:completion:", v9, v10, v11);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __MRMediaRemoteNowPlayingResolvePlayerPathWithID_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  void (**v27)(id, void *, _QWORD);

  v4 = a3;
  v5 = (void *)objc_msgSend(a2, "copy");
  if (objc_msgSend(v5, "isResolved"))
  {
    v4[2](v4, v5, 0);
  }
  else
  {
    +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activePlayerPath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_11;
    objc_msgSend(v5, "origin");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_msgSend(v5, "origin");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "origin");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_11;
    }
    objc_msgSend(v5, "client");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v5, "client");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "client");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "isEqual:", v16);

      if (!v17)
        goto LABEL_11;
    }
    objc_msgSend(v5, "player");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_10;
    v19 = (void *)v18;
    objc_msgSend(v5, "player");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "player");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (v22)
    {
LABEL_10:
      v4[2](v4, v7, 0);
    }
    else
    {
LABEL_11:
      v23 = (void *)MRGetSharedService();
      +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "workerQueue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __MRMediaRemoteNowPlayingResolvePlayerPathWithID_block_invoke_3;
      v26[3] = &unk_1E30C7B60;
      v27 = v4;
      MRMediaRemoteServiceResolvePlayerPath(v23, (uint64_t)v5, v25, v26);

    }
  }

}

uint64_t __MRMediaRemoteNowPlayingResolvePlayerPathWithID_block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __MRMediaRemoteNowPlayingResolvePlayerPathWithID_block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resolvePlaceholdersForDeviceInfo:", v4);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __MRMediaRemoteNowPlayingResolvePlayerPathWithID_block_invoke_62(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __MRMediaRemoteNowPlayingResolvePlayerPathWithID_block_invoke_7(id *a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void (**v10)(id, _QWORD, void *);
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[2];
  _QWORD v19[2];
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Redirecting to cluster leader: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MRLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    v7 = a1[5];
    *(_DWORD *)buf = 138543874;
    v21 = v6;
    v22 = 2114;
    v23 = v7;
    v24 = 2112;
    v25 = v4;
    _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  if (v3)
  {
    v8 = a1[5];
    v18[0] = CFSTR("MREndpointConnectionCorrelationIDUserInfoKey");
    v18[1] = CFSTR("MREndpointConnectionReasonUserInfoKey");
    v19[0] = v8;
    v19[1] = CFSTR("clusterLeaderRedirection");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __MRMediaRemoteNowPlayingResolvePlayerPathWithID_block_invoke_74;
    v11[3] = &unk_1E30CD588;
    v16 = a1[7];
    v12 = v3;
    v13 = a1[4];
    v14 = a1[5];
    v15 = a1[6];
    v17 = a1[8];
    objc_msgSend(v12, "connectToExternalDeviceWithUserInfo:completion:", v9, v11);

  }
  else
  {
    v10 = (void (**)(id, _QWORD, void *))a1[7];
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 48, CFSTR("Could not resolve playerPath for clusterLeaderRedirection"));
    v10[2](v10, 0, v9);
  }

}

void __MRMediaRemoteNowPlayingResolvePlayerPathWithID_block_invoke_74(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0, a2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "origin");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("Connect to origin: %@, endpoint: %@"), v3, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      _MRLogForCategory(0xAuLL);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 40);
        v9 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138543874;
        v13 = v8;
        v14 = 2114;
        v15 = v9;
        v16 = 2112;
        v17 = v6;
        _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
      }

      objc_msgSend(*(id *)(a1 + 56), "playerPathByRedirectingToOrigin:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

    }
    else
    {
      v11 = *(_QWORD *)(a1 + 64);
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:description:", 117, CFSTR("Connected to endpoint but endpoint disconnected shortly after (could not get origin)"));
      (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v6);
    }

  }
}

@end
