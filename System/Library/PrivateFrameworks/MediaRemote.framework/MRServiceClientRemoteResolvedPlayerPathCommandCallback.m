@implementation MRServiceClientRemoteResolvedPlayerPathCommandCallback

void ___MRServiceClientRemoteResolvedPlayerPathCommandCallback_block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  const __CFString *v28;
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
  v3 = a2;
  v4 = a1[4];
  _MRLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (!v4)
    {
      if (v6)
      {
        v19 = a1[5];
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceDate:", a1[6]);
        v27 = 138543874;
        v28 = CFSTR("playerCommand");
        v29 = 2114;
        v30 = v19;
        v31 = 2048;
        v32 = v20;
        v11 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
        v12 = v5;
        v13 = 32;
        goto LABEL_13;
      }
      goto LABEL_14;
    }
    if (!v6)
      goto LABEL_14;
    v15 = (void *)a1[4];
    v14 = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", a1[6]);
    v27 = 138544130;
    v28 = CFSTR("playerCommand");
    v29 = 2114;
    v30 = v14;
    v31 = 2114;
    v32 = v15;
    v33 = 2048;
    v34 = v16;
    v11 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_10:
    v12 = v5;
    v13 = 42;
    goto LABEL_13;
  }
  if (!v4)
  {
    if (!v6)
      goto LABEL_14;
    v17 = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", a1[6]);
    v27 = 138544130;
    v28 = CFSTR("playerCommand");
    v29 = 2114;
    v30 = v17;
    v31 = 2112;
    v32 = v3;
    v33 = 2048;
    v34 = v18;
    v11 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    goto LABEL_10;
  }
  if (v6)
  {
    v8 = a1[4];
    v7 = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", a1[6]);
    v27 = 138544386;
    v28 = CFSTR("playerCommand");
    v29 = 2114;
    v30 = v7;
    v31 = 2112;
    v32 = v3;
    v33 = 2114;
    v34 = v8;
    v35 = 2048;
    v36 = v10;
    v11 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
    v12 = v5;
    v13 = 52;
LABEL_13:
    _os_log_impl(&dword_193827000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v27, v13);

  }
LABEL_14:

  (*(void (**)(_QWORD, id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1[7] + 16))(a1[7], v3, v21, v22, v23, v24, v25, v26);
}

uint64_t ___MRServiceClientRemoteResolvedPlayerPathCommandCallback_block_invoke_53(_QWORD *a1)
{
  void *v3;
  void *v4;

  if (MSVDeviceOSIsInternalInstall())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MRServiceClientRemoteResolvedPlayerPathCommandCallback(MRMediaRemoteCommand, NSDictionary *__strong, MRPlayerPath *__strong, __strong MRMediaRemoteCommandHandlerCallback, void (^__strong)(NSArray<MRSendCommandResultStatus *> *__strong))_block_invoke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MRCommandServiceClient.m"), 237, CFSTR("Completion was not called for commandHandler=%@<%@>"), a1[4], a1[5]);

  }
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void ___MRServiceClientRemoteResolvedPlayerPathCommandCallback_block_invoke_2()
{
  NSObject *v0;

  _MRLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    ___MRServiceClientOriginCommandCallback_block_invoke_2_cold_1();

}

void ___MRServiceClientRemoteResolvedPlayerPathCommandCallback_block_invoke_56()
{
  NSObject *v0;
  NSObject *v1;

  _MRLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    ___MRServiceClientOriginCommandCallback_block_invoke_2_cold_1();

  _MRLogForCategory(0);
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
    ___MRServiceClientOriginCommandCallback_block_invoke_48_cold_1();

}

void ___MRServiceClientRemoteResolvedPlayerPathCommandCallback_block_invoke_57(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  os_signpost_id_t v4;
  NSObject *v5;
  uint64_t v6;
  os_signpost_id_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint8_t buf[16];

  _MRLogForCategory(2uLL);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "hash");
  if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193827000, v2, OS_SIGNPOST_INTERVAL_END, v4, "SendCommandPlayerMain", ", buf, 2u);
    }
  }

  _MRLogForCategory(2uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "hash");
  if ((unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_193827000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "SendCommandPlayer", ", buf, 2u);
    }
  }

  v8 = *(_QWORD *)(a1 + 72);
  v9 = *(unsigned int *)(a1 + 88);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = ___MRServiceClientRemoteResolvedPlayerPathCommandCallback_block_invoke_58;
  v11[3] = &unk_1E30CB110;
  v10 = *(_QWORD *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v14 = *(id *)(a1 + 64);
  v15 = *(id *)(a1 + 32);
  v16 = *(id *)(a1 + 80);
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(v8 + 16))(v8, v9, v10, v11);

}

void ___MRServiceClientRemoteResolvedPlayerPathCommandCallback_block_invoke_58(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  os_signpost_id_t v6;
  uint8_t v7[16];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  if (objc_msgSend(*(id *)(a1 + 48), "disarm"))
  {
    _MRLogForCategory(2uLL);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(*(id *)(a1 + 56), "hash");
    if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v6 = v5;
      if (os_signpost_enabled(v4))
      {
        *(_WORD *)v7 = 0;
        _os_signpost_emit_with_name_impl(&dword_193827000, v4, OS_SIGNPOST_INTERVAL_END, v6, "SendCommandPlayer", ", v7, 2u);
      }
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

@end
