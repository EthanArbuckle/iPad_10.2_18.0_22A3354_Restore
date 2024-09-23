@implementation DDRemoteActionHostViewController

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DDRemoteActionHostViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "DDRemoteActionDidTerminateWithError:", v4);

}

- (DDRemoteActionHostViewControllerDelegate)delegate
{
  return (DDRemoteActionHostViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
