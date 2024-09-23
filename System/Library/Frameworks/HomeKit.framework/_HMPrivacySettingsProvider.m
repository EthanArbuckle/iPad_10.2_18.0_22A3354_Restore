@implementation _HMPrivacySettingsProvider

- (void)requestHomeKitAccessWithQueue:(id)a3 completion:(id)a4
{
  __HMPrivacyRequestAccessForService(*MEMORY[0x1E0DB11E8], a3, a4);
}

- (unint64_t)queryAuthorizationStatus
{
  unint64_t result;

  result = HMPrivacyGetAuthorizationStatusForHomeKit();
  self->_cachedAuthorizationStatus = result;
  return result;
}

- (unint64_t)cachedAuthorizationStatus
{
  unint64_t result;

  result = self->_cachedAuthorizationStatus;
  if ((result & 1) == 0)
  {
    result = -[_HMPrivacySettingsProvider queryAuthorizationStatus](self, "queryAuthorizationStatus");
    self->_cachedAuthorizationStatus = result;
  }
  return result;
}

- (void)requestMicrophoneAccessWithQueue:(id)a3 completion:(id)a4
{
  __HMPrivacyRequestAccessForService(*MEMORY[0x1E0DB1168], a3, a4);
}

@end
