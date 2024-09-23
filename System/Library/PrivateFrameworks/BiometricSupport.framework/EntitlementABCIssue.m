@implementation EntitlementABCIssue

- (EntitlementABCIssue)initWithClient:(id)a3 forReporter:(id)a4
{
  id v6;
  id v7;
  EntitlementABCIssue *v8;
  EntitlementABCIssue *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)EntitlementABCIssue;
  v8 = -[EntitlementABCIssue init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[EntitlementABCIssue setClientName:](v8, "setClientName:", v6);
    -[EntitlementABCIssue setReporter:](v9, "setReporter:", v7);
  }

  return v9;
}

- (id)tag
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("You must override %@ in a subclass"), v4);

  return 0;
}

- (unint64_t)abcReason
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("You must override %@ in a subclass"), v4);

  return 0;
}

- (id)context
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("You must override %@ in a subclass"), v4);

  return 0;
}

- (BOOL)isFinalResult:(int)a3
{
  return *MEMORY[0x24BEB34D8] == a3
      || *MEMORY[0x24BEB34B0] == a3
      || *MEMORY[0x24BEB34E0] == a3
      || *MEMORY[0x24BEB34F8] == a3;
}

- (BOOL)shouldBeReportedNow
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  -[EntitlementABCIssue nextAction](self, "nextAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[EntitlementABCIssue nextAction](self, "nextAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5 < 0.0;

  return v6;
}

- (void)handleABCResult:(int)a3
{
  uint64_t v3;
  void *v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v3 = *(_QWORD *)&a3;
  v31 = *MEMORY[0x24BDAC8D0];
  -[EntitlementABCIssue reporter](self, "reporter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v5);
  v6 = -[EntitlementABCIssue isFinalResult:](self, "isFinalResult:", v3);
  v7 = (void *)MEMORY[0x24BDACB70];
  if (!v6)
  {
    v13 = (void *)__osLog;
    if (!__osLog)
      v13 = (void *)MEMORY[0x24BDACB70];
    v14 = v13;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[EntitlementABCIssue tag](self, "tag");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412546;
      v28 = v15;
      v29 = 1024;
      v30 = v3;
      _os_log_impl(&dword_2148C7000, v14, OS_LOG_TYPE_ERROR, "Entitlement issue %@ encountered temporary error %d while being reported.\n", (uint8_t *)&v27, 0x12u);

    }
    if (*MEMORY[0x24BEB34A8] == (_DWORD)v3)
    {
      v16 = (void *)__osLog;
      if (!__osLog)
        v16 = v7;
      v17 = v16;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        -[EntitlementABCIssue tag](self, "tag");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138412290;
        v28 = v18;
        _os_log_impl(&dword_2148C7000, v17, OS_LOG_TYPE_INFO, "Entitlement issue %@ rescheduled for next day\n", (uint8_t *)&v27, 0xCu);

      }
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 86400.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[EntitlementABCIssue setNextAction:](self, "setNextAction:", v19);

      -[EntitlementABCIssue reporter](self, "reporter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "rescheduleTimer");
    }
    else
    {
      if (*MEMORY[0x24BEB34C8] != (_DWORD)v3)
        goto LABEL_27;
      v23 = (void *)__osLog;
      if (!__osLog)
        v23 = v7;
      v24 = v23;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        -[EntitlementABCIssue tag](self, "tag");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138412290;
        v28 = v25;
        _os_log_impl(&dword_2148C7000, v24, OS_LOG_TYPE_INFO, "Entitlement issue %@ rescheduled for next hour\n", (uint8_t *)&v27, 0xCu);

      }
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 3600.0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[EntitlementABCIssue setNextAction:](self, "setNextAction:", v26);

      -[EntitlementABCIssue reporter](self, "reporter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "rescheduleTimer");
    }

    goto LABEL_27;
  }
  v8 = *MEMORY[0x24BEB34D8];
  v9 = (void *)__osLog;
  if (!__osLog)
    v9 = (void *)MEMORY[0x24BDACB70];
  v10 = v9;
  v11 = v10;
  if (v8 == (_DWORD)v3)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      -[EntitlementABCIssue tag](self, "tag");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412290;
      v28 = v12;
      _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_INFO, "Entitlement issue %@ successfully reported\n", (uint8_t *)&v27, 0xCu);

    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    -[EntitlementABCIssue tag](self, "tag");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138412546;
    v28 = v21;
    v29 = 1024;
    v30 = v3;
    _os_log_impl(&dword_2148C7000, v11, OS_LOG_TYPE_ERROR, "Entitlement issue %@ will not be reported due to error code %d\n", (uint8_t *)&v27, 0x12u);

  }
  -[EntitlementABCIssue setNextAction:](self, "setNextAction:", 0);
  -[EntitlementABCIssue reporter](self, "reporter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rescheduleTimer");

  -[EntitlementABCIssue setReporter:](self, "setReporter:", 0);
LABEL_27:
  objc_sync_exit(v5);

}

- (void)report
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (-[EntitlementABCIssue reportCounter](self, "reportCounter") < 0x1F4)
  {
    -[EntitlementABCIssue setReportCounter:](self, "setReportCounter:", -[EntitlementABCIssue reportCounter](self, "reportCounter") + 1);
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", (double)(arc4random_uniform(0x258u) + 600));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EntitlementABCIssue setNextAction:](self, "setNextAction:", v6);

    if (__osLog)
      v7 = __osLog;
    else
      v7 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      -[EntitlementABCIssue tag](self, "tag");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[EntitlementABCIssue nextAction](self, "nextAction");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v9;
      v19 = 2112;
      v20 = v10;
      _os_log_impl(&dword_2148C7000, v8, OS_LOG_TYPE_INFO, "Entitlement issue %@ will be reported, nextAction=%@\n", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    -[EntitlementABCIssue reporter](self, "reporter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "biometricABC");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[EntitlementABCIssue abcReason](self, "abcReason");
    -[EntitlementABCIssue context](self, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __29__EntitlementABCIssue_report__block_invoke;
    v15[3] = &unk_24D241550;
    objc_copyWeak(&v16, (id *)buf);
    objc_msgSend(v12, "sendAutoBugCaptureEvent:withContext:replyBlock:", v13, v14, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (__osLog)
      v3 = __osLog;
    else
      v3 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = v3;
      -[EntitlementABCIssue tag](self, "tag");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v5;
      _os_log_impl(&dword_2148C7000, v4, OS_LOG_TYPE_ERROR, "Giving up Entitlement issue %@ reporting due to maximum attempts limit\n", buf, 0xCu);

    }
    -[EntitlementABCIssue setNextAction:](self, "setNextAction:", 0);
    -[EntitlementABCIssue setReporter:](self, "setReporter:", 0);
  }
}

void __29__EntitlementABCIssue_report__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleABCResult:", a2);

}

- (void)reportIfNeeded
{
  if (-[EntitlementABCIssue shouldBeReportedNow](self, "shouldBeReportedNow"))
    -[EntitlementABCIssue report](self, "report");
}

- (NSDate)nextAction
{
  return self->_nextAction;
}

- (void)setNextAction:(id)a3
{
  objc_storeStrong((id *)&self->_nextAction, a3);
}

- (EntitlementABCIssueReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
  objc_storeStrong((id *)&self->_reporter, a3);
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
  objc_storeStrong((id *)&self->_clientName, a3);
}

- (unint64_t)reportCounter
{
  return self->_reportCounter;
}

- (void)setReportCounter:(unint64_t)a3
{
  self->_reportCounter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_storeStrong((id *)&self->_nextAction, 0);
}

@end
