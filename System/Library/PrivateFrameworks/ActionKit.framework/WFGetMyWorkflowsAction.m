@implementation WFGetMyWorkflowsAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  WFGetMyWorkflowsAction *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEC3C28], "defaultDatabase", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = self;
  -[WFGetMyWorkflowsAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("Folder"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!v7)
  {
    v12 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v7, "displayString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_7;
  if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEC43F0]) & 1) == 0)
  {
    objc_msgSend(v8, "collectionWithIdentifier:error:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      goto LABEL_8;
LABEL_7:
    objc_msgSend(v8, "sortedVisibleFoldersWithError:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "if_firstObjectWithValue:forKey:", v9, CFSTR("name"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  v12 = 0;
LABEL_8:

LABEL_9:
  v32 = v7;

  objc_msgSend(v12, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc(MEMORY[0x24BEC1690]);
  v16 = v15;
  v30 = v12;
  if (v14)
  {
    objc_msgSend(v12, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "initWithFolderIdentifier:", v17);

  }
  else
  {
    v18 = objc_msgSend(v15, "initWithLocation:", 0);
  }
  v31 = v8;
  v29 = (void *)v18;
  objc_msgSend(v8, "sortedWorkflowsWithQuery:error:", v18, a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v35;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v35 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v23);
        -[WFGetMyWorkflowsAction output](v33, "output");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)MEMORY[0x24BE19450];
        objc_msgSend(MEMORY[0x24BE19470], "shortcutsAppLocation");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "itemWithObject:origin:disclosureLevel:", v24, v27, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addItem:", v28);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v21);
  }

}

@end
