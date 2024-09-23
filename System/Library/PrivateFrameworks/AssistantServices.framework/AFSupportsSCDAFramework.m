@implementation AFSupportsSCDAFramework

BOOL __AFSupportsSCDAFramework_block_invoke()
{
  _BOOL8 result;

  result = +[AFFeatureFlags isSCDAFrameworkEnabled](AFFeatureFlags, "isSCDAFrameworkEnabled");
  AFSupportsSCDAFramework_scdaFrameworkEnabled = result;
  return result;
}

@end
