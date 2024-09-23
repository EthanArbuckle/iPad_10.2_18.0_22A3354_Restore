@implementation CHMockFeatureFlags

- (BOOL)increaseCallHistoryEnabled
{
  return self->_mockIncreaseCallHistoryEnabled;
}

- (void)setMockIncreaseCallHistoryEnabled:(BOOL)a3
{
  self->_mockIncreaseCallHistoryEnabled = a3;
}

- (BOOL)callHistorySearchEnabled
{
  return self->_mockCallHistorySearchEnabled;
}

- (void)setMockCallHistorySearchEnabled:(BOOL)a3
{
  self->_mockCallHistorySearchEnabled = a3;
}

- (BOOL)protectedAppsEnabled
{
  return self->_mockProtectedAppsEnabled;
}

- (void)setMockProtectedAppsEnabled:(BOOL)a3
{
  self->_mockProtectedAppsEnabled = a3;
}

@end
