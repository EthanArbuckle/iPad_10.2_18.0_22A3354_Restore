@implementation ACCNavigationRouteGuidanceUpdateInfo

id __86__ACCNavigationRouteGuidanceUpdateInfo_CPAccNavInfo__initWithRouteGuidance_component___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v4 = objc_msgSend(a2, "key");
  switch(v4)
  {
    case 13:
      objc_msgSend(*(id *)(a1 + 40), "currentManeuverIndexes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "currentManeuverIndexes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");
      v12 = objc_msgSend(*(id *)(a1 + 32), "CP_maxCapacity_GuidanceManeuver");
      if (v11 >= v12)
      {
        v13 = objc_msgSend(*(id *)(a1 + 32), "CP_maxCapacity_GuidanceManeuver");
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "currentManeuverIndexes");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v2, "count");
      }
      objc_msgSend(v6, "subarrayWithRange:", 0, v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 < v12)

      goto LABEL_14;
    case 4:
      v8 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "destinationNameVariants");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "CP_variantFittingDestinationRoadName:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3:
      v5 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "currentRoadNameVariants");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "CP_variantFittingCurrentRoadName:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v9 = (void *)v7;
LABEL_14:

      return v9;
  }
  v9 = 0;
  return v9;
}

@end
