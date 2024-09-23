@implementation WFInstapaperAction

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[WFInstapaperAction engine](self, "engine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[WFInstapaperAction engine](self, "engine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelAllConnections");

  v5.receiver = self;
  v5.super_class = (Class)WFInstapaperAction;
  -[WFInstapaperAction dealloc](&v5, sel_dealloc);
}

- (void)initializeParameters
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFInstapaperAction;
  -[WFInstapaperAction initializeParameters](&v4, sel_initializeParameters);
  -[WFInstapaperAction parameterForKey:](self, "parameterForKey:", CFSTR("WFInstapaperFolder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDataSource:", self);

}

- (void)wasAddedToWorkflow:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFInstapaperAction;
  -[WFInstapaperAction wasAddedToWorkflow:](&v5, sel_wasAddedToWorkflow_, a3);
  -[WFInstapaperAction updateFolders](self, "updateFolders");
  -[WFInstapaperAction resourceManager](self, "resourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:selector:", self, sel_updateFolders);

}

- (void)wasRemovedFromWorkflow:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFInstapaperAction;
  -[WFInstapaperAction wasRemovedFromWorkflow:](&v5, sel_wasRemovedFromWorkflow_, a3);
  -[WFInstapaperAction resourceManager](self, "resourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:selector:", self, sel_updateFolders);

}

- (void)updateFolders
{
  void *v3;
  int v4;
  id v5;
  id v6;

  if (!-[WFInstapaperAction hasFetchedFolders](self, "hasFetchedFolders"))
  {
    -[WFInstapaperAction resourceManager](self, "resourceManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "resourcesAvailable");

    if (v4)
    {
      -[WFInstapaperAction engine](self, "engine");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v5 = (id)objc_msgSend(v6, "foldersWithUserInfo:", 0);

    }
  }
}

- (id)folders
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "workflowUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("WFInstapaperFolders"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (IKEngine)engine
{
  IKEngine *engine;
  IKEngine *v4;
  IKEngine *v5;
  void *v6;
  void *v7;

  engine = self->_engine;
  if (!engine)
  {
    v4 = -[IKEngine initWithDelegate:]([IKEngine alloc], "initWithDelegate:", self);
    v5 = self->_engine;
    self->_engine = v4;

    +[WFInstapaperAccessResource instapaperToken](WFInstapaperAccessResource, "instapaperToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKEngine setOAuthToken:](self->_engine, "setOAuthToken:", v6);

    +[WFInstapaperAccessResource instapaperTokenSecret](WFInstapaperAccessResource, "instapaperTokenSecret");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IKEngine setOAuthTokenSecret:](self->_engine, "setOAuthTokenSecret:", v7);

    engine = self->_engine;
  }
  return engine;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *identifiers;
  id v10;

  v4 = a3;
  -[WFInstapaperAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFInstapaperFolder"), objc_opt_class());
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[WFInstapaperAction folders](self, "folders");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IKFolder folderWithFolderID:](IKFolder, "folderWithFolderID:", objc_msgSend(v6, "integerValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (NSMutableArray *)objc_opt_new();
  identifiers = self->_identifiers;
  self->_identifiers = v8;

  -[WFInstapaperAction runAsynchronouslyWithInput:selectedFolder:](self, "runAsynchronouslyWithInput:selectedFolder:", v4, v7);
}

- (void)finishRunningWithError:(id)a3
{
  IKEngine *engine;
  id v5;
  NSMutableArray *identifiers;
  objc_super v7;

  engine = self->_engine;
  self->_engine = 0;
  v5 = a3;

  identifiers = self->_identifiers;
  self->_identifiers = 0;

  v7.receiver = self;
  v7.super_class = (Class)WFInstapaperAction;
  -[WFInstapaperAction finishRunningWithError:](&v7, sel_finishRunningWithError_, v5);

}

- (BOOL)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x24BE193A0], "sharedContext", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://www.instapaper.com/premium"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFInstapaperAction userInterface](self, "userInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "openURL:userInterface:completionHandler:", v6, v7, 0);

  }
  return 1;
}

