@implementation LTSpeechTranslationRequest

void __65___LTSpeechTranslationRequest__startTranslationWithService_done___block_invoke(id *a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  CFTypeID v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[8];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v3 = objc_msgSend(a1[5], "copy");
    v4 = (void *)*((_QWORD *)WeakRetained + 18);
    *((_QWORD *)WeakRetained + 18) = v3;

    objc_storeStrong((id *)WeakRetained + 17, a1[4]);
    v5 = (void *)*((_QWORD *)WeakRetained + 17);
    objc_msgSend(WeakRetained, "requestContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startSpeechTranslationWithContext:", v6);

    if (objc_msgSend(*((id *)WeakRetained + 15), "count"))
    {
      v7 = _LTOSLogTranslationEngine();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_235438000, v7, OS_LOG_TYPE_DEFAULT, "Drain queued buffers first", buf, 2u);
      }
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = *((id *)WeakRetained + 15);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v13 = *(const void **)(*((_QWORD *)&v16 + 1) + 8 * v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(WeakRetained, "_appendAudioPCMBuffer:", v13);
            }
            else
            {
              v14 = CFGetTypeID(v13);
              if (v14 == CMSampleBufferGetTypeID())
                objc_msgSend(WeakRetained, "_appendAudioSampleBuffer:simulateRealtime:", v13, 0, (_QWORD)v16);
            }
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        }
        while (v10);
      }

    }
    v15 = (void *)*((_QWORD *)WeakRetained + 15);
    *((_QWORD *)WeakRetained + 15) = 0;

  }
}

void __52___LTSpeechTranslationRequest_appendAudioPCMBuffer___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  id v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    if (WeakRetained[17])
    {
      objc_msgSend(*(id *)(a1 + 40), "_appendAudioPCMBuffer:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      v3 = (void *)WeakRetained[15];
      if (v3)
      {
        v4 = v3;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v4 = (id)objc_claimAutoreleasedReturnValue();
      }
      v5 = (void *)*((_QWORD *)v6 + 15);
      *((_QWORD *)v6 + 15) = v4;

      objc_msgSend(*((id *)v6 + 15), "addObject:", *(_QWORD *)(a1 + 32));
    }
    WeakRetained = v6;
  }

}

void __55___LTSpeechTranslationRequest_append_simulateRealtime___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  id v4;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    if (WeakRetained[17])
    {
      objc_msgSend(*(id *)(a1 + 40), "_appendAudioSampleBuffer:simulateRealtime:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56));
    }
    else
    {
      v3 = (void *)WeakRetained[15];
      if (v3)
      {
        v4 = v3;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v4 = (id)objc_claimAutoreleasedReturnValue();
      }
      v5 = (void *)*((_QWORD *)v6 + 15);
      *((_QWORD *)v6 + 15) = v4;

      objc_msgSend(*((id *)v6 + 15), "addObject:", *(_QWORD *)(a1 + 32));
    }
    WeakRetained = v6;
  }

}

uint64_t __59___LTSpeechTranslationRequest__drainAndClearAudioConverter__block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  *a3 = 2;
  return 0;
}

id __56___LTSpeechTranslationRequest__convertAndFeedPCMBuffer___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v3 + 24))
  {
    *a3 = 1;
    return 0;
  }
  else
  {
    *(_BYTE *)(v3 + 24) = 1;
    *a3 = 0;
    return *(id *)(a1 + 32);
  }
}

void __39___LTSpeechTranslationRequest_endAudio__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_drainAndClearAudioConverter");
    objc_msgSend(v2[17], "endAudio");
    WeakRetained = v2;
  }

}

@end
