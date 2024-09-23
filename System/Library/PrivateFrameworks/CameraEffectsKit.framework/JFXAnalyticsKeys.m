@implementation JFXAnalyticsKeys

+ (id)allEventNames
{
  if (allEventNames_onceToken_0 != -1)
    dispatch_once(&allEventNames_onceToken_0, &__block_literal_global_59);
  return (id)allEventNames_eventNamesArray_0;
}

void __33__JFXAnalyticsKeys_allEventNames__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  +[JFXAnalyticsKeys allIncrementScalarEvents](JFXAnalyticsKeys, "allIncrementScalarEvents");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[JFXAnalyticsKeys allDistributionEvents](JFXAnalyticsKeys, "allDistributionEvents");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[JFXAnalyticsKeys allOverrideScalarEvents](JFXAnalyticsKeys, "allOverrideScalarEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "arrayByAddingObjectsFromArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[JFXAnalyticsKeys allIncrementScalarEffectEvents](JFXAnalyticsKeys, "allIncrementScalarEffectEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)allEventNames_eventNamesArray_0;
  allEventNames_eventNamesArray_0 = v5;

}

+ (id)allIncrementScalarEffectEvents
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)allOverrideScalarEvents
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)allIncrementScalarEvents
{
  if (allIncrementScalarEvents_onceToken_1 != -1)
    dispatch_once(&allIncrementScalarEvents_onceToken_1, &__block_literal_global_28);
  return (id)allIncrementScalarEvents_allIncrementScalarEvents_1;
}

void __44__JFXAnalyticsKeys_allIncrementScalarEvents__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[12];

  v6[11] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("thermalnominaltolight");
  v6[1] = CFSTR("thermallighttomoderate");
  v6[2] = CFSTR("thermalmoderatetoheavy");
  v6[3] = CFSTR("thermalheavytotrapping");
  v6[4] = CFSTR("thermaltrappingtosleeping");
  v6[5] = CFSTR("thermalsleepingtotrapping");
  v6[6] = CFSTR("thermaltrappingtoheavy");
  v6[7] = CFSTR("thermalheavytomoderate");
  v6[8] = CFSTR("thermalmoderatetolight");
  v6[9] = CFSTR("thermallighttonominal");
  v6[10] = CFSTR("facetrackedoverlaychangedplanes");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)allIncrementScalarEvents_allIncrementScalarEvents_1;
  allIncrementScalarEvents_allIncrementScalarEvents_1 = v0;

  v2 = (void *)allIncrementScalarEvents_allIncrementScalarEvents_1;
  JFX_CaptureSessionInterruptionReasonsList();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)allIncrementScalarEvents_allIncrementScalarEvents_1;
  allIncrementScalarEvents_allIncrementScalarEvents_1 = v4;

}

+ (id)allDistributionEvents
{
  return (id)MEMORY[0x24BDBD1A8];
}

@end
