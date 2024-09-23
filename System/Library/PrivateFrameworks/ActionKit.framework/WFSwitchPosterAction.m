@implementation WFSwitchPosterAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__WFSwitchPosterAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_24F8B7958;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "getObjectRepresentation:forClass:", v6, objc_opt_class());

}

- (void)switchToPosterAndFinish:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  WFSwitchPosterAction *v12;
  id v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v5 = (void *)getPRSServiceClass_softClass_37394;
  v18 = getPRSServiceClass_softClass_37394;
  v6 = MEMORY[0x24BDAC760];
  if (!getPRSServiceClass_softClass_37394)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __getPRSServiceClass_block_invoke_37395;
    v14[3] = &unk_24F8BB430;
    v14[4] = &v15;
    __getPRSServiceClass_block_invoke_37395((uint64_t)v14);
    v5 = (void *)v16[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v15, 8);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __48__WFSwitchPosterAction_switchToPosterAndFinish___block_invoke;
  v10[3] = &unk_24F8BB348;
  v11 = v4;
  v12 = self;
  v13 = objc_alloc_init(v7);
  v8 = v13;
  v9 = v4;
  objc_msgSend(v8, "fetchPosterConfigurations:", v10);

}

- (id)missingPosterError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEC4270];
  v9[0] = *MEMORY[0x24BDD0FD8];
  WFLocalizedString(CFSTR("Unable to Switch Between Wallpapers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = *MEMORY[0x24BDD0FC8];
  WFLocalizedString(CFSTR("Shortcuts was unable to find the specified wallpaper."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 6, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)noInputError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEC4270];
  v9[0] = *MEMORY[0x24BDD0FD8];
  WFLocalizedString(CFSTR("Unable to Switch Between Wallpapers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = *MEMORY[0x24BDD0FC8];
  WFLocalizedString(CFSTR("Please select a wallpaper."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 6, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)disabledOnPlatforms
{
  return &unk_24F93C5B8;
}

void __48__WFSwitchPosterAction_switchToPosterAndFinish___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;

  v4 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __48__WFSwitchPosterAction_switchToPosterAndFinish___block_invoke_2;
  v10[3] = &unk_24F8BAD40;
  v11 = *(id *)(a1 + 32);
  objc_msgSend(a2, "if_firstObjectPassingTest:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __48__WFSwitchPosterAction_switchToPosterAndFinish___block_invoke_3;
    v9[3] = &unk_24F8BB370;
    v6 = *(void **)(a1 + 48);
    v9[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v6, "updateToSelectedConfiguration:completion:", v5, v9);
  }
  else
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v7, "missingPosterError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishRunningWithError:", v8);

  }
}

uint64_t __48__WFSwitchPosterAction_switchToPosterAndFinish___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "serverUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __48__WFSwitchPosterAction_switchToPosterAndFinish___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "localizedName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  WFSanitizedPostersError();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "finishRunningWithError:", v4);
}

void __51__WFSwitchPosterAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];

  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "switchToPosterAndFinish:", a2);
  }
  else
  {
    objc_msgSend(v3, "parameterForKey:", CFSTR("WFPoster"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithObject:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __51__WFSwitchPosterAction_runAsynchronouslyWithInput___block_invoke_2;
    v9[3] = &unk_24F8B7930;
    v9[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "askForValuesOfParameters:withDefaultStates:prompts:input:workQueue:completionHandler:", v6, MEMORY[0x24BDBD1B8], MEMORY[0x24BDBD1B8], v7, v8, v9);

  }
}

void __51__WFSwitchPosterAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  _QWORD v7[5];

  v6 = a3;
  if (v6)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __51__WFSwitchPosterAction_runAsynchronouslyWithInput___block_invoke_3;
    v7[3] = &unk_24F8B7908;
    v7[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "getObjectRepresentation:forClass:", v7, objc_opt_class());
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a4);
  }

}

void __51__WFSwitchPosterAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "switchToPosterAndFinish:", a2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "noInputError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishRunningWithError:", v3);

  }
}

@end
