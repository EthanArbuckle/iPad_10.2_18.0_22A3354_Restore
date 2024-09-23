@implementation CNCapabilities

- (BOOL)isFaceTimeVideoSupported
{
  char v2;

  kdebug_trace();
  v2 = MGGetBoolAnswer();
  kdebug_trace();
  return v2;
}

- (BOOL)isPaySupported
{
  return +[CNUIPassKitWrapper isPeerPaymentAvailable](CNUIPassKitWrapper, "isPeerPaymentAvailable");
}

- (BOOL)areTelephonyCallsSupported
{
  char v2;

  kdebug_trace();
  v2 = MGGetBoolAnswer();
  kdebug_trace();
  return v2;
}

- (BOOL)isiMessageSupported
{
  char v2;

  kdebug_trace();
  v2 = _mergedCarrierBundleValue(CFSTR("AllowiMessage"), 1);
  kdebug_trace();
  return v2;
}

- (BOOL)isFaceTimeAudioSupported
{
  char v2;
  char v3;
  char v4;

  kdebug_trace();
  v2 = _mergedCarrierBundleValue(CFSTR("AllowsFaceTimeAudio"), 0);
  v3 = MGGetBoolAnswer();
  if (MGGetBoolAnswer())
    v4 = v2 | v3 ^ 1;
  else
    v4 = 0;
  kdebug_trace();
  return v4;
}

+ (BOOL)shouldUseLegacyMessages
{
  if (shouldUseLegacyMessages_cn_once_token_2 != -1)
    dispatch_once(&shouldUseLegacyMessages_cn_once_token_2, &__block_literal_global_37);
  return objc_msgSend((id)shouldUseLegacyMessages_cn_once_object_2, "BOOLValue");
}

void __41__CNCapabilities_shouldUseLegacyMessages__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", CFPreferencesGetAppBooleanValue(CFSTR("ABUseLegacyMessages"), CFSTR("com.apple.AddressBook"), 0) != 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)shouldUseLegacyMessages_cn_once_object_2;
  shouldUseLegacyMessages_cn_once_object_2 = v0;

}

@end
