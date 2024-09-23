@implementation WFGetCurrentLocationAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];

  -[WFGetCurrentLocationAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("Accuracy"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFCLLocationAccuracyFromWFLocationAccuracy();
  v6 = v5;
  v7 = (void *)MEMORY[0x24BEC3E98];
  -[WFGetCurrentLocationAction workflow](self, "workflow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "environment");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __57__WFGetCurrentLocationAction_runAsynchronouslyWithInput___block_invoke;
  v10[3] = &unk_24F8B0E80;
  v10[4] = self;
  objc_msgSend(v7, "determineLocationWithWorkflowEnvironment:desiredAccuracy:completion:", v9, v10, v6);

}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE19470], "locationLocation", a3);
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a5;
  WFLocalizedString(CFSTR("Allow “%1$@” to access your current location?"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __57__WFGetCurrentLocationAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BE19450];
    objc_msgSend(MEMORY[0x24BE19470], "locationLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemWithObject:origin:disclosureLevel:", v5, v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "output");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addItem:", v9);

  }
  v11 = *(void **)(a1 + 32);
  v12 = v6;
  objc_msgSend(v12, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v14 = (_QWORD *)getkCLErrorDomainSymbolLoc_ptr;
  v28 = getkCLErrorDomainSymbolLoc_ptr;
  if (!getkCLErrorDomainSymbolLoc_ptr)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __getkCLErrorDomainSymbolLoc_block_invoke;
    v24[3] = &unk_24F8BB430;
    v24[4] = &v25;
    __getkCLErrorDomainSymbolLoc_block_invoke(v24);
    v14 = (_QWORD *)v26[3];
  }
  _Block_object_dispose(&v25, 8);
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getkCLErrorDomain(void)");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("WFGetCurrentLocationAction.m"), 19, CFSTR("%s"), dlerror());

    __break(1u);
  }
  if (!objc_msgSend(v13, "isEqualToString:", *v14))
  {

    goto LABEL_10;
  }
  v15 = objc_msgSend(v12, "code") == 2;

  if (!v15)
  {
LABEL_10:
    v21 = v12;
    goto LABEL_11;
  }
  v16 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(v12, "domain");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v12, "code");
  v25 = *MEMORY[0x24BDD0FC8];
  WFLocalizedString(CFSTR("Get Current Location failed because a network error occurred."));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v25, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, v18, v20);
  v21 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
  objc_msgSend(v11, "finishRunningWithError:", v21);

}

@end
