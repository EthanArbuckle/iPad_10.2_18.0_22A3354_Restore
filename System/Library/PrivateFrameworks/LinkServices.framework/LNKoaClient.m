@implementation LNKoaClient

- (id)initForBundleIdentifier:(id)a3
{
  id v5;
  LNKoaClient *v6;
  uint64_t v7;
  NSString *bundleIdentifier;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  NSOrderedSet *currentVocabularySet;
  LNKoaClient *v14;
  void *v16;
  objc_super v17;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNKoaClient.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier"));

  }
  v17.receiver = self;
  v17.super_class = (Class)LNKoaClient;
  v6 = -[LNKoaClient init](&v17, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    bundleIdentifier = v6->_bundleIdentifier;
    v6->_bundleIdentifier = (NSString *)v7;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INITIATED, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = dispatch_queue_create("com.apple.link.vocabularyDonationQueue", v10);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;

    currentVocabularySet = v6->_currentVocabularySet;
    v6->_currentVocabularySet = 0;

    v14 = v6;
  }

  return v6;
}

- (void)donateFullVocabularySet:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__LNKoaClient_donateFullVocabularySet_completionHandler___block_invoke;
  block[3] = &unk_1E45DE0A0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

- (id)buildKVItemListWithIncrementalIDs:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  void *v32;
  id v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%%0%du"), 3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v41 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v11, "entityIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v11, "term");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = 0;
          objc_msgSend(v13, "addFieldWithType:value:error:", 275, v14, &v39);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v39;

          if (!v15)
          {
            getLNLogCategoryVocabulary();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v46 = v16;
              _os_log_impl(&dword_1A18F6000, v17, OS_LOG_TYPE_ERROR, "Failed to add a app entity name field. Error: %@", buf, 0xCu);
            }

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v32, v8);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          -[LNKoaClient getKVItemBuilderFor:itemId:](self, "getKVItemBuilderFor:itemId:", v11, v16);
          v18 = objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v13 = (void *)v18;
            objc_msgSend(v11, "entityIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKey:", v13, v19);

            v8 = (v8 + 1);
          }
          else
          {
            getLNLogCategoryVocabulary();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A18F6000, v20, OS_LOG_TYPE_INFO, "Could not create KVItemBuilder for term, skipping", buf, 2u);
            }

            v13 = 0;
          }
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v7);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v21 = obj;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v36 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "entityIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          -[LNKoaClient buildKVItemFrom:](self, "buildKVItemFrom:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
          {
            objc_msgSend(v33, "addObject:", v28);
            objc_msgSend(v5, "removeObjectForKey:", v26);
          }
          else
          {
            getLNLogCategoryVocabulary();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v46 = v26;
              _os_log_impl(&dword_1A18F6000, v29, OS_LOG_TYPE_ERROR, "Failed to build a KVItem for %@, skipping", buf, 0xCu);
            }

          }
        }

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v23);
  }

  v30 = v33;
  return v30;
}

- (id)getKVItemBuilderFor:(id)a3 itemId:(id)a4
{
  id v5;
  id v6;
  void *v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  __int128 buf;
  void (*v36)(uint64_t);
  void *v37;
  uint64_t *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2050000000;
  v7 = (void *)getKVItemBuilderClass_softClass;
  v34 = getKVItemBuilderClass_softClass;
  if (!getKVItemBuilderClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v36 = __getKVItemBuilderClass_block_invoke;
    v37 = &unk_1E45DDB30;
    v38 = &v31;
    __getKVItemBuilderClass_block_invoke((uint64_t)&buf);
    v7 = (void *)v32[3];
  }
  v8 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v31, 8);
  v9 = objc_alloc_init(v8);
  objc_msgSend(v5, "term");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entityIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "typeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "entityIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "instanceIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0;
  objc_msgSend(v9, "setItemType:itemId:error:", 7, v6, &v30);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v30;

  if (v15)
  {
    v29 = v16;
    objc_msgSend(v9, "addFieldWithType:value:error:", 275, v10, &v29);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v29;

    if (!v17)
    {
      getLNLogCategoryVocabulary();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v18;
        _os_log_impl(&dword_1A18F6000, v23, OS_LOG_TYPE_ERROR, "Failed to add a app entity name field. Error: %@", (uint8_t *)&buf, 0xCu);
      }

      goto LABEL_21;
    }
    v28 = v18;
    objc_msgSend(v9, "addFieldWithType:value:error:", 276, v12, &v28);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v28;

    if (v19)
    {
      v27 = v16;
      objc_msgSend(v9, "addFieldWithType:value:error:", 277, v14, &v27);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v27;

      if (v20)
      {
        v21 = v9;
LABEL_22:
        v16 = v18;
        goto LABEL_23;
      }
      getLNLogCategoryVocabulary();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v18;
        _os_log_impl(&dword_1A18F6000, v25, OS_LOG_TYPE_ERROR, "Failed to add a app entity id field. Error: %@", (uint8_t *)&buf, 0xCu);
      }

