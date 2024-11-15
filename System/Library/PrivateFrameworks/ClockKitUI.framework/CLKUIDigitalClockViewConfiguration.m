@implementation CLKUIDigitalClockViewConfiguration

- (UIColor)backgroundTintColor
{
  return self->_backgroundTintColor;
}

- (void)setBackgroundTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundTintColor, a3);
}

- (BOOL)showsSecondTicks
{
  return self->_showsSecondTicks;
}

- (void)setShowsSecondTicks:(BOOL)a3
{
  self->_showsSecondTicks = a3;
}

- (UIColor)activeTickColor
{
  return self->_activeTickColor;
}

- (void)setActiveTickColor:(id)a3
{
  objc_storeStrong((id *)&self->_activeTickColor, a3);
}

- (UIColor)inactiveTickColor
{
  return self->_inactiveTickColor;
}

- (void)setInactiveTickColor:(id)a3
{
  objc_storeStrong((id *)&self->_inactiveTickColor, a3);
}

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forcedNumberSystem, 0);
  objc_storeStrong((id *)&self->_timeLabelColor, 0);
  objc_storeStrong((id *)&self->_timeLabelFont, 0);
  objc_storeStrong((id *)&self->_inactiveTickColor, 0);
  objc_storeStrong((id *)&self->_activeTickColor, 0);
  objc_storeStrong((id *)&self->_backgroundTintColor, 0);
}

@end
