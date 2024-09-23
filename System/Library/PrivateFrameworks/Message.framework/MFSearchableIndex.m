@implementation MFSearchableIndex

void __28__MFSearchableIndex_iOS_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_28;
  log_log_28 = (uint64_t)v1;

}

void __49__MFSearchableIndex_iOS_dataSourceRefreshReasons__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("MonitoredActivityReasonCompacting");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v0);
  v2 = (void *)dataSourceRefreshReasons_reasons;
  dataSourceRefreshReasons_reasons = v1;

}

void __37__MFSearchableIndex_iOS_purgeReasons__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("MonitoredActivityReasonCompacting");
  v3[1] = CFSTR("MonitoredActivityReasonMoving");
  v3[2] = CFSTR("MonitoredActivityReasonArchiving");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v0);
  v2 = (void *)purgeReasons_reasons;
  purgeReasons_reasons = v1;

}

void __41__MFSearchableIndex_iOS_exclusionReasons__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("MonitoredActivityReasonDeleting");
  v3[1] = CFSTR("MonitoredActivityReasonJunking");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v0);
  v2 = (void *)exclusionReasons_reasons;
  exclusionReasons_reasons = v1;

}

@end
