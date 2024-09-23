@implementation FCJSONRecordTreeSource

void __113__FCJSONRecordTreeSource_fetchRecordTreeWithRootIDs_branchKeysByRecordType_cachePolicy_edgeCacheHint_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "integerValue") == 9)
        {
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12[0] = v8;
          v12[1] = 3221225472;
          v12[2] = __113__FCJSONRecordTreeSource_fetchRecordTreeWithRootIDs_branchKeysByRecordType_cachePolicy_edgeCacheHint_completion___block_invoke_4;
          v12[3] = &unk_1E463D310;
          v13 = v3;
          objc_msgSend(v11, "enumerateRecordsAndInterestTokensWithBlock:", v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

void __113__FCJSONRecordTreeSource_fetchRecordTreeWithRootIDs_branchKeysByRecordType_cachePolicy_edgeCacheHint_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(v3, "json");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "base");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v6);

}

void __113__FCJSONRecordTreeSource_fetchRecordTreeWithRootIDs_branchKeysByRecordType_cachePolicy_edgeCacheHint_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void (**v7)(id, _QWORD, uint64_t);
  void *v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(id, _QWORD, uint64_t);

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    v7 = (void (**)(id, _QWORD, uint64_t))*(id *)(a1 + 32);
    v7[2](v7, MEMORY[0x1E0C9AA70], a3);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99D80];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __113__FCJSONRecordTreeSource_fetchRecordTreeWithRootIDs_branchKeysByRecordType_cachePolicy_edgeCacheHint_completion___block_invoke_3;
    v10[3] = &unk_1E463AA78;
    v11 = (void (**)(id, _QWORD, uint64_t))v5;
    objc_msgSend(v8, "fc_dictionary:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    v7 = v11;
  }

}

- (void)fetchRecordTreeWithRootIDs:(id)a3 branchKeysByRecordType:(id)a4 cachePolicy:(id)a5 edgeCacheHint:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  FCRecordChainFetchOperation *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[4];
  id v26;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = objc_alloc_init(FCRecordChainFetchOperation);
  HIDWORD(v18) = qos_class_self() - 9;
  LODWORD(v18) = HIDWORD(v18);
  v19 = 8 * (v18 >> 3) + 9;
  if ((v18 >> 3) >= 4)
    v20 = -1;
  else
    v20 = v19;
  -[FCOperation setQualityOfService:](v17, "setQualityOfService:", v20);
  -[FCJSONRecordTreeSource context](self, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setContext:](v17, "setContext:", v21);

  -[FCJSONRecordTreeSource jsonRecordSources](self, "jsonRecordSources");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCRecordChainFetchOperation setAdditionalRecordSources:](v17, "setAdditionalRecordSources:", v22);

  -[FCRecordChainFetchOperation setTopLevelRecordIDs:](v17, "setTopLevelRecordIDs:", v16);
  -[FCRecordChainFetchOperation setLinkKeysByRecordType:](v17, "setLinkKeysByRecordType:", v15);

  -[FCRecordChainFetchOperation setEdgeCacheHint:](v17, "setEdgeCacheHint:", v13);
  -[FCRecordChainFetchOperation setCachePolicy:](v17, "setCachePolicy:", v14);

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __113__FCJSONRecordTreeSource_fetchRecordTreeWithRootIDs_branchKeysByRecordType_cachePolicy_edgeCacheHint_completion___block_invoke;
  v25[3] = &unk_1E463B570;
  v26 = v12;
  v23 = v12;
  -[FCRecordChainFetchOperation setRecordChainCompletionHandler:](v17, "setRecordChainCompletionHandler:", v25);
  objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addOperation:", v17);

}

- (NSArray)jsonRecordSources
{
  return self->_jsonRecordSources;
}

- (FCContentContext)context
{
  return self->_context;
}

- (FCJSONRecordTreeSource)initWithContext:(id)a3 jsonRecordSources:(id)a4
{
  id v7;
  id v8;
  FCJSONRecordTreeSource *v9;
  FCJSONRecordTreeSource *v10;
  uint64_t v11;
  NSArray *jsonRecordSources;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCJSONRecordTreeSource;
  v9 = -[FCJSONRecordTreeSource init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    v11 = objc_msgSend(v8, "copy");
    jsonRecordSources = v10->_jsonRecordSources;
    v10->_jsonRecordSources = (NSArray *)v11;

  }
  return v10;
}

- (void)fetchRecordTreeWithRootIDs:(id)a3 branchKeysByRecordType:(id)a4 cachePolicy:(id)a5 completion:(id)a6
{
  -[FCJSONRecordTreeSource fetchRecordTreeWithRootIDs:branchKeysByRecordType:cachePolicy:edgeCacheHint:completion:](self, "fetchRecordTreeWithRootIDs:branchKeysByRecordType:cachePolicy:edgeCacheHint:completion:", a3, a4, a5, 0, a6);
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void)setJsonRecordSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonRecordSources, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
