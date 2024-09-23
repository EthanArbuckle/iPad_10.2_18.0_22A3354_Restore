@implementation WFGetFileLinkAction

- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = a3;
  -[WFGetFileLinkAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFUseShortURL"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __65__WFGetFileLinkAction_runAsynchronouslyWithInput_storageService___block_invoke;
  v11[3] = &unk_24F8BA068;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v10, "getSharingURLsForFiles:usePublicURLs:completionHandler:", v7, v9, v11);

}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;

  v7 = a5;
  v8 = a4;
  -[WFGetFileLinkAction input](self, "input");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "numberOfItems");

  v11 = (void *)MEMORY[0x24BDD17C8];
  if (v10 <= 1)
    v12 = CFSTR("Allow “%1$@” to get a link to a file in “%2$@”?");
  else
    v12 = CFSTR("Allow “%1$@” to get links to files in “%2$@”?");
  WFLocalizedString(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringWithFormat:", v13, v7, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __65__WFGetFileLinkAction_runAsynchronouslyWithInput_storageService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v17 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "output");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x24BE19450];
        v13 = (void *)MEMORY[0x24BE19390];
        objc_msgSend(*(id *)(a1 + 40), "associatedAppDescriptor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "locationWithAppDescriptor:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "itemWithObject:origin:disclosureLevel:", v10, v15, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addItem:", v16);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v17);

}

@end
