@implementation HMDUserActivityType3Detector

- (HMDUserActivityType3Detector)initWithDataSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDUserActivityType3FocusListener *v8;
  HMDUserActivityType3ScheduleListener *v9;
  void *v10;
  void *v11;
  HMDUserActivityType3Detector *v12;

  v4 = a3;
  objc_msgSend(v4, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HMDUserActivityType3FocusListener initWithIdentifier:dataSource:]([HMDUserActivityType3FocusListener alloc], "initWithIdentifier:dataSource:", v7, v4);
  v9 = -[HMDUserActivityType3ScheduleListener initWithIdentifier:dataSource:]([HMDUserActivityType3ScheduleListener alloc], "initWithIdentifier:dataSource:", v7, v4);
  objc_msgSend(v4, "backgroundTaskManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HMDUserActivityType3Detector initWithIdentifier:dataSource:focusListener:scheduleListener:backgroundTaskManager:preferences:](self, "initWithIdentifier:dataSource:focusListener:scheduleListener:backgroundTaskManager:preferences:", v7, v4, v8, v9, v10, v11);

  return v12;
}

- (HMDUserActivityType3Detector)initWithIdentifier:(id)a3 dataSource:(id)a4 focusListener:(id)a5 scheduleListener:(id)a6 backgroundTaskManager:(id)a7 preferences:(id)a8
{
  id v15;
  id v16;
  id v17;
  HMDUserActivityType3Detector *v18;
  HMDUserActivityType3Detector *v19;
  id v21;
  id v22;
  objc_super v23;

  v22 = a3;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HMDUserActivityType3Detector;
  v18 = -[HMDUserActivityStateDetector initWithDataSource:](&v23, sel_initWithDataSource_, a4);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_identifier, a3);
    objc_storeStrong((id *)&v19->_focusListener, a5);
    objc_storeStrong((id *)&v19->_scheduleListener, a6);
    objc_storeStrong((id *)&v19->_backgroundTaskManager, a7);
    objc_storeWeak((id *)&v19->_preferences, v17);
  }

  return v19;
}

- (void)configureWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  NSObject *v19;
  _QWORD v20[4];
  NSObject *v21;

  v4 = a3;
  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDUserActivityType3Detector setState:](self, "setState:", 1);
  v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  -[HMDUserActivityType3Detector focusListener](self, "focusListener");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __56__HMDUserActivityType3Detector_configureWithCompletion___block_invoke;
  v20[3] = &unk_24E79C240;
  v10 = v7;
  v21 = v10;
  objc_msgSend(v8, "configureWithCompletion:", v20);

  dispatch_group_enter(v10);
  -[HMDUserActivityType3Detector scheduleListener](self, "scheduleListener");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __56__HMDUserActivityType3Detector_configureWithCompletion___block_invoke_2;
  v18[3] = &unk_24E79C240;
  v19 = v10;
  v12 = v10;
  objc_msgSend(v11, "configureWithCompletion:", v18);

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __56__HMDUserActivityType3Detector_configureWithCompletion___block_invoke_3;
  v16[3] = &unk_24E79C2B8;
  v16[4] = self;
  v17 = v4;
  v15 = v4;
  dispatch_group_notify(v12, v14, v16);

}

