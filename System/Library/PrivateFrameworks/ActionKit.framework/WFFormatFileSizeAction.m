@implementation WFFormatFileSizeAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__WFFormatFileSizeAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_24F8BA0E8;
  v6[4] = self;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClasses:completionHandler:", v5, v6);

}

void __53__WFFormatFileSizeAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  _QWORD v17[4];
  uint64_t v18;
  id v19;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFFileSizeFormat"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Automatic")) & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFFileSizeIncludeUnits"), objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "BOOLValue");

    }
    v11 = objc_alloc_init(MEMORY[0x24BDD1490]);
    objc_msgSend(v11, "setCountStyle:", 2);
    v12 = v8;
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Automatic")) & 1) != 0)
    {
      v13 = 0;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Bytes")) & 1) != 0)
    {
      v13 = 1;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("KB")) & 1) != 0)
    {
      v13 = 2;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("MB")) & 1) != 0)
    {
      v13 = 4;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("GB")) & 1) != 0)
    {
      v13 = 8;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("TB")) & 1) != 0)
    {
      v13 = 16;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("PB")) & 1) != 0)
    {
      v13 = 32;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("EB")) & 1) != 0)
    {
      v13 = 64;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", CFSTR("ZB")) & 1) != 0)
    {
      v13 = 128;
    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("YB or Higher")))
    {
      v13 = 65280;
    }
    else
    {
      v13 = 0;
    }

    objc_msgSend(v11, "setAllowedUnits:", v13);
    objc_msgSend(v11, "setIncludesUnit:", v9);
    objc_msgSend(v6, "items");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __53__WFFormatFileSizeAction_runAsynchronouslyWithInput___block_invoke_2;
    v17[3] = &unk_24F8B6320;
    v18 = *(_QWORD *)(a1 + 32);
    v19 = v11;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __53__WFFormatFileSizeAction_runAsynchronouslyWithInput___block_invoke_4;
    v16[3] = &unk_24F8BB050;
    v16[4] = v18;
    v15 = v11;
    objc_msgSend(v14, "if_enumerateAsynchronouslyInSequence:completionHandler:", v17, v16);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v7);
  }

}

void __53__WFFormatFileSizeAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __53__WFFormatFileSizeAction_runAsynchronouslyWithInput___block_invoke_3;
  v11[3] = &unk_24F8B62F8;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v13 = v6;
  v11[4] = v7;
  v12 = v8;
  v9 = v6;
  v10 = a2;
  objc_msgSend(v10, "getObjectRepresentation:forClass:", v11, objc_opt_class());

}

uint64_t __53__WFFormatFileSizeAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

void __53__WFFormatFileSizeAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "output");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "stringFromByteCount:", objc_msgSend(v5, "longLongValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

@end
