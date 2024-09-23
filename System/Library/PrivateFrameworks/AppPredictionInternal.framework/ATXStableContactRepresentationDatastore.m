@implementation ATXStableContactRepresentationDatastore

- (ATXStableContactRepresentationDatastore)initWithContactStore:(id)a3
{
  id v4;
  void *v5;
  ATXStableContactRepresentationDatastore *v6;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = -[ATXStableContactRepresentationDatastore initWithStableContactRepresentationDatabase:contactStore:](self, "initWithStableContactRepresentationDatabase:contactStore:", v5, v4);

  return v6;
}

- (ATXStableContactRepresentationDatastore)initWithStableContactRepresentationDatabase:(id)a3 contactStore:(id)a4
{
  id v7;
  id v8;
  ATXStableContactRepresentationDatastore *v9;
  ATXStableContactRepresentationDatastore *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXStableContactRepresentationDatastore;
  v9 = -[ATXStableContactRepresentationDatastore init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_stableContactRepresentationDatabase, a3);
    objc_storeStrong((id *)&v10->_contactStore, a4);
  }

  return v10;
}

- (id)cnContactForCnContactId:(id)a3 rawIdentifier:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = *MEMORY[0x1E0C967C0];
  v15 = *MEMORY[0x1E0C966E8];
  v16 = v7;
  v17 = *MEMORY[0x1E0C966A8];
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v15, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0D70968]);
  v12 = (void *)objc_msgSend(v11, "initWithContactStore:keysToFetch:", self->_contactStore, v10, v15, v16, v17, v18);
  objc_msgSend(v12, "contactWithIdentifier:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && !v13)
  {
    objc_msgSend(v12, "resolveContactIfPossibleFromContactIdentifierString:pickFirstOfMultiple:", v6, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)updateAndGetStableContactIdentifier:(id)a3 rawIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  -[ATXStableContactRepresentationDatastore stableContactIdentifierWithCnContactId:](self, "stableContactIdentifierWithCnContactId:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    v10 = v9;
    goto LABEL_19;
  }
  -[ATXStableContactRepresentationDatastore cnContactForCnContactId:rawIdentifier:](self, "cnContactForCnContactId:rawIdentifier:", v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "phoneNumbers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_pas_mappedArrayWithTransform:", &__block_literal_global_60);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "emailAddresses");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_pas_mappedArrayWithTransform:", &__block_literal_global_92);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14 && objc_msgSend(v14, "count"))
    {
      v17 = &__block_literal_global_94;
      v18 = v14;
    }
    else
    {
      if (!v16 || !objc_msgSend(v16, "count"))
        goto LABEL_13;
      v17 = &__block_literal_global_95;
      v18 = v16;
    }
    objc_msgSend(v18, "sortedArrayUsingComparator:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hash");

    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), v21);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[ATXStableContactRepresentationDatastore insertCnContactIdToStableContactIdentifierWithCnContactId:stableContactIdentifier:](self, "insertCnContactIdToStableContactIdentifierWithCnContactId:stableContactIdentifier:", v6, v9);
LABEL_14:

      goto LABEL_15;
    }
LABEL_13:
    v9 = 0;
    goto LABEL_14;
  }
  v9 = 0;
LABEL_15:
  if (v9)
    v22 = v9;
  else
    v22 = v6;
  v10 = v22;

LABEL_19:
  return v10;
}

id __93__ATXStableContactRepresentationDatastore_updateAndGetStableContactIdentifier_rawIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v2, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __93__ATXStableContactRepresentationDatastore_updateAndGetStableContactIdentifier_rawIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __93__ATXStableContactRepresentationDatastore_updateAndGetStableContactIdentifier_rawIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __93__ATXStableContactRepresentationDatastore_updateAndGetStableContactIdentifier_rawIdentifier___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)insertCnContactIdToStableContactIdentifierWithCnContactId:(id)a3 stableContactIdentifier:(id)a4
{
  -[ATXStableContactRepresentationDatabase insertCnContactIdToStableContactIdentifierWithCnContactId:stableContactIdentifier:](self->_stableContactRepresentationDatabase, "insertCnContactIdToStableContactIdentifierWithCnContactId:stableContactIdentifier:", a3, a4);
}

- (id)cnContactIdWithStableContactIdentifier:(id)a3
{
  return -[ATXStableContactRepresentationDatabase cnContactId:](self->_stableContactRepresentationDatabase, "cnContactId:", a3);
}

