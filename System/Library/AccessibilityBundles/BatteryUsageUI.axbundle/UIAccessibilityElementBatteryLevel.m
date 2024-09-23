@implementation UIAccessibilityElementBatteryLevel

- (double)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(double)a3
{
  self->_batteryLevel = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

@end
