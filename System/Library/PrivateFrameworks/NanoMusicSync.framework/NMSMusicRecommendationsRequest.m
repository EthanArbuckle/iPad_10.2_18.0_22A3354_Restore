@implementation NMSMusicRecommendationsRequest

- (void)performWithResponseHandler:(id)a3
{
  id v4;
  dispatch_queue_t v5;
  id v6;
  NSObject *v7;
  _QWORD block[5];
  dispatch_queue_t v9;
  id v10;

  v4 = a3;
  v5 = dispatch_queue_create("com.apple.NanoMusicSync.NMSMusicRecommendationsRequest", 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__NMSMusicRecommendationsRequest_performWithResponseHandler___block_invoke;
  block[3] = &unk_24D647098;
  block[4] = self;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  dispatch_async(v7, block);

}

void __61__NMSMusicRecommendationsRequest_performWithResponseHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NMSMusicRecommendationsRequestContext *v4;

  v4 = objc_alloc_init(NMSMusicRecommendationsRequestContext);
  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumNumberOfRecentMusicModelObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSMusicRecommendationsRequestContext setMinimumNumberOfRecentMusicModelObjects:](v4, "setMinimumNumberOfRecentMusicModelObjects:", objc_msgSend(v3, "unsignedIntegerValue"));

  objc_msgSend(*(id *)(a1 + 32), "_continueToRecentMusicRequestWithContext:queue:responseHandler:", v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_continueToRecentMusicRequestWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5
{
  NSObject *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_assert_queue_V2(v8);
  +[NMSSubscriptionManager sharedManager](NMSSubscriptionManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasCapability:", 1);

  if (v11)
  {
    if (self->_useCachedDataOnly
      && (-[NMSMusicRecommendationsRequest _unarchivedCombinedResponsesDictionary](self, "_unarchivedCombinedResponsesDictionary"), v12 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("recommendationsArray")), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, v12, v13))
    {
      -[NMSMusicRecommendationsRequest _continueToLegacyForYouRequestWithContext:queue:responseHandler:](self, "_continueToLegacyForYouRequestWithContext:queue:responseHandler:", v14, v8, v9);
    }
    else
    {
      -[NMSMusicRecommendationsRequest _continueToHeavyRotationRequestWithContext:queue:responseHandler:](self, "_continueToHeavyRotationRequestWithContext:queue:responseHandler:", v14, v8, v9);
    }
  }
  else
  {
    -[NMSMusicRecommendationsRequest _continueToLibraryRecentMusicRecommedationsWithContext:queue:responseHandler:](self, "_continueToLibraryRecentMusicRecommedationsWithContext:queue:responseHandler:", v14, v8, v9);
  }

}

- (void)_continueToHeavyRotationRequestWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  NMSMusicRecommendationsRequest *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(v9);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __99__NMSMusicRecommendationsRequest__continueToHeavyRotationRequestWithContext_queue_responseHandler___block_invoke;
  v14[3] = &unk_24D6470E8;
  v15 = v9;
  v16 = v8;
  v17 = self;
  v18 = v10;
  v11 = v8;
  v12 = v10;
  v13 = v9;
  -[NMSMusicRecommendationsRequest _performHeavyRotationRequestWithCompletion:](self, "_performHeavyRotationRequestWithCompletion:", v14);

}

void __99__NMSMusicRecommendationsRequest__continueToHeavyRotationRequestWithContext_queue_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __99__NMSMusicRecommendationsRequest__continueToHeavyRotationRequestWithContext_queue_responseHandler___block_invoke_2;
  v10[3] = &unk_24D6470C0;
  v11 = v6;
  v16 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 40);
  v13 = v5;
  v14 = *(_QWORD *)(a1 + 48);
  v15 = *(id *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, v10);

}

uint64_t __99__NMSMusicRecommendationsRequest__continueToHeavyRotationRequestWithContext_queue_responseHandler___block_invoke_2(uint64_t a1)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  if (*(_QWORD *)(a1 + 32))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "setHeavyRotationResponse:", *(_QWORD *)(a1 + 48));
  v3 = objc_msgSend(*(id *)(a1 + 40), "numberOfRecentMusicModelObjects");
  v4 = objc_msgSend(*(id *)(a1 + 40), "minimumNumberOfRecentMusicModelObjects");
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 72);
  if (v3 >= v4)
    return objc_msgSend(v6, "_continueToProcessResultsWithContext:queue:responseHandler:", v5, v7, v8);
  else
    return objc_msgSend(v6, "_continueToLibraryRecentMusicRecommedationsWithContext:queue:responseHandler:", v5, v7, v8);
}

- (void)_continueToLibraryRecentMusicRecommedationsWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  NMSMusicRecommendationsRequest *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(v9);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __111__NMSMusicRecommendationsRequest__continueToLibraryRecentMusicRecommedationsWithContext_queue_responseHandler___block_invoke;
  v14[3] = &unk_24D6470E8;
  v15 = v9;
  v16 = v8;
  v17 = self;
  v18 = v10;
  v11 = v8;
  v12 = v10;
  v13 = v9;
  -[NMSMusicRecommendationsRequest _performLibraryRecentMusicRequestWithCompletion:](self, "_performLibraryRecentMusicRequestWithCompletion:", v14);

}

void __111__NMSMusicRecommendationsRequest__continueToLibraryRecentMusicRecommedationsWithContext_queue_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __111__NMSMusicRecommendationsRequest__continueToLibraryRecentMusicRecommedationsWithContext_queue_responseHandler___block_invoke_2;
  v10[3] = &unk_24D6470C0;
  v11 = v6;
  v16 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 40);
  v13 = v5;
  v14 = *(_QWORD *)(a1 + 48);
  v15 = *(id *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, v10);

}

