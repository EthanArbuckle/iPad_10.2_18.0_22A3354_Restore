@implementation AFMediaRemoteSendCommandWithOptions

void __AFMediaRemoteSendCommandWithOptions_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  _QWORD v17[4];
  id v18;
  id v19;
  int v20;
  BOOL v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        if (MEMORY[0x1A1AC0438](*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v7)) == *(_DWORD *)(a1 + 56))
        {
          v12 = MRMediaRemoteCommandInfoGetEnabled() != 0;

          v13 = *(unsigned int *)(a1 + 56);
          v15 = *(_QWORD *)(a1 + 32);
          v14 = *(void **)(a1 + 40);
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __AFMediaRemoteSendCommandWithOptions_block_invoke_2;
          v17[3] = &unk_1E3A34A20;
          v21 = v12;
          v20 = v13;
          v18 = v14;
          v19 = *(id *)(a1 + 48);
          AFMediaRemoteSendCommandNoCheck(v13, v15, (uint64_t)v18, v17);

          v11 = v18;
          goto LABEL_14;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v5)
        continue;
      break;
    }
  }

  v8 = *(_QWORD *)(a1 + 48);
  if (v8)
  {
    v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_DWORD *)(a1 + 56);
      *(_DWORD *)buf = 136315394;
      v27 = "AFMediaRemoteSendCommandWithOptions_block_invoke";
      v28 = 1024;
      v29 = v16;
      _os_log_error_impl(&dword_19AF50000, v9, OS_LOG_TYPE_ERROR, "%s MRMediaRemoteCommand %d is not supported by NowPlaying app", buf, 0x12u);
      v8 = *(_QWORD *)(a1 + 48);
    }
    v10 = objc_alloc(MEMORY[0x1E0D87FE8]);
    v11 = (id)objc_msgSend(v10, "initWithErrorCode:", *MEMORY[0x1E0D88EA0]);
    (*(void (**)(uint64_t, id, _QWORD))(v8 + 16))(v8, v11, 0);
LABEL_14:

  }
}

void __AFMediaRemoteSendCommandWithOptions_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  unsigned int v21;
  _BYTE buf[24];
  void *v23;
  uint64_t *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 || *(_BYTE *)(a1 + 52) || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = *(_DWORD *)(a1 + 48);
    v8 = MEMORY[0x1E0C809B0];
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __AFMediaRemoteSendCommandWithOptions_block_invoke_3;
    v19 = &unk_1E3A349F8;
    v21 = v7;
    v9 = *(void **)(a1 + 32);
    v20 = *(id *)(a1 + 40);
    v10 = v9;
    v11 = &v16;
    v12 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "_CheckForSpecialFailureCodesForCurrentlyDisabledMRCommand";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v7;
      _os_log_impl(&dword_19AF50000, v12, OS_LOG_TYPE_INFO, "%s %d", buf, 0x12u);
    }
    if (v7 <= 0x12 && ((1 << v7) & 0x60030) != 0)
    {
      v13 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "_CheckForSpecialFailureCodesForCurrentlyDisabledMRCommand";
        _os_log_impl(&dword_19AF50000, v13, OS_LOG_TYPE_INFO, "%s Checking if an unsupported skip is unsupported by the app or the content", buf, 0xCu);
      }
      *(_QWORD *)buf = v8;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = ___CheckForSpecialFailureCodesForCurrentlyDisabledMRCommand_block_invoke;
      v23 = &unk_1E3A34BD0;
      v24 = v11;
      AFGetNowPlayingInfoDictionary(v10, buf);
      v14 = v24;
    }
    else
    {
      v15 = objc_alloc(MEMORY[0x1E0D87FE8]);
      v14 = (uint64_t *)objc_msgSend(v15, "initWithErrorCode:", *MEMORY[0x1E0D88EA0], v16, v17);
      v18((uint64_t)v11, v14);
    }

  }
}

void __AFMediaRemoteSendCommandWithOptions_block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_DWORD *)(a1 + 40);
    v6 = 136315650;
    v7 = "AFMediaRemoteSendCommandWithOptions_block_invoke_3";
    v8 = 1024;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_error_impl(&dword_19AF50000, v4, OS_LOG_TYPE_ERROR, "%s Best failure for MR command %d is %@", (uint8_t *)&v6, 0x1Cu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
