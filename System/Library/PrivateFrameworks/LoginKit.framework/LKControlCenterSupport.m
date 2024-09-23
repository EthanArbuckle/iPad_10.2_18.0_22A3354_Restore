@implementation LKControlCenterSupport

+ (void)enableControlCenterModule:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = (void *)MEMORY[0x24BE19A08];
  v7 = a3;
  objc_msgSend(v6, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __70__LKControlCenterSupport_enableControlCenterModule_completionHandler___block_invoke;
  v10[3] = &unk_24D59AE60;
  v11 = v5;
  v9 = v5;
  objc_msgSend(v8, "requestEnableModuleWithIdentifier:completionHandler:", v7, v10);

}

uint64_t __70__LKControlCenterSupport_enableControlCenterModule_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
