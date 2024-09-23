@implementation NLTaggerAssetRequest

+ (void)checkAssetRequests
{
  BOOL v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _QWORD block[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (_assetRequestQueue)
    v2 = _assetRequests == 0;
  else
    v2 = 1;
  if (!v2)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__1;
    v16 = __Block_byref_object_dispose__1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__NLTaggerAssetRequest_checkAssetRequests__block_invoke;
    block[3] = &unk_1E4A3AB00;
    block[4] = &v12;
    dispatch_sync((dispatch_queue_t)_assetRequestQueue, block);
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v3 = (id)v13[5];
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v18, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v8;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v8 != v5)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "completeWithResult:error:", 0, 0, (_QWORD)v7);
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v18, 16);
      }
      while (v4);
    }

    _Block_object_dispose(&v12, 8);
  }
}

uint64_t __42__NLTaggerAssetRequest_checkAssetRequests__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
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
  v2 = (id)_assetRequests;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "isFulfilled", (_QWORD)v9))
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  return objc_msgSend((id)_assetRequests, "removeObjectsInArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

- (NLTaggerAssetRequest)initWithLanguage:(id)a3 tagScheme:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NLTaggerAssetRequest *v13;
  NLTaggerAssetRequest *v14;
  NLTaggerAssetRequest *v15;
  uint64_t v16;
  id completionHandler;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  v13 = 0;
  if (v9 && v10 && v11)
  {
    v19.receiver = self;
    v19.super_class = (Class)NLTaggerAssetRequest;
    v14 = -[NLTaggerAssetRequest init](&v19, sel_init);
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_language, a3);
      objc_storeStrong((id *)&v15->_tagScheme, a4);
      v16 = MEMORY[0x1A8592F80](v12);
      completionHandler = v15->_completionHandler;
      v15->_completionHandler = (id)v16;

    }
    self = v15;
    v13 = self;
  }

  return v13;
}

- (BOOL)isFulfilled
{
  NLTaggerAssetRequest *v2;
  void *v3;

  v2 = self;
  +[NLTagger availableTagSchemesForLanguage:](NLTagger, "availableTagSchemesForLanguage:", self->_language);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "containsObject:", v2->_tagScheme);

  return (char)v2;
}

- (void)completeWithResult:(int64_t)a3 error:(id)a4
{
  (*((void (**)(void))self->_completionHandler + 2))();
}

- (void)waitForFulfillment
{
  _QWORD block[5];

  if (waitForFulfillment_onceToken != -1)
    dispatch_once(&waitForFulfillment_onceToken, &__block_literal_global_124);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__NLTaggerAssetRequest_waitForFulfillment__block_invoke_2;
  block[3] = &unk_1E4A3A680;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)_assetRequestQueue, block);
}

void __42__NLTaggerAssetRequest_waitForFulfillment__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  id v2;
  void *v3;

  v0 = dispatch_queue_create("com.apple.NaturalLanguage.AssetRequest", 0);
  v1 = (void *)_assetRequestQueue;
  _assetRequestQueue = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = (void *)_assetRequests;
  _assetRequests = (uint64_t)v2;

}

uint64_t __42__NLTaggerAssetRequest_waitForFulfillment__block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)_assetRequests, "addObject:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_tagScheme, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end
