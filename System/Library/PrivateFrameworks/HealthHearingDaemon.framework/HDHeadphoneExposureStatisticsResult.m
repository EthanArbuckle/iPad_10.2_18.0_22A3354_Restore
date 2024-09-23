@implementation HDHeadphoneExposureStatisticsResult

+ (id)resultForAppendedSamplesDuringStartup
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithCache:eligbleForUserNotification:prunedCount:", 0, 0, 0);
}

+ (HDHeadphoneExposureStatisticsResult)resultWithCache:(id)a3 prunedCount:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithCache:eligbleForUserNotification:prunedCount:", v7, 0, v6);

  return (HDHeadphoneExposureStatisticsResult *)v8;
}

+ (HDHeadphoneExposureStatisticsResult)resultWithCache:(id)a3 eligbleForUserNotification:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v10;

  v4 = a4;
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDHeadphoneExposureStatisticsResult.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cache"));

  }
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithCache:eligbleForUserNotification:prunedCount:", v7, v4, 0);

  return (HDHeadphoneExposureStatisticsResult *)v8;
}

- (id)copyWithEligbleForUserNotificationOverride:(BOOL)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithCache:eligbleForUserNotification:prunedCount:", self->_cache, a3, self->_prunedCount);
}

- (id)_initWithCache:(id)a3 eligbleForUserNotification:(BOOL)a4 prunedCount:(id)a5
{
  id v9;
  id v10;
  HDHeadphoneExposureStatisticsResult *v11;
  HDHeadphoneExposureStatisticsResult *v12;
  HDHeadphoneExposureStatisticsResult *v13;
  objc_super v15;

  v9 = a3;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HDHeadphoneExposureStatisticsResult;
  v11 = -[HDHeadphoneExposureStatisticsResult init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_cache, a3);
    v12->_eligbleForUserNotification = a4;
    objc_storeStrong((id *)&v12->_prunedCount, a5);
    v13 = v12;
  }

  return v12;
}

- (HDHeadphoneAudioExposureBucketCollection)cache
{
  return self->_cache;
}

- (BOOL)eligbleForUserNotification
{
  return self->_eligbleForUserNotification;
}

- (NSNumber)prunedCount
{
  return self->_prunedCount;
}

- (BOOL)needsRebuildOnNextUnlock
{
  return self->_needsRebuildOnNextUnlock;
}

- (void)setNeedsRebuildOnNextUnlock:(BOOL)a3
{
  self->_needsRebuildOnNextUnlock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prunedCount, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
