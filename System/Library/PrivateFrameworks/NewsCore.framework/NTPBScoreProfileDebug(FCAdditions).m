@implementation NTPBScoreProfileDebug(FCAdditions)

- (void)setScoringAssetsIdentifier:()FCAdditions
{
  objc_setAssociatedObject(a1, (const void *)scoringAssetsIdentifierKey, a3, (void *)0x301);
}

- (void)setTagWeightsByID:()FCAdditions
{
  objc_setAssociatedObject(a1, (const void *)tagWeightsByIDKey, a3, (void *)0x301);
}

- (void)setNicheContentScores:()FCAdditions
{
  objc_setAssociatedObject(a1, (const void *)nicheContentScoresKey, a3, (void *)0x301);
}

- (void)setFeatureWeightsByID:()FCAdditions
{
  objc_setAssociatedObject(a1, (const void *)featureWeightsByIDKey, a3, (void *)0x301);
}

- (void)setContentTriggerScores:()FCAdditions
{
  objc_setAssociatedObject(a1, (const void *)contentTriggerScoresKey, a3, (void *)0x301);
}

- (id)nicheContentScores
{
  return objc_getAssociatedObject(a1, (const void *)nicheContentScoresKey);
}

- (id)contentTriggerScores
{
  return objc_getAssociatedObject(a1, (const void *)contentTriggerScoresKey);
}

- (id)tagWeightsByID
{
  return objc_getAssociatedObject(a1, (const void *)tagWeightsByIDKey);
}

- (id)featureWeightsByID
{
  return objc_getAssociatedObject(a1, (const void *)featureWeightsByIDKey);
}

- (id)scoringAssetsIdentifier
{
  return objc_getAssociatedObject(a1, (const void *)scoringAssetsIdentifierKey);
}

@end
