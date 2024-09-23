@implementation MRMediaRemotePlaybackSessionMigrateForDevice

void __MRMediaRemotePlaybackSessionMigrateForDevice_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  __int128 v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *(void **)(a1 + 32);
  if (v5)
  {
    v21[0] = CFSTR("MREndpointConnectionCorrelationIDUserInfoKey");
    v21[1] = CFSTR("MRExternalDeviceConnectionReasonUserInfoKey");
    v9 = *(_QWORD *)(a1 + 48);
    v22[0] = *(_QWORD *)(a1 + 40);
    v22[1] = v9;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = v8;
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __MRMediaRemotePlaybackSessionMigrateForDevice_block_invoke_2;
    v17[3] = &unk_1E30C95C0;
    v20 = *(_OWORD *)(a1 + 64);
    v18 = v5;
    v19 = *(id *)(a1 + 56);
    objc_msgSend(v18, "connectToExternalDeviceWithUserInfo:completion:", v12, v17);

  }
  else
  {
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v14 = v6;
    v15 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v14;
    v16 = v8;

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }

}

void __MRMediaRemotePlaybackSessionMigrateForDevice_block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  if (!v4)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __MRMediaRemotePlaybackSessionMigrateForDevice_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *(void **)(a1 + 32);
  if (v5)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = v5;
    v11 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
    v12 = v8;

    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __MRMediaRemotePlaybackSessionMigrateForDevice_block_invoke_4;
    v21[3] = &unk_1E30C5F68;
    v22 = *(id *)(a1 + 40);
    objc_msgSend(v10, "outputDevicesMatchingPredicate:", v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
  else
  {
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v18 = v6;
    v19 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v18;
    v20 = v8;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __MRMediaRemotePlaybackSessionMigrateForDevice_block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsUID:", *(_QWORD *)(a1 + 32));
}

void __MRMediaRemotePlaybackSessionMigrateForDevice_block_invoke_5(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  int v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __MRMediaRemotePlaybackSessionMigrateForDevice_block_invoke_6;
  v6[3] = &unk_1E30C9638;
  v12 = *(_OWORD *)(a1 + 80);
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 72);
  v2 = (void (**)(_QWORD, _QWORD))MEMORY[0x194036C44](v6);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
    goto LABEL_7;
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "isLocalEndpoint");
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  if (!v3)
  {
    if (v4)
    {
      v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
      if (v5)
      {
        objc_msgSend(v4, "migrateToOutputDevice:request:initiator:queue:completion:", v5, *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 64), v2);
        goto LABEL_8;
      }
    }
LABEL_7:
    v2[2](v2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40));
    goto LABEL_8;
  }
  objc_msgSend(v4, "migrateToEndpoint:request:queue:completion:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v2);
LABEL_8:

}

void __MRMediaRemotePlaybackSessionMigrateForDevice_block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "debugName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "debugName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("source=%@ destination=%@"), v5, v6);

  _MRLogForCategory(0xAuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v3)
  {
    v15 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v15)
        goto LABEL_14;
      v16 = *(void **)(a1 + 32);
      v17 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138544130;
      v29 = v16;
      v30 = 2114;
      v31 = v17;
      v32 = 2114;
      v33 = v7;
      v34 = 2048;
      v35 = v18;
      v19 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v20 = v9;
      v21 = 42;
    }
    else
    {
      if (!v15)
        goto LABEL_14;
      v22 = *(void **)(a1 + 32);
      v23 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      *(_DWORD *)buf = 138543874;
      v29 = v22;
      v30 = 2114;
      v31 = v23;
      v32 = 2048;
      v33 = v24;
      v19 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v20 = v9;
      v21 = 32;
    }
    _os_log_impl(&dword_193827000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    goto LABEL_13;
  }
  v10 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
  if (v7)
  {
    if (!v10)
      goto LABEL_14;
    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    *(_DWORD *)buf = 138544386;
    v29 = v11;
    v30 = 2114;
    v31 = v12;
    v32 = 2114;
    v33 = v3;
    v34 = 2114;
    v35 = v7;
    v36 = 2048;
    v37 = v14;
    _os_log_error_impl(&dword_193827000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_13:

    goto LABEL_14;
  }
  if (v10)
    __MRMediaRemotePlaybackSessionMigrateForDevice_block_invoke_6_cold_1();
LABEL_14:

  objc_msgSend(*(id *)(a1 + 56), "finalize");
  MRLogCategoryMigrationOversize();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 56), "report");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v29 = v26;
    _os_log_impl(&dword_193827000, v25, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

  }
  v27 = *(_QWORD *)(a1 + 64);
  if (v27)
    (*(void (**)(uint64_t, id))(v27 + 16))(v27, v3);

}

void __MRMediaRemotePlaybackSessionMigrateForDevice_block_invoke_6_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_4();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "timeIntervalSinceDate:", *(_QWORD *)(v0 + 48));
  OUTLINED_FUNCTION_1(&dword_193827000, v2, v3, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0();
}

@end
