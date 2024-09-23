@implementation WFEndWorkoutIntentAction

- (id)actionForAppIdentifier:(id)a3
{
  return 0;
}

- (BOOL)isParameterHidden:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(v3, "resourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "resourcesRequiredForDisplayAvailable"))
    v5 = objc_msgSend(v3, "isHidden");
  else
    v5 = 1;

  return v5;
}

- (BOOL)allowsContinueInAppWhenRunningRemotely
{
  return 1;
}

- (BOOL)skipsProcessingHiddenParameters
{
  return 0;
}

- (id)appResource
{
  return 0;
}

- (id)selectedAppNotSupportedError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("Unsupported Device"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("This action can only be run on Apple Watch."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFEndWorkoutIntentAction localizedName](self, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD1540];
  v9 = *MEMORY[0x24BEC4270];
  v10 = *MEMORY[0x24BDD0FC8];
  v14[0] = *MEMORY[0x24BDD0FD8];
  v14[1] = v10;
  v15[0] = v3;
  v15[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
