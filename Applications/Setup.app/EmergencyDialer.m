@implementation EmergencyDialer

- (void)dismiss
{
  EmergencyDialerDelegate *v2;

  -[EmergencyDialer dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, a2);
  v2 = -[EmergencyDialer delegate](self, "delegate");
  -[EmergencyDialerDelegate dialerDidDismiss:](v2, "dialerDidDismiss:", self);

}

- (unint64_t)supportedInterfaceOrientations
{
  UIDevice *v2;
  id v3;

  v2 = +[UIDevice currentDevice](UIDevice, "currentDevice");
  v3 = -[UIDevice userInterfaceIdiom](v2, "userInterfaceIdiom");

  if (v3 == (id)1)
    return 30;
  else
    return 2;
}

- (EmergencyDialerDelegate)delegate
{
  return (EmergencyDialerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
