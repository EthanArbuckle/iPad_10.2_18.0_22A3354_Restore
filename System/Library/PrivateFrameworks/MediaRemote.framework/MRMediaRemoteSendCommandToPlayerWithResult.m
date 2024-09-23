@implementation MRMediaRemoteSendCommandToPlayerWithResult

void ___MRMediaRemoteSendCommandToPlayerWithResult_block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  +[MRCommandResult commandResultWithSendError:](MRCommandResult, "commandResultWithSendError:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void ___MRMediaRemoteSendCommandToPlayerWithResult_block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD);
  MRCommandResult *v9;
  MRCommandResult *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  int v22;
  int v23;

  v5 = a2;
  v6 = a3;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = ___MRMediaRemoteSendCommandToPlayerWithResult_block_invoke_2;
  v14 = &unk_1E30CA970;
  v22 = *(_DWORD *)(a1 + 88);
  v7 = v5;
  v15 = v7;
  v23 = *(_DWORD *)(a1 + 92);
  v16 = *(id *)(a1 + 32);
  v17 = *(id *)(a1 + 40);
  v18 = *(id *)(a1 + 48);
  v21 = *(id *)(a1 + 80);
  v19 = *(id *)(a1 + 56);
  v20 = *(id *)(a1 + 64);
  v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x194036C44](&v11);
  if (v6)
  {
    v9 = [MRCommandResult alloc];
    v10 = -[MRCommandResult initWithError:](v9, "initWithError:", v6, v11, v12, v13, v14, v15, v16, v17, v18, v19);
    ((void (**)(_QWORD, MRCommandResult *))v8)[2](v8, v10);

  }
  else
  {
    _MRMediaRemoteSendCommandToPlayer(*(unsigned int *)(a1 + 92), *(void **)(a1 + 32), *(void **)(a1 + 48), v7, *(void **)(a1 + 72), v8);
  }

}

