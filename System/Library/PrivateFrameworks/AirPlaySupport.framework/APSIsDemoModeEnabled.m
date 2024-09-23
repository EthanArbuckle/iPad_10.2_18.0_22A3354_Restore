@implementation APSIsDemoModeEnabled

void __APSIsDemoModeEnabled_block_invoke()
{
  const void *Int64;

  if (APSIsAPMSpeaker_sCheckOnce != -1)
    dispatch_once(&APSIsAPMSpeaker_sCheckOnce, &__block_literal_global_9);
  if (!APSIsAPMSpeaker_sIsAPMSpeaker && !IsAppleTV())
  {
    Int64 = APSSettingsGetInt64(CFSTR("TetheredDemoMode"), 0);
    APSIsDemoModeEnabled_enabled = Int64 != 0;
    if (Int64)
    {
      if (gLogCategory_APSSystemUtils <= 50
        && (gLogCategory_APSSystemUtils != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
}

@end
