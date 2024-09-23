@implementation INVocabularyConnection

void __42___INVocabularyConnection_settingsService__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 24))
  {
    objc_msgSend(*(id *)(v2 + 8), "remoteObjectProxy");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;
  }
  else
  {
    objc_msgSend((id)v2, "_connect");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteObjectProxy");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v5 = v9;
  }

}

void __35___INVocabularyConnection__connect__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v5 = 136315650;
    v6 = "-[_INVocabularyConnection _connect]_block_invoke";
    v7 = 2112;
    v8 = v3;
    v9 = 2112;
    v10 = WeakRetained;
    _os_log_impl(&dword_18BEBC000, v4, OS_LOG_TYPE_INFO, "%s connection %@ by %@ was interrupted", (uint8_t *)&v5, 0x20u);
  }

}

void __35___INVocabularyConnection__connect__block_invoke_69(uint64_t a1)
{
  id WeakRetained;
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v5 = 136315650;
    v6 = "-[_INVocabularyConnection _connect]_block_invoke";
    v7 = 2112;
    v8 = v3;
    v9 = 2112;
    v10 = WeakRetained;
    _os_log_impl(&dword_18BEBC000, v4, OS_LOG_TYPE_INFO, "%s connection %@ by %@ was invalidated", (uint8_t *)&v5, 0x20u);
  }
  objc_msgSend(WeakRetained, "_clearConnection");

}

void __43___INVocabularyConnection__clearConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setInvalidationHandler:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

}

@end
