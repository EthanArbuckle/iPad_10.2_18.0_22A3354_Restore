@implementation LNSiriVocabulary

- (LNSiriVocabulary)initWithBundleIdentifier:(id)a3 donatorClient:(id)a4 picker:(id)a5
{
  id v9;
  id v10;
  id v11;
  LNSiriVocabulary *v12;
  uint64_t v13;
  NSString *bundleIdentifier;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  uint64_t v19;
  void *v20;
  LNDebouncer *v21;
  OS_dispatch_queue *v22;
  LNSiriVocabulary *v23;
  id v24;
  uint64_t v25;
  LNDebouncer *debouncer;
  NSMutableArray *v27;
  NSMutableArray *completions;
  LNSiriVocabulary *v29;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  LNSiriVocabulary *v35;
  id v36;
  _QWORD aBlock[4];
  id v38;
  id location;
  objc_super v40;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNSiriVocabulary.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNSiriVocabulary.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNSiriVocabulary.m"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("picker"));

LABEL_4:
  v40.receiver = self;
  v40.super_class = (Class)LNSiriVocabulary;
  v12 = -[LNSiriVocabulary init](&v40, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    bundleIdentifier = v12->_bundleIdentifier;
    v12->_bundleIdentifier = (NSString *)v13;

    objc_storeStrong((id *)&v12->_donatorClient, a4);
    objc_storeStrong((id *)&v12->_vocabularyPicker, a5);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INITIATED, 0);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = dispatch_queue_create("com.apple.link.LNSiriVocabulary.internal-queue", v16);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v17;

    objc_initWeak(&location, v12);
    v19 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__LNSiriVocabulary_initWithBundleIdentifier_donatorClient_picker___block_invoke;
    aBlock[3] = &unk_1E45DE240;
    objc_copyWeak(&v38, &location);
    v20 = _Block_copy(aBlock);
    v21 = [LNDebouncer alloc];
    v22 = v12->_queue;
    v34[0] = v19;
    v34[1] = 3221225472;
    v34[2] = __66__LNSiriVocabulary_initWithBundleIdentifier_donatorClient_picker___block_invoke_3;
    v34[3] = &unk_1E45DD1E0;
    v23 = v12;
    v35 = v23;
    v24 = v20;
    v36 = v24;
    v25 = -[LNDebouncer initWithDelay:maxDelay:queue:block:](v21, "initWithDelay:maxDelay:queue:block:", v22, v34, 0.25, 1.0);
    debouncer = v23->_debouncer;
    v23->_debouncer = (LNDebouncer *)v25;

    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    completions = v23->_completions;
    v23->_completions = v27;

    v29 = v23;
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);

  }
  return v12;
}

- (void)setCorporaByPriority:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSArray *corpora;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *v14;
  NSArray *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (+[LNFeatureFlags isVocabularyDonationEnabled](LNFeatureFlags, "isVocabularyDonationEnabled"))
  {
    corpora = self->_corpora;
    if (corpora)
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v9 = corpora;
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v26;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v26 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v13++), "removeObserver:", self);
          }
          while (v11 != v13);
          v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v11);
      }

    }
    v14 = (NSArray *)objc_msgSend(v6, "copy");
    v15 = self->_corpora;
    self->_corpora = v14;

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v16 = self->_corpora;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v22;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v20++), "setObserver:", self, (_QWORD)v21);
        }
        while (v18 != v20);
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v18);
    }

    -[LNSiriVocabulary donateWithCompletionHandler:](self, "donateWithCompletionHandler:", v7);
  }

}

- (void)donateWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__LNSiriVocabulary_donateWithCompletionHandler___block_invoke;
  block[3] = &unk_1E45DD1E0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);
  -[LNDebouncer trigger](self->_debouncer, "trigger");

}

- (void)corpusContentsChanged:(id)a3 completionHandler:(id)a4
{
  id v5;

  v5 = a4;
  if (+[LNFeatureFlags isVocabularyDonationEnabled](LNFeatureFlags, "isVocabularyDonationEnabled"))
    -[LNSiriVocabulary donateWithCompletionHandler:](self, "donateWithCompletionHandler:", v5);

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSArray)corpora
{
  return self->_corpora;
}

- (void)setCorpora:(id)a3
{
  objc_storeStrong((id *)&self->_corpora, a3);
}

- (LNVocabularyDonator)donatorClient
{
  return self->_donatorClient;
}

- (LNVocabularyPicker)vocabularyPicker
{
  return self->_vocabularyPicker;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (LNDebouncer)debouncer
{
  return self->_debouncer;
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (void)setCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_completions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_debouncer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_vocabularyPicker, 0);
  objc_storeStrong((id *)&self->_donatorClient, 0);
  objc_storeStrong((id *)&self->_corpora, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

void __48__LNSiriVocabulary_donateWithCompletionHandler___block_invoke(uint64_t a1)
{
  const void *v2;
  void *v3;
  id v4;

  v2 = *(const void **)(a1 + 40);
  if (v2)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    v4 = _Block_copy(v2);
    objc_msgSend(v3, "addObject:", v4);

  }
}

void __66__LNSiriVocabulary_initWithBundleIdentifier_donatorClient_picker___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained[5];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__LNSiriVocabulary_initWithBundleIdentifier_donatorClient_picker___block_invoke_2;
  v8[3] = &unk_1E45DDE40;
  v9 = WeakRetained;
  v10 = v3;
  v6 = v3;
  v7 = WeakRetained;
  dispatch_async(v5, v8);

}

void __66__LNSiriVocabulary_initWithBundleIdentifier_donatorClient_picker___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "pickTermsFromCorpora:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "donateFullVocabularySet:completionHandler:", v2, *(_QWORD *)(a1 + 40));

}

uint64_t __66__LNSiriVocabulary_initWithBundleIdentifier_donatorClient_picker___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if (v7)
          (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllObjects", (_QWORD)v9);
}

+ (id)vocabularyForBundleIdentifier:(id)a3
{
  id v5;
  id v6;
  void *v7;
  LNSiriVocabulary *v8;
  id v9;
  void *v10;
  LNSiriVocabulary *v11;
  void *v12;
  void *v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNSiriVocabulary.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  if (vocabularyForBundleIdentifier__onceToken != -1)
    dispatch_once(&vocabularyForBundleIdentifier__onceToken, &__block_literal_global_7608);
  v6 = (id)vocabularyForBundleIdentifier__value;
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = [LNSiriVocabulary alloc];
    v9 = -[LNKoaClient initForBundleIdentifier:]([LNKoaClient alloc], "initForBundleIdentifier:", v5);
    v10 = (void *)objc_opt_new();
    v11 = -[LNSiriVocabulary initWithBundleIdentifier:donatorClient:picker:](v8, "initWithBundleIdentifier:donatorClient:picker:", v5, v9, v10);

    objc_msgSend(v6, "setObject:forKey:", v11, v5);
  }
  objc_msgSend(v6, "objectForKey:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __50__LNSiriVocabulary_vocabularyForBundleIdentifier___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)vocabularyForBundleIdentifier__value;
  vocabularyForBundleIdentifier__value = (uint64_t)v0;

}

@end
