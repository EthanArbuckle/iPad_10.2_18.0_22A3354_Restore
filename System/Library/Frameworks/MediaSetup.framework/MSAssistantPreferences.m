@implementation MSAssistantPreferences

+ (id)sharedPreferences
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__MSAssistantPreferences_sharedPreferences__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedPreferences_onceToken != -1)
    dispatch_once(&sharedPreferences_onceToken, block);
  return (id)sharedPreferences_sharedInstance;
}

void __43__MSAssistantPreferences_sharedPreferences__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedPreferences_sharedInstance;
  sharedPreferences_sharedInstance = (uint64_t)v0;

}

- (MSAssistantPreferences)init
{
  MSAssistantPreferences *v2;
  AFMultiUserConnection *v3;
  AFMultiUserConnection *connection;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSAssistantPreferences;
  v2 = -[MSAssistantPreferences init](&v6, sel_init);
  if (v2)
  {
    v3 = (AFMultiUserConnection *)objc_alloc_init(MEMORY[0x24BE09230]);
    connection = v2->_connection;
    v2->_connection = v3;

  }
  return v2;
}

- (void)getHomeUserIDForSpeaker:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  AFMultiUserConnection *connection;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  connection = self->_connection;
  if (connection)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __61__MSAssistantPreferences_getHomeUserIDForSpeaker_completion___block_invoke;
    v11[3] = &unk_24DBD5538;
    v12 = v7;
    -[AFMultiUserConnection getSharedUserInfoForSharedUserID:completion:](connection, "getSharedUserInfoForSharedUserID:completion:", v6, v11);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4099, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v10);

  }
}

void __61__MSAssistantPreferences_getHomeUserIDForSpeaker_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(a2, "homeUserId");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

  }
}

- (void)getSharedUserIDForHomeUser:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  AFMultiUserConnection *connection;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))v7;
  connection = self->_connection;
  if (connection)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __64__MSAssistantPreferences_getSharedUserIDForHomeUser_completion___block_invoke;
    v11[3] = &unk_24DBD5560;
    v12 = v7;
    -[AFMultiUserConnection getSharedUserIdForHomeUserId:completion:](connection, "getSharedUserIdForHomeUserId:completion:", v6, v11);

  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4099, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v8)[2](v8, 0, v10);

  }
}

uint64_t __64__MSAssistantPreferences_getSharedUserIDForHomeUser_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (BOOL)isMultiUserEnabledForSiri
{
  void *v2;
  void *v3;
  void *v4;

  AFPreferencesSupportedMultiUserLanguages();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE09270], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "languageCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v2, "containsObject:", v4);
  return (char)v3;
}

+ (id)intentExamples
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredLocalizations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle", (_QWORD)v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "pathForResource:ofType:inDirectory:forLocalization:", CFSTR("AppIntentVocabulary"), CFSTR("plist"), &stru_24DBD5D08, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "valueForKeyPath:", CFSTR("IntentPhrases"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "valueForKeyPath:", CFSTR("IntentExamples"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "firstObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

+ (id)supportedMediaIntents
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForInfoDictionaryKey:", CFSTR("INSupportedMediaCategories"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_opt_new();
  v6 = v5;

  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (AFMultiUserConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
