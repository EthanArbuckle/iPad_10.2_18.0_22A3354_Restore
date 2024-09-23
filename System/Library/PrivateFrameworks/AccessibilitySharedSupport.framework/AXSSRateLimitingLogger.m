@implementation AXSSRateLimitingLogger

- (AXSSRateLimitingLogger)initWithLogLevel:(unsigned __int8)a3 categoryLog:(id)a4 timeInterval:(double)a5
{
  id v9;
  AXSSRateLimitingLogger *v10;
  AXSSRateLimitingLogger *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AXSSRateLimitingLogger;
  v10 = -[AXSSRateLimitingLogger init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_timeInterval = a5;
    v10->_logLevel = a3;
    objc_storeStrong((id *)&v10->_categoryLog, a4);
  }

  return v11;
}

- (BOOL)logString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  _BOOL4 v13;
  void *v14;

  v4 = a3;
  -[AXSSRateLimitingLogger _dateSinceLastLog](self, "_dateSinceLastLog");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXSSRateLimitingLogger _dateSinceLastLog](self, "_dateSinceLastLog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSRateLimitingLogger _dateSinceLastLog](self, "_dateSinceLastLog");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", v8);
    v10 = v9;
    -[AXSSRateLimitingLogger timeInterval](self, "timeInterval");
    v12 = v10 > v11;

  }
  else
  {
    v12 = 0;
  }

  if (v5)
    v13 = v12;
  else
    v13 = 1;
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSSRateLimitingLogger set_dateSinceLastLog:](self, "set_dateSinceLastLog:", v14);

    -[AXSSRateLimitingLogger _logStringAtProperLevel:](self, "_logStringAtProperLevel:", v4);
  }

  return v13;
}

- (void)_logStringAtProperLevel:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AXSSRateLimitingLogger categoryLog](self, "categoryLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = -[AXSSRateLimitingLogger logLevel](self, "logLevel");
  if (os_log_type_enabled(v5, v6))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1AF5CC000, v5, v6, "%@", (uint8_t *)&v7, 0xCu);
  }

}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (unsigned)logLevel
{
  return self->_logLevel;
}

- (OS_os_log)categoryLog
{
  return self->_categoryLog;
}

- (void)setCategoryLog:(id)a3
{
  objc_storeStrong((id *)&self->_categoryLog, a3);
}

- (NSDate)_dateSinceLastLog
{
  return self->__dateSinceLastLog;
}

- (void)set_dateSinceLastLog:(id)a3
{
  objc_storeStrong((id *)&self->__dateSinceLastLog, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__dateSinceLastLog, 0);
  objc_storeStrong((id *)&self->_categoryLog, 0);
}

@end
