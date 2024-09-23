@implementation C3DLinearRenderingIsEnabled

void __C3DLinearRenderingIsEnabled_block_invoke()
{
  char v0;
  char v1;
  BOOL v2;
  BOOL Bool;
  char IsSet;

  v0 = _gC3DEnableLinearRendering;
  if (_gC3DEnableLinearRendering)
  {
    v1 = C3DWasLinkedBeforeMajorOSYear2016();
    _gC3DEnableLinearRendering = v1 ^ 1;
    if ((v1 & 1) != 0 || (v2 = C3DPreferencesGetBool(6), _gC3DEnableLinearRendering = !v2, v2))
    {
      v0 = 0;
    }
    else
    {
      Bool = C3DPreferencesGetBool(0);
      v0 = 0;
      _gC3DEnableLinearRendering = !Bool;
      if (!Bool)
      {
        IsSet = C3DGetInfoPlistFlagIsSet((uint64_t)CFSTR("SCNDisableLinearSpaceRendering"), 0);
        v0 = 0;
        _gC3DEnableLinearRendering = IsSet ^ 1;
        if ((IsSet & 1) == 0)
        {
          if (C3DMetalIsSupported_onceToken != -1)
            dispatch_once(&C3DMetalIsSupported_onceToken, &__block_literal_global_50);
          v0 = C3DMetalIsSupported_supported != 0;
        }
      }
    }
  }
  _gC3DEnableLinearRendering = v0;
}

@end
