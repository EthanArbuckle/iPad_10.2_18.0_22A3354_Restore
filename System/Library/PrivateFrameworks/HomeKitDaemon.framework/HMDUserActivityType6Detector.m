@implementation HMDUserActivityType6Detector

- (HMDUserActivityType6Detector)initWithDataSource:(id)a3
{
  id v4;
  void *v5;
  HMDUserActivityType6Detector *v6;

  v4 = a3;
  +[HMDLocation sharedManager](HMDLocation, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDUserActivityType6Detector initWithDataSource:locationManager:](self, "initWithDataSource:locationManager:", v4, v5);

  return v6;
}

- (HMDUserActivityType6Detector)initWithDataSource:(id)a3 locationManager:(id)a4
{
  id v6;
  id v7;
  HMDUserActivityType6Detector *v8;
  HMDUserActivityType6CoreLocationTracker *v9;
  HMDUserActivityType6CoreLocationTracker *coreLocationTracker;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *reportSuppressedTimerIdentifier;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMDUserActivityType6Detector;
  v8 = -[HMDUserActivityStateDetector initWithDataSource:](&v18, sel_initWithDataSource_, v6);
  if (v8)
  {
    v9 = -[HMDUserActivityType6CoreLocationTracker initWithDataSource:locationManager:]([HMDUserActivityType6CoreLocationTracker alloc], "initWithDataSource:locationManager:", v6, v7);
    coreLocationTracker = v8->_coreLocationTracker;
    v8->_coreLocationTracker = v9;

    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v6, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("HMDUserActivityType6Detector.ReportSuppressedTimer.%@"), v14);
    v15 = objc_claimAutoreleasedReturnValue();
    reportSuppressedTimerIdentifier = v8->_reportSuppressedTimerIdentifier;
    v8->_reportSuppressedTimerIdentifier = (NSString *)v15;

  }
  return v8;
}

- (void)configureWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDUserActivityType6Detector coreLocationTracker](self, "coreLocationTracker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configureWithDelegate:", self);

  -[HMDUserActivityType6Detector coreLocationTracker](self, "coreLocationTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentStateEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserActivityType6Detector setPreviousStateEvent:](self, "setPreviousStateEvent:", v9);

  -[HMDUserActivityType6Detector updateLatestReportWithReason:](self, "updateLatestReportWithReason:", 1);
  v11 = _Block_copy(v4);

  v10 = v11;
  if (v11)
  {
    (*((void (**)(id))v11 + 2))(v11);
    v10 = v11;
  }

}

- (void)updateLatestReportWithReason:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDUserActivityType6Report *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  HMDUserActivityType6Report *v17;
  id v18;

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[HMDUserActivityType6Detector previousStateEvent](self, "previousStateEvent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "state") == 2)
    {
      -[HMDUserActivityType6Detector previousStateEvent](self, "previousStateEvent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stateEnd");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        goto LABEL_7;
    }
    else
    {

    }
    -[HMDUserActivityType6Detector previousStateEvent](self, "previousStateEvent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = [HMDUserActivityType6Report alloc];
    objc_msgSend(v18, "currentUser");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "state");
    objc_msgSend(v11, "stateEnd");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "changedTimestamp");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HMDUserActivityType6Report initWithUser:state:stateEnd:withReason:changedTimestamp:lastUpdateTimestamp:](v12, "initWithUser:state:stateEnd:withReason:changedTimestamp:lastUpdateTimestamp:", v13, v14, v15, a3, v16, 0);
    -[HMDUserActivityStateDetector setLatestReport:](self, "setLatestReport:", v17);

    -[HMDUserActivityStateDetector notifyDetectorStateChangedWithReason:](self, "notifyDetectorStateChangedWithReason:", a3);
  }
LABEL_7:

}

- (BOOL)_shouldSuppresscurrentStateEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;

  v4 = a3;
  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (objc_msgSend(v4, "state") != 2)
    goto LABEL_4;
  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stateEnd");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v8);
  v11 = v10;

  if (v11 <= 7200.0)
  {

LABEL_4:
    -[HMDUserActivityStateDetector dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backgroundTaskManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserActivityType6Detector reportSuppressedTimerIdentifier](self, "reportSuppressedTimerIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cancelTaskWithIdentifier:onObserver:", v14, self);

    -[HMDUserActivityType6Detector setReportSuppressionTimerPreviousStateEnd:](self, "setReportSuppressionTimerPreviousStateEnd:", 0);
    v15 = 0;
    goto LABEL_9;
  }
  -[HMDUserActivityType6Detector reportSuppressionTimerPreviousStateEnd](self, "reportSuppressionTimerPreviousStateEnd");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_7;
  v17 = (void *)v16;
  -[HMDUserActivityType6Detector reportSuppressionTimerPreviousStateEnd](self, "reportSuppressionTimerPreviousStateEnd");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stateEnd");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = HMFEqualObjects();

  if ((v20 & 1) == 0)
  {
LABEL_7:
    objc_msgSend(v4, "stateEnd");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserActivityType6Detector setReportSuppressionTimerPreviousStateEnd:](self, "setReportSuppressionTimerPreviousStateEnd:", v21);

    objc_msgSend(v8, "dateByAddingTimeInterval:", v11 + -7200.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserActivityStateDetector dataSource](self, "dataSource");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "backgroundTaskManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserActivityType6Detector reportSuppressedTimerIdentifier](self, "reportSuppressedTimerIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v24, "scheduleTaskWithIdentifier:fireDate:onObserver:selector:error:", v25, v22, self, sel_handleBackgroundTaskTimerFired_, &v27);

  }
  v15 = 1;
