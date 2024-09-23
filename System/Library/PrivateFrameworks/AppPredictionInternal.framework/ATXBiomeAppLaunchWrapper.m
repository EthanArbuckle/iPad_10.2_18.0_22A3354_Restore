@implementation ATXBiomeAppLaunchWrapper

- (ATXBiomeAppLaunchWrapper)initWithAppLaunch:(id)a3 isLocal:(BOOL)a4 isMacPortable:(BOOL)a5 isMacDesktop:(BOOL)a6
{
  id v11;
  ATXBiomeAppLaunchWrapper *v12;
  ATXBiomeAppLaunchWrapper *v13;
  uint64_t v14;
  NSDate *launchTimestamp;
  objc_super v17;

  v11 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATXBiomeAppLaunchWrapper;
  v12 = -[ATXBiomeAppLaunchWrapper init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_appLaunchEvent, a3);
    v13->_isLocal = a4;
    v13->_isMacPortable = a5;
    v13->_isMacDesktop = a6;
    objc_msgSend(v11, "absoluteTimestamp");
    v14 = objc_claimAutoreleasedReturnValue();
    launchTimestamp = v13->_launchTimestamp;
    v13->_launchTimestamp = (NSDate *)v14;

  }
  return v13;
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (BOOL)isMacPortable
{
  return self->_isMacPortable;
}

- (BOOL)isMacDesktop
{
  return self->_isMacDesktop;
}

- (BMAppInFocus)appLaunchEvent
{
  return self->_appLaunchEvent;
}

- (NSDate)launchTimestamp
{
  return self->_launchTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchTimestamp, 0);
  objc_storeStrong((id *)&self->_appLaunchEvent, 0);
}

@end
