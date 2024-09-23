@implementation MRPlaybackQueueSubscriptionController

- (MRPlaybackQueueSubscriptionController)initWithPlayerPath:(id)a3
{
  id v5;
  MRPlaybackQueueSubscriptionController *v6;
  MRPlaybackQueueSubscriptionController *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  NSMutableArray *v12;
  NSMutableArray *requestFilters;
  NSMutableSet *v14;
  NSMutableSet *requests;
  MSVMutableBidirectionalDictionary *v16;
  MSVMutableBidirectionalDictionary *offsets;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MRPlaybackQueueSubscriptionController;
  v6 = -[MRPlaybackQueueSubscriptionController init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_playerPath, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INTERACTIVE, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.MediaRemote.MRPlaybackQueueClient/serialQueue", v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    requestFilters = v7->_requestFilters;
    v7->_requestFilters = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    requests = v7->_requests;
    v7->_requests = v14;

    v16 = (MSVMutableBidirectionalDictionary *)objc_alloc_init(MEMORY[0x1E0D4D098]);
    offsets = v7->_offsets;
    v7->_offsets = v16;

  }
  return v7;
}

uint64_t __51__MRPlaybackQueueSubscriptionController_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
}

void __77__MRPlaybackQueueSubscriptionController_subscribeToPlaybackQueue_forRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  id v20;
  double v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "requestIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
    objc_msgSend(*(id *)(a1 + 32), "requestIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "hasLocation"))
  {
    objc_msgSend(*(id *)(a1 + 48), "range");
    v6 = v5;
    v7 = objc_msgSend(*(id *)(a1 + 32), "range");
    if (v7 < v7 + v6)
    {
      v8 = v7;
      do
      {
        v9 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeObjectForKey:", v10);

        ++v8;
        --v6;
      }
      while (v6);
    }
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v11 = *(id *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v32;
LABEL_9:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v15);
      objc_msgSend(v16, "first");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "exactMatch:", *(_QWORD *)(a1 + 32));

      if ((v18 & 1) != 0)
        break;
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v13)
          goto LABEL_9;
        goto LABEL_15;
      }
    }
    v19 = v16;

    if (v19)
      goto LABEL_18;
  }
  else
  {
LABEL_15:

  }
  v20 = objc_alloc(MEMORY[0x1E0D4D050]);
  LODWORD(v21) = 1008981770;
  v22 = (void *)objc_msgSend(v20, "initWithCapacity:falsePositiveTolerance:", 500, v21);
  v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D0B8]), "initWithFirst:second:", *(_QWORD *)(a1 + 32), v22);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addObject:", v19);

LABEL_18:
  objc_msgSend(*(id *)(a1 + 48), "contentItems");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __77__MRPlaybackQueueSubscriptionController_subscribeToPlaybackQueue_forRequest___block_invoke_2;
  v27[3] = &unk_1E30CE7C0;
  v24 = *(id *)(a1 + 48);
  v25 = *(_QWORD *)(a1 + 40);
  v28 = v24;
  v29 = v25;
  v30 = v19;
  v26 = v19;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v27);

}

void __77__MRPlaybackQueueSubscriptionController_subscribeToPlaybackQueue_forRequest___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "identifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "hasLocation"))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "range") + a3;
    v6 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v9, v7);

  }
  objc_msgSend(*(id *)(a1 + 48), "second");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

}

void __52__MRPlaybackQueueSubscriptionController_addRequest___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;
  id v6;
  id location;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = dispatch_time(0, 420000000000);
  dispatch_get_global_queue(-2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MRPlaybackQueueSubscriptionController_addRequest___block_invoke_2;
  block[3] = &unk_1E30C6A78;
  objc_copyWeak(&v6, &location);
  v5 = *(id *)(a1 + 40);
  dispatch_after(v2, v3, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)addRequest:(id)a3
{
  void *v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  objc_msgSend(a3, "requestIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    queue = self->_queue;
    block[1] = 3221225472;
    block[2] = __52__MRPlaybackQueueSubscriptionController_addRequest___block_invoke;
    block[3] = &unk_1E30C5F40;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    dispatch_sync(queue, block);

    v4 = v6;
  }

}

- (void)subscribeToPlaybackQueue:(id)a3 forRequest:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;
  MRPlaybackQueueSubscriptionController *v11;
  id v12;

  v8 = a3;
  v6 = a4;
  if (v8)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__MRPlaybackQueueSubscriptionController_subscribeToPlaybackQueue_forRequest___block_invoke;
    block[3] = &unk_1E30C7328;
    v10 = v6;
    v11 = self;
    v12 = v8;
    dispatch_sync(queue, block);

  }
}

