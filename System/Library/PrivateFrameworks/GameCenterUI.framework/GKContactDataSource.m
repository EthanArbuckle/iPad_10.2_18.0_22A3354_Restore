@implementation GKContactDataSource

- (GKContactDataSource)init
{
  GKContactDataSource *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKContactDataSource;
  v2 = -[GKContactDataSource init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C97298]);
    -[GKContactDataSource setStore:](v2, "setStore:", v3);

  }
  return v2;
}

- (id)keysToFetch
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[15];

  v16[14] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C966E8];
  v16[0] = v2;
  v16[1] = v3;
  v4 = *MEMORY[0x1E0C967C0];
  v16[2] = *MEMORY[0x1E0C966A8];
  v16[3] = v4;
  v5 = *MEMORY[0x1E0C966D0];
  v16[4] = *MEMORY[0x1E0C96790];
  v16[5] = v5;
  v6 = *MEMORY[0x1E0C966C0];
  v16[6] = *MEMORY[0x1E0C96780];
  v16[7] = v6;
  v7 = *MEMORY[0x1E0C96798];
  v16[8] = *MEMORY[0x1E0C96820];
  v16[9] = v7;
  v8 = *MEMORY[0x1E0C96898];
  v16[10] = *MEMORY[0x1E0C967A0];
  v16[11] = v8;
  v9 = *MEMORY[0x1E0C96890];
  v16[12] = *MEMORY[0x1E0C96708];
  v16[13] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *MEMORY[0x1E0C96848];
  v15[0] = *MEMORY[0x1E0C96850];
  v15[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)loadContactsWithHandler:(id)a3
{
  void (**v4)(id, id, id);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CNContactStore *store;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v4 = (void (**)(id, id, id))a3;
  -[GKContactDataSource keysToFetch](self, "keysToFetch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", v5);
  objc_msgSend(v6, "setSortOrder:", 1);
  -[CNContactStore _crossPlatformUnifiedMeContactWithKeysToFetch:error:](self->_store, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  store = self->_store;
  v22 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __47__GKContactDataSource_loadContactsWithHandler___block_invoke;
  v18 = &unk_1E59C5BC8;
  v11 = v7;
  v19 = v11;
  v12 = v8;
  v20 = v12;
  v13 = v9;
  v21 = v13;
  -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:](store, "enumerateContactsWithFetchRequest:error:usingBlock:", v6, &v22, &v15);
  v14 = v22;
  -[GKContactDataSource setContacts:](self, "setContacts:", v12, v15, v16, v17, v18);
  -[GKContactDataSource setContactLookup:](self, "setContactLookup:", v13);
  if (v4)
    v4[2](v4, v12, v14);

}

void __47__GKContactDataSource_loadContactsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  v4 = objc_msgSend(v16, "contactType");
  v5 = v16;
  if (!v4)
  {
    objc_msgSend(v16, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
LABEL_3:

LABEL_15:
      v5 = v16;
      goto LABEL_16;
    }
    objc_msgSend(v16, "givenName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");
    v10 = v16;
    v11 = v9;
    if (!v9)
    {
      objc_msgSend(v16, "familyName");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v2, "length"))
      {

        goto LABEL_3;
      }
      v10 = v16;
    }
    objc_msgSend(v10, "emailAddresses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {

      if (!v11)
      v5 = v16;
LABEL_14:
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
      v15 = *(void **)(a1 + 48);
      objc_msgSend(v16, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, v6);
      goto LABEL_15;
    }
    objc_msgSend(v16, "phoneNumbers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (!v11)
    v5 = v16;
    if (v14)
      goto LABEL_14;
  }
LABEL_16:

}

- (id)fetchContactWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GKContactDataSource keysToFetch](self, "keysToFetch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", v5);
  v7 = (void *)MEMORY[0x1E0C97200];
  v21[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateForContactsWithIdentifiers:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v9);

  -[GKContactDataSource store](self, "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v10, "enumeratorForContactFetchRequest:error:", v6, &v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v20;

  objc_msgSend(v11, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13 || v12)
  {
    if (!*MEMORY[0x1E0D25460])
      v17 = (id)GKOSLoggers();
    v18 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      -[GKContactDataSource fetchContactWithID:].cold.1(v18);
    v16 = 0;
  }
  else
  {
    objc_msgSend(v11, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allObjects");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (id)fullContactWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GKContactDataSource contactLookup](self, "contactLookup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CNContactStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (NSDictionary)contactLookup
{
  return self->_contactLookup;
}

- (void)setContactLookup:(id)a3
{
  objc_storeStrong((id *)&self->_contactLookup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactLookup, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)fetchContactWithID:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AB361000, log, OS_LOG_TYPE_ERROR, "Error retrieving enumerator for contact fetch request", v1, 2u);
}

@end
