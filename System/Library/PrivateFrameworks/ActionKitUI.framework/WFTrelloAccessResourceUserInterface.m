@implementation WFTrelloAccessResourceUserInterface

- (id)authorizationURLWithCallbackURL:(id)a3
{
  void *v3;
  id v4;
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
  _QWORD v18[7];

  v18[6] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCF48];
  v4 = a3;
  objc_msgSend(v3, "URLWithString:", CFSTR("https://trello.com/1/authorize"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("callback_method"), CFSTR("fragment"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v7 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(v4, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "queryItemWithName:value:", CFSTR("return_url"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("scope"), CFSTR("read,write,account"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v10;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("expiration"), CFSTR("never"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v11;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("name"), CFSTR("Shortcuts"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = v12;
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("key"), *MEMORY[0x24BE010E8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[5] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v5, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setQueryItems:", v14);
  objc_msgSend(v15, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)authorizeWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("workflow://trello-auth-flow"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFTrelloAccessResourceUserInterface authorizationURLWithCallbackURL:](self, "authorizationURLWithCallbackURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__406;
  v22 = __Block_byref_object_dispose__407;
  v23 = 0;
  v7 = objc_alloc(MEMORY[0x24BDB7178]);
  objc_msgSend(v5, "scheme");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __70__WFTrelloAccessResourceUserInterface_authorizeWithCompletionHandler___block_invoke;
  v15 = &unk_24E342788;
  v17 = &v18;
  v9 = v4;
  v16 = v9;
  v10 = objc_msgSend(v7, "initWithURL:callbackURLScheme:completionHandler:", v6, v8, &v12);
  v11 = (void *)v19[5];
  v19[5] = v10;

  objc_msgSend((id)v19[5], "setPresentationContextProvider:", self, v12, v13, v14, v15);
  objc_msgSend((id)v19[5], "start");

  _Block_object_dispose(&v18, 8);
}

void __70__WFTrelloAccessResourceUserInterface_authorizeWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  if (!v5)
  {
LABEL_7:
    objc_msgSend(v6, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BDB7068]))
    {
      v16 = objc_msgSend(v6, "code");

      if (v16 != 1)
      {
LABEL_11:
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        goto LABEL_12;
      }
      v15 = v6;
      v6 = 0;
    }

    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v9, "fragment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dc_dictionaryFromQueryString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", CFSTR("token"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v13, "length"))
  {
LABEL_6:

    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BE01020], "accountWithToken:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(MEMORY[0x24BE01020], "saveAccount:", v14))
  {

    goto LABEL_6;
  }
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __70__WFTrelloAccessResourceUserInterface_authorizeWithCompletionHandler___block_invoke_2;
  v17[3] = &unk_24E342760;
  v18 = *(id *)(a1 + 32);
  objc_msgSend(v14, "refreshWithCompletionHandler:", v17);

LABEL_12:
}

void __70__WFTrelloAccessResourceUserInterface_authorizeWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__WFTrelloAccessResourceUserInterface_authorizeWithCompletionHandler___block_invoke_3;
  v6[3] = &unk_24E3439E8;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __70__WFTrelloAccessResourceUserInterface_authorizeWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 32));
}

@end
