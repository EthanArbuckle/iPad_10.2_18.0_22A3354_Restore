@implementation NAFuture

void __68__NAFuture_FirewallRuleManager__blockAndWaitForCompletionWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __35__NAFuture_HMDUtilities__hmfFuture__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "fulfillWithValue:", a2);
}

uint64_t __35__NAFuture_HMDUtilities__hmfFuture__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "rejectWithError:", a2);
}

id __64__NAFuture_HMDUtilities__combineAllFuturesIgnoringEmptyResults___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE6B608];
  objc_msgSend(a2, "na_map:", &__block_literal_global_716);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __64__NAFuture_HMDUtilities__combineAllFuturesIgnoringEmptyResults___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;
  id v4;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v2 && (isKindOfClass & 1) != 0)
    v4 = 0;
  else
    v4 = v2;

  return v4;
}

id __66__NAFuture_HMDUtilities__combineAllFuturesFlatteningArrayResults___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE6B608];
  objc_msgSend(a2, "na_flatMap:", &__block_literal_global_713);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __66__NAFuture_HMDUtilities__combineAllFuturesFlatteningArrayResults___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;
  id v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v2 && (isKindOfClass & 1) != 0)
  {
    v4 = v2;
  }
  else
  {
    v7[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

uint64_t __67__NAFuture_HMDUtilities__futureWithRetryIntervals_workQueue_block___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

void __67__NAFuture_HMDUtilities__futureWithRetryIntervals_workQueue_block___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  dispatch_time_t v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  uint64_t v16;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hmf_isEmpty"))
  {
    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
    v6 = v5;

    objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 1, objc_msgSend(*(id *)(a1 + 32), "count") - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    v9 = *(void **)(a1 + 48);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__NAFuture_HMDUtilities__futureWithRetryIntervals_workQueue_block___block_invoke_3;
    block[3] = &unk_24E793520;
    v16 = *(_QWORD *)(a1 + 64);
    v12 = v7;
    v13 = v9;
    v15 = *(id *)(a1 + 56);
    v14 = *(id *)(a1 + 40);
    v10 = v7;
    dispatch_after(v8, v13, block);

  }
}

void __67__NAFuture_HMDUtilities__futureWithRetryIntervals_workQueue_block___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 64), "futureWithRetryIntervals:workQueue:block:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __67__NAFuture_HMDUtilities__futureWithRetryIntervals_workQueue_block___block_invoke_4;
  v4[3] = &unk_24E79B300;
  v5 = *(id *)(a1 + 48);
  v3 = (id)objc_msgSend(v2, "addCompletionBlock:", v4);

}

uint64_t __67__NAFuture_HMDUtilities__futureWithRetryIntervals_workQueue_block___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

uint64_t __73__NAFuture_HMDUtilities__futureWithRetries_timeInterval_workQueue_block___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", a2);
}

void __73__NAFuture_HMDUtilities__futureWithRetries_timeInterval_workQueue_block___block_invoke_2(uint64_t a1, uint64_t a2)
{
  dispatch_time_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (*(uint64_t *)(a1 + 56) <= 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
  }
  else
  {
    v3 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 64) * 1000000000.0));
    v4 = *(void **)(a1 + 40);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __73__NAFuture_HMDUtilities__futureWithRetries_timeInterval_workQueue_block___block_invoke_3;
    v6[3] = &unk_24E77FE60;
    v5 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 72);
    v11 = v5;
    v12 = *(_QWORD *)(a1 + 64);
    v7 = v4;
    v9 = *(id *)(a1 + 48);
    v8 = *(id *)(a1 + 32);
    dispatch_after(v3, v7, v6);

  }
}

void __73__NAFuture_HMDUtilities__futureWithRetries_timeInterval_workQueue_block___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 56), "futureWithRetries:timeInterval:workQueue:block:", *(_QWORD *)(a1 + 64) - 1, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(double *)(a1 + 72));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __73__NAFuture_HMDUtilities__futureWithRetries_timeInterval_workQueue_block___block_invoke_4;
  v4[3] = &unk_24E79B300;
  v5 = *(id *)(a1 + 40);
  v3 = (id)objc_msgSend(v2, "addCompletionBlock:", v4);

}

uint64_t __73__NAFuture_HMDUtilities__futureWithRetries_timeInterval_workQueue_block___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

@end
