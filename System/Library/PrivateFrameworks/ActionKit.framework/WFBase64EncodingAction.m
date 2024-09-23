@implementation WFBase64EncodingAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  id v14;

  v4 = a3;
  -[WFBase64EncodingAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFEncodeMode"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Encode"));
  v7 = objc_opt_class();
  if (v6)
  {
    -[WFBase64EncodingAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFBase64LineBreakMode"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __53__WFBase64EncodingAction_runAsynchronouslyWithInput___block_invoke;
    v13[3] = &unk_24F8B6480;
    v13[4] = self;
    v14 = v8;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __53__WFBase64EncodingAction_runAsynchronouslyWithInput___block_invoke_2;
    v12[3] = &unk_24F8BAFA8;
    v12[4] = self;
    v9 = v8;
    objc_msgSend(v4, "transformFileRepresentationsForType:usingBlock:completionHandler:", 0, v13, v12);

  }
  else
  {
    v10[4] = self;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __53__WFBase64EncodingAction_runAsynchronouslyWithInput___block_invoke_3;
    v11[3] = &unk_24F8B90A8;
    v11[4] = self;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __53__WFBase64EncodingAction_runAsynchronouslyWithInput___block_invoke_4;
    v10[3] = &unk_24F8BAFA8;
    objc_msgSend(v4, "transformObjectRepresentationsForClass:usingBlock:completionHandler:", v7, v11, v10);

  }
}

- (id)base64EncodedStringItemFromFile:(id)a3 lineBreakMode:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Every 64 Characters")) & 1) != 0)
  {
    v7 = 1;
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("Every 76 Characters")))
  {
    v7 = 2;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "mappedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "base64EncodedStringWithOptions:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = (void *)MEMORY[0x24BE19590];
    objc_msgSend(v5, "wfName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "object:named:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)itemFromBase64EncodedString:(id)a3 nameIfKnown:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x24BDBCE50];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithBase64EncodedString:options:", v7, 1);

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BE194F8], "fileWithData:ofType:proposedFilename:", v8, 0, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)inputContentClasses
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  -[WFBase64EncodingAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFEncodeMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Decode"));

  v5 = objc_opt_class();
  if (v4)
  {
    v13[0] = v5;
    v6 = (void *)MEMORY[0x24BDBCE30];
    v7 = v13;
    v8 = 1;
  }
  else
  {
    v11 = v5;
    v12 = objc_opt_class();
    v6 = (void *)MEMORY[0x24BDBCE30];
    v7 = &v11;
    v8 = 2;
  }
  objc_msgSend(v6, "arrayWithObjects:count:", v7, v8, v11, v12, v13[0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)outputContentClasses
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  -[WFBase64EncodingAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFEncodeMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Encode"));

  v5 = objc_opt_class();
  if (v4)
  {
    v13[0] = v5;
    v6 = (void *)MEMORY[0x24BDBCE30];
    v7 = v13;
    v8 = 1;
  }
  else
  {
    v11 = v5;
    v12 = objc_opt_class();
    v6 = (void *)MEMORY[0x24BDBCE30];
    v7 = &v11;
    v8 = 2;
  }
  objc_msgSend(v6, "arrayWithObjects:count:", v7, v8, v11, v12, v13[0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  _BOOL4 v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)WFBase64EncodingAction;
  v7 = -[WFBase64EncodingAction setParameterState:forKey:](&v9, sel_setParameterState_forKey_, a3, v6);
  if (v7 && objc_msgSend(v6, "isEqualToString:", CFSTR("WFEncodeMode")))
    -[WFBase64EncodingAction outputDetailsUpdated](self, "outputDetailsUpdated");

  return v7;
}

void __53__WFBase64EncodingAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(_QWORD, _QWORD, _QWORD))
{
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = a4;
  objc_msgSend(v6, "base64EncodedStringItemFromFile:lineBreakMode:", a2, v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, _QWORD))a4)[2](v8, v9, 0);

}

void __53__WFBase64EncodingAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

void __53__WFBase64EncodingAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void (**v8)(id, void *, _QWORD);
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  objc_msgSend(*(id *)(a1 + 32), "itemFromBase64EncodedString:nameIfKnown:", a2, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v8[2](v8, v9, 0);
  }
  else
  {
    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *MEMORY[0x24BEC4270];
    v15 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("The base64 data passed to Base64 Encode is invalid."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 6, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v8)[2](v8, 0, v14);

  }
}

void __53__WFBase64EncodingAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

@end
