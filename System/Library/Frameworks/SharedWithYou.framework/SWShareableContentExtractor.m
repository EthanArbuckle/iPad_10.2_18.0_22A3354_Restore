@implementation SWShareableContentExtractor

+ (OS_dispatch_queue)contentExtractorQueue
{
  if (contentExtractorQueue_onceToken != -1)
    dispatch_once(&contentExtractorQueue_onceToken, &__block_literal_global);
  return (OS_dispatch_queue *)(id)contentExtractorQueue_contentExtractorQueue;
}

void __52__SWShareableContentExtractor_contentExtractorQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.SharedWithYou.SWShareableContentExtractor", v2);
  v1 = (void *)contentExtractorQueue_contentExtractorQueue;
  contentExtractorQueue_contentExtractorQueue = (uint64_t)v0;

}

- (SWShareableContentExtractor)init
{
  SWShareableContentExtractor *v2;
  uint64_t v3;
  NSMutableArray *pendingContentExtractionRequests;
  NSObject *v5;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SWShareableContentExtractor;
  v2 = -[SWShareableContentExtractor init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    pendingContentExtractionRequests = v2->_pendingContentExtractionRequests;
    v2->_pendingContentExtractionRequests = (NSMutableArray *)v3;

    SWShareableContentLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18EAB1000, v5, OS_LOG_TYPE_DEFAULT, "Initialized SWShareableContentExtractor", v7, 2u);
    }

  }
  return v2;
}

- (void)retrieveShareableContentForBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __102__SWShareableContentExtractor_retrieveShareableContentForBundleIdentifier_sceneIdentifier_completion___block_invoke;
  v10[3] = &unk_1E2873A98;
  v11 = v8;
  v9 = v8;
  -[SWShareableContentExtractor retrieveShareableContentMatchingBundleIdentifier:sceneIdentifier:completion:](self, "retrieveShareableContentMatchingBundleIdentifier:sceneIdentifier:completion:", a3, a4, v10);

}

void __102__SWShareableContentExtractor_retrieveShareableContentForBundleIdentifier_sceneIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)retrieveShareableContentForSceneIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __85__SWShareableContentExtractor_retrieveShareableContentForSceneIdentifier_completion___block_invoke;
  v8[3] = &unk_1E2873A98;
  v9 = v6;
  v7 = v6;
  -[SWShareableContentExtractor retrieveShareableContentMatchingBundleIdentifier:sceneIdentifier:completion:](self, "retrieveShareableContentMatchingBundleIdentifier:sceneIdentifier:completion:", 0, a3, v8);

}

void __85__SWShareableContentExtractor_retrieveShareableContentForSceneIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

- (void)retrieveShareableContentForBundleIdentifier:(id)a3 completion:(id)a4
{
  -[SWShareableContentExtractor retrieveShareableContentMatchingBundleIdentifier:sceneIdentifier:completion:](self, "retrieveShareableContentMatchingBundleIdentifier:sceneIdentifier:completion:", a3, 0, a4);
}

- (void)retrieveShareableContentWithCompletion:(id)a3
{
  -[SWShareableContentExtractor retrieveShareableContentMatchingBundleIdentifier:sceneIdentifier:completion:](self, "retrieveShareableContentMatchingBundleIdentifier:sceneIdentifier:completion:", 0, 0, a3);
}

- (void)retrieveAsynchronousLPMetadataForBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  SWShareableContentLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_18EAB1000, v11, OS_LOG_TYPE_DEFAULT, "SWY Retrieving LPmetadata for bundle identifier and scene identifier %@, %@.", (uint8_t *)&v12, 0x16u);
  }

  -[SWShareableContentExtractor retrieveAsynchronousLPMetadataMatchingBundleIdentifier:sceneIdentifier:completion:](self, "retrieveAsynchronousLPMetadataMatchingBundleIdentifier:sceneIdentifier:completion:", v8, v9, v10);
}

