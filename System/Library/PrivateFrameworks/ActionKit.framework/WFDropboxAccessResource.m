@implementation WFDropboxAccessResource

- (id)associatedAppIdentifier
{
  return CFSTR("com.getdropbox.Dropbox");
}

- (WFDropboxAccessResource)initWithDefinition:(id)a3
{
  WFDropboxAccessResource *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  WFDropboxAccessResource *v33;
  objc_super v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  CFTypeRef result;
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[3];
  _QWORD v44[5];

  v44[3] = *MEMORY[0x24BDAC8D0];
  v35.receiver = self;
  v35.super_class = (Class)WFDropboxAccessResource;
  v3 = -[WFAccountAccessResource initWithDefinition:](&v35, sel_initWithDefinition_, a3);
  if (v3)
  {
    if (!+[WFAccount numberOfAccounts](WFDropboxAccount, "numberOfAccounts"))
    {
      if (WFMigrateDropboxToV2_onceToken != -1)
        dispatch_once(&WFMigrateDropboxToV2_onceToken, &__block_literal_global_19936);
      if (objc_msgSend((id)WFMigrateDropboxToV2_lock, "tryLock"))
      {
        v4 = *MEMORY[0x24BDE9230];
        v5 = *MEMORY[0x24BDE8F50];
        v43[0] = *MEMORY[0x24BDE9220];
        v43[1] = v5;
        v6 = *MEMORY[0x24BE19960];
        v44[0] = v4;
        v44[1] = v6;
        v43[2] = *MEMORY[0x24BDE9128];
        v44[2] = CFSTR("is.workflow.my.app.dropbox.auth");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v7);
        v9 = *MEMORY[0x24BDE93C0];
        v10 = *MEMORY[0x24BDE94C8];
        v41[0] = *MEMORY[0x24BDE93B0];
        v41[1] = v10;
        v11 = *MEMORY[0x24BDBD270];
        v42[0] = v9;
        v42[1] = v11;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addEntriesFromDictionary:", v12);

        result = 0;
        if (SecItemCopyMatching((CFDictionaryRef)v8, &result) || !result)
        {
          objc_msgSend((id)WFMigrateDropboxToV2_lock, "unlock");
        }
        else
        {
          v13 = objc_alloc(MEMORY[0x24BDD1620]);
          v14 = (void *)result;
          v15 = (void *)objc_msgSend(v13, "initForReadingFromData:error:", result, 0);

          if (v15)
          {
            objc_msgSend(v15, "decodePropertyListForKey:", *MEMORY[0x24BDD0E88]);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_opt_class();
            WFEnforceClass(v16, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("DBCredentialVersion"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_opt_class();
            WFEnforceClass(v19, v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "integerValue");

            if (v22 == 3)
            {
              objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kMPOAuthCredentialConsumerKey"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_opt_class();
              WFEnforceClass(v23, v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              +[WFDropboxAccount clientID](WFDropboxAccount, "clientID");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v25, "isEqualToString:", v26);

              if ((v27 & 1) != 0)
              {
                objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kDBDropboxUserCredentials"));
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_opt_class();
                WFEnforceClass(v28, v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v30, "count"))
                {
                  +[WFDropboxAccount sessionManager](WFDropboxAccount, "sessionManager");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v38[0] = MEMORY[0x24BDAC760];
                  v38[1] = 3221225472;
                  v38[2] = __WFMigrateDropboxToV2_block_invoke_2;
                  v38[3] = &unk_24F8B4470;
                  v39 = v31;
                  v36[0] = MEMORY[0x24BDAC760];
                  v36[1] = 3221225472;
                  v36[2] = __WFMigrateDropboxToV2_block_invoke_4;
                  v36[3] = &unk_24F8BB6B0;
                  v37 = v7;
                  v32 = v31;
                  objc_msgSend(v30, "if_mapAsynchronously:completionHandler:", v38, v36);

                }
                else
                {
                  objc_msgSend((id)WFMigrateDropboxToV2_lock, "unlock");
                }

              }
              else
              {
                objc_msgSend((id)WFMigrateDropboxToV2_lock, "unlock");
              }

            }
            else
            {
              objc_msgSend((id)WFMigrateDropboxToV2_lock, "unlock");
            }

          }
          else
          {
            objc_msgSend((id)WFMigrateDropboxToV2_lock, "unlock");
          }

        }
      }
    }
    v33 = v3;
  }

  return v3;
}

