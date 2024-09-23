@implementation CLKUIAnalogTimeViewConfiguration

- (UIColor)backgroundTintColor
{
  return self->_backgroundTintColor;
}

- (void)setBackgroundTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundTintColor, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIView)inactiveBackgroundView
{
  return self->_inactiveBackgroundView;
}

- (void)setInactiveBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_inactiveBackgroundView, a3);
}

- (BOOL)showsDialTicks
{
  return self->_showsDialTicks;
}

- (void)setShowsDialTicks:(BOOL)a3
{
  self->_showsDialTicks = a3;
}

- (UIColor)majorTickColor
{
  return self->_majorTickColor;
}

- (void)setMajorTickColor:(id)a3
{
  objc_storeStrong((id *)&self->_majorTickColor, a3);
}

- (UIColor)inactiveMajorTickColor
{
  return self->_inactiveMajorTickColor;
}

- (void)setInactiveMajorTickColor:(id)a3
{
  objc_storeStrong((id *)&self->_inactiveMajorTickColor, a3);
}

- (BOOL)secondHandDisabled
{
  return self->_secondHandDisabled;
}

- (void)setSecondHandDisabled:(BOOL)a3
{
  self->_secondHandDisabled = a3;
}

- (UIColor)secondHandColor
{
  return self->_secondHandColor;
}

- (void)setSecondHandColor:(id)a3
{
  objc_storeStrong((id *)&self->_secondHandColor, a3);
}

- (UIColor)hourMinuteHandOutlineColor
{
  return self->_hourMinuteHandOutlineColor;
}

- (void)setHourMinuteHandOutlineColor:(id)a3
{
  objc_storeStrong((id *)&self->_hourMinuteHandOutlineColor, a3);
}

- (UIColor)inactiveHourMinuteHandOutlineColor
{
  return self->_inactiveHourMinuteHandOutlineColor;
}

- (void)setInactiveHourMinuteHandOutlineColor:(id)a3
{
  objc_storeStrong((id *)&self->_inactiveHourMinuteHandOutlineColor, a3);
}

- (UIColor)hourMinuteHandInlayColor
{
  return self->_hourMinuteHandInlayColor;
}

- (void)setHourMinuteHandInlayColor:(id)a3
{
  objc_storeStrong((id *)&self->_hourMinuteHandInlayColor, a3);
}

- (UIColor)inactiveHourMinuteHandInlayColor
{
  return self->_inactiveHourMinuteHandInlayColor;
}

- (void)setInactiveHourMinuteHandInlayColor:(id)a3
{
  objc_storeStrong((id *)&self->_inactiveHourMinuteHandInlayColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveHourMinuteHandInlayColor, 0);
  objc_storeStrong((id *)&self->_hourMinuteHandInlayColor, 0);
  objc_storeStrong((id *)&self->_inactiveHourMinuteHandOutlineColor, 0);
  objc_storeStrong((id *)&self->_hourMinuteHandOutlineColor, 0);
  objc_storeStrong((id *)&self->_secondHandColor, 0);
  objc_storeStrong((id *)&self->_inactiveMajorTickColor, 0);
  objc_storeStrong((id *)&self->_majorTickColor, 0);
  objc_storeStrong((id *)&self->_inactiveBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundTintColor, 0);
}

@end
