@implementation ACCNavigationAccessoryComponent(CarPlay)

+ (uint64_t)CP_ignoreMaxLength
{
  if (CP_ignoreMaxLength_onceToken != -1)
    dispatch_once(&CP_ignoreMaxLength_onceToken, &__block_literal_global);
  return CP_ignoreMaxLength_ignoreMaxLength;
}

+ (id)CP_variant:()CarPlay fittingMaxLength:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unint64_t v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    if (a4 && !objc_msgSend(a1, "CP_ignoreMaxLength"))
    {
      objc_msgSend(v6, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = v6;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            if (objc_msgSend(v14, "length", (_QWORD)v18) <= a4)
            {
              v7 = v14;

              goto LABEL_18;
            }
            v15 = objc_msgSend(v14, "length");
            if (v15 < objc_msgSend(v8, "length"))
            {
              v16 = v14;

              v8 = v16;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v11)
            continue;
          break;
        }
      }

      objc_msgSend(v8, "stringByEllipsingPastMaxLength:", a4);
      v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

    }
    else
    {
      objc_msgSend(v6, "firstObject");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)CP_variantFittingCurrentRoadName:()CarPlay
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BE00BB0];
  v5 = a3;
  objc_msgSend(v4, "CP_variant:fittingMaxLength:", v5, objc_msgSend(a1, "maxLength_CurrentRoadName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)CP_variantFittingDestinationRoadName:()CarPlay
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BE00BB0];
  v5 = a3;
  objc_msgSend(v4, "CP_variant:fittingMaxLength:", v5, objc_msgSend(a1, "maxLength_DestinationRoadName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)CP_variantFittingPostManeuverRoadName:()CarPlay
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BE00BB0];
  v5 = a3;
  objc_msgSend(v4, "CP_variant:fittingMaxLength:", v5, objc_msgSend(a1, "maxLength_PostManeuverRoadName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)CP_variantFittingManeuverDescription:()CarPlay
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BE00BB0];
  v5 = a3;
  objc_msgSend(v4, "CP_variant:fittingMaxLength:", v5, objc_msgSend(a1, "maxLength_ManeuverDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)CP_variantFittingLaneGuidanceDescription:()CarPlay
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BE00BB0];
  v5 = a3;
  objc_msgSend(v4, "CP_variant:fittingMaxLength:", v5, objc_msgSend(a1, "maxLength_LaneGuidanceDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)CP_maxCapacity_GuidanceManeuver
{
  if (objc_msgSend(a1, "maxCapacity_GuidanceManeuver"))
    return objc_msgSend(a1, "maxCapacity_GuidanceManeuver");
  else
    return 1000;
}

- (uint64_t)CP_maxCapacity_LaneGuidance
{
  if (objc_msgSend(a1, "maxCapacity_LaneGuidance"))
    return objc_msgSend(a1, "maxCapacity_LaneGuidance");
  else
    return 1000;
}

@end
