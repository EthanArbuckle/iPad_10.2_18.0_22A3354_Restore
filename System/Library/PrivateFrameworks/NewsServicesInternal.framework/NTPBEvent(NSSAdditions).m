@implementation NTPBEvent(NSSAdditions)

+ (id)nss_eventWithIdentifier
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setAppAnalyticsEventIdentifier:", v2);

  return v0;
}

- (uint64_t)nss_setStartDate:()NSSAdditions
{
  return objc_msgSend(a1, "setStartTimestamp:", NTPBEventDateToTimestamp(a3));
}

- (void)nss_setStartDate:()NSSAdditions endDate:
{
  id v6;

  v6 = a4;
  objc_msgSend(a1, "nss_setStartDate:", a3);
  objc_msgSend(a1, "nss_setEndDate:", v6);

}

- (void)nss_setEndDate:()NSSAdditions
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(a1, "hasStartTimestamp") & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[NTPBEvent(NSSAdditions) nss_setEndDate:].cold.1();
  objc_msgSend(a1, "setDuration:", NTPBEventDateToTimestamp(v4) - objc_msgSend(a1, "startTimestamp"));

}

- (void)nss_setEndDate:()NSSAdditions .cold.1()
{
  void *v0;
  int v1;
  const char *v2;
  __int16 v3;
  char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unable to calculate the duration of an event without setting the startTimestamp"));
  v1 = 136315906;
  v2 = "-[NTPBEvent(NSSAdditions) nss_setEndDate:]";
  v3 = 2080;
  v4 = "NTPBNewsAnalytics+NSSAdditions.m";
  v5 = 1024;
  v6 = 37;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_1D7116000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);

}

@end
