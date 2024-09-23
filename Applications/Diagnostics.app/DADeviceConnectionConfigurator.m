@implementation DADeviceConnectionConfigurator

- (DADeviceConnectionConfigurator)init
{
  DADeviceConnectionConfigurator *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DADeviceConnectionConfigurator;
  v2 = -[DADeviceConnectionConfigurator init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "overrideSessionModeNotification:", CFSTR("DAOverrideSessionMode"), 0);

  }
  return v2;
}

- (int)mode
{
  if (-[DADeviceConnectionConfigurator isSessionModeOveridden](self, "isSessionModeOveridden"))
    return -[DADeviceConnectionConfigurator overrideSessionMode](self, "overrideSessionMode");
  if (+[CBSUtilities isSSRBootIntentSet](CBSUtilities, "isSSRBootIntentSet"))
    return 2;
  return 0;
}

- (void)overrideSessionModeNotification:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sessionMode")));

  v5 = objc_msgSend(v6, "integerValue");
  -[DADeviceConnectionConfigurator setIsSessionModeOveridden:](self, "setIsSessionModeOveridden:", 1);
  -[DADeviceConnectionConfigurator setOverrideSessionMode:](self, "setOverrideSessionMode:", v5);

}

- (BOOL)isSessionModeOveridden
{
  return self->_isSessionModeOveridden;
}

- (void)setIsSessionModeOveridden:(BOOL)a3
{
  self->_isSessionModeOveridden = a3;
}

- (int)overrideSessionMode
{
  return self->_overrideSessionMode;
}

- (void)setOverrideSessionMode:(int)a3
{
  self->_overrideSessionMode = a3;
}

@end
