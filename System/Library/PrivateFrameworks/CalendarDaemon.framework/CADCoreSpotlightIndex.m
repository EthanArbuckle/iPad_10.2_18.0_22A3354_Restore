@implementation CADCoreSpotlightIndex

- (CADCoreSpotlightIndex)initWithBundleID:(id)a3
{
  id v4;
  CADCoreSpotlightIndex *v5;
  id v6;
  uint64_t v7;
  CSSearchableIndex *index;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CADCoreSpotlightIndex;
  v5 = -[CADCoreSpotlightIndex init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CA6B38]);
    v7 = objc_msgSend(v6, "initWithName:protectionClass:bundleIdentifier:", CFSTR("events"), *MEMORY[0x1E0CB2AC0], v4);
    index = v5->_index;
    v5->_index = (CSSearchableIndex *)v7;

  }
  return v5;
}

- (void)deleteSearchableItemsWithDomainIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  CSSearchableIndex *index;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  +[CADSpotlightLogger log:](CADSpotlightLogger, "log:", CFSTR("started deleteSearchableItemsWithDomainIdentifiers: %@"), v7);
  index = self->_index;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__CADCoreSpotlightIndex_deleteSearchableItemsWithDomainIdentifiers_completionHandler___block_invoke;
  v10[3] = &unk_1E6A37B50;
  v11 = v6;
  v9 = v6;
  -[CSSearchableIndex deleteSearchableItemsWithDomainIdentifiers:completionHandler:](index, "deleteSearchableItemsWithDomainIdentifiers:completionHandler:", v7, v10);

}

void __86__CADCoreSpotlightIndex_deleteSearchableItemsWithDomainIdentifiers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  v5 = v4;
  if (a2)
    +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", CFSTR("finished deleteSearchableItemsWithDomainIdentifiers: %@"), v4);
  else
    +[CADSpotlightLogger log:](CADSpotlightLogger, "log:", CFSTR("finished deleteSearchableItemsWithDomainIdentifiers"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)indexSearchableItems:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CSSearchableIndex *index;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "CalMap:", &__block_literal_global_18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CADSpotlightLogger log:](CADSpotlightLogger, "log:", CFSTR("started indexSearchableItems: %@"), v8);
  index = self->_index;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__CADCoreSpotlightIndex_indexSearchableItems_completionHandler___block_invoke_2;
  v11[3] = &unk_1E6A37B50;
  v12 = v6;
  v10 = v6;
  -[CSSearchableIndex indexSearchableItems:completionHandler:](index, "indexSearchableItems:completionHandler:", v7, v11);

}

id __64__CADCoreSpotlightIndex_indexSearchableItems_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a2;
  objc_msgSend(v3, "domainIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@, %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __64__CADCoreSpotlightIndex_indexSearchableItems_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  v5 = v4;
  if (a2)
    +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", CFSTR("finished indexSearchableItems: %@"), v4);
  else
    +[CADSpotlightLogger log:](CADSpotlightLogger, "log:", CFSTR("finished indexSearchableItems"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)deleteAllSearchableItemsForBundleID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  CSSearchableIndex *index;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  +[CADSpotlightLogger log:](CADSpotlightLogger, "log:", CFSTR("started deleteAllSearchableItemsForBundleID: %@"), v7);
  index = self->_index;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__CADCoreSpotlightIndex_deleteAllSearchableItemsForBundleID_completionHandler___block_invoke;
  v10[3] = &unk_1E6A37B50;
  v11 = v6;
  v9 = v6;
  -[CSSearchableIndex deleteAllSearchableItemsForBundleID:completionHandler:](index, "deleteAllSearchableItemsForBundleID:completionHandler:", v7, v10);

}

void __79__CADCoreSpotlightIndex_deleteAllSearchableItemsForBundleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  v5 = v4;
  if (a2)
    +[CADSpotlightLogger logError:](CADSpotlightLogger, "logError:", CFSTR("finished deleteAllSearchableItemsForBundleID: %@"), v4);
  else
    +[CADSpotlightLogger log:](CADSpotlightLogger, "log:", CFSTR("finished deleteAllSearchableItemsForBundleID"));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_index, 0);
}

@end
