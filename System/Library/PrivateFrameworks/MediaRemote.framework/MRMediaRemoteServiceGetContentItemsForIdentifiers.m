@implementation MRMediaRemoteServiceGetContentItemsForIdentifiers

void __MRMediaRemoteServiceGetContentItemsForIdentifiers_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260])
  {
    _MRServiceLogReplyError();
    v7 = 0;
    v6 = 0;
  }
  else
  {
    v7 = (void *)MRCreateClientErrorFromXPCMessage(v3);
    v8 = (void *)MRCreateContentItemsFromXPCMessage(v4);
    v9 = v8;
    if (v8)
    {
      v17 = a1;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v19 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            objc_msgSend(v15, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v16);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v12);
      }

      a1 = v17;
    }
    else
    {
      v6 = 0;
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  kdebug_trace();

}

@end
