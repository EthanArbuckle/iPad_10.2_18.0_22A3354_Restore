@implementation MRMediaRemoteGetPickedRoutedVolumeControlCapabilities

uint64_t __MRMediaRemoteGetPickedRoutedVolumeControlCapabilities_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, a3);
}

void __MRMediaRemoteGetPickedRoutedVolumeControlCapabilities_block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  _QWORD v35[4];
  id v36;
  int v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v9 = (void *)MRMediaRemotePickedRouteVolumeControlCapabilitiesCopyDescription(a3);
  _MRLogForCategory(0xAuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v8 && v9)
  {
    v12 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v12)
      {
        v13 = *(_QWORD *)(a1 + 32);
        v14 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        *(_DWORD *)buf = 138544386;
        v39 = v13;
        v40 = 2114;
        v41 = v14;
        v42 = 2112;
        v43 = v9;
        v44 = 2114;
        v45 = v7;
        v46 = 2048;
        v47 = v16;
        v17 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
        v18 = v11;
        v19 = 52;
LABEL_16:
        _os_log_impl(&dword_193827000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
        goto LABEL_17;
      }
      goto LABEL_22;
    }
    if (!v12)
      goto LABEL_22;
    v28 = *(_QWORD *)(a1 + 32);
    v29 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    *(_DWORD *)buf = 138544130;
    v39 = v28;
    v40 = 2114;
    v41 = v29;
    v42 = 2112;
    v43 = v9;
    v44 = 2048;
    v45 = v30;
    v17 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_15:
    v18 = v11;
    v19 = 42;
    goto LABEL_16;
  }
  if (v8)
  {
    v20 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v20)
      {
        v21 = *(_QWORD *)(a1 + 32);
        v22 = *(_QWORD *)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
        *(_DWORD *)buf = 138544386;
        v39 = v21;
        v40 = 2114;
        v41 = v22;
        v42 = 2114;
        v43 = v8;
        v44 = 2114;
        v45 = v7;
        v46 = 2048;
        v47 = v23;
        _os_log_error_impl(&dword_193827000, v11, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
LABEL_17:

        goto LABEL_22;
      }
    }
    else if (v20)
    {
      __MRMediaRemoteGetPickedRoutedVolumeControlCapabilities_block_invoke_cold_1(a1, v8, v11);
    }
    goto LABEL_22;
  }
  v24 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (!v24)
      goto LABEL_22;
    v31 = *(_QWORD *)(a1 + 32);
    v32 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    *(_DWORD *)buf = 138543874;
    v39 = v31;
    v40 = 2114;
    v41 = v32;
    v42 = 2048;
    v43 = v33;
    v17 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
    v18 = v11;
    v19 = 32;
    goto LABEL_16;
  }
  if (v24)
  {
    v25 = *(_QWORD *)(a1 + 32);
    v26 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    *(_DWORD *)buf = 138544130;
    v39 = v25;
    v40 = 2114;
    v41 = v26;
    v42 = 2114;
    v43 = v7;
    v44 = 2048;
    v45 = v27;
    v17 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_15;
  }
LABEL_22:

  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __MRMediaRemoteGetPickedRoutedVolumeControlCapabilities_block_invoke_58;
  v35[3] = &unk_1E30C66D0;
  v34 = *(NSObject **)(a1 + 56);
  v36 = *(id *)(a1 + 64);
  v37 = a3;
  dispatch_async(v34, v35);

}

uint64_t __MRMediaRemoteGetPickedRoutedVolumeControlCapabilities_block_invoke_58(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned int *)(a1 + 40));
  return result;
}

void __MRMediaRemoteGetPickedRoutedVolumeControlCapabilities_block_invoke_67(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  +[MRNowPlayingOriginClientManager sharedManager](MRNowPlayingOriginClientManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originClientRequestsForPlayerPath:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __MRMediaRemoteGetPickedRoutedVolumeControlCapabilities_block_invoke_2;
  v8[3] = &unk_1E30D0290;
  v6 = *(id *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  objc_msgSend(v5, "handleVolumeCapabilitiesRequestWithCompletion:", v8);

}

void __MRMediaRemoteGetPickedRoutedVolumeControlCapabilities_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id Error;
  void *v8;
  id v9;

  v9 = a3;
  v5 = a2;
  objc_msgSend(v5, "origin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (v9)
      Error = v9;
    else
      Error = (id)MRMediaRemoteNowPlayingPlayerPathCreateError(v5);
    v8 = Error;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

@end
