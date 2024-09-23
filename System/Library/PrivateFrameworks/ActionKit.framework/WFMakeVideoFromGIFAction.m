@implementation WFMakeVideoFromGIFAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v4 = (void *)MEMORY[0x24BEC14A0];
  v5 = *MEMORY[0x24BDF83D8];
  v6 = a3;
  objc_msgSend(v4, "typeWithUTType:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = self;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__WFMakeVideoFromGIFAction_runAsynchronouslyWithInput___block_invoke;
  v9[3] = &unk_24F8B54C0;
  v9[4] = self;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__WFMakeVideoFromGIFAction_runAsynchronouslyWithInput___block_invoke_3;
  v8[3] = &unk_24F8BAFA8;
  objc_msgSend(v6, "transformFirstFileRepresentationForType:usingBlock:completionHandler:", v7, v9, v8);

}

- (void)cancel
{
  void *v3;
  void (**v4)(void);
  objc_super v5;

  -[WFMakeVideoFromGIFAction cancelBlock](self, "cancelBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFMakeVideoFromGIFAction cancelBlock](self, "cancelBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

    -[WFMakeVideoFromGIFAction setCancelBlock:](self, "setCancelBlock:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)WFMakeVideoFromGIFAction;
  -[WFMakeVideoFromGIFAction cancel](&v5, sel_cancel);
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

void __55__WFMakeVideoFromGIFAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v7 = a2;
  v8 = a4;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFMakeVideoFromGIFActionLoopCount"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "integerValue");

    objc_msgSend(v7, "wfName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x24BDAC760];
    v11 = v8;
    v14 = *(_QWORD *)(a1 + 32);
    v15 = v11;
    WFGenerateVideoFromGIF();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCancelBlock:", v12, v13, 3221225472, __55__WFMakeVideoFromGIFAction_runAsynchronouslyWithInput___block_invoke_2, &unk_24F8BA660, v14);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a3);
  }

}

void __55__WFMakeVideoFromGIFAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

void __55__WFMakeVideoFromGIFAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (*v8)(void);
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCancelBlock:", 0);
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(v6, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE19698]))
    {
      v10 = objc_msgSend(v7, "code");

      if (!v10)
      {
        WFLocalizedString(CFSTR("GIF Not Animated"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        WFLocalizedString(CFSTR("Make Video from GIF failed because the GIF passed as input was not an animated GIF."));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)MEMORY[0x24BDD1540];
        v14 = *MEMORY[0x24BEC4270];
        v15 = *MEMORY[0x24BDD0FC8];
        v18[0] = *MEMORY[0x24BDD0FD8];
        v18[1] = v15;
        v19[0] = v11;
        v19[1] = v12;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 6, v16);
        v17 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v17;
      }
    }
    else
    {

    }
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v8();

}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

@end
