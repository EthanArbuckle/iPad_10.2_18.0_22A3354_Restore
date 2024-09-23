@implementation CNKScreenSharingInteractionControllerFactory

- (CNKScreenSharingInteractionControllerProtocol)sharedController
{
  CNKScreenSharingInteractionControllerFactory *v2;
  void *v3;

  v2 = self;
  v3 = (void *)static ScreenSharingInteractionController.shared.getter();

  return (CNKScreenSharingInteractionControllerProtocol *)v3;
}

- (CNKScreenSharingInteractionControllerFactory)init
{
  return (CNKScreenSharingInteractionControllerFactory *)CNKScreenSharingInteractionControllerFactory.init()();
}

@end
