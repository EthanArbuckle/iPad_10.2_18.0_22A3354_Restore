@implementation ACCNavigationManeuverUpdateInfo

id __76__ACCNavigationManeuverUpdateInfo_CPAccNavInfo__initWithManeuver_component___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = objc_msgSend(a2, "key");
  if (v3 == 4)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "roadFollowingManeuverVariants");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CP_variantFittingPostManeuverRoadName:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3 != 2)
    {
      v8 = 0;
      return v8;
    }
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "instructionVariants");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "CP_variantFittingManeuverDescription:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v6;

  return v8;
}

@end
