@implementation AFNetworkAvailability

_BYTE *__36__AFNetworkAvailability_isAvailable__block_invoke(uint64_t a1)
{
  _BYTE *result;
  char v3;

  result = *(_BYTE **)(a1 + 32);
  v3 = result[20];
  if ((v3 & 1) == 0)
  {
    result = (_BYTE *)objc_msgSend(result, "_updateState");
    v3 = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 20);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (v3 & 2) != 0;
  return result;
}

+ (id)sharedAvailability
{
  if (sharedAvailability_onceToken != -1)
    dispatch_once(&sharedAvailability_onceToken, &__block_literal_global_16843);
  return (id)sharedAvailability_sAvailability;
}

- (BOOL)isAvailable
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__AFNetworkAvailability_isAvailable__block_invoke;
  v5[3] = &unk_1E3A36F78;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)addObserver:(id)a3
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
    v7[2] = __37__AFNetworkAvailability_addObserver___block_invoke;
    v7[3] = &unk_1E3A36FC8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)_availabilityChanged
{
  AvailabilityState state;

  state = self->_state;
  -[AFNetworkAvailability _updateState](self, "_updateState");
  if (self->_notifyToken != -1 && (*(_BYTE *)&self->_state & 1) == 0)
    *(_BYTE *)&self->_state |= 1u;
  if ((*(_BYTE *)&state & 1) == 0 || ((*(_BYTE *)&self->_state ^ *(unsigned int *)&state) & 2) != 0)
    -[AFNetworkAvailability _notifyObservers](self, "_notifyObservers");
}

- (void)_updateState
{
  char flags;
  char v4;
  AvailabilityState *p_state;
  char v6;
  char v7;
  char state;

  if (!nwi_state_copy())
  {
    *(_BYTE *)&self->_state &= ~2u;
    return;
  }
  if (nwi_state_get_first_ifstate() && (nwi_ifstate_get_flags() & 4) != 0)
  {
    state = (char)self->_state;
    p_state = &self->_state;
    v4 = state;
LABEL_9:
    v7 = v4 | 2;
    goto LABEL_10;
  }
  if (!nwi_state_get_first_ifstate())
  {
    *(_BYTE *)&self->_state &= ~2u;
    goto LABEL_12;
  }
  flags = nwi_ifstate_get_flags();
  v6 = (char)self->_state;
  p_state = &self->_state;
  v4 = v6;
  if ((flags & 4) != 0)
    goto LABEL_9;
  v7 = v4 & 0xFD;
LABEL_10:
  *(_BYTE *)p_state = v7;
LABEL_12:
  nwi_state_release();
}

uint64_t __40__AFNetworkAvailability_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  if (!result)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 24);
    *(_QWORD *)(v3 + 24) = 0;

    return objc_msgSend(*(id *)(a1 + 32), "_stopObservingAvailability");
  }
  return result;
}

_DWORD *__37__AFNetworkAvailability_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _DWORD *result;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  result = *(_DWORD **)(a1 + 32);
  if (v6 == 1 || result[4] == -1)
  {
    objc_msgSend(result, "_startObservingAvailability");
    return (_DWORD *)objc_msgSend(*(id *)(a1 + 32), "_availabilityChanged");
  }
  return result;
}

- (void)_startObservingAvailability
{
  const char *notify_key;
  NSObject *queue;
  _QWORD v5[5];
  int out_token;

  if (self->_notifyToken == -1)
  {
    notify_key = (const char *)nwi_state_get_notify_key();
    out_token = -1;
    queue = self->_queue;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __52__AFNetworkAvailability__startObservingAvailability__block_invoke;
    v5[3] = &unk_1E3A30A80;
    v5[4] = self;
    if (!notify_register_dispatch(notify_key, &out_token, queue, v5))
      self->_notifyToken = out_token;
  }
}

- (void)_notifyObservers
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_observers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "networkAvailability:isAvailable:", self, (*(_BYTE *)&self->_state >> 1) & 1, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)removeObserver:(id)a3
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
    v7[2] = __40__AFNetworkAvailability_removeObserver___block_invoke;
    v7[3] = &unk_1E3A36FC8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)_stopObservingAvailability
{
  int notifyToken;

  notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_notifyToken = -1;
    -[AFNetworkAvailability _clearState](self, "_clearState");
  }
}

void __43__AFNetworkAvailability_sharedAvailability__block_invoke()
{
  AFNetworkAvailability *v0;
  void *v1;

  v0 = objc_alloc_init(AFNetworkAvailability);
  v1 = (void *)sharedAvailability_sAvailability;
  sharedAvailability_sAvailability = (uint64_t)v0;

}

- (AFNetworkAvailability)init
{
  AFNetworkAvailability *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AFNetworkAvailability;
  v2 = -[AFNetworkAvailability init](&v8, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, 0);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = dispatch_queue_create("AFNetworkAvailability", v4);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v2->_notifyToken = -1;
  }
  return v2;
}

- (void)_clearState
{
  *(_BYTE *)&self->_state &= ~1u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __52__AFNetworkAvailability__startObservingAvailability__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_availabilityChanged");
}

@end
