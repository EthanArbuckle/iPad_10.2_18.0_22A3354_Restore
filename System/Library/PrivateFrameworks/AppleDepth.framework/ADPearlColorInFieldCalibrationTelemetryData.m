@implementation ADPearlColorInFieldCalibrationTelemetryData

- (void)initEventTimestampsArray
{
  NSMutableArray *v3;
  NSMutableArray *firedEventTimestampsArray;
  id v5;

  v3 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 15);
  firedEventTimestampsArray = self->_firedEventTimestampsArray;
  self->_firedEventTimestampsArray = v3;

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", 0.0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](self->_firedEventTimestampsArray, "addObject:");
  -[NSMutableArray addObject:](self->_firedEventTimestampsArray, "addObject:", v5);
  -[NSMutableArray addObject:](self->_firedEventTimestampsArray, "addObject:", v5);
  -[NSMutableArray addObject:](self->_firedEventTimestampsArray, "addObject:", v5);
  -[NSMutableArray addObject:](self->_firedEventTimestampsArray, "addObject:", v5);
  -[NSMutableArray addObject:](self->_firedEventTimestampsArray, "addObject:", v5);
  -[NSMutableArray addObject:](self->_firedEventTimestampsArray, "addObject:", v5);
  -[NSMutableArray addObject:](self->_firedEventTimestampsArray, "addObject:", v5);
  -[NSMutableArray addObject:](self->_firedEventTimestampsArray, "addObject:", v5);
  -[NSMutableArray addObject:](self->_firedEventTimestampsArray, "addObject:", v5);
  -[NSMutableArray addObject:](self->_firedEventTimestampsArray, "addObject:", v5);
  -[NSMutableArray addObject:](self->_firedEventTimestampsArray, "addObject:", v5);
  -[NSMutableArray addObject:](self->_firedEventTimestampsArray, "addObject:", v5);
  -[NSMutableArray addObject:](self->_firedEventTimestampsArray, "addObject:", v5);
  -[NSMutableArray addObject:](self->_firedEventTimestampsArray, "addObject:", v5);

}

- (ADPearlColorInFieldCalibrationTelemetryData)init
{
  ADPearlColorInFieldCalibrationTelemetryData *v2;
  ADPearlColorInFieldCalibrationTelemetryData *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ADPearlColorInFieldCalibrationTelemetryData;
  v2 = -[ADPearlColorInFieldCalibrationTelemetryData init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[ADPearlColorInFieldCalibrationTelemetryData reset](v2, "reset");
    v3->_lastExecutionTime = 0;
    v3->_totalNumRuns = 0;
    v3->_lastToleranceDetectedTime = 0;
    v3->_telemetryVersion = 3;
    -[ADPearlColorInFieldCalibrationTelemetryData initEventTimestampsArray](v3, "initEventTimestampsArray");
  }
  return v3;
}

- (void)reportBackendRunTime:(unint64_t)a3
{
  unint64_t v3;

  v3 = (unint64_t)(float)a3;
  if (self->_maxBackendRunTime < a3)
    self->_maxBackendRunTime = v3;
  if (self->_minBackendRunTime > a3)
    self->_minBackendRunTime = v3;
  self->_totalBackendTime = (unint64_t)(float)((float)a3 + (float)self->_totalBackendTime);
}

- (void)reset
{
  *(_OWORD *)&self->_maxBackendRunTime = xmmword_20B6D2A40;
  self->_totalBackendTime = 0;
  self->_frontEndTime = 0;
  self->_timeSincePrevRun = 0;
}

- (void)reportFrontendRunTime:(unint64_t)a3
{
  self->_frontEndTime = (unint64_t)(float)((float)a3 + (float)self->_frontEndTime);
}

- (void)increaseRunTimesByOne
{
  ++self->_totalNumRuns;
}

- (void)updateLastExecutionTime:(unint64_t)a3
{
  unint64_t lastExecutionTime;

  lastExecutionTime = self->_lastExecutionTime;
  if (lastExecutionTime)
    self->_timeSincePrevRun = a3 - lastExecutionTime;
  self->_lastExecutionTime = a3;
}

