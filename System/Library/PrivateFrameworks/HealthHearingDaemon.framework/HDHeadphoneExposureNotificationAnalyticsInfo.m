@implementation HDHeadphoneExposureNotificationAnalyticsInfo

- (HDHeadphoneExposureNotificationAnalyticsInfo)initWithLastLockDate:(id)a3 lastNotificationDate:(id)a4
{
  id v7;
  id v8;
  HDHeadphoneExposureNotificationAnalyticsInfo *v9;
  HDHeadphoneExposureNotificationAnalyticsInfo *v10;
  HDHeadphoneExposureNotificationAnalyticsInfo *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDHeadphoneExposureNotificationAnalyticsInfo;
  v9 = -[HDHeadphoneExposureNotificationAnalyticsInfo init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lastLockDate, a3);
    objc_storeStrong((id *)&v10->_lastNotificationDate, a4);
    v11 = v10;
  }

  return v10;
}

- (id)boundedIntegerForMinutesSinceLastUnlockWithNowDate:(id)a3
{
  NSDate *lastLockDate;
  void *v4;

  lastLockDate = self->_lastLockDate;
  if (lastLockDate)
  {
    objc_msgSend(a3, "timeIntervalSinceDate:", lastLockDate);
    +[HDAudioAnalyticsUtilities boundedIntegerForLockedDuration:](HDAudioAnalyticsUtilities, "boundedIntegerForLockedDuration:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &unk_24DC668C8;
  }
  return v4;
}

- (id)boundedIntegerForTimeSinceLastNotificationWithNowDate:(id)a3
{
  NSDate *lastNotificationDate;
  void *v4;

  lastNotificationDate = self->_lastNotificationDate;
  if (lastNotificationDate)
  {
    objc_msgSend(a3, "timeIntervalSinceDate:", lastNotificationDate);
    +[HDAudioAnalyticsUtilities boundedIntegerForTimeSinceLastNotification:](HDAudioAnalyticsUtilities, "boundedIntegerForTimeSinceLastNotification:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &unk_24DC668C8;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastNotificationDate, 0);
  objc_storeStrong((id *)&self->_lastLockDate, 0);
}

@end