- (NSArray)connectionTypes
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (BOOL)includeSpecialFolders
{
  return 0;
}

- (void)runAsynchronouslyWithInput:(id)a3 selectedFolder:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 3, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFInstapaperAction finishRunningWithError:](self, "finishRunningWithError:", v5);

}

- (void)engine:(id)a3 willStartConnection:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  -[WFInstapaperAction connectionTypes](self, "connectionTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v11, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    -[WFInstapaperAction identifiers](self, "identifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFInstapaperAction engine](self, "engine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifierForConnection:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);

  }
}

- (void)engine:(id)a3 didFinishConnection:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a4;
  -[WFInstapaperAction identifiers](self, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {

  }
  else
  {
    -[WFInstapaperAction connectionTypes](self, "connectionTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v9, "type"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

    if (v8)
      -[WFInstapaperAction finishRunningWithError:](self, "finishRunningWithError:", 0);
  }

}

- (void)engine:(id)a3 didFailConnection:(id)a4 error:(id)a5
{
  -[WFInstapaperAction finishRunningWithError:](self, "finishRunningWithError:", a5, a4);
}

- (void)engine:(id)a3 connection:(id)a4 didReceiveFolders:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
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
  id v27;
  id v28;
  _QWORD block[5];
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v15, "folderID"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "title");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v16, v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v12);
  }

  v18 = (void *)MEMORY[0x24BDD16E0];
  +[IKFolder starredFolder](IKFolder, "starredFolder");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "numberWithInteger:", objc_msgSend(v19, "folderID"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v20, CFSTR("Starred"));

  v21 = (void *)MEMORY[0x24BDD16E0];
  +[IKFolder unreadFolder](IKFolder, "unreadFolder");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "numberWithInteger:", objc_msgSend(v22, "folderID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v23, CFSTR("Unread"));

  v24 = (void *)MEMORY[0x24BDD16E0];
  +[IKFolder archiveFolder](IKFolder, "archiveFolder");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "numberWithInteger:", objc_msgSend(v25, "folderID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v26, CFSTR("Archive"));

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__WFInstapaperAction_engine_connection_didReceiveFolders___block_invoke;
  block[3] = &unk_24F8BB0A0;
  block[4] = self;
  v30 = v9;
  v31 = v7;
  v27 = v7;
  v28 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (id)possibleStatesForEnumeration:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BDBCEB8]);
  -[WFInstapaperAction folders](self, "folders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithArray:", v7);

  if (!-[WFInstapaperAction includeSpecialFolders](self, "includeSpecialFolders"))
  {
    v20 = v4;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = (void *)objc_msgSend(v8, "copy");
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13);
          -[WFInstapaperAction folders](self, "folders");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "integerValue");

          if (v17 < 0)
            objc_msgSend(v8, "removeObject:", v14);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    v4 = v20;
  }
  objc_msgSend(v8, "if_map:", &__block_literal_global_8877);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", objc_msgSend(v18, "count") == 0);

  return v18;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  return (id)objc_msgSend(a4, "value", a3);
}

- (NSMutableArray)identifiers
{
  return self->_identifiers;
}

- (BOOL)hasFetchedFolders
{
  return self->_hasFetchedFolders;
}

- (void)setHasFetchedFolders:(BOOL)a3
{
  self->_hasFetchedFolders = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_engine, 0);
}

id __51__WFInstapaperAction_possibleStatesForEnumeration___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BEC40C8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithValue:", v3);

  return v4;
}

void __58__WFInstapaperAction_engine_connection_didReceiveFolders___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "setHasFetchedFolders:", 1);
  objc_msgSend(MEMORY[0x24BDBCF50], "workflowUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("WFInstapaperFolders"));

  objc_msgSend(*(id *)(a1 + 32), "parameterForKey:", CFSTR("WFInstapaperFolder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadPossibleStates");

  if (!objc_msgSend(*(id *)(a1 + 48), "numberOfConnections"))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 344);
    *(_QWORD *)(v4 + 344) = 0;

  }
}

@end
