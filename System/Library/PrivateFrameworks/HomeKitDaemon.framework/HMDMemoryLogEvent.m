@implementation HMDMemoryLogEvent

- (HMDMemoryLogEvent)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDMemoryLogEvent)initWithReason:(int64_t)a3 currentMemoryUsage:(unint64_t)a4 intervalMaxMemoryUsage:(unint64_t)a5
{
  HMDMemoryLogEvent *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDMemoryLogEvent;
  result = -[HMMLogEvent init](&v9, sel_init);
  if (result)
  {
    result->_reason = a3;
    result->_currentMemoryUsage = a4;
    result->_intervalMaxMemoryUsage = a5;
  }
  return result;
}

- (int64_t)reason
{
  return self->_reason;
}

- (unint64_t)currentMemoryUsage
{
  return self->_currentMemoryUsage;
}

- (unint64_t)intervalMaxMemoryUsage
{
  return self->_intervalMaxMemoryUsage;
}

- (void)updateDiagnosticReportSignature:(id)a3
{
  id v4;
  void *v5;
  task_read_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  mach_port_t corpse_task_port;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "setDouble:forKey:", CFSTR("HMDDiagnosticReporterMemoryEventReportTime"));

  v6 = *MEMORY[0x24BDAEC58];
  corpse_task_port = 0;
  if (task_generate_corpse(v6, &corpse_task_port))
  {
    v7 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Failed to generate a corpse task for memory exception reporting", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE3F258], "processInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "executableURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "UTF8String");
    dispatch_get_global_queue(-32768, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ReportMemoryExceptionFromTask();

  }
  if (-[HMDMemoryLogEvent currentMemoryUsage](self, "currentMemoryUsage") <= 0x5000000)
    v14 = CFSTR("Memory Usage Warning Threshold");
  else
    v14 = CFSTR("Memory Usage Critical Threshold");
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BEB3588]);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld,%lld"), -[HMDMemoryLogEvent currentMemoryUsage](self, "currentMemoryUsage"), -[HMDMemoryLogEvent intervalMaxMemoryUsage](self, "intervalMaxMemoryUsage"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BEB3590]);

}

void __73__HMDMemoryLogEvent_DiagnosticReporter__updateDiagnosticReportSignature___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v6;
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Memory exception reporting completed with error: %@", (uint8_t *)&v7, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  mach_port_deallocate(*(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 36));

}

@end
