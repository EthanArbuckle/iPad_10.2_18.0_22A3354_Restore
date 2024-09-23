@implementation GKChallengeIssueExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[GKViewServiceInterface challengeIssueServiceViewControllerInterface](GKViewServiceInterface, "challengeIssueServiceViewControllerInterface");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[GKViewServiceInterface challengeIssueHostViewControllerInterface](GKViewServiceInterface, "challengeIssueHostViewControllerInterface");
}

@end
