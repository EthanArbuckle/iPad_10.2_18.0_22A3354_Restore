@implementation BLTIsWalkaboutEnabled

void __BLTIsWalkaboutEnabled_block_invoke()
{
  void *v0;
  char isKindOfClass;
  int v2;
  char v3;
  void *v4;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("ExperimentGroup"), CFSTR("com.apple.da"));
  if (v0)
  {
    v4 = v0;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v0 = v4;
    if ((isKindOfClass & 1) != 0)
    {
      v2 = objc_msgSend(v4, "isEqualToString:", CFSTR("walkabout"));
      v0 = v4;
      if (v2)
      {
        v3 = MGGetBoolAnswer();
        v0 = v4;
        BLTIsWalkaboutEnabled___BLTWalkaboutEnabled = v3;
      }
    }
  }

}

@end
