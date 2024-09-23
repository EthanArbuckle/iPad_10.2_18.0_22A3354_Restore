@implementation MXMMemoryMetric

+ (MXMMemoryMetric)currentProcess
{
  return (MXMMemoryMetric *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithProcessIdentifier:", getpid());
}

- (MXMMemoryMetric)initWithProcessIdentifier:(int)a3
{
  uint64_t v3;
  MXMSampleTagFilter *v5;
  void *v6;
  MXMSampleTagFilter *v7;
  MXMSampleAttributeFilter *v8;
  void *v9;
  MXMSampleAttributeFilter *v10;
  void *v11;
  MXMMemoryMetric *v12;

  v3 = *(_QWORD *)&a3;
  v5 = [MXMSampleTagFilter alloc];
  +[MXMUtilizationSampleTag memory](MXMUtilizationSampleTag, "memory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MXMSampleTagFilter initWithTag:allowDescendents:](v5, "initWithTag:allowDescendents:", v6, 1);

  v8 = [MXMSampleAttributeFilter alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MXMSampleAttributeFilter initWithAttributeName:numericValue:](v8, "initWithAttributeName:numericValue:", CFSTR("Process Identifier"), v9);

  +[MXMSampleFilter filterWithAttributeFilter:tagFilter:](MXMSampleFilter, "filterWithAttributeFilter:tagFilter:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MXMMemoryMetric initWithIdentifier:filter:](self, "initWithIdentifier:filter:", CFSTR("com.apple.metricmeasurement.metric.memory"), v11);

  return v12;
}

- (MXMMemoryMetric)initWithProcessName:(id)a3
{
  id v4;
  MXMSampleTagFilter *v5;
  void *v6;
  MXMSampleTagFilter *v7;
  MXMSampleAttributeFilter *v8;
  void *v9;
  MXMMemoryMetric *v10;

  if (a3)
  {
    v4 = a3;
    v5 = [MXMSampleTagFilter alloc];
    +[MXMUtilizationSampleTag memory](MXMUtilizationSampleTag, "memory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MXMSampleTagFilter initWithTag:allowDescendents:](v5, "initWithTag:allowDescendents:", v6, 1);

    v8 = -[MXMSampleAttributeFilter initWithAttributeName:stringValue:]([MXMSampleAttributeFilter alloc], "initWithAttributeName:stringValue:", CFSTR("Process Name"), v4);
    +[MXMSampleFilter filterWithAttributeFilter:tagFilter:](MXMSampleFilter, "filterWithAttributeFilter:tagFilter:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[MXMMemoryMetric initWithIdentifier:filter:](self, "initWithIdentifier:filter:", CFSTR("com.apple.metricmeasurement.metric.memory"), v9);

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (MXMMemoryMetric)initWithBundleIdentifier:(id)a3
{
  void *v4;
  MXMMemoryMetric *v5;

  +[MXMMachUtils _processNameWithBundleIdentifier:](MXMMachUtils, "_processNameWithBundleIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MXMMemoryMetric initWithProcessName:](self, "initWithProcessName:", v4);

  return v5;
}

- (MXMMemoryMetric)initWithIdentifier:(id)a3 filter:(id)a4
{
  MXMMemoryMetric *v4;
  MXMMemoryMetric *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MXMMemoryMetric;
  v4 = -[MXMMetric initWithIdentifier:filter:](&v7, sel_initWithIdentifier_filter_, a3, a4);
  v5 = v4;
  if (v4)
    -[MXMMetric setPreferredSampleMode:](v4, "setPreferredSampleMode:", 3);
  return v5;
}

- (void)willStartAtEstimatedTime:(unint64_t)a3
{
  void *v5;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MXMMemoryMetric;
  -[MXMMetric _getProbe](&v7, sel__getProbe);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performPreIterationActions");
  v6.receiver = self;
  v6.super_class = (Class)MXMMemoryMetric;
  -[MXMMetric willStartAtEstimatedTime:](&v6, sel_willStartAtEstimatedTime_, a3);

}

- (NSString)processName
{
  void *v2;
  void *v3;
  void *v4;

  -[MXMMetric filter](self, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeFilterWithName:", CFSTR("Process Name"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSNumber)processIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[MXMMetric filter](self, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributeFilterWithName:", CFSTR("Process Identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numericValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (BOOL)_shouldConstructProbe
{
  return 1;
}

- (id)_constructProbe
{
  return objc_alloc_init(MXMResourceProbe);
}

@end
