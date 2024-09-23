@implementation HKECGAvailabilityEngine

+ (id)shouldAdvertiseECG2WithSupportedRegion:(BOOL)a3 meetsAgeRequirement:(BOOL)a4 backgroundDeliveredNotAdvertised:(BOOL)a5 prevOnboarded:(BOOL)a6 watchCapable:(BOOL)a7 phoneCapable:(BOOL)a8 isTinker:(BOOL)a9
{
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a4 && !a9 && a7 && a8)
  {
    if (a5)
    {
      if (a3)
      {
        *(_QWORD *)&a3 = 0;
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 1;
LABEL_21:
        +[HKECGAvailabilityResult resultWithAdvertiseDirectOnboarding:advertiseDirectOnboardingSecondary:advertiseUpgrade:advertiseUpgradeSecondary:advertiseUpgradeBackgroundDelivered:](HKECGAvailabilityResult, "resultWithAdvertiseDirectOnboarding:advertiseDirectOnboardingSecondary:advertiseUpgrade:advertiseUpgradeSecondary:advertiseUpgradeBackgroundDelivered:", a3, v11, v12, v13, v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        return v9;
      }
      v11 = 0;
    }
    else
    {
      if (a6)
      {
        if (a3)
        {
          *(_QWORD *)&a3 = 0;
          v11 = 0;
          v12 = 1;
        }
        else
        {
          v11 = 0;
          v12 = 0;
        }
        v13 = 1;
        goto LABEL_20;
      }
      if (a3)
        *(_QWORD *)&a3 = 1;
      v11 = 1;
    }
    v12 = 0;
    v13 = 0;
LABEL_20:
    v14 = 0;
    goto LABEL_21;
  }
  +[HKECGAvailabilityResult resultWithNoAdvertisements](HKECGAvailabilityResult, "resultWithNoAdvertisements", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  return v9;
}

@end
