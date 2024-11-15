@implementation NTKCrownInputHandler

- (NTKCrownInputHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKCrownInputHandler;
  return -[NTKCrownInputHandler init](&v3, sel_init);
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (double)offsetPerRevolution
{
  return 0.0;
}

- (BOOL)_handlePhysicalButton:(unint64_t)a3 event:(unint64_t)a4
{
  return 0;
}

- (BOOL)_wheelChangedWithEvent:(id)a3
{
  return 0;
}

- (NTKCrownInputHandlerDelegate)delegate
{
  return (NTKCrownInputHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)useWideIdleCheck
{
  return self->_useWideIdleCheck;
}

- (double)progress
{
  return self->_progress;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
