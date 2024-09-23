@implementation FBWatchdogTransitionContext

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  FBWatchdogTransitionContext *v4;

  v4 = objc_alloc_init(FBWatchdogTransitionContext);
  -[FBWatchdogTransitionContext setWatchdogBehavior:](v4, "setWatchdogBehavior:", self->_watchdogBehavior);
  -[FBWatchdogTransitionContext setWatchdogProvider:](v4, "setWatchdogProvider:", self->_watchdogProvider);
  -[FBWatchdogTransitionContext setRunIndependently:](v4, "setRunIndependently:", self->_runIndependently);
  return v4;
}

- (int64_t)watchdogBehavior
{
  return self->_watchdogBehavior;
}

- (void)setWatchdogBehavior:(int64_t)a3
{
  self->_watchdogBehavior = a3;
}

- (FBProcessWatchdogProviding)watchdogProvider
{
  return self->_watchdogProvider;
}

- (void)setWatchdogProvider:(id)a3
{
  objc_storeStrong((id *)&self->_watchdogProvider, a3);
}

- (BOOL)runIndependently
{
  return self->_runIndependently;
}

- (void)setRunIndependently:(BOOL)a3
{
  self->_runIndependently = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchdogProvider, 0);
}

@end
