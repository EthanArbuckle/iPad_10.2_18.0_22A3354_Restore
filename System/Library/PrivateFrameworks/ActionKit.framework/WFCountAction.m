@implementation WFCountAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[WFCountAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFCountType"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("Items")))
  {
    -[WFCountAction output](self, "output");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1518], "numberWithInteger:", objc_msgSend(v4, "numberOfItems"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    -[WFCountAction finishRunningWithError:](self, "finishRunningWithError:", 0);
  }
  else
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __44__WFCountAction_runAsynchronouslyWithInput___block_invoke;
    v8[3] = &unk_24F8BA4D8;
    v8[4] = self;
    v9 = v5;
    objc_msgSend(v4, "getStringRepresentation:", v8);

  }
}

void __44__WFCountAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("Characters")) & 1) != 0)
    {
      v7 = 514;
    }
    else if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("Words")) & 1) != 0)
    {
      v7 = 515;
    }
    else if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("Sentences")) & 1) != 0)
    {
      v7 = 516;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("Lines"));
      v7 = 512;
    }
    v8 = objc_msgSend(v5, "length");
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __44__WFCountAction_runAsynchronouslyWithInput___block_invoke_2;
    v11[3] = &unk_24F8B4FF8;
    v11[4] = &v12;
    objc_msgSend(v5, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, v7, v11);
    objc_msgSend(*(id *)(a1 + 32), "output");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1518], "numberWithUnsignedInteger:", v13[3]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);
  }

}

uint64_t __44__WFCountAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

@end
