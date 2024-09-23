@implementation AUHostDelegate

- (AUHostDelegate)init
{
  AUHostDelegate *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *mParameterQueue;
  NSObject *v5;
  NSObject *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AUHostDelegate;
  v2 = -[AUHostDelegate init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("AUHostExtensionContextParameterSyncQueue", 0);
    mParameterQueue = v2->mParameterQueue;
    v2->mParameterQueue = (OS_dispatch_queue *)v3;

    v5 = v2->mParameterQueue;
    dispatch_get_global_queue(25, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v5, v6);

  }
  return v2;
}

- (void)propertiesChanged:(id)a3
{
  id v4;
  AUAudioUnit **p_audioUnit;
  id WeakRetained;
  char isKindOfClass;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_audioUnit = &self->_audioUnit;
  WeakRetained = objc_loadWeakRetained((id *)&self->_audioUnit);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_audioUnit);
    objc_msgSend(v8, "propertiesChanged:", v4);

  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12);
          v14 = objc_loadWeakRetained((id *)p_audioUnit);
          objc_msgSend(v14, "willChangeValueForKey:", *(_QWORD *)(v13 + 8), (_QWORD)v16);

          v15 = objc_loadWeakRetained((id *)p_audioUnit);
          objc_msgSend(v15, "didChangeValueForKey:", *(_QWORD *)(v13 + 8));

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
}

- (void)MIDICIProfileChanged:(unsigned __int8)a3 channel:(unsigned __int8)a4 profile:(id)a5 enabled:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  AUAudioUnit **p_audioUnit;
  id WeakRetained;
  void *v12;
  id v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v15;

  v6 = a6;
  v7 = a4;
  v8 = a3;
  v15 = a5;
  p_audioUnit = &self->_audioUnit;
  WeakRetained = objc_loadWeakRetained((id *)&self->_audioUnit);
  objc_msgSend(WeakRetained, "profileChangedBlock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_loadWeakRetained((id *)p_audioUnit);
    objc_msgSend(v13, "profileChangedBlock");
    v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, uint64_t, uint64_t, id, _BOOL8))v14)[2](v14, v8, v7, v15, v6);

  }
}

- (void)speechSynthesisMetadataAvailable:(id)a3 speechRequest:(id)a4
{
  id v6;
  AUAudioUnit **p_audioUnit;
  id WeakRetained;
  void *v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  id v12;

  v12 = a3;
  v6 = a4;
  p_audioUnit = &self->_audioUnit;
  WeakRetained = objc_loadWeakRetained((id *)&self->_audioUnit);
  objc_msgSend(WeakRetained, "speechSynthesisOutputMetadataBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_loadWeakRetained((id *)p_audioUnit);
    objc_msgSend(v10, "speechSynthesisOutputMetadataBlock");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v11)[2](v11, v12, v6);

  }
}

- (void)syncParameter:(unint64_t)a3 value:(float)a4 extOriginator:(unint64_t)a5 hostTime:(unint64_t)a6 eventType:(unsigned int)a7
{
  NSObject *mParameterQueue;
  _QWORD block[8];
  float v15;
  unsigned int v16;

  mParameterQueue = self->mParameterQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__AUHostDelegate_syncParameter_value_extOriginator_hostTime_eventType___block_invoke;
  block[3] = &unk_1E2920BB0;
  block[4] = self;
  block[5] = a3;
  v15 = a4;
  block[6] = a5;
  block[7] = a6;
  v16 = a7;
  dispatch_async(mParameterQueue, block);
}

- (AUAudioUnit)audioUnit
{
  return (AUAudioUnit *)objc_loadWeakRetained((id *)&self->_audioUnit);
}

- (void)setAudioUnit:(id)a3
{
  objc_storeWeak((id *)&self->_audioUnit, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_audioUnit);
  objc_storeStrong((id *)&self->mParameterQueue, 0);
}

void __71__AUHostDelegate_syncParameter_value_extOriginator_hostTime_eventType___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "parameterTree");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = *(_DWORD *)(a1 + 64);
  objc_msgSend(v3, "remoteSyncParameter:value:extOriginator:hostTime:eventType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned int *)(a1 + 68), v4);

}

@end
