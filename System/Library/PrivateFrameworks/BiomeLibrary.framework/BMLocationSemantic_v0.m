@implementation BMLocationSemantic_v0

- (int)placeType
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BMLocationSemantic_v0;
  v2 = -[BMLocationSemantic placeType](&v4, sel_placeType);
  if (v2 > 3)
    return 0;
  else
    return dword_1AEFE24F0[v2];
}

@end
