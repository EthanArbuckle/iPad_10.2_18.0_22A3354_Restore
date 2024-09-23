@implementation WFEvernoteCreateAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__WFEvernoteCreateAction_runAsynchronouslyWithInput___block_invoke;
  v3[3] = &unk_24F8BA738;
  v3[4] = self;
  +[WFEvernoteContentItem createNoteWithContent:completionHandler:](WFEvernoteContentItem, "createNoteWithContent:completionHandler:", a3, v3);
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE19658], "evernoteLocation", a3);
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a5;
  if (v6)
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to add %2$@ to a new Evernote note?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to create a new Evernote note?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __53__WFEvernoteCreateAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  _QWORD aBlock[4];
  id v21;
  uint64_t v22;

  v5 = a2;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFEvernoteNoteTitle"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFEvernoteTags"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(","));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFEvernoteNotebook"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
      objc_msgSend(v5, "setTitle:", v6);
    objc_msgSend(v8, "if_compactMap:", &__block_literal_global_46142);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTagNames:", v10);

    +[WFEvernoteAccessResource evernoteSession](WFEvernoteAccessResource, "evernoteSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__WFEvernoteCreateAction_runAsynchronouslyWithInput___block_invoke_3;
    aBlock[3] = &unk_24F8BA710;
    v13 = v11;
    v14 = *(_QWORD *)(a1 + 32);
    v21 = v13;
    v22 = v14;
    v15 = _Block_copy(aBlock);
    if (objc_msgSend(v9, "length"))
    {
      v16[0] = v12;
      v16[1] = 3221225472;
      v16[2] = __53__WFEvernoteCreateAction_runAsynchronouslyWithInput___block_invoke_5;
      v16[3] = &unk_24F8BAD90;
      v17 = v9;
      v19 = v15;
      v18 = v5;
      objc_msgSend(v13, "listNotebooksWithCompletion:", v16);

    }
    else
    {
      (*((void (**)(void *, id, _QWORD))v15 + 2))(v15, v5, 0);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a3);
  }

}

void __53__WFEvernoteCreateAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__WFEvernoteCreateAction_runAsynchronouslyWithInput___block_invoke_4;
  v8[3] = &unk_24F8BA6E8;
  v6 = *(void **)(a1 + 32);
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "uploadNote:notebook:completion:", v7, a3, v8);

}

void __53__WFEvernoteCreateAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  int v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = a2;
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v7, "name", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

        if (v9)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __53__WFEvernoteCreateAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "output");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFEvernoteContentItem itemWithNoteRef:note:](WFEvernoteContentItem, "itemWithNoteRef:note:", v6, *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "addItem:", v8);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v9);

}

id __53__WFEvernoteCreateAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDD14A8];
  v3 = a2;
  objc_msgSend(v2, "whitespaceAndNewlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

@end
