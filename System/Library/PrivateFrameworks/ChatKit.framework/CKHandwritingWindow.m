@implementation CKHandwritingWindow

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

- (void)_updateInterfaceOrientationFromDeviceOrientation:(BOOL)a3
{
  objc_super v4;

  if (!-[CKHandwritingWindow eatOrientationEvents](self, "eatOrientationEvents", a3))
  {
    v4.receiver = self;
    v4.super_class = (Class)CKHandwritingWindow;
    -[CKHandwritingWindow _updateInterfaceOrientationFromDeviceOrientation:](&v4, sel__updateInterfaceOrientationFromDeviceOrientation_, 0);
  }
}

- (BOOL)eatOrientationEvents
{
  return self->_eatOrientationEvents;
}

- (void)setEatOrientationEvents:(BOOL)a3
{
  self->_eatOrientationEvents = a3;
}

@end
