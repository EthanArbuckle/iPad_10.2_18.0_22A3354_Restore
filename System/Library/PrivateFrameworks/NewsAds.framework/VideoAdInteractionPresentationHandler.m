@implementation VideoAdInteractionPresentationHandler

- (id)viewControllerToPresentFrom
{
  void *Strong;
  id v3;

  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  swift_retain();
  v3 = objc_msgSend(Strong, sel_viewControllerForModalPresentation);
  swift_release();

  return v3;
}

@end
