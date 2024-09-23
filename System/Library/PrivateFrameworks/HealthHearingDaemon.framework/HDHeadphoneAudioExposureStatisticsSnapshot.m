@implementation HDHeadphoneAudioExposureStatisticsSnapshot

- (HDHeadphoneAudioExposureStatisticsSnapshot)initWithStatistics:(id)a3 includesPrunableData:(BOOL)a4 previousNotificationDate:(id)a5
{
  id v10;
  id v11;
  HDHeadphoneAudioExposureStatisticsSnapshot *v12;
  HDHeadphoneAudioExposureStatisticsSnapshot *v13;
  HDHeadphoneAudioExposureStatisticsSnapshot *v14;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDHeadphoneAudioExposureStatisticsBucket.m"), 764, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("statistics"));

  }
  v17.receiver = self;
  v17.super_class = (Class)HDHeadphoneAudioExposureStatisticsSnapshot;
  v12 = -[HDHeadphoneAudioExposureStatisticsSnapshot init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_statistics, a3);
    v13->_includesPrunableData = a4;
    objc_storeStrong((id *)&v13->_previousNotificationDate, a5);
    v14 = v13;
  }

  return v13;
}

- (id)unitTesting_hearingSevenDayDoseCategorySampleWithNow:(id)a3 error:(id *)a4
{
  return (id)-[HKStatistics unitTesting_hearingSevenDayDoseCategorySampleWithNow:includesPrunableData:error:](self->_statistics, "unitTesting_hearingSevenDayDoseCategorySampleWithNow:includesPrunableData:error:", a3, self->_includesPrunableData, a4);
}

- (HKStatistics)statistics
{
  return self->_statistics;
}

- (BOOL)includesPrunableData
{
  return self->_includesPrunableData;
}

- (NSDate)previousNotificationDate
{
  return self->_previousNotificationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousNotificationDate, 0);
  objc_storeStrong((id *)&self->_statistics, 0);
}

@end
