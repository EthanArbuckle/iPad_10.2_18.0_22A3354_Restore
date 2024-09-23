@implementation LAAuthenticationBiometricMethodShim

void __54___LAAuthenticationBiometricMethodShim_sharedInstance__block_invoke()
{
  _LAAuthenticationBiometricMethodShim *v0;
  void *v1;

  v0 = objc_alloc_init(_LAAuthenticationBiometricMethodShim);
  v1 = (void *)sharedInstance_shim;
  sharedInstance_shim = (uint64_t)v0;

}

@end
