@implementation CRKMockSettingsUIVisibilityProvider

- (NSString)paneStatus
{
  return (NSString *)CFSTR("MockStatus");
}

- (BOOL)settingsUIVisible
{
  return self->_settingsUIVisible;
}

- (void)setSettingsUIVisible:(BOOL)a3
{
  self->_settingsUIVisible = a3;
}

@end