void __83__MRPlaybackQueueSubscriptionController_requestForSubscribedContentItemIdentifier___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(a1[4] + 8);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v7, "second", (_QWORD)v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "containsObject:", a1[5]);

        if (v9)
        {
          objc_msgSend(v7, "first");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
          if (v11)
          {
            objc_msgSend(v11, "mergeFrom:", v10);
          }
          else
          {
            v12 = objc_msgSend(v10, "copy");
            v13 = *(_QWORD *)(a1[6] + 8);
            v14 = *(void **)(v13 + 40);
            *(_QWORD *)(v13 + 40) = v12;

          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MRPlaybackQueueSubscriptionController_invalidate__block_invoke;
  block[3] = &unk_1E30C5CA8;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __52__MRPlaybackQueueSubscriptionController_addRequest___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[MRPlaybackQueueSubscriptionController _removeRequestID:]((uint64_t)WeakRetained, *(void **)(a1 + 32));

}

- (void)_removeRequestID:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v3 = a2;
  if (a1 && v3)
  {
    v4 = *(NSObject **)(a1 + 32);
    block[1] = 3221225472;
    block[2] = __58__MRPlaybackQueueSubscriptionController__removeRequestID___block_invoke;
    block[3] = &unk_1E30C5F40;
    block[4] = a1;
    v5 = v3;
    block[0] = MEMORY[0x1E0C809B0];
    v7 = v3;
    dispatch_sync(v4, block);

    v3 = v5;
  }

}

- (id)filteredContentItemsBySubscriptionsForContentItems:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = (void *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__MRPlaybackQueueSubscriptionController_filteredContentItemsBySubscriptionsForContentItems___block_invoke;
  v10[3] = &unk_1E30CE7E8;
  v11 = v6;
  v7 = v6;
  -[MRPlaybackQueueSubscriptionController enumerateFilteredContentItemsBySubscriptionsForContentItems:block:](self, "enumerateFilteredContentItemsBySubscriptionsForContentItems:block:", v5, v10);

  v8 = (void *)objc_msgSend(v7, "copy");
  return v8;
}

- (void)enumerateFilteredContentItemsBySubscriptionsForContentItems:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *, _BYTE *);
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, void *, _BYTE *))a4;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[MRPlaybackQueueSubscriptionController requestForSubscribedContentItemIdentifier:](self, "requestForSubscribedContentItemIdentifier:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = MRContentItemCreateFromRequest(v13, v15);
          if (v16)
          {
            v17 = 0;
            v7[2](v7, v16, v15, &v17);
            if (v17)
            {

              goto LABEL_14;
            }
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_14:

}

- (id)requestForSubscribedContentItemIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__37;
  v16 = __Block_byref_object_dispose__37;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__MRPlaybackQueueSubscriptionController_requestForSubscribedContentItemIdentifier___block_invoke;
  block[3] = &unk_1E30C8C28;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __92__MRPlaybackQueueSubscriptionController_filteredContentItemsBySubscriptionsForContentItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!MRContentItemIsEmpty(v3))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

uint64_t __52__MRPlaybackQueueSubscriptionController_hasRequest___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 16), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (BOOL)hasRequest:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MRPlaybackQueueSubscriptionController_hasRequest___block_invoke;
  block[3] = &unk_1E30C74D0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p playerPath=%@>"), objc_opt_class(), self, self->_playerPath);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MRPlaybackQueueSubscriptionController)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MRPlaybackQueueSubscriptionController *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *requestFilters;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSMutableSet *requests;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  MSVMutableBidirectionalDictionary *offsets;
  MRPlaybackQueueSubscriptionController *v22;
  _QWORD v24[3];
  _QWORD v25[2];
  _QWORD v26[6];

  v26[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("playerPath"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[MRPlaybackQueueSubscriptionController initWithPlayerPath:](self, "initWithPlayerPath:", v5);
    if (v6)
    {
      v7 = (void *)MEMORY[0x1E0C99E60];
      v26[0] = objc_opt_class();
      v26[1] = objc_opt_class();
      v26[2] = objc_opt_class();
      v26[3] = objc_opt_class();
      v26[4] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setWithArray:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("requestFilters"));
      v10 = objc_claimAutoreleasedReturnValue();
      requestFilters = v6->_requestFilters;
      v6->_requestFilters = (NSMutableArray *)v10;

      v12 = (void *)MEMORY[0x1E0C99E60];
      v25[0] = objc_opt_class();
      v25[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithArray:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("requests"));
      v15 = objc_claimAutoreleasedReturnValue();
      requests = v6->_requests;
      v6->_requests = (NSMutableSet *)v15;

      v17 = (void *)MEMORY[0x1E0C99E60];
      v24[0] = objc_opt_class();
      v24[1] = objc_opt_class();
      v24[2] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setWithArray:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("offsets"));
      v20 = objc_claimAutoreleasedReturnValue();
      offsets = v6->_offsets;
      v6->_offsets = (MSVMutableBidirectionalDictionary *)v20;

    }
    self = v6;
    v22 = self;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  MRPlaybackQueueSubscriptionController *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__MRPlaybackQueueSubscriptionController_encodeWithCoder___block_invoke;
  block[3] = &unk_1E30C5F40;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __57__MRPlaybackQueueSubscriptionController_encodeWithCoder___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("playerPath"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("requestFilters"));
  objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("requests"));
  return objc_msgSend(*(id *)(a1 + 32), "encodeObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("offsets"));
}

