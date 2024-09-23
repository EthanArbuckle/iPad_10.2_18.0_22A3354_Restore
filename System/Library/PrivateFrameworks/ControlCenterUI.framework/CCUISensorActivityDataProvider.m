@implementation CCUISensorActivityDataProvider

- (void)setMostRecentSensorActivityData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentSensorActivityData, 0);
  objc_storeStrong((id *)&self->_inactiveSensorActivityDataEligibleForMicModeSelection, 0);
  objc_storeStrong((id *)&self->_activeSensorActivityData, 0);
}

- (NSSet)activeSensorActivityData
{
  return self->_activeSensorActivityData;
}

- (CCUISensorActivityData)mostRecentSensorActivityData
{
  return self->_mostRecentSensorActivityData;
}

- (void)setActiveSensorActivityData:(id)a3
{
  objc_storeStrong((id *)&self->_activeSensorActivityData, a3);
}

- (CCUISensorActivityData)inactiveSensorActivityDataEligibleForMicModeSelection
{
  return self->_inactiveSensorActivityDataEligibleForMicModeSelection;
}

- (void)setInactiveSensorActivityDataEligibleForMicModeSelection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
