@implementation C3DStandardShadersUseFunctionConstants

void __C3DStandardShadersUseFunctionConstants_block_invoke()
{
  _BOOL4 Bool;
  BOOL v1;

  Bool = C3DPreferencesGetBool(11);
  C3DStandardShadersUseFunctionConstants_enableFunctionConstants = Bool;
  if (Bool)
  {
    if (C3DMetalIsSupported_onceToken != -1)
      dispatch_once(&C3DMetalIsSupported_onceToken, &__block_literal_global_50);
    v1 = C3DMetalIsSupported_supported != 0;
  }
  else
  {
    v1 = 0;
  }
  C3DStandardShadersUseFunctionConstants_enableFunctionConstants = v1;
}

@end
