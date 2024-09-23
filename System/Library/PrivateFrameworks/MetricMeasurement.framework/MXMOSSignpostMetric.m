@implementation MXMOSSignpostMetric

- (NSString)subsystem
{
  void *v2;
  void *v3;
  void *v4;

  -[MXMMetric filter](self, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeFilterWithName:", CFSTR("os_signpost subsystem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)category
{
  void *v2;
  void *v3;
  void *v4;

  -[MXMMetric filter](self, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeFilterWithName:", CFSTR("os_signpost category"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)name
{
  void *v2;
  void *v3;
  void *v4;

  -[MXMMetric filter](self, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeFilterWithName:", CFSTR("os_signpost name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (unint64_t)_sampleMode
{
  return 2;
}

- (BOOL)_shouldConstructProbe
{
  OS_dispatch_semaphore *v3;
  OS_dispatch_semaphore *startDate_semaphore;
  OS_dispatch_semaphore *v5;
  OS_dispatch_semaphore *stopDate_semaphore;

  if (!self->_startDate_semaphore)
  {
    v3 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    startDate_semaphore = self->_startDate_semaphore;
    self->_startDate_semaphore = v3;

  }
  if (!self->_stopDate_semaphore)
  {
    v5 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    stopDate_semaphore = self->_stopDate_semaphore;
    self->_stopDate_semaphore = v5;

  }
  return 1;
}

- (BOOL)_shouldAlwaysWrapInProxy
{
  return 1;
}

- (BOOL)_shouldNeverWrapInProxy
{
  return 0;
}

- (id)_constructProbe
{
  NSObject *startDate_semaphore;
  dispatch_time_t v5;
  NSObject *stopDate_semaphore;
  dispatch_time_t v7;
  NSObject *v8;
  NSDate *startDate;
  NSDate *stopDate;
  void *v12;
  void *v13;
  uint8_t buf[4];
  NSDate *v15;
  __int16 v16;
  NSDate *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  startDate_semaphore = self->_startDate_semaphore;
  if (startDate_semaphore)
  {
    v5 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(startDate_semaphore, v5);
  }
  stopDate_semaphore = self->_stopDate_semaphore;
  if (stopDate_semaphore)
  {
    v7 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(stopDate_semaphore, v7);
  }
  if (!self->_startDate || !self->_stopDate)
  {
    _MXMGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      startDate = self->_startDate;
      stopDate = self->_stopDate;
      *(_DWORD *)buf = 138412546;
      v15 = startDate;
      v16 = 2112;
      v17 = stopDate;
      _os_log_impl(&dword_214474000, v8, OS_LOG_TYPE_ERROR, "Bad date range to search archive. Start date is %@. Stop date is %@.", buf, 0x16u);
    }

    if (!self->_startDate)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMOSSignpostMetric.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_startDate"));

    }
    if (!self->_stopDate)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMOSSignpostMetric.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_stopDate"));

    }
  }
  +[MXMOSSignpostProbe probeHostSystemLogArchiveWithStartDate:endDate:startMachTime:stopMachTime:](MXMOSSignpostProbe, "probeHostSystemLogArchiveWithStartDate:endDate:startMachTime:stopMachTime:", self->_startDate);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MXMOSSignpostMetric)init
{
  return -[MXMOSSignpostMetric initWithSubsystem:](self, "initWithSubsystem:", 0);
}

- (MXMOSSignpostMetric)initWithSubsystem:(id)a3
{
  return -[MXMOSSignpostMetric initWithSubsystem:category:name:](self, "initWithSubsystem:category:name:", a3, 0, 0);
}

- (MXMOSSignpostMetric)initWithSubsystem:(id)a3 category:(id)a4
{
  return -[MXMOSSignpostMetric initWithSubsystem:category:name:](self, "initWithSubsystem:category:name:", a3, a4, 0);
}

- (MXMOSSignpostMetric)initWithSubsystem:(id)a3 category:(id)a4 name:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  MXMSampleAttributeFilter *v12;
  MXMSampleAttributeFilter *v13;
  MXMSampleAttributeFilter *v14;
  MXMSampleFilter *v15;
  MXMOSSignpostMetric *v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v12 = -[MXMSampleAttributeFilter initWithAttributeName:stringValue:]([MXMSampleAttributeFilter alloc], "initWithAttributeName:stringValue:", CFSTR("os_signpost subsystem"), v8);
    objc_msgSend(v11, "addObject:", v12);

  }
  if (v9)
  {
    v13 = -[MXMSampleAttributeFilter initWithAttributeName:stringValue:]([MXMSampleAttributeFilter alloc], "initWithAttributeName:stringValue:", CFSTR("os_signpost category"), v9);
    objc_msgSend(v11, "addObject:", v13);

  }
  if (v10)
  {
    v14 = -[MXMSampleAttributeFilter initWithAttributeName:stringValue:]([MXMSampleAttributeFilter alloc], "initWithAttributeName:stringValue:", CFSTR("os_signpost name"), v10);
    objc_msgSend(v11, "addObject:", v14);

  }
  v15 = -[MXMSampleFilter initWithAttributeFilters:]([MXMSampleFilter alloc], "initWithAttributeFilters:", v11);
  v16 = -[MXMMetric initWithIdentifier:filter:](self, "initWithIdentifier:filter:", CFSTR("com.apple.metricmeasurement.metric.os_signpost"), v15);

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MXMOSSignpostMetric;
  v5 = -[MXMMetric copyWithZone:](&v11, sel_copyWithZone_);
  if (v5)
  {
    v6 = -[NSDate copyWithZone:](self->_startDate, "copyWithZone:", a3);
    v7 = (void *)v5[8];
    v5[8] = v6;

    v8 = -[NSDate copyWithZone:](self->_stopDate, "copyWithZone:", a3);
    v9 = (void *)v5[9];
    v5[9] = v8;

    v5[10] = self->_startMachContTime;
    v5[11] = self->_stopMachContTime;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MXMOSSignpostMetric;
  v4 = a3;
  -[MXMMetric encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_startDate, CFSTR("_startDate"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_stopDate, CFSTR("_stopDate"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_startMachContTime, CFSTR("_startMachContTime"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_stopMachContTime, CFSTR("_stopMachContTime"));

}

- (MXMOSSignpostMetric)initWithCoder:(id)a3
{
  id v4;
  MXMOSSignpostMetric *v5;
  uint64_t v6;
  NSDate *startDate;
  uint64_t v8;
  NSDate *stopDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MXMOSSignpostMetric;
  v5 = -[MXMMetric initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_startDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_stopDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    stopDate = v5->_stopDate;
    v5->_stopDate = (NSDate *)v8;

    v5->_startMachContTime = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_startMachContTime"));
    v5->_stopMachContTime = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_stopMachContTime"));
  }

  return v5;
}

- (void)didStartAtTime:(unint64_t)a3 startDate:(id)a4
{
  id v6;
  NSDate *v7;
  NSDate *startDate;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MXMOSSignpostMetric;
  v6 = a4;
  -[MXMMetric didStartAtTime:startDate:](&v9, sel_didStartAtTime_startDate_, a3, v6);
  objc_msgSend(v6, "dateByAddingTimeInterval:", -1.0, v9.receiver, v9.super_class);
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();

  startDate = self->_startDate;
  self->_startDate = v7;

  self->_startMachContTime = 0;
}

- (void)didStartAtContinuousTime:(unint64_t)a3 absoluteTime:(unint64_t)a4 startDate:(id)a5
{
  id v8;
  NSDate *v9;
  NSDate *startDate;
  NSObject *startDate_semaphore;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MXMOSSignpostMetric;
  v8 = a5;
  -[MXMMetric didStartAtContinuousTime:absoluteTime:startDate:](&v12, sel_didStartAtContinuousTime_absoluteTime_startDate_, a3, a4, v8);
  objc_msgSend(v8, "dateByAddingTimeInterval:", -1.0, v12.receiver, v12.super_class);
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue();

  startDate = self->_startDate;
  self->_startDate = v9;

  self->_startMachContTime = a3;
  startDate_semaphore = self->_startDate_semaphore;
  if (startDate_semaphore)
    dispatch_semaphore_signal(startDate_semaphore);
}

- (void)didStopAtTime:(unint64_t)a3 stopDate:(id)a4
{
  id v6;
  NSDate *v7;
  NSDate *stopDate;
  objc_super v9;

  self->_stopMachContTime = 0;
  v6 = a4;
  objc_msgSend(v6, "dateByAddingTimeInterval:", 1.0);
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  stopDate = self->_stopDate;
  self->_stopDate = v7;

  v9.receiver = self;
  v9.super_class = (Class)MXMOSSignpostMetric;
  -[MXMMetric didStopAtTime:stopDate:](&v9, sel_didStopAtTime_stopDate_, a3, v6);

}

- (void)didStopAtContinuousTime:(unint64_t)a3 absoluteTime:(unint64_t)a4 stopDate:(id)a5
{
  id v8;
  NSDate *v9;
  NSDate *stopDate;
  NSObject *stopDate_semaphore;
  objc_super v12;

  v8 = a5;
  self->_stopMachContTime = a3;
  objc_msgSend(v8, "dateByAddingTimeInterval:", 1.0);
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
  stopDate = self->_stopDate;
  self->_stopDate = v9;

  stopDate_semaphore = self->_stopDate_semaphore;
  if (stopDate_semaphore)
    dispatch_semaphore_signal(stopDate_semaphore);
  v12.receiver = self;
  v12.super_class = (Class)MXMOSSignpostMetric;
  -[MXMMetric didStopAtContinuousTime:absoluteTime:stopDate:](&v12, sel_didStopAtContinuousTime_absoluteTime_stopDate_, a3, a4, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopDate_semaphore, 0);
  objc_storeStrong((id *)&self->_startDate_semaphore, 0);
  objc_storeStrong((id *)&self->_stopDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
