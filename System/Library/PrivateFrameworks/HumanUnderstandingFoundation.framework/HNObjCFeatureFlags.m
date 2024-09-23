@implementation HNObjCFeatureFlags

+ (BOOL)isContextualUnderstandingEnabled
{
  return MEMORY[0x24BEDD108](HNFeatureFlags, sel_isContextualUnderstandingEnabled);
}

+ (BOOL)isHumanUnderstandingEvidenceEnabled
{
  return MEMORY[0x24BEDD108](HNFeatureFlags, sel_isHumanUnderstandingEvidenceEnabled);
}

+ (BOOL)isHumanUnderstandingDataCollectionEnabled
{
  return MEMORY[0x24BEDD108](HNFeatureFlags, sel_isHumanUnderstandingDataCollectionEnabled);
}

@end
