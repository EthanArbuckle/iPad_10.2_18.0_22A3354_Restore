@implementation CalABCReporter

- (CalABCReporter)initWithType:(id)a3 subtype:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  CalABCReporter *v11;
  CalABCReporter *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CalABCReporter;
  v11 = -[CalABCReporter init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[CalABCReporter setType:](v11, "setType:", v8);
    -[CalABCReporter setSubtype:](v12, "setSubtype:", v9);
    -[CalABCReporter setSubtypeContext:](v12, "setSubtypeContext:", v10);
  }

  return v12;
}

- (NSString)domain
{
  return (NSString *)CFSTR("Calendar");
}

- (void)report
{
  -[CalABCReporter report:](self, "report:", 0);
}

- (void)reportSynchronous
{
  -[CalABCReporter report:](self, "report:", 1);
}

- (void)report:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  dispatch_semaphore_t v14;
  NSArray *events;
  NSObject *v16;
  dispatch_time_t v17;
  _QWORD v18[4];
  NSObject *v19;
  BOOL v20;

  v3 = a3;
  if (-[CalABCReporter rateLimitingAllowsABCReport](self, "rateLimitingAllowsABCReport"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DAFF28]);
    -[CalABCReporter domain](self, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalABCReporter type](self, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalABCReporter subtype](self, "subtype");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CalABCReporter subtypeContext](self, "subtypeContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "processName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:](v5, "signatureWithDomain:type:subType:subtypeContext:detectedProcess:triggerThresholdValues:", v6, v7, v8, v9, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[CalABCReporter report:].cold.1(self, v13);

    v14 = 0;
    if (v3)
      v14 = dispatch_semaphore_create(0);
    events = self->_events;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __25__CalABCReporter_report___block_invoke;
    v18[3] = &unk_1E2A84090;
    v20 = v3;
    v16 = v14;
    v19 = v16;
    -[NSObject snapshotWithSignature:delay:events:payload:actions:reply:](v5, "snapshotWithSignature:delay:events:payload:actions:reply:", v12, events, 0, 0, v18, 0.0);
    if (v3)
    {
      v17 = dispatch_time(0, 900000000000);
      dispatch_semaphore_wait(v16, v17);
    }

  }
  else
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CalABCReporter report:].cold.2(self, v5);
  }

}

void __25__CalABCReporter_report___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __25__CalABCReporter_report___block_invoke_cold_1((uint64_t)v3, v4);

  if (*(_BYTE *)(a1 + 40))
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)rateLimitingAllowsABCReport
{
  double v3;
  double v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v4 = v3;
  os_unfair_lock_lock((os_unfair_lock_t)&rateLimitingAllowsABCReport_lock);
  if (*(double *)&rateLimitingAllowsABCReport_lastABCReportTime == 0.0
    || self->_ignoreRateLimiting
    || v4 - *(double *)&rateLimitingAllowsABCReport_lastABCReportTime > 86400.0)
  {
    rateLimitingAllowsABCReport_lastABCReportTime = *(_QWORD *)&v4;
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&rateLimitingAllowsABCReport_lock);
  return v5;
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_storeStrong((id *)&self->_events, a3);
}

- (BOOL)ignoreRateLimiting
{
  return self->_ignoreRateLimiting;
}

- (void)setIgnoreRateLimiting:(BOOL)a3
{
  self->_ignoreRateLimiting = a3;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSString)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(id)a3
{
  objc_storeStrong((id *)&self->_subtype, a3);
}

- (NSString)subtypeContext
{
  return self->_subtypeContext;
}

- (void)setSubtypeContext:(id)a3
{
  objc_storeStrong((id *)&self->_subtypeContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtypeContext, 0);
  objc_storeStrong((id *)&self->_subtype, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_events, 0);
}

- (void)report:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint8_t v10[14];
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "subtype");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "subtypeContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  v11 = v5;
  v12 = v8;
  v13 = v6;
  v14 = v8;
  v15 = v9;
  _os_log_debug_impl(&dword_18FC12000, a2, OS_LOG_TYPE_DEBUG, "Submitting snapshot request to ABC for signature: %@.%@.%@.%@", v10, 0x2Au);

  OUTLINED_FUNCTION_0_0();
}

- (void)report:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint8_t v11[14];
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "subtype");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "subtypeContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "events");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  v12 = v5;
  v13 = v9;
  v14 = v6;
  v15 = v9;
  v16 = v7;
  v17 = v9;
  v18 = v10;
  _os_log_error_impl(&dword_18FC12000, a2, OS_LOG_TYPE_ERROR, "Not reporting to ABC because we are rate limited: %@.%@.%@.%@ - %@", v11, 0x34u);

  OUTLINED_FUNCTION_0_0();
}

void __25__CalABCReporter_report___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_18FC12000, a2, OS_LOG_TYPE_DEBUG, "Submitted diagnostic reporter snapshot request with reply: %@", (uint8_t *)&v2, 0xCu);
}

@end
