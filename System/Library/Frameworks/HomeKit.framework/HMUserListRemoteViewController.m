@implementation HMUserListRemoteViewController

- (void)viewServiceDidTerminateWithError:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMErrorDomain"), 79, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HMUserListRemoteViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userManagementDidFinishWithError:", v5);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMUserListRemoteViewController;
  -[HMUserListRemoteViewController viewDidLoad](&v5, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMUserListRemoteViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

}

- (void)userManagementDidLoad
{
  id v2;

  -[HMUserListRemoteViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userManagementDidLoad");

}

- (void)userManagementDidFinishWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMUserListRemoteViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userManagementDidFinishWithError:", v4);

}

- (HMUserManagementRemoteHost)delegate
{
  return (HMUserManagementRemoteHost *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("HSUserListNavigationViewController"), CFSTR("com.apple.Home.HomeUIService"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "hm_userManagementRemoteServiceInterface");
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "hm_userManagementRemoteHostInterface");
}

@end
