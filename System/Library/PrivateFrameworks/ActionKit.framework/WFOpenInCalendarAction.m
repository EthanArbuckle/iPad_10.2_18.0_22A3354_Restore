@implementation WFOpenInCalendarAction

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
  v6[2] = __53__WFOpenInCalendarAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_24F8BA0E8;
  v6[4] = self;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClasses:completionHandler:", v5, v6);

}

void __53__WFOpenInCalendarAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[4];
  uint64_t v26;

  v6 = a4;
  objc_msgSend(a2, "items");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v10 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("calshow:%lu"), (unint64_t)v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_7:
      objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);
      goto LABEL_8;
    }
    objc_msgSend(v8, "event");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDBCF48];
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v9, "eventIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("/"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("x-apple-calevent://%@"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLWithString:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v13)
    goto LABEL_7;
  v18 = (void *)MEMORY[0x24BEC4238];
  objc_msgSend(*(id *)(a1 + 32), "userInterface");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appDescriptor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bundleIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __53__WFOpenInCalendarAction_runAsynchronouslyWithInput___block_invoke_2;
  v25[3] = &unk_24F8BA540;
  v26 = *(_QWORD *)(a1 + 32);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __53__WFOpenInCalendarAction_runAsynchronouslyWithInput___block_invoke_3;
  v24[3] = &unk_24F8BB370;
  v24[4] = v26;
  objc_msgSend(v18, "requestWithURL:scheme:userInterface:bundleIdentifier:successHandler:failureHandler:", v13, 0, v19, v21, v25, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEC39F8], "sharedManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "performRequest:", v22);

LABEL_8:
}

uint64_t __53__WFOpenInCalendarAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

void __53__WFOpenInCalendarAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BDD1308];
  v7 = *MEMORY[0x24BDD0FC8];
  WFLocalizedString(CFSTR("Calendar could not be opened."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -1002, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);
}

@end
