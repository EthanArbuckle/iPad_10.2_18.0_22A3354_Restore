@implementation AppClipCodeUpdateCallbackHandler

void __AppClipCodeUpdateCallbackHandler_block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _ARLogTechnique_10();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = a1[8];
      v9 = a1[9];
      v25 = 134218498;
      v26 = v8;
      v27 = 2048;
      v28 = v9;
      v29 = 2112;
      v30 = v6;
      _os_log_impl(&dword_1B3A68000, v7, OS_LOG_TYPE_ERROR, "ARAppClipCodeTechnique: Could not decode URL at time %F index:%lu Error: %@", (uint8_t *)&v25, 0x20u);
    }

    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v6, "code");
    if (objc_msgSend(v6, "code"))
    {
      if (objc_msgSend(v6, "code") == 1)
      {
        v10 = 3;
      }
      else if (objc_msgSend(v6, "code") == 2)
      {
        v10 = 4;
      }
      else if (objc_msgSend(v6, "code") == 3)
      {
        v10 = 5;
      }
      else if (objc_msgSend(v6, "code") == 4)
      {
        v10 = 6;
      }
      else
      {
        v10 = 7;
      }
    }
    else
    {
      v10 = 7;
    }
    v22 = *(id *)(a1[4] + 104);
    objc_sync_enter(v22);
    objc_msgSend(*(id *)(a1[4] + 104), "objectForKeyedSubscript:", a1[5]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", a1[6]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setUrlDecodingStateInternal:", v10);

    objc_sync_exit(v22);
  }
  else if (v5)
  {
    v11 = *(id *)(a1[4] + 104);
    objc_sync_enter(v11);
    objc_msgSend(*(id *)(a1[4] + 104), "objectForKeyedSubscript:", a1[5]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", a1[6]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setUrl:", v5);

    objc_msgSend(*(id *)(a1[4] + 104), "objectForKeyedSubscript:", a1[5]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", a1[6]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setUrlDecodingStateInternal:", 8);

    objc_sync_exit(v11);
  }
  else
  {
    _ARLogTechnique_10();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = a1[8];
      v18 = a1[9];
      v25 = 134218240;
      v26 = v17;
      v27 = 2048;
      v28 = v18;
      _os_log_impl(&dword_1B3A68000, v16, OS_LOG_TYPE_ERROR, "ARAppClipCodeTechnique: Decoded URL at time %F index:%lu is nil.", (uint8_t *)&v25, 0x16u);
    }

    v19 = *(id *)(a1[4] + 104);
    objc_sync_enter(v19);
    objc_msgSend(*(id *)(a1[4] + 104), "objectForKeyedSubscript:", a1[5]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", a1[6]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setUrlDecodingStateInternal:", 7);

    objc_sync_exit(v19);
  }

}

@end
