@implementation EDSpotlightDaemonClient

void ___ef_log_EDSpotlightDaemonClient_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "EDSpotlightDaemonClient");
  v1 = (void *)_ef_log_EDSpotlightDaemonClient_log;
  _ef_log_EDSpotlightDaemonClient_log = (uint64_t)v0;

}

- (EDSpotlightDaemonClient)initWithSearchableIndex:(id)a3 persistence:(id)a4
{
  id v6;
  id v7;
  EDSpotlightDaemonClient *v8;
  EDSpotlightDaemonClient *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)EDSpotlightDaemonClient;
  v8 = -[EDSpotlightDaemonClient init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[EDSpotlightDaemonClient setSearchableIndex:](v8, "setSearchableIndex:", v6);
    -[EDSpotlightDaemonClient setPersistence:](v9, "setPersistence:", v7);
    SpotlightDaemonClientRegister();
  }

  return v9;
}

- (void)reindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 acknowledgementHandler:(id)a5
{
  void *v6;
  id v7;

  v7 = a5;
  -[EDSpotlightDaemonClient searchableIndex](self, "searchableIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "reindexAllSearchableItemsWithAcknowledgementHandler:", v7);

}

- (void)reindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 acknowledgementHandler:(id)a6
{
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a6;
  -[EDSpotlightDaemonClient searchableIndex](self, "searchableIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reindexSearchableItemsWithIdentifiers:acknowledgementHandler:", v10, v8);

}

- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v11 = a6;
  v12 = a8;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __122__EDSpotlightDaemonClient_provideDataForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke;
  v16[3] = &unk_1E94A1D68;
  v17 = v11;
  v18 = v12;
  v13 = v11;
  v14 = v12;
  v15 = -[EDSpotlightDaemonClient fetchRepresentationForSearchableItemId:typeIdentifier:completionHandler:](self, "fetchRepresentationForSearchableItemId:typeIdentifier:completionHandler:", a5, v13, v16);

}

void __122__EDSpotlightDaemonClient_provideDataForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", *(_QWORD *)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "conformsToType:", *MEMORY[0x1E0CEC4D0]);

    if (v12)
    {
      v13 = (void *)MEMORY[0x1E0C99D50];
      objc_msgSend(v7, "contentURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dataWithContentsOfURL:", v14);
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = 0;
    }
    else
    {
      objc_msgSend(v8, "subject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "subjectString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "length"))
      {
        objc_msgSend(v8, "subject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "subjectString");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v18 = 0;
      }

      objc_msgSend(v7, "publicMessageURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "length") && v19)
      {
        v22 = *MEMORY[0x1E0DC32B8];
        v23[0] = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v18, v20);
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v21, 1, 0);
        v10 = objc_claimAutoreleasedReturnValue();

        v9 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EDMailSpotlightIndexErrorDomain"), 11, 0);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = 0;
      }

    }
    if (!(v10 | v9))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EDMailSpotlightIndexErrorDomain"), 13, 0);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v11 = a6;
  v12 = a8;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __125__EDSpotlightDaemonClient_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke;
  v16[3] = &unk_1E94A1D90;
  v17 = v11;
  v18 = v12;
  v13 = v12;
  v14 = v11;
  v15 = -[EDSpotlightDaemonClient fetchRepresentationForSearchableItemId:typeIdentifier:completionHandler:](self, "fetchRepresentationForSearchableItemId:typeIdentifier:completionHandler:", a5, v14, v16);

}

void __125__EDSpotlightDaemonClient_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "conformsToType:", *MEMORY[0x1E0CEC4D0]))
    objc_msgSend(v9, "contentURL");
  else
    objc_msgSend(v9, "publicMessageURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)searchableItemsDidUpdate:(id)a3 mask:(int64_t)a4
{
  char v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if ((v4 & 1) != 0)
  {
    _ef_log_EDSpotlightDaemonClient();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v6;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "spotlight updated items with summaries: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    -[EDSpotlightDaemonClient searchableIndex](self, "searchableIndex");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDSpotlightDaemonClient searchableIndex](self, "searchableIndex");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchableIndex:indexGeneratedSummaries:", v10, v6);

  }
}

- (id)fetchRepresentationForSearchableItemId:(id)a3 typeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "length"))
  {
    -[EDSpotlightDaemonClient persistence](self, "persistence");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageObjectIDsForSearchableItemIdentifiers:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "first");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_5;
    v24 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messagesForMessageObjectIDs:missedMessageObjectIDs:", v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0D1E130], "optionsWithRequestedRepresentationType:networkUsage:", *MEMORY[0x1E0D1DBF0], 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __99__EDSpotlightDaemonClient_fetchRepresentationForSearchableItemId_typeIdentifier_completionHandler___block_invoke;
      v22[3] = &unk_1E949C3C8;
      v23 = v8;
      objc_msgSend(v16, "requestRepresentationWithOptions:completionHandler:", v17, v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_5:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EDMailSpotlightIndexErrorDomain"), 12, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v17);
      v18 = 0;
    }

    v19 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EDMailSpotlightIndexErrorDomain"), 10, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v8 + 2))(v8, 0, 0, v20);

    v19 = 0;
  }

  return v19;
}

uint64_t __99__EDSpotlightDaemonClient_fetchRepresentationForSearchableItemId_typeIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (EDSearchableIndex)searchableIndex
{
  return self->_searchableIndex;
}

- (void)setSearchableIndex:(id)a3
{
  objc_storeStrong((id *)&self->_searchableIndex, a3);
}

- (EDMessagePersistence)persistence
{
  return self->_persistence;
}

- (void)setPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_persistence, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_searchableIndex, 0);
}

@end
