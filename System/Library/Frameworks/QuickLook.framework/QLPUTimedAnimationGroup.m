@implementation QLPUTimedAnimationGroup

- (QLPUTimedAnimationGroup)init
{
  QLPUTimedAnimationGroup *v2;
  QLPUTimedAnimationGroup *v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLPUTimedAnimationGroup;
  v2 = -[QLPUTimedAnimationGroup init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[QLPUTimedAnimationGroup currentTime](v2, "currentTime");
    v3->_beginTime = v4;
  }
  return v3;
}

- (double)elapsedTime
{
  double v4;
  double v5;
  double v6;

  if (-[QLPUAnimationGroup isPaused](self, "isPaused"))
    return self->_pausedElapsedTime;
  -[QLPUTimedAnimationGroup currentTime](self, "currentTime");
  v5 = v4;
  -[QLPUTimedAnimationGroup beginTime](self, "beginTime");
  return v5 - v6;
}

- (void)setElapsedTime:(double)a3
{
  if (self->_pausedElapsedTime != a3)
  {
    self->_pausedElapsedTime = a3;
    -[QLPUTimedAnimationGroup _update](self, "_update");
  }
}

- (void)pauseAnimations
{
  double v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLPUTimedAnimationGroup;
  -[QLPUAnimationGroup pauseAnimations](&v6, sel_pauseAnimations);
  -[QLPUTimedAnimationGroup currentTime](self, "currentTime");
  v4 = v3;
  -[QLPUTimedAnimationGroup beginTime](self, "beginTime");
  self->_pausedElapsedTime = v4 - v5;
  -[QLPUTimedAnimationGroup _update](self, "_update");
}

- (void)resumeAnimations
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QLPUTimedAnimationGroup;
  -[QLPUAnimationGroup resumeAnimations](&v4, sel_resumeAnimations);
  -[QLPUTimedAnimationGroup currentTime](self, "currentTime");
  self->_beginTime = v3 - self->_pausedElapsedTime;
  -[QLPUTimedAnimationGroup _update](self, "_update");
}

- (double)currentTime
{
  double result;

  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  return result;
}

- (void)_update
{
  _BOOL4 v3;
  BOOL v4;

  v3 = -[QLPUAnimationGroup isPaused](self, "isPaused");
  v4 = v3;
  if (self->_areAnimationsPaused != v3 || -[QLPUAnimationGroup isPaused](self, "isPaused"))
  {
    self->_areAnimationsPaused = v4;
    -[QLPUTimedAnimationGroup updateAnimations](self, "updateAnimations");
    -[QLPUAnimationGroup completeIfNeeded](self, "completeIfNeeded");
  }
}

- (double)beginTime
{
  return self->_beginTime;
}

- (void)setBeginTime:(double)a3
{
  self->_beginTime = a3;
}

@end
