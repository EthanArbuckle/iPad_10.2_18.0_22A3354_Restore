@implementation WFGetClassAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  NSString *v5;
  Class v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v4 = a3;
  -[WFGetClassAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("Class"), objc_opt_class());
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = NSClassFromString(v5);

  v7[4] = self;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__WFGetClassAction_runAsynchronouslyWithInput___block_invoke;
  v8[3] = &unk_24F8B3968;
  v8[4] = self;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__WFGetClassAction_runAsynchronouslyWithInput___block_invoke_2;
  v7[3] = &unk_24F8BB050;
  objc_msgSend(v4, "enumerateObjectRepresentations:forClass:completionHandler:", v8, v6, v7);

}

void __47__WFGetClassAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void (**v10)(id, _QWORD);

  v6 = *(void **)(a1 + 32);
  v10 = a4;
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "output");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:named:", v8, v7);

  v10[2](v10, 0);
}

uint64_t __47__WFGetClassAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

@end
