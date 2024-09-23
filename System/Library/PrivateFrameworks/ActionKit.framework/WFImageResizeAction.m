@implementation WFImageResizeAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = objc_opt_class();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__WFImageResizeAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_24F8BA0E8;
  v6[4] = self;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClass:completionHandler:", v5, v6);

}

void __50__WFImageResizeAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  float v9;
  double v10;
  void *v11;
  float v12;
  double v13;
  void *v14;
  float v15;
  double v16;
  void *v17;
  float v18;
  double v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  _QWORD v23[4];
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFImageResizeWidth"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v10 = v9;

    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFImageResizeHeight"), objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v13 = v12;

    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFImageResizePercentage"), objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "floatValue");
    v16 = v15;

    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFImageResizeLength"), objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    v19 = v18;

    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFImageResizeKey"), objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __50__WFImageResizeAction_runAsynchronouslyWithInput___block_invoke_2;
    v23[3] = &unk_24F8B00B8;
    v25 = v10;
    v26 = v13;
    v24 = v20;
    v27 = v16;
    v28 = v19;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __50__WFImageResizeAction_runAsynchronouslyWithInput___block_invoke_4;
    v22[3] = &unk_24F8BAFA8;
    v22[4] = *(_QWORD *)(a1 + 32);
    v21 = v20;
    objc_msgSend(v6, "transformItemsUsingBlock:completionHandler:", v23, v22);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v7);
  }

}

void __50__WFImageResizeAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  __int128 v10;
  __int128 v11;

  v5 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__WFImageResizeAction_runAsynchronouslyWithInput___block_invoke_3;
  v7[3] = &unk_24F8B0090;
  v9 = v5;
  v10 = *(_OWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v11 = *(_OWORD *)(a1 + 56);
  v6 = v5;
  objc_msgSend(a2, "getFileRepresentation:forType:", v7, 0);

}

void __50__WFImageResizeAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

void __50__WFImageResizeAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
  {
    WFImageSizeFromFile();
    if (!objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("Size"))
      && !objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("Percentage")))
    {
      objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("Longest Edge"));
    }
    WFAsyncTransformedImageFromImage();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

@end
