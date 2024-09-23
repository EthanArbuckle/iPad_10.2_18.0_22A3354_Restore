@implementation GKAuthenticateExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[GKViewServiceInterface signInServiceViewControllerInterface](GKViewServiceInterface, "signInServiceViewControllerInterface");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[GKViewServiceInterface remoteSignInViewControllerInterface](GKViewServiceInterface, "remoteSignInViewControllerInterface");
}

@end
