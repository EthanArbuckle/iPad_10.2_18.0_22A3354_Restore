@implementation NUANFDebugSettingsProvider

- (BOOL)viewportDebuggingEnabled
{
  return self->_viewportDebuggingEnabled;
}

- (BOOL)testingConditionEnabled
{
  return self->_testingConditionEnabled;
}

@end
