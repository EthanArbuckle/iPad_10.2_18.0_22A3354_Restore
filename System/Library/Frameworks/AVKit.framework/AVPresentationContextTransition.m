@implementation AVPresentationContextTransition

- (CGAffineTransform)rotationTransform
{
  return CGAffineTransformMakeRotation(retstr, (double)-[AVPresentationContextTransition interfaceRotation](self, "interfaceRotation") * 1.57079633);
}

- (CGAffineTransform)counterRotationTransform
{
  return CGAffineTransformMakeRotation(retstr, (double)--[AVPresentationContextTransition interfaceRotation](self, "interfaceRotation") * 1.57079633);
}

- (int64_t)interfaceRotation
{
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[AVPresentationContextTransition initialInterfaceOrientation](self, "initialInterfaceOrientation");
  v4 = -[AVPresentationContextTransition finalInterfaceOrientation](self, "finalInterfaceOrientation");
  v5 = -1;
  v6 = 1;
  if (v3 != 4)
    v6 = 2 * (v3 == 2);
  if (v3 != 3)
    v5 = v6;
  if (v3 == 1)
    v5 = 0;
  v7 = 1;
  v8 = -1;
  v9 = -2;
  if (v4 != 2)
    v9 = 0;
  if (v4 != 4)
    v8 = v9;
  if (v4 != 3)
    v7 = v8;
  if (v4 == 1)
    v7 = 0;
  return v7 + v5;
}

- (BOOL)isRotated
{
  uint64_t v2;
  uint64_t v3;

  v2 = -[AVPresentationContextTransition interfaceRotation](self, "interfaceRotation");
  if (v2 >= 0)
    v3 = v2;
  else
    v3 = -v2;
  return v3 == 1;
}

- (BOOL)presenterSupportsOrientation:(int64_t)a3
{
  return ((1 << a3) & ~-[AVPresentationContextTransition presenterSupportedOrientations](self, "presenterSupportedOrientations")) == 0;
}

- (int64_t)initialInterfaceOrientation
{
  _BOOL4 v3;
  uint64_t v4;

  v3 = -[AVPresentationContextTransition wasCancelledWithInactiveScene](self, "wasCancelledWithInactiveScene");
  v4 = 24;
  if (v3)
    v4 = 32;
  return *(int64_t *)((char *)&self->super.isa + v4);
}

- (BOOL)wasInitiallyInteractive
{
  return self->_wasInitiallyInteractive;
}

- (void)setWasInitiallyInteractive:(BOOL)a3
{
  self->_wasInitiallyInteractive = a3;
}

- (BOOL)hasAVKitAnimator
{
  return self->_hasAVKitAnimator;
}

- (void)setHasAVKitAnimator:(BOOL)a3
{
  self->_hasAVKitAnimator = a3;
}

- (BOOL)wasCancelledWithInactiveScene
{
  return self->_wasCancelledWithInactiveScene;
}

- (void)setWasCancelledWithInactiveScene:(BOOL)a3
{
  self->_wasCancelledWithInactiveScene = a3;
}

- (unint64_t)presenterSupportedOrientations
{
  return self->_presenterSupportedOrientations;
}

- (void)setPresenterSupportedOrientations:(unint64_t)a3
{
  self->_presenterSupportedOrientations = a3;
}

- (void)setInitialInterfaceOrientation:(int64_t)a3
{
  self->_initialInterfaceOrientation = a3;
}

- (int64_t)finalInterfaceOrientation
{
  return self->_finalInterfaceOrientation;
}

- (void)setFinalInterfaceOrientation:(int64_t)a3
{
  self->_finalInterfaceOrientation = a3;
}

@end
