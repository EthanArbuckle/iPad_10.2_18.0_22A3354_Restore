@implementation VSErrorRecoveryOption

- (NSString)localizedAlertButtonTitle
{
  return self->_localizedAlertButtonTitle;
}

- (void)setLocalizedAlertButtonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)attemptHandler
{
  return self->_attemptHandler;
}

- (void)setAttemptHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isDestructive
{
  return self->_destructive;
}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_attemptHandler, 0);
  objc_storeStrong((id *)&self->_localizedAlertButtonTitle, 0);
}

@end
