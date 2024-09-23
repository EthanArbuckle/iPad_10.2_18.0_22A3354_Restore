@implementation CKSMSComposeRemoteViewController

- (void)dealloc
{
  objc_super v3;

  -[CKSMSComposeRemoteViewController setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CKSMSComposeRemoteViewController;
  -[_UIRemoteViewController dealloc](&v3, sel_dealloc);
}

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("CKSMSComposeViewServiceController"), CFSTR("com.apple.mobilesms.compose"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CKSMSComposeRemoteViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKSMSComposeRemoteViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewServiceDidTerminateWithError:", v6);

  }
}

- (void)smsComposeControllerDataInserted
{
  id v2;

  -[CKSMSComposeRemoteViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "smsComposeControllerDataInserted");

}

- (void)smsComposeControllerAppeared
{
  id v2;

  -[CKSMSComposeRemoteViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "smsComposeControllerAppeared");

}

- (void)smsComposeControllerShouldSendMessageWithText:(id)a3 toRecipients:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CKSMSComposeRemoteViewController delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "smsComposeControllerShouldSendMessageWithText:toRecipients:completion:", v10, v9, v8);

}

- (void)smsComposeControllerSendStartedWithText:(id)a3 messageGUID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CKSMSComposeRemoteViewController delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "smsComposeControllerSendStartedWithText:messageGUID:", v7, v6);

}

- (void)smsComposeControllerCancelled
{
  id v2;

  -[CKSMSComposeRemoteViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "smsComposeControllerCancelled");

}

- (void)smsComposeControllerEntryViewContentInserted
{
  id v2;

  -[CKSMSComposeRemoteViewController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "smsComposeControllerEntryViewContentInserted");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_extensionBundleIdentifierForAppProtection
{
  return CFSTR("com.apple.MobileSMS.MessagesNotificationExtension");
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE26D920);
}

+ (id)serviceViewControllerInterface
{
  return +[CKSMSComposeViewServiceController _exportedInterface](CKSMSComposeViewServiceController, "_exportedInterface");
}

- (CKSMSComposeRemoteViewControllerDelegate)delegate
{
  return (CKSMSComposeRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
