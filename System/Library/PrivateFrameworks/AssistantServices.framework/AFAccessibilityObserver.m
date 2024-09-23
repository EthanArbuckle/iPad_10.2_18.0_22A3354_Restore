@implementation AFAccessibilityObserver

- (AFAccessibilityObserver)init
{
  AFAccessibilityObserver *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  AFAccessibilityState *v7;
  AFAccessibilityState *state;
  uint64_t v9;
  NSHashTable *listeners;
  NSObject *v11;
  _QWORD block[4];
  AFAccessibilityObserver *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AFAccessibilityObserver;
  v2 = -[AFAccessibilityObserver init](&v15, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("AFAccessibilityObserver", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v2->_stateLock._os_unfair_lock_opaque = 0;
    v7 = +[AFAccessibilityState newWithBuilder:](AFAccessibilityState, "newWithBuilder:", &__block_literal_global_4_42668);
    state = v2->_state;
    v2->_state = v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
    listeners = v2->_listeners;
    v2->_listeners = (NSHashTable *)v9;

    v11 = v2->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__AFAccessibilityObserver_init__block_invoke_2;
    block[3] = &unk_1E3A36F30;
    v14 = v2;
    dispatch_async(v11, block);

  }
  return v2;
}

- (id)currentState
{
  os_unfair_lock_s *p_stateLock;
  void *v4;
  unint64_t stateDirtyFlags;
  id v6;
  void *v7;
  _QWORD v9[5];

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v4 = (void *)-[AFAccessibilityState copy](self->_state, "copy");
  stateDirtyFlags = self->_stateDirtyFlags;
  os_unfair_lock_unlock(p_stateLock);
  if (stateDirtyFlags)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __39__AFAccessibilityObserver_currentState__block_invoke;
    v9[3] = &__block_descriptor_40_e40_v16__0___AFAccessibilityStateMutating__8l;
    v9[4] = stateDirtyFlags;
    objc_msgSend(v4, "mutatedCopyWithMutator:", v9);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v4;
  }
  v7 = v6;

  return v7;
}

- (AFAccessibilityState)state
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__42662;
  v10 = __Block_byref_object_dispose__42663;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__AFAccessibilityObserver_state__block_invoke;
  v5[3] = &unk_1E3A36F78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (AFAccessibilityState *)v3;
}

- (void)getStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__AFAccessibilityObserver_getStateWithCompletion___block_invoke;
    v7[3] = &unk_1E3A36FA0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)addListener:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__AFAccessibilityObserver_addListener___block_invoke;
    v7[3] = &unk_1E3A36FC8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)removeListener:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__AFAccessibilityObserver_removeListener___block_invoke;
    v7[3] = &unk_1E3A36FC8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)voiceOverTouchEnabledPreferenceDidChange:(id)a3
{
  os_unfair_lock_s *p_stateLock;
  NSObject *queue;
  _QWORD block[5];

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  self->_stateDirtyFlags |= 1uLL;
  os_unfair_lock_unlock(p_stateLock);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__AFAccessibilityObserver_voiceOverTouchEnabledPreferenceDidChange___block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)vibrationDisabledPreferenceDidChange:(id)a3
{
  os_unfair_lock_s *p_stateLock;
  NSObject *queue;
  _QWORD block[5];

  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  self->_stateDirtyFlags |= 2uLL;
  os_unfair_lock_unlock(p_stateLock);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__AFAccessibilityObserver_vibrationDisabledPreferenceDidChange___block_invoke;
  block[3] = &unk_1E3A36F30;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)_fetchIsVoiceOverTouchEnabled
{
  return softLink_AXSVoiceOverTouchEnabled() != 0;
}

- (BOOL)_fetchIsVibrationDisabled
{
  _BOOL4 v2;

  v2 = AFSupportsVibration();
  if (v2)
    LOBYTE(v2) = softLink_AXSVibrationDisabled() != 0;
  return v2;
}

