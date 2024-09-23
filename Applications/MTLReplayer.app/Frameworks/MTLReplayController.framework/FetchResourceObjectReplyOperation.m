@implementation FetchResourceObjectReplyOperation

void __FetchResourceObjectReplyOperation_block_invoke(uint64_t a1)
{
  id WeakRetained;
  unsigned __int8 v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  int v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  os_signpost_id_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = objc_msgSend(WeakRetained, "isCancelled");

  if ((v3 & 1) != 0)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, 0);
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allKeys", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9));
          v11 = PreprocessICBData(v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v9);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v6);
    }

    v13 = g_signpostLog;
    v14 = v13;
    v15 = *(_QWORD *)(a1 + 64);
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v13))
    {
      v16 = *(_DWORD *)(a1 + 72);
      v17 = objc_msgSend(*(id *)(a1 + 40), "length");
      *(_DWORD *)buf = 67109376;
      v29 = v16;
      v30 = 2048;
      v31 = v17;
      _os_signpost_emit_with_name_impl(&dword_0, v14, OS_SIGNPOST_INTERVAL_BEGIN, v15, "Replayer-5-network", "%u. sendFbufStreamData %{xcode:size-in-bytes}lu", buf, 0x12u);
    }

    v18 = *(_QWORD *)(a1 + 48);
    v19 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v20 = objc_msgSend(*(id *)(a1 + 32), "copy");
    (*(void (**)(uint64_t, id, id))(v18 + 16))(v18, v19, v20);

    v21 = g_signpostLog;
    v22 = v21;
    v23 = *(_QWORD *)(a1 + 64);
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v21))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_0, v22, OS_SIGNPOST_INTERVAL_END, v23, "Replayer-5-network", (const char *)&unk_4AAB5F, buf, 2u);
    }

  }
}

@end