uint64_t __111__NMSMusicRecommendationsRequest__continueToLibraryRecentMusicRecommedationsWithContext_queue_responseHandler___block_invoke_2(uint64_t a1)
{
  unint64_t v3;
  void *v4;
  int v5;
  _BYTE *v6;
  void *v7;
  void *v8;

  if (*(_QWORD *)(a1 + 32))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "setLibraryRecentMusicResponse:", *(_QWORD *)(a1 + 48));
  v3 = objc_msgSend(*(id *)(a1 + 40), "numberOfRecentMusicModelObjects");
  if (v3 >= objc_msgSend(*(id *)(a1 + 40), "minimumNumberOfRecentMusicModelObjects"))
    return objc_msgSend(*(id *)(a1 + 56), "_continueToProcessResultsWithContext:queue:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  +[NMSSubscriptionManager sharedManager](NMSSubscriptionManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasCapability:", 1);

  if (!v5)
    return objc_msgSend(*(id *)(a1 + 56), "_continueToProcessResultsWithContext:queue:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  v6 = *(_BYTE **)(a1 + 56);
  if (v6[8]
    && (objc_msgSend(v6, "_unarchivedCombinedResponsesDictionary"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("editorial-cachedLoadedOutput")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v6 = *(_BYTE **)(a1 + 56),
        v8))
  {
    return objc_msgSend(v6, "_continueToLegacyEditorialRequestWithContext:queue:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  }
  else
  {
    return objc_msgSend(v6, "_continueToStarterPackMultiplexRequestWithContext:queue:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  }
}

- (void)_continueToStarterPackMultiplexRequestWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  NMSMusicRecommendationsRequest *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(v9);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __106__NMSMusicRecommendationsRequest__continueToStarterPackMultiplexRequestWithContext_queue_responseHandler___block_invoke;
  v14[3] = &unk_24D6470E8;
  v15 = v9;
  v16 = self;
  v17 = v8;
  v18 = v10;
  v11 = v8;
  v12 = v10;
  v13 = v9;
  -[NMSMusicRecommendationsRequest _performStarterPackMultiplexRequestWithCompletion:](self, "_performStarterPackMultiplexRequestWithCompletion:", v14);

}

void __106__NMSMusicRecommendationsRequest__continueToStarterPackMultiplexRequestWithContext_queue_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __106__NMSMusicRecommendationsRequest__continueToStarterPackMultiplexRequestWithContext_queue_responseHandler___block_invoke_2;
  v12[3] = &unk_24D6470C0;
  v13 = v6;
  v18 = *(id *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v14 = v5;
  v15 = v8;
  v16 = v9;
  v17 = *(id *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, v12);

}

void __106__NMSMusicRecommendationsRequest__continueToStarterPackMultiplexRequestWithContext_queue_responseHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "results");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstSection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "loadAdditionalContentURL");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "_continueToStarterPackRoomRequestWithURL:context:queue:responseHandler:", v4, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  }
}

- (void)_continueToStarterPackRoomRequestWithURL:(id)a3 context:(id)a4 queue:(id)a5 responseHandler:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  NMSMusicRecommendationsRequest *v20;
  id v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  dispatch_assert_queue_V2(v11);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __105__NMSMusicRecommendationsRequest__continueToStarterPackRoomRequestWithURL_context_queue_responseHandler___block_invoke;
  v17[3] = &unk_24D6470E8;
  v18 = v11;
  v19 = v10;
  v20 = self;
  v21 = v12;
  v14 = v10;
  v15 = v12;
  v16 = v11;
  -[NMSMusicRecommendationsRequest _performStarterPackRoomRequestWithURL:completion:](self, "_performStarterPackRoomRequestWithURL:completion:", v13, v17);

}

void __105__NMSMusicRecommendationsRequest__continueToStarterPackRoomRequestWithURL_context_queue_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __105__NMSMusicRecommendationsRequest__continueToStarterPackRoomRequestWithURL_context_queue_responseHandler___block_invoke_2;
  v10[3] = &unk_24D6470C0;
  v11 = v6;
  v16 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 40);
  v13 = v5;
  v14 = *(_QWORD *)(a1 + 48);
  v15 = *(id *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, v10);

}

uint64_t __105__NMSMusicRecommendationsRequest__continueToStarterPackRoomRequestWithURL_context_queue_responseHandler___block_invoke_2(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "setStarterPackResponse:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 56), "_continueToProcessResultsWithContext:queue:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)_continueToProcessResultsWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  dispatch_assert_queue_V2(v9);
  if (self->_useCachedDataOnly)
    -[NMSMusicRecommendationsRequest _finishWithContext:queue:responseHandler:](self, "_finishWithContext:queue:responseHandler:", v10, v9, v8);
  else
    -[NMSMusicRecommendationsRequest _continueToLibraryImportWithContext:queue:responseHandler:](self, "_continueToLibraryImportWithContext:queue:responseHandler:", v10, v9, v8);

}

- (void)_continueToLibraryImportWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;
  NMSMusicRecommendationsRequest *v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(v9);
  objc_msgSend(v8, "modelObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "filteredSetUsingPredicate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __92__NMSMusicRecommendationsRequest__continueToLibraryImportWithContext_queue_responseHandler___block_invoke_2;
  v17[3] = &unk_24D647178;
  v18 = v9;
  v19 = self;
  v20 = v8;
  v21 = v10;
  v14 = v8;
  v15 = v10;
  v16 = v9;
  -[NMSMusicRecommendationsRequest _performLibraryImportChangeRequestWithModelObjects:completion:](self, "_performLibraryImportChangeRequestWithModelObjects:completion:", v13, v17);

}

uint64_t __92__NMSMusicRecommendationsRequest__continueToLibraryImportWithContext_queue_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "nms_prefersCatalogRepresentation");
}

void __92__NMSMusicRecommendationsRequest__continueToLibraryImportWithContext_queue_responseHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__NMSMusicRecommendationsRequest__continueToLibraryImportWithContext_queue_responseHandler___block_invoke_3;
  block[3] = &unk_24D647150;
  v10 = v3;
  v5 = *(id *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v14 = v5;
  v11 = v6;
  v12 = v7;
  v13 = *(id *)(a1 + 32);
  v8 = v3;
  dispatch_async(v4, block);

}

uint64_t __92__NMSMusicRecommendationsRequest__continueToLibraryImportWithContext_queue_responseHandler___block_invoke_3(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 40), "_finishWithContext:queue:responseHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_finishWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  NSData *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  NMSMusicRecommendationsResponse *v30;
  void *v31;
  NMSMusicRecommendationsResponse *v32;
  id v33;

  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)a4);
  v10 = self->_cachedData;
  if (!self->_useCachedDataOnly)
  {
    v11 = (void *)objc_opt_new();
    if (objc_msgSend(v8, "minimumNumberOfRecentMusicModelObjects"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "minimumNumberOfRecentMusicModelObjects"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("minimumNumberOfRecentMusicModelObjects"));

    }
    objc_msgSend(v8, "forYouResponse");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "nms_cachedRecommendationsArray");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v8, "forYouResponse");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "nms_cachedRecommendationsArray");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v16, CFSTR("recommendationsArray"));

    }
    objc_msgSend(v8, "forYouResponse");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "nms_cachedStoreItemMetadataResults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v8, "forYouResponse");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "nms_cachedStoreItemMetadataResults");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v20, CFSTR("storeItemMetadataResults"));

    }
    objc_msgSend(v8, "editorialBrowseResponse");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "nms_cachedLoadedOutput");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v8, "editorialBrowseResponse");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "nms_cachedLoadedOutput");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v24, CFSTR("editorial-cachedLoadedOutput"));

    }
    v25 = (void *)MEMORY[0x24BDD1618];
    v26 = (void *)objc_msgSend(v11, "copy");
    v33 = 0;
    objc_msgSend(v25, "archivedDataWithRootObject:requiringSecureCoding:error:", v26, 1, &v33);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v33;

    if (v28)
    {
      NMLogForCategory(5);
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[NMSMusicRecommendationsRequest _finishWithContext:queue:responseHandler:].cold.1();

    }
    v10 = (NSData *)v27;
  }
  v30 = [NMSMusicRecommendationsResponse alloc];
  objc_msgSend(v8, "recommendations");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = -[NMSMusicRecommendationsResponse initWithCachedData:recommendations:](v30, "initWithCachedData:recommendations:", v10, v31);

  if (v9)
    v9[2](v9, v32, 0);

}

