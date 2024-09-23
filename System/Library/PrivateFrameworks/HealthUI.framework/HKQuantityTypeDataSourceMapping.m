@implementation HKQuantityTypeDataSourceMapping

void __40___HKQuantityTypeDataSourceMapping_map___block_invoke(uint64_t a1, void *a2)
{
  HKHealthChartPoint *v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 32), CFSTR("HKQuantityTypeDataSource.m"), 361, CFSTR("result must be of type HKQuantityTypeDataSourceValue"));

  }
  v3 = -[HKHealthChartPoint initWithDataSourceValue:options:unit:displayType:]([HKHealthChartPoint alloc], "initWithDataSourceValue:options:unit:displayType:", v8, objc_msgSend(*(id *)(a1 + 40), "statisticsOptions"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "userInfoCreationBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "userInfoCreationBlock");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHealthChartPoint setUserInfo:](v3, "setUserInfo:", v6);

  }
  objc_msgSend(*(id *)(a1 + 64), "addObject:", v3);

}

@end