- (Class)accountClass
{
  return (Class)objc_opt_class();
}

- (void)makeAvailableWithUserInterface:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  WFDropboxAccessResource *v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  id *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[5];
  id v33;

  v6 = a3;
  v7 = a4;
  +[WFDropboxAccount sessionManager](WFDropboxAccount, "sessionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __76__WFDropboxAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke;
  v32[3] = &unk_24F8B4F08;
  v10 = v7;
  v32[4] = self;
  v33 = v10;
  objc_msgSend(v8, "appAuthorizationSessionWithCompletionHandler:", v32);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "authorizationURLs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  v26 = 0;
  v27 = (id *)&v26;
  v28 = 0x3042000000;
  v29 = __Block_byref_object_copy__19925;
  v30 = __Block_byref_object_dispose__19926;
  v31 = 0;
  v19[0] = v9;
  v19[1] = 3221225472;
  v19[2] = __76__WFDropboxAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_106;
  v19[3] = &unk_24F8B4400;
  v14 = v11;
  v20 = v14;
  v15 = v13;
  v21 = v15;
  v16 = v6;
  v22 = v16;
  v17 = v10;
  v23 = self;
  v24 = v17;
  v25 = &v26;
  v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(v19, "copy");
  objc_storeWeak(v27 + 5, v18);
  v18[2](v18, 0, 0);

  _Block_object_dispose(&v26, 8);
  objc_destroyWeak(&v31);

}

void __76__WFDropboxAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v5 = a3;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("WFOAuth2ErrorDomain")))
  {
    v7 = objc_msgSend(v5, "code");

    if (v7 == 106)
    {
      v8 = *(_QWORD *)(a1 + 40);
      if (v8)
      {
        v9 = *(void (**)(void))(v8 + 16);
LABEL_12:
        v9();
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  else
  {

  }
  if (v14)
  {
    +[WFOAuth2Account accountWithCredential:](WFDropboxAccount, "accountWithCredential:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "accountClass"), "saveAccount:", v10);
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, v11, v5);

  }
  else
  {
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
    {
      v9 = *(void (**)(void))(v13 + 16);
      goto LABEL_12;
    }
  }
LABEL_13:

}

void __76__WFDropboxAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_106(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "successURI");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEC39F8], "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __76__WFDropboxAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2;
    v14[3] = &unk_24F8B43D8;
    v15 = *(id *)(a1 + 32);
    v16 = v5;
    v17 = v4;
    v6 = v4;
    v7 = v5;
    objc_msgSend(v7, "registerHandler:forIncomingRequestsWithAction:scheme:", v14, 0, v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "firstObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "removeObjectAtIndex:", 0);
      objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 48);
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
      objc_msgSend(v8, "openURL:withBundleIdentifier:userInterface:completionHandler:", v7, CFSTR("com.getdropbox.Dropbox"), v9, WeakRetained);

    }
    else
    {
      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 64);
      v13.receiver = *(id *)(a1 + 56);
      v13.super_class = (Class)WFDropboxAccessResource;
      objc_msgSendSuper2(&v13, sel_makeAvailableWithUserInterface_completionHandler_, v11, v12);
    }
  }

}

uint64_t __76__WFDropboxAccessResource_makeAvailableWithUserInterface_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resumeSessionWithURL:", v4);

  return objc_msgSend(*(id *)(a1 + 40), "removeHandlerForIncomingRequestsWithAction:scheme:", 0, *(_QWORD *)(a1 + 48));
}

@end
