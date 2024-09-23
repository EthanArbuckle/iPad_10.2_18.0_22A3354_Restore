@implementation ASDTPMEnabler

- (ASDTPMEnabler)initWithConfig:(id)a3 forSequencer:(id)a4
{
  id v6;
  ASDTPMEnabler *v7;
  ASDTPMEnabler *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASDTPMEnabler;
  v7 = -[ASDTPMDevice initWithConfig:forSequencer:](&v10, sel_initWithConfig_forSequencer_, v6, a4);
  v8 = v7;
  if (v7)
  {
    -[ASDTPMDevice setPmNoStateChangeOnFailure:](v7, "setPmNoStateChangeOnFailure:", 1);
    -[ASDTPMEnabler setEnableTransition:](v8, "setEnableTransition:", objc_msgSend(v6, "asdtPMEnablerEnableTransition"));
    -[ASDTPMEnabler setDisableTransition:](v8, "setDisableTransition:", objc_msgSend(v6, "asdtPMEnablerDisableTransition"));
  }

  return v8;
}

- (int)asdtPowerStateChange:(int)a3
{
  uint64_t v4;

  if (a3 == 1970563428)
  {
    v4 = asdtPowerTransitionUpwards(-[ASDTPMEnabler disableTransition](self, "disableTransition"));
    return -[ASDTPMEnabler enable:](self, "enable:", v4);
  }
  if (-[ASDTPMEnabler enableTransition](self, "enableTransition") == a3)
  {
    v4 = 1;
    return -[ASDTPMEnabler enable:](self, "enable:", v4);
  }
  if (-[ASDTPMEnabler disableTransition](self, "disableTransition") == a3)
  {
    v4 = 0;
    return -[ASDTPMEnabler enable:](self, "enable:", v4);
  }
  return 0;
}

- (BOOL)asdtHandlesPowerTransition:(int)a3
{
  if (a3 == 1970563428)
    return 1;
  if (-[ASDTPMEnabler enableTransition](self, "enableTransition") == a3)
    return 1;
  return -[ASDTPMEnabler disableTransition](self, "disableTransition") == a3;
}

- (int)enable:(BOOL)a3
{
  return 560227702;
}

- (int)enableTransition
{
  return self->_enableTransition;
}

- (void)setEnableTransition:(int)a3
{
  self->_enableTransition = a3;
}

- (int)disableTransition
{
  return self->_disableTransition;
}

- (void)setDisableTransition:(int)a3
{
  self->_disableTransition = a3;
}

@end
