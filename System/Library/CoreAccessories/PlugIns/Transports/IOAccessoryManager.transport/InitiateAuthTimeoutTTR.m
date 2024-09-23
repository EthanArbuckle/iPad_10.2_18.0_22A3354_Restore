@implementation InitiateAuthTimeoutTTR

void __acc_tapToRadar_InitiateAuthTimeoutTTR_block_invoke()
{
  SInt32 v0;
  CFOptionFlags v1;

  v1 = 0xAAAAAAAAAAAAAAAALL;
  v0 = CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, CFSTR("Accessory Authentication Timeout\n File a Radar?"), 0, CFSTR("Not Now"), CFSTR("Yes"), 0, &v1);
  acc_tapToRadar_InitiateAuthTimeoutTTR_isAlertPending = 0;
  if (!v0 && v1 == 1)
    _acc_tapToRadar_authFailure(1);
}

@end