- (BOOL)evaluate
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  HMDUserActivityType3Detector *v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  BOOL v18;
  void *v20;
  HMDUserActivityType3Detector *v21;
  SEL v22;
  id v23;

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDUserActivityType3Detector focusListener](self, "focusListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDUserActivityType3Detector scheduleListener](self, "scheduleListener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "schedule");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HMDUserActivityType3Detector shouldIgnoreFocus:](self, "shouldIgnoreFocus:", v6);
  v10 = -[HMDUserActivityType3Detector shouldIgnoreSchedule:](self, "shouldIgnoreSchedule:", v8);
  if (v9 && v10)
  {
    v11 = self;
    v12 = 1;
LABEL_4:
    v13 = -[HMDUserActivityType3Detector _updateState:](v11, "_updateState:", v12);
LABEL_10:
    v18 = v13;
LABEL_11:

    return v18;
  }
  if (v9)
    goto LABEL_6;
  if (v10)
    goto LABEL_9;
  objc_msgSend(v8, "stateChangedTime");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updatedTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceDate:", v15);
  v17 = v16;

  if (v17 < 0.0)
  {
LABEL_9:
    v13 = -[HMDUserActivityType3Detector _updateStateWithFocus:](self, "_updateStateWithFocus:", v6);
    goto LABEL_10;
  }
  if (objc_msgSend(v8, "stateChangedReason") == 2)
    goto LABEL_6;
  if (objc_msgSend(v8, "stateChangedReason") != 1)
  {
    _HMFPreconditionFailure();
    goto LABEL_22;
  }
  if ((objc_msgSend(v6, "isEnabled") & 1) == 0)
  {
LABEL_6:
    v13 = -[HMDUserActivityType3Detector _updateStateWithSchedule:](self, "_updateStateWithSchedule:", v8);
    goto LABEL_10;
  }
  if (v17 >= 0.0)
  {
    if (v17 < (double)-[HMDUserActivityType3Detector transitionIntervalInSeconds](self, "transitionIntervalInSeconds"))
    {
      objc_msgSend(v6, "updatedTime");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[HMDUserActivityType3Detector _updateStateWithTransitionTime:](self, "_updateStateWithTransitionTime:", v20);

      goto LABEL_11;
    }
    if (objc_msgSend(v8, "state") == 3)
    {
      v11 = self;
      v12 = 5;
    }
    else
    {
      v11 = self;
      v12 = 2;
    }
    goto LABEL_4;
  }
LABEL_22:
  v21 = (HMDUserActivityType3Detector *)_HMFPreconditionFailure();
  return -[HMDUserActivityType3Detector _updateStateWithSchedule:](v21, v22, v23);
}

- (BOOL)_updateStateWithSchedule:(id)a3
{
  id v4;
  void *v5;
  HMDUserActivityType3Detector *v6;
  uint64_t v7;
  void *v8;
  HMDUserActivityType3Detector *v10;
  SEL v11;
  id v12;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    switch(objc_msgSend(v4, "state"))
    {
      case 0:
        v6 = self;
        v7 = 1;
        goto LABEL_7;
      case 1:
        v6 = self;
        v7 = 4;
        goto LABEL_7;
      case 2:
        objc_msgSend(v5, "stateChangedTime");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(self) = -[HMDUserActivityType3Detector _updateStateWithTransitionTime:](self, "_updateStateWithTransitionTime:", v8);

        break;
      case 3:
        v6 = self;
        v7 = 5;
LABEL_7:
        LOBYTE(self) = -[HMDUserActivityType3Detector _updateState:](v6, "_updateState:", v7);
        break;
      default:
        break;
    }

    return self & 1;
  }
  else
  {
    v10 = (HMDUserActivityType3Detector *)_HMFPreconditionFailure();
    return -[HMDUserActivityType3Detector _updateStateWithFocus:](v10, v11, v12);
  }
}

- (BOOL)_updateStateWithFocus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  HMDUserActivityType3Detector *v9;
  SEL v10;
  id v11;

  v4 = a3;
  if (!v4)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  v5 = v4;
  if ((objc_msgSend(v4, "isUserActionTriggered") & 1) == 0)
  {
LABEL_8:
    v9 = (HMDUserActivityType3Detector *)_HMFPreconditionFailure();
    return -[HMDUserActivityType3Detector _updateStateWithTransitionTime:](v9, v10, v11);
  }
  if (objc_msgSend(v5, "isEnabled"))
  {
    objc_msgSend(v5, "updatedTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HMDUserActivityType3Detector _updateStateWithTransitionTime:](self, "_updateStateWithTransitionTime:", v6);

  }
  else
  {
    v7 = -[HMDUserActivityType3Detector _updateState:](self, "_updateState:", 5);
  }

  return v7;
}

