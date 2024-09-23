@implementation BMUserFocusInferredMode_v1

- (int)modeType
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BMUserFocusInferredMode_v1;
  v2 = -[BMUserFocusInferredMode modeType](&v4, sel_modeType);
  if (v2 < 0x11)
    return v2 + 1;
  else
    return 0;
}

- (int)origin
{
  unsigned int v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BMUserFocusInferredMode_v1;
  v2 = -[BMUserFocusInferredMode origin](&v4, sel_origin);
  if (v2 < 0x11)
    return v2 + 1;
  else
    return 0;
}

@end