- (id)stableContactIdentifierWithCnContactId:(id)a3
{
  return -[ATXStableContactRepresentationDatabase stableContactIdentifier:](self->_stableContactRepresentationDatabase, "stableContactIdentifier:", a3);
}

- (id)stableContactRepresentationForCnContactId:(id)a3 rawIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  ATXStableContactRepresentation *v9;
  NSObject *v10;
  uint8_t v12[16];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[ATXStableContactRepresentationDatastore updateAndGetStableContactIdentifier:rawIdentifier:](self, "updateAndGetStableContactIdentifier:rawIdentifier:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ATXStableContactRepresentation initWithStableContactIdentifier:cnContactId:rawIdentifier:]([ATXStableContactRepresentation alloc], "initWithStableContactIdentifier:cnContactId:rawIdentifier:", v8, v6, v7);

  }
  else
  {
    __atxlog_handle_notification_management();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "cnContactId provided is nil", v12, 2u);
    }

    v9 = 0;
  }

  return v9;
}

- (id)stableContactRepresentationForStableContactIdentifier:(id)a3
{
  id v4;
  void *v5;
  ATXStableContactRepresentation *v6;
  NSObject *v7;
  uint8_t v9[16];

  v4 = a3;
  if (v4)
  {
    -[ATXStableContactRepresentationDatastore cnContactIdWithStableContactIdentifier:](self, "cnContactIdWithStableContactIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ATXStableContactRepresentation initWithStableContactIdentifier:cnContactId:rawIdentifier:]([ATXStableContactRepresentation alloc], "initWithStableContactIdentifier:cnContactId:rawIdentifier:", v4, v5, 0);

  }
  else
  {
    __atxlog_handle_notification_management();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "stableContactIdentifier provided is nil", v9, 2u);
    }

    v6 = 0;
  }

  return v6;
}

- (id)refreshCnContactIdsGivenContactEntities:(id)a3
{
  id v4;
  void *v5;
  CNContactStore *contactStore;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  _QWORD v35[4];

  v35[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  contactStore = self->_contactStore;
  v7 = objc_alloc(MEMORY[0x1E0C97210]);
  v8 = *MEMORY[0x1E0C967C0];
  v35[0] = *MEMORY[0x1E0C966E8];
  v35[1] = v8;
  v35[2] = *MEMORY[0x1E0C966A8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithKeysToFetch:", v9);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __83__ATXStableContactRepresentationDatastore_refreshCnContactIdsGivenContactEntities___block_invoke;
  v26[3] = &unk_1E82DE848;
  v26[4] = self;
  v11 = v4;
  v27 = v11;
  v12 = v5;
  v28 = v12;
  -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:](contactStore, "enumerateContactsWithFetchRequest:error:usingBlock:", v10, 0, v26);

  v13 = objc_msgSend(v11, "count");
  v14 = objc_msgSend(v12, "count");
  __atxlog_handle_notification_management();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v13 == v14)
  {
    if (v16)
    {
      v17 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 136315394;
      v30 = "-[ATXStableContactRepresentationDatastore refreshCnContactIdsGivenContactEntities:]";
      v31 = 2048;
      v32 = v17;
      v18 = "%s: returning number of contactEntitesSeen = %lu";
      v19 = v15;
      v20 = 22;
LABEL_6:
      _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
    }
  }
  else if (v16)
  {
    v21 = objc_msgSend(v11, "count");
    v22 = objc_msgSend(v12, "count");
    *(_DWORD *)buf = 136315650;
    v30 = "-[ATXStableContactRepresentationDatastore refreshCnContactIdsGivenContactEntities:]";
    v31 = 2048;
    v32 = v21;
    v33 = 2048;
    v34 = v22;
    v18 = "%s: received %ld contact entities, but only found %ld associated contacts";
    v19 = v15;
    v20 = 32;
    goto LABEL_6;
  }

  v23 = v28;
  v24 = v12;

  return v24;
}

void __83__ATXStableContactRepresentationDatastore_refreshCnContactIdsGivenContactEntities___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v19;
  id v20;

  v20 = a2;
  v3 = (void *)MEMORY[0x1CAA48B6C]();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v20, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stableContactIdentifierWithCnContactId:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_6;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v20, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "phoneNumbers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v7, "stableContactRepresentationForCnContactId:rawIdentifier:", v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v20, "emailAddresses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "label");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stableContactRepresentationForCnContactId:rawIdentifier:", v8, v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v12, "stableContactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
LABEL_6:
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setCnContactId:", v18);

      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v19, v6);

    }
  }

  objc_autoreleasePoolPop(v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_stableContactRepresentationDatabase, 0);
}

@end
