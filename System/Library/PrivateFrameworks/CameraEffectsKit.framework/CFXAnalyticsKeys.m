@implementation CFXAnalyticsKeys

+ (id)allEventNames
{
  if (allEventNames_onceToken != -1)
    dispatch_once(&allEventNames_onceToken, &__block_literal_global_18);
  return (id)allEventNames_eventNamesArray;
}

void __33__CFXAnalyticsKeys_allEventNames__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  +[CFXAnalyticsKeys allIncrementScalarEvents](CFXAnalyticsKeys, "allIncrementScalarEvents");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[CFXAnalyticsKeys allDistributionEvents](CFXAnalyticsKeys, "allDistributionEvents");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)allEventNames_eventNamesArray;
  allEventNames_eventNamesArray = v1;

}

+ (id)allIncrementScalarEffectEvents
{
  if (allIncrementScalarEffectEvents_onceToken != -1)
    dispatch_once(&allIncrementScalarEffectEvents_onceToken, &__block_literal_global_62);
  return (id)allIncrementScalarEffectEvents_allIncrementScalarEffectEvents;
}

void __50__CFXAnalyticsKeys_allIncrementScalarEffectEvents__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("filterusedwithid");
  v2[1] = CFSTR("labelusedwithid");
  v2[2] = CFSTR("shapeusedwithid");
  v2[3] = CFSTR("messagesstickerusedwithid");
  v2[4] = CFSTR("animojiusedwithid");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allIncrementScalarEffectEvents_allIncrementScalarEffectEvents;
  allIncrementScalarEffectEvents_allIncrementScalarEffectEvents = v0;

}

+ (id)allIncrementScalarEvents
{
  if (allIncrementScalarEvents_onceToken != -1)
    dispatch_once(&allIncrementScalarEvents_onceToken, &__block_literal_global_64);
  return (id)allIncrementScalarEvents_allIncrementScalarEvents;
}

void __44__CFXAnalyticsKeys_allIncrementScalarEvents__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[14];

  v2[13] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("thermalnominaltolight");
  v2[1] = CFSTR("thermallighttomoderate");
  v2[2] = CFSTR("thermalmoderatetoheavy");
  v2[3] = CFSTR("thermalheavytotrapping");
  v2[4] = CFSTR("thermaltrappingtosleeping");
  v2[5] = CFSTR("thermalsleepingtotrapping");
  v2[6] = CFSTR("thermaltrappingtoheavy");
  v2[7] = CFSTR("thermalheavytomoderate");
  v2[8] = CFSTR("thermalmoderatetolight");
  v2[9] = CFSTR("thermallighttonominal");
  v2[10] = CFSTR("extensionlaunched");
  v2[11] = CFSTR("sentpostcapturewithfuncamphoto");
  v2[12] = CFSTR("sentpostcapturewithfuncamvideo");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 13);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allIncrementScalarEvents_allIncrementScalarEvents;
  allIncrementScalarEvents_allIncrementScalarEvents = v0;

}

+ (id)allDistributionEvents
{
  if (allDistributionEvents_onceToken != -1)
    dispatch_once(&allDistributionEvents_onceToken, &__block_literal_global_65);
  return (id)allDistributionEvents_allDistributionEventNamesArray;
}

void __41__CFXAnalyticsKeys_allDistributionEvents__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("activetime");
  v2[1] = CFSTR("activefrontcameratime");
  v2[2] = CFSTR("activebackcameratime");
  v2[3] = CFSTR("activeexternalcameratime");
  v2[4] = CFSTR("videoduration");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allDistributionEvents_allDistributionEventNamesArray;
  allDistributionEvents_allDistributionEventNamesArray = v0;

}

@end