- (void)_performHeavyRotationRequestWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  __CFString *v16;
  id v17;
  id v18;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE6B298]);
  objc_msgSend(v5, "setDefaultMusicRequestProperties");
  objc_msgSend(MEMORY[0x24BE6B2A0], "allSupportedSectionProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSectionProperties:", v6);

  objc_msgSend(MEMORY[0x24BE6B2A0], "allSupportedItemProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItemProperties:", v7);

  -[NMSMusicRecommendationsRequest _heavyRotationCacheURL](self, "_heavyRotationCacheURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCacheURL:", v8);

  objc_msgSend(v5, "setCachePolicy:", 3);
  if (self->_useCachedDataOnly)
  {
    objc_msgSend(v5, "setCachePolicy:", 1);
    -[NMSMusicRecommendationsRequest _unarchivedCombinedResponsesDictionary](self, "_unarchivedCombinedResponsesDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("HeavyRotationResponse"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[NMSMusicRecommendationsRequest _heavyRotationCacheURL](self, "_heavyRotationCacheURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSMusicRecommendationsRequest _writeData:toURL:](self, "_writeData:toURL:", v10, v11);

    v12 = CFSTR("Defaults");
  }
  else
  {
    v12 = CFSTR("Store");
  }
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __77__NMSMusicRecommendationsRequest__performHeavyRotationRequestWithCompletion___block_invoke;
  v15[3] = &unk_24D6471A0;
  v16 = (__CFString *)v12;
  v17 = v5;
  v18 = v4;
  v13 = v4;
  v14 = v5;
  objc_msgSend(v14, "performWithResponseHandler:", v15);

}

void __77__NMSMusicRecommendationsRequest__performHeavyRotationRequestWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  NMLogForCategory(5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __77__NMSMusicRecommendationsRequest__performHeavyRotationRequestWithCompletion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (%{public}@) (Heavy Rotation) Got heavy rotation response: %@", (uint8_t *)&v11, 0x16u);
  }

  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

- (void)_performLibraryRecentMusicRequestWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  NSObject *queue;
  void *v55;
  id obj;
  id obja;
  void *v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  _QWORD *v62;
  _QWORD v63[4];
  id v64;
  NSObject *v65;
  id v66;
  _QWORD *v67;
  _QWORD *v68;
  _QWORD v69[5];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD block[4];
  id v75;
  _QWORD *v76;
  _QWORD v77[4];
  id v78;
  NSObject *v79;
  id v80;
  _QWORD *v81;
  _QWORD *v82;
  _QWORD v83[5];
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[4];
  id v89;
  _QWORD *v90;
  _QWORD *v91;
  _QWORD *v92;
  _QWORD *v93;
  _QWORD v94[5];
  id v95;
  _QWORD v96[5];
  id v97;
  _QWORD v98[5];
  id v99;
  _QWORD v100[5];
  id v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  _QWORD v105[3];
  _BYTE v106[128];
  _QWORD v107[5];
  void *v108;
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v100[0] = 0;
  v100[1] = v100;
  v100[2] = 0x3032000000;
  v100[3] = __Block_byref_object_copy__2;
  v100[4] = __Block_byref_object_dispose__2;
  v101 = 0;
  v98[0] = 0;
  v98[1] = v98;
  v98[2] = 0x3032000000;
  v98[3] = __Block_byref_object_copy__2;
  v98[4] = __Block_byref_object_dispose__2;
  v99 = 0;
  v96[0] = 0;
  v96[1] = v96;
  v96[2] = 0x3032000000;
  v96[3] = __Block_byref_object_copy__2;
  v96[4] = __Block_byref_object_dispose__2;
  v97 = 0;
  v94[0] = 0;
  v94[1] = v94;
  v94[2] = 0x3032000000;
  v94[3] = __Block_byref_object_copy__2;
  v94[4] = __Block_byref_object_dispose__2;
  v95 = 0;
  queue = dispatch_queue_create("com.apple.NanoMusicSync.NMSMusicRecommendationsRequest.LibraryCompletion", 0);
  v88[0] = MEMORY[0x24BDAC760];
  v88[1] = 3221225472;
  v88[2] = __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke;
  v88[3] = &unk_24D6471C8;
  v90 = v100;
  v91 = v96;
  v92 = v98;
  v93 = v94;
  v51 = v3;
  v89 = v51;
  v55 = (void *)MEMORY[0x219A03B50](v88);
  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryRecommendationPlaylists");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v53, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    obj = v53;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v109, 16);
    v58 = v5;
    if (v6)
    {
      v7 = *(_QWORD *)v85;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v85 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * v8);
          v10 = objc_alloc(MEMORY[0x24BDDC758]);
          objc_msgSend(MEMORY[0x24BDDC968], "identityKind");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v83[0] = MEMORY[0x24BDAC760];
          v83[1] = 3221225472;
          v83[2] = __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_2;
          v83[3] = &unk_24D6471F0;
          v83[4] = v9;
          v12 = (void *)objc_msgSend(v10, "initWithModelKind:block:", v11, v83);

          objc_msgSend(v58, "addObject:", v12);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v109, 16);
      }
      while (v6);
    }

    v13 = objc_alloc_init(MEMORY[0x24BDDC8F8]);
    objc_msgSend(v13, "setLabel:", CFSTR("Library Recommendation Playlists"));
    v14 = (void *)MEMORY[0x24BDDC948];
    v15 = NMSMPModelPlaylistVariantsNonFolder;
    v16 = (void *)MEMORY[0x24BDDC950];
    objc_msgSend(MEMORY[0x24BDDC9D8], "kindWithVariants:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v108, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "kindWithKinds:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "kindWithVariants:playlistEntryKind:options:", v15 & 0xFFFFFFFFFFFFFFFDLL, v19, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setItemKind:", v20);

    v21 = (void *)MEMORY[0x24BDDCB30];
    v22 = *MEMORY[0x24BDDBF18];
    v107[0] = *MEMORY[0x24BDDBF50];
    v107[1] = v22;
    v23 = *MEMORY[0x24BDDBF48];
    v107[2] = *MEMORY[0x24BDDBF58];
    v107[3] = v23;
    v107[4] = *MEMORY[0x24BDDBF68];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v107, 5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "propertySetWithProperties:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setItemProperties:", v25);

    objc_msgSend(v13, "setAllowedItemIdentifiers:", v58);
    v77[0] = MEMORY[0x24BDAC760];
    v77[1] = 3221225472;
    v77[2] = __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_3;
    v77[3] = &unk_24D647240;
    v26 = v13;
    v78 = v26;
    v79 = queue;
    v81 = v96;
    v82 = v100;
    v80 = v55;
    objc_msgSend(v26, "performWithResponseHandler:", v77);

    v27 = v58;
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_2_65;
    block[3] = &unk_24D647268;
    v76 = v100;
    v75 = v55;
    dispatch_async(queue, block);
    v27 = v75;
  }

  +[NMSyncDefaults sharedDefaults](NMSyncDefaults, "sharedDefaults");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "libraryRecommendationAlbums");
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v52, "count"))
  {
    v29 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    obja = v52;
    v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v70, v106, 16);
    v59 = v29;
    if (v30)
    {
      v31 = *(_QWORD *)v71;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v71 != v31)
            objc_enumerationMutation(obja);
          v33 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * v32);
          v34 = objc_alloc(MEMORY[0x24BDDC758]);
          objc_msgSend(MEMORY[0x24BDDC838], "identityKind");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v69[0] = MEMORY[0x24BDAC760];
          v69[1] = 3221225472;
          v69[2] = __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_3_67;
          v69[3] = &unk_24D6471F0;
          v69[4] = v33;
          v36 = (void *)objc_msgSend(v34, "initWithModelKind:block:", v35, v69);

          objc_msgSend(v59, "addObject:", v36);
          ++v32;
        }
        while (v30 != v32);
        v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v70, v106, 16);
      }
      while (v30);
    }

    v37 = objc_alloc_init(MEMORY[0x24BDDC8F8]);
    objc_msgSend(v37, "setLabel:", CFSTR("Library Recommendation Albums"));
    v38 = (void *)MEMORY[0x24BDDC830];
    objc_msgSend(MEMORY[0x24BDDC9D8], "kindWithVariants:", 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "kindWithSongKind:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setItemKind:", v40);

    v41 = objc_alloc(MEMORY[0x24BDDCB30]);
    v42 = *MEMORY[0x24BDDBD80];
    v105[0] = *MEMORY[0x24BDDBDA0];
    v105[1] = v42;
    v105[2] = *MEMORY[0x24BDDBD98];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v105, 3);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = *MEMORY[0x24BDDC270];
    v44 = (void *)MEMORY[0x24BDDCB30];
    v102 = *MEMORY[0x24BDDBDD0];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v102, 1);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "propertySetWithProperties:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v46;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v41, "initWithProperties:relationships:", v43, v47);
    objc_msgSend(v37, "setItemProperties:", v48);

    objc_msgSend(v37, "setAllowedItemIdentifiers:", v59);
    v63[0] = MEMORY[0x24BDAC760];
    v63[1] = 3221225472;
    v63[2] = __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_4;
    v63[3] = &unk_24D647240;
    v49 = v37;
    v64 = v49;
    v65 = queue;
    v67 = v94;
    v68 = v98;
    v66 = v55;
    objc_msgSend(v49, "performWithResponseHandler:", v63);

    v50 = v59;
  }
  else
  {
    v60[0] = MEMORY[0x24BDAC760];
    v60[1] = 3221225472;
    v60[2] = __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_2_73;
    v60[3] = &unk_24D647268;
    v62 = v98;
    v61 = v55;
    dispatch_async(queue, v60);
    v50 = v61;
  }

  _Block_object_dispose(v94, 8);
  _Block_object_dispose(v96, 8);

  _Block_object_dispose(v98, 8);
  _Block_object_dispose(v100, 8);

}