- (void)retrieveAsynchronousLPMetadataForSceneIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SWShareableContentLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_18EAB1000, v8, OS_LOG_TYPE_DEFAULT, "SWY Retrieving LPmetadata for scene identifier %@.", (uint8_t *)&v9, 0xCu);
  }

  -[SWShareableContentExtractor retrieveAsynchronousLPMetadataMatchingBundleIdentifier:sceneIdentifier:completion:](self, "retrieveAsynchronousLPMetadataMatchingBundleIdentifier:sceneIdentifier:completion:", 0, v6, v7);
}

- (void)retrieveAsynchronousLPMetadataForBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SWShareableContentLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_18EAB1000, v8, OS_LOG_TYPE_DEFAULT, "SWY Retrieving LPmetadata for bundle identifier %@.", (uint8_t *)&v9, 0xCu);
  }

  -[SWShareableContentExtractor retrieveAsynchronousLPMetadataMatchingBundleIdentifier:sceneIdentifier:completion:](self, "retrieveAsynchronousLPMetadataMatchingBundleIdentifier:sceneIdentifier:completion:", v6, 0, v7);
}

- (void)retrieveAsynchronousLPMetadataWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  SWShareableContentLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_18EAB1000, v5, OS_LOG_TYPE_DEFAULT, "SWY Retrieving metadata for the on screen content.", v6, 2u);
  }

  -[SWShareableContentExtractor retrieveAsynchronousLPMetadataMatchingBundleIdentifier:sceneIdentifier:completion:](self, "retrieveAsynchronousLPMetadataMatchingBundleIdentifier:sceneIdentifier:completion:", 0, 0, v4);
}

- (void)retrieveShareableContentMatchingBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  SWShareableContentExtractor *v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __107__SWShareableContentExtractor_retrieveShareableContentMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke;
  v18 = &unk_1E2873A30;
  v19 = self;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  v14 = _Block_copy(&v15);
  -[SWShareableContentExtractor _addContentExtractionRequest:](self, "_addContentExtractionRequest:", v14, v15, v16, v17, v18, v19);

}

void __107__SWShareableContentExtractor_retrieveShareableContentMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  uint8_t buf[16];

  SWShareableContentLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18EAB1000, v2, OS_LOG_TYPE_DEFAULT, "Retrieving metadata for the on screen content.", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "remoteService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __107__SWShareableContentExtractor_retrieveShareableContentMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_34;
  v6[3] = &unk_1E2873AC0;
  v4 = *(_QWORD *)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v3, "retrieveShareableContentMetadataMatchingBundleIdentifier:sceneIdentifier:completion:", v4, v5, v6);

}

void __107__SWShareableContentExtractor_retrieveShareableContentMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_34(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  SWShareableContent *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SWShareableContent *v15;
  NSObject *v16;
  id obj;
  uint64_t v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v3)
  {
    v4 = v3;
    v18 = *(_QWORD *)v22;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v5);
        v7 = [SWShareableContent alloc];
        objc_msgSend(v6, "sceneIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "metadata");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "representations");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "highlightURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "initiatorHandle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "initiatorNameComponents");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[SWShareableContent initWithSourceSceneIdentifier:sourceBundleIdentifier:metadata:representations:highlightURL:initiatorHandle:initiatorNameComponents:](v7, "initWithSourceSceneIdentifier:sourceBundleIdentifier:metadata:representations:highlightURL:initiatorHandle:initiatorNameComponents:", v8, v9, v10, v11, v12, v13, v14);

        -[SWShareableContent setRepresentationProvider:](v15, "setRepresentationProvider:", *(_QWORD *)(a1 + 32));
        objc_msgSend(v20, "addObject:", v15);

        ++v5;
      }
      while (v4 != v5);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v4);
  }

  SWShareableContentLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v20;
    _os_log_impl(&dword_18EAB1000, v16, OS_LOG_TYPE_DEFAULT, "Retrieved shareable content metadata: %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)retrieveAsynchronousLPMetadataMatchingBundleIdentifier:(id)a3 sceneIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  SWShareableContentExtractor *v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __113__SWShareableContentExtractor_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke;
  v18 = &unk_1E2873A30;
  v19 = self;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  v14 = _Block_copy(&v15);
  -[SWShareableContentExtractor _addContentExtractionRequest:](self, "_addContentExtractionRequest:", v14, v15, v16, v17, v18, v19);

}

