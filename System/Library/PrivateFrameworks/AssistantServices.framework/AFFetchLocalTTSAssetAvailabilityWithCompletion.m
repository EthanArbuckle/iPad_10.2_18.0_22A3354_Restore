@implementation AFFetchLocalTTSAssetAvailabilityWithCompletion

void __AFFetchLocalTTSAssetAvailabilityWithCompletion_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v8, "type", (_QWORD)v13) == 3 || objc_msgSend(v8, "type") == 4)
        {
          v9 = (void *)AFSiriLogContextUtility;
          if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_DEBUG))
          {
            v10 = *(_QWORD *)(a1 + 32);
            v11 = v9;
            objc_msgSend(v8, "name");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v18 = "AFFetchLocalTTSAssetAvailabilityWithCompletion_block_invoke";
            v19 = 2112;
            v20 = v10;
            v21 = 2112;
            v22 = v12;
            _os_log_debug_impl(&dword_19AF50000, v11, OS_LOG_TYPE_DEBUG, "%s Local TTS asset found for current output voice: %@ %@", buf, 0x20u);

          }
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

          goto LABEL_14;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v23, 16);
      if (v5)
        continue;
      break;
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_14:

}

@end
