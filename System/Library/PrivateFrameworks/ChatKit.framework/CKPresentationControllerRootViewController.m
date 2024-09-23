@implementation CKPresentationControllerRootViewController

- (unint64_t)supportedInterfaceOrientations
{
  objc_super v4;

  if (-[CKPresentationControllerRootViewController restrictedToPortraitOrientation](self, "restrictedToPortraitOrientation"))
  {
    return 2;
  }
  v4.receiver = self;
  v4.super_class = (Class)CKPresentationControllerRootViewController;
  return -[CKPresentationControllerRootViewController supportedInterfaceOrientations](&v4, sel_supportedInterfaceOrientations);
}

- (BOOL)allowsRotation
{
  return self->_allowsRotation;
}

- (void)setAllowsRotation:(BOOL)a3
{
  self->_allowsRotation = a3;
}

- (BOOL)restrictedToPortraitOrientation
{
  return self->_restrictedToPortraitOrientation;
}

- (void)setRestrictedToPortraitOrientation:(BOOL)a3
{
  self->_restrictedToPortraitOrientation = a3;
}

@end
