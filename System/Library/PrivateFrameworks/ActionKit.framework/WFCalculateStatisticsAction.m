@implementation WFCalculateStatisticsAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  WFStatisticsEngine *v7;
  uint64_t v8;
  id v9;
  WFStatisticsEngine *v10;
  void (**v11)(_QWORD);
  uint64_t v12;
  _QWORD v13[5];
  void (**v14)(_QWORD);
  _QWORD v15[4];
  WFStatisticsEngine *v16;
  uint64_t v17;
  _QWORD aBlock[4];
  id v19;
  WFCalculateStatisticsAction *v20;
  WFStatisticsEngine *v21;
  uint64_t v22;

  v4 = a3;
  -[WFCalculateStatisticsAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFStatisticsOperation"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Average")) & 1) != 0)
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Minimum")) & 1) != 0)
  {
    v6 = 2;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Maximum")) & 1) != 0)
  {
    v6 = 3;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Sum")) & 1) != 0)
  {
    v6 = 4;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Median")) & 1) != 0)
  {
    v6 = 5;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Mode")) & 1) != 0)
  {
    v6 = 6;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Range")) & 1) != 0)
  {
    v6 = 7;
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Standard Deviation")))
  {
    v6 = 8;
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_alloc_init(WFStatisticsEngine);
  v8 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke;
  aBlock[3] = &unk_24F8BAAB8;
  v9 = v4;
  v19 = v9;
  v20 = self;
  v10 = v7;
  v21 = v10;
  v22 = v6;
  v11 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(v9, "numberOfItems") == 1)
  {
    v12 = objc_opt_class();
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke_5;
    v15[3] = &unk_24F8BAAE0;
    v16 = v10;
    v17 = v6;
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke_7;
    v13[3] = &unk_24F8BAB08;
    v13[4] = self;
    v14 = v11;
    objc_msgSend(v9, "transformFirstObjectRepresentationForClass:usingBlock:completionHandler:", v12, v15, v13);

  }
  else
  {
    v11[2](v11);
  }

}

- (id)outputName
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  -[WFCalculateStatisticsAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFStatisticsOperation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[WFCalculateStatisticsAction parameterForKey:](self, "parameterForKey:", CFSTR("WFStatisticsOperation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedLabelForPossibleState:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WFCalculateStatisticsAction;
    -[WFCalculateStatisticsAction outputName](&v9, sel_outputName);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

void __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;
  uint64_t v8;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke_2;
  v5[3] = &unk_24F8BAA90;
  v2 = *(void **)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = v3;
  v8 = v4;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v2, "getObjectRepresentations:forClass:", v5, objc_opt_class());

}

void __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v9 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v16[0] = a2;
  v10 = (void *)MEMORY[0x24BDBCE30];
  v11 = a2;
  objc_msgSend(v10, "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke_6;
  v14[3] = &unk_24F8BAD00;
  v15 = v7;
  v13 = v7;
  objc_msgSend(v9, "applyOperation:onStatisticsSampleProviders:completion:", v8, v12, v14);

}

uint64_t __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setOutput:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

void __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "sampleProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v5, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "if_objectsPassingTest:", &__block_literal_global_46628);
    v8 = objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke_4;
    v11[3] = &unk_24F8BAA68;
    v9 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 56);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v9, "applyOperation:onNumbers:completion:", v10, v8, v11);

    v6 = (id)v8;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v7);
  }

}

void __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v18 = v3;
      v4 = v3;
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v20;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v20 != v7)
              objc_enumerationMutation(v4);
            v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8);
            objc_msgSend(*(id *)(a1 + 32), "output");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = (void *)MEMORY[0x24BE19450];
            objc_msgSend(*(id *)(a1 + 40), "attributionSet");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "itemWithObject:attributionSet:", v9, v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addItem:", v13);

            ++v8;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v6);
      }

      v3 = v18;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "output");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x24BE19450];
      objc_msgSend(*(id *)(a1 + 40), "attributionSet");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "itemWithObject:attributionSet:", v3, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addItem:", v17);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);

}

BOOL __58__WFCalculateStatisticsAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  char isKindOfClass;

  v2 = (void *)MEMORY[0x24BDD16E0];
  v3 = a2;
  objc_msgSend(v2, "numberWithBool:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

@end
