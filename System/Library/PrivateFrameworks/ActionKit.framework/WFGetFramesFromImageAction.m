@implementation WFGetFramesFromImageAction

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
  v6[2] = __57__WFGetFramesFromImageAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_24F8BA0E8;
  v6[4] = self;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClasses:completionHandler:", v5, v6);

}

- (void)cancel
{
  void *v3;
  void (**v4)(void);
  objc_super v5;

  -[WFGetFramesFromImageAction cancelBlock](self, "cancelBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFGetFramesFromImageAction cancelBlock](self, "cancelBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

    -[WFGetFramesFromImageAction setCancelBlock:](self, "setCancelBlock:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)WFGetFramesFromImageAction;
  -[WFGetFramesFromImageAction cancel](&v5, sel_cancel);
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

void __57__WFGetFramesFromImageAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[4];
  uint64_t v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "numberOfItems"))
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __57__WFGetFramesFromImageAction_runAsynchronouslyWithInput___block_invoke_2;
    v16[3] = &unk_24F8B2B60;
    v17 = *(_QWORD *)(a1 + 32);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __57__WFGetFramesFromImageAction_runAsynchronouslyWithInput___block_invoke_5;
    v15[3] = &unk_24F8BAFA8;
    v15[4] = v17;
    objc_msgSend(v6, "transformItemsAndFlattenUsingBlock:completionHandler:", v16, v15);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    if (v7)
    {
      objc_msgSend(v8, "finishRunningWithError:", v7);
    }
    else
    {
      v9 = (void *)MEMORY[0x24BDD1540];
      v10 = *MEMORY[0x24BEC4270];
      v18[0] = *MEMORY[0x24BDD0FD8];
      WFLocalizedString(CFSTR("No Image Provided"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v11;
      v18[1] = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("No GIF was passed as input to Get Frames from Image."));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 6, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "finishRunningWithError:", v14);

    }
  }

}

void __57__WFGetFramesFromImageAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  objc_msgSend(v5, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "burstIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {

LABEL_5:
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __57__WFGetFramesFromImageAction_runAsynchronouslyWithInput___block_invoke_3;
    v13[3] = &unk_24F8BA660;
    v14 = *(_QWORD *)(a1 + 32);
    v15 = v6;
    objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83D8], v13[0], 3221225472, __57__WFGetFramesFromImageAction_runAsynchronouslyWithInput___block_invoke_3, &unk_24F8BA660, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getFileRepresentation:forType:", v13, v12);

    goto LABEL_6;
  }
  v9 = (void *)MEMORY[0x24BE195C0];
  objc_msgSend(v7, "burstIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemsWithBurstIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD))v6 + 2))(v6, v11, 0);

LABEL_6:
}

void __57__WFGetFramesFromImageAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v7 = a3;
  v6 = a2;
  objc_msgSend(v5, "setCancelBlock:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setOutput:", v6);

  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v7);
}

void __57__WFGetFramesFromImageAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "wfName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(id *)(a1 + 40);
  WFGenerateImageFilesFromGIF();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setCancelBlock:", v5);
}

uint64_t __57__WFGetFramesFromImageAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

@end
