@implementation WFEvernoteGetNotesAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  WFEvernoteGetNotesAction *v24;
  id v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[WFEvernoteGetNotesAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFEvernoteNotesTitleSearch"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEvernoteGetNotesAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFEvernoteNotesTags"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFEvernoteGetNotesAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFEvernoteNotesCount"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v7, "integerValue");

  -[WFEvernoteGetNotesAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFEvernoteNotesNotebookName"), objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v8, "appendFormat:", CFSTR("intitle:\"%@\" "), v4);
  v21 = v4;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v16, "length"))
          objc_msgSend(v8, "appendFormat:", CFSTR("tag:\"%@\" "), v16);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v8, "length"))
  {
    +[ENNoteSearch noteSearchWithSearchString:](ENNoteSearch, "noteSearchWithSearchString:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  if (objc_msgSend(v20, "length"))
  {
    +[WFEvernoteAccessResource evernoteSession](WFEvernoteAccessResource, "evernoteSession");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __55__WFEvernoteGetNotesAction_runAsynchronouslyWithInput___block_invoke;
    v22[3] = &unk_24F8B0150;
    v23 = v20;
    v24 = self;
    v25 = v17;
    v26 = v19;
    objc_msgSend(v18, "listNotebooksWithCompletion:", v22);

  }
  else
  {
    -[WFEvernoteGetNotesAction performSearch:inNotebook:maxResults:](self, "performSearch:inNotebook:maxResults:", v17, 0, v19);
  }

}

- (void)performSearch:(id)a3 inNotebook:(id)a4 maxResults:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];

  v8 = a4;
  v9 = a3;
  +[WFEvernoteAccessResource evernoteSession](WFEvernoteAccessResource, "evernoteSession");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __64__WFEvernoteGetNotesAction_performSearch_inNotebook_maxResults___block_invoke;
  v11[3] = &unk_24F8BB6B0;
  v11[4] = self;
  objc_msgSend(v10, "findNotesWithSearch:inNotebook:orScope:sortOrder:maxResults:completion:", v9, v8, 1, 2, a5, v11);

}

void __64__WFEvernoteGetNotesAction_performSearch_inNotebook_maxResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_msgSend(*(id *)(a1 + 32), "output");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "noteRef");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:named:", v13, v14);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

void __55__WFEvernoteGetNotesAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
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

  objc_msgSend(*(id *)(a1 + 40), "performSearch:inNotebook:maxResults:", *(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 56));
}

@end
