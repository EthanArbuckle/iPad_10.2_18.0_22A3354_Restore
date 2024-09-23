@implementation GEORPLegacyProblemRequester

+ (id)sharedRequester
{
  if (qword_1ECDBC238 != -1)
    dispatch_once(&qword_1ECDBC238, &__block_literal_global_116);
  return (id)_MergedGlobals_257;
}

void __46__GEORPLegacyProblemRequester_sharedRequester__block_invoke()
{
  GEORPLegacyProblemRequester *v0;
  void *v1;

  v0 = objc_alloc_init(GEORPLegacyProblemRequester);
  v1 = (void *)_MergedGlobals_257;
  _MergedGlobals_257 = (uint64_t)v0;

}

- (GEORPLegacyProblemRequester)init
{
  GEORPLegacyProblemRequester *v2;
  uint64_t v3;
  NSMapTable *pendingRequests;
  GEORPLegacyProblemRequester *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPLegacyProblemRequester;
  v2 = -[GEORPLegacyProblemRequester init](&v7, sel_init);
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
        -[GEORPLegacyProblemRequester cancelRequest:](self, "cancelRequest:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)GEORPLegacyProblemRequester;
  -[GEORPLegacyProblemRequester dealloc](&v8, sel_dealloc);
}

- (void)startSubmissionRequest:(id)a3 finished:(id)a4 networkActivity:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  GEORPProblemProvider *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(_QWORD *, void *);
  void *v27;
  GEORPLegacyProblemRequester *v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __85__GEORPLegacyProblemRequester_startSubmissionRequest_finished_networkActivity_error___block_invoke;
  v32[3] = &unk_1E1C0F8A0;
  v32[4] = self;
  v15 = v10;
  v33 = v15;
  v16 = v12;
  v34 = v16;
  v17 = v11;
  v35 = v17;
  v18 = (void *)MEMORY[0x18D765024](v32);
  v24 = v14;
  v25 = 3221225472;
  v26 = __85__GEORPLegacyProblemRequester_startSubmissionRequest_finished_networkActivity_error___block_invoke_2;
  v27 = &unk_1E1C0F8C8;
  v28 = self;
  v19 = v15;
  v29 = v19;
  v20 = v16;
  v30 = v20;
  v21 = v13;
  v31 = v21;
  v22 = (void *)MEMORY[0x18D765024](&v24);
  v23 = objc_alloc_init(GEORPProblemProvider);
  os_unfair_lock_lock_with_options();
  -[NSMapTable setObject:forKey:](self->_pendingRequests, "setObject:forKey:", v23, v19, v24, v25, v26, v27, v28);
  os_unfair_lock_unlock(&self->_pendingRequestsLock);
  if (v20)
    (*((void (**)(id, uint64_t))v20 + 2))(v20, 1);
  -[GEORPProblemProvider startSubmissionRequest:finished:error:](v23, "startSubmissionRequest:finished:error:", v19, v18, v22);

}

void __85__GEORPLegacyProblemRequester_startSubmissionRequest_finished_networkActivity_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 8), "removeObjectForKey:", a1[5]);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
  v4 = a1[6];
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  v5 = a1[7];
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

void __85__GEORPLegacyProblemRequester_startSubmissionRequest_finished_networkActivity_error___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 8), "removeObjectForKey:", a1[5]);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
  v4 = a1[6];
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  v5 = a1[7];
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

- (void)startStatusRequest:(id)a3 finished:(id)a4 networkActivity:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  GEORPProblemProvider *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(_QWORD *, void *);
  void *v27;
  GEORPLegacyProblemRequester *v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __81__GEORPLegacyProblemRequester_startStatusRequest_finished_networkActivity_error___block_invoke;
  v32[3] = &unk_1E1C0F8F0;
  v32[4] = self;
  v15 = v10;
  v33 = v15;
  v16 = v12;
  v34 = v16;
  v17 = v11;
  v35 = v17;
  v18 = (void *)MEMORY[0x18D765024](v32);
  v24 = v14;
  v25 = 3221225472;
  v26 = __81__GEORPLegacyProblemRequester_startStatusRequest_finished_networkActivity_error___block_invoke_2;
  v27 = &unk_1E1C0F8C8;
  v28 = self;
  v19 = v15;
  v29 = v19;
  v20 = v16;
  v30 = v20;
  v21 = v13;
  v31 = v21;
  v22 = (void *)MEMORY[0x18D765024](&v24);
  v23 = objc_alloc_init(GEORPProblemProvider);
  os_unfair_lock_lock_with_options();
  -[NSMapTable setObject:forKey:](self->_pendingRequests, "setObject:forKey:", v23, v19, v24, v25, v26, v27, v28);
  os_unfair_lock_unlock(&self->_pendingRequestsLock);
  if (v20)
    (*((void (**)(id, uint64_t))v20 + 2))(v20, 1);
  -[GEORPProblemProvider startStatusRequest:finished:error:](v23, "startStatusRequest:finished:error:", v19, v18, v22);

}

void __81__GEORPLegacyProblemRequester_startStatusRequest_finished_networkActivity_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 8), "removeObjectForKey:", a1[5]);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
  v4 = a1[6];
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  v5 = a1[7];
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

}

void __81__GEORPLegacyProblemRequester_startStatusRequest_finished_networkActivity_error___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 8), "removeObjectForKey:", a1[5]);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 16));
  v4 = a1[6];
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  v5 = a1[7];
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);

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
