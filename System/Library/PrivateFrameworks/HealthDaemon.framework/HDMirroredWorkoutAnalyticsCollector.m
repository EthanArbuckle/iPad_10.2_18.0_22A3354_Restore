@implementation HDMirroredWorkoutAnalyticsCollector

- (HDMirroredWorkoutAnalyticsCollector)init
{
  HDMirroredWorkoutAnalyticsCollector *v2;
  HDMirroredWorkoutAnalyticsCollector *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDMirroredWorkoutAnalyticsCollector;
  v2 = -[HDMirroredWorkoutAnalyticsCollector init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[HDMirroredWorkoutAnalyticsCollector _reset]((uint64_t)v2);
  return v3;
}

- (uint64_t)_reset
{
  uint64_t v1;
  HDMirroredWorkoutAnalyticEvent *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (result)
  {
    v1 = result;
    v2 = objc_alloc_init(HDMirroredWorkoutAnalyticEvent);
    v3 = *(void **)(v1 + 40);
    *(_QWORD *)(v1 + 40) = v2;

    objc_msgSend(MEMORY[0x1E0CB69E0], "timerWithKey:", CFSTR("StartMirroringTimerKey"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(v1 + 8);
    *(_QWORD *)(v1 + 8) = v4;

    objc_msgSend(MEMORY[0x1E0CB69E0], "timerWithKey:", CFSTR("StopMirroringTimerKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(v1 + 16);
    *(_QWORD *)(v1 + 16) = v6;

    objc_msgSend(MEMORY[0x1E0CB69E0], "timerWithKey:", CFSTR("SendDataTimerKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(v1 + 24);
    *(_QWORD *)(v1 + 24) = v8;

    objc_msgSend(*(id *)(v1 + 8), "clear");
    objc_msgSend(*(id *)(v1 + 16), "clear");
    return objc_msgSend(*(id *)(v1 + 24), "clear");
  }
  return result;
}

- (void)startMirroring
{
  self->_startTime = CFAbsoluteTimeGetCurrent();
  -[HKPersistentTimer start](self->_startMirroringTimer, "start");
}

- (void)startedMirroring
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[HKPersistentTimer timerValue](self->_startMirroringTimer, "timerValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HDMirroredWorkoutAnalyticEvent setTimeTakenToStartMirroring:](self->_mirroredWorkoutEvent, "setTimeTakenToStartMirroring:", -[HKPersistentTimer elapsedMilliSeconds](self->_startMirroringTimer, "elapsedMilliSeconds"));
    -[HKPersistentTimer clear](self->_startMirroringTimer, "clear");
  }
  else
  {
    _HKInitializeLogging();
    v4 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "Failed to track successful start of mirrored workout: timer does not exist.", v5, 2u);
    }
  }
}

- (void)stopMirroring
{
  -[HKPersistentTimer start](self->_stopMirroringTimer, "start");
}

- (void)stoppedMirroring
{
  void *v3;
  NSObject *v4;
  uint8_t v5[16];

  -[HKPersistentTimer timerValue](self->_stopMirroringTimer, "timerValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HDMirroredWorkoutAnalyticEvent setMirroringDuration:](self->_mirroredWorkoutEvent, "setMirroringDuration:", (uint64_t)(CFAbsoluteTimeGetCurrent() - self->_startTime));
    -[HDMirroredWorkoutAnalyticEvent setTimeTakenToStopMirroring:](self->_mirroredWorkoutEvent, "setTimeTakenToStopMirroring:", -[HKPersistentTimer elapsedMilliSeconds](self->_stopMirroringTimer, "elapsedMilliSeconds"));
    -[HKPersistentTimer clear](self->_stopMirroringTimer, "clear");
  }
  else
  {
    _HKInitializeLogging();
    v4 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "Failed to track successful stop of mirrored workout: timer does not exist.", v5, 2u);
    }
  }
}

- (void)sendData
{
  -[HKPersistentTimer start](self->_sendDataTimer, "start");
}

- (void)sentData
{
  void *v3;
  double v4;
  NSObject *v5;
  uint8_t v6[16];

  -[HKPersistentTimer timerValue](self->_sendDataTimer, "timerValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (double)(unint64_t)-[HKPersistentTimer elapsedMilliSeconds](self->_sendDataTimer, "elapsedMilliSeconds");
    if (v4 <= (double)-[HDMirroredWorkoutAnalyticEvent maxTimeTakenToSendData](self->_mirroredWorkoutEvent, "maxTimeTakenToSendData"))
    {
      if (v4 < (double)-[HDMirroredWorkoutAnalyticEvent minTimeTakenToSendData](self->_mirroredWorkoutEvent, "minTimeTakenToSendData"))-[HDMirroredWorkoutAnalyticEvent setMinTimeTakenToSendData:](self->_mirroredWorkoutEvent, "setMinTimeTakenToSendData:", (uint64_t)v4);
    }
    else
    {
      -[HDMirroredWorkoutAnalyticEvent setMaxTimeTakenToSendData:](self->_mirroredWorkoutEvent, "setMaxTimeTakenToSendData:", (uint64_t)v4);
    }
    -[HDMirroredWorkoutAnalyticEvent setTimeTakenToSendData:](self->_mirroredWorkoutEvent, "setTimeTakenToSendData:", (uint64_t)(v4+ (double)-[HDMirroredWorkoutAnalyticEvent timeTakenToSendData](self->_mirroredWorkoutEvent, "timeTakenToSendData")));
    -[HDMirroredWorkoutAnalyticEvent setNumberOfSendRequests:](self->_mirroredWorkoutEvent, "setNumberOfSendRequests:", -[HDMirroredWorkoutAnalyticEvent numberOfSendRequests](self->_mirroredWorkoutEvent, "numberOfSendRequests") + 1);
    -[HKPersistentTimer clear](self->_sendDataTimer, "clear");
  }
  else
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "Failed to track successful stop of mirrored workout: timer does not exist.", v6, 2u);
    }
  }
}

