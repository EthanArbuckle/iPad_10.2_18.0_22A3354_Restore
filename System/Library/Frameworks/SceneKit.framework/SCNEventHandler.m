@implementation SCNEventHandler

- (SCNEventHandler)init
{
  SCNEventHandler *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNEventHandler;
  result = -[SCNEventHandler init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_enableFreeCamera = 257;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SCNEventHandler;
  -[SCNEventHandler dealloc](&v2, sel_dealloc);
}

- (SCNView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  self->_view = (SCNView *)a3;
}

- (id)gestureRecognizers
{
  return 0;
}

- (BOOL)wantsRedraw
{
  return 0;
}

- (SCNNode)freeCamera
{
  return 0;
}

- (BOOL)enableFreeCamera
{
  return self->_enableFreeCamera;
}

- (void)setEnableFreeCamera:(BOOL)a3
{
  self->_enableFreeCamera = a3;
}

- (BOOL)autoSwitchToFreeCamera
{
  return self->_autoSwitchToFreeCamera;
}

- (void)setAutoSwitchToFreeCamera:(BOOL)a3
{
  self->_autoSwitchToFreeCamera = a3;
}

- (void)activateFreeCamera
{
  -[SCNEventHandler setEnableFreeCamera:](self, "setEnableFreeCamera:", 1);
}

@end