LABEL_21:
      v21 = 0;
      goto LABEL_22;
    }
    getLNLogCategoryVocabulary();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v16;
      _os_log_impl(&dword_1A18F6000, v24, OS_LOG_TYPE_ERROR, "Failed to add a app entity type class name field. Error: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  else
  {
    getLNLogCategoryVocabulary();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v16;
      _os_log_impl(&dword_1A18F6000, v22, OS_LOG_TYPE_ERROR, "Failed to create a KVItemBuilder. Error: %@", (uint8_t *)&buf, 0xCu);
    }

  }
  v21 = 0;
LABEL_23:

  return v21;
}

- (id)buildKVItemFrom:(id)a3
{
  void *v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = 0;
    objc_msgSend(a3, "buildItemWithError:", &v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v7;
    if (!v3)
    {
      getLNLogCategoryVocabulary();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v9 = v4;
        _os_log_impl(&dword_1A18F6000, v5, OS_LOG_TYPE_ERROR, "Failed to build a KVItem. Error: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)completeWithError:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id, id))a4 + 2))(a4, a3);
}

- (void)completeSuccessfully:(id)a3
{
  if (a3)
    (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSOrderedSet)currentVocabularySet
{
  return self->_currentVocabularySet;
}

- (void)setCurrentVocabularySet:(id)a3
{
  objc_storeStrong((id *)&self->_currentVocabularySet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentVocabularySet, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

void __57__LNKoaClient_donateFullVocabularySet_completionHandler___block_invoke(id *a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  dispatch_time_t v17;
  NSObject *v18;
  NSObject *v19;
  double v20;
  NSObject *v21;
  _QWORD v22[4];
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 buf;
  void (*v33)(uint64_t);
  void *v34;
  uint64_t *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*((id *)a1[4] + 3), "isEqualToOrderedSet:", a1[5]))
  {
    getLNLogCategoryVocabulary();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A18F6000, v2, OS_LOG_TYPE_INFO, "Vocabulary set did not change, exiting early from donation method.", (uint8_t *)&buf, 2u);
    }

    objc_msgSend(a1[4], "completeSuccessfully:", a1[6]);
  }
  else
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x2050000000;
    v3 = (void *)getKVDonatorClass_softClass;
    v31 = getKVDonatorClass_softClass;
    if (!getKVDonatorClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v33 = __getKVDonatorClass_block_invoke;
      v34 = &unk_1E45DDB30;
      v35 = &v28;
      __getKVDonatorClass_block_invoke((uint64_t)&buf);
      v3 = (void *)v29[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v28, 8);
    if (!v4)
      objc_msgSend(a1[4], "completeSuccessfully:", a1[6]);
    v5 = objc_msgSend(a1[5], "copy");
    v6 = a1[4];
    v7 = (void *)v6[3];
    v6[3] = v5;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = dispatch_group_create();
    getLNLogCategoryVocabulary();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = objc_msgSend(a1[5], "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1A18F6000, v10, OS_LOG_TYPE_INFO, "Making a full vocabulary donation to SiriVocabulary (%lu terms)", (uint8_t *)&buf, 0xCu);
    }

    v12 = *((_QWORD *)a1[4] + 1);
    v27 = 0;
    objc_msgSend(v4, "donatorWithItemType:originAppId:error:", 7, v12, &v27);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v27;
    if (v13)
    {
      dispatch_group_enter(v9);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __57__LNKoaClient_donateFullVocabularySet_completionHandler___block_invoke_11;
      v22[3] = &unk_1E45DCD48;
      v15 = v9;
      v16 = a1[4];
      v23 = v15;
      v24 = v16;
      v26 = a1[6];
      v25 = a1[5];
      objc_msgSend(v13, "donateWithOptions:usingStream:", 0, v22);
      v17 = dispatch_time(0, 300000000000);
      if (dispatch_group_wait(v15, v17))
      {
        getLNLogCategoryVocabulary();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 134217984;
          *(_QWORD *)((char *)&buf + 4) = 0x4072C00000000000;
          _os_log_impl(&dword_1A18F6000, v18, OS_LOG_TYPE_ERROR, "Timed out waiting for stream after %f seconds", (uint8_t *)&buf, 0xCu);
        }

      }
      getLNLogCategoryVocabulary();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "timeIntervalSinceNow");
        LODWORD(buf) = 134217984;
        *(double *)((char *)&buf + 4) = -v20;
        _os_log_impl(&dword_1A18F6000, v19, OS_LOG_TYPE_DEBUG, "Koa donation took %f", (uint8_t *)&buf, 0xCu);
      }

    }
    else
    {
      getLNLogCategoryVocabulary();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v14;
        _os_log_impl(&dword_1A18F6000, v21, OS_LOG_TYPE_ERROR, "Cannot create a KVDonator. Error: %@", (uint8_t *)&buf, 0xCu);
      }

      objc_msgSend(a1[4], "completeWithError:completion:", v14, a1[6]);
    }

  }
}

