@implementation WFGetTextFromPDFAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t, void *);
  void *v19;
  id v20;
  WFGetTextFromPDFAction *v21;
  uint64_t v22;
  char v23;

  v4 = a3;
  -[WFGetTextFromPDFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFGetTextFromPDFTextType"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Text")) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", CFSTR("Rich Text")))
  {
    v6 = objc_opt_class();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[WFGetTextFromPDFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFGetTextFromPDFPageHeader"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGetTextFromPDFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFGetTextFromPDFPageFooter"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v7, "setObject:forKey:", v8, *MEMORY[0x24BE19730]);
  if (v9)
    objc_msgSend(v7, "setObject:forKey:", v9, *MEMORY[0x24BE19728]);
  -[WFGetTextFromPDFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFCombinePages"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  v12 = (void *)MEMORY[0x24BE193F8];
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __53__WFGetTextFromPDFAction_runAsynchronouslyWithInput___block_invoke;
  v19 = &unk_24F8BAB98;
  v23 = v11;
  v21 = self;
  v22 = v6;
  v20 = v4;
  v13 = v4;
  objc_msgSend(v12, "requestForCoercingToObjectClass:completionHandler:", v6, &v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE193F0], "optionsWithDictionary:", v7, v16, v17, v18, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOptions:", v15);

  objc_msgSend(v13, "performCoercion:", v14);
}

void __53__WFGetTextFromPDFAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *(_QWORD *)(a1 + 48);
    if (v11 == objc_opt_class())
    {
      objc_msgSend(v6, "componentsJoinedByString:", CFSTR("\n"));
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "output");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:named:", v14, v10);
    }
    else
    {
      v12 = *(_QWORD *)(a1 + 48);
      if (v12 != objc_opt_class())
      {
LABEL_15:

        goto LABEL_16;
      }
      v13 = objc_alloc_init(MEMORY[0x24BDD1688]);
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __53__WFGetTextFromPDFAction_runAsynchronouslyWithInput___block_invoke_2;
      v27[3] = &unk_24F8BAB70;
      v28 = v13;
      v14 = v13;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v27);
      objc_msgSend(*(id *)(a1 + 40), "output");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:named:", v14, v10);

      v16 = v28;
    }

    goto LABEL_15;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v17 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v6);
        v21 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "output");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v21);

      }
      v18 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v18);
  }
LABEL_16:
  objc_msgSend(*(id *)(a1 + 40), "finishRunningWithError:", v7);

}

void __53__WFGetTextFromPDFAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a3)
  {
    v5 = *(void **)(a1 + 32);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR("\n"));
    objc_msgSend(v5, "appendAttributedString:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", v7);

}

@end
