@implementation MRMediaRemoteServiceVirtualVoiceGetDevices

void __MRMediaRemoteServiceVirtualVoiceGetDevices_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  MRVirtualVoiceInputDevice *v14;
  MRVirtualVoiceInputDevice *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260])
  {
    _MRServiceLogReplyError();
    v6 = 0;
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = (id)MRCreatePropertyListFromXPCMessage(v4, "MRXPC_VOICE_INPUT_DEVICES_DATA_KEY");
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
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
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
          v14 = [MRVirtualVoiceInputDevice alloc];
          v15 = -[MRVirtualVoiceInputDevice initWithData:](v14, "initWithData:", v13, (_QWORD)v16);
          objc_msgSend(v7, "addObject:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    v6 = (void *)objc_msgSend(v7, "copy");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  kdebug_trace();

}

@end
