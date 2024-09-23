@implementation CSDeviceUnblockPolicy

- (CSDeviceUnblockPolicy)initWithEnvironment:(id)a3
{
  id v5;
  CSDeviceUnblockPolicy *v6;
  CSDeviceUnblockPolicy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSDeviceUnblockPolicy;
  v6 = -[CSDeviceUnblockPolicy init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_env, a3);

  return v7;
}

- (BOOL)canUnblockDeviceUsingErase
{
  return -[CSDeviceUnblockPolicyEnvironment isUserRequestedEraseEnabled](self->_env, "isUserRequestedEraseEnabled")
      && -[CSDeviceUnblockPolicyEnvironment isUserFindMyAccountPresent](self->_env, "isUserFindMyAccountPresent")
      && -[CSDeviceUnblockPolicyEnvironment isDeviceInternetConnectionActive](self->_env, "isDeviceInternetConnectionActive");
}

- (BOOL)canUnblockDeviceUsingRecovery
{
  return -[CSDeviceUnblockPolicyEnvironment isPasscodeGracePeriodUsable](self->_env, "isPasscodeGracePeriodUsable");
}

- (BOOL)canUnblockDevice
{
  return -[CSDeviceUnblockPolicy canUnblockDeviceUsingErase](self, "canUnblockDeviceUsingErase")
      || -[CSDeviceUnblockPolicy canUnblockDeviceUsingRecovery](self, "canUnblockDeviceUsingRecovery");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_env, 0);
}

@end