- (BOOL)_updateStateWithTransitionTime:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  BOOL v11;
  BOOL v12;

  v4 = a3;
  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "timeIntervalSinceDate:", v4);
  v10 = v9;

  if (v10 >= 0.0)
  {
    if (v10 >= (double)-[HMDUserActivityType3Detector transitionIntervalInSeconds](self, "transitionIntervalInSeconds"))
      v12 = -[HMDUserActivityType3Detector _updateState:](self, "_updateState:", 2);
    else
      v12 = -[HMDUserActivityType3Detector _moveToTransitionalStateWithTransitionInterval:](self, "_moveToTransitionalStateWithTransitionInterval:", (double)-[HMDUserActivityType3Detector transitionIntervalInSeconds](self, "transitionIntervalInSeconds")- v10);
    v11 = v12;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_moveToTransitionalStateWithTransitionInterval:(double)a3
{
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDUserActivityType3Detector *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;
  uint64_t v18;

  if (a3 >= 60.0)
    v4 = a3;
  else
    v4 = a3 + 60.0;
  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDUserActivityType3Detector backgroundTaskManager](self, "backgroundTaskManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserActivityType3Detector identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "expectedFireDateForTaskWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (HMFEqualObjects())
  {
    v11 = self;
    v12 = 3;
  }
  else
  {
    -[HMDUserActivityType3Detector backgroundTaskManager](self, "backgroundTaskManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserActivityType3Detector identifier](self, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v15 = objc_msgSend(v13, "scheduleTaskWithIdentifier:fireDate:onObserver:selector:error:", v14, v7, self, sel_handleTimerFiredNotification_, &v18);

    if (v15)
      v12 = 3;
    else
      v12 = 2;
    v11 = self;
  }
  v16 = -[HMDUserActivityType3Detector _updateState:](v11, "_updateState:", v12);

  return v16;
}

- (void)handleTimerFiredNotification:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  HMDUserActivityType3Detector *v10;

  v4 = a3;
  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __61__HMDUserActivityType3Detector_handleTimerFiredNotification___block_invoke;
  v8[3] = &unk_24E79C268;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (int64_t)transitionIntervalInSeconds
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[HMDUserActivityType3Detector preferences](self, "preferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferenceForKey:", CFSTR("HMDUserActivityType3TransitionIntervalInSeconds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "integerValue");
  else
    v5 = 1200;

  return v5;
}

- (BOOL)shouldIgnoreSchedule:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  v4 = v3;
  v5 = !v3 || !objc_msgSend(v3, "state") || objc_msgSend(v4, "stateChangedReason") == 0;

  return v5;
}

- (void)scheduleStateDidAutomaticallyUpdate
{
  void *v3;
  NSObject *v4;
  void *v5;
  unint64_t v6;
  id v7;

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDUserActivityType3Detector scheduleListener](self, "scheduleListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "schedule");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = -[HMDUserActivityType3Detector state](self, "state");
  -[HMDUserActivityType3Detector evaluateAndUpdateLatestReport](self, "evaluateAndUpdateLatestReport");
  if (v7)
    -[HMDUserActivityType3Detector submitLogEventWithOldState:logReason:](self, "submitLogEventWithOldState:logReason:", v6, 1);

}

- (void)userDidUpdateSchedule
{
  void *v3;
  NSObject *v4;
  void *v5;
  unint64_t v6;
  id v7;

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDUserActivityType3Detector scheduleListener](self, "scheduleListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "schedule");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = -[HMDUserActivityType3Detector state](self, "state");
  -[HMDUserActivityType3Detector evaluateAndUpdateLatestReport](self, "evaluateAndUpdateLatestReport");
  if (v7)
    -[HMDUserActivityType3Detector submitLogEventWithOldState:logReason:](self, "submitLogEventWithOldState:logReason:", v6, 2);

}

- (BOOL)shouldIgnoreFocus:(id)a3
{
  if (a3)
    return objc_msgSend(a3, "isUserActionTriggered") ^ 1;
  else
    return 1;
}

- (void)focusDidTrigger
{
  void *v3;
  NSObject *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  int v8;
  void *v9;

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDUserActivityType3Detector focusListener](self, "focusListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "focus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HMDUserActivityType3Detector state](self, "state");
  -[HMDUserActivityType3Detector evaluateAndUpdateLatestReport](self, "evaluateAndUpdateLatestReport");
  v7 = v9;
  if (v9)
  {
    v8 = objc_msgSend(v9, "isUserActionTriggered");
    v7 = v9;
    if (v8)
    {
      -[HMDUserActivityType3Detector submitLogEventWithOldState:logReason:](self, "submitLogEventWithOldState:logReason:", v6, 3);
      v7 = v9;
    }
  }

}

- (BOOL)_updateState:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  v5 = -[HMDUserActivityType3Detector state](self, "state");
  if (v5 != a3)
  {
    if (a3 != 3)
    {
      -[HMDUserActivityType3Detector backgroundTaskManager](self, "backgroundTaskManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDUserActivityType3Detector identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "hasOutstandingTaskWithIdentifier:", v7);

      if (v8)
      {
        -[HMDUserActivityType3Detector backgroundTaskManager](self, "backgroundTaskManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDUserActivityType3Detector identifier](self, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "cancelTaskWithIdentifier:onObserver:", v10, self);

      }
    }
    -[HMDUserActivityType3Detector setState:](self, "setState:", a3);
  }
  return v5 != a3;
}

- (void)submitLogEventWithOldState:(unint64_t)a3 logReason:(unint64_t)a4
{
  void *v5;
  void *v6;
  HMDUserActivityType3StateLogEvent *v7;

  v7 = -[HMDUserActivityType3StateLogEvent initWithState:oldState:logReason:]([HMDUserActivityType3StateLogEvent alloc], "initWithState:oldState:logReason:", -[HMDUserActivityType3Detector state](self, "state"), a3, a4);
  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logEventSubmitter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "submitLogEvent:", v7);

}

- (void)evaluateAndSetInitialReport
{
  -[HMDUserActivityType3Detector evaluate](self, "evaluate");
  -[HMDUserActivityType3Detector updateLatestReportWithReason:](self, "updateLatestReportWithReason:", 1);
}

- (void)evaluateAndUpdateLatestReport
{
  if (-[HMDUserActivityType3Detector evaluate](self, "evaluate"))
    -[HMDUserActivityType3Detector updateLatestReportWithReason:](self, "updateLatestReportWithReason:", 11);
}

- (void)updateLatestReportWithReason:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  HMDUserActivityType3Report *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDUserActivityType3Report *v11;

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = [HMDUserActivityType3Report alloc];
  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "home");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentUser");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HMDUserActivityType3Report initWithUser:state:withReason:](v7, "initWithUser:state:withReason:", v10, -[HMDUserActivityType3Detector state](self, "state"), a3);
  -[HMDUserActivityStateDetector setLatestReport:](self, "setLatestReport:", v11);

  -[HMDUserActivityStateDetector notifyDetectorStateChangedWithReason:](self, "notifyDetectorStateChangedWithReason:", a3);
}

