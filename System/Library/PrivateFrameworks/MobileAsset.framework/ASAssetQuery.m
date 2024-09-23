@implementation ASAssetQuery

- (ASAssetQuery)initWithAssetType:(id)a3 sessionIdentifier:(id)a4
{
  id v6;
  id v7;
  ASAssetQuery *v8;
  ASAssetQuery *v9;
  uint64_t v10;
  NSString *assetType;
  uint64_t v12;
  NSString *sessionIdentifier;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ASAssetQuery;
  v8 = -[ASAssetQuery init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_networkTimeout = 30.0;
    v10 = objc_msgSend(v6, "copy");
    assetType = v9->_assetType;
    v9->_assetType = (NSString *)v10;

    v12 = objc_msgSend(v7, "copy");
    sessionIdentifier = v9->_sessionIdentifier;
    v9->_sessionIdentifier = (NSString *)v12;

    v14 = (void *)objc_msgSend((id)objc_opt_new(), "initWithType:", v6);
    -[ASAssetQuery setMaQuery:](v9, "setMaQuery:", v14);

    -[ASAssetQuery maQuery](v9, "maQuery");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDoNotBlockOnNetworkStatus:", 1);

    -[ASAssetQuery maQuery](v9, "maQuery");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "returnTypes:", 2);

  }
  return v9;
}

- (MAAssetQuery)maQuery
{
  return self->maQuery;
}

void __27__ASAssetQuery_startQuery___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v6 = 0;
  objc_msgSend(v2, "runQueryAndReturnError:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v4);

}

- (void)startQuery:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __27__ASAssetQuery_startQuery___block_invoke;
  v7[3] = &unk_1E5D5CC20;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)setMaQuery:(id)a3
{
  objc_storeStrong((id *)&self->maQuery, a3);
}

- (id)runQueryForInfoReturnError:(id *)a3
{
  void *v4;
  NSObject *v5;
  NSString *assetType;
  NSObject *v7;
  dispatch_time_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  NSObject *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__2;
  v45 = __Block_byref_object_dispose__2;
  v46 = 0;
  if (!self->_queriesLocalAssetInformationOnly)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v4, "setDiscretionary:", 0);
    v5 = dispatch_group_create();
    dispatch_group_enter(v5);
    assetType = self->_assetType;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __43__ASAssetQuery_runQueryForInfoReturnError___block_invoke;
    v38[3] = &unk_1E5D5DDC0;
    v40 = &v41;
    v7 = v5;
    v39 = v7;
    +[MAAsset startCatalogDownload:options:completionWithError:](MAAsset, "startCatalogDownload:options:completionWithError:", assetType, v4, v38);
    v8 = dispatch_time(0, (uint64_t)(self->_networkTimeout * 1000000000.0));
    dispatch_group_wait(v7, v8);

  }
  -[ASAssetQuery maQuery](self, "maQuery");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "queryMetaDataSync");

  if (MAIsQueryResultFailure(v10))
  {
    v11 = (void *)v42[5];
    errorStringForMAQueryResult(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MAErrorWithUnderlying(CFSTR("com.apple.MobileAssetError.Query"), v10, v11, CFSTR("%@"), v13, v14, v15, v16, (uint64_t)v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _ASErrorForMAError(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }
  -[ASAssetQuery maQuery](self, "maQuery");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "results");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 == 0;

  if (v21)
  {
    v22 = 0;
  }
  else
  {
    v22 = (void *)objc_opt_new();
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[MAAssetQuery results](self->maQuery, "results");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v35 != v25)
            objc_enumerationMutation(v23);
          v27 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          v28 = (void *)MEMORY[0x1AF44EE58]();
          v29 = (void *)objc_msgSend((id)objc_opt_new(), "initWithMAAsset:", v27);
          objc_msgSend(v22, "addObject:", v29);

          objc_autoreleasePoolPop(v28);
        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
      }
      while (v24);
    }

    objc_msgSend(v32, "setObject:forKey:", v22, CFSTR("Assets"));
  }
  -[ASAssetQuery setResults:](self, "setResults:", v22);
  if (a3)
  {
    if (v22)
      v30 = 0;
    else
      v30 = v18;
    *a3 = objc_retainAutorelease(v30);
  }
  _Block_object_dispose(&v41, 8);

  return v32;
}

- (id)runQueryAndReturnError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[ASAssetQuery runQueryForInfoReturnError:](self, "runQueryForInfoReturnError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("Assets"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (ASAssetQuery)initWithAssetType:(id)a3
{
  return -[ASAssetQuery initWithAssetType:sessionIdentifier:](self, "initWithAssetType:sessionIdentifier:", a3, 0);
}

+ (id)queryPredicateForProperties:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__ASAssetQuery_queryPredicateForProperties___block_invoke;
  v9[3] = &unk_1E5D5DD98;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __44__ASAssetQuery_queryPredicateForProperties___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (NSArray)results
{
  return (NSArray *)(id)-[NSArray copy](self->_results, "copy");
}

void __43__ASAssetQuery_runQueryForInfoReturnError___block_invoke(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void)setPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_predicate, a3);
}

- (BOOL)queriesLocalAssetInformationOnly
{
  return self->_queriesLocalAssetInformationOnly;
}

- (void)setQueriesLocalAssetInformationOnly:(BOOL)a3
{
  self->_queriesLocalAssetInformationOnly = a3;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (double)networkTimeout
{
  return self->_networkTimeout;
}

- (void)setNetworkTimeout:(double)a3
{
  self->_networkTimeout = a3;
}

- (NSString)assetType
{
  return self->_assetType;
}

- (void)setAssetType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_assetType, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->maQuery, 0);
}

@end
