@implementation IMGenerativeModelsAvailabilityProvider

+ (BOOL)summarizationModelsAvailable
{
  return sub_19E32C050((uint64_t)a1, (uint64_t)a2, &OBJC_IVAR___IMGenerativeModelsAvailabilityProvider_summarizationModelsAvailable);
}

+ (BOOL)generativePlaygroundModelsAvailable
{
  return sub_19E32C050((uint64_t)a1, (uint64_t)a2, &OBJC_IVAR___IMGenerativeModelsAvailabilityProvider_generativePlaygroundModelsAvailable);
}

+ (BOOL)summarizationUserPreferenceEnabled
{
  return _sSo38IMGenerativeModelsAvailabilityProviderC17IMSharedUtilitiesE34summarizationUserPreferenceEnabledSbyFZ_0() & 1;
}

+ (void)setMessageSummarizationUserPreference:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = (void *)sub_19E36F864();
  v5 = (void *)sub_19E36F864();
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithBool_, v3);
  IMSetDomainValueForKey();

}

+ (BOOL)messageSummarizationEnabled
{
  swift_getObjCClassMetadata();
  return static IMGenerativeModelsAvailabilityProvider.messageSummarizationEnabled()() & 1;
}

- (IMGenerativeModelsAvailabilityProvider)init
{
  return (IMGenerativeModelsAvailabilityProvider *)sub_19E32C2F4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
