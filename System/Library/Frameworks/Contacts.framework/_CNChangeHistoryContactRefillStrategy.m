@implementation _CNChangeHistoryContactRefillStrategy

- (id)initWithKeysToFetch:(char)a3 unifyResults:(void *)a4 contactStore:
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  objc_super v12;

  v7 = a2;
  v8 = a4;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)_CNChangeHistoryContactRefillStrategy;
    a1 = (id *)objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      v9 = objc_msgSend(v7, "copy");
      v10 = a1[2];
      a1[2] = (id)v9;

      *((_BYTE *)a1 + 8) = a3;
      objc_storeStrong(a1 + 3, a4);
    }
  }

  return a1;
}

- (id)batchesToRepresentObjects:(id)a3 suggestedBatchSize:(unint64_t)a4
{
  return (id)objc_msgSend(a3, "_cn_balancedSlicesWithMaximumCount:", a4);
}

- (id)objectsRepresentedByBatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "_cn_map:", &__block_literal_global_38_2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_cn_filter:", *MEMORY[0x1E0D13850]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_cn_distinctObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_CNChangeHistoryContactRefillStrategy fetchContactsWithIdentifiers:](self, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNChangeHistoryContactRefillStrategy updateChanges:withFetchedContacts:](self, v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (_QWORD)fetchContactsWithIdentifiers:(_QWORD *)a1
{
  id v3;
  id v4;
  id v5;
  void *v6;
  CNContactFetchRequest *v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  id v12;
  id v14;
  _QWORD aBlock[4];
  id v16;

  v3 = a2;
  if (a1)
  {
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
    {
      a1 = (_QWORD *)MEMORY[0x1E0C9AA70];
    }
    else
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __70___CNChangeHistoryContactRefillStrategy_fetchContactsWithIdentifiers___block_invoke;
      aBlock[3] = &unk_1E29FA870;
      v5 = v4;
      v16 = v5;
      v6 = _Block_copy(aBlock);
      v7 = -[CNContactFetchRequest initWithKeysToFetch:]([CNContactFetchRequest alloc], "initWithKeysToFetch:", a1[2]);
      +[CNContact predicateForContactsWithIdentifiers:](CNContact, "predicateForContactsWithIdentifiers:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNContactFetchRequest setPredicate:](v7, "setPredicate:", v8);

      -[CNContactFetchRequest setUnifyResults:](v7, "setUnifyResults:", *((unsigned __int8 *)a1 + 8));
      v9 = (void *)a1[3];
      v14 = 0;
      v10 = v9;
      v11 = objc_msgSend(v10, "enumerateContactsWithFetchRequest:error:usingBlock:", v7, &v14, v6);
      v12 = v14;

      if ((v11 & 1) != 0)
      {
        a1 = v5;
      }
      else
      {
        NSLog(CFSTR("Failed to fetch contacts for change history contact changes, %@"), v12);
        a1 = 0;
      }

    }
  }

  return a1;
}

- (id)updateChanges:(void *)a3 withFetchedContacts:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      v10 = *MEMORY[0x1E0D13850];
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
          LOBYTE(v7) = sIsChangeDelete_block_invoke(v7, v12);
          if ((v7 & 1) == 0)
          {
            objc_msgSend(v12, "contactIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (*(uint64_t (**)(uint64_t, void *))(v10 + 16))(v10, v13);

            if (v14)
            {
              objc_msgSend(v12, "contactIdentifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "objectForKeyedSubscript:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setContact:", v16);

              objc_msgSend(v12, "contact");
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v17)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "changeType"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "contactIdentifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                NSLog(CFSTR("Could not fetch contact for change type %@ with identifier %@, making it a delete change type."), v18, v19);

                v7 = objc_msgSend(v12, "setChangeType:", 2);
              }
            }
          }
          ++v11;
        }
        while (v8 != v11);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        v8 = v7;
      }
      while (v7);
    }
    a1 = v5;
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

@end
