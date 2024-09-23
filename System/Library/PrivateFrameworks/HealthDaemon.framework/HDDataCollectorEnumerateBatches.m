@implementation HDDataCollectorEnumerateBatches

id __HDDataCollectorEnumerateBatches_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  if (v10 >= *(double *)(a1 + 32))
    v10 = *(double *)(a1 + 32);
  objc_msgSend(v6, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "dateByAddingTimeInterval:", -v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
