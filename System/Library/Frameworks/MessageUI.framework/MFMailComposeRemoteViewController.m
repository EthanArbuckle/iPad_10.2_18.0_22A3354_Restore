@implementation MFMailComposeRemoteViewController

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("ComposeServiceRemoteViewController"), CFSTR("com.apple.MailCompositionService"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC5AC0]) & 1) != 0)
    {
      v7 = objc_msgSend(v5, "code");

      if (v7 == 1)
        goto LABEL_9;
    }
    else
    {

    }
    MFLogGeneral();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1AB96A000, v8, OS_LOG_TYPE_DEFAULT, "#Warning %@", (uint8_t *)&v10, 0xCu);
    }

  }
LABEL_9:
  -[MFMailComposeRemoteViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "compositionViewServiceTerminatedWithError:", v5);

}

- (void)serviceCompositionFinishedWithResult:(int64_t)a3 error:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  -[MFMailComposeRemoteViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "compositionFinishedWithResult:error:", a3, v7);

}

- (void)serviceCompositionRequestsSendWithBody:(id)a3 recipients:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  -[MFMailComposeRemoteViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "compositionRequestsSendWithBody:recipients:completion:", v11, v8, v9);

}

- (void)bodyFinishedDrawing
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("_MFMailComposeViewControllerFirstDrawNotification"), self);

}

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "mf_mailComposeRemoteServiceInterface");
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "mf_mailComposeRemoteHostInterface");
}

- (MFMailComposeRemoteViewControllerDelegate)delegate
{
  return (MFMailComposeRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
