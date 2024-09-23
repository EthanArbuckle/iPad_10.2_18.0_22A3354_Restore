@implementation WFAddFrameToGIFAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[WFAddFrameToGIFAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFImage"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__WFAddFrameToGIFAction_runAsynchronouslyWithInput___block_invoke;
  v8[3] = &unk_24F8B7680;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "generateCollectionByCoercingToItemClass:completionHandler:", v6, v8);

}

void __52__WFAddFrameToGIFAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __52__WFAddFrameToGIFAction_runAsynchronouslyWithInput___block_invoke_2;
    v9[3] = &unk_24F8B96B0;
    v8 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v10 = v8;
    objc_msgSend(v6, "getFileRepresentation:forType:", v9, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v7);
  }

}

void __52__WFAddFrameToGIFAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  float v7;
  float v8;
  double v9;
  void *v10;
  char v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  double v29;
  double v30;
  double v31;
  char v32;
  _QWORD aBlock[5];

  v5 = a2;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFGIFDelayTime"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatValue");
    v8 = v7;

    if (v8 >= 0.0001)
      v9 = v8;
    else
      v9 = 0.0001;
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFGIFAutoSize"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFGIFManualSizeWidth"), objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v14 = v13;

    if (v14 >= 0.0)
      v15 = v14;
    else
      v15 = 0.0;
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFGIFManualSizeHeight"), objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;

    if (v18 < 0.0)
      v18 = 0.0;
    v19 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__WFAddFrameToGIFAction_runAsynchronouslyWithInput___block_invoke_3;
    aBlock[3] = &unk_24F8B96D8;
    aBlock[4] = *(_QWORD *)(a1 + 32);
    v20 = _Block_copy(aBlock);
    v21 = *(void **)(a1 + 40);
    v26[0] = v19;
    v26[1] = 3221225472;
    v26[2] = __52__WFAddFrameToGIFAction_runAsynchronouslyWithInput___block_invoke_4;
    v26[3] = &unk_24F8B5AC8;
    v32 = v11;
    v29 = v9;
    v30 = v15;
    v31 = v18;
    v27 = v5;
    v28 = v20;
    v22 = (void *)MEMORY[0x24BEC14A0];
    v23 = *MEMORY[0x24BDF83D8];
    v24 = v20;
    objc_msgSend(v22, "typeWithUTType:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "getFileRepresentation:forType:", v26, v25);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a3);
  }

}

void __52__WFAddFrameToGIFAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "output");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addFile:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v8);

}

void __52__WFAddFrameToGIFAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int IsAnimatedGIF;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5
    && (objc_msgSend(v5, "mappedData"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        IsAnimatedGIF = WFImageDataIsAnimatedGIF(),
        v7,
        IsAnimatedGIF))
  {
    WFImageSizeFromFile();
    objc_msgSend(v5, "wfName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    WFAddImageFileToGIF();

  }
  else
  {
    v12[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (id)WFGenerateGIFFromImageFiles();

  }
}

@end
