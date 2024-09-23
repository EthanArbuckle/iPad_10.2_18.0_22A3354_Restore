@implementation HMDAnalyticsTriggerEventData

- (HMDAnalyticsCalendarEventData)calendarEvent
{
  return self->_calendarEvent;
}

- (void)setCalendarEvent:(id)a3
{
  objc_storeStrong((id *)&self->_calendarEvent, a3);
}

- (HMDAnalyticsCharacteristicEventData)charEvent
{
  return self->_charEvent;
}

- (void)setCharEvent:(id)a3
{
  objc_storeStrong((id *)&self->_charEvent, a3);
}

- (HMDAnalyticsCharacteristicThresholdEventData)charThresholdEvent
{
  return self->_charThresholdEvent;
}

- (void)setCharThresholdEvent:(id)a3
{
  objc_storeStrong((id *)&self->_charThresholdEvent, a3);
}

- (HMDAnalyticsDurationEventData)durationEvent
{
  return self->_durationEvent;
}

- (void)setDurationEvent:(id)a3
{
  objc_storeStrong((id *)&self->_durationEvent, a3);
}

- (HMDAnalyticsLocationEventData)locationEvent
{
  return self->_locationEvent;
}

- (void)setLocationEvent:(id)a3
{
  objc_storeStrong((id *)&self->_locationEvent, a3);
}

- (HMDAnalyticsPresenceEventData)presenceEvent
{
  return self->_presenceEvent;
}

- (void)setPresenceEvent:(id)a3
{
  objc_storeStrong((id *)&self->_presenceEvent, a3);
}

- (HMDAnalyticsSignificantTimeEventData)significantTimeEvent
{
  return self->_significantTimeEvent;
}

- (void)setSignificantTimeEvent:(id)a3
{
  objc_storeStrong((id *)&self->_significantTimeEvent, a3);
}

- (HMDAnalyticsCharacteristicThresholdEventData)thresholdEvent
{
  return self->_thresholdEvent;
}

- (void)setThresholdEvent:(id)a3
{
  objc_storeStrong((id *)&self->_thresholdEvent, a3);
}

- (BOOL)endEvent
{
  return self->_endEvent;
}

- (void)setEndEvent:(BOOL)a3
{
  self->_endEvent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thresholdEvent, 0);
  objc_storeStrong((id *)&self->_significantTimeEvent, 0);
  objc_storeStrong((id *)&self->_presenceEvent, 0);
  objc_storeStrong((id *)&self->_locationEvent, 0);
  objc_storeStrong((id *)&self->_durationEvent, 0);
  objc_storeStrong((id *)&self->_charThresholdEvent, 0);
  objc_storeStrong((id *)&self->_charEvent, 0);
  objc_storeStrong((id *)&self->_calendarEvent, 0);
}

@end
