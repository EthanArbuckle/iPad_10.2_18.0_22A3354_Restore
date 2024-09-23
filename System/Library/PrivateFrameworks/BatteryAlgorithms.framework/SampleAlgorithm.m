@implementation SampleAlgorithm

+ (id)algorithmWithData:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(v4, "valueForKey:", CFSTR("smcData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("systemState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("savedAlgoState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v5, "initWithSMCKeys:withSystemState:withSavedAlgoState:", v6, v7, v8);
  return v9;
}

- (int)freshInitWithData:(id)a3
{
  return 0;
}

- (SampleAlgorithm)initWithSMCKeys:(id)a3 withSystemState:(id)a4 withSavedAlgoState:(id)a5
{
  id v6;
  SampleAlgorithm *v7;
  os_log_t v8;
  OS_os_log *logger;
  NSObject *v10;
  NSString *name;
  NSString *version;
  NSString *algoDescription;
  uint64_t v14;
  NSNumber *runPeriod;
  objc_super v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SampleAlgorithm;
  v7 = -[SampleAlgorithm init](&v17, sel_init);
  v8 = os_log_create("com.apple.batteryalgorithms", "SampleAlgorithm");
  logger = v7->_logger;
  v7->_logger = (OS_os_log *)v8;

  v10 = v7->_logger;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_236E59000, v10, OS_LOG_TYPE_DEFAULT, "I was passed in these keys: %@", buf, 0xCu);
  }
  name = v7->_name;
  v7->_name = (NSString *)CFSTR("SampleAlgorithm");

  version = v7->_version;
  v7->_version = (NSString *)CFSTR("1.0");

  algoDescription = v7->_algoDescription;
  v7->_algoDescription = (NSString *)CFSTR("Just to show that this works");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 90000);
  v14 = objc_claimAutoreleasedReturnValue();
  runPeriod = v7->_runPeriod;
  v7->_runPeriod = (NSNumber *)v14;

  v7->_freshInitNeeded = 1;
  return v7;
}

- (int)runWithData:(id)a3
{
  return 0;
}

- (id)output
{
  void *v3;
  void *v4;
  NSObject *logger;
  int v7;
  void *v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("savedAlgoState");
  v9[1] = CFSTR("kCoreAnalyticsData");
  v10[0] = &unk_250871D60;
  v10[1] = &unk_250871D88;
  v9[2] = CFSTR("kPowerLogData");
  v10[2] = &unk_250871DB0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_236E59000, logger, OS_LOG_TYPE_DEFAULT, "Output Dictionary looks like : %@", (uint8_t *)&v7, 0xCu);
  }

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)version
{
  return self->_version;
}

- (NSString)algoDescription
{
  return self->_algoDescription;
}

- (NSNumber)runPeriod
{
  return self->_runPeriod;
}

- (unint64_t)runType
{
  return self->_runType;
}

- (BOOL)freshInitNeeded
{
  return self->_freshInitNeeded;
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_runPeriod, 0);
  objc_storeStrong((id *)&self->_algoDescription, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
