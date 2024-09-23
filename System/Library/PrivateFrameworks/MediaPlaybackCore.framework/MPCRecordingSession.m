@implementation MPCRecordingSession

- (MPCRecordingSession)initWithModelID:(id)a3 samplingTime:(double)a4 renderingLimit:(double)a5 shouldRecordSamples:(BOOL)a6
{
  id v11;
  MPCRecordingSession *v12;
  void *v13;
  uint64_t v14;
  NSString *sessionID;
  MPCStatisticsReporter *v16;
  MPCStatisticsReporter *statisticsReporter;
  MPCFirstFailureDetector *v18;
  MPCFirstFailureDetector *firstFailureDetector;
  uint64_t v20;
  ICEnvironmentMonitor *thermalMonitor;
  MPCSamplesRecorder *v22;
  MPCSamplesRecorder *currentRecorder;
  objc_super v25;

  v11 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MPCRecordingSession;
  v12 = -[MPCRecordingSession init](&v25, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = objc_claimAutoreleasedReturnValue();
    sessionID = v12->_sessionID;
    v12->_sessionID = (NSString *)v14;

    objc_storeStrong((id *)&v12->_modelID, a3);
    v16 = objc_alloc_init(MPCStatisticsReporter);
    statisticsReporter = v12->_statisticsReporter;
    v12->_statisticsReporter = v16;

    v18 = -[MPCFirstFailureDetector initWithSamplingTime:renderingLimit:]([MPCFirstFailureDetector alloc], "initWithSamplingTime:renderingLimit:", a4, a5);
    firstFailureDetector = v12->_firstFailureDetector;
    v12->_firstFailureDetector = v18;

    objc_msgSend(MEMORY[0x24BEC87C0], "sharedMonitor");
    v20 = objc_claimAutoreleasedReturnValue();
    thermalMonitor = v12->_thermalMonitor;
    v12->_thermalMonitor = (ICEnvironmentMonitor *)v20;

    -[ICEnvironmentMonitor registerObserver:](v12->_thermalMonitor, "registerObserver:", v12);
    v12->_currentThermalLevel = -[ICEnvironmentMonitor currentThermalPressureLevel](v12->_thermalMonitor, "currentThermalPressureLevel");
    v12->_shouldRecordSamples = a6;
    v22 = -[MPCSamplesRecorder initWithRecordID:modelID:firstFailureDetector:shouldStoreSamples:delegate:]([MPCSamplesRecorder alloc], "initWithRecordID:modelID:firstFailureDetector:shouldStoreSamples:delegate:", v12->_sessionID, v12->_modelID, v12->_firstFailureDetector, v12->_shouldRecordSamples, v12);
    currentRecorder = v12->_currentRecorder;
    v12->_currentRecorder = v22;

  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[ICEnvironmentMonitor unregisterObserver:](self->_thermalMonitor, "unregisterObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)MPCRecordingSession;
  -[MPCRecordingSession dealloc](&v3, sel_dealloc);
}

- (void)recordSample:(id)a3
{
  uint64_t currentThermalLevel;
  id v5;
  id v6;

  currentThermalLevel = self->_currentThermalLevel;
  v5 = a3;
  objc_msgSend(v5, "setThermalLevel:", currentThermalLevel);
  -[MPCRecordingSession currentRecorder](self, "currentRecorder");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordSample:", v5);

}

- (void)save
{
  NSObject *v3;
  MPCSamplesRecorder *currentRecorder;
  void *v5;
  int v6;
  MPCRecordingSession *v7;
  __int16 v8;
  MPCSamplesRecorder *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (-[MPCSamplesRecorder numberOfSamples](self->_currentRecorder, "numberOfSamples") >= 1)
  {
    v3 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      currentRecorder = self->_currentRecorder;
      v6 = 138543618;
      v7 = self;
      v8 = 2114;
      v9 = currentRecorder;
      _os_log_impl(&dword_210BD8000, v3, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Current session statistics: %{public}@", (uint8_t *)&v6, 0x16u);
    }

    -[MPCRecordingSession statisticsReporter](self, "statisticsReporter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reportRecordedResults:", self->_currentRecorder);

  }
}

- (void)flush
{
  id v3;

  -[MPCRecordingSession save](self, "save");
  -[MPCRecordingSession statisticsReporter](self, "statisticsReporter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flush");

}

- (void)samplesRecorderHasNewSamples:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MPCRecordingSession statisticsReporter](self, "statisticsReporter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportRecordedResults:", v4);

}

- (void)environmentMonitorDidChangeThermalLevel:(id)a3
{
  id v4;
  NSObject *v5;
  int currentThermalLevel;
  int v7;
  MPCRecordingSession *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    currentThermalLevel = self->_currentThermalLevel;
    v7 = 138543874;
    v8 = self;
    v9 = 1024;
    v10 = currentThermalLevel;
    v11 = 2048;
    v12 = objc_msgSend(v4, "currentThermalPressureLevel");
    _os_log_impl(&dword_210BD8000, v5, OS_LOG_TYPE_DEFAULT, "[AP] - %{public}@ - Thermal pressure level changed: %d -> %ld", (uint8_t *)&v7, 0x1Cu);
  }

  self->_currentThermalLevel = objc_msgSend(v4, "currentThermalPressureLevel");
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (MPCFirstFailureDetector)firstFailureDetector
{
  return self->_firstFailureDetector;
}

- (MPCStatisticsReporter)statisticsReporter
{
  return self->_statisticsReporter;
}

- (NSString)modelID
{
  return self->_modelID;
}

- (ICEnvironmentMonitor)thermalMonitor
{
  return self->_thermalMonitor;
}

- (MPCSamplesRecorder)currentRecorder
{
  return self->_currentRecorder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentRecorder, 0);
  objc_storeStrong((id *)&self->_thermalMonitor, 0);
  objc_storeStrong((id *)&self->_modelID, 0);
  objc_storeStrong((id *)&self->_statisticsReporter, 0);
  objc_storeStrong((id *)&self->_firstFailureDetector, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
