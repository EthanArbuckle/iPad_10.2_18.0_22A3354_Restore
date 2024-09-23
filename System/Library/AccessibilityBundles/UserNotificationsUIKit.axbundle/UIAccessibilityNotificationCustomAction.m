@implementation UIAccessibilityNotificationCustomAction

- (id)control
{
  return objc_loadWeakRetained(&self->_control);
}

- (void)setControl:(id)a3
{
  objc_storeWeak(&self->_control, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_control);
}

@end
