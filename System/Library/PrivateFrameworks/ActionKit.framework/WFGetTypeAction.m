@implementation WFGetTypeAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v4 = a3;
  -[WFGetTypeAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFFileType"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7[4] = self;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__WFGetTypeAction_runAsynchronouslyWithInput___block_invoke;
  v8[3] = &unk_24F8BB028;
  v8[4] = self;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__WFGetTypeAction_runAsynchronouslyWithInput___block_invoke_2;
  v7[3] = &unk_24F8BB050;
  objc_msgSend(v4, "enumerateFileRepresentations:forType:completionHandler:", v8, v6, v7);

}

void __46__WFGetTypeAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void (**v7)(id, _QWORD);

  v4 = *(void **)(a1 + 32);
  v7 = a3;
  v5 = a2;
  objc_msgSend(v4, "output");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addFile:", v5);

  v7[2](v7, 0);
}

uint64_t __46__WFGetTypeAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

@end
