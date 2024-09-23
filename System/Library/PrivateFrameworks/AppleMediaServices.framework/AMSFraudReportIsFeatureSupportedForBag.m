@implementation AMSFraudReportIsFeatureSupportedForBag

id __AMSFraudReportIsFeatureSupportedForBag_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if ((objc_msgSend(v3, "BOOLValue") & 1) != 0 || !MGGetBoolAnswer())
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "BOOLForKey:", 0x1E254CFC0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valuePromise");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "catchWithBlock:", &__block_literal_global_61);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

AMSPromise *__AMSFraudReportIsFeatureSupportedForBag_block_invoke_2()
{
  return +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAA0]);
}

id __AMSFraudReportIsFeatureSupportedForBag_block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(a2, "BOOLValue") ^ 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[AMSPromise promiseWithResult:](AMSPromise, "promiseWithResult:", MEMORY[0x1E0C9AAA0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

@end
