@implementation GCEventViewController

- (BOOL)controllerUserInteractionEnabled
{
  return self->_controllerUserInteractionEnabled;
}

- (void)setControllerUserInteractionEnabled:(BOOL)controllerUserInteractionEnabled
{
  self->_controllerUserInteractionEnabled = controllerUserInteractionEnabled;
}

@end
