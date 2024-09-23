@implementation SUUIMetricsRequestInfo

- (SUUIMetricsRequestInfo)initWithReportRequestTimesMessagePayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  SUUIMetricsRequestInfo *v9;
  SUUIMetricsRequestInfo *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestStartTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseStartTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseEndTime"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = 0;
  if (v5 && v6 && v7)
  {
    v10 = -[SUUIMetricsRequestInfo init](self, "init");
    if (v10)
    {
      +[SUUIMetricsUtilities timeIntervalFromJSTime:](SUUIMetricsUtilities, "timeIntervalFromJSTime:", v5);
      -[SUUIMetricsRequestInfo setRequestStartTime:](v10, "setRequestStartTime:");
      +[SUUIMetricsUtilities timeIntervalFromJSTime:](SUUIMetricsUtilities, "timeIntervalFromJSTime:", v6);
      -[SUUIMetricsRequestInfo setResponseStartTime:](v10, "setResponseStartTime:");
      +[SUUIMetricsUtilities timeIntervalFromJSTime:](SUUIMetricsUtilities, "timeIntervalFromJSTime:", v8);
      -[SUUIMetricsRequestInfo setResponseEndTime:](v10, "setResponseEndTime:");
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseWasCached"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("responseWasCached"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUUIMetricsRequestInfo setResponseWasCached:](v10, "setResponseWasCached:", objc_msgSend(v12, "BOOLValue"));

      }
    }
    self = v10;
    v9 = self;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[SUUIMetricsRequestInfo requestStartTime](self, "requestStartTime");
  objc_msgSend(v4, "setRequestStartTime:");
  -[SUUIMetricsRequestInfo responseStartTime](self, "responseStartTime");
  objc_msgSend(v4, "setResponseStartTime:");
  -[SUUIMetricsRequestInfo responseEndTime](self, "responseEndTime");
  objc_msgSend(v4, "setResponseEndTime:");
  if (-[SUUIMetricsRequestInfo hasResponseWasCachedValue](self, "hasResponseWasCachedValue"))
  {
    objc_msgSend(v4, "setResponseWasCached:", -[SUUIMetricsRequestInfo responseWasCached](self, "responseWasCached"));
    objc_msgSend(v4, "setHasResponseWasCachedValue:", 1);
  }
  return v4;
}

- (void)setResponseWasCached:(BOOL)a3
{
  self->_responseWasCached = a3;
  -[SUUIMetricsRequestInfo setHasResponseWasCachedValue:](self, "setHasResponseWasCachedValue:", 1);
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  if (-[SUUIMetricsRequestInfo hasResponseWasCachedValue](self, "hasResponseWasCachedValue"))
  {
    v11[0] = CFSTR("requestStartTime");
    -[SUUIMetricsRequestInfo requestStartTime](self, "requestStartTime");
    +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v3;
    v11[1] = CFSTR("responseStartTime");
    -[SUUIMetricsRequestInfo responseStartTime](self, "responseStartTime");
    +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v4;
    v11[2] = CFSTR("responseEndTime");
    -[SUUIMetricsRequestInfo responseEndTime](self, "responseEndTime");
    +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v5;
    v11[3] = CFSTR("responseWasCached");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SUUIMetricsRequestInfo responseWasCached](self, "responseWasCached"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[3] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9[0] = CFSTR("requestStartTime");
    -[SUUIMetricsRequestInfo requestStartTime](self, "requestStartTime");
    +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v3;
    v9[1] = CFSTR("responseStartTime");
    -[SUUIMetricsRequestInfo responseStartTime](self, "responseStartTime");
    +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v4;
    v9[2] = CFSTR("responseEndTime");
    -[SUUIMetricsRequestInfo responseEndTime](self, "responseEndTime");
    +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSDictionary *)v7;
}

- (double)requestStartTime
{
  return self->_requestStartTime;
}

- (void)setRequestStartTime:(double)a3
{
  self->_requestStartTime = a3;
}

- (double)responseStartTime
{
  return self->_responseStartTime;
}

- (void)setResponseStartTime:(double)a3
{
  self->_responseStartTime = a3;
}

- (double)responseEndTime
{
  return self->_responseEndTime;
}

- (void)setResponseEndTime:(double)a3
{
  self->_responseEndTime = a3;
}

- (BOOL)responseWasCached
{
  return self->_responseWasCached;
}

- (BOOL)hasResponseWasCachedValue
{
  return self->_hasResponseWasCachedValue;
}

- (void)setHasResponseWasCachedValue:(BOOL)a3
{
  self->_hasResponseWasCachedValue = a3;
}

@end
