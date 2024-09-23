@implementation AMSEngagementAppData

- (NSArray)eventFilters
{
  return self->_eventFilters;
}

- (NSArray)cachedResponses
{
  return self->_cachedResponses;
}

- (AMSEngagementAppData)initWithIdentifier:(id)a3 cacheObject:(id)a4
{
  id v7;
  id v8;
  AMSEngagementAppData *v9;
  AMSEngagementAppData *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  AMSEngagementAppEventFilterModel *v23;
  id v24;
  id v25;
  AMSEngagementAppEventFilterModel *v26;
  uint64_t v27;
  NSArray *eventFilters;
  id v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  NSArray *cachedResponses;
  AMSEngagementAppData *v36;
  _QWORD v37[4];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  objc_super v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v43.receiver = self;
  v43.super_class = (Class)AMSEngagementAppData;
  v9 = -[AMSEngagementAppData init](&v43, sel_init);
  v10 = v9;
  if (!v9)
    goto LABEL_26;
  objc_storeStrong((id *)&v9->_identifier, a3);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("eventFilters"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v36 = v10;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_6;
  }
  v12 = v11;

  if (!v12)
  {
LABEL_6:
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("whitelist"), v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v15;
    else
      v14 = 0;

    v13 = 0;
    goto LABEL_10;
  }
  v13 = v12;
  v14 = v13;
LABEL_10:

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v17 = v14;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v40 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v23 = [AMSEngagementAppEventFilterModel alloc];
        v24 = v22;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v25 = v24;
        else
          v25 = 0;

        v26 = -[AMSEngagementAppEventFilterModel initWithCacheObject:](v23, "initWithCacheObject:", v25);
        if (v26)
          objc_msgSend(v16, "addObject:", v26);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v19);
  }

  v27 = objc_msgSend(v16, "copy");
  v10 = v36;
  eventFilters = v36->_eventFilters;
  v36->_eventFilters = (NSArray *)v27;

  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cachedResponses"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v31 = v30;
  else
    v31 = 0;

  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __55__AMSEngagementAppData_initWithIdentifier_cacheObject___block_invoke;
  v37[3] = &unk_1E253EAE8;
  v38 = v29;
  v32 = v29;
  objc_msgSend(v31, "enumerateKeysAndObjectsUsingBlock:", v37);
  v33 = objc_msgSend(v32, "copy");
  cachedResponses = v36->_cachedResponses;
  v36->_cachedResponses = (NSArray *)v33;

LABEL_26:
  return v10;
}

void __55__AMSEngagementAppData_initWithIdentifier_cacheObject___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  AMSEngagementAppResponseModel *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v6;
  else
    v4 = 0;

  v5 = -[AMSEngagementAppResponseModel initWithCacheObject:]([AMSEngagementAppResponseModel alloc], "initWithCacheObject:", v4);
  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (id)exportObject
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  AMSEngagementAppData *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[2];
  _QWORD v35[2];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v25 = self;
  -[AMSEngagementAppData cachedResponses](self, "cachedResponses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v9, "exportObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cacheKey");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v11);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "UUIDString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v13);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v37, 16);
    }
    while (v6);
  }

  v14 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[AMSEngagementAppData eventFilters](v25, "eventFilters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithCapacity:", objc_msgSend(v15, "count"));

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[AMSEngagementAppData eventFilters](v25, "eventFilters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "exportObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v22);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
    }
    while (v19);
  }

  v34[0] = CFSTR("cachedResponses");
  v34[1] = CFSTR("eventFilters");
  v35[0] = v3;
  v35[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[AMSEngagementAppData identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSEngagementAppData exportObject](self, "exportObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithIdentifier:cacheObject:", v5, v6);

  return v7;
}

- (void)setCachedResponses:(id)a3
{
  objc_storeStrong((id *)&self->_cachedResponses, a3);
}

- (void)setEventFilters:(id)a3
{
  objc_storeStrong((id *)&self->_eventFilters, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_eventFilters, 0);
  objc_storeStrong((id *)&self->_cachedResponses, 0);
}

@end
