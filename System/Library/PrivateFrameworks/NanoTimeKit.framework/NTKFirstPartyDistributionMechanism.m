@implementation NTKFirstPartyDistributionMechanism

void __NTKFirstPartyDistributionMechanism_block_invoke()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  uint8_t buf[4];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.UIKit.activity.Message"), CFSTR("com.apple.DocumentManagerUICore.SaveToFiles"), CFSTR("com.apple.UIKit.activity.AirDrop"), CFSTR("com.apple.UIKit.activity.Mail"), CFSTR("com.apple.sharingd"), CFSTR("com.apple.MobileSMS"), CFSTR("com.apple.mobilesafari"), CFSTR("com.apple.DocumentsApp"), CFSTR("com.apple.mpn"), CFSTR("com.apple.Carousel"), CFSTR("com.apple.mobilemail"), CFSTR("com.apple.Spotlight"), CFSTR("com.apple.DocumentManagerUICore.RecentsAvocado"), CFSTR("com.apple.SafariViewService"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKFirstPartyDistributionMechanism_firstPartyDistributionMechanismSet;
  NTKFirstPartyDistributionMechanism_firstPartyDistributionMechanismSet = v0;

  _NTKLoggingObjectForDomain(29, (uint64_t)"NTKLoggingDomainMetrics");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v4 = NTKFirstPartyDistributionMechanism_firstPartyDistributionMechanismSet;
    _os_log_impl(&dword_1B72A3000, v2, OS_LOG_TYPE_DEFAULT, "NTKCoreAnalyticsUtilities did create firstPartyDistributionMechanismSet: %@", buf, 0xCu);
  }

}

@end
