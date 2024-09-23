@implementation SGMIStagedLogRecord

- (SGMIStagedLogRecord)initWithLog:(id)a3 isLogged:(BOOL)a4
{
  id v7;
  SGMIStagedLogRecord *v8;
  SGMIStagedLogRecord *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SGMIStagedLogRecord;
  v8 = -[SGMIStagedLogRecord init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_log, a3);
    v9->_isLogged = a4;
  }

  return v9;
}

- (SGMIMetricsMailIntelligenceForMessage)log
{
  return (SGMIMetricsMailIntelligenceForMessage *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)isLogged
{
  return self->_isLogged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

@end