void __57__LNKoaClient_donateFullVocabularySet_completionHandler___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  id v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  void *v23;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  int v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint8_t v39[128];
  __int128 buf;
  void (*v41)(uint64_t);
  void *v42;
  uint64_t *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v25 = a3;
  v22 = v4;
  if (v25)
  {
    getLNLogCategoryVocabulary();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v25;
      _os_log_impl(&dword_1A18F6000, v5, OS_LOG_TYPE_ERROR, "Cannot initiate donation stream. Error: %@", (uint8_t *)&buf, 0xCu);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "completeWithError:completion:", v25, *(_QWORD *)(a1 + 56), v4);
  }
  else
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x2050000000;
    v6 = (void *)getKVFullDatasetStreamClass_softClass;
    v38 = getKVFullDatasetStreamClass_softClass;
    if (!getKVFullDatasetStreamClass_softClass)
    {
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v41 = __getKVFullDatasetStreamClass_block_invoke;
      v42 = &unk_1E45DDB30;
      v43 = &v35;
      __getKVFullDatasetStreamClass_block_invoke((uint64_t)&buf);
      v6 = (void *)v36[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v35, 8);
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v4;
      objc_msgSend(*(id *)(a1 + 40), "buildKVItemListWithIncrementalIDs:", *(_QWORD *)(a1 + 48));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v10 = 0;
      v11 = 0;
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v32 != v13)
              objc_enumerationMutation(v9);
            v15 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
            v30 = v10;
            objc_msgSend(v8, "registerItem:error:", v15, &v30, v22);
            v16 = v30;

            v10 = v16;
            if (v16)
            {
              getLNLogCategoryVocabulary();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                LOWORD(buf) = 0;
                _os_log_impl(&dword_1A18F6000, v17, OS_LOG_TYPE_INFO, "Could not register KVItem with stream, skipping", (uint8_t *)&buf, 2u);
              }

              ++v11;
            }
          }
          v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        }
        while (v12);
      }
      v18 = objc_msgSend(v9, "count", v22);
      getLNLogCategoryVocabulary();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf) = 67109376;
        DWORD1(buf) = v18 - v11;
        WORD4(buf) = 1024;
        *(_DWORD *)((char *)&buf + 10) = v11;
        _os_log_impl(&dword_1A18F6000, v19, OS_LOG_TYPE_DEBUG, "Stream registered %d and rejected %d items", (uint8_t *)&buf, 0xEu);
      }

      if (v11 && v18 == v11)
      {
        getLNLogCategoryVocabulary();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1A18F6000, v20, OS_LOG_TYPE_INFO, "No items were registered with some items rejected, cancelling stream", (uint8_t *)&buf, 2u);
        }

        objc_msgSend(v8, "cancel");
        dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
        objc_msgSend(*(id *)(a1 + 40), "completeSuccessfully:", *(_QWORD *)(a1 + 56));
      }
      else
      {
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __57__LNKoaClient_donateFullVocabularySet_completionHandler___block_invoke_12;
        v26[3] = &unk_1E45DCD20;
        v26[4] = *(_QWORD *)(a1 + 40);
        v28 = *(id *)(a1 + 56);
        v29 = v18 - v11;
        v27 = *(id *)(a1 + 32);
        objc_msgSend(v8, "finish:", v26);

      }
    }
    else
    {
      getLNLogCategoryVocabulary();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_1A18F6000, v21, OS_LOG_TYPE_ERROR, "Received unexpected donation stream type", (uint8_t *)&buf, 2u);
      }

      dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "completeWithError:completion:", 0, *(_QWORD *)(a1 + 56), v4);
    }
  }

}

void __57__LNKoaClient_donateFullVocabularySet_completionHandler___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  getLNLogCategoryVocabulary();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1A18F6000, v5, OS_LOG_TYPE_ERROR, "Cannot finish stream. Error: %@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "completeWithError:completion:", v3, *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = *(_DWORD *)(a1 + 56);
      v7 = 67109120;
      LODWORD(v8) = v6;
      _os_log_impl(&dword_1A18F6000, v5, OS_LOG_TYPE_INFO, "Successfully donated %d terms to SiriVocabulary", (uint8_t *)&v7, 8u);
    }

    objc_msgSend(*(id *)(a1 + 32), "completeSuccessfully:", *(_QWORD *)(a1 + 48));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

@end
