@implementation IMCloudKitSyncProgressRuntimeTest

- (void)cloudKitEventNotificationManager:(id)a3 syncProgressDidUpdate:(id)a4
{
  _QWORD v5[5];

  -[IMRuntimeTest testLog:](self, "testLog:", CFSTR("Test got syncState progress: %@"), a4);
  -[IMCloudKitSyncProgressRuntimeTest progressRescheduleDelay](self, "progressRescheduleDelay");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = sub_1A20B8864;
  v5[3] = &unk_1E471E348;
  v5[4] = self;
  -[IMRuntimeTest dispatchAfter:block:](self, "dispatchAfter:block:", v5);
}

- (void)startTest
{
  -[IMRuntimeTest testLog:](self, "testLog:", CFSTR("Starting test"));
  MEMORY[0x1E0DE7D20](self, sel_sendSyncStateChangedEvent);
}

- (id)createSyncStatisticsForMockSyncState:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "IMCloudKitSyncControllerSyncState");
  objc_msgSend(v4, "IMCloudKitSyncControllerSyncRecordType");

  -[IMCloudKitSyncProgressRuntimeTest progressCount](self, "progressCount");
  -[IMCloudKitSyncProgressRuntimeTest maxProgressCount](self, "maxProgressCount");
  return (id)MEMORY[0x1E0DE7D20](IMCloudKitSyncStatistics, sel__createSyncStatisticsDictionaryForSyncControllerSyncState_syncType_count_max_unresolved_);
}

- (void)setUp
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMCloudKitSyncProgressRuntimeTest;
  -[IMCloudKitEventNotificationManagerRuntimeTest setUp](&v3, sel_setUp);
  -[IMCloudKitSyncProgressRuntimeTest setProgressRescheduleDelay:](self, "setProgressRescheduleDelay:", 3.0);
}

- (unint64_t)progressCount
{
  return self->_progressCount;
}

- (void)setProgressCount:(unint64_t)a3
{
  self->_progressCount = a3;
}

- (unint64_t)maxProgressCount
{
  return self->_maxProgressCount;
}

- (void)setMaxProgressCount:(unint64_t)a3
{
  self->_maxProgressCount = a3;
}

- (double)progressRescheduleDelay
{
  return self->_progressRescheduleDelay;
}

- (void)setProgressRescheduleDelay:(double)a3
{
  self->_progressRescheduleDelay = a3;
}

@end
