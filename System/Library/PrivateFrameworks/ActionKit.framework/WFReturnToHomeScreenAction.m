@implementation WFReturnToHomeScreenAction

- (id)iconName
{
  return CFSTR("HomeScreen");
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  -[WFReturnToHomeScreenAction userInterface](self, "userInterface", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isRunningWithSiriUI"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "wfUnsupportedUserInterfaceError");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFReturnToHomeScreenAction finishRunningWithError:](self, "finishRunningWithError:", v5);

  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19398]), "initWithBundleIdentifier:options:URL:userActivity:", CFSTR("com.apple.springboard"), 0, 0, 0);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __57__WFReturnToHomeScreenAction_runAsynchronouslyWithInput___block_invoke;
    v8[3] = &unk_24F8B83C0;
    v8[4] = self;
    v9 = v6;
    v7 = v6;
    objc_msgSend(v7, "performWithCompletionHandler:", v8);

  }
}

- (id)returnToHomeScreenError
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v13[0] = *MEMORY[0x24BDD0FD8];
  WFLocalizedString(CFSTR("Could not go to Home Screen"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "idiom");

  switch(v5)
  {
    case 0:
      v6 = CFSTR("DEVICE_LOCKED_ERROR_PHONE");
      v7 = CFSTR("Please make sure your iPhone is unlocked.");
      goto LABEL_8;
    case 1:
      v6 = CFSTR("DEVICE_LOCKED_ERROR_PAD");
      v7 = CFSTR("Please make sure your iPad is unlocked.");
      goto LABEL_8;
    case 2:
      v6 = CFSTR("DEVICE_LOCKED_ERROR_MAC");
      v7 = CFSTR("Please make sure your Mac is unlocked.");
      goto LABEL_8;
    case 3:
      v6 = CFSTR("DEVICE_LOCKED_ERROR_WATCH");
      v7 = CFSTR("Please make sure your Apple Watch is unlocked.");
      goto LABEL_8;
    case 4:
      v6 = CFSTR("DEVICE_LOCKED_ERROR_POD");
      v7 = CFSTR("Please make sure your iPod is unlocked.");
      goto LABEL_8;
    case 5:
      WFLocalizedString(CFSTR("There was an error presenting the Home View."));
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    default:
      v6 = CFSTR("DEVICE_LOCKED_ERROR_UNSPECIFIED");
      v7 = CFSTR("Please make sure your device is unlocked.");
LABEL_8:
      WFLocalizedStringWithKey(v6, v7);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v9 = (void *)v8;
      v14[1] = v8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("WFReturnToHomeScreenActionErrorDomain"), 0, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      return v11;
  }
}

void __57__WFReturnToHomeScreenAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  if (a3)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "returnToHomeScreenError");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishRunningWithError:", v5);

  }
  else
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __57__WFReturnToHomeScreenAction_runAsynchronouslyWithInput___block_invoke_2;
    v6[3] = &unk_24F8B7FF0;
    v4 = *(void **)(a1 + 40);
    v6[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "observeForAppLaunchWithTimeout:completionHandler:", v6, 3.0);
  }
}

void __57__WFReturnToHomeScreenAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  dispatch_time_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v4 = a3;
  v5 = dispatch_time(0, 1000000000);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__WFReturnToHomeScreenAction_runAsynchronouslyWithInput___block_invoke_3;
  v8[3] = &unk_24F8BA480;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v10 = v6;
  v7 = v4;
  dispatch_after(v5, MEMORY[0x24BDAC9B8], v8);

}

void __57__WFReturnToHomeScreenAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "returnToHomeScreenError");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "finishRunningWithError:", v2);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "finishRunningWithError:", 0);
  }
}

@end
