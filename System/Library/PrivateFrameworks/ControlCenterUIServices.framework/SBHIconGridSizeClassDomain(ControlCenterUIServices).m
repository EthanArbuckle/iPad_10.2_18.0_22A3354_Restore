@implementation SBHIconGridSizeClassDomain(ControlCenterUIServices)

+ (id)controlCenterDomain
{
  if (controlCenterDomain_onceToken != -1)
    dispatch_once(&controlCenterDomain_onceToken, &__block_literal_global);
  return (id)controlCenterDomain_controlCenterDomain;
}

@end
