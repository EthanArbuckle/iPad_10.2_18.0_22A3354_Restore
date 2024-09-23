@implementation BSUI

void ___BSUI_Private_IsN84_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;

  v0 = (void *)MGCopyAnswer();
  if (v0)
  {
    v3 = v0;
    objc_msgSend(v0, "objectForKey:", CFSTR("ArtworkDeviceSubType"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "integerValue");

    _MergedGlobals_11 = v2 == 1792;
    v0 = v3;
  }

}

@end
