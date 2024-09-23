@implementation WFShowWebPageAction

+ (id)userInterfaceProtocol
{
  return &unk_255DFD6A0;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __56__WFShowWebPageAction_runWithRemoteUserInterface_input___block_invoke;
  v10[3] = &unk_24F8B7680;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "generateCollectionByCoercingToItemClasses:completionHandler:", v8, v10);

}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  -[WFShowWebPageAction input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v6 = v4;
  WFGetContentLocationFromURLActionInput();

}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = objc_msgSend(v7, "length");
  v11 = (void *)MEMORY[0x24BDD17C8];
  if (v10)
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to open “%2$@” with %3$@?"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v12, v8, v9, v7);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to open “%2$@”?"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v12, v8, v9, v15);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __66__WFShowWebPageAction_getContentDestinationWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), a2, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE19390], "webpagesLocation");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

  }
}

void __56__WFShowWebPageAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a2, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lowercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("http")) & 1) != 0
      || (objc_msgSend(v11, "isEqualToString:", CFSTR("https")) & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFEnterSafariReader"), objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "BOOLValue");

      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __56__WFShowWebPageAction_runWithRemoteUserInterface_input___block_invoke_2;
      v26[3] = &unk_24F8BB370;
      v14 = *(void **)(a1 + 40);
      v26[4] = *(_QWORD *)(a1 + 32);
      objc_msgSend(v14, "showURL:readerView:completion:", v9, v13, v26);
    }
    else
    {
      v16 = (void *)MEMORY[0x24BDD1540];
      v23 = *MEMORY[0x24BDD0B88];
      v27[0] = *MEMORY[0x24BDD0FD8];
      WFLocalizedString(CFSTR("Unsupported URL"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v17;
      v27[1] = *MEMORY[0x24BDD0FC8];
      v18 = (void *)MEMORY[0x24BDD17C8];
      WFLocalizedString(CFSTR("Show Web Page supports http:// and https:// URLs, but you tried to show a %@:// URL."));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", v19, v11);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v23, -1002, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v22);
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __56__WFShowWebPageAction_runWithRemoteUserInterface_input___block_invoke_3;
      v24[3] = &unk_24F8B96B0;
      v15 = *(void **)(a1 + 40);
      v24[4] = *(_QWORD *)(a1 + 32);
      v25 = v15;
      objc_msgSend(v8, "getFileRepresentation:forType:", v24, 0);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);
    }
  }

}

uint64_t __56__WFShowWebPageAction_runWithRemoteUserInterface_input___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a2);
}

uint64_t __56__WFShowWebPageAction_runWithRemoteUserInterface_input___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  if (!a2)
    return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__WFShowWebPageAction_runWithRemoteUserInterface_input___block_invoke_4;
  v4[3] = &unk_24F8BB370;
  v2 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "showRichText:completion:", a2, v4);
}

uint64_t __56__WFShowWebPageAction_runWithRemoteUserInterface_input___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a2);
}

@end
