@implementation CDVRelativeOrderHeaderString

void __CDVRelativeOrderHeaderString_block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  void *v3;
  id v4;

  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("BehaviorOptions"), CFSTR("com.apple.DataAccess.BehaviorOptions"));
  if (v0)
  {
    v4 = v0;
    objc_msgSend(v0, "objectForKey:", CFSTR("Use1DOrdering"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "BOOLValue");

    v0 = v4;
    if (v2)
    {
      v3 = (void *)CDVRelativeOrderHeaderString__sRelativeOrderString;
      CDVRelativeOrderHeaderString__sRelativeOrderString = (uint64_t)CFSTR("After: ");

      v0 = v4;
    }
  }

}

@end
