@implementation WFPrintAction

+ (id)userInterfaceProtocol
{
  return &unk_255DFDBE8;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  WFPrintAction *v22;
  id v23;
  id v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BEC14A0];
  v8 = *MEMORY[0x24BDF84E0];
  v9 = a4;
  objc_msgSend(v7, "typeWithUTType:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BE193F8];
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __50__WFPrintAction_runWithRemoteUserInterface_input___block_invoke;
  v21 = &unk_24F8BB348;
  v22 = self;
  v23 = v10;
  v24 = v6;
  v12 = v6;
  v13 = v10;
  objc_msgSend(v11, "requestForCoercingToFileType:completionHandler:", v13, &v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BE193F0];
  v25 = *MEMORY[0x24BE19720];
  v26[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1, v18, v19, v20, v21, v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "optionsWithDictionary:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setOptions:", v17);

  objc_msgSend(v9, "performCoercion:", v14);
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE19470], "printLocation", a3);
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
    WFLocalizedString(CFSTR("Allow “%1$@” to print %2$@?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to print?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __50__WFPrintAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  id v27;
  _QWORD v28[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v26 = (_QWORD *)a1;
    v27 = v6;
    objc_msgSend(v5, "if_compactMap:", &__block_literal_global_41930);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init((Class)getPDFDocumentClass_41931());
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "pageCount");
          if (v15)
          {
            v16 = v15;
            for (j = 0; j != v16; ++j)
            {
              objc_msgSend(v14, "pageAtIndex:", j);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "insertPage:atIndex:", v18, objc_msgSend(v8, "pageCount"));

            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v11);
    }

    v19 = (void *)MEMORY[0x24BE194F8];
    objc_msgSend(v5, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "wfName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "proposedFilenameForFile:ofType:", v21, v26[5]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE19628], "createTemporaryFileWithFilename:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeToURL:", v23);
    objc_msgSend(MEMORY[0x24BE194F8], "fileWithURL:options:", v23, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)v26[6];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __50__WFPrintAction_runWithRemoteUserInterface_input___block_invoke_3;
    v28[3] = &unk_24F8BB370;
    v28[4] = v26[4];
    objc_msgSend(v25, "showWithFile:completionHandler:", v24, v28);

    v6 = v27;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);
  }

}

uint64_t __50__WFPrintAction_runWithRemoteUserInterface_input___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a2);
}

id __50__WFPrintAction_runWithRemoteUserInterface_input___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;

  v2 = a2;
  if (objc_msgSend(v2, "representationType"))
  {
    if (objc_msgSend(v2, "representationType") != 1)
    {
      v7 = 0;
      goto LABEL_7;
    }
    v3 = objc_alloc((Class)getPDFDocumentClass_41931());
    objc_msgSend(v2, "fileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "initWithURL:", v4);
  }
  else
  {
    v6 = objc_alloc((Class)getPDFDocumentClass_41931());
    objc_msgSend(v2, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "initWithData:", v4);
  }
  v7 = (void *)v5;

LABEL_7:
  return v7;
}

@end
