@implementation AdPresentationDelegate

- (id)viewControllerToPresentFrom
{
  id v2;

  v2 = (id)MEMORY[0x1BCCE5D40](self->viewController, a2);
  if (!v2)
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F20]), sel_init);
  return v2;
}

@end
