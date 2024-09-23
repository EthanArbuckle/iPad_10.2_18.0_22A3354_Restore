@implementation GKAppLevelSignInVisibilityData

- (BOOL)appLevelFullscreenDisabled
{
  return self->_appLevelFullscreenDisabled;
}

- (void)setAppLevelFullscreenDisabled:(BOOL)a3
{
  self->_appLevelFullscreenDisabled = a3;
}

- (BOOL)appLevelBannerDisabled
{
  return self->_appLevelBannerDisabled;
}

- (void)setAppLevelBannerDisabled:(BOOL)a3
{
  self->_appLevelBannerDisabled = a3;
}

- (BOOL)processLevelPromptDisabled
{
  return self->_processLevelPromptDisabled;
}

- (void)setProcessLevelPromptDisabled:(BOOL)a3
{
  self->_processLevelPromptDisabled = a3;
}

@end
