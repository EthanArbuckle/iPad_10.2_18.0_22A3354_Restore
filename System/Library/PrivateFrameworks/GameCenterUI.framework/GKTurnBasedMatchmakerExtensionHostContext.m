@implementation GKTurnBasedMatchmakerExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[GKViewServiceInterface turnBasedServiceViewControllerInterface](GKViewServiceInterface, "turnBasedServiceViewControllerInterface");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[GKViewServiceInterface turnBasedHostViewControllerInterface](GKViewServiceInterface, "turnBasedHostViewControllerInterface");
}

@end
