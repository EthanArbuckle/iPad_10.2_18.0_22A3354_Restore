@implementation _HKAnyCountryAvailability

- (_HKAnyCountryAvailability)init
{
  return (_HKAnyCountryAvailability *)-[HKRegionAvailability _initWithCategory:version:allowedCountries:](self, 2, CFSTR("anyCountry"), 0);
}

- (unint64_t)ineligibilityReasonsForOnboardingCountryCode:(id)a3
{
  return a3 == 0;
}

@end
