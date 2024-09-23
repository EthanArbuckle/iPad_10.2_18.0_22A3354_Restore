@implementation BMUserFocusModeComputed_v1

- (int)semanticType
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BMUserFocusModeComputed_v1;
  v2 = -[BMUserFocusModeComputed semanticType](&v4, sel_semanticType);
  if (v2 < 0xA)
    return v2 + 1;
  else
    return 0;
}

@end
