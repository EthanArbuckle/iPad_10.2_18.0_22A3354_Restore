@implementation WFPinboardGetAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  WFPinboardSessionManager *v10;
  void *v11;
  void *v12;
  void *v13;
  WFPinboardSessionManager *v14;
  _QWORD v15[5];
  WFPinboardSessionManager *v16;

  -[WFPinboardGetAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFBookmarkCount"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  -[WFPinboardGetAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPinTags"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(" ,"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "removeObject:", &stru_24F8BBA48);
  v10 = objc_alloc_init(WFPinboardSessionManager);
  +[WFPinboardAccessResource pinboardUsername](WFPinboardAccessResource, "pinboardUsername");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPinboardSessionManager setUsername:](v10, "setUsername:", v11);

  +[WFPinboardAccessResource pinboardPassword](WFPinboardAccessResource, "pinboardPassword");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPinboardSessionManager setPassword:](v10, "setPassword:", v12);

  +[WFPinboardAccessResource pinboardToken](WFPinboardAccessResource, "pinboardToken");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPinboardSessionManager setApiToken:](v10, "setApiToken:", v13);

  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __50__WFPinboardGetAction_runAsynchronouslyWithInput___block_invoke;
  v15[3] = &unk_24F8BA068;
  v15[4] = self;
  v16 = v10;
  v14 = v10;
  -[WFPinboardSessionManager getBookmarksWithTags:limit:completion:](v14, "getBookmarksWithTags:limit:completion:", v9, v5, v15);

}

void __50__WFPinboardGetAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("WFPinboardErrorDomain")))
  {
    v7 = objc_msgSend(v5, "code");

    if (v7 != 1000)
      goto LABEL_5;
    objc_msgSend(*(id *)(a1 + 32), "resourceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resourceObjectsOfClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "logOut");
  }

LABEL_5:
  v10 = (void *)MEMORY[0x24BE19650];
  objc_msgSend(*(id *)(a1 + 40), "baseURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributionSetContentOfURL:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v4;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v30 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v17, "objectForKey:", CFSTR("href"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          goto LABEL_12;
        v20 = (void *)MEMORY[0x24BDBCF48];
        objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("!$&'()*+,-./0123456789:;=?@ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz~"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringByAddingPercentEncodingWithAllowedCharacters:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "URLWithString:", v22);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
LABEL_12:
          objc_msgSend(*(id *)(a1 + 32), "output");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)MEMORY[0x24BE19450];
          objc_msgSend(v17, "objectForKey:", CFSTR("description"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "itemWithObject:named:attributionSet:", v19, v25, v12);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addItem:", v26);

        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v14);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v5);
}

@end