- (id)persistenceData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSMutableArray *firedEventTimestampsArray;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[6];

  v11[5] = *MEMORY[0x24BDAC8D0];
  v10[0] = CFSTR("lastExecutionTime");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", self->_lastExecutionTime);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = CFSTR("totalNumRuns");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", self->_totalNumRuns);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  v10[2] = CFSTR("telemetryVersion");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v5;
  v10[3] = CFSTR("lastToleranceDetectedTime");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", self->_lastToleranceDetectedTime);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = CFSTR("firedEventTimestampsArray");
  firedEventTimestampsArray = self->_firedEventTimestampsArray;
  v11[3] = v6;
  v11[4] = firedEventTimestampsArray;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (ADPearlColorInFieldCalibrationTelemetryData)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  ADPearlColorInFieldCalibrationTelemetryData *v5;
  void *v6;
  void *v7;
  ADPearlColorInFieldCalibrationTelemetryData *v8;
  void *v9;
  ADPearlColorInFieldCalibrationTelemetryData *v10;
  ADPearlColorInFieldCalibrationTelemetryData *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSMutableArray *firedEventTimestampsArray;
  NSMutableArray *v18;
  objc_super v20;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("telemetryVersion"));
  v5 = (ADPearlColorInFieldCalibrationTelemetryData *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("telemetryVersion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_telemetryVersion = objc_msgSend(v6, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastExecutionTime"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
LABEL_6:
      v5 = 0;
      goto LABEL_14;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalNumRuns"));
    v8 = (ADPearlColorInFieldCalibrationTelemetryData *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (!v8)
    {

      goto LABEL_14;
    }
    if (self->_telemetryVersion < 2)
    {

    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastToleranceDetectedTime"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_6;
    }
    v20.receiver = self;
    v20.super_class = (Class)ADPearlColorInFieldCalibrationTelemetryData;
    v10 = -[ADPearlColorInFieldCalibrationTelemetryData init](&v20, sel_init);
    v11 = v10;
    if (v10)
    {
      -[ADPearlColorInFieldCalibrationTelemetryData reset](v10, "reset");
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastExecutionTime"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11->_lastExecutionTime = objc_msgSend(v12, "unsignedLongValue");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalNumRuns"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11->_totalNumRuns = objc_msgSend(v13, "unsignedLongValue");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastToleranceDetectedTime"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11->_lastToleranceDetectedTime = objc_msgSend(v14, "unsignedLongValue");

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("firedEventTimestampsArray"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "mutableCopy");
      firedEventTimestampsArray = v11->_firedEventTimestampsArray;
      v11->_firedEventTimestampsArray = (NSMutableArray *)v16;

      v18 = v11->_firedEventTimestampsArray;
      if (!v18 || -[NSMutableArray count](v18, "count") != 15)
        -[ADPearlColorInFieldCalibrationTelemetryData initEventTimestampsArray](v11, "initEventTimestampsArray");
    }
    self = v11;
    v5 = self;
  }
LABEL_14:

  return v5;
}

- (unint64_t)lastExecutionTime
{
  return self->_lastExecutionTime;
}

- (unint64_t)maxBackendRunTime
{
  return self->_maxBackendRunTime;
}

- (unint64_t)minBackendRunTime
{
  return self->_minBackendRunTime;
}

- (unint64_t)timeSincePrevRun
{
  return self->_timeSincePrevRun;
}

- (unint64_t)totalBackendTime
{
  return self->_totalBackendTime;
}

- (unint64_t)frontEndTime
{
  return self->_frontEndTime;
}

- (unint64_t)totalNumRuns
{
  return self->_totalNumRuns;
}

- (unsigned)largeRotationStatusBits
{
  return self->_largeRotationStatusBits;
}

- (unint64_t)lastToleranceDetectedTime
{
  return self->_lastToleranceDetectedTime;
}

- (void)setLastToleranceDetectedTime:(unint64_t)a3
{
  self->_lastToleranceDetectedTime = a3;
}

- (NSMutableArray)firedEventTimestampsArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFiredEventTimestampsArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firedEventTimestampsArray, 0);
}

@end
