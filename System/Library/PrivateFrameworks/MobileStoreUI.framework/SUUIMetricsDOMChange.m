@implementation SUUIMetricsDOMChange

- (SUUIMetricsDOMChange)initWithReportDomBuildTimesMessagePayload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  SUUIMetricsDOMChange *v8;
  SUUIMetricsDOMChange *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buildStartTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buildEndTime"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = -[SUUIMetricsDOMChange init](self, "init");
    if (v9)
    {
      +[SUUIMetricsUtilities timeIntervalFromJSTime:](SUUIMetricsUtilities, "timeIntervalFromJSTime:", v5);
      -[SUUIMetricsDOMChange setBuildStartTime:](v9, "setBuildStartTime:");
      +[SUUIMetricsUtilities timeIntervalFromJSTime:](SUUIMetricsUtilities, "timeIntervalFromJSTime:", v7);
      -[SUUIMetricsDOMChange setBuildEndTime:](v9, "setBuildEndTime:");
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("messageWasDeferred"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUUIMetricsDOMChange setFromDeferredMessage:](v9, "setFromDeferredMessage:", objc_msgSend(v10, "BOOLValue"));

    }
    self = v9;
    v8 = self;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SUUIMetricsDOMChange buildStartTime](self, "buildStartTime");
  objc_msgSend(v4, "setBuildStartTime:");
  -[SUUIMetricsDOMChange buildEndTime](self, "buildEndTime");
  objc_msgSend(v4, "setBuildEndTime:");
  -[SUUIMetricsDOMChange renderStartTime](self, "renderStartTime");
  objc_msgSend(v4, "setRenderStartTime:");
  -[SUUIMetricsDOMChange renderEndTime](self, "renderEndTime");
  objc_msgSend(v4, "setRenderEndTime:");
  objc_msgSend(v4, "setFromDeferredMessage:", -[SUUIMetricsDOMChange isFromDeferredMessage](self, "isFromDeferredMessage"));
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
  v9[0] = CFSTR("buildStartTime");
  -[SUUIMetricsDOMChange buildStartTime](self, "buildStartTime");
  +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("buildEndTime");
  -[SUUIMetricsDOMChange buildEndTime](self, "buildEndTime");
  +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("renderStartTime");
  -[SUUIMetricsDOMChange renderStartTime](self, "renderStartTime");
  +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("renderEndTime");
  -[SUUIMetricsDOMChange renderEndTime](self, "renderEndTime");
  +[SUUIMetricsUtilities jsTimeFromTimeInterval:](SUUIMetricsUtilities, "jsTimeFromTimeInterval:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (unint64_t)hash
{
  double v3;
  unint64_t v4;
  double v5;
  unint64_t v6;
  double v7;
  unint64_t v8;
  double v9;
  unint64_t v10;
  _BOOL4 v11;
  uint64_t v12;

  -[SUUIMetricsDOMChange buildStartTime](self, "buildStartTime");
  v4 = (unint64_t)v3;
  -[SUUIMetricsDOMChange buildEndTime](self, "buildEndTime");
  v6 = v4 + 10 * (unint64_t)v5;
  -[SUUIMetricsDOMChange renderStartTime](self, "renderStartTime");
  v8 = v6 + 100 * (unint64_t)v7;
  -[SUUIMetricsDOMChange renderEndTime](self, "renderEndTime");
  v10 = v8 + 1000 * (unint64_t)v9;
  v11 = -[SUUIMetricsDOMChange isFromDeferredMessage](self, "isFromDeferredMessage");
  v12 = 10000;
  if (!v11)
    v12 = 0;
  return v10 + v12;
}

- (BOOL)isEqual:(id)a3
{
  SUUIMetricsDOMChange *v4;
  SUUIMetricsDOMChange *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BOOL4 v18;
  _BOOL4 v19;

  v4 = (SUUIMetricsDOMChange *)a3;
  if (self == v4)
  {
    LOBYTE(v19) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SUUIMetricsDOMChange buildStartTime](self, "buildStartTime");
      v7 = v6;
      -[SUUIMetricsDOMChange buildStartTime](v5, "buildStartTime");
      if (v7 != v8)
        goto LABEL_10;
      -[SUUIMetricsDOMChange buildEndTime](self, "buildEndTime");
      v10 = v9;
      -[SUUIMetricsDOMChange buildEndTime](v5, "buildEndTime");
      if (v10 != v11)
        goto LABEL_10;
      -[SUUIMetricsDOMChange renderStartTime](self, "renderStartTime");
      v13 = v12;
      -[SUUIMetricsDOMChange renderStartTime](v5, "renderStartTime");
      if (v13 == v14
        && (-[SUUIMetricsDOMChange renderEndTime](self, "renderEndTime"),
            v16 = v15,
            -[SUUIMetricsDOMChange renderEndTime](v5, "renderEndTime"),
            v16 == v17))
      {
        v18 = -[SUUIMetricsDOMChange isFromDeferredMessage](self, "isFromDeferredMessage");
        v19 = v18 ^ -[SUUIMetricsDOMChange isFromDeferredMessage](v5, "isFromDeferredMessage") ^ 1;
      }
      else
      {
LABEL_10:
        LOBYTE(v19) = 0;
      }

    }
    else
    {
      LOBYTE(v19) = 0;
    }
  }

  return v19;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIMetricsDOMChange buildStartTime](self, "buildStartTime");
  v7 = v6;
  -[SUUIMetricsDOMChange buildEndTime](self, "buildEndTime");
  v9 = v8;
  -[SUUIMetricsDOMChange renderStartTime](self, "renderStartTime");
  v11 = v10;
  -[SUUIMetricsDOMChange renderEndTime](self, "renderEndTime");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p; buildStartTime = %f; buildEndTime = %f; renderStartTime = %f; renderEndTime = %f>"),
    v5,
    self,
    v7,
    v9,
    v11,
    v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (double)buildStartTime
{
  return self->_buildStartTime;
}

- (void)setBuildStartTime:(double)a3
{
  self->_buildStartTime = a3;
}

- (double)buildEndTime
{
  return self->_buildEndTime;
}

- (void)setBuildEndTime:(double)a3
{
  self->_buildEndTime = a3;
}

- (double)renderStartTime
{
  return self->_renderStartTime;
}

- (void)setRenderStartTime:(double)a3
{
  self->_renderStartTime = a3;
}

- (double)renderEndTime
{
  return self->_renderEndTime;
}

- (void)setRenderEndTime:(double)a3
{
  self->_renderEndTime = a3;
}

- (BOOL)isFromDeferredMessage
{
  return self->_fromDeferredMessage;
}

- (void)setFromDeferredMessage:(BOOL)a3
{
  self->_fromDeferredMessage = a3;
}

@end