void __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke(_QWORD *a1)
{
  _BOOL4 v2;
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
    v2 = 0;
  else
    v2 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) == 0;
  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
    v3 = 0;
  else
    v3 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40) == 0;
  if (v2 || v3)
  {
    v4 = 0;
    v15 = 0;
  }
  else
  {
    v5 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    if (v5 || (v5 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40)) != 0)
    {
      v6 = v5;
      v4 = 0;
    }
    else
    {
      v8 = objc_alloc(MEMORY[0x24BDDC9B0]);
      v9 = objc_alloc_init(MEMORY[0x24BDDC9A8]);
      v4 = (void *)objc_msgSend(v8, "initWithRequest:", v9);

      v10 = objc_alloc_init(MEMORY[0x24BDDCA88]);
      objc_msgSend(v10, "appendSection:", CFSTR("Playlists"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "results");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "allItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendItems:", v12);

      objc_msgSend(v10, "appendSection:", CFSTR("Albums"));
      objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "results");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendItems:", v14);

      objc_msgSend(v4, "setResults:", v10);
      v6 = 0;
    }
    v7 = a1[4];
    v15 = v6;
    if (v7)
      (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v4);
  }

}

void __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setDeviceLibraryPersistentID:", objc_msgSend(v2, "longLongValue"));

}

void __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  _QWORD block[4];
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    NMLogForCategory(5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_3_cold_1();

  }
  v8 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_63;
  block[3] = &unk_24D647218;
  v17 = *(_QWORD *)(a1 + 64);
  v14 = v6;
  v15 = v5;
  v12 = *(_OWORD *)(a1 + 48);
  v9 = (id)v12;
  v16 = v12;
  v10 = v5;
  v11 = v6;
  dispatch_async(v8, block);

}

uint64_t __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_63(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_2_65(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x24BDDC9B0]);
  v3 = objc_alloc_init(MEMORY[0x24BDDC9A8]);
  v4 = objc_msgSend(v2, "initWithRequest:", v3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_3_67(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setDeviceLibraryPersistentID:", objc_msgSend(v2, "longLongValue"));

}

void __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  _QWORD block[4];
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    NMLogForCategory(5);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_3_cold_1();

  }
  v8 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_72;
  block[3] = &unk_24D647218;
  v17 = *(_QWORD *)(a1 + 64);
  v14 = v6;
  v15 = v5;
  v12 = *(_OWORD *)(a1 + 48);
  v9 = (id)v12;
  v16 = v12;
  v10 = v5;
  v11 = v6;
  dispatch_async(v8, block);

}