void __113__SWShareableContentExtractor_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[16];

  SWShareableContentLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18EAB1000, v2, OS_LOG_TYPE_DEFAULT, "Retrieving asynchronous metadata for the on screen content.", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "remoteService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __113__SWShareableContentExtractor_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_36;
  v6[3] = &unk_1E2873AE8;
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v3, "retrieveAsynchronousLPMetadataMatchingBundleIdentifier:sceneIdentifier:completion:", v4, v5, v6);

}

void __113__SWShareableContentExtractor_retrieveAsynchronousLPMetadataMatchingBundleIdentifier_sceneIdentifier_completion___block_invoke_36(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SWShareableContentLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_18EAB1000, v4, OS_LOG_TYPE_DEFAULT, "Retrieved asynchronous LP metadata: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)presentMessageComposeSheetForContent:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD aBlock[4];
  id v12;
  SWShareableContentExtractor *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__SWShareableContentExtractor_presentMessageComposeSheetForContent_completion___block_invoke;
  aBlock[3] = &unk_1E2873B10;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  v10 = _Block_copy(aBlock);
  -[SWShareableContentExtractor _addContentExtractionRequest:](self, "_addContentExtractionRequest:", v10);

}

void __79__SWShareableContentExtractor_presentMessageComposeSheetForContent_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  SWShareableContentLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "sourceSceneIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_18EAB1000, v2, OS_LOG_TYPE_DEFAULT, "Presenting message compose sheet to share on screen content from source identifier: %@", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "remoteService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "sourceSceneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentMessageComposeSheetForSceneIdentifier:completion:", v5, *(_QWORD *)(a1 + 48));

}

- (void)initiateBackgroundCollaborationForContent:(id)a3 faceTimeConversation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v6, "remoteMembers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "handle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "normalizedValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v7, "addObject:", v14);
        }
        else
        {
          objc_msgSend(v13, "value");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  objc_msgSend(v6, "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWShareableContentExtractor initiateBackgroundCollaborationForContent:shareOptions:recipients:faceTimeConversationUUID:](self, "initiateBackgroundCollaborationForContent:shareOptions:recipients:faceTimeConversationUUID:", v5, 0, v7, v16);

}

- (void)initiateBackgroundCollaborationForContent:(id)a3 recipients:(id)a4 faceTimeConversationUUID:(id)a5
{
  -[SWShareableContentExtractor initiateBackgroundCollaborationForContent:shareOptions:recipients:faceTimeConversationUUID:](self, "initiateBackgroundCollaborationForContent:shareOptions:recipients:faceTimeConversationUUID:", a3, 0, a4, a5);
}

- (void)initiateBackgroundCollaborationForContent:(id)a3 shareOptions:(id)a4 recipients:(id)a5 faceTimeConversationUUID:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[2];
  _QWORD v32[2];
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject base64EncodedStringWithOptions:](v13, "base64EncodedStringWithOptions:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sourceSceneIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[SWShareableContentExtractor _buildStartCollaborationURLForContentSceneIdentifier:shareOptions:recipients:faceTimeConversationUUID:](SWShareableContentExtractor, "_buildStartCollaborationURLForContentSceneIdentifier:shareOptions:recipients:faceTimeConversationUUID:", v15, v14, v11, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = *MEMORY[0x1E0D22D00];
      v31[0] = *MEMORY[0x1E0D22D78];
      v31[1] = v17;
      v32[0] = v16;
      v32[1] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v13;
      v21 = v11;
      v22 = v14;
      v23 = v9;
      v24 = v12;
      v25 = v10;
      v26 = *MEMORY[0x1E0CD7488];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __122__SWShareableContentExtractor_initiateBackgroundCollaborationForContent_shareOptions_recipients_faceTimeConversationUUID___block_invoke;
      v29[3] = &unk_1E2873B38;
      v30 = v16;
      v27 = v26;
      v10 = v25;
      v12 = v24;
      v9 = v23;
      v14 = v22;
      v11 = v21;
      v13 = v28;
      objc_msgSend(v19, "openApplication:withOptions:completion:", v27, v20, v29);

    }
    else
    {
      SWShareableContentLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v9;
        _os_log_impl(&dword_18EAB1000, v18, OS_LOG_TYPE_DEFAULT, "Start collaboration URL could not be constructed when trying to start collaboration for shareable content: %@", buf, 0xCu);
      }
    }

  }
  else
  {
    SWShareableContentLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v9;
      _os_log_impl(&dword_18EAB1000, v13, OS_LOG_TYPE_DEFAULT, "No recipients were specified when trying to start collaboration for shareable content: %@", buf, 0xCu);
    }
  }

}

