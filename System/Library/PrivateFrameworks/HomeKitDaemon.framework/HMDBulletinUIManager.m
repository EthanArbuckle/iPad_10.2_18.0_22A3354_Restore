@implementation HMDBulletinUIManager

+ (void)openHomeAppWithURL:(id)a3
{
  uint64_t v3;
  id v4;

  objc_msgSend(a3, "absoluteString");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@://"), *MEMORY[0x24BDD5C70]);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (id)v3;
  launchURL(v3);

}

+ (void)presentExecutionErrorDialogForTrigger:(id)a3 partialSuccess:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a4;
  v5 = a3;
  +[HMDUIDialogPresenter sharedUIDialogPresenter](HMDUIDialogPresenter, "sharedUIDialogPresenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __77__HMDBulletinUIManager_presentExecutionErrorDialogForTrigger_partialSuccess___block_invoke;
  v9[3] = &unk_24E785438;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v6, "displayExecutionErrorOfTrigger:partialSuccess:context:completionQueue:completionHandler:", v7, v4, v8, MEMORY[0x24BDAC9B8], v9);

}

void __77__HMDBulletinUIManager_presentExecutionErrorDialogForTrigger_partialSuccess___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (a2)
  {
    v2 = (void *)MEMORY[0x24BDD74F0];
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contextSPIUniqueIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "tupleWithQueryType:uuidString:", 0, v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD74F0], "tupleWithQueryType:uuidString:", 7, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    generateURLForHomeKitObject();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    +[HMDBulletinUIManager openHomeAppWithURL:](HMDBulletinUIManager, "openHomeAppWithURL:", v8);
  }
}

@end
