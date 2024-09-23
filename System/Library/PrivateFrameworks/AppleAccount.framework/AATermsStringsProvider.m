@implementation AATermsStringsProvider

+ (id)neediCloudTermsAcceptanceTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("FOLLOWUP_VERIFY_TERMS_TITLE"), 0, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)neediCloudTermsAcceptanceDeviceSpecificMessage
{
  return AADeviceLocStringForKey(CFSTR("FOLLOWUP_VERIFY_TERMS_MESSAGE"));
}

@end
