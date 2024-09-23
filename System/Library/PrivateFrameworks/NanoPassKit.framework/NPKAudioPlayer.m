@implementation NPKAudioPlayer

+ (void)playProvisioningSuccessHaptic
{
  objc_msgSend(a1, "_playSoundsWithIdentifier:", 1504);
}

+ (void)playProvisioningFailureHaptic
{
  objc_msgSend(a1, "_playSoundsWithIdentifier:", 1505);
}

+ (void)playTransactionSuccessHaptic
{
  objc_msgSend(a1, "_playSoundsWithFallbackHapticIfNecessaryForSoundIdentifier:", 1407);
}

+ (void)playTransactionFailureHaptic
{
  objc_msgSend(a1, "_playSoundsWithFallbackHapticIfNecessaryForSoundIdentifier:", 1426);
}

+ (void)playAccessScanCompleteHaptic
{
  objc_msgSend(a1, "_playSoundsWithIdentifier:", 1543);
}

+ (void)playSessionStartFailureHaptic
{
  objc_msgSend(a1, "_playSoundsWithFallbackHapticIfNecessaryForSoundIdentifier:", 1426);
}

+ (void)playSessionTimeoutHaptic
{
  objc_msgSend(a1, "_playSoundsWithFallbackHapticIfNecessaryForSoundIdentifier:", 1426);
}

+ (void)playWarsawHaptic
{
  objc_msgSend(a1, "_playSoundsWithFallbackHapticIfNecessaryForSoundIdentifier:", 1532);
}

+ (void)playTerminalRequestedAuthenticationHaptic
{
  objc_msgSend(a1, "_playSoundsWithFallbackHapticIfNecessaryForSoundIdentifier:", 1532);
}

+ (void)playInAppPaymentSuccessHaptic
{
  objc_msgSend(a1, "_playSoundsWithFallbackHapticIfNecessaryForSoundIdentifier:", 1407);
}

+ (void)playInAppPaymentFailureHaptic
{
  objc_msgSend(a1, "_playSoundsWithFallbackHapticIfNecessaryForSoundIdentifier:", 1426);
}

+ (void)playTransactionAuthenticationHaptic
{
  objc_msgSend(a1, "_playSoundsWithIdentifier:", 1400);
}

+ (void)playIdentityReaderConnectionStartHaptic
{
  objc_msgSend(a1, "_playSoundsWithFallbackHapticIfNecessaryForSoundIdentifier:", 1532);
}

+ (void)playIdentityReaderConnectionCompleteHaptic
{
  objc_msgSend(a1, "_playSoundsWithIdentifier:", 1585);
}

+ (void)_playSoundsWithIdentifier:(unsigned int)a3
{
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_General_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = a3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Audio player playing sound %u", (uint8_t *)v7, 8u);
    }

  }
  AudioServicesPlaySystemSoundWithCompletion(a3, 0);
}

+ (void)_playSoundsWithFallbackHapticIfNecessaryForSoundIdentifier:(unsigned int)a3
{
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  const __CFString *v9;
  _DWORD v10[2];
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (ringerStateIsSilent_onceToken != -1)
    dispatch_once(&ringerStateIsSilent_onceToken, &__block_literal_global_6);
  v5 = ringerStateIsSilent_ringerState;
  pk_General_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("NO");
      if (!v5)
        v9 = CFSTR("YES");
      v10[0] = 67109378;
      v10[1] = a3;
      v11 = 2112;
      v12 = v9;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Audio player playing sound %u; should fall back to haptic: %@",
        (uint8_t *)v10,
        0x12u);
    }

  }
  if (v5)
    AudioServicesPlaySystemSoundWithCompletion(a3, 0);
  else
    objc_msgSend(a1, "_playSoundsWithIdentifier:", 1400);
}

+ (void)playReadyToReorderHaptic
{
  objc_msgSend(a1, "_playSoundsWithIdentifier:", 1457);
}

@end
