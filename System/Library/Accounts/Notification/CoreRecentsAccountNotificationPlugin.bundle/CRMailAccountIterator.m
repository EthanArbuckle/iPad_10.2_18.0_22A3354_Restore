@implementation CRMailAccountIterator

- (CRMailAccountIterator)init
{
  void *v3;
  CRMailAccountIterator *v4;

  objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CRMailAccountIterator initWithAccountStore:](self, "initWithAccountStore:", v3);

  return v4;
}

- (CRMailAccountIterator)initWithAccountStore:(id)a3
{
  id v5;
  CRMailAccountIterator *v6;
  CRMailAccountIterator *v7;
  CRMailAccountIterator *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRMailAccountIterator;
  v6 = -[CRMailAccountIterator init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountStore, a3);
    v8 = v7;
  }

  return v7;
}

- (void)enumerateEmailAddresses:(id)a3
{
  void (**v4)(id, _QWORD, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  id obj;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, uint64_t))a3;
  -[CRMailAccountIterator mailAccounts](self, "mailAccounts");
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v5)
  {
    v6 = v5;
    v19 = *(_QWORD *)v25;
    v7 = *MEMORY[0x24BE636B8];
    v8 = *MEMORY[0x24BE636B0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "BOOLValue");

        objc_msgSend(v10, "objectForKeyedSubscript:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v21;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v21 != v16)
                objc_enumerationMutation(v13);
              v4[2](v4, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j), v12);
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v15);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v6);
  }

}

- (id)mailAccounts
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BE192C0]);
  objc_msgSend(v2, "future");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addFailureBlock:", &unk_24FFA9E40);

  v4 = (void *)MEMORY[0x24BE636E8];
  v5 = *MEMORY[0x24BE636B8];
  v11[0] = *MEMORY[0x24BE636B0];
  v11[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "completionHandlerAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountValuesForKeys:completionBlock:", v6, v7);

  objc_msgSend(v2, "future");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resultWithTimeout:error:", 0, 10.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)emailAddressesForAccount:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v3, "accountProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDB3F30]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE2E400], "rawAddressFromFullAddress:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDB41F8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v30;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(MEMORY[0x24BE2E400], "rawAddressFromFullAddress:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v12));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v10);
  }

  objc_msgSend(v3, "accountProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("defaultAddress"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x24BE2E400], "rawAddressFromFullAddress:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v16);

  }
  objc_msgSend((id)objc_opt_class(), "receivedEmailAddressesFromAccount:", v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(MEMORY[0x24BE2E400], "rawAddressFromFullAddress:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v21));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v19);
  }
  objc_msgSend(v4, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)receivedEmailAddressesFromAccount:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("ReceiveEmailAliasAddresses"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v4 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;

    objc_msgSend(v6, "allKeys");
    v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v9 = v7;

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    v6 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
    v7 = v8;
    goto LABEL_11;
  }
  v9 = 0;
LABEL_13:
  if (v9)
    v10 = v9;
  else
    v10 = (void *)MEMORY[0x24BDBD1A8];
  v11 = v10;

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
