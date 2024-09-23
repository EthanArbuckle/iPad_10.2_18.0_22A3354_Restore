@implementation MPStoreContentReporter

- (MPStoreContentReporter)init
{
  MPStoreContentReporter *v2;
  NSOperationQueue *v3;
  NSOperationQueue *operationQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPStoreContentReporter;
  v2 = -[MPStoreContentReporter init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_operationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v2->_operationQueue, "setName:", CFSTR("com.apple.MediaPlayer.MPStoreContentReporter.operationQueue"));
    -[NSOperationQueue setQualityOfService:](v2->_operationQueue, "setQualityOfService:", 25);
  }
  return v2;
}

- (void)submitReport:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  MPStoreContentReporter *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  MPStoreContentReporter *v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _QWORD v53[5];
  _QWORD v54[7];

  v54[5] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v41 = a4;
  v42 = self;
  v7 = (void *)MEMORY[0x1E0CB3998];
  -[MPStoreContentReporter baseURLStringForReport](self, "baseURLStringForReport");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C99DE8];
  v43 = v9;
  objc_msgSend(v9, "queryItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0C99E08];
  v53[0] = CFSTR("activity");
  objc_msgSend(v6, "contentID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v14;
  v53[1] = CFSTR("concernItemType");
  v15 = objc_msgSend(v6, "concernItemType");
  v16 = &stru_1E3163D10;
  if (v15 <= 6)
    v16 = off_1E3162080[v15];
  v54[1] = v16;
  v53[2] = CFSTR("concernTypeId");
  objc_msgSend(v6, "concernTypeID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v54[2] = v17;
  v53[3] = CFSTR("concernItemId");
  objc_msgSend(v6, "contentID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v54[3] = v18;
  v53[4] = CFSTR("commentText");
  objc_msgSend(v6, "commentText");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (const __CFString *)v19;
  else
    v21 = &stru_1E3163D10;
  v54[4] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dictionaryWithDictionary:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v24 = v23;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v49 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
        v30 = (void *)MEMORY[0x1E0CB39D8];
        objc_msgSend(v24, "objectForKey:", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "queryItemWithName:value:", v29, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v12, "addObject:", v32);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v26);
  }

  objc_msgSend(v6, "aucType");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "length");

  if (v34)
  {
    v35 = (void *)MEMORY[0x1E0CB39D8];
    objc_msgSend(v6, "aucType");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "queryItemWithName:value:", CFSTR("concernItemAUCType"), v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addObject:", v37);
  }
  objc_msgSend(v43, "setQueryItems:", v12);
  objc_msgSend(v43, "URL");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __50__MPStoreContentReporter_submitReport_completion___block_invoke;
  v44[3] = &unk_1E3161FC0;
  v46 = v42;
  v47 = v41;
  v45 = v38;
  v39 = v41;
  v40 = v38;
  -[MPStoreContentReporter _performWithBag:](v42, "_performWithBag:", v44);

}

- (void)deleteComment:(id)a3 activityID:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v7 = a3;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__MPStoreContentReporter_deleteComment_activityID_completion___block_invoke;
  v11[3] = &unk_1E3161FC0;
  v11[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  -[MPStoreContentReporter _performWithBag:](self, "_performWithBag:", v11);

}

- (void)deletePost:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__MPStoreContentReporter_deletePost_completion___block_invoke;
  v10[3] = &unk_1E3161FC0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[MPStoreContentReporter _performWithBag:](self, "_performWithBag:", v10);

}

- (void)_performWithBag:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0DDC0A0]);
  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithIdentity:", v5);

  objc_msgSend(MEMORY[0x1E0DDC0D0], "sharedBagProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__MPStoreContentReporter__performWithBag___block_invoke;
  v9[3] = &unk_1E3161FE8;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v7, "getBagForRequestContext:withCompletionHandler:", v6, v9);

}

- (id)reportsForType:(int64_t)a3 contentID:(id)a4 aucType:(id)a5 commentText:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  MPStoreContentReport *v21;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = a4;
  v10 = a5;
  v11 = a6;
  -[MPStoreContentReporter _dictionariesForType:](self, "_dictionariesForType:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v12;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v18, "objectForKey:", CFSTR("label"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", CFSTR("id"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_alloc_init(MPStoreContentReport);
        -[MPStoreContentReport setConcernItemType:](v21, "setConcernItemType:", a3);
        -[MPStoreContentReport setConcernTypeID:](v21, "setConcernTypeID:", v20);
        -[MPStoreContentReport setDisplayText:](v21, "setDisplayText:", v19);
        -[MPStoreContentReport setContentID:](v21, "setContentID:", v24);
        -[MPStoreContentReport setAucType:](v21, "setAucType:", v10);
        -[MPStoreContentReport setCommentText:](v21, "setCommentText:", v11);
        objc_msgSend(v13, "addObject:", v21);

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v15);
  }

  return v13;
}

