@implementation CADFullLoggingSpotlightIndex

- (CADFullLoggingSpotlightIndex)initWithIndex:(id)a3
{
  id v5;
  CADFullLoggingSpotlightIndex *v6;
  CADFullLoggingSpotlightIndex *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADFullLoggingSpotlightIndex;
  v6 = -[CADFullLoggingSpotlightIndex init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_wrappedIndex, a3);

  return v7;
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  CADSpotlightIndex *wrappedIndex;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    *(_DWORD *)buf = 134218242;
    v15 = objc_msgSend(v6, "count");
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1B6A18000, v9, OS_LOG_TYPE_INFO, "deleteSearchableItems called with %lu domain identifiers: %@", buf, 0x16u);

  }
  wrappedIndex = self->_wrappedIndex;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __93__CADFullLoggingSpotlightIndex_deleteSearchableItemsWithDomainIdentifiers_completionHandler___block_invoke;
  v12[3] = &unk_1E6A37B50;
  v13 = v7;
  v11 = v7;
  -[CADSpotlightIndex deleteSearchableItemsWithDomainIdentifiers:completionHandler:](wrappedIndex, "deleteSearchableItemsWithDomainIdentifiers:completionHandler:", v6, v12);

}

void __93__CADFullLoggingSpotlightIndex_deleteSearchableItemsWithDomainIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B6A18000, v4, OS_LOG_TYPE_INFO, "deleteSearchableItems finished with error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)indexSearchableItems:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  CADSpotlightIndex *wrappedIndex;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24 = a4;
  v6 = (void *)CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_INFO))
  {
    v7 = v6;
    *(_DWORD *)buf = 134217984;
    v33 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1B6A18000, v7, OS_LOG_TYPE_INFO, "indexSearchableItems called with %lu searchable items: [", buf, 0xCu);

  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v13, "attributeSet", v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "attributeDictionary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v15, "mutableCopy");

        objc_msgSend(v16, "removeObjectForKey:", CFSTR("_kMDItemProviderDataTypes"));
        v17 = (void *)CADSpotlightHandle;
        if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_INFO))
        {
          v18 = v17;
          objc_msgSend(v13, "attributeSet");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "customAttributeDictionary");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v33 = (uint64_t)v16;
          v34 = 2112;
          v35 = v20;
          _os_log_impl(&dword_1B6A18000, v18, OS_LOG_TYPE_INFO, "Item %@\n%@", buf, 0x16u);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v10);
  }

  v21 = CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6A18000, v21, OS_LOG_TYPE_INFO, "]", buf, 2u);
  }
  wrappedIndex = self->_wrappedIndex;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __71__CADFullLoggingSpotlightIndex_indexSearchableItems_completionHandler___block_invoke;
  v26[3] = &unk_1E6A37B50;
  v27 = v24;
  v23 = v24;
  -[CADSpotlightIndex indexSearchableItems:completionHandler:](wrappedIndex, "indexSearchableItems:completionHandler:", v8, v26);

}

void __71__CADFullLoggingSpotlightIndex_indexSearchableItems_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B6A18000, v4, OS_LOG_TYPE_INFO, "indexSearchableItems finished with error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)deleteAllSearchableItemsForBundleID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CADSpotlightIndex *wrappedIndex;
  id v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl(&dword_1B6A18000, v8, OS_LOG_TYPE_INFO, "deleteSearchableItemsForBundleID called with bundle id: %@", buf, 0xCu);
  }
  wrappedIndex = self->_wrappedIndex;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __86__CADFullLoggingSpotlightIndex_deleteAllSearchableItemsForBundleID_completionHandler___block_invoke;
  v11[3] = &unk_1E6A37B50;
  v12 = v7;
  v10 = v7;
  -[CADSpotlightIndex deleteAllSearchableItemsForBundleID:completionHandler:](wrappedIndex, "deleteAllSearchableItemsForBundleID:completionHandler:", v6, v11);

}

void __86__CADFullLoggingSpotlightIndex_deleteAllSearchableItemsForBundleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = CADSpotlightHandle;
  if (os_log_type_enabled((os_log_t)CADSpotlightHandle, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1B6A18000, v4, OS_LOG_TYPE_INFO, "deleteAllSearchableItemsForBundleID finished with error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedIndex, 0);
}

@end
