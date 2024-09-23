@implementation WFFormatNumberAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[WFFormatNumberAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFNumberFormatDecimalPlaces"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setNumberStyle:", 1);
  objc_msgSend(v7, "setMinimumFractionDigits:", v6);
  objc_msgSend(v7, "setMaximumFractionDigits:", v6);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocale:", v8);

  v9 = objc_opt_class();
  v11[4] = self;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __51__WFFormatNumberAction_runAsynchronouslyWithInput___block_invoke;
  v12[3] = &unk_24F8B1778;
  v13 = v7;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__WFFormatNumberAction_runAsynchronouslyWithInput___block_invoke_2;
  v11[3] = &unk_24F8BAFA8;
  v10 = v7;
  objc_msgSend(v4, "transformObjectRepresentationsForClass:usingBlock:completionHandler:", v9, v12, v11);

}

void __51__WFFormatNumberAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  void *v8;
  void *v9;
  void (**v10)(id, id, id);
  id v11;
  id v12;
  void *v13;
  id v14;

  v8 = (void *)MEMORY[0x24BE19450];
  v9 = *(void **)(a1 + 32);
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v9, "stringFromNumber:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemWithObject:named:", v13, v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v10[2](v10, v14, v11);
}

void __51__WFFormatNumberAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

@end
