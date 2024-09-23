@implementation CSSimpleLockScreenActionProvider

- (void)invalidateLockScreenActionContext
{
  -[CSSimpleLockScreenActionProvider setLockScreenActionContext:](self, "setLockScreenActionContext:", 0);
}

- (SBFLockScreenActionContext)lockScreenActionContext
{
  return self->_lockScreenActionContext;
}

- (void)setLockScreenActionContext:(id)a3
{
  objc_storeStrong((id *)&self->_lockScreenActionContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockScreenActionContext, 0);
}

@end
