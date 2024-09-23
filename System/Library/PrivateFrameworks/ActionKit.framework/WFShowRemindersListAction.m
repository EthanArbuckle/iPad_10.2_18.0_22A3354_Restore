@implementation WFShowRemindersListAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];

  -[WFShowRemindersListAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFList"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE195D8], "allLists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchingRemindersListsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE195D8], "defaultList");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  v11 = (void *)MEMORY[0x24BDBCF48];
  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v10, "objectID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("x-apple-reminderkit://REMCDList/%@/contents"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLWithString:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFShowRemindersListAction appDescriptor](self, "appDescriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bundleIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFShowRemindersListAction userInterface](self, "userInterface");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __56__WFShowRemindersListAction_runAsynchronouslyWithInput___block_invoke;
  v22[3] = &unk_24F8B7FF0;
  v22[4] = self;
  objc_msgSend(v18, "openURL:withBundleIdentifier:userInterface:completionHandler:", v17, v20, v21, v22);

}

uint64_t __56__WFShowRemindersListAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

@end
