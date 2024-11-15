@implementation JFXCompositionPlayerViewControllerAnimationProperties

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (BOOL)shouldScale
{
  return self->_shouldScale;
}

- (void)setShouldScale:(BOOL)a3
{
  self->_shouldScale = a3;
}

- (UITimingCurveProvider)timingParameters
{
  return self->_timingParameters;
}

- (void)setTimingParameters:(id)a3
{
  objc_storeStrong((id *)&self->_timingParameters, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingParameters, 0);
}

@end
