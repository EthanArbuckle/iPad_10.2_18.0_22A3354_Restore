@implementation WFGetIPAddressAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id location;

  v4 = a3;
  -[WFGetIPAddressAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFIPAddressSourceOption"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGetIPAddressAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFIPAddressTypeOption"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("IPv6"));
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("External")))
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setUseIPv6:", v7);
    objc_initWeak(&location, v8);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __51__WFGetIPAddressAction_runAsynchronouslyWithInput___block_invoke;
    v16[3] = &unk_24F8B5A28;
    objc_copyWeak(&v17, &location);
    v16[4] = self;
    objc_msgSend(v8, "setCompletionBlock:", v16);
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addOperation:", v8);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
LABEL_10:

    goto LABEL_11;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("Local")))
  {
    +[WFNetworkInterface activeNetworkInterface](WFNetworkInterface, "activeNetworkInterface");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v10;
    if ((v7 & 1) != 0)
      objc_msgSend(v10, "IPv6Address");
    else
      objc_msgSend(v10, "IPv4Address");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)MEMORY[0x24BE19450];
      objc_msgSend(MEMORY[0x24BE19470], "networkLocation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "itemWithObject:origin:disclosureLevel:", v11, v13, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFGetIPAddressAction output](self, "output");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addItem:", v14);

    }
    -[WFGetIPAddressAction finishRunningWithError:](self, "finishRunningWithError:", 0);

    goto LABEL_10;
  }
LABEL_11:

}

void __51__WFGetIPAddressAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = (void *)MEMORY[0x24BE19450];
    objc_msgSend(WeakRetained, "result");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE19470], "networkLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "itemWithObject:origin:disclosureLevel:", v4, v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "output");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addItem:", v6);

  }
  objc_msgSend(WeakRetained, "error");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD1128]))
    goto LABEL_8;
  if (objc_msgSend(v8, "code") == 65)
  {

LABEL_7:
    v9 = v8;
    v8 = 0;
LABEL_8:

    goto LABEL_9;
  }
  v10 = objc_msgSend(v8, "code");

  if (v10 == 50)
    goto LABEL_7;
LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v8);

}

@end
