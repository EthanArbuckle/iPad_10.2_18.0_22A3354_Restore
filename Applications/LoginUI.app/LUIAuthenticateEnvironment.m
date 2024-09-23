@implementation LUIAuthenticateEnvironment

- (LUIAuthenticateEnvironment)initWithDeviceHasNetwork:(BOOL)a3 isInternalBuild:(BOOL)a4
{
  LUIAuthenticateEnvironment *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)LUIAuthenticateEnvironment;
  result = -[LUIAuthenticateEnvironment init](&v7, "init");
  if (result)
  {
    result->_deviceHasNetwork = a3;
    result->_isInternalBuild = a4;
  }
  return result;
}

- (LUIAuthenticateEnvironment)init
{
  return -[LUIAuthenticateEnvironment initWithDeviceHasNetwork:isInternalBuild:](self, "initWithDeviceHasNetwork:isInternalBuild:", 0, 0);
}

- (BOOL)deviceHasNetwork
{
  return self->_deviceHasNetwork;
}

- (BOOL)isInternalBuild
{
  return self->_isInternalBuild;
}

@end
