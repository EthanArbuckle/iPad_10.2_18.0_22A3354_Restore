@implementation ASCLockupKeyGetAllCases

void ___ASCLockupKeyGetAllCases_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("id"), CFSTR("icon"), CFSTR("title"), CFSTR("subtitle"), CFSTR("shortName"), CFSTR("developerName"), CFSTR("eula"), CFSTR("privacyPolicyUrl"), CFSTR("genreName"), CFSTR("genreID"), CFSTR("subgenres"), CFSTR("developerId"), CFSTR("webDistributionDomains"), CFSTR("supportUrl"), CFSTR("contentRatingsBySystem"), CFSTR("distributorBundleId"), CFSTR("appVersionId"),
         CFSTR("isDistributor"),
         0);
  v1 = (void *)_ASCLockupKeyGetAllCases_allCases;
  _ASCLockupKeyGetAllCases_allCases = v0;

}

@end
