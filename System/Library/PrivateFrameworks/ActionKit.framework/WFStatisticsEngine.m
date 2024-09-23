@implementation WFStatisticsEngine

- (WFStatisticsEngine)init
{
  WFStatisticsEngine *v2;
  dispatch_queue_t v3;
  WFStatisticsEngine *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFStatisticsEngine;
  v2 = -[WFStatisticsEngine init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("is.workflow.health.statistics", MEMORY[0x24BDAC9C0]);
    -[WFStatisticsEngine setStatisticsQueue:](v2, "setStatisticsQueue:", v3);

    v4 = v2;
  }

  return v2;
}

- (void)applyOperation:(int64_t)a3 onNumbers:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  v8 = a5;
  v9 = v8;
  switch(a3)
  {
    case 1:
      -[WFStatisticsEngine averageOfValues:completion:](self, "averageOfValues:completion:", v10, v8);
      break;
    case 2:
      -[WFStatisticsEngine minimumOfValues:completion:](self, "minimumOfValues:completion:", v10, v8);
      break;
    case 3:
      -[WFStatisticsEngine maximumOfValues:completion:](self, "maximumOfValues:completion:", v10, v8);
      break;
    case 4:
      -[WFStatisticsEngine sumOfValues:completion:](self, "sumOfValues:completion:", v10, v8);
      break;
    case 5:
      -[WFStatisticsEngine medianOfValues:completion:](self, "medianOfValues:completion:", v10, v8);
      break;
    case 6:
      -[WFStatisticsEngine modeOfValues:completion:](self, "modeOfValues:completion:", v10, v8);
      break;
    case 7:
      -[WFStatisticsEngine rangeOfValues:completion:](self, "rangeOfValues:completion:", v10, v8);
      break;
    case 8:
      -[WFStatisticsEngine standardDeviationOfValues:completion:](self, "standardDeviationOfValues:completion:", v10, v8);
      break;
    default:
      if (v8)
        (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
      break;
  }

}

- (void)applyOperation:(int64_t)a3 onStatisticsSampleProviders:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[6];

  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "conformsToProtocol:", &unk_255D9BC88);

  if ((v11 & 1) != 0)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __76__WFStatisticsEngine_applyOperation_onStatisticsSampleProviders_completion___block_invoke;
    v15[3] = &unk_24F8BA270;
    v15[4] = self;
    v15[5] = a3;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __76__WFStatisticsEngine_applyOperation_onStatisticsSampleProviders_completion___block_invoke_3;
    v12[3] = &unk_24F8BB108;
    v14 = v9;
    v13 = v8;
    objc_msgSend(v13, "if_enumerateAsynchronously:completionHandler:", v15, v12);

  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

- (void)asyncApplyNSExpressionFunction:(id)a3 data:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "count"))
  {
    -[WFStatisticsEngine statisticsQueue](self, "statisticsQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__WFStatisticsEngine_asyncApplyNSExpressionFunction_data_completion___block_invoke;
    block[3] = &unk_24F8BA298;
    v13 = v9;
    v14 = v8;
    v15 = v10;
    dispatch_async(v11, block);

  }
  else if (v10)
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, MEMORY[0x24BDBD1A8]);
  }

}

- (void)averageOfValues:(id)a3 completion:(id)a4
{
  -[WFStatisticsEngine asyncApplyNSExpressionFunction:data:completion:](self, "asyncApplyNSExpressionFunction:data:completion:", CFSTR("average:"), a3, a4);
}

- (void)minimumOfValues:(id)a3 completion:(id)a4
{
  -[WFStatisticsEngine asyncApplyNSExpressionFunction:data:completion:](self, "asyncApplyNSExpressionFunction:data:completion:", CFSTR("min:"), a3, a4);
}

- (void)maximumOfValues:(id)a3 completion:(id)a4
{
  -[WFStatisticsEngine asyncApplyNSExpressionFunction:data:completion:](self, "asyncApplyNSExpressionFunction:data:completion:", CFSTR("max:"), a3, a4);
}

- (void)sumOfValues:(id)a3 completion:(id)a4
{
  -[WFStatisticsEngine asyncApplyNSExpressionFunction:data:completion:](self, "asyncApplyNSExpressionFunction:data:completion:", CFSTR("sum:"), a3, a4);
}

- (void)medianOfValues:(id)a3 completion:(id)a4
{
  -[WFStatisticsEngine asyncApplyNSExpressionFunction:data:completion:](self, "asyncApplyNSExpressionFunction:data:completion:", CFSTR("median:"), a3, a4);
}

- (void)modeOfValues:(id)a3 completion:(id)a4
{
  -[WFStatisticsEngine asyncApplyNSExpressionFunction:data:completion:](self, "asyncApplyNSExpressionFunction:data:completion:", CFSTR("mode:"), a3, a4);
}

- (void)rangeOfValues:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__WFStatisticsEngine_rangeOfValues_completion___block_invoke;
  v10[3] = &unk_24F8BA2E8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[WFStatisticsEngine minimumOfValues:completion:](self, "minimumOfValues:completion:", v9, v10);

}

- (void)standardDeviationOfValues:(id)a3 completion:(id)a4
{
  -[WFStatisticsEngine asyncApplyNSExpressionFunction:data:completion:](self, "asyncApplyNSExpressionFunction:data:completion:", CFSTR("stddev:"), a3, a4);
}

- (OS_dispatch_queue)statisticsQueue
{
  return self->_statisticsQueue;
}

- (void)setStatisticsQueue:(id)a3
{
  objc_storeStrong((id *)&self->_statisticsQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statisticsQueue, 0);
}

void __47__WFStatisticsEngine_rangeOfValues_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__WFStatisticsEngine_rangeOfValues_completion___block_invoke_2;
  v7[3] = &unk_24F8BA2C0;
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  v6 = v3;
  objc_msgSend(v4, "maximumOfValues:completion:", v5, v7);

}

void __47__WFStatisticsEngine_rangeOfValues_completion___block_invoke_2(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a2, "doubleValue");
  v4 = v3;
  objc_msgSend(*(id *)(a1 + 32), "doubleValue");
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v4 - v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);

  }
}

void __69__WFStatisticsEngine_asyncApplyNSExpressionFunction_data_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1548], "expressionForConstantValue:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD1548];
  v4 = *(_QWORD *)(a1 + 40);
  v13[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "expressionForFunction:arguments:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "expressionValueWithObject:context:", 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__WFStatisticsEngine_asyncApplyNSExpressionFunction_data_completion___block_invoke_2;
  v10[3] = &unk_24F8BB5E0;
  v8 = *(id *)(a1 + 48);
  v11 = v7;
  v12 = v8;
  v9 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

uint64_t __69__WFStatisticsEngine_asyncApplyNSExpressionFunction_data_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

void __76__WFStatisticsEngine_applyOperation_onStatisticsSampleProviders_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;

  v6 = a2;
  v7 = a4;
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "dataSamples");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __76__WFStatisticsEngine_applyOperation_onStatisticsSampleProviders_completion___block_invoke_2;
  v14[3] = &unk_24F8BA248;
  v11 = *(_QWORD *)(a1 + 40);
  v16 = v7;
  v17 = v11;
  v15 = v6;
  v12 = v7;
  v13 = v6;
  objc_msgSend(v8, "applyOperation:onNumbers:completion:", v9, v10, v14);

}

uint64_t __76__WFStatisticsEngine_applyOperation_onStatisticsSampleProviders_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __76__WFStatisticsEngine_applyOperation_onStatisticsSampleProviders_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "updateValue:fromStatisticsOperation:", a2, *(_QWORD *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
