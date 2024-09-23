@implementation NUANFLinkedContentProvider

- (NUANFLinkedContentProvider)initWithContentContext:(id)a3
{
  id v5;
  NUANFLinkedContentProvider *v6;
  NUANFLinkedContentProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NUANFLinkedContentProvider;
  v6 = -[NUANFLinkedContentProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contentContext, a3);

  return v7;
}

- (id)loadLinkedContentForHeadline:(id)a3 withContext:(id)a4 priority:(int64_t)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  int64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int64_t v44;
  dispatch_block_t block;
  void *v46;
  void *v47;
  _QWORD v49[4];
  NSObject *v50;
  _QWORD v51[4];
  NSObject *v52;
  _QWORD v53[4];
  NSObject *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  block = a6;
  objc_msgSend(v9, "linkedArticleIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  v13 = v12;
  v44 = a5;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  objc_msgSend(v9, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v16);

  objc_msgSend(v9, "linkedIssueIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");
  v19 = v18;
  v47 = v9;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v46 = v10;
  objc_msgSend(v10, "documentController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "additions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v56 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v29, "URL");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "fc_NewsArticleID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "fc_safelyAddObject:", v31);

          objc_msgSend(v30, "fc_NewsIssueID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "fc_safelyAddObject:", v32);

          objc_msgSend(v30, "fc_feldsparTagID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "fc_safelyAddObject:", v33);

        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v55, v59, 16);
    }
    while (v26);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = dispatch_group_create();
  v36 = objc_msgSend(v15, "count");
  v37 = MEMORY[0x24BDAC760];
  v38 = v44;
  if (v36)
  {
    dispatch_group_enter(v35);
    v53[0] = v37;
    v53[1] = 3221225472;
    v53[2] = __91__NUANFLinkedContentProvider_loadLinkedContentForHeadline_withContext_priority_completion___block_invoke;
    v53[3] = &unk_24D5A1D88;
    v54 = v35;
    -[NUANFLinkedContentProvider loadLinkedArticlesWithIDs:priority:completion:](self, "loadLinkedArticlesWithIDs:priority:completion:", v15, v44, v53);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v39);

  }
  if (objc_msgSend(v21, "count", v44))
  {
    dispatch_group_enter(v35);
    v51[0] = v37;
    v51[1] = 3221225472;
    v51[2] = __91__NUANFLinkedContentProvider_loadLinkedContentForHeadline_withContext_priority_completion___block_invoke_2;
    v51[3] = &unk_24D5A1D88;
    v52 = v35;
    -[NUANFLinkedContentProvider loadLinkedIssuesWithIDs:priority:completion:](self, "loadLinkedIssuesWithIDs:priority:completion:", v21, v38, v51);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v40);

  }
  if (objc_msgSend(v22, "count"))
  {
    dispatch_group_enter(v35);
    v49[0] = v37;
    v49[1] = 3221225472;
    v49[2] = __91__NUANFLinkedContentProvider_loadLinkedContentForHeadline_withContext_priority_completion___block_invoke_3;
    v49[3] = &unk_24D5A1D88;
    v50 = v35;
    -[NUANFLinkedContentProvider loadLinkedTagsWithIDs:priority:completion:](self, "loadLinkedTagsWithIDs:priority:completion:", v22, v38, v49);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObject:", v41);

  }
  dispatch_group_notify(v35, MEMORY[0x24BDAC9B8], block);
  objc_msgSend(MEMORY[0x24BE6CBF8], "groupCancelHandlerWithCancelHandlers:", v34);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  return v42;
}

- (id)loadLinkedArticlesWithIDs:(id)a3 priority:(int64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  id v17;
  id location;

  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  if (objc_msgSend(v8, "count"))
  {
    v10 = objc_alloc(MEMORY[0x24BE6CAB0]);
    -[NUANFLinkedContentProvider contentContext](self, "contentContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithContext:articleIDs:ignoreCacheForArticleIDs:", v11, v8, 0);

    objc_msgSend(v12, "setQualityOfService:", FCInferQualityOfServiceFromRelativePriority());
    objc_msgSend(v12, "setRelativePriority:", a4);
    objc_msgSend(v12, "setFetchCompletionQueue:", MEMORY[0x24BDAC9B8]);
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __76__NUANFLinkedContentProvider_loadLinkedArticlesWithIDs_priority_completion___block_invoke_2;
    v15[3] = &unk_24D5A3C90;
    objc_copyWeak(&v17, &location);
    v16 = v9;
    objc_msgSend(v12, "setFetchCompletionBlock:", v15);
    objc_msgSend(MEMORY[0x24BDD1710], "fc_sharedConcurrentQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addOperation:", v12);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    v9[2](v9);
    v12 = 0;
  }

  return v12;
}

