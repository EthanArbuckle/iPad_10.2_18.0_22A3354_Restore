@implementation _SWRemoveParticipantAlertRemoteController

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  return (id)objc_msgSend(a1, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("CKRemoveParticipantAlertServiceViewController"), CFSTR("com.apple.mobilesms.compose"), a3);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v3;

  -[_SWRemoveParticipantAlertRemoteController delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissAlert");

}

- (void)_promptToRemoveParticipant:(id)a3 fromHighlight:(id)a4 preferredStyle:(int64_t)a5
{
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[_UIRemoteViewController serviceViewControllerProxy](self, "serviceViewControllerProxy");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "promptToRemoveParticipant:fromHighlight:usingPreferredStyle:", v12, v8, a5);

  }
}

- (void)dismissAlert
{
  id v2;

  -[_SWRemoveParticipantAlertRemoteController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissAlert");

}

+ (id)serviceViewControllerInterface
{
  if (serviceViewControllerInterface_onceToken != -1)
    dispatch_once(&serviceViewControllerInterface_onceToken, &__block_literal_global_2);
  return (id)serviceViewControllerInterface_interface;
}

+ (id)exportedInterface
{
  if (exportedInterface_onceToken[0] != -1)
    dispatch_once(exportedInterface_onceToken, &__block_literal_global_5);
  return (id)exportedInterface_interface;
}

- (_SWRemoveParticipantAlertRemoteControllerDelegate)delegate
{
  return (_SWRemoveParticipantAlertRemoteControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
