@implementation WFSendToGoodReaderAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __55__WFSendToGoodReaderAction_runAsynchronouslyWithInput___block_invoke;
  v3[3] = &unk_24F8B96D8;
  v3[4] = self;
  objc_msgSend(a3, "getFileRepresentation:forType:", v3, 0);
}

- (id)contentDestinationWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE19390];
  -[WFSendToGoodReaderAction appDescriptor](self, "appDescriptor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationWithAppDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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
    WFLocalizedString(CFSTR("Allow “%1$@” to open %2$@ in GoodReader?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to open GoodReader?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __55__WFSendToGoodReaderAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BEC39F0], "sharedRegistry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appWithIdentifier:", CFSTR("com.goodiware.goodreader4"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "fileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __55__WFSendToGoodReaderAction_runAsynchronouslyWithInput___block_invoke_2;
    v12[3] = &unk_24F8B8B80;
    v13 = v7;
    v9 = v5;
    v10 = *(_QWORD *)(a1 + 32);
    v14 = v9;
    v15 = v10;
    v11 = v7;
    objc_msgSend(v11, "openFile:completionHandler:", v8, v12);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a3);
  }

}

void __55__WFSendToGoodReaderAction_runAsynchronouslyWithInput___block_invoke_2(id *a1, char a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    v5 = *MEMORY[0x24BDD1128];
    v12 = *MEMORY[0x24BDD0FC8];
    v6 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("%1$@ is not installed or could not open the file %2$@."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "localizedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "filename");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 79, v11);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1[6], "finishRunningWithError:", v3);

}

@end
