@implementation CDPCAReporter

- (CDPCAReporter)initWithEvent:(id)a3
{
  id v5;
  CDPCAReporter *v6;
  CDPCAReporter *v8;
  CDPCAReporter *v9;
  uint64_t v10;
  NSMutableDictionary *reportData;
  objc_super v12;

  v5 = a3;
  if (getenv("__OSINSTALL_ENVIRONMENT") || getenv("__AKSYNCBUBBLE"))
  {
    v6 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CDPCAReporter;
    v8 = -[CDPCAReporter init](&v12, sel_init);
    v9 = v8;
    if (v8)
    {
      objc_storeStrong((id *)&v8->_eventName, a3);
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v10 = objc_claimAutoreleasedReturnValue();
      reportData = v9->_reportData;
      v9->_reportData = (NSMutableDictionary *)v10;

      mach_timebase_info(&v9->_clock_timebase);
      v9->_initTime = mach_absolute_time();
    }
    self = v9;
    v6 = self;
  }

  return v6;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_reportData, "objectForKeyedSubscript:", a3);
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_reportData, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)sendReport
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  double v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v5 = 138412802;
  v6 = v3;
  v7 = 2048;
  v8 = a3;
  v9 = 2112;
  v10 = v4;
  _os_log_debug_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_DEBUG, "\"Sending report %@ (time: %f), data - %@\", (uint8_t *)&v5, 0x20u);
}

- (void)_sendEvent
{
  if (MEMORY[0x24BE1A1B8])
    AnalyticsSendEvent();
}

- (void)populateUnderlyingErrorsStartingWithRootError:(id)a3 maxDepth:(unsigned int)a4
{
  -[CDPCAReporter populateUnderlyingErrorsStartingWithRootError:maxDepth:topLevelErrorCodeKey:topLevelErrorDomainKey:errorCodePrefix:errorDomainPrefix:domainAllowlist:](self, "populateUnderlyingErrorsStartingWithRootError:maxDepth:topLevelErrorCodeKey:topLevelErrorDomainKey:errorCodePrefix:errorDomainPrefix:domainAllowlist:", a3, *(_QWORD *)&a4, CFSTR("errorCode"), CFSTR("errorDomain"), CFSTR("underlyingErrorCode"), CFSTR("underlyingErrorDomain"), 0);
}

- (void)populateUnderlyingErrorsStartingWithRootError:(id)a3 maxDepth:(unsigned int)a4 domainAllowlist:(id)a5
{
  -[CDPCAReporter populateUnderlyingErrorsStartingWithRootError:maxDepth:topLevelErrorCodeKey:topLevelErrorDomainKey:errorCodePrefix:errorDomainPrefix:domainAllowlist:](self, "populateUnderlyingErrorsStartingWithRootError:maxDepth:topLevelErrorCodeKey:topLevelErrorDomainKey:errorCodePrefix:errorDomainPrefix:domainAllowlist:", a3, *(_QWORD *)&a4, CFSTR("errorCode"), CFSTR("errorDomain"), CFSTR("underlyingErrorCode"), CFSTR("underlyingErrorDomain"), a5);
}

- (void)populateUnderlyingErrorsStartingWithRootError:(id)a3 maxDepth:(unsigned int)a4 topLevelErrorCodeKey:(id)a5 topLevelErrorDomainKey:(id)a6 errorCodePrefix:(id)a7 errorDomainPrefix:(id)a8 domainAllowlist:(id)a9
{
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  CDPCAReporter *v31;
  const __CFString *v32;
  void *v33;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;

  v37 = a3;
  v15 = a5;
  v16 = a6;
  v40 = a7;
  v39 = a8;
  v17 = a9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v37, "code"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v18, v15);

  objc_msgSend(v37, "domain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v19, v16);

  objc_msgSend(v37, "userInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = *MEMORY[0x24BDD1398];
  objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    v23 = a4 == 0;
  else
    v23 = 1;
  v35 = v16;
  v36 = v15;
  if (!v23)
  {
    v38 = v21;
    v25 = 2;
    while (1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%u"), v40, v25 - 1, v35, v36);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%u"), v39, v25 - 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v22, "code"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDPCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v28, v26);

      objc_msgSend(v22, "domain");
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        if ((objc_msgSend(v17, "containsObject:", v29) & 1) != 0)
        {
          objc_msgSend(v22, "domain");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[CDPCAReporter setObject:forKeyedSubscript:](self, "setObject:forKeyedSubscript:", v30, v27);

          goto LABEL_13;
        }
        v31 = self;
        v32 = CFSTR("errorDomainNotInAllowlist");
      }
      else
      {
        v31 = self;
        v32 = v29;
      }
      -[CDPCAReporter setObject:forKeyedSubscript:](v31, "setObject:forKeyedSubscript:", v32, v27);
LABEL_13:

      objc_msgSend(v22, "userInfo");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "objectForKeyedSubscript:", v38);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v22 = v24;
        if (v25++ <= a4)
          continue;
      }
      goto LABEL_16;
    }
  }
  v24 = v22;
LABEL_16:

}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p> EventName: [%@], ReportData: %@"), objc_opt_class(), self, self->_eventName, self->_reportData);
}

- (double)machAbsoluteTimeToTimeInterval:(unint64_t)a3
{
  return (double)(self->_clock_timebase.numer * a3 / self->_clock_timebase.denom) / 1000000000.0;
}

- (id)__eventNameForTesting
{
  return self->_eventName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportData, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

@end