- (void)restoreStateFromController:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *queue;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD block[5];
  id v16;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRPlaybackQueueClient.m"), 106, CFSTR("Unexpected class attempting to restore controller: %@"), objc_opt_class());

  }
  objc_msgSend(v5, "playerPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRPlaybackQueueSubscriptionController playerPath](self, "playerPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playerPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRPlaybackQueueSubscriptionController playerPath](self, "playerPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRPlaybackQueueClient.m"), 107, CFSTR("Attempting to restore state for unrelated player path: %@ vs %@"), v12, v13);

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__MRPlaybackQueueSubscriptionController_restoreStateFromController___block_invoke;
  block[3] = &unk_1E30C5F40;
  block[4] = self;
  v16 = v5;
  v14 = v5;
  dispatch_sync(queue, block);

}

void __68__MRPlaybackQueueSubscriptionController_restoreStateFromController___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), *(id *)(*(_QWORD *)(a1 + 40) + 8));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(*(_QWORD *)(a1 + 40) + 16));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(*(_QWORD *)(a1 + 40) + 24));
}

- (void)removeRequest:(id)a3
{
  id v4;

  objc_msgSend(a3, "requestIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MRPlaybackQueueSubscriptionController _removeRequestID:]((uint64_t)self, v4);

}

- (id)contentItemIdentifierForOffset:(int64_t)a3
{
  NSObject *queue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__37;
  v11 = __Block_byref_object_dispose__37;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__MRPlaybackQueueSubscriptionController_contentItemIdentifierForOffset___block_invoke;
  block[3] = &unk_1E30CA610;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(queue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __72__MRPlaybackQueueSubscriptionController_contentItemIdentifierForOffset___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1[4] + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a1[6]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)offsetForIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__37;
  v16 = __Block_byref_object_dispose__37;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MRPlaybackQueueSubscriptionController_offsetForIdentifier___block_invoke;
  block[3] = &unk_1E30C74D0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __61__MRPlaybackQueueSubscriptionController_offsetForIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 24), "keyForObject:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)augmentCommandOptions:(id)a3 forCommand:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  NSObject *queue;
  id *v13;
  id *v14;
  id *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  BOOL v21;
  NSObject *v22;
  id *v23;
  id *v24;
  id *v25;
  _QWORD *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  _QWORD block[5];
  id v41;
  id v42;
  id v43;

  v4 = *(_QWORD *)&a4;
  v27 = a3;
  v6 = MRMediaRemoteCopyCommandDescription(v4);
  if (MRMediaRemoteCommandRequiresSourcePositionOption(v4))
  {
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionPlaybackQueueOffset"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionContentItemID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
      v10 = v8 == 0;
    else
      v10 = 0;
    if (v10)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __74__MRPlaybackQueueSubscriptionController_augmentCommandOptions_forCommand___block_invoke;
      block[3] = &unk_1E30C9008;
      block[4] = self;
      v13 = &v41;
      v41 = v7;
      v14 = &v42;
      v42 = v27;
      v15 = &v43;
      v43 = v6;
      v16 = block;
    }
    else
    {
      if (v8)
        v11 = v7 == 0;
      else
        v11 = 0;
      if (!v11)
        goto LABEL_14;
      queue = self->_queue;
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __74__MRPlaybackQueueSubscriptionController_augmentCommandOptions_forCommand___block_invoke_28;
      v36[3] = &unk_1E30C9008;
      v36[4] = self;
      v13 = &v37;
      v37 = v8;
      v14 = &v38;
      v38 = v27;
      v15 = &v39;
      v39 = v6;
      v16 = v36;
    }
    dispatch_sync(queue, v16);

LABEL_14:
  }
  if (MRMediaRemoteCommandRequiresDestinationPositionOption(v4))
  {
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionPlaybackQueueDestinationOffset"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionInsertAfterContentItemID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17)
      v20 = v18 == 0;
    else
      v20 = 0;
    if (v20)
    {
      v22 = self->_queue;
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __74__MRPlaybackQueueSubscriptionController_augmentCommandOptions_forCommand___block_invoke_29;
      v32[3] = &unk_1E30C9008;
      v32[4] = self;
      v23 = &v33;
      v33 = v17;
      v24 = &v34;
      v34 = v27;
      v25 = &v35;
      v35 = v6;
      v26 = v32;
    }
    else
    {
      if (v18)
        v21 = v17 == 0;
      else
        v21 = 0;
      if (!v21)
        goto LABEL_28;
      v22 = self->_queue;
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __74__MRPlaybackQueueSubscriptionController_augmentCommandOptions_forCommand___block_invoke_30;
      v28[3] = &unk_1E30C9008;
      v28[4] = self;
      v23 = &v29;
      v29 = v18;
      v24 = &v30;
      v30 = v27;
      v25 = &v31;
      v31 = v6;
      v26 = v28;
    }
    dispatch_sync(v22, v26);

LABEL_28:
  }

}

