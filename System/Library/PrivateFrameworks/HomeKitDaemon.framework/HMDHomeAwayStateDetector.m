@implementation HMDHomeAwayStateDetector

- (HMDHomeAwayStateDetector)init
{
  HMDHomeAwayStateDetector *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDHomeAwayStateDetector;
  result = -[HMDHomeAwayStateDetector init](&v3, sel_init);
  if (result)
    result->_state = 0;
  return result;
}

- (void)configureWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDHomeAwayStateDetector _registerForNotifications](self, "_registerForNotifications");
  -[HMDHomeAwayStateDetector determineStateWithReason:](self, "determineStateWithReason:", 1);
  v8 = _Block_copy(v4);

  v7 = v8;
  if (v8)
  {
    (*((void (**)(id))v8 + 2))(v8);
    v7 = v8;
  }

}

- (void)_registerForNotifications
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_handleHomeLocationChanged_, CFSTR("HMDHomeLocationChangedNotification"), v8);

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notificationCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_handleLocationAuthorizationChanged_, CFSTR("HMDLocationAuthorizationChangedNotification"), 0);

}

- (void)updateState:(unint64_t)a3 withReason:(unint64_t)a4
{
  void *v7;
  NSObject *v8;
  unint64_t v9;
  unint64_t v10;

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (-[HMDHomeAwayStateDetector state](self, "state") != a3)
  {
    v9 = -[HMDHomeAwayStateDetector state](self, "state");
    -[HMDHomeAwayStateDetector setState:](self, "setState:", a3);
    if (v9)
      v10 = a4;
    else
      v10 = 1;
    -[HMDHomeAwayStateDetector updateLatestReportWithReason:](self, "updateLatestReportWithReason:", v10);
  }
}

- (void)determineStateWithReason:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "locationAuthorized");

  if (v9)
  {
    -[HMDUserActivityStateDetector dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "locationAuthorized");

    if (v12 != 1)
    {
      v16 = 1;
      goto LABEL_7;
    }
    -[HMDUserActivityStateDetector dataSource](self, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "home");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "homeLocation");

    if ((unint64_t)(v15 - 1) <= 2)
    {
      v16 = qword_2226A0F68[v15 - 1];
LABEL_7:
      -[HMDHomeAwayStateDetector updateState:withReason:](self, "updateState:withReason:", v16, a3);
    }
  }
}

- (void)updateLatestReportWithReason:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  HMDUserActivityHomeAwayReport *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDUserActivityHomeAwayReport *v11;

  -[HMDUserActivityStateDetector dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (-[HMDHomeAwayStateDetector state](self, "state"))
  {
    if (-[HMDHomeAwayStateDetector state](self, "state") == 1)
    {
      -[HMDUserActivityStateDetector setLatestReport:](self, "setLatestReport:", 0);
    }
    else
    {
      v7 = [HMDUserActivityHomeAwayReport alloc];
      -[HMDUserActivityStateDetector dataSource](self, "dataSource");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "home");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentUser");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[HMDUserActivityHomeAwayReport initWithUser:state:fromDevice:reason:](v7, "initWithUser:state:fromDevice:reason:", v10, -[HMDHomeAwayStateDetector state](self, "state"), 0, a3);
      -[HMDUserActivityStateDetector setLatestReport:](self, "setLatestReport:", v11);

    }
    -[HMDUserActivityStateDetector notifyDetectorStateChangedWithReason:](self, "notifyDetectorStateChangedWithReason:", a3);
  }
}

- (void)handleHomeLocationChanged:(id)a3
{
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  -[HMDUserActivityStateDetector dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__HMDHomeAwayStateDetector_handleHomeLocationChanged___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v5, block);

}

- (void)handleLocationAuthorizationChanged:(id)a3
{
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  -[HMDUserActivityStateDetector dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__HMDHomeAwayStateDetector_handleLocationAuthorizationChanged___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v5, block);

}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

uint64_t __63__HMDHomeAwayStateDetector_handleLocationAuthorizationChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "determineStateWithReason:", 4);
}

uint64_t __54__HMDHomeAwayStateDetector_handleHomeLocationChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "determineStateWithReason:", 11);
}

+ (unint64_t)contributorType
{
  return 1;
}

@end
