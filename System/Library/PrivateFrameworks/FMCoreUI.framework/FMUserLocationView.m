@implementation FMUserLocationView

- (void)setPreferredZIndex:(unint64_t)a3
{
  FMUserLocationViewZIndex = a3;
}

+ (BOOL)_followsTerrain
{
  return 0;
}

+ (unint64_t)_zIndex
{
  return FMUserLocationViewZIndex;
}

@end
