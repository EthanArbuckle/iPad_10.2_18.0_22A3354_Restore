@implementation AMSMetricsDatabaseBlockWithKeepAlive

void __AMSMetricsDatabaseBlockWithKeepAlive_block_invoke(uint64_t a1)
{
  double Current;
  double v3;
  void *v4;
  NSObject *v5;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  +[AMSKeepAlive rbs_keepAliveWithName:style:qosOverrideIfRBManaged:relativePriority:block:](AMSKeepAlive, "rbs_keepAliveWithName:style:qosOverrideIfRBManaged:relativePriority:block:", *(_QWORD *)(a1 + 32), 0, 21, 0, *(_QWORD *)(a1 + 40));
  v3 = CFAbsoluteTimeGetCurrent() - Current;
  if (v3 > 10.0)
  {
    +[AMSLogConfig sharedMetricsConfig](AMSLogConfig, "sharedMetricsConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "OSLogObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 134217984;
      v7 = v3;
      _os_log_impl(&dword_18C849000, v5, OS_LOG_TYPE_DEFAULT, "AMSMetricsDatabase: Database operation took %f seconds", (uint8_t *)&v6, 0xCu);
    }

  }
}

@end