void __74__MRPlaybackQueueSubscriptionController_augmentCommandOptions_forCommand___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v2, CFSTR("kMRMediaRemoteOptionContentItemID"));
  }
  else
  {
    _MRLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 56);
      v6 = 138412802;
      v7 = CFSTR("kMRMediaRemoteOptionPlaybackQueueOffset");
      v8 = 2112;
      v9 = v4;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[MRPlaybackQueueClient] No ContentItem in playback queue with provided '%@':%@ for command <%@>", (uint8_t *)&v6, 0x20u);
    }

  }
}

void __74__MRPlaybackQueueSubscriptionController_augmentCommandOptions_forCommand___block_invoke_28(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "keyForObject:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v2, CFSTR("kMRMediaRemoteOptionPlaybackQueueOffset"));
  }
  else
  {
    _MRLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(_QWORD *)(a1 + 56);
      v6 = 138412802;
      v7 = CFSTR("kMRMediaRemoteOptionContentItemID");
      v8 = 2112;
      v9 = v4;
      v10 = 2112;
      v11 = v5;
      _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "[MRPlaybackQueueClient] No ContentItem in playback queue with provided '%@':%@ for command <%@>", (uint8_t *)&v6, 0x20u);
    }

  }
}

void __74__MRPlaybackQueueSubscriptionController_augmentCommandOptions_forCommand___block_invoke_29(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(*(id *)(a1 + 40), "longValue") - 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v4, CFSTR("kMRMediaRemoteOptionInsertAfterContentItemID"));
  }
  else
  {
    _MRLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 56);
      v8 = 138412802;
      v9 = CFSTR("kMRMediaRemoteOptionPlaybackQueueDestinationOffset");
      v10 = 2112;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "[MRPlaybackQueueClient] No ContentItem in playback queue with provided '%@':%@ for command <%@>", (uint8_t *)&v8, 0x20u);
    }

  }
}

void __74__MRPlaybackQueueSubscriptionController_augmentCommandOptions_forCommand___block_invoke_30(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const __CFString *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "keyForObject:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v2, "longValue") + 1);
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v4, CFSTR("kMRMediaRemoteOptionPlaybackQueueDestinationOffset"));
  }
  else
  {
    _MRLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 56);
      v7 = 138412802;
      v8 = CFSTR("kMRMediaRemoteOptionInsertAfterContentItemID");
      v9 = 2112;
      v10 = v5;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "[MRPlaybackQueueClient] No ContentItem in playback queue with provided '%@':%@ for command <%@>", (uint8_t *)&v7, 0x20u);
    }
  }

}

uint64_t __58__MRPlaybackQueueSubscriptionController__removeRequestID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (MRPlayerPath)playerPath
{
  return self->_playerPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerPath, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_offsets, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_requestFilters, 0);
}

@end