- (void)submitMirroringMetricsWithCoordinator:(id)a3 isFirstParty:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a4;
  v6 = a3;
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "Sending mirroring metrics to Analytics collector", v8, 2u);
  }
  objc_msgSend(v6, "workout_reportMirroringEventWithStartDuration:stopDuration:mirroringDuration:numOfSendDataRequests:maxTimeToSendData:minTimeToSendData:avgTimeToSendData:isFirstParty:", -[HDMirroredWorkoutAnalyticEvent numberOfSendRequests](self->_mirroredWorkoutEvent, "numberOfSendRequests"), v4, (double)-[HDMirroredWorkoutAnalyticEvent timeTakenToStartMirroring](self->_mirroredWorkoutEvent, "timeTakenToStartMirroring"), (double)-[HDMirroredWorkoutAnalyticEvent timeTakenToStopMirroring](self->_mirroredWorkoutEvent, "timeTakenToStopMirroring"), (double)-[HDMirroredWorkoutAnalyticEvent mirroringDuration](self->_mirroredWorkoutEvent, "mirroringDuration"), (double)-[HDMirroredWorkoutAnalyticEvent maxTimeTakenToSendData](self->_mirroredWorkoutEvent, "maxTimeTakenToSendData"), (double)-[HDMirroredWorkoutAnalyticEvent minTimeTakenToSendData](self->_mirroredWorkoutEvent, "minTimeTakenToSendData"), (double)(-[HDMirroredWorkoutAnalyticEvent timeTakenToSendData](self->_mirroredWorkoutEvent, "timeTakenToSendData")
           / -[HDMirroredWorkoutAnalyticEvent numberOfSendRequests](self->_mirroredWorkoutEvent, "numberOfSendRequests")));

  -[HDMirroredWorkoutAnalyticsCollector _reset]((uint64_t)self);
}

- (void)submitHeartBeatFailuresWithCoordinator:(id)a3 numOfHeartbeatFailures:(int64_t)a4 workoutDuration:(double)a5 isFirstParty:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  v6 = a6;
  v9 = a3;
  _HKInitializeLogging();
  v10 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "Sending heartbeat failure metrics to Analytics collector", v11, 2u);
  }
  objc_msgSend(v9, "workout_reportWorkoutEventWithHeartBeatFailures:workoutDuration:isFirstParty:", a4, v6, a5);

}

- (HDMirroredWorkoutAnalyticEvent)mirroredWorkoutEvent
{
  return self->_mirroredWorkoutEvent;
}

- (void)setMirroredWorkoutEvent:(id)a3
{
  objc_storeStrong((id *)&self->_mirroredWorkoutEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mirroredWorkoutEvent, 0);
  objc_storeStrong((id *)&self->_sendDataTimer, 0);
  objc_storeStrong((id *)&self->_stopMirroringTimer, 0);
  objc_storeStrong((id *)&self->_startMirroringTimer, 0);
}

@end
