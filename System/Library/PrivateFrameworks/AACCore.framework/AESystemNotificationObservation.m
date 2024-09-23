@implementation AESystemNotificationObservation

- (AESystemNotificationObservation)initWithNotificationName:(id)a3 queue:(id)a4 notificationHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  AESystemNotificationObservation *v11;
  uint64_t v12;
  NSString *notificationName;
  uint64_t v14;
  id notificationHandler;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AESystemNotificationObservation;
  v11 = -[AESystemNotificationObservation init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    notificationName = v11->_notificationName;
    v11->_notificationName = (NSString *)v12;

    objc_storeStrong((id *)&v11->_queue, a4);
    v14 = MEMORY[0x22E329CEC](v10);
    notificationHandler = v11->_notificationHandler;
    v11->_notificationHandler = (id)v14;

  }
  return v11;
}

+ (id)observationWithNotificationName:(id)a3 queue:(id)a4 notificationHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  AESystemNotificationObservation *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[AESystemNotificationObservation initWithNotificationName:queue:notificationHandler:]([AESystemNotificationObservation alloc], "initWithNotificationName:queue:notificationHandler:", v9, v8, v7);

  -[AESystemNotificationObservation beginObserving](v10, "beginObserving");
  return v10;
}

- (void)invalidate
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  -[AESystemNotificationObservation notificationName](self, "notificationName");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);

  -[AESystemNotificationObservation setNotificationHandler:](self, "setNotificationHandler:", 0);
}

- (void)beginObserving
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  -[AESystemNotificationObservation notificationName](self, "notificationName");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)AESystemNotificationDidFire, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

}

- (void)fire
{
  NSObject *v3;
  _QWORD block[5];

  -[AESystemNotificationObservation queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__AESystemNotificationObservation_fire__block_invoke;
  block[3] = &unk_24FA21E08;
  block[4] = self;
  dispatch_async(v3, block);

}

void __39__AESystemNotificationObservation_fire__block_invoke(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "notificationHandler");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

- (NSString)notificationName
{
  return self->_notificationName;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)notificationHandler
{
  return self->_notificationHandler;
}

- (void)setNotificationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);
}

@end