void ___MRMediaRemoteSendCommandToPlayerWithResult_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  os_signpost_id_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  __CFString *v47;
  __CFString *v48;
  __CFString *v49;
  __CFString *v50;
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  __CFString *v56;
  void *v57;
  uint64_t v58;
  char v59;
  char v60;
  int v61;
  _QWORD block[4];
  id v63;
  id v64;
  _BYTE buf[24];
  void *v66;
  _BYTE v67[24];
  __CFString *v68;
  int v69;
  char v70;
  char v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = qos_class_self();
  objc_msgSend(v3, "setStartQOS:", *(unsigned int *)(a1 + 88));
  objc_msgSend(v3, "setEndQOS:", v4);
  objc_msgSend(v3, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    objc_msgSend(v3, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v3, "playerPath");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {

      }
      else if (!*(_QWORD *)(a1 + 32))
      {
        _MRLogForCategory(0xAuLL);
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          goto LABEL_27;
        MRMediaRemoteCommandCreateDescription(*(unsigned int *)(a1 + 92), *(void **)(a1 + 40), 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "debugDescription");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        *(_DWORD *)buf = 138544130;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = 0;
        *(_WORD *)&buf[22] = 2112;
        v66 = v12;
        *(_WORD *)v67 = 2048;
        *(_QWORD *)&v67[2] = v58;
        v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_19:
        _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, v16, buf, 0x2Au);
LABEL_25:

        goto LABEL_26;
      }
      _MRLogForCategory(0xAuLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      MRMediaRemoteCommandCreateDescription(*(unsigned int *)(a1 + 92), *(void **)(a1 + 40), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "debugDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "playerPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v14;
      if (!v14)
        v17 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2112;
      v66 = v12;
      *(_WORD *)v67 = 2114;
      *(_QWORD *)&v67[2] = v17;
      *(_WORD *)&v67[10] = 2048;
      *(_QWORD *)&v67[12] = v19;
      _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds", buf, 0x34u);

      goto LABEL_25;
    }
  }
  objc_msgSend(v3, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "playerPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (v7)
    {

    }
    else if (!*(_QWORD *)(a1 + 32))
    {
      _MRLogForCategory(0xAuLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      MRMediaRemoteCommandCreateDescription(*(unsigned int *)(a1 + 92), *(void **)(a1 + 40), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = 0;
      *(_WORD *)&buf[22] = 2048;
      v66 = v57;
      _os_log_impl(&dword_193827000, v10, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", buf, 0x20u);
LABEL_26:

      goto LABEL_27;
    }
    _MRLogForCategory(0xAuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    MRMediaRemoteCommandCreateDescription(*(unsigned int *)(a1 + 92), *(void **)(a1 + 40), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "playerPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12)
      v13 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = 0;
    *(_WORD *)&buf[22] = 2114;
    v66 = v13;
    *(_WORD *)v67 = 2048;
    *(_QWORD *)&v67[2] = v15;
    v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_19;
  }
  if (v7)
  {

    goto LABEL_12;
  }
  if (*(_QWORD *)(a1 + 32))
  {
LABEL_12:
    _MRLogForCategory(0xAuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      ___MRMediaRemoteSendCommandToPlayerWithResult_block_invoke_2_cold_2(a1, v3, v10);
    goto LABEL_27;
  }
  _MRLogForCategory(0xAuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    ___MRMediaRemoteSendCommandToPlayerWithResult_block_invoke_2_cold_1(a1, v3, v10);
LABEL_27:

  if (*(_DWORD *)(a1 + 92) == 122)
  {
    _MRLogForCategory(2uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceNow");
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = -v21;
      _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, "[MRSendCommand] WHAPRO: SetPlaybackQueue took %f seconds", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionHomeKitUserIdentifier"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22 && !objc_msgSend(v3, "sendError"))
    {
      v23 = (void *)MRGetSharedService();
      MRMediaRemoteServiceSetNearbyDevicesToRemoteControl(v23, v22);
    }

  }
  if (objc_msgSend(v3, "sendError") == 6)
  {
    objc_msgSend(*(id *)(a1 + 56), "origin");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      +[MRMediaRemoteServiceClient sharedServiceClient](MRMediaRemoteServiceClient, "sharedServiceClient");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "origin");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "processPlayerPathInvalidationHandlersWithInvalidOrigin:", v26);

    }
  }
  _MRLogForCategory(2uLL);
  v27 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionCommandID"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "hash");

  if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_193827000, v27, OS_SIGNPOST_INTERVAL_END, v29, "SendCommandWithResult", ", buf, 2u);
  }

  v30 = *(void **)(a1 + 80);
  v31 = MEMORY[0x1E0C809B0];
  if (v30)
  {
    v32 = *(NSObject **)(a1 + 64);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___MRMediaRemoteSendCommandToPlayerWithResult_block_invoke_22;
    block[3] = &unk_1E30C6568;
    v64 = v30;
    v63 = v3;
    dispatch_async(v32, block);

  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionIsRedirectingCommand"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "BOOLValue");

  if ((v34 & 1) == 0)
  {
    v35 = *(void **)(a1 + 72);
    v36 = *(void **)(a1 + 32);
    objc_msgSend(v3, "handlerReturnStatuses");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v3, "sendError");
    v38 = *(void **)(a1 + 48);
    v39 = v35;
    v40 = v37;
    v41 = v38;
    v42 = v36;
    objc_msgSend(v42, "origin");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v42, "isLocal");

    v59 = objc_msgSend(v43, "isLocal");
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "bundleIdentifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v40, "count"))
    {
      if ((objc_msgSend(v40, "containsObject:", &unk_1E31435E8) & 1) != 0)
      {
        v46 = 0;
      }
      else
      {
        objc_msgSend(v40, "mr_first:", &__block_literal_global_53);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v48 = (__CFString *)MRMediaRemoteCopyCommandHandlerStatusDescription(objc_msgSend(v46, "intValue"));
      v49 = v48;
      if (v48)
      {
        v50 = v48;
      }
      else
      {
        objc_msgSend(v46, "description");
        v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v47 = v50;

    }
    else
    {
      v47 = 0;
    }
    v51 = v31;
    dispatch_get_global_queue(-2, 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v51;
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __trackAnalyticsSendCommand_block_invoke_2;
    v66 = &unk_1E30CAA58;
    *(_QWORD *)v67 = v41;
    *(_QWORD *)&v67[8] = v45;
    v70 = v59;
    v71 = v60;
    *(_QWORD *)&v67[16] = v39;
    v68 = v47;
    v69 = v61;
    v53 = v41;
    v54 = v45;
    v55 = v39;
    v56 = v47;
    +[MRDeviceInfoRequest deviceInfoForOrigin:queue:completion:](MRDeviceInfoRequest, "deviceInfoForOrigin:queue:completion:", v43, v52, buf);

  }
}

uint64_t ___MRMediaRemoteSendCommandToPlayerWithResult_block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void ___MRMediaRemoteSendCommandToPlayerWithResult_block_invoke_2_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  MRMediaRemoteCommandCreateDescription(*(unsigned int *)(a1 + 92), *(void **)(a1 + 40), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
  v10 = 138544130;
  v11 = v6;
  OUTLINED_FUNCTION_0_8();
  v12 = 2048;
  v13 = v9;
  _os_log_error_impl(&dword_193827000, a3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", (uint8_t *)&v10, 0x2Au);

}

void ___MRMediaRemoteSendCommandToPlayerWithResult_block_invoke_2_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  MRMediaRemoteCommandCreateDescription(*(unsigned int *)(a1 + 92), *(void **)(a1 + 40), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "playerPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v9 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
  v13 = 138544386;
  v14 = v6;
  OUTLINED_FUNCTION_0_8();
  v15 = v11;
  v16 = v9;
  v17 = 2048;
  v18 = v12;
  _os_log_error_impl(&dword_193827000, a3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v13, 0x34u);

}

@end
