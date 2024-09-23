@implementation CLKUIStackedDigitalTimeViewConfiguration

- (UIFont)timeLabelFont
{
  return self->_timeLabelFont;
}

- (void)setTimeLabelFont:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabelFont, a3);
}

- (UIColor)timeLabelColor
{
  return self->_timeLabelColor;
}

- (void)setTimeLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_timeLabelColor, a3);
}

- (NSNumber)forcedNumberSystem
{
  return self->_forcedNumberSystem;
}

- (void)setForcedNumberSystem:(id)a3
{
  objc_storeStrong((id *)&self->_forcedNumberSystem, a3);
}

- (NSDictionary)minuteTimeLabelAttributes
{
  return self->_minuteTimeLabelAttributes;
}

- (void)setMinuteTimeLabelAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_minuteTimeLabelAttributes, a3);
}

- (NSDictionary)hourTimeLabelAttributes
{
  return self->_hourTimeLabelAttributes;
}

- (void)setHourTimeLabelAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_hourTimeLabelAttributes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hourTimeLabelAttributes, 0);
  objc_storeStrong((id *)&self->_minuteTimeLabelAttributes, 0);
  objc_storeStrong((id *)&self->_forcedNumberSystem, 0);
  objc_storeStrong((id *)&self->_timeLabelColor, 0);
  objc_storeStrong((id *)&self->_timeLabelFont, 0);
}

@end
