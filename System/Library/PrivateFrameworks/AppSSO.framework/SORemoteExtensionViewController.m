@implementation SORemoteExtensionViewController

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E2398);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E6D98);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SORemoteExtensionViewController;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v11, sel_viewServiceDidTerminateWithError_, v4);
  if (v4)
  {
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDF81C8]))
    {
      v6 = objc_msgSend(v4, "code");

      if (v6 == 1)
        goto LABEL_12;
    }
    else
    {

    }
    if (SO_LOG_SORemoteExtensionViewController_once != -1)
      dispatch_once(&SO_LOG_SORemoteExtensionViewController_once, &__block_literal_global_10);
    v7 = SO_LOG_SORemoteExtensionViewController_log;
    if (os_log_type_enabled((os_log_t)SO_LOG_SORemoteExtensionViewController_log, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v4;
      _os_log_impl(&dword_20DABC000, v7, OS_LOG_TYPE_INFO, "viewServiceDidTerminateWithError: %{public}@", buf, 0xCu);
    }
    -[SORemoteExtensionViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[SORemoteExtensionViewController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "viewServiceDidTerminateWithError:", v4);

    }
  }
LABEL_12:

}

- (SORemoteExtensionViewControllerDelegate)delegate
{
  return (SORemoteExtensionViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
