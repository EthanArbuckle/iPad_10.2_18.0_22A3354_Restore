@implementation WFEvernoteAppendAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  WFEvernoteAppendAction *v13;
  id v14;

  -[WFEvernoteAppendAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFEvernoteNotesNotebookName"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD17C8];
  -[WFEvernoteAppendAction titleSearch](self, "titleSearch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("intitle:\"%@\"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFEvernoteAppendAction titleSearch](self, "titleSearch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    +[ENNoteSearch noteSearchWithSearchString:](ENNoteSearch, "noteSearchWithSearchString:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  if (objc_msgSend(v4, "length"))
  {
    +[WFEvernoteAccessResource evernoteSession](WFEvernoteAccessResource, "evernoteSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __53__WFEvernoteAppendAction_runAsynchronouslyWithInput___block_invoke;
    v11[3] = &unk_24F8BB348;
    v12 = v4;
    v13 = self;
    v14 = v9;
    objc_msgSend(v10, "listNotebooksWithCompletion:", v11);

  }
  else
  {
    -[WFEvernoteAppendAction performSearch:inNotebook:maxResults:](self, "performSearch:inNotebook:maxResults:", v9, 0, 1);
  }

}

- (void)performSearch:(id)a3 inNotebook:(id)a4 maxResults:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v8 = a4;
  v9 = a3;
  +[WFEvernoteAccessResource evernoteSession](WFEvernoteAccessResource, "evernoteSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__WFEvernoteAppendAction_performSearch_inNotebook_maxResults___block_invoke;
  v12[3] = &unk_24F8BA068;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v10, "findNotesWithSearch:inNotebook:orScope:sortOrder:maxResults:completion:", v9, v11, 1, 2, a5, v12);

}

- (void)uploadNoteWithContent:(id)a3 toNotebook:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__WFEvernoteAppendAction_uploadNoteWithContent_toNotebook___block_invoke;
  v8[3] = &unk_24F8B3778;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  +[WFEvernoteContentItem createNoteWithContent:completionHandler:](WFEvernoteContentItem, "createNoteWithContent:completionHandler:", a3, v8);

}

- (id)titleSearch
{
  return (id)-[WFEvernoteAppendAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFEvernoteNotesTitleSearch"), objc_opt_class());
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
    WFLocalizedString(CFSTR("Allow “%1$@” to append %2$@ to an Evernote note?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to append content to an Evernote note?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __59__WFEvernoteAppendAction_uploadNoteWithContent_toNotebook___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "titleSearch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "titleSearch");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitle:", v6);

  }
  +[WFEvernoteAccessResource evernoteSession](WFEvernoteAccessResource, "evernoteSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __59__WFEvernoteAppendAction_uploadNoteWithContent_toNotebook___block_invoke_2;
  v10[3] = &unk_24F8BA6E8;
  v8 = *(_QWORD *)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v3;
  v9 = v3;
  objc_msgSend(v7, "uploadNote:notebook:completion:", v9, v8, v10);

}

void __59__WFEvernoteAppendAction_uploadNoteWithContent_toNotebook___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __62__WFEvernoteAppendAction_performSearch_inNotebook_maxResults___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a3);
  }
  else if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFEvernoteAccessResource evernoteSession](WFEvernoteAccessResource, "evernoteSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "noteRef");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __62__WFEvernoteAppendAction_performSearch_inNotebook_maxResults___block_invoke_2;
    v14[3] = &unk_24F8B3750;
    v10 = *(void **)(a1 + 40);
    v14[4] = *(_QWORD *)(a1 + 32);
    v15 = v10;
    v16 = v7;
    v11 = v7;
    objc_msgSend(v8, "downloadNote:progress:completion:", v9, 0, v14);

  }
  else
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v12, "input");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uploadNoteWithContent:toNotebook:", v13, *(_QWORD *)(a1 + 40));

  }
}