uint64_t __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_72(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_2_73(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = objc_alloc(MEMORY[0x24BDDC9B0]);
  v3 = objc_alloc_init(MEMORY[0x24BDDC9A8]);
  v4 = objc_msgSend(v2, "initWithRequest:", v3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_performStarterPackMultiplexRequestWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  __CFString *v22;
  id v23;
  id v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v4 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2050000000;
  v5 = (void *)getAKAccountManagerClass_softClass;
  v29 = getAKAccountManagerClass_softClass;
  v6 = MEMORY[0x24BDAC760];
  if (!getAKAccountManagerClass_softClass)
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __getAKAccountManagerClass_block_invoke;
    v25[3] = &unk_24D6474E0;
    v25[4] = &v26;
    __getAKAccountManagerClass_block_invoke((uint64_t)v25);
    v5 = (void *)v27[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v26, 8);
  objc_msgSend(v7, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "primaryAuthKitAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "userUnderAgeForAccount:", v9);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2A8]), "initWithUnderageUser:", v10);
  objc_msgSend(v11, "setDefaultMusicRequestProperties");
  objc_msgSend(v11, "setEditorialRequestProperties");
  objc_msgSend(MEMORY[0x24BE6B2A0], "allSupportedSectionProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSectionProperties:", v12);

  objc_msgSend(MEMORY[0x24BE6B2A0], "allSupportedItemProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setItemProperties:", v13);

  -[NMSMusicRecommendationsRequest _starterPackMultiplexCacheURL](self, "_starterPackMultiplexCacheURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCacheURL:", v14);

  objc_msgSend(v11, "setCachePolicy:", 3);
  if (self->_useCachedDataOnly)
  {
    objc_msgSend(v11, "setCachePolicy:", 1);
    -[NMSMusicRecommendationsRequest _unarchivedCombinedResponsesDictionary](self, "_unarchivedCombinedResponsesDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("StarterPackMultiplexResponse"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[NMSMusicRecommendationsRequest _starterPackMultiplexCacheURL](self, "_starterPackMultiplexCacheURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSMusicRecommendationsRequest _writeData:toURL:](self, "_writeData:toURL:", v16, v17);

    v18 = CFSTR("Defaults");
  }
  else
  {
    v18 = CFSTR("Store");
  }
  v21[0] = v6;
  v21[1] = 3221225472;
  v21[2] = __84__NMSMusicRecommendationsRequest__performStarterPackMultiplexRequestWithCompletion___block_invoke;
  v21[3] = &unk_24D6471A0;
  v22 = (__CFString *)v18;
  v23 = v11;
  v24 = v4;
  v19 = v4;
  v20 = v11;
  objc_msgSend(v20, "performWithResponseHandler:", v21);

}

void __84__NMSMusicRecommendationsRequest__performStarterPackMultiplexRequestWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  NMLogForCategory(5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __84__NMSMusicRecommendationsRequest__performStarterPackMultiplexRequestWithCompletion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (%{public}@) (Starter Pack) Got multiplex response: %@", (uint8_t *)&v11, 0x16u);
  }

  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

- (void)_performStarterPackRoomRequestWithURL:(id)a3 completion:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  __CFString *v20;
  id v21;
  id v22;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x24BE6B2B0];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithURL:", v8);

  objc_msgSend(v9, "setDefaultMusicRequestProperties");
  objc_msgSend(MEMORY[0x24BE6B2A0], "allSupportedSectionProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSectionProperties:", v10);

  objc_msgSend(MEMORY[0x24BE6B2A0], "allSupportedItemProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setItemProperties:", v11);

  -[NMSMusicRecommendationsRequest _starterPackRoomCacheURL](self, "_starterPackRoomCacheURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCacheURL:", v12);

  objc_msgSend(v9, "setCachePolicy:", 3);
  if (self->_useCachedDataOnly)
  {
    objc_msgSend(v9, "setCachePolicy:", 1);
    -[NMSMusicRecommendationsRequest _unarchivedCombinedResponsesDictionary](self, "_unarchivedCombinedResponsesDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("StarterPackRoomResponse"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[NMSMusicRecommendationsRequest _starterPackRoomCacheURL](self, "_starterPackRoomCacheURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSMusicRecommendationsRequest _writeData:toURL:](self, "_writeData:toURL:", v14, v15);

    v16 = CFSTR("Defaults");
  }
  else
  {
    v16 = CFSTR("Store");
  }
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __83__NMSMusicRecommendationsRequest__performStarterPackRoomRequestWithURL_completion___block_invoke;
  v19[3] = &unk_24D6471A0;
  v20 = (__CFString *)v16;
  v21 = v9;
  v22 = v6;
  v17 = v6;
  v18 = v9;
  objc_msgSend(v18, "performWithResponseHandler:", v19);

}

void __83__NMSMusicRecommendationsRequest__performStarterPackRoomRequestWithURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  NMLogForCategory(5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __83__NMSMusicRecommendationsRequest__performStarterPackRoomRequestWithURL_completion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (%{public}@) (Starter Pack) Got starter pack room response: %@", (uint8_t *)&v11, 0x16u);
  }

  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

- (void)_performLibraryImportChangeRequestWithModelObjects:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  void *v7;
  void (**v8)(id, _QWORD);
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void (**v30)(id, _QWORD);
  void *v31;
  id obj;
  void (**v33)(_QWORD, _QWORD);
  _QWORD v34[4];
  id v35;
  void (**v36)(_QWORD, _QWORD);
  _QWORD v37[4];
  NSObject *v38;
  void (**v39)(_QWORD, _QWORD);
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  void (**v46)(id, _QWORD);
  _QWORD *v47;
  _QWORD *v48;
  _QWORD v49[5];
  id v50;
  _QWORD v51[4];
  uint8_t buf[4];
  id v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  v7 = v5;
  v8 = v6;
  v31 = v7;
  if (!objc_msgSend(v7, "count"))
  {
    v8[2](v8, 0);
    goto LABEL_25;
  }
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  v51[3] = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__2;
  v49[4] = __Block_byref_object_dispose__2;
  v50 = 0;
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __96__NMSMusicRecommendationsRequest__performLibraryImportChangeRequestWithModelObjects_completion___block_invoke;
  v44[3] = &unk_24D647290;
  v47 = v51;
  v48 = v49;
  v9 = v7;
  v45 = v9;
  v30 = v8;
  v46 = v8;
  v33 = (void (**)(_QWORD, _QWORD))MEMORY[0x219A03B50](v44);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
  if (!v10)
    goto LABEL_23;
  v11 = *(_QWORD *)v41;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v41 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v12);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v13;
        objc_msgSend(v14, "identifiers");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "universalStore");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "globalPlaylistID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v17, "length"))
        {
          NMLogForCategory(5);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v53 = v14;
            _os_log_impl(&dword_216E27000, v18, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Import) Importing playlist: %{public}@", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "identifiers");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "universalStore");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "globalPlaylistID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v37[0] = MEMORY[0x24BDAC760];
          v37[1] = 3221225472;
          v37[2] = __96__NMSMusicRecommendationsRequest__performLibraryImportChangeRequestWithModelObjects_completion___block_invoke_81;
          v37[3] = &unk_24D6472B8;
          v38 = v14;
          v39 = v33;
          objc_msgSend(v19, "addGlobalPlaylistWithID:andAddToCloudLibrary:completion:", v22, 0, v37);

          v23 = v38;
        }
        else
        {
          NMLogForCategory(5);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            v53 = v14;
            _os_log_fault_impl(&dword_216E27000, v23, OS_LOG_TYPE_FAULT, "[Recommendation] (Import) Skipping import for playlist without a globalPlaylistID: %{public}@", buf, 0xCu);
          }
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v33[2](v33, 0);
          goto LABEL_21;
        }
        v24 = v13;
        NMLogForCategory(5);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v53 = v24;
          _os_log_impl(&dword_216E27000, v25, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Import) Importing album: %{public}@", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "identifiers");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "universalStore");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "adamID");
        v34[0] = MEMORY[0x24BDAC760];
        v34[1] = 3221225472;
        v34[2] = __96__NMSMusicRecommendationsRequest__performLibraryImportChangeRequestWithModelObjects_completion___block_invoke_84;
        v34[3] = &unk_24D6472E0;
        v35 = v24;
        v36 = v33;
        objc_msgSend(v26, "addStoreItem:andAddTracksToCloudLibrary:withCompletion:", v29, 0, v34);

        v17 = v35;
      }

