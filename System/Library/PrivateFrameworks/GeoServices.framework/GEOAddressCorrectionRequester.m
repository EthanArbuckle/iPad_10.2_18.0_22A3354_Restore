@implementation GEOAddressCorrectionRequester

+ (id)sharedRequester
{
  if (qword_1ECDBC2F0 != -1)
    dispatch_once(&qword_1ECDBC2F0, &__block_literal_global_125);
  return (id)_MergedGlobals_265;
}

void __48__GEOAddressCorrectionRequester_sharedRequester__block_invoke()
{
  GEOAddressCorrectionRequester *v0;
  void *v1;

  v0 = objc_alloc_init(GEOAddressCorrectionRequester);
  v1 = (void *)_MergedGlobals_265;
  _MergedGlobals_265 = (uint64_t)v0;

}

- (GEOAddressCorrectionRequester)init
{
  GEOAddressCorrectionRequester *v2;
  uint64_t v3;
  NSMapTable *pendingRequests;
  GEOAddressCorrectionRequester *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOAddressCorrectionRequester;
  v2 = -[GEOAddressCorrectionRequester init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 512, 5);
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = (NSMapTable *)v3;

    v2->_pendingRequestsLock._os_unfair_lock_opaque = 0;
    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_pendingRequests;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[GEOAddressCorrectionRequester cancelRequest:](self, "cancelRequest:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)GEOAddressCorrectionRequester;
  -[GEOAddressCorrectionRequester dealloc](&v8, sel_dealloc);
}

- (void)startAddressCorrectionInitRequest:(id)a3 finished:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOVoltaireAddressCorrectionProvider *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(_QWORD *, void *);
  void *v22;
  GEOAddressCorrectionRequester *v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(GEOVoltaireAddressCorrectionProvider);
  os_unfair_lock_lock_with_options();
  -[NSMapTable setObject:forKey:](self->_pendingRequests, "setObject:forKey:", v11, v8);
  os_unfair_lock_unlock(&self->_pendingRequestsLock);
  v12 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __82__GEOAddressCorrectionRequester_startAddressCorrectionInitRequest_finished_error___block_invoke;
  v26[3] = &unk_1E1C104A8;
  v26[4] = self;
  v13 = v8;
  v27 = v13;
  v28 = v9;
  v14 = v9;
  v15 = (void *)MEMORY[0x18D765024](v26);
  v19 = v12;
  v20 = 3221225472;
  v21 = __82__GEOAddressCorrectionRequester_startAddressCorrectionInitRequest_finished_error___block_invoke_2;
  v22 = &unk_1E1C104D0;
  v23 = self;
  v24 = v13;
  v25 = v10;
  v16 = v10;
  v17 = v13;
  v18 = (void *)MEMORY[0x18D765024](&v19);
  -[GEOVoltaireAddressCorrectionProvider startInitRequest:finished:error:](v11, "startInitRequest:finished:error:", v17, v15, v18, v19, v20, v21, v22, v23);

}

void __82__GEOAddressCorrectionRequester_startAddressCorrectionInitRequest_finished_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 8), "removeObjectForKey:", a1[5]);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
  v4 = a1[6];
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

void __82__GEOAddressCorrectionRequester_startAddressCorrectionInitRequest_finished_error___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 8), "removeObjectForKey:", a1[5]);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
  v4 = a1[6];
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

- (void)startAddressCorrectionUpdateRequest:(id)a3 finished:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEOVoltaireAddressCorrectionProvider *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(_QWORD *, void *);
  void *v22;
  GEOAddressCorrectionRequester *v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(GEOVoltaireAddressCorrectionProvider);
  os_unfair_lock_lock_with_options();
  -[NSMapTable setObject:forKey:](self->_pendingRequests, "setObject:forKey:", v11, v8);
  os_unfair_lock_unlock(&self->_pendingRequestsLock);
  v12 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __84__GEOAddressCorrectionRequester_startAddressCorrectionUpdateRequest_finished_error___block_invoke;
  v26[3] = &unk_1E1C104F8;
  v26[4] = self;
  v13 = v8;
  v27 = v13;
  v28 = v9;
  v14 = v9;
  v15 = (void *)MEMORY[0x18D765024](v26);
  v19 = v12;
  v20 = 3221225472;
  v21 = __84__GEOAddressCorrectionRequester_startAddressCorrectionUpdateRequest_finished_error___block_invoke_2;
  v22 = &unk_1E1C104D0;
  v23 = self;
  v24 = v13;
  v25 = v10;
  v16 = v10;
  v17 = v13;
  v18 = (void *)MEMORY[0x18D765024](&v19);
  -[GEOVoltaireAddressCorrectionProvider startUpdateRequest:finished:error:](v11, "startUpdateRequest:finished:error:", v17, v15, v18, v19, v20, v21, v22, v23);

}

void __84__GEOAddressCorrectionRequester_startAddressCorrectionUpdateRequest_finished_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 8), "removeObjectForKey:", a1[5]);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
  v4 = a1[6];
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

void __84__GEOAddressCorrectionRequester_startAddressCorrectionUpdateRequest_finished_error___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 8), "removeObjectForKey:", a1[5]);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
  v4 = a1[6];
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

}

- (void)cancelRequest:(id)a3
{
  os_unfair_lock_s *p_pendingRequestsLock;
  id v5;
  id v6;

  p_pendingRequestsLock = &self->_pendingRequestsLock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMapTable objectForKey:](self->_pendingRequests, "objectForKey:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](self->_pendingRequests, "removeObjectForKey:", v5);

  os_unfair_lock_unlock(p_pendingRequestsLock);
  objc_msgSend(v6, "cancelRequest");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequests, 0);
}

@end
