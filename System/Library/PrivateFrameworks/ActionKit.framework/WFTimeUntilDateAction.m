@implementation WFTimeUntilDateAction

- (void)wasAddedToWorkflowByUser:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFTimeUntilDateAction;
  -[WFTimeUntilDateAction wasAddedToWorkflowByUser:](&v7, sel_wasAddedToWorkflowByUser_, a3);
  -[WFTimeUntilDateAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFTimeUntilFromDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC3C00]), "initWithAggrandizements:", 0);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC3C40]), "initWithVariable:", v5);
    -[WFTimeUntilDateAction setParameterState:forKey:](self, "setParameterState:forKey:", v6, CFSTR("WFTimeUntilFromDate"));

  }
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[5];
  _QWORD v7[5];

  v4 = a3;
  v5 = objc_opt_class();
  v6[4] = self;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__WFTimeUntilDateAction_runAsynchronouslyWithInput___block_invoke;
  v7[3] = &unk_24F8B9060;
  v7[4] = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__WFTimeUntilDateAction_runAsynchronouslyWithInput___block_invoke_3;
  v6[3] = &unk_24F8BAFA8;
  objc_msgSend(v4, "transformFirstObjectRepresentationForClass:usingBlock:completionHandler:", v5, v7, v6);

}

void __52__WFTimeUntilDateAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id v9;
  void (**v10)(void *, void *);
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a5;
  if (v7)
  {
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __52__WFTimeUntilDateAction_runAsynchronouslyWithInput___block_invoke_2;
    v25 = &unk_24F8B9038;
    v26 = *(_QWORD *)(a1 + 32);
    v27 = v7;
    v9 = v8;
    v28 = v9;
    v10 = (void (**)(void *, void *))_Block_copy(&v22);
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFTimeUntilFromDate"), objc_opt_class(), v22, v23, v24, v25, v26);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v10[2](v10, v11);
    }
    else
    {
      v17 = (void *)MEMORY[0x24BDD1540];
      v18 = *MEMORY[0x24BEC4270];
      v29 = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("The first date provided was invalid."));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 5, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v21);

    }
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BEC4270];
    v31 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("The second date provided was invalid."));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 5, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v8 + 2))(v8, 0, v16);

  }
}

void __52__WFTimeUntilDateAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

void __52__WFTimeUntilDateAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFTimeUntilUnit"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Total Time")))
  {
    objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceDate:", v3);
    if (fabs(v5) >= 60.0)
      v6 = 124;
    else
      v6 = 128;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19630]), "initWithTimeInterval:allowedUnits:unitsStyle:zeroFormattingBehavior:", v6, 3, 1, v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Seconds")) & 1) != 0)
    {
      v8 = 128;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Minutes")) & 1) != 0)
    {
      v8 = 64;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Hours")) & 1) != 0)
    {
      v8 = 32;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Days")) & 1) != 0)
    {
      v8 = 16;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Weeks")) & 1) != 0)
    {
      v8 = 0x2000;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Months")) & 1) != 0)
    {
      v8 = 8;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Years")))
    {
      v8 = 4;
    }
    else
    {
      v8 = 64;
    }
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "components:fromDate:toDate:options:", v8, v3, *(_QWORD *)(a1 + 40), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v11, "valueForComponent:", v8));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(_QWORD *)(a1 + 48);
    v14[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v12 + 16))(v12, v13, 0);

  }
}

@end