LABEL_21:
      ++v12;
    }
    while (v10 != v12);
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
  }
  while (v10);
LABEL_23:

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v51, 8);
  v8 = v30;
LABEL_25:

}

void __96__NMSMusicRecommendationsRequest__performLibraryImportChangeRequestWithModelObjects_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v4 + 40);
  v5 = (id *)(v4 + 40);
  v6 = v7;
  v9 = v3;
  if (v7)
    v3 = v6;
  objc_storeStrong(v5, v3);
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v8 == objc_msgSend(*(id *)(a1 + 32), "count"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __96__NMSMusicRecommendationsRequest__performLibraryImportChangeRequestWithModelObjects_completion___block_invoke_81(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  NMLogForCategory(5);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __96__NMSMusicRecommendationsRequest__performLibraryImportChangeRequestWithModelObjects_completion___block_invoke_81_cold_1();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v14 = 138543362;
      v15 = v6;
      _os_log_impl(&dword_216E27000, v5, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Import) Successfully imported playlist: %{public}@", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDDC818], "playlistsQuery");
    v5 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDDC810];
    objc_msgSend(*(id *)(a1 + 32), "identifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "universalStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "globalPlaylistID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateWithValue:forProperty:comparisonType:", v10, *MEMORY[0x24BDDBD08], 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addFilterPredicate:](v5, "addFilterPredicate:", v11);

    -[NSObject collections](v5, "collections");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setValue:forProperty:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDDBD38]);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __96__NMSMusicRecommendationsRequest__performLibraryImportChangeRequestWithModelObjects_completion___block_invoke_84(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NMLogForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __96__NMSMusicRecommendationsRequest__performLibraryImportChangeRequestWithModelObjects_completion___block_invoke_84_cold_1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_216E27000, v6, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Import) Successfully imported album: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)_unarchivedCombinedResponsesDictionary
{
  NSDictionary *unarchivedCombinedResponsesDictionary;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSData *cachedData;
  NSDictionary *v13;
  id v14;
  NSDictionary *v15;
  NSObject *v16;
  NSDictionary *v17;
  id v19;

  unarchivedCombinedResponsesDictionary = self->_unarchivedCombinedResponsesDictionary;
  if (!unarchivedCombinedResponsesDictionary)
  {
    if (-[NSData length](self->_cachedData, "length"))
    {
      v4 = (void *)MEMORY[0x24BDD1620];
      v5 = (void *)MEMORY[0x24BDBCF20];
      v6 = objc_opt_class();
      v7 = objc_opt_class();
      v8 = objc_opt_class();
      v9 = objc_opt_class();
      v10 = objc_opt_class();
      objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      cachedData = self->_cachedData;
      v19 = 0;
      objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v11, cachedData, &v19);
      v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v14 = v19;
      v15 = self->_unarchivedCombinedResponsesDictionary;
      self->_unarchivedCombinedResponsesDictionary = v13;

      if (v14)
      {
        NMLogForCategory(5);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[NMSMusicRecommendationsRequest _unarchivedCombinedResponsesDictionary].cold.1();

      }
    }
    else
    {
      v17 = self->_unarchivedCombinedResponsesDictionary;
      self->_unarchivedCombinedResponsesDictionary = 0;

    }
    unarchivedCombinedResponsesDictionary = self->_unarchivedCombinedResponsesDictionary;
  }
  return unarchivedCombinedResponsesDictionary;
}

+ (id)_recentMusicDirectory
{
  if (_recentMusicDirectory_onceToken != -1)
    dispatch_once(&_recentMusicDirectory_onceToken, &__block_literal_global_91);
  return (id)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", _recentMusicDirectory_path, 1);
}

void __55__NMSMusicRecommendationsRequest__recentMusicDirectory__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[NMSPathUtil recentMusicDirectory](NMSPathUtil, "recentMusicDirectory");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_recentMusicDirectory_path;
  _recentMusicDirectory_path = v0;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", _recentMusicDirectory_path, 1, 0, 0);

}

- (id)_heavyRotationCacheURL
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_recentMusicDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("HeavyRotationResponse"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_starterPackMultiplexCacheURL
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_recentMusicDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("StarterPackMultiplexResponse"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_starterPackRoomCacheURL
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_recentMusicDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("StarterPackRoomResponse"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_writeData:(id)a3 toURL:(id)a4
{
  id v5;
  id v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v11 = 0;
    v7 = objc_msgSend(v5, "writeToURL:options:error:", v6, 1, &v11);
    v8 = v11;
    NMLogForCategory(5);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v13 = v5;
        v14 = 2112;
        v15 = v6;
        _os_log_impl(&dword_216E27000, v10, OS_LOG_TYPE_DEFAULT, "[Recommendations] Cached data %@ at url %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[NMSMusicRecommendationsRequest _writeData:toURL:].cold.2();
    }

  }
  else
  {
    NMLogForCategory(5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[NMSMusicRecommendationsRequest _writeData:toURL:].cold.1();
  }

}

- (void)_continueToLegacyForYouRequestWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  NMSMusicRecommendationsRequest *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(v9);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __98__NMSMusicRecommendationsRequest__continueToLegacyForYouRequestWithContext_queue_responseHandler___block_invoke;
  v14[3] = &unk_24D647328;
  v15 = v9;
  v16 = v8;
  v17 = self;
  v18 = v10;
  v11 = v8;
  v12 = v10;
  v13 = v9;
  -[NMSMusicRecommendationsRequest _performForYouRequestWithCompletion:](self, "_performForYouRequestWithCompletion:", v14);

}

void __98__NMSMusicRecommendationsRequest__continueToLegacyForYouRequestWithContext_queue_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __98__NMSMusicRecommendationsRequest__continueToLegacyForYouRequestWithContext_queue_responseHandler___block_invoke_2;
  v10[3] = &unk_24D6470C0;
  v11 = v6;
  v16 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 40);
  v13 = v5;
  v14 = *(_QWORD *)(a1 + 48);
  v15 = *(id *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, v10);

}

