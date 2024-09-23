@implementation WFMakeGIFAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[9];
  char v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFMakeGIFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMakeGIFActionDelayTime"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatValue");
  v7 = v6;

  if (v7 >= 0.01)
    v8 = v7;
  else
    v8 = 0.01;
  -[WFMakeGIFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMakeGIFActionLoopCount"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  -[WFMakeGIFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMakeGIFActionLoopEnabled"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  -[WFMakeGIFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMakeGIFActionAutoSize"), objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  -[WFMakeGIFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMakeGIFActionManualSizeWidth"), objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  -[WFMakeGIFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMakeGIFActionManualSizeHeight"), objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  if (v17 < 0.0)
    v17 = 0.0;
  if (v20 < 0.0)
    v20 = 0.0;
  if (v12)
    v21 = 0;
  else
    v21 = v10;
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  v25[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke;
  v23[3] = &unk_24F8B91E0;
  v23[4] = self;
  v24 = v14;
  *(double *)&v23[5] = v17;
  *(double *)&v23[6] = v20;
  v23[7] = v21;
  *(double *)&v23[8] = v8;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClasses:completionHandler:", v22, v23);

}

- (void)cancel
{
  void *v3;
  void (**v4)(void);
  objc_super v5;

  -[WFMakeGIFAction cancelBlock](self, "cancelBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFMakeGIFAction cancelBlock](self, "cancelBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

    -[WFMakeGIFAction setCancelBlock:](self, "setCancelBlock:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)WFMakeGIFAction;
  -[WFMakeGIFAction cancel](&v5, sel_cancel);
}

- (id)cancelBlock
{
  return self->_cancelBlock;
}

- (void)setCancelBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelBlock, 0);
}

void __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    objc_msgSend(v6, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke_6;
    v9[3] = &unk_24F8B91B8;
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v6;
    v14 = *(_BYTE *)(a1 + 72);
    v11 = *(_OWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v8, "if_flatMapAsynchronously:completionHandler:", &__block_literal_global_42470, v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v7);
  }

}

void __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  id v20;
  uint64_t v21;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isRunning"))
  {
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "if_objectsPassingTest:", &__block_literal_global_132);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = MEMORY[0x24BDAC760];
      v17 = 3221225472;
      v18 = __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke_8;
      v19 = &unk_24F8B96B0;
      v8 = *(id *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 32);
      v20 = v8;
      v21 = v9;
      v10 = _Block_copy(&v16);
      if (objc_msgSend(v7, "count", v16, v17, v18, v19))
      {
        if (objc_msgSend(v7, "count") == 1)
        {
          objc_msgSend(v7, "firstObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "filename");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v12 = 0;
        }
        objc_msgSend(v7, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        WFGenerateGIFFromVideo();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setCancelBlock:", v15);

      }
      else
      {
        if (objc_msgSend(v5, "count") == 1)
        {
          objc_msgSend(v5, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "filename");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v12 = 0;
        }
        WFGenerateGIFFromImageFiles();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setCancelBlock:", v14);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);
    }
  }

}

void __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v5 = a2;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = 0;
LABEL_9:
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke_5;
    v19[3] = &unk_24F8BA110;
    v20 = v6;
    v13 = v6;
    objc_msgSend(v5, "getFileRepresentation:forType:", v19, v15);
    v14 = v20;
    v7 = (void *)v15;
    goto LABEL_10;
  }
  objc_msgSend(v5, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "burstIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if ((objc_msgSend(v7, "mediaSubtypes") & 8) != 0)
    {
      objc_msgSend(v5, "supportedTypes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "array");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "if_objectsPassingTest:", &__block_literal_global_129);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v15 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }

    goto LABEL_9;
  }
  v9 = (void *)MEMORY[0x24BE19438];
  v10 = (void *)MEMORY[0x24BE195C0];
  objc_msgSend(v7, "burstIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemsWithBurstIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionWithItems:", v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke_3;
  v21[3] = &unk_24F8B9110;
  v22 = v6;
  v14 = v6;
  objc_msgSend(v13, "getFileRepresentations:forType:", v21, 0);

LABEL_10:
}

uint64_t __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = (void *)MEMORY[0x24BDBCE30];
  v6 = a3;
  objc_msgSend(v5, "arrayWithObjects:", a2, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);

}

uint64_t __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToUTType:", *MEMORY[0x24BDF82D8]);
}

void __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (a2)
  {
    v5 = (void *)MEMORY[0x24BE19450];
    v6 = *(void **)(a1 + 32);
    v7 = a2;
    objc_msgSend(v6, "attributionSet");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemWithFile:attributionSet:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "output");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addItem:", v9);

  }
  objc_msgSend(*(id *)(a1 + 40), "finishRunningWithError:", v11);

}

uint64_t __46__WFMakeGIFAction_runAsynchronouslyWithInput___block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "wfType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "conformsToUTType:", *MEMORY[0x24BDF82D8]);

  return v3;
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

@end
