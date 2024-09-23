@implementation ATXContactsDataSource

- (ATXContactsDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXContactsDataSource *v6;
  ATXContactsDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXContactsDataSource;
  v6 = -[ATXContactsDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (void)contactsWithIdentifiers:(id)a3 callback:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0C97200];
  v7 = a4;
  objc_msgSend(v6, "predicateForContactsWithIdentifiers:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXContactsDataSource _contactsWithPredicate:callback:](self, "_contactsWithPredicate:callback:", v8, v7);

}

- (void)contactsWithName:(id)a3 callback:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0C97200];
  v7 = a4;
  objc_msgSend(v6, "predicateForContactsMatchingName:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXContactsDataSource _contactsWithPredicate:callback:](self, "_contactsWithPredicate:callback:", v8, v7);

}

- (void)contactsWithEmail:(id)a3 callback:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0C97200];
  v7 = a4;
  objc_msgSend(v6, "predicateForContactsMatchingEmailAddress:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ATXContactsDataSource _contactsWithPredicate:callback:](self, "_contactsWithPredicate:callback:", v8, v7);

}

- (void)contactsWithPhone:(id)a3 callback:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (objc_class *)MEMORY[0x1E0C97398];
  v7 = a4;
  v8 = a3;
  v10 = (id)objc_msgSend([v6 alloc], "initWithStringValue:", v8);

  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXContactsDataSource _contactsWithPredicate:callback:](self, "_contactsWithPredicate:callback:", v9, v7);

}

- (void)_contactsWithPredicate:(id)a3 callback:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  if ((ATXHeuristicCanLearnFromApp(&unk_1E82D5530) & 1) != 0)
  {
    -[ATXHeuristicDevice contactsForPredicate:](self->_device, "contactsForPredicate:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v10);
            -[ATXHeuristicDevice dictContactForCNContact:](self->_device, "dictContactForCNContact:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i), (_QWORD)v17);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
              objc_msgSend(v9, "addObject:", v15);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v12);
      }

      v7[2](v7, v9, 0);
    }
    else
    {
      __atxlog_handle_heuristic();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[ATXContactsDataSource _contactsWithPredicate:callback:].cold.1(v16);

      v7[2](v7, 0, 0);
    }

  }
  else
  {
    v7[2](v7, (void *)MEMORY[0x1E0C9AA60], 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)_contactsWithPredicate:(os_log_t)log callback:.cold.1(os_log_t log)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = 0;
  _os_log_error_impl(&dword_1C99DF000, log, OS_LOG_TYPE_ERROR, "Error in contacts fetch: %@", (uint8_t *)&v1, 0xCu);
}

@end
