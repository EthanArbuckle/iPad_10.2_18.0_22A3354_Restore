@implementation CDPrivacyPolicy

void __39___CDPrivacyPolicy_sharedPrivacyPolicy__block_invoke()
{
  _CDPrivacyPolicy *v0;
  void *v1;

  v0 = -[_CDPrivacyPolicy initWithTemporalPrecision:canPersistOnStorage:]([_CDPrivacyPolicy alloc], "initWithTemporalPrecision:canPersistOnStorage:", 1, 64.0);
  v1 = (void *)sharedPrivacyPolicy__sharedPrivacyPolicy;
  sharedPrivacyPolicy__sharedPrivacyPolicy = (uint64_t)v0;

}

@end
