@implementation MXMCPUMetric

+ (MXMCPUMetric)currentProcess
{
  return -[MXMCPUMetric initWithProcessIdentifier:]([MXMCPUMetric alloc], "initWithProcessIdentifier:", getpid());
}

+ (MXMCPUMetric)instrumentThread
{
  return -[MXMCPUMetric initWithIdentifier:filter:]([MXMCPUMetric alloc], "initWithIdentifier:filter:", CFSTR("com.apple.metricmeasurement.metrics.cpu"), 0);
}

- (MXMCPUMetric)initWithProcessIdentifier:(int)a3
{
  uint64_t v3;
  MXMSampleTagFilter *v5;
  void *v6;
  MXMSampleTagFilter *v7;
  MXMSampleAttributeFilter *v8;
  void *v9;
  MXMSampleAttributeFilter *v10;
  MXMSampleFilter *v11;
  void *v12;
  void *v13;
  MXMSampleFilter *v14;
  MXMCPUMetric *v15;

  v3 = *(_QWORD *)&a3;
  v5 = [MXMSampleTagFilter alloc];
  +[MXMUtilizationSampleTag CPU](MXMUtilizationSampleTag, "CPU");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MXMSampleTagFilter initWithTag:allowDescendents:](v5, "initWithTag:allowDescendents:", v6, 1);

  v8 = [MXMSampleAttributeFilter alloc];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[MXMSampleAttributeFilter initWithAttributeName:numericValue:](v8, "initWithAttributeName:numericValue:", CFSTR("Process Identifier"), v9);

  v11 = [MXMSampleFilter alloc];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MXMSampleFilter initWithAttributeFilters:tagFilters:](v11, "initWithAttributeFilters:tagFilters:", v12, v13);

  v15 = -[MXMCPUMetric initWithIdentifier:filter:](self, "initWithIdentifier:filter:", CFSTR("com.apple.metricmeasurement.metrics.cpu"), v14);
  return v15;
}

- (MXMCPUMetric)initWithProcessName:(id)a3
{
  id v4;
  MXMSampleTagFilter *v5;
  void *v6;
  MXMSampleTagFilter *v7;
  MXMSampleAttributeFilter *v8;
  MXMSampleFilter *v9;
  void *v10;
  void *v11;
  MXMSampleFilter *v12;
  MXMCPUMetric *v13;

  if (a3)
  {
    v4 = a3;
    v5 = [MXMSampleTagFilter alloc];
    +[MXMUtilizationSampleTag CPU](MXMUtilizationSampleTag, "CPU");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[MXMSampleTagFilter initWithTag:allowDescendents:](v5, "initWithTag:allowDescendents:", v6, 1);

    v8 = -[MXMSampleAttributeFilter initWithAttributeName:stringValue:]([MXMSampleAttributeFilter alloc], "initWithAttributeName:stringValue:", CFSTR("Process Name"), v4);
    v9 = [MXMSampleFilter alloc];
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[MXMSampleFilter initWithAttributeFilters:tagFilters:](v9, "initWithAttributeFilters:tagFilters:", v10, v11);

    self = -[MXMCPUMetric initWithIdentifier:filter:](self, "initWithIdentifier:filter:", CFSTR("com.apple.metricmeasurement.metrics.cpu"), v12);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (MXMCPUMetric)initWithBundleIdentifier:(id)a3
{
  void *v4;
  MXMCPUMetric *v5;

  +[MXMMachUtils _processNameWithBundleIdentifier:](MXMMachUtils, "_processNameWithBundleIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MXMCPUMetric initWithProcessName:](self, "initWithProcessName:", v4);

  return v5;
}

- (MXMCPUMetric)initWithIdentifier:(id)a3 filter:(id)a4
{
  MXMCPUMetric *v4;
  MXMCPUMetric *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MXMCPUMetric;
  v4 = -[MXMMetric initWithIdentifier:filter:](&v7, sel_initWithIdentifier_filter_, a3, a4);
  v5 = v4;
  if (v4)
    -[MXMMetric setPreferredSampleMode:](v4, "setPreferredSampleMode:", 3);
  return v5;
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
  void *v2;
  BOOL v3;

  -[MXMMetric filter](self, "filter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_constructProbe
{
  return objc_alloc_init(MXMResourceProbe);
}

- (BOOL)harvestData:(id *)a3 error:(id *)a4
{
  void *v8;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MXMMutableSampleData *v16;
  double v17;
  double v18;
  double v19;
  MXMSampleTimeSeries *v20;
  MXMSampleSet *v21;
  void *v22;
  void *v23;
  MXMSampleSet *v24;
  MXMMutableSampleData *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  double v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  -[MXMMetric filter](self, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v30.receiver = self;
    v30.super_class = (Class)MXMCPUMetric;
    return -[MXMMetric harvestData:error:](&v30, sel_harvestData_error_, a3, a4);
  }
  else
  {
    +[MXMInstrument activeInstrument](MXMInstrument, "activeInstrument");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "currentIteration");

    if (v11)
    {
      v12 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(unsigned int *)(v11 + 16));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[MXMSampleAttribute attributeWithName:numericValue:](MXMSampleAttribute, "attributeWithName:numericValue:", CFSTR("Thread Identifier"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithObject:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!*(_QWORD *)(v11 + 40))
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMCPUMetric.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("iteration->startTime > 0"));

      }
      if (!*(_QWORD *)(v11 + 48))
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMCPUMetric.m"), 98, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("iteration->stopTime > 0"));

      }
      if (!*(_QWORD *)(v11 + 88))
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMCPUMetric.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("iteration->startThreadCounts.instructions > 0"));

      }
      if (!*(_QWORD *)(v11 + 104))
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MXMCPUMetric.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("iteration->stopThreadCounts.instructions > 0"));

      }
      v16 = objc_alloc_init(MXMMutableSampleData);
      +[MXMMachUtils _nanosecondsWithAbsoluteTime:](MXMMachUtils, "_nanosecondsWithAbsoluteTime:", *(_QWORD *)(v11 + 40));
      v32[0] = (unint64_t)v17;
      +[MXMMachUtils _nanosecondsWithAbsoluteTime:](MXMMachUtils, "_nanosecondsWithAbsoluteTime:", *(_QWORD *)(v11 + 48));
      v32[1] = (unint64_t)v18;
      v19 = (double)*(unint64_t *)(v11 + 104);
      v31[0] = (double)*(unint64_t *)(v11 + 88);
      v31[1] = v19;
      v20 = -[MXMSampleTimeSeries initWithAbsoluteTimeSeries:length:]([MXMSampleTimeSeries alloc], "initWithAbsoluteTimeSeries:length:", v32, 2);
      v21 = [MXMSampleSet alloc];
      +[MXMUtilizationSampleTag CPUInstructions](MXMUtilizationSampleTag, "CPUInstructions");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[MXMUnitInstruction baseUnit](MXMUnitInstruction, "baseUnit");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[MXMSampleSet initWithTime:tag:unit:attributes:doubleValues:length:](v21, "initWithTime:tag:unit:attributes:doubleValues:length:", v20, v22, v23, v15, v31, 2);

      -[MXMMutableSampleData appendSet:](v16, "appendSet:", v24);
      v25 = objc_retainAutorelease(v16);
      *a3 = v25;

      return 1;
    }
    else
    {
      return 0;
    }
  }
}

@end