- (FCContentContext)contentContext
{
  return self->_contentContext;
}

void __76__NUANFLinkedContentProvider_loadLinkedArticlesWithIDs_priority_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
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
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    if (objc_msgSend(v3, "status"))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      v15 = v6;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      objc_msgSend(v3, "fetchedObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v17 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            objc_msgSend(v13, "identifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKey:", v13, v14);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v10);
      }

      v6 = v15;
      objc_msgSend(v15, "setLinkedHeadlines:", v7);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __91__NUANFLinkedContentProvider_loadLinkedContentForHeadline_withContext_priority_completion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)setLinkedHeadlines:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)loadLinkedContentForHeadline:(id)a3 withContext:(id)a4 completion:(id)a5
{
  return -[NUANFLinkedContentProvider loadLinkedContentForHeadline:withContext:priority:completion:](self, "loadLinkedContentForHeadline:withContext:priority:completion:", a3, a4, 0, a5);
}

void __91__NUANFLinkedContentProvider_loadLinkedContentForHeadline_withContext_priority_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __91__NUANFLinkedContentProvider_loadLinkedContentForHeadline_withContext_priority_completion___block_invoke_3(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)headlineForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NUANFLinkedContentProvider linkedHeadlines](self, "linkedHeadlines");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)issueForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NUANFLinkedContentProvider linkedIssues](self, "linkedIssues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)tagForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NUANFLinkedContentProvider linkedTags](self, "linkedTags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)loadLinkedIssuesWithIDs:(id)a3 priority:(int64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  id v17;
  id location;

  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  if (objc_msgSend(v8, "count"))
  {
    v10 = objc_alloc(MEMORY[0x24BE6CC20]);
    -[NUANFLinkedContentProvider contentContext](self, "contentContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithContext:issueIDs:", v11, v8);

    objc_msgSend(v12, "setQualityOfService:", FCInferQualityOfServiceFromRelativePriority());
    objc_msgSend(v12, "setRelativePriority:", a4);
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __74__NUANFLinkedContentProvider_loadLinkedIssuesWithIDs_priority_completion___block_invoke_2;
    v15[3] = &unk_24D5A3CB8;
    objc_copyWeak(&v17, &location);
    v16 = v9;
    objc_msgSend(v12, "setFetchCompletionHandler:", v15);
    objc_msgSend(MEMORY[0x24BDD1710], "fc_sharedConcurrentQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addOperation:", v12);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    v9[2](v9);
    v12 = 0;
  }

  return v12;
}

void __74__NUANFLinkedContentProvider_loadLinkedIssuesWithIDs_priority_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "identifier", (_QWORD)v14);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v8, v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

    objc_msgSend(v6, "setLinkedIssues:", v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (id)loadLinkedTagsWithIDs:(id)a3 priority:(int64_t)a4 completion:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  void (**v16)(_QWORD);
  id v17;
  id location;

  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  if (objc_msgSend(v8, "count"))
  {
    -[NUANFLinkedContentProvider contentContext](self, "contentContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tagController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchOperationForTagsWithIDs:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setQualityOfService:", FCInferQualityOfServiceFromRelativePriority());
    objc_msgSend(v12, "setRelativePriority:", a4);
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __72__NUANFLinkedContentProvider_loadLinkedTagsWithIDs_priority_completion___block_invoke_2;
    v15[3] = &unk_24D5A3C90;
    objc_copyWeak(&v17, &location);
    v16 = v9;
    objc_msgSend(v12, "setFetchCompletionBlock:", v15);
    objc_msgSend(MEMORY[0x24BDD1710], "fc_sharedConcurrentQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addOperation:", v12);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    v9[2](v9);
    v12 = 0;
  }

  return v12;
}

void __72__NUANFLinkedContentProvider_loadLinkedTagsWithIDs_priority_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    if (!objc_msgSend(v7, "status"))
    {
      objc_msgSend(v7, "fetchedObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setLinkedTags:", v6);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (NSDictionary)linkedHeadlines
{
  return self->_linkedHeadlines;
}

- (NSDictionary)linkedTags
{
  return self->_linkedTags;
}

- (void)setLinkedTags:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)linkedIssues
{
  return self->_linkedIssues;
}

- (void)setLinkedIssues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedIssues, 0);
  objc_storeStrong((id *)&self->_linkedTags, 0);
  objc_storeStrong((id *)&self->_linkedHeadlines, 0);
  objc_storeStrong((id *)&self->_contentContext, 0);
}

@end