void __62__WFEvernoteAppendAction_performSearch_inNotebook_maxResults___block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v5 = a2;
  if (v5)
  {
    objc_msgSend(a1[4], "input");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__WFEvernoteAppendAction_performSearch_inNotebook_maxResults___block_invoke_3;
    v7[3] = &unk_24F8B3728;
    v7[4] = a1[4];
    v8 = v5;
    v9 = a1[5];
    v10 = a1[6];
    +[WFEvernoteContentItem createNoteWithContent:completionHandler:](WFEvernoteContentItem, "createNoteWithContent:completionHandler:", v6, v7);

  }
  else
  {
    objc_msgSend(a1[4], "finishRunningWithError:", a3);
  }

}

void __62__WFEvernoteAppendAction_performSearch_inNotebook_maxResults___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
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
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (v5)
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v5, "resources");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(a1 + 40), "addResource:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v9);
    }

    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFEvernoteWriteMode"), objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Prepend"));

    if (v13)
    {
      objc_msgSend(v6, "content");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "enmlWithNote:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v15, "mutableCopy");

      objc_msgSend(v16, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<en-note/>"), CFSTR("<en-note>"), 0, 0, objc_msgSend(v16, "length"));
      objc_msgSend(v16, "replaceOccurrencesOfString:withString:options:range:", CFSTR("</en-note>"), &stru_24F8BBA48, 0, 0, objc_msgSend(v16, "length"));
      +[ENXMLDTD enml2dtd](ENXMLDTD, "enml2dtd");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "docTypeDeclaration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "content");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = *(void **)(a1 + 40);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "content");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "enmlWithNote:", *(_QWORD *)(a1 + 40));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v23, "mutableCopy");

      objc_msgSend(v16, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<en-note/>"), CFSTR("<en-note>"), 0, 0, objc_msgSend(v16, "length"));
      objc_msgSend(v16, "replaceOccurrencesOfString:withString:options:range:", CFSTR("</en-note>"), &stru_24F8BBA48, 0, 0, objc_msgSend(v16, "length"));
      +[ENXMLDTD enml2dtd](ENXMLDTD, "enml2dtd");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "docTypeDeclaration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "content");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      v21 = v6;
    }
    objc_msgSend(v19, "enmlWithNote:", v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v25, "mutableCopy");

    objc_msgSend(v26, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n"), &stru_24F8BBA48, 8, 0, objc_msgSend(v26, "length"));
    objc_msgSend(v18, "stringByAppendingString:", CFSTR("\n"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "replaceOccurrencesOfString:withString:options:range:", v27, &stru_24F8BBA48, 8, 0, objc_msgSend(v26, "length"));

    objc_msgSend(v26, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<en-note>"), &stru_24F8BBA48, 8, 0, objc_msgSend(v26, "length"));
    objc_msgSend(v16, "appendString:", v26);
    +[ENNoteContent noteContentWithENML:](ENNoteContent, "noteContentWithENML:", v16);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setContent:", v28);

    +[WFEvernoteAccessResource evernoteSession](WFEvernoteAccessResource, "evernoteSession");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = *(_QWORD *)(a1 + 40);
    v31 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "noteRef");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x24BDAC760];
    v34[1] = 3221225472;
    v34[2] = __62__WFEvernoteAppendAction_performSearch_inNotebook_maxResults___block_invoke_4;
    v34[3] = &unk_24F8BA6E8;
    v33 = *(void **)(a1 + 40);
    v34[4] = *(_QWORD *)(a1 + 32);
    v35 = v33;
    objc_msgSend(v29, "uploadNote:policy:toNotebook:orReplaceNote:progress:completion:", v30, 1, v31, v32, 0, v34);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a3);
  }

}

void __62__WFEvernoteAppendAction_performSearch_inNotebook_maxResults___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v10 = v5;
  if (v5)
  {
    objc_msgSend(v6, "output");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFEvernoteContentItem itemWithNoteRef:note:](WFEvernoteContentItem, "itemWithNoteRef:note:", v10, *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addItem:", v8);

    v6 = *(void **)(a1 + 32);
    v9 = 0;
  }
  else
  {
    v9 = a3;
  }
  objc_msgSend(v6, "finishRunningWithError:", v9);

}

void __53__WFEvernoteAppendAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
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

  objc_msgSend(*(id *)(a1 + 40), "performSearch:inNotebook:maxResults:", *(_QWORD *)(a1 + 48), v4, 1);
}

@end
