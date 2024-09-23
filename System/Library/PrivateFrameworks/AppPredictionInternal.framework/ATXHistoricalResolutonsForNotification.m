@implementation ATXHistoricalResolutonsForNotification

- (ATXHistoricalResolutonsForNotification)initWithNotification:(id)a3 historicalVolumeByCountAndPercentage:(id)a4 modeConditionedHistoricalVolumeByCountAndPercentage:(id)a5 historicalResolutionByPercentage:(id)a6 modeConditionedHistoricalResolutionByPercentage:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ATXHistoricalResolutonsForNotification *v17;
  ATXHistoricalResolutonsForNotification *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)ATXHistoricalResolutonsForNotification;
  v17 = -[ATXHistoricalResolutonsForNotification init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_userNotification, a3);
    objc_storeStrong((id *)&v18->_historicalVolumeByCountAndPercentage, a4);
    objc_storeStrong((id *)&v18->_modeConditionedHistoricalVolumeByCountAndPercentage, a5);
    objc_storeStrong((id *)&v18->_historicalResolutionByPercentage, a6);
    objc_storeStrong((id *)&v18->_modeConditionedHistoricalResolutionByPercentage, a7);
  }

  return v18;
}

- (ATXUserNotification)userNotification
{
  return self->_userNotification;
}

- (ATXNotificationVolumeByCountAndPercentage)historicalVolumeByCountAndPercentage
{
  return self->_historicalVolumeByCountAndPercentage;
}

- (ATXNotificationVolumeByCountAndPercentage)modeConditionedHistoricalVolumeByCountAndPercentage
{
  return self->_modeConditionedHistoricalVolumeByCountAndPercentage;
}

- (ATXNotificationResolutionByPercentage)historicalResolutionByPercentage
{
  return self->_historicalResolutionByPercentage;
}

- (ATXNotificationResolutionByPercentage)modeConditionedHistoricalResolutionByPercentage
{
  return self->_modeConditionedHistoricalResolutionByPercentage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeConditionedHistoricalResolutionByPercentage, 0);
  objc_storeStrong((id *)&self->_historicalResolutionByPercentage, 0);
  objc_storeStrong((id *)&self->_modeConditionedHistoricalVolumeByCountAndPercentage, 0);
  objc_storeStrong((id *)&self->_historicalVolumeByCountAndPercentage, 0);
  objc_storeStrong((id *)&self->_userNotification, 0);
}

@end
