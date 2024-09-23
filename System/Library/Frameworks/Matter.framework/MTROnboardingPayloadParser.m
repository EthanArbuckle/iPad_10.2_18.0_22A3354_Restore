@implementation MTROnboardingPayloadParser

+ (MTRSetupPayload)setupPayloadForOnboardingPayload:(NSString *)onboardingPayload error:(NSError *)error
{
  objc_msgSend_setupPayloadWithOnboardingPayload_error_(MTRSetupPayload, a2, (uint64_t)onboardingPayload, error);
  return (MTRSetupPayload *)(id)objc_claimAutoreleasedReturnValue();
}

@end
