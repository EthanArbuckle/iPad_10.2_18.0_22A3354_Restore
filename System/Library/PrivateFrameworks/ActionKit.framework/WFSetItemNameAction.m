@implementation WFSetItemNameAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  WFSetItemNameAction *v15;
  id v16;
  _QWORD aBlock[5];

  v4 = a3;
  if (objc_msgSend(v4, "numberOfItems"))
  {
    -[WFSetItemNameAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFName"), objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "length"))
    {

      v5 = 0;
    }
    v6 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __50__WFSetItemNameAction_runAsynchronouslyWithInput___block_invoke;
    aBlock[3] = &unk_24F8B4880;
    aBlock[4] = self;
    v7 = _Block_copy(aBlock);
    -[WFSetItemNameAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFDontIncludeFileExtension"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if (v9)
    {
      v13[0] = v6;
      v13[1] = 3221225472;
      v13[2] = __50__WFSetItemNameAction_runAsynchronouslyWithInput___block_invoke_3;
      v13[3] = &unk_24F8BA0C0;
      v14 = v5;
      v15 = self;
      v16 = v7;
      objc_msgSend(v4, "getFileRepresentation:forType:", v13, 0);

      v10 = v14;
    }
    else
    {
      objc_msgSend(v4, "items");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v12, "copyWithName:", v5);

      (*((void (**)(void *, void *))v7 + 2))(v7, v10);
      -[WFSetItemNameAction finishRunningWithError:](self, "finishRunningWithError:", 0);
    }

  }
  else
  {
    -[WFSetItemNameAction finishRunningWithError:](self, "finishRunningWithError:", 0);
  }

}

void __50__WFSetItemNameAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "parameterStateForKey:", CFSTR("WFName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containedVariables");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__WFSetItemNameAction_runAsynchronouslyWithInput___block_invoke_2;
  v8[3] = &unk_24F8B4858;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v5 = v3;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);
  objc_msgSend(*(id *)(a1 + 32), "output");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addItem:", v5);

}

void __50__WFSetItemNameAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a2)
  {
    v5 = (void *)MEMORY[0x24BE19450];
    v6 = (void *)objc_msgSend(a2, "copyWithName:addingExtensionIfNecessary:zone:", *(_QWORD *)(a1 + 32), 0, 0);
    objc_msgSend(v5, "itemWithFile:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  objc_msgSend(*(id *)(a1 + 40), "finishRunningWithError:", v8);

}

void __50__WFSetItemNameAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "variableSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentForVariableWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "attributionSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "collectionByMergingAttributionSet:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "variableSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setContent:forVariableWithName:", v11, v10);
}

@end
