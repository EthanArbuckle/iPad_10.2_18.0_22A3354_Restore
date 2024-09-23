@implementation AXClientsForSiriVoice

void __AXClientsForSiriVoice_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v21;
    *(_QWORD *)&v5 = 138412546;
    v19 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v9, "voice", v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = AXSiriTTSSynthesisVoiceAssetsAreEqual(v10, *(void **)(a1 + 32));

        if (v11)
        {
          v12 = *(void **)(a1 + 40);
          objc_msgSend(v9, "clientId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v12) = objc_msgSend(v12, "containsObject:", v13);

          if ((v12 & 1) != 0)
          {
            AXLogCommon();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v9, "voice");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "name");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "clientId");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v19;
              v25 = v16;
              v26 = 2112;
              v27 = v17;
              _os_log_impl(&dword_18C62B000, v14, OS_LOG_TYPE_INFO, "AXClientsForSiriVoice: Found duplicate subscription %@ | %@", buf, 0x16u);

            }
          }
          else
          {
            v18 = *(void **)(a1 + 40);
            objc_msgSend(v9, "clientId");
            v14 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v14);
          }

        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v6);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

@end
