@implementation ADExecutorParameters

- (id)initForDevice:(id)a3
{
  ADExecutorParameters *v3;
  ADExecutorParameters *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  ADLogManager *logger;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ADExecutorParameters;
  v3 = -[ADExecutorParameters init](&v14, sel_init, a3);
  v4 = v3;
  if (v3)
  {
    v3->_stepsToSkip = 0;
    v3->_powerMeasureMode = 0;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "hasPrefix:", CFSTR("ad")))
    {
      objc_msgSend(v7, "substringFromIndex:", 2);
      v8 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v8;
    }
    else
    {
      v9 = v7;
    }
    objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("parameters"), &stru_24C421AD8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[ADLogManager defaultLoggerWithName:](ADLogManager, "defaultLoggerWithName:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    logger = v4->_logger;
    v4->_logger = (ADLogManager *)v11;

  }
  return v4;
}

- (ADExecutorParameters)init
{
  void *v3;
  ADExecutorParameters *v4;

  +[ADDeviceConfiguration getDeviceName](ADDeviceConfiguration, "getDeviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ADExecutorParameters initForDevice:](self, "initForDevice:", v3);

  return v4;
}

- (NSString)intermediatesOutputPath
{
  return self->_intermediatesOutputPath;
}

- (void)setIntermediatesOutputPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (ADLogManager)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (BOOL)powerMeasureMode
{
  return self->_powerMeasureMode;
}

- (void)setPowerMeasureMode:(BOOL)a3
{
  self->_powerMeasureMode = a3;
}

- (int64_t)stepsToSkip
{
  return self->_stepsToSkip;
}

- (void)setStepsToSkip:(int64_t)a3
{
  self->_stepsToSkip = a3;
}

- (ADTimeProfiler)timeProfiler
{
  return self->_timeProfiler;
}

- (void)setTimeProfiler:(id)a3
{
  objc_storeStrong((id *)&self->_timeProfiler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeProfiler, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_intermediatesOutputPath, 0);
}

@end
