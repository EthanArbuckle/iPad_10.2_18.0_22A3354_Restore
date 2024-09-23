@implementation MREmulatedGameController

- (MREmulatedGameController)initWithProperties:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MREmulatedGameController;
  return -[MREmulatedGameController init](&v4, sel_init, a3);
}

- (int)profile
{
  return self->_profile;
}

- (double)buttonAUpDelay
{
  return self->_buttonAUpDelay;
}

- (void)setButtonAUpDelay:(double)a3
{
  self->_buttonAUpDelay = a3;
}

- (MREmulatedGameControllerDelegate)delegate
{
  return (MREmulatedGameControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