uint64_t __98__NMSMusicRecommendationsRequest__continueToLegacyForYouRequestWithContext_queue_responseHandler___block_invoke_2(uint64_t a1)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  if (*(_QWORD *)(a1 + 32))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "setForYouResponse:", *(_QWORD *)(a1 + 48));
  v3 = objc_msgSend(*(id *)(a1 + 40), "numberOfRecentMusicModelObjects");
  v4 = objc_msgSend(*(id *)(a1 + 40), "minimumNumberOfRecentMusicModelObjects");
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 72);
  if (v3 >= v4)
    return objc_msgSend(v6, "_continueToProcessResultsWithContext:queue:responseHandler:", v5, v7, v8);
  else
    return objc_msgSend(v6, "_continueToLibraryRecentMusicRecommedationsWithContext:queue:responseHandler:", v5, v7, v8);
}

- (void)_continueToLegacyEditorialRequestWithContext:(id)a3 queue:(id)a4 responseHandler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  NSObject *v15;
  id v16;
  NMSMusicRecommendationsRequest *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(v9);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __101__NMSMusicRecommendationsRequest__continueToLegacyEditorialRequestWithContext_queue_responseHandler___block_invoke;
  v14[3] = &unk_24D647350;
  v15 = v9;
  v16 = v8;
  v17 = self;
  v18 = v10;
  v11 = v8;
  v12 = v10;
  v13 = v9;
  -[NMSMusicRecommendationsRequest _performEditorialBrowseRequestWithCompletion:](self, "_performEditorialBrowseRequestWithCompletion:", v14);

}

void __101__NMSMusicRecommendationsRequest__continueToLegacyEditorialRequestWithContext_queue_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(a1 + 32);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __101__NMSMusicRecommendationsRequest__continueToLegacyEditorialRequestWithContext_queue_responseHandler___block_invoke_2;
  v10[3] = &unk_24D6470C0;
  v11 = v6;
  v16 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 40);
  v13 = v5;
  v14 = *(_QWORD *)(a1 + 48);
  v15 = *(id *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, v10);

}

uint64_t __101__NMSMusicRecommendationsRequest__continueToLegacyEditorialRequestWithContext_queue_responseHandler___block_invoke_2(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 32))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "setEditorialBrowseResponse:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 56), "_continueToProcessResultsWithContext:queue:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)_performForYouRequestWithCompletion:(id)a3
{
  id v4;
  NMSModelForYouRecommendationsRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  NSObject *v13;
  id v14;
  NMSModelForYouRecommendationsRequest *v15;
  _QWORD v16[4];
  __CFString *v17;
  NMSModelForYouRecommendationsRequest *v18;
  id v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  NMSModelForYouRecommendationsRequest *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(NMSModelForYouRecommendationsRequest);
  -[NMSModelForYouRecommendationsRequest setLabel:](v5, "setLabel:", CFSTR("ForYou Music Recommendations"));
  +[MPModelForYouRecommendationsRequest allSupportedSectionProperties](NMSModelForYouRecommendationsRequest, "allSupportedSectionProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSModelForYouRecommendationsRequest setSectionProperties:](v5, "setSectionProperties:", v6);

  +[MPModelForYouRecommendationsRequest allSupportedItemProperties](NMSModelForYouRecommendationsRequest, "allSupportedItemProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSModelForYouRecommendationsRequest setItemProperties:](v5, "setItemProperties:", v7);

  -[MPStoreModelRequest setClientIdentifier:](v5, "setClientIdentifier:", CFSTR("NanoMusic"));
  -[MPStoreModelRequest setClientVersion:](v5, "setClientVersion:", CFSTR("2.0"));
  if (self->_useCachedDataOnly)
  {
    -[NMSModelForYouRecommendationsRequest setNms_useCachedDataOnly:](v5, "setNms_useCachedDataOnly:", 1);
    -[NMSMusicRecommendationsRequest _unarchivedCombinedResponsesDictionary](self, "_unarchivedCombinedResponsesDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("recommendationsArray"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSModelForYouRecommendationsRequest setNms_cachedRecommendationsArray:](v5, "setNms_cachedRecommendationsArray:", v9);

    -[NMSMusicRecommendationsRequest _unarchivedCombinedResponsesDictionary](self, "_unarchivedCombinedResponsesDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("storeItemMetadataResults"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSModelForYouRecommendationsRequest setNms_cachedStoreItemMetadataResults:](v5, "setNms_cachedStoreItemMetadataResults:", v11);

    v12 = CFSTR("Defaults");
  }
  else
  {
    v12 = CFSTR("Store");
  }
  NMLogForCategory(5);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = v12;
    v22 = 2114;
    v23 = v5;
    _os_log_impl(&dword_216E27000, v13, OS_LOG_TYPE_DEFAULT, "[Recommendation] (%{public}@) (ForYou) Performing request: %{public}@", buf, 0x16u);
  }

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __70__NMSMusicRecommendationsRequest__performForYouRequestWithCompletion___block_invoke;
  v16[3] = &unk_24D647378;
  v17 = (__CFString *)v12;
  v18 = v5;
  v19 = v4;
  v14 = v4;
  v15 = v5;
  -[NMSModelForYouRecommendationsRequest performWithResponseHandler:](v15, "performWithResponseHandler:", v16);

}

void __70__NMSMusicRecommendationsRequest__performForYouRequestWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  NMLogForCategory(5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __70__NMSMusicRecommendationsRequest__performForYouRequestWithCompletion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (%{public}@) (ForYou) Got response: %@", (uint8_t *)&v11, 0x16u);
  }

  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

- (void)_performEditorialBrowseRequestWithCompletion:(id)a3
{
  id v4;
  NMSModelEditorialRecommendationsRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  NSObject *v11;
  id v12;
  NMSModelEditorialRecommendationsRequest *v13;
  _QWORD v14[4];
  __CFString *v15;
  NMSModelEditorialRecommendationsRequest *v16;
  id v17;
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  NMSModelEditorialRecommendationsRequest *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(NMSModelEditorialRecommendationsRequest);
  -[NMSModelEditorialRecommendationsRequest setLabel:](v5, "setLabel:", CFSTR("Editorial Recommendations"));
  +[MPModelStoreBrowseRequest allSupportedSectionProperties](NMSModelEditorialRecommendationsRequest, "allSupportedSectionProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSModelEditorialRecommendationsRequest setSectionProperties:](v5, "setSectionProperties:", v6);

  +[MPModelStoreBrowseRequest allSupportedItemProperties](NMSModelEditorialRecommendationsRequest, "allSupportedItemProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NMSModelEditorialRecommendationsRequest setItemProperties:](v5, "setItemProperties:", v7);

  -[MPStoreModelRequest setClientIdentifier:](v5, "setClientIdentifier:", CFSTR("NanoMusic"));
  -[MPStoreModelRequest setClientVersion:](v5, "setClientVersion:", CFSTR("2.0"));
  if (self->_useCachedDataOnly)
  {
    -[NMSModelEditorialRecommendationsRequest setNms_useCachedDataOnly:](v5, "setNms_useCachedDataOnly:", 1);
    -[NMSMusicRecommendationsRequest _unarchivedCombinedResponsesDictionary](self, "_unarchivedCombinedResponsesDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("editorial-cachedLoadedOutput"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NMSModelEditorialRecommendationsRequest setNms_cachedLoadedOutput:](v5, "setNms_cachedLoadedOutput:", v9);

    v10 = CFSTR("Defaults");
  }
  else
  {
    v10 = CFSTR("Store");
  }
  NMLogForCategory(5);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v19 = v10;
    v20 = 2114;
    v21 = v5;
    _os_log_impl(&dword_216E27000, v11, OS_LOG_TYPE_DEFAULT, "[Recommendation] (%{public}@) (Editorial) Performing request: %{public}@", buf, 0x16u);
  }

  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __79__NMSMusicRecommendationsRequest__performEditorialBrowseRequestWithCompletion___block_invoke;
  v14[3] = &unk_24D6473A0;
  v15 = (__CFString *)v10;
  v16 = v5;
  v17 = v4;
  v12 = v4;
  v13 = v5;
  -[NMSModelEditorialRecommendationsRequest performWithResponseHandler:](v13, "performWithResponseHandler:", v14);

}

void __79__NMSMusicRecommendationsRequest__performEditorialBrowseRequestWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  NMLogForCategory(5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __79__NMSMusicRecommendationsRequest__performEditorialBrowseRequestWithCompletion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v11 = 138543618;
    v12 = v9;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (%{public}@) (Editorial) Got response: %@", (uint8_t *)&v11, 0x16u);
  }

  v10 = *(_QWORD *)(a1 + 48);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

- (void)_performLegacyLibraryImportChangeRequestWithModelObjects:(id)a3 completion:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = (objc_class *)MEMORY[0x24BDDC8E0];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setShouldLibraryAdd:", 0);
  objc_msgSend(v8, "setModelObjects:", v7);

  NMLogForCategory(5);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_impl(&dword_216E27000, v9, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Import) Performing request: %{public}@", buf, 0xCu);
  }

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __102__NMSMusicRecommendationsRequest__performLegacyLibraryImportChangeRequestWithModelObjects_completion___block_invoke;
  v12[3] = &unk_24D6472E0;
  v13 = v8;
  v14 = v5;
  v10 = v5;
  v11 = v8;
  objc_msgSend(v11, "performWithResponseHandler:", v12);

}

void __102__NMSMusicRecommendationsRequest__performLegacyLibraryImportChangeRequestWithModelObjects_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  NMLogForCategory(5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __102__NMSMusicRecommendationsRequest__performLegacyLibraryImportChangeRequestWithModelObjects_completion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_216E27000, v8, OS_LOG_TYPE_DEFAULT, "[Recommendation] (Import) Got response: %@", (uint8_t *)&v10, 0xCu);
  }

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);

}

