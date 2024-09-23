@implementation FPUIActionRemoteViewController

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_25591FC08);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255922DF0);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FPUIActionRemoteViewController;
  v4 = a3;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v6, sel_viewServiceDidTerminateWithError_, v4);
  -[FPUIActionRemoteViewController delegate](self, "delegate", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteActionControllerDidFinishAction:error:", self, v4);

}

- (FPUIActionRemoteViewControllerDelegate)delegate
{
  return (FPUIActionRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
