@implementation WFGetParkedCarLocationAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v5 = (void *)getRTRoutineManagerClass_softClass;
  v14 = getRTRoutineManagerClass_softClass;
  v6 = MEMORY[0x24BDAC760];
  if (!getRTRoutineManagerClass_softClass)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __getRTRoutineManagerClass_block_invoke;
    v10[3] = &unk_24F8BB430;
    v10[4] = &v11;
    __getRTRoutineManagerClass_block_invoke((uint64_t)v10);
    v5 = (void *)v12[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v11, 8);
  objc_msgSend(v7, "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __59__WFGetParkedCarLocationAction_runAsynchronouslyWithInput___block_invoke;
  v9[3] = &unk_24F8BB6B0;
  v9[4] = self;
  objc_msgSend(v8, "fetchLastVehicleEventsWithHandler:", v9);

}

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

void __59__WFGetParkedCarLocationAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BE19450];
    v8 = (void *)MEMORY[0x24BE19390];
    objc_msgSend(*(id *)(a1 + 32), "appDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "locationWithAppDescriptor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "itemWithObject:origin:disclosureLevel:", v6, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "output");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addItem:", v11);

    }
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);

  }
  else
  {
    getWFActionsLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315394;
      v15 = "-[WFGetParkedCarLocationAction runAsynchronouslyWithInput:]_block_invoke";
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_22D353000, v13, OS_LOG_TYPE_ERROR, "%s No RTVehicleEvent found, error = %@", (uint8_t *)&v14, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v5);
  }

}

@end
