@implementation BKSSystemGesturesTouchStreamPolicy

- (BKSSystemGesturesTouchStreamPolicy)init
{
  BKSSystemGesturesTouchStreamPolicy *v2;
  BKSSystemGesturesTouchStreamPolicy *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKSSystemGesturesTouchStreamPolicy;
  v2 = -[BKSSystemGesturesTouchStreamPolicy init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[BKSTouchStreamPolicy setShouldSendAmbiguityRecommendations:](v2, "setShouldSendAmbiguityRecommendations:", 1);
  return v3;
}

@end
