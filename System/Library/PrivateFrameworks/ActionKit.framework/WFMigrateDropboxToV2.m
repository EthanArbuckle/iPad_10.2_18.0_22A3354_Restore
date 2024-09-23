@implementation WFMigrateDropboxToV2

void __WFMigrateDropboxToV2_block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v6 = a4;
  v7 = a2;
  v8 = objc_opt_class();
  WFEnforceClass(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kMPOAuthCredentialAccessToken"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  WFEnforceClass(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kMPOAuthCredentialAccessTokenSecret"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  WFEnforceClass(v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __WFMigrateDropboxToV2_block_invoke_3;
  v18[3] = &unk_24F8B4448;
  v19 = v6;
  v17 = v6;
  objc_msgSend(v16, "authenticateWithLegacyAccessToken:accessTokenSecret:completionHandler:", v12, v15, v18);

}

void __WFMigrateDropboxToV2_block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v3);
        v6 |= +[WFAccount saveAccount:](WFDropboxAccount, "saveAccount:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
    if ((v6 & 1) != 0)
      SecItemDelete(*(CFDictionaryRef *)(a1 + 32));
  }
  objc_msgSend((id)WFMigrateDropboxToV2_lock, "unlock");

}

void __WFMigrateDropboxToV2_block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v5;
  void (*v6)(uint64_t, _QWORD);
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v5 = a3;
    +[WFOAuth2Account accountWithCredential:](WFDropboxAccount, "accountWithCredential:", a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v3 + 16))(v3);

  }
  else
  {
    v6 = *(void (**)(uint64_t, _QWORD))(v3 + 16);
    v7 = a3;
    v6(v3, 0);
  }

}

void __WFMigrateDropboxToV2_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)WFMigrateDropboxToV2_lock;
  WFMigrateDropboxToV2_lock = v0;

}

@end