void __122__SWShareableContentExtractor_initiateBackgroundCollaborationForContent_shareOptions_recipients_faceTimeConversationUUID___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SWShareableContentLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!a2 || v5)
  {
    if (v7)
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138412546;
      v14 = v12;
      v15 = 2112;
      v16 = v5;
      v9 = "Failed to background launch mobile SMS for startCollaborationURL %@ with error %@";
      v10 = v6;
      v11 = 22;
      goto LABEL_7;
    }
  }
  else if (v7)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v13 = 138412290;
    v14 = v8;
    v9 = "Successfully background launched application MobileSMS for startCollaborationURL %@";
    v10 = v6;
    v11 = 12;
LABEL_7:
    _os_log_impl(&dword_18EAB1000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v13, v11);
  }

}

+ (id)_buildStartCollaborationURLForContentSceneIdentifier:(id)a3 shareOptions:(id)a4 recipients:(id)a5 faceTimeConversationUUID:(id)a6
{
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  id v30;
  void *v31;
  _QWORD v32[7];

  v32[6] = *MEMORY[0x1E0C80C00];
  v30 = a6;
  v9 = (void *)MEMORY[0x1E0CB3998];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "componentsWithString:", CFSTR("sms://open"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("service"), CFSTR("iMessage"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("compose"), CFSTR("false"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v14;
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("collaboration-initiate-send"), CFSTR("true"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v32[2] = v15;
  v16 = (void *)MEMORY[0x1E0CB39D8];
  if (objc_msgSend(v10, "count") == 1)
    v17 = CFSTR("recipient");
  else
    v17 = CFSTR("recipients");
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "queryItemWithName:value:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[3] = v19;
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("collaboration-scene-identifier"), v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v32[4] = v20;
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("collaboration-share-options"), v11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v32[5] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "arrayWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v24 = (void *)MEMORY[0x1E0CB39D8];
    objc_msgSend(v30, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "queryItemWithName:value:", CFSTR("facetime-conversation"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v26);

  }
  objc_msgSend(v31, "setQueryItems:", v23);
  objc_msgSend(v31, "URL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (void)_addContentExtractionRequest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "contentExtractorQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__SWShareableContentExtractor__addContentExtractionRequest___block_invoke;
  v7[3] = &unk_1E28739E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __60__SWShareableContentExtractor__addContentExtractionRequest___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  objc_msgSend(*(id *)(a1 + 32), "serviceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "connectionActive");

  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    SWShareableContentLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18EAB1000, v4, OS_LOG_TYPE_DEFAULT, "Not currently connected to shareable content service. We'll wait for the connection before servicing this request.", v8, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "pendingContentExtractionRequests");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = _Block_copy(*(const void **)(a1 + 40));
    objc_msgSend(v5, "addObject:", v6);

    objc_msgSend(*(id *)(a1 + 32), "serviceProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "connect");

  }
}

- (void)_processPendingContentExtractionRequests
{
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend((id)objc_opt_class(), "contentExtractorQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__SWShareableContentExtractor__processPendingContentExtractionRequests__block_invoke;
  block[3] = &unk_1E2873A08;
  block[4] = self;
  dispatch_async(v3, block);

}

void __71__SWShareableContentExtractor__processPendingContentExtractionRequests__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
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
  objc_msgSend(*(id *)(a1 + 32), "pendingContentExtractionRequests", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "pendingContentExtractionRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

}

- (void)loadRepresentationForContent:(id)a3 typeIdentifier:(id)a4 itemProviderIndex:(int64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD aBlock[4];
  id v18;
  id v19;
  SWShareableContentExtractor *v20;
  id v21;
  int64_t v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __111__SWShareableContentExtractor_loadRepresentationForContent_typeIdentifier_itemProviderIndex_completionHandler___block_invoke;
  aBlock[3] = &unk_1E2873B60;
  v18 = v11;
  v19 = v10;
  v21 = v12;
  v22 = a5;
  v20 = self;
  v13 = v12;
  v14 = v10;
  v15 = v11;
  v16 = _Block_copy(aBlock);
  -[SWShareableContentExtractor _addContentExtractionRequest:](self, "_addContentExtractionRequest:", v16);

}

void __111__SWShareableContentExtractor_loadRepresentationForContent_typeIdentifier_itemProviderIndex_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  SWShareableContentLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "sourceSceneIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v3;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_18EAB1000, v2, OS_LOG_TYPE_DEFAULT, "Retrieving representation with type identifier: %@ from on screen content with source identifier: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 48), "remoteService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sourceBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "sourceSceneIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadRepresentationFromBundleIdentifier:sceneIdentifier:requestedTypeIdentifier:requestedItemProviderIndex:completionHandler:", v6, v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));

}

- (SLDServiceProxy)serviceProxy
{
  SLDServiceProxy *serviceProxy;
  void *v4;
  uint64_t v5;
  void *v6;
  SLDServiceProxy *v7;
  SLDServiceProxy *v8;

  serviceProxy = self->_serviceProxy;
  if (!serviceProxy)
  {
    v4 = (void *)MEMORY[0x1E0DA8868];
    v5 = objc_opt_class();
    objc_msgSend((id)objc_opt_class(), "contentExtractorQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "proxyForServiceClass:targetSerialQueue:delegate:", v5, v6, self);
    v7 = (SLDServiceProxy *)objc_claimAutoreleasedReturnValue();
    v8 = self->_serviceProxy;
    self->_serviceProxy = v7;

    serviceProxy = self->_serviceProxy;
  }
  return serviceProxy;
}

- (id)remoteService
{
  void *v2;
  void *v3;

  -[SWShareableContentExtractor serviceProxy](self, "serviceProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)serviceProxyDidConnect:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  SWShareableContentExtractor *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SWShareableContentLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[SWShareableContentExtractor pendingContentExtractionRequests](self, "pendingContentExtractionRequests");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = self;
    v8 = 2048;
    v9 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_18EAB1000, v4, OS_LOG_TYPE_INFO, "Service proxy connected for shareable content extractor: %@. Servicing pending extraction requests: %tu", (uint8_t *)&v6, 0x16u);

  }
  -[SWShareableContentExtractor _processPendingContentExtractionRequests](self, "_processPendingContentExtractionRequests");
}

- (void)serviceProxyDidDisconnect:(id)a3
{
  NSObject *v4;
  int v5;
  SWShareableContentExtractor *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SWShareableContentLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_18EAB1000, v4, OS_LOG_TYPE_INFO, "Service proxy disconnected for shareable content extractor: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)setServiceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProxy, a3);
}

- (NSMutableArray)pendingContentExtractionRequests
{
  return self->_pendingContentExtractionRequests;
}

- (void)setPendingContentExtractionRequests:(id)a3
{
  objc_storeStrong((id *)&self->_pendingContentExtractionRequests, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingContentExtractionRequests, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
}

@end