- (HMDUserActivityType3FocusListener)focusListener
{
  return self->_focusListener;
}

- (HMDUserActivityType3ScheduleListener)scheduleListener
{
  return self->_scheduleListener;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (HMDBackgroundTaskManager)backgroundTaskManager
{
  return self->_backgroundTaskManager;
}

- (HMFPreferences)preferences
{
  return (HMFPreferences *)objc_loadWeakRetained((id *)&self->_preferences);
}

- (void)setPreferences:(id)a3
{
  objc_storeWeak((id *)&self->_preferences, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_preferences);
  objc_storeStrong((id *)&self->_backgroundTaskManager, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_scheduleListener, 0);
  objc_storeStrong((id *)&self->_focusListener, 0);
}

void __61__HMDUserActivityType3Detector_handleTimerFiredNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HMD.BGTM.NK"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "isEqualToString:", v3);

  if (v4 && objc_msgSend(*(id *)(a1 + 40), "state") == 3)
    objc_msgSend(*(id *)(a1 + 40), "evaluateAndUpdateLatestReport");

}

void __56__HMDUserActivityType3Detector_configureWithCompletion___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __56__HMDUserActivityType3Detector_configureWithCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __56__HMDUserActivityType3Detector_configureWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(void);
  void (**v7)(void);

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "focusListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", v2);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "scheduleListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

  objc_msgSend(*(id *)(a1 + 32), "evaluateAndSetInitialReport");
  v6 = (void (**)(void))_Block_copy(*(const void **)(a1 + 40));
  if (v6)
  {
    v7 = v6;
    v6[2]();
    v6 = v7;
  }

}

+ (unint64_t)contributorType
{
  return 2;
}

@end
