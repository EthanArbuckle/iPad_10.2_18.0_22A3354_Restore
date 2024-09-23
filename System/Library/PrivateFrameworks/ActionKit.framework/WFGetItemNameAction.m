@implementation WFGetItemNameAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __50__WFGetItemNameAction_runAsynchronouslyWithInput___block_invoke;
  v4[3] = &unk_24F8B3818;
  v4[4] = self;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__WFGetItemNameAction_runAsynchronouslyWithInput___block_invoke_3;
  v3[3] = &unk_24F8BAFA8;
  objc_msgSend(a3, "transformItemsUsingBlock:completionHandler:", v4, v3);
}

void __50__WFGetItemNameAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("GetWebPageTitle"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "contentPermissionRequestor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __50__WFGetItemNameAction_runAsynchronouslyWithInput___block_invoke_2;
    v11[3] = &unk_24F8B37F0;
    v12 = v6;
    objc_msgSend(v5, "getTitleWithPermissionRequestor:completionHandler:", v9, v11);

  }
  else
  {
    objc_msgSend(v5, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v6 + 2))(v6, v10, 0);

  }
}

void __50__WFGetItemNameAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

uint64_t __50__WFGetItemNameAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
