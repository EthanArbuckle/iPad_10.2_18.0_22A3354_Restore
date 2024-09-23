@implementation WFCalculateExpressionAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__WFCalculateExpressionAction_runAsynchronouslyWithInput___block_invoke;
  v3[3] = &unk_24F8BB768;
  v3[4] = self;
  objc_msgSend(a3, "getStringRepresentation:", v3);
}

void __58__WFCalculateExpressionAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[3];

  v40[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);
    goto LABEL_12;
  }
  v28 = 0;
  v29 = (uint64_t)&v28;
  v30 = 0x2020000000;
  v9 = (id *)getCalculateKeyLocalesSymbolLoc_ptr;
  v31 = (void *)getCalculateKeyLocalesSymbolLoc_ptr;
  if (!getCalculateKeyLocalesSymbolLoc_ptr)
  {
    v10 = CalculateLibrary();
    v9 = (id *)dlsym(v10, "CalculateKeyLocales");
    *(_QWORD *)(v29 + 24) = v9;
    getCalculateKeyLocalesSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v28, 8);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCalculateKeyLocales(void)");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("WFCalculateExpressionAction.m"), 19, CFSTR("%s"), dlerror());

    goto LABEL_15;
  }
  v11 = *v9;
  v38 = v11;
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v37, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v13;
  v28 = 0;
  v29 = (uint64_t)&v28;
  v30 = 0x2020000000;
  v14 = (id *)getCalculateKeyAllowUnitsSymbolLoc_ptr;
  v31 = (void *)getCalculateKeyAllowUnitsSymbolLoc_ptr;
  if (!getCalculateKeyAllowUnitsSymbolLoc_ptr)
  {
    v15 = CalculateLibrary();
    v14 = (id *)dlsym(v15, "CalculateKeyAllowUnits");
    *(_QWORD *)(v29 + 24) = v14;
    getCalculateKeyAllowUnitsSymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(&v28, 8);
  if (!v14)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getCalculateKeyAllowUnits(void)");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("WFCalculateExpressionAction.m"), 20, CFSTR("%s"), dlerror());

LABEL_15:
    __break(1u);
  }
  v39 = *v14;
  v40[1] = MEMORY[0x24BDBD1C0];
  v16 = (void *)MEMORY[0x24BDBCE70];
  v17 = v39;
  objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v40, &v38, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0;
  v34 = &v33;
  v35 = 0x2050000000;
  v19 = (void *)getCalculateClass_softClass;
  v36 = getCalculateClass_softClass;
  v20 = MEMORY[0x24BDAC760];
  if (!getCalculateClass_softClass)
  {
    v28 = MEMORY[0x24BDAC760];
    v29 = 3221225472;
    v30 = (uint64_t)__getCalculateClass_block_invoke;
    v31 = &unk_24F8BB430;
    v32 = &v33;
    __getCalculateClass_block_invoke((uint64_t)&v28);
    v19 = (void *)v34[3];
  }
  v21 = objc_retainAutorelease(v19);
  _Block_object_dispose(&v33, 8);
  v27[0] = v20;
  v27[1] = 3221225472;
  v27[2] = __58__WFCalculateExpressionAction_runAsynchronouslyWithInput___block_invoke_2;
  v27[3] = &unk_24F8B0EC0;
  v27[4] = *(_QWORD *)(a1 + 32);
  v22 = (id)objc_msgSend(v21, "evaluate:options:resultHandler:", v8, v18, v27);

LABEL_12:
}

void __58__WFCalculateExpressionAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  if (a2)
  {
    objc_msgSend(a2, "terms");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = *(void **)(a1 + 32);
    if (v7)
    {
      objc_msgSend(v8, "output");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v7);

      v8 = *(void **)(a1 + 32);
      v10 = 0;
    }
    else
    {
      v10 = v11;
    }
    objc_msgSend(v8, "finishRunningWithError:", v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v11);
  }

}

@end