- (id)baseURLStringForReport
{
  void *v2;
  void *v3;

  -[MPStoreContentReporter _reportConcernBagDictionary](self, "_reportConcernBagDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_dictionariesForType:(int64_t)a3
{
  __CFString *v3;
  void *v4;
  void *v5;

  if ((unint64_t)a3 > 6)
  {
    v5 = 0;
  }
  else
  {
    v3 = off_1E31620B8[a3];
    -[MPStoreContentReporter _reportConcernBagDictionary](self, "_reportConcernBagDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_reportConcernBagDictionary
{
  NSDictionary *reportConcernBagDictionary;
  NSDictionary **p_reportConcernBagDictionary;
  dispatch_semaphore_t v5;
  NSObject *v6;
  _QWORD v8[4];
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  p_reportConcernBagDictionary = &self->_reportConcernBagDictionary;
  reportConcernBagDictionary = self->_reportConcernBagDictionary;
  if (!reportConcernBagDictionary)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__45369;
    v15 = __Block_byref_object_dispose__45370;
    v16 = 0;
    v5 = dispatch_semaphore_create(0);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__MPStoreContentReporter__reportConcernBagDictionary__block_invoke;
    v8[3] = &unk_1E3162010;
    v10 = &v11;
    v6 = v5;
    v9 = v6;
    -[MPStoreContentReporter _performWithBag:](self, "_performWithBag:", v8);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    objc_storeStrong((id *)p_reportConcernBagDictionary, (id)v12[5]);

    _Block_object_dispose(&v11, 8);
    reportConcernBagDictionary = *p_reportConcernBagDictionary;
  }
  return reportConcernBagDictionary;
}

- (id)_deleteCommentURLComponentsFromBag:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "dictionaryForBagKey:", *MEMORY[0x1E0DDBE98]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0CB3998];
    objc_msgSend(v3, "objectForKey:", CFSTR("deleteComment"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_deletePostURLComponentsFromBag:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "dictionaryForBagKey:", *MEMORY[0x1E0DDBE98]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0CB3998];
    objc_msgSend(v3, "objectForKey:", CFSTR("deleteSocialPost"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportConcernBagDictionary, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

void __53__MPStoreContentReporter__reportConcernBagDictionary__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "dictionaryForBagKey:", *MEMORY[0x1E0DDBE90]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("reportConcern"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __42__MPStoreContentReporter__performWithBag___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (!a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __48__MPStoreContentReporter_deletePost_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_deletePostURLComponentsFromBag:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v5, "queryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "stringByReplacingOccurrencesOfString:withString:", CFSTR("sa."), &stru_1E3163D10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("activity"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v10);
  objc_msgSend(v5, "setQueryItems:", v8);
  objc_msgSend(v5, "URL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__MPStoreContentReporter_deletePost_completion___block_invoke_2;
  v13[3] = &unk_1E3161F98;
  v14 = *(id *)(a1 + 48);
  MPStoreContentReporterURLOperation(v11, 0, v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addOperation:", v12);
}

uint64_t __48__MPStoreContentReporter_deletePost_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __62__MPStoreContentReporter_deleteComment_activityID_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_deleteCommentURLComponentsFromBag:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v5, "queryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("commentId"), *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);
  objc_msgSend(v5, "setQueryItems:", v8);
  objc_msgSend(v5, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__MPStoreContentReporter_deleteComment_activityID_completion___block_invoke_2;
  v12[3] = &unk_1E3161F98;
  v13 = *(id *)(a1 + 48);
  MPStoreContentReporterURLOperation(v10, 1, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addOperation:", v11);
}

uint64_t __62__MPStoreContentReporter_deleteComment_activityID_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __50__MPStoreContentReporter_submitReport_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  v2 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__MPStoreContentReporter_submitReport_completion___block_invoke_2;
  v4[3] = &unk_1E3161F98;
  v5 = *(id *)(a1 + 48);
  MPStoreContentReporterURLOperation(v2, 0, v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addOperation:", v3);

}

uint64_t __50__MPStoreContentReporter_submitReport_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (MPStoreContentReporter)sharedReporter
{
  if (sharedReporter_isDispatched_45495 != -1)
    dispatch_once(&sharedReporter_isDispatched_45495, &__block_literal_global_45496);
  return (MPStoreContentReporter *)(id)sharedReporter_sharedInstance_45497;
}

void __40__MPStoreContentReporter_sharedReporter__block_invoke()
{
  MPStoreContentReporter *v0;
  void *v1;

  v0 = objc_alloc_init(MPStoreContentReporter);
  v1 = (void *)sharedReporter_sharedInstance_45497;
  sharedReporter_sharedInstance_45497 = (uint64_t)v0;

}

@end
