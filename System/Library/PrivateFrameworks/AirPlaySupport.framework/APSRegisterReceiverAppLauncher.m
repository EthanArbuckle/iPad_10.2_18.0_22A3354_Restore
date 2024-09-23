@implementation APSRegisterReceiverAppLauncher

uint64_t __APSRegisterReceiverAppLauncher_block_invoke(uint64_t a1)
{
  uint64_t v1;
  const void *Int64;
  BOOL v3;
  char v4;
  int v6;

  v1 = *(_QWORD *)(a1 + 32);
  pthread_mutex_lock(*(pthread_mutex_t **)(v1 + 24));
  APSGetAccessControlConfig((unsigned int *)(v1 + 8), 0);
  v6 = 0;
  Int64 = APSSettingsGetInt64(CFSTR("alternateSenderListenerEnable"), &v6);
  if (v6)
    v3 = 1;
  else
    v3 = Int64 == 0;
  v4 = !v3;
  *(_BYTE *)(v1 + 53) = v4;
  if (v3)
  {
    if (gLogCategory_APSReceiverAppLauncher <= 50
      && (gLogCategory_APSReceiverAppLauncher != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    launcher_stop((id *)v1);
  }
  else
  {
    if (gLogCategory_APSReceiverAppLauncher <= 50
      && (gLogCategory_APSReceiverAppLauncher != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    launcher_start(v1);
  }
  return pthread_mutex_unlock(*(pthread_mutex_t **)(v1 + 24));
}

@end
