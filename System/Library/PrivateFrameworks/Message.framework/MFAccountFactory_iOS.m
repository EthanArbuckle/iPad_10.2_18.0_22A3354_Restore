@implementation MFAccountFactory_iOS

- (id)accountWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  id v14;
  id v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v22 = 0;
  +[MailAccount activeAccountsWithError:](MailAccount, "activeAccountsWithError:", &v22);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v22;
  v17 = (void *)objc_msgSend(v4, "mutableCopy");

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v17;
    v6 = 0;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", v3);

          if (v13)
          {
            v14 = v11;

            v6 = v14;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v8);
    }

  }
  v15 = v6;

  return v15;
}

- (id)accountWithSystemAccount:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAccountFactory_iOS accountWithIdentifier:](self, "accountWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
