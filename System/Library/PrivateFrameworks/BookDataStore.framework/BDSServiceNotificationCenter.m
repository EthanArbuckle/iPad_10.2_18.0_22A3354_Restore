@implementation BDSServiceNotificationCenter

- (void)startMonitoring
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (BDSXPCNotificationsEnabled())
    MEMORY[0x24BEDD108](self, sel__startMonitoring, v3, v4, v5);
}

- (BOOL)shouldMonitor
{
  return self->_shouldMonitor;
}

- (void)setShouldMonitor:(BOOL)a3
{
  self->_shouldMonitor = a3;
}

- (void)setChangeTokenObject:(id)a3
{
  objc_storeStrong((id *)&self->_changeTokenObject, a3);
}

- (BDSServiceProxy)serviceProxy
{
  return self->_serviceProxy;
}

- (void)serviceConnectionDidResume
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (objc_msgSend_shouldMonitor(self, a2, v2, v3, v4))
    MEMORY[0x24BEDD108](self, sel__startMonitoringServiceNotifications, v6, v7, v8);
}

- (void)q_startMonitoringServiceNotifications
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  id v13;

  objc_msgSend_serviceProxy(self, a2, v2, v3, v4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_changeTokenObject(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_monitorServiceNotificationsWithChangeToken_completion_(v13, v11, (uint64_t)v10, (uint64_t)&unk_24F08A630, v12);

}

- (BDSServiceNotificationCenter)init
{
  BDSServiceNotificationCenter *v2;
  BDSServiceNotificationCenter *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *dispatchQueue;
  BDSServiceProxy *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BDSServiceProxy *serviceProxy;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BDSServiceNotificationCenter;
  v2 = -[BDSServiceNotificationCenter init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_changeTokenLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("BDSServiceNotificationCenter.dispatchQueue", v4);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = [BDSServiceProxy alloc];
    v11 = objc_msgSend_initWithConnectionDelegate_(v7, v8, (uint64_t)v3, v9, v10);
    serviceProxy = v3->_serviceProxy;
    v3->_serviceProxy = (BDSServiceProxy *)v11;

  }
  return v3;
}

- (void)handleServiceNotificationNames:(id)a3 latestChangeToken:(int64_t)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  int v14;
  id v15;
  __int16 v16;
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  BDSServiceXPCNotificationLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543618;
    v15 = v6;
    v16 = 2048;
    v17 = a4;
    _os_log_impl(&dword_227D4F000, v7, OS_LOG_TYPE_DEFAULT, "handleServiceNotificationNames: %{public}@, latestChangeToken:%ld", (uint8_t *)&v14, 0x16u);
  }

  objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v8, a4, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__postServiceNotificationNames_andUpdateChangeToken_(self, v12, (uint64_t)v6, (uint64_t)v11, v13);

}

- (NSNumber)changeTokenObject
{
  return self->_changeTokenObject;
}

- (void)_updateChangeToken:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->_changeTokenLock);
  if (v7)
    objc_msgSend_setChangeTokenObject_(self, v4, (uint64_t)v7, v5, v6);
  os_unfair_lock_unlock(&self->_changeTokenLock);

}

- (void)_startMonitoring
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend_setShouldMonitor_(self, a2, 1, v2, v3);
  MEMORY[0x24BEDD108](self, sel__startMonitoringServiceNotifications, v5, v6, v7);
}

- (void)_startMonitoringServiceNotifications
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_227D69B08;
  block[3] = &unk_24F08A3E0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_postServiceNotificationNames:(id)a3 andUpdateChangeToken:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v9)
  {
    v14 = v9;
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v6);
        v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v16);
        objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v10, v11, v12, v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_postNotificationName_object_(v18, v19, v17, 0, v20);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v10, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v14);
  }
  objc_msgSend__updateChangeToken_(self, v10, (uint64_t)v7, v12, v13);

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_227D69DC8;
  block[3] = &unk_24F08A610;
  block[4] = a1;
  if (qword_253F3C660 != -1)
    dispatch_once(&qword_253F3C660, block);
  return (id)qword_253F3C610;
}

- (void)serviceDidRestart
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (objc_msgSend_shouldMonitor(self, a2, v2, v3, v4))
    MEMORY[0x24BEDD108](self, sel__startMonitoringServiceNotifications, v6, v7, v8);
}

- (void)setServiceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_changeTokenObject, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
