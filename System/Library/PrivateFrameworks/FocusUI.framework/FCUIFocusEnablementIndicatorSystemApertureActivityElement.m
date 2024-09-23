@implementation FCUIFocusEnablementIndicatorSystemApertureActivityElement

- (BOOL)hasActivityBehavior
{
  return 1;
}

- (id)elementIdentifier
{
  return (id)*MEMORY[0x24BEB1010];
}

- (BOOL)hasAlertBehavior
{
  return 0;
}

- (SAActivityHosting)activityHost
{
  return (SAActivityHosting *)objc_loadWeakRetained((id *)&self->_activityHost);
}

- (void)setActivityHost:(id)a3
{
  objc_storeWeak((id *)&self->_activityHost, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activityHost);
}

@end