- (void)_updateVoiceOverTouchEnabledPreference
{
  BOOL v3;
  AFAccessibilityState *state;
  id v5;
  id v6;
  _QWORD v7[4];
  BOOL v8;
  _QWORD v9[4];
  BOOL v10;

  v3 = -[AFAccessibilityObserver _fetchIsVoiceOverTouchEnabled](self, "_fetchIsVoiceOverTouchEnabled");
  state = self->_state;
  if (state)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__AFAccessibilityObserver__updateVoiceOverTouchEnabledPreference__block_invoke;
    v9[3] = &__block_descriptor_33_e40_v16__0___AFAccessibilityStateMutating__8l;
    v10 = v3;
    -[AFAccessibilityState mutatedCopyWithMutator:](state, "mutatedCopyWithMutator:", v9);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65__AFAccessibilityObserver__updateVoiceOverTouchEnabledPreference__block_invoke_2;
    v7[3] = &__block_descriptor_33_e40_v16__0___AFAccessibilityStateMutating__8l;
    v8 = v3;
    v5 = +[AFAccessibilityState newWithBuilder:](AFAccessibilityState, "newWithBuilder:", v7);
  }
  v6 = v5;
  -[AFAccessibilityObserver _setState:clearDirtyFlags:](self, "_setState:clearDirtyFlags:", v5, 1);

}

- (void)_updateVibrationDisabledPreference
{
  BOOL v3;
  AFAccessibilityState *state;
  id v5;
  id v6;
  _QWORD v7[4];
  BOOL v8;
  _QWORD v9[4];
  BOOL v10;

  if (AFSupportsVibration())
  {
    v3 = -[AFAccessibilityObserver _fetchIsVibrationDisabled](self, "_fetchIsVibrationDisabled");
    state = self->_state;
    if (state)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __61__AFAccessibilityObserver__updateVibrationDisabledPreference__block_invoke;
      v9[3] = &__block_descriptor_33_e40_v16__0___AFAccessibilityStateMutating__8l;
      v10 = v3;
      -[AFAccessibilityState mutatedCopyWithMutator:](state, "mutatedCopyWithMutator:", v9);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __61__AFAccessibilityObserver__updateVibrationDisabledPreference__block_invoke_2;
      v7[3] = &__block_descriptor_33_e40_v16__0___AFAccessibilityStateMutating__8l;
      v8 = v3;
      v5 = +[AFAccessibilityState newWithBuilder:](AFAccessibilityState, "newWithBuilder:", v7);
    }
    v6 = v5;
    -[AFAccessibilityObserver _setState:clearDirtyFlags:](self, "_setState:clearDirtyFlags:", v5, 2);

  }
}

- (void)_setState:(id)a3 clearDirtyFlags:(unint64_t)a4
{
  AFAccessibilityState *v7;
  AFAccessibilityState *state;
  AFAccessibilityState *v9;
  AFAccessibilityState *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  AFAccessibilityState *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = (AFAccessibilityState *)a3;
  state = self->_state;
  if (state != v7 && !-[AFAccessibilityState isEqual:](state, "isEqual:", v7))
  {
    v9 = self->_state;
    v17 = v7;
    v10 = v7;
    os_unfair_lock_lock(&self->_stateLock);
    objc_storeStrong((id *)&self->_state, a3);
    self->_stateDirtyFlags &= ~a4;
    os_unfair_lock_unlock(&self->_stateLock);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[NSHashTable setRepresentation](self->_listeners, "setRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v15);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v16, "accessibilityObserver:stateDidChangeFrom:to:", self, v9, v10);
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

    v7 = v17;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __61__AFAccessibilityObserver__updateVibrationDisabledPreference__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;

  if (*(_BYTE *)(a1 + 32))
    v2 = 2;
  else
    v2 = 1;
  return objc_msgSend(a2, "setIsVibrationDisabled:", v2);
}

uint64_t __61__AFAccessibilityObserver__updateVibrationDisabledPreference__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  if (*(_BYTE *)(a1 + 32))
    v2 = 2;
  else
    v2 = 1;
  return objc_msgSend(a2, "setIsVibrationDisabled:", v2);
}

uint64_t __65__AFAccessibilityObserver__updateVoiceOverTouchEnabledPreference__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;

  if (*(_BYTE *)(a1 + 32))
    v2 = 2;
  else
    v2 = 1;
  return objc_msgSend(a2, "setIsVoiceOverTouchEnabled:", v2);
}

