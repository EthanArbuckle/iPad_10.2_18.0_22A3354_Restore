@implementation CCUIMutableCASpringAnimationParameters

- (void)setMass:(double)a3
{
  self->super._mass = a3;
}

- (void)setStiffness:(double)a3
{
  self->super._stiffness = a3;
}

- (void)setDamping:(double)a3
{
  self->super._damping = a3;
}

- (void)setTimingFunction:(id)a3
{
  CCUIAnimationTimingFunctionDescription *v4;
  CCUIAnimationTimingFunctionDescription *timingFunction;

  v4 = (CCUIAnimationTimingFunctionDescription *)objc_msgSend(a3, "copyWithZone:", 0);
  timingFunction = self->super._timingFunction;
  self->super._timingFunction = v4;

}

- (void)setFrameRateRange:(CAFrameRateRange)a3
{
  self->super._frameRateRange = a3;
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  self->super._highFrameRateReason = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CCUICASpringAnimationParameters _initWithAnimationParameters:]([CCUICASpringAnimationParameters alloc], "_initWithAnimationParameters:", self);
}

@end
