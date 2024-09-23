@implementation SUUIMetricsTemplateLoad

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[SUUIMetricsTemplateLoad requestStartTime](self, "requestStartTime");
  objc_msgSend(v4, "setRequestStartTime:");
  -[SUUIMetricsTemplateLoad responseStartTime](self, "responseStartTime");
  objc_msgSend(v4, "setResponseStartTime:");
  -[SUUIMetricsTemplateLoad responseEndTime](self, "responseEndTime");
  objc_msgSend(v4, "setResponseEndTime:");
  objc_msgSend(v4, "setResponseWasCached:", -[SUUIMetricsTemplateLoad responseWasCached](self, "responseWasCached"));
  return v4;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("requestStartTime");
  -[SUUIMetricsTemplateLoad requestStartTime](self, "requestStartTime");
  +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("responseStartTime");
  -[SUUIMetricsTemplateLoad responseStartTime](self, "responseStartTime");
  +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("responseEndTime");
  -[SUUIMetricsTemplateLoad responseEndTime](self, "responseEndTime");
  +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("responseWasCached");
  +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:", (double)-[SUUIMetricsTemplateLoad responseWasCached](self, "responseWasCached"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

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

- (void)setResponseWasCached:(BOOL)a3
{
  self->_responseWasCached = a3;
}

@end