uint64_t __65__AFAccessibilityObserver__updateVoiceOverTouchEnabledPreference__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  if (*(_BYTE *)(a1 + 32))
    v2 = 2;
  else
    v2 = 1;
  return objc_msgSend(a2, "setIsVoiceOverTouchEnabled:", v2);
}

uint64_t __64__AFAccessibilityObserver_vibrationDisabledPreferenceDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVibrationDisabledPreference");
}

uint64_t __68__AFAccessibilityObserver_voiceOverTouchEnabledPreferenceDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVoiceOverTouchEnabledPreference");
}

uint64_t __42__AFAccessibilityObserver_removeListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __39__AFAccessibilityObserver_addListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __50__AFAccessibilityObserver_getStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

void __32__AFAccessibilityObserver_state__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

void __39__AFAccessibilityObserver_currentState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = v3;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v3, "setIsVoiceOverTouchEnabled:", 0);
    v3 = v5;
    v4 = *(_QWORD *)(a1 + 32);
  }
  if ((v4 & 2) != 0)
  {
    objc_msgSend(v5, "setIsVibrationDisabled:", 0);
    v3 = v5;
  }

}

void __31__AFAccessibilityObserver_init__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  getkAXSVoiceOverTouchEnabledNotification();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(v5, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_voiceOverTouchEnabledPreferenceDidChange_, v2, 0);
  if (AFSupportsVibration())
  {
    getkAXSVibrationDisabledPreferenceDidChangeNotification();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(v5, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_vibrationDisabledPreferenceDidChange_, v3, 0);

  }
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__AFAccessibilityObserver_init__block_invoke_3;
  v6[3] = &unk_1E3A36F08;
  v7 = *(id *)(a1 + 32);
  v4 = +[AFAccessibilityState newWithBuilder:](AFAccessibilityState, "newWithBuilder:", v6);
  objc_msgSend(*(id *)(a1 + 32), "_setState:clearDirtyFlags:", v4, 3);

}

void __31__AFAccessibilityObserver_init__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  if (objc_msgSend(v3, "_fetchIsVoiceOverTouchEnabled"))
    v4 = 2;
  else
    v4 = 1;
  objc_msgSend(v6, "setIsVoiceOverTouchEnabled:", v4);
  if (objc_msgSend(*(id *)(a1 + 32), "_fetchIsVibrationDisabled"))
    v5 = 2;
  else
    v5 = 1;
  objc_msgSend(v6, "setIsVibrationDisabled:", v5);

}

void __31__AFAccessibilityObserver_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setIsVoiceOverTouchEnabled:", 0);
  objc_msgSend(v2, "setIsVibrationDisabled:", 0);

}

+ (id)sharedObserver
{
  if (sharedObserver_onceToken_42677 != -1)
    dispatch_once(&sharedObserver_onceToken_42677, &__block_literal_global_42678);
  return (id)sharedObserver_sharedObserver_42679;
}

void __41__AFAccessibilityObserver_sharedObserver__block_invoke()
{
  AFAccessibilityObserver *v0;
  void *v1;

  v0 = objc_alloc_init(AFAccessibilityObserver);
  v1 = (void *)sharedObserver_sharedObserver_42679;
  sharedObserver_sharedObserver_42679 = (uint64_t)v0;

}

@end