LABEL_9:

  return v15;
}

- (void)_evaluateCurrentStateEvent
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HMDUserActivityType6StateEvent *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  id v18;

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDUserActivityType6Detector coreLocationTracker](self, "coreLocationTracker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentStateEvent");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = -[HMDUserActivityType6Detector _shouldSuppresscurrentStateEvent:](self, "_shouldSuppresscurrentStateEvent:", v18);
  -[HMDUserActivityType6Detector previousStateEvent](self, "previousStateEvent");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!(_DWORD)v4)
  {
    if (v6)
    {
      -[HMDUserActivityType6Detector previousStateEvent](self, "previousStateEvent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "state");
      if (v12 == objc_msgSend(v18, "state"))
      {
        -[HMDUserActivityType6Detector previousStateEvent](self, "previousStateEvent");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stateEnd");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stateEnd");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = HMFEqualObjects();

        if ((v16 & 1) != 0)
          goto LABEL_12;
      }
      else
      {

      }
    }
    -[HMDUserActivityType6Detector setPreviousStateEvent:](self, "setPreviousStateEvent:", v18);
    goto LABEL_11;
  }
  if (!v6
    || (-[HMDUserActivityType6Detector previousStateEvent](self, "previousStateEvent"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "state"),
        v8,
        v7,
        v9 == 2))
  {
    v10 = -[HMDUserActivityType6StateEvent initWithState:stateEnd:changedTimestamp:withReason:]([HMDUserActivityType6StateEvent alloc], "initWithState:stateEnd:changedTimestamp:withReason:", 3, 0, 0, 11);
    -[HMDUserActivityType6Detector setPreviousStateEvent:](self, "setPreviousStateEvent:", v10);

LABEL_11:
    -[HMDUserActivityType6Detector previousStateEvent](self, "previousStateEvent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDUserActivityType6Detector updateLatestReportWithReason:](self, "updateLatestReportWithReason:", objc_msgSend(v17, "reason"));

  }
LABEL_12:

}

- (void)stateUpdated
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__HMDUserActivityType6Detector_stateUpdated__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v4, block);

}

- (void)handleBackgroundTaskTimerFired:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMD.BGTM.NK"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDUserActivityType6Detector reportSuppressedTimerIdentifier](self, "reportSuppressedTimerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    -[HMDUserActivityStateDetector dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__HMDUserActivityType6Detector_handleBackgroundTaskTimerFired___block_invoke;
    block[3] = &unk_24E79C240;
    block[4] = self;
    dispatch_async(v9, block);

  }
}

- (HMDUserActivityType6CoreLocationTracker)coreLocationTracker
{
  return self->_coreLocationTracker;
}

- (void)setCoreLocationTracker:(id)a3
{
  objc_storeStrong((id *)&self->_coreLocationTracker, a3);
}

- (HMDUserActivityType6StateEvent)previousStateEvent
{
  return self->_previousStateEvent;
}

- (void)setPreviousStateEvent:(id)a3
{
  objc_storeStrong((id *)&self->_previousStateEvent, a3);
}

- (NSString)reportSuppressedTimerIdentifier
{
  return self->_reportSuppressedTimerIdentifier;
}

- (void)setReportSuppressedTimerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_reportSuppressedTimerIdentifier, a3);
}

- (NSDate)reportSuppressionTimerPreviousStateEnd
{
  return self->_reportSuppressionTimerPreviousStateEnd;
}

- (void)setReportSuppressionTimerPreviousStateEnd:(id)a3
{
  objc_storeStrong((id *)&self->_reportSuppressionTimerPreviousStateEnd, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportSuppressionTimerPreviousStateEnd, 0);
  objc_storeStrong((id *)&self->_reportSuppressedTimerIdentifier, 0);
  objc_storeStrong((id *)&self->_previousStateEvent, 0);
  objc_storeStrong((id *)&self->_coreLocationTracker, 0);
}

uint64_t __63__HMDUserActivityType6Detector_handleBackgroundTaskTimerFired___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateCurrentStateEvent");
}

uint64_t __44__HMDUserActivityType6Detector_stateUpdated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_evaluateCurrentStateEvent");
}

+ (unint64_t)contributorType
{
  return 3;
}

@end
