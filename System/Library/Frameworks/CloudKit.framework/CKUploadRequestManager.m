@implementation CKUploadRequestManager

+ (BOOL)ignoreUploadRequestPushNotifications
{
  return byte_1EDF75368;
}

+ (void)setIgnoreUploadRequestPushNotifications:(BOOL)a3
{
  byte_1EDF75368 = a3;
}

- (double)recurringFetchPeriod
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;

  objc_msgSend_internals(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_internals(self, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recurringFetchPeriod(v9, v10, v11, v12);
    v14 = v13;

  }
  else
  {
    v14 = -1.0;
  }

  return v14;
}

- (double)tryAgainLaterRetryTime
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;

  objc_msgSend_internals(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_internals(self, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tryAgainLaterRetryTime(v9, v10, v11, v12);
    v14 = v13;

  }
  else
  {
    v14 = -1.0;
  }

  return v14;
}

- (double)retryableErrorRetryTime
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;

  objc_msgSend_internals(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_internals(self, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_retryableErrorRetryTime(v9, v10, v11, v12);
    v14 = v13;

  }
  else
  {
    v14 = -1.0;
  }

  return v14;
}

- (double)cancelledErrorRetryTime
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;

  objc_msgSend_internals(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_internals(self, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_cancelledErrorRetryTime(v9, v10, v11, v12);
    v14 = v13;

  }
  else
  {
    v14 = -1.0;
  }

  return v14;
}

- (double)retryableErrorMaxRetryCount
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;

  objc_msgSend_internals(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_internals(self, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_retryableErrorMaxRetryCount(v9, v10, v11, v12);
    v14 = v13;

  }
  else
  {
    v14 = -1.0;
  }

  return v14;
}

- (double)notificationDebouncePeriod
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;

  objc_msgSend_internals(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_internals(self, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_notificationDebouncePeriod(v9, v10, v11, v12);
    v14 = v13;

  }
  else
  {
    v14 = -1.0;
  }

  return v14;
}

- (int64_t)assetRepairSchedulerRepairBatchCountLimit
{
  uint64_t v2;
  uint64_t v3;
  CKUploadRequestManagerInternals *internals;

  internals = self->_internals;
  if (internals)
    return objc_msgSend_assetRepairSchedulerRepairBatchCountLimit(internals, a2, v2, v3);
  else
    return -1;
}

- (double)assetRepairSchedulerDefaultSuspensionTime
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;

  objc_msgSend_internals(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_internals(self, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetRepairSchedulerDefaultSuspensionTime(v9, v10, v11, v12);
    v14 = v13;

  }
  else
  {
    v14 = -1.0;
  }

  return v14;
}

- (int64_t)assetRepairSchedulerRepairRetryCount
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;

  objc_msgSend_internals(self, a2, v2, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend_internals(self, v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_assetRepairSchedulerRepairRetryCount(v9, v10, v11, v12);

  }
  else
  {
    v13 = -1;
  }

  return v13;
}

- (void)setRecurringFetchPeriod:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_internals(self, a2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecurringFetchPeriod_(v9, v6, v7, v8, a3);

}

- (void)setTryAgainLaterRetryTime:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_internals(self, a2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTryAgainLaterRetryTime_(v9, v6, v7, v8, a3);

}

- (void)setRetryableErrorRetryTime:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_internals(self, a2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRetryableErrorRetryTime_(v9, v6, v7, v8, a3);

}

- (void)setCancelledErrorRetryTime:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_internals(self, a2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCancelledErrorRetryTime_(v9, v6, v7, v8, a3);

}

- (void)setRetryableErrorMaxRetryCount:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_internals(self, a2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRetryableErrorMaxRetryCount_(v9, v6, v7, v8, a3);

}

- (void)setNotificationDebouncePeriod:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_internals(self, a2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNotificationDebouncePeriod_(v9, v6, v7, v8, a3);

}

- (void)setAssetRepairSchedulerRepairBatchCountLimit:(int64_t)a3
{
  ((void (*)(CKUploadRequestManagerInternals *, char *, int64_t))MEMORY[0x1E0DE7D20])(self->_internals, sel_setAssetRepairSchedulerRepairBatchCountLimit_, a3);
}

- (void)setAssetRepairSchedulerDefaultSuspensionTime:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend_internals(self, a2, v3, v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAssetRepairSchedulerDefaultSuspensionTime_(v9, v6, v7, v8, a3);

}

- (void)setAssetRepairSchedulerRepairRetryCount:(int64_t)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  id v7;

  objc_msgSend_internals(self, a2, a3, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAssetRepairSchedulerRepairRetryCount_(v7, v5, a3, v6);

}

