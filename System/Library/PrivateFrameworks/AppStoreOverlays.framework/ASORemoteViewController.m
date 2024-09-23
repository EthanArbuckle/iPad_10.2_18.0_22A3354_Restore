@implementation ASORemoteViewController

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASORemoteViewController;
  -[_UIRemoteViewController viewServiceDidTerminateWithError:](&v11, sel_viewServiceDidTerminateWithError_, v4);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "localizedDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl(&dword_20D888000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "View service did terminate with error: %@", buf, 0xCu);

  }
  -[ASORemoteViewController delegate](self, "delegate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[ASORemoteViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[ASORemoteViewController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "viewServiceDidTerminateWithError:", v4);

    }
  }

}

- (ASORemoteViewControllerDelegate)delegate
{
  return (ASORemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
