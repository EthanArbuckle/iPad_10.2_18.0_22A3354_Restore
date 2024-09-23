@implementation APEmergencyCallHostViewController

- (void)dismiss
{
  id v3;

  -[APEmergencyCallHostViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[APEmergencyCallHostViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emergencyCallHostViewControllerDidDismiss:", self);

}

- (APEmergencyCallHostViewControllerDelegate)delegate
{
  return (APEmergencyCallHostViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
