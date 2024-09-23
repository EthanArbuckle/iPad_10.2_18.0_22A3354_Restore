@implementation MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayer

uint64_t __MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayer_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void ___MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayer_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v22;
  uint64_t v23;
  __CFString *v24;
  uint64_t v25;
  __CFString *v26;
  uint64_t v27;
  __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  NSObject *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  __CFString *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  const __CFString *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  __CFString *v53;
  __int16 v54;
  __CFString *v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "resolvedPlayerPath");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (__CFString *)MRContentItemsCopyMinimalReadableDescription(v8, 0);
  _MRLogForCategory(0xAuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v6 && v9)
  {
    v12 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v12)
        goto LABEL_22;
      v13 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
      *(_DWORD *)buf = 138544386;
      v49 = CFSTR("playbackQueue");
      v50 = 2114;
      v51 = v13;
      v52 = 2112;
      v53 = v9;
      v54 = 2114;
      v55 = v7;
      v56 = 2048;
      v57 = v15;
      v16 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v17 = v11;
      v18 = 52;
      goto LABEL_16;
    }
    if (!v12)
      goto LABEL_22;
    v25 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
    *(_DWORD *)buf = 138544130;
    v49 = CFSTR("playbackQueue");
    v50 = 2114;
    v51 = v25;
    v52 = 2112;
    v53 = v9;
    v54 = 2048;
    v55 = v26;
    v16 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
    goto LABEL_15;
  }
  if (v6)
  {
    v19 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (!v19)
        goto LABEL_22;
      v20 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
      *(_DWORD *)buf = 138544386;
      v49 = CFSTR("playbackQueue");
      v50 = 2114;
      v51 = v20;
      v52 = 2114;
      v53 = v6;
      v54 = 2114;
      v55 = v7;
      v56 = 2048;
      v57 = v21;
      _os_log_error_impl(&dword_193827000, v11, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", buf, 0x34u);
      goto LABEL_17;
    }
    if (v19)
      ___MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayer_block_invoke_cold_1(a1);
  }
  else
  {
    v22 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (!v22)
        goto LABEL_22;
      v23 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
      *(_DWORD *)buf = 138544130;
      v49 = CFSTR("playbackQueue");
      v50 = 2114;
      v51 = v23;
      v52 = 2114;
      v53 = v7;
      v54 = 2048;
      v55 = v24;
      v16 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
LABEL_15:
      v17 = v11;
      v18 = 42;
LABEL_16:
      _os_log_impl(&dword_193827000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_17:

      goto LABEL_22;
    }
    if (v22)
    {
      v27 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
      *(_DWORD *)buf = 138543874;
      v49 = CFSTR("playbackQueue");
      v50 = 2114;
      v51 = v27;
      v52 = 2048;
      v53 = v28;
      v16 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v17 = v11;
      v18 = 32;
      goto LABEL_16;
    }
  }
LABEL_22:

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "requestIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRequestIdentifier:", v29);

    -[__CFString origin](v7, "origin");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v30, "isLocallyHosted") & 1) == 0)
    {
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      objc_msgSend(v5, "contentItems");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v44 != v34)
              objc_enumerationMutation(v31);
            MRContentItemSetDeviceSpecificUserInfo(*(void **)(*((_QWORD *)&v43 + 1) + 8 * i), 0);
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        }
        while (v33);
      }

    }
  }
  v36 = *(void **)(a1 + 56);
  if (v36)
  {
    v37 = *(NSObject **)(a1 + 48);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = ___MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayer_block_invoke_70;
    v39[3] = &unk_1E30C6658;
    v42 = v36;
    v40 = v5;
    v41 = v6;
    MRCreateDonatedQosBlock(v39);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v37, v38);

  }
}

uint64_t ___MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayer_block_invoke_70(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void ___MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayer_block_invoke_cold_1(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_193827000, v3, v4, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_0();
}

@end