- (BOOL)useCachedDataOnly
{
  return self->_useCachedDataOnly;
}

- (void)setUseCachedDataOnly:(BOOL)a3
{
  self->_useCachedDataOnly = a3;
}

- (NSData)cachedData
{
  return self->_cachedData;
}

- (void)setCachedData:(id)a3
{
  objc_storeStrong((id *)&self->_cachedData, a3);
}

- (NSDictionary)unarchivedCombinedResponsesDictionary
{
  return self->_unarchivedCombinedResponsesDictionary;
}

- (void)setUnarchivedCombinedResponsesDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_unarchivedCombinedResponsesDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unarchivedCombinedResponsesDictionary, 0);
  objc_storeStrong((id *)&self->_cachedData, 0);
}

- (void)_finishWithContext:queue:responseHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_216E27000, v0, v1, "[Recommendation] Failed to archive combinedResponsesDictionary due to %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __77__NMSMusicRecommendationsRequest__performHeavyRotationRequestWithCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_216E27000, v0, v1, "[Recommendation] (%{public}@) (Heavy Rotation) %{public}@ failed heavy rotation request with error: %{public}@");
  OUTLINED_FUNCTION_6();
}

void __82__NMSMusicRecommendationsRequest__performLibraryRecentMusicRequestWithCompletion___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_216E27000, v0, v1, "[Recommendation] (Defaults) (Library) %{public}@ failed with error: %{public}@");
  OUTLINED_FUNCTION_1();
}

void __84__NMSMusicRecommendationsRequest__performStarterPackMultiplexRequestWithCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_216E27000, v0, v1, "[Recommendation] (%{public}@) (Starter Pack) %{public}@ failed multiplex request with error: %{public}@");
  OUTLINED_FUNCTION_6();
}

void __83__NMSMusicRecommendationsRequest__performStarterPackRoomRequestWithURL_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_216E27000, v0, v1, "[Recommendation] (%{public}@) (Starter Pack) %{public}@ failed starter pack room request with error: %{public}@");
  OUTLINED_FUNCTION_6();
}

void __96__NMSMusicRecommendationsRequest__performLibraryImportChangeRequestWithModelObjects_completion___block_invoke_81_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_216E27000, v0, v1, "[Recommendation] (Import) Failed to import playlist with error: %{public}@, playlist: %{public}@");
  OUTLINED_FUNCTION_1();
}

void __96__NMSMusicRecommendationsRequest__performLibraryImportChangeRequestWithModelObjects_completion___block_invoke_84_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(&dword_216E27000, v0, v1, "[Recommendation] (Import) Failed to import album with error: %{public}@, album: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)_unarchivedCombinedResponsesDictionary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_216E27000, v0, v1, "Failed to unarchive combinedResponsesDictionary due to %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_writeData:toURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_216E27000, v0, v1, "[Recommendation] failed to write null data to disk for URL: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_writeData:toURL:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1_0(&dword_216E27000, v0, v1, "[Recommendations] Failed to write data to disk at url: %@ due to write error: %@");
  OUTLINED_FUNCTION_1();
}

void __70__NMSMusicRecommendationsRequest__performForYouRequestWithCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_216E27000, v0, v1, "[Recommendation] (%{public}@) (ForYou) %{public}@ failed with error: %{public}@");
  OUTLINED_FUNCTION_6();
}

void __79__NMSMusicRecommendationsRequest__performEditorialBrowseRequestWithCompletion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2(&dword_216E27000, v0, v1, "[Recommendation] (%{public}@) (Editorial) %{public}@ failed with error: %{public}@");
  OUTLINED_FUNCTION_6();
}

void __102__NMSMusicRecommendationsRequest__performLegacyLibraryImportChangeRequestWithModelObjects_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_216E27000, v0, v1, "[Recommendation] (Import) %{public}@ failed with error: %{public}@");
  OUTLINED_FUNCTION_1();
}

@end
