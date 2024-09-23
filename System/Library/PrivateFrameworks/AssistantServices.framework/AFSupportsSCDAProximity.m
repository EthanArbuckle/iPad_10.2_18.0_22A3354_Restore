@implementation AFSupportsSCDAProximity

BOOL __AFSupportsSCDAProximity_block_invoke()
{
  _BOOL8 result;

  result = +[AFFeatureFlags isSCDAFrameworkEnabled](AFFeatureFlags, "isSCDAFrameworkEnabled");
  AFSupportsSCDAProximity_scdaProximityEnabled = result;
  return result;
}

@end
