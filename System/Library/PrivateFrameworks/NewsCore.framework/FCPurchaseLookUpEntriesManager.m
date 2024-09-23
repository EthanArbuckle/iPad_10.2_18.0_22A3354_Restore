@implementation FCPurchaseLookUpEntriesManager

- (id)lookupEntriesByTagID
{
  if (a1)
    a1 = (id *)objc_msgSend(a1[2], "copy");
  return a1;
}

- (id)initWithLocalStore:(void *)a1
{
  id v4;
  id *v5;
  id *v6;
  id *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  FCPurchaseLookUpEntry *v20;
  id v21;
  uint64_t v22;
  id *v23;
  unint64_t v24;
  void *v25;
  id *v26;
  void *v27;
  id v29;
  uint64_t v30;
  objc_super v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    v31.receiver = a1;
    v31.super_class = (Class)FCPurchaseLookUpEntriesManager;
    v5 = (id *)objc_msgSendSuper2(&v31, sel_init);
    v6 = v5;
    if (v5)
    {
      v29 = v4;
      v7 = v5 + 1;
      objc_storeStrong(v5 + 1, a2);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v6[2];
      v6[2] = (id)v8;

      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend(v6[1], "allKeys");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v33;
        v14 = 0x1E0C99000uLL;
        do
        {
          v15 = 0;
          v30 = v12;
          do
          {
            if (*(_QWORD *)v33 != v13)
              objc_enumerationMutation(v10);
            v16 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v15);
            objc_opt_class();
            objc_msgSend(*v7, "objectForKey:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              if ((objc_opt_isKindOfClass() & 1) != 0)
                v18 = v17;
              else
                v18 = 0;
            }
            else
            {
              v18 = 0;
            }
            v19 = v18;

            if (v19 && objc_msgSend(v16, "hasPrefix:", CFSTR("pl-")))
            {
              v20 = -[FCPurchaseLookUpEntry initWithEntryID:dictionaryRepresentation:]([FCPurchaseLookUpEntry alloc], "initWithEntryID:dictionaryRepresentation:", v16, v19);
              if (v20)
              {
                v21 = v6[2];
                -[FCPurchaseLookUpEntry tagID](v20, "tagID");
                v22 = v13;
                v23 = v7;
                v24 = v14;
                v25 = v10;
                v26 = v6;
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "setObject:forKey:", v20, v27);

                v6 = v26;
                v10 = v25;
                v14 = v24;
                v7 = v23;
                v13 = v22;
                v12 = v30;
              }

            }
            ++v15;
          }
          while (v12 != v15);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v12);
      }

      v4 = v29;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)addEntryWithTagID:(void *)a3 purchaseID:(void *)a4 lastVerificationTime:(void *)a5 lastVerificationFailureTime:(uint64_t)a6 purchaseType:(uint64_t)a7 purchaseValidationState:(char)a8 isNewsAppPurchase:(void *)a9 dateOfExpiration:(char)a10 hasShownRenewalNotice:
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  FCPurchaseLookUpEntry *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  FCPurchaseLookUpEntry *v32;

  if (a1)
  {
    v16 = a9;
    v17 = a5;
    v18 = a4;
    v19 = a3;
    v20 = a2;
    v21 = [FCPurchaseLookUpEntry alloc];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("pl-"), v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v29) = a10;
    LOBYTE(v28) = a8;
    v32 = -[FCPurchaseLookUpEntry initWithEntryID:tagID:purchaseID:lastVerificationTime:lastVerificationFailureTime:purchaseType:purchaseValidationState:isNewsAppPurchase:dateOfExpiration:hasShownRenewalNotice:](v21, "initWithEntryID:tagID:purchaseID:lastVerificationTime:lastVerificationFailureTime:purchaseType:purchaseValidationState:isNewsAppPurchase:dateOfExpiration:hasShownRenewalNotice:", v22, v20, v19, v18, v17, a6, a7, v28, v16, v29);

    v23 = *(id *)(a1 + 16);
    -[FCPurchaseLookUpEntry tagID](v32, "tagID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fc_safelySetObject:forKey:", v32, v24);

    v25 = *(id *)(a1 + 8);
    -[FCPurchaseLookUpEntry dictionaryRepresentation](v32, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCPurchaseLookUpEntry identifier](v32, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v26, v27);

  }
}

- (void)updateEntry:(uint64_t)a1
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (a1)
  {
    objc_msgSend(v10, "tagID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = *(id *)(a1 + 16);
      v5 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(v10, "tagID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fc_safelySetObject:forKey:", v5, v6);

    }
    v7 = *(id *)(a1 + 8);
    objc_msgSend(v10, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
}

- (void)removeEntry:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    objc_msgSend(a2, "tagID");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[FCPurchaseLookUpEntriesManager removeEntryForTagID:](a1, v3);

  }
}

- (void)removeEntryForTagID:(uint64_t)a1
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a1)
  {
    if (v7)
      objc_msgSend(*(id *)(a1 + 16), "removeObjectForKey:", v7);
    v3 = *(void **)(a1 + 8);
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = v3;
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@"), CFSTR("pl-"), v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v6);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entriesByTagID, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
}

@end
