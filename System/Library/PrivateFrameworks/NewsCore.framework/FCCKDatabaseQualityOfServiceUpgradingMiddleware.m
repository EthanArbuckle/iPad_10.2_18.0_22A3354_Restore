@implementation FCCKDatabaseQualityOfServiceUpgradingMiddleware

- (int64_t)database:(id)a3 willEnqueueOperation:(id)a4 error:(id *)a5
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a4;
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_opt_new();
  v10 = v9;

  if (objc_msgSend(v10, "qualityOfService") == -1)
    objc_msgSend(v10, "setQualityOfService:", 17);
  objc_msgSend(v10, "setAutomaticallyRetryNetworkFailures:", 0);
  objc_msgSend(v10, "setDiscretionaryNetworkBehavior:", 0);
  objc_msgSend(v5, "setConfiguration:", v10);

  return 0;
}

@end
