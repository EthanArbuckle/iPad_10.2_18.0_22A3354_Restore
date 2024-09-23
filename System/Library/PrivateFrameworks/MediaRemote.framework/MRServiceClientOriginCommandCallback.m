@implementation MRServiceClientOriginCommandCallback

void ___MRServiceClientOriginCommandCallback_block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  const __CFString *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");

  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = a1[4];
  _MRLogForCategory(0xAuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v4)
  {
    v14 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (!v14)
        goto LABEL_14;
      v16 = (void *)a1[4];
      v15 = a1[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", a1[6]);
      v23 = 138544130;
      v24 = CFSTR("originCommand");
      v25 = 2114;
      v26 = v15;
      v27 = 2114;
      v28 = v16;
      v29 = 2048;
      v30 = v17;
      v18 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v19 = v7;
      v20 = 42;
    }
    else
    {
      if (!v14)
        goto LABEL_14;
      v21 = a1[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", a1[6]);
      v23 = 138543874;
      v24 = CFSTR("originCommand");
      v25 = 2114;
      v26 = v21;
      v27 = 2048;
      v28 = v22;
      v18 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v19 = v7;
      v20 = 32;
    }
    _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v23, v20);
    goto LABEL_13;
  }
  v8 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5)
  {
    if (v8)
    {
      v9 = a1[5];
      objc_msgSend(v3, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = a1[4];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", a1[6]);
      v23 = 138544386;
      v24 = CFSTR("originCommand");
      v25 = 2114;
      v26 = v9;
      v27 = 2114;
      v28 = v10;
      v29 = 2114;
      v30 = v11;
      v31 = 2048;
      v32 = v13;
      _os_log_error_impl(&dword_193827000, v7, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v23, 0x34u);

LABEL_13:
    }
  }
  else if (v8)
  {
    ___MRServiceClientOriginCommandCallback_block_invoke_cold_1((uint64_t)a1, v3, v7);
  }
LABEL_14:

  (*(void (**)(void))(a1[7] + 16))();
}

void ___MRServiceClientOriginCommandCallback_block_invoke_40(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  if (MSVDeviceOSIsInternalInstall())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _MRServiceClientOriginCommandCallback(MRPlayerPath *__strong, MRMediaRemoteCommand, NSDictionary *__strong, __strong MRMediaRemotePlayerPathCommandHandlerCallback, void (^__strong)(MRCommandResult *__strong))_block_invoke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MRCommandServiceClient.m"), 196, CFSTR("Completion was not called for originCommandHandler=%@<%@>"), a1[4], a1[5]);

  }
  v2 = a1[6];
  +[MRCommandResult commandResultWithSendError:](MRCommandResult, "commandResultWithSendError:", 8);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v5);

}

void ___MRServiceClientOriginCommandCallback_block_invoke_2()
{
  NSObject *v0;

  _MRLogForCategory(0);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    ___MRServiceClientOriginCommandCallback_block_invoke_2_cold_1();

}

void ___MRServiceClientOriginCommandCallback_block_invoke_48()
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

void ___MRServiceClientOriginCommandCallback_block_invoke_49(uint64_t a1, void *a2)
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
        _os_signpost_emit_with_name_impl(&dword_193827000, v4, OS_SIGNPOST_INTERVAL_END, v6, "SendCommandOrigin", ", v7, 2u);
      }
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void ___MRServiceClientOriginCommandCallback_block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
  v9 = 138544130;
  v10 = CFSTR("originCommand");
  v11 = 2114;
  v12 = v5;
  v13 = 2114;
  v14 = v6;
  v15 = 2048;
  v16 = v8;
  _os_log_error_impl(&dword_193827000, a3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", (uint8_t *)&v9, 0x2Au);

}

void ___MRServiceClientOriginCommandCallback_block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_1_6(&dword_193827000, v0, v1, "It has been more than <%lf> seconds since commandHandler=%@<%@> was called and still waiting for completion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_4();
}

void ___MRServiceClientOriginCommandCallback_block_invoke_48_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_4_4(&dword_193827000, v0, v1, "It has been more than <%lf> seconds since commandHandler=%@<%@> was called and still waiting for completion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_4();
}

@end