+ (id)activityIdentifierForSchedulingRepairsInContainer:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;

  objc_msgSend_containerID(a3, a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_containerIdentifier(v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_environment(v4, v10, v11, v12);
  CKContainerEnvironmentString(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v15, (uint64_t)CFSTR("%@.%@.%@"), v16, CFSTR("com.apple.cloudkit.uploadrequest.repair"), v9, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)dealloc
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  objc_super v7;

  objc_msgSend_setAssetRequestCallback_(self->_internals, a2, 0, v2);
  objc_msgSend_setPackageRequestCallback_(self->_internals, v4, 0, v5);
  objc_msgSend_dispatchEvent_synchronously_(self->_internals, v6, 1, 1);
  v7.receiver = self;
  v7.super_class = (Class)CKUploadRequestManager;
  -[CKUploadRequestManager dealloc](&v7, sel_dealloc);
}

- (CKUploadRequestManager)initWithContainer:(id)a3 repairContainerOverrides:(id)a4
{
  id v6;
  id v7;
  CKUploadRequestManager *v8;
  CKUploadRequestManagerInternals *v9;
  const char *v10;
  uint64_t v11;
  CKUploadRequestManagerInternals *internals;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CKUploadRequestManager;
  v8 = -[CKUploadRequestManager init](&v14, sel_init);
  if (v8)
  {
    v9 = [CKUploadRequestManagerInternals alloc];
    v11 = objc_msgSend_initWithContainer_repairContainerOverrides_(v9, v10, (uint64_t)v6, (uint64_t)v7);
    internals = v8->_internals;
    v8->_internals = (CKUploadRequestManagerInternals *)v11;

  }
  return v8;
}

- (CKUploadRequestManager)initWithContainer:(id)a3 repairContainerOverrides:(id)a4 ignoringSystemConditions:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  CKUploadRequestManager *v10;
  CKUploadRequestManagerInternals *v11;
  const char *v12;
  uint64_t v13;
  CKUploadRequestManagerInternals *internals;
  objc_super v16;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CKUploadRequestManager;
  v10 = -[CKUploadRequestManager init](&v16, sel_init);
  if (v10)
  {
    v11 = [CKUploadRequestManagerInternals alloc];
    v13 = objc_msgSend_initWithContainer_repairContainerOverrides_ignoringSystemConditions_(v11, v12, (uint64_t)v8, (uint64_t)v9, v5);
    internals = v10->_internals;
    v10->_internals = (CKUploadRequestManagerInternals *)v13;

  }
  return v10;
}

- (id)assetRequestCallback
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_internals(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetRequestCallback(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setAssetRequestCallback:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_internals(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAssetRequestCallback_(v10, v8, (uint64_t)v4, v9);

}

- (id)packageRequestCallback
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_internals(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_packageRequestCallback(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setPackageRequestCallback:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_internals(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPackageRequestCallback_(v10, v8, (uint64_t)v4, v9);

}

- (NSString)machServiceName
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_internals(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_machServiceName(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)setMachServiceName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  objc_msgSend_internals(self, v5, v6, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMachServiceName_(v10, v8, (uint64_t)v4, v9);

}

- (NSString)activityIdentifierForSchedulingRepairs
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_internals(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activityIdentifierForSchedulingRepairs(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (CKSyncEngine)repairZoneSyncEngine
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_internals(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_repairZoneSyncEngine(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKSyncEngine *)v8;
}

- (CKContainer)repairContainer
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_internals(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_repairContainer(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKContainer *)v8;
}

- (CKUploadRequestPersistentStore)database
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_internals(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_database(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKUploadRequestPersistentStore *)v8;
}

- (void)registerForItemRequests
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  os_activity_scope_state_s v9;

  v3 = _os_activity_create(&dword_18A5C5000, "client/data-repair-register", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v3, &v9);
  objc_msgSend_internals(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dispatchEvent_synchronously_(v7, v8, 0, 0);

  os_activity_scope_leave(&v9);
}

- (void)unregister
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  os_activity_scope_state_s v9;

  v3 = _os_activity_create(&dword_18A5C5000, "client/data-repair-unregister", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v3, &v9);
  objc_msgSend_internals(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dispatchEvent_synchronously_(v7, v8, 2, 1);

  os_activity_scope_leave(&v9);
}

- (void)manuallyTriggerUploadRequests
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  os_activity_scope_state_s v11;

  v3 = _os_activity_create(&dword_18A5C5000, "client/data-repair-manually-trigger", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v3, &v11);
  objc_msgSend_internals(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_manuallyTriggerUploadRequests(v7, v8, v9, v10);

  os_activity_scope_leave(&v11);
}

- (void)fetchServerChanges:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  os_activity_scope_state_s v12;

  v4 = a3;
  v5 = _os_activity_create(&dword_18A5C5000, "client/data-repair-fetch-changes", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v5, &v12);
  objc_msgSend_internals(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fetchServerChanges_(v9, v10, (uint64_t)v4, v11);

  os_activity_scope_leave(&v12);
}

- (void)scheduleOrInvokeRepairsNow
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend_internals(self, a2, v2, v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_scheduleOrInvokeRepairsNow(v7, v4, v5, v6);

}

- (void)cancelAllOperations
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  os_activity_scope_state_s v9;

  v3 = _os_activity_create(&dword_18A5C5000, "client/data-repair-cancel", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v9.opaque[0] = 0;
  v9.opaque[1] = 0;
  os_activity_scope_enter(v3, &v9);
  objc_msgSend_internals(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dispatchEvent_synchronously_(v7, v8, 3, 0);

  os_activity_scope_leave(&v9);
}

- (void)setCallback:(id)a3 forOverridePoint:(int64_t)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  id v11;

  v6 = a3;
  objc_msgSend_internals(self, v7, v8, v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCallback_forOverridePoint_(v11, v10, (uint64_t)v6, a4);

}

- (CKUploadRequestManagerResponseActionThrottler)responseActionThrottler
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_internals(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_responseActionThrottler(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKUploadRequestManagerResponseActionThrottler *)v8;
}

- (CKUploadRequestManagerInternals)internals
{
  return self->_internals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internals, 0);
}

@end
