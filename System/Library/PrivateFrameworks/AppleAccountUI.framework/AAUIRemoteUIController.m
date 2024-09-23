@implementation AAUIRemoteUIController

- (AAUIRemoteUIController)init
{
  +[RemoteUICustomComponentFactory registerRemoteUISwiftViews](RemoteUICustomComponentFactory, "registerRemoteUISwiftViews");
  return -[AAUIRemoteUIController initWithIdentifier:](self, "initWithIdentifier:", 0);
}

- (AAUIRemoteUIController)initWithIdentifier:(id)a3
{
  return -[AAUIRemoteUIController initWithIdentifier:account:](self, "initWithIdentifier:account:", a3, 0);
}

- (AAUIRemoteUIController)initWithIdentifier:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  AAUIRemoteUIController *v8;
  uint64_t v9;
  NSString *identifier;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AAUIRemoteUIController;
  v8 = -[AAUIRemoteUIController init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00140]), "initWithIdentifier:", v6);
    objc_msgSend(v11, "set_appleIDContext:", v12);

    -[AAUIRemoteUIController setSessionConfiguration:](v8, "setSessionConfiguration:", v11);
    -[AAUIRemoteUIController registerAppleAccountAvatarPickerView](v8, "registerAppleAccountAvatarPickerView");
    if (v7)
      -[AAUIRemoteUIController addAccountUserInfoWithAccount:](v8, "addAccountUserInfoWithAccount:", v7);
    +[RemoteUICustomComponentFactory registerRemoteUISwiftViews](RemoteUICustomComponentFactory, "registerRemoteUISwiftViews");

  }
  return v8;
}

- (void)registerAppleAccountAvatarPickerView
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AAUIRemoteUIController;
  -[RemoteUIController registerAppleAccountAvatarPickerView](&v2, sel_registerAppleAccountAvatarPickerView);
}

- (void)registerSIWASharingTipView
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AAUIRemoteUIController;
  -[RemoteUIController registerSIWASharingTipView](&v2, sel_registerSIWASharingTipView);
}

- (void)addAccountUserInfoWithAccount:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AAUIRemoteUIController;
  -[RemoteUIController addAccountUserInfoWithAccount:](&v3, sel_addAccountUserInfoWithAccount_, a3);
}

- (id)loader:(id)a3 connection:(id)a4 willSendRequest:(id)a5 redirectResponse:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[AAUIRemoteUIController setRedirectResponse:](self, "setRedirectResponse:", v13);
  v16.receiver = self;
  v16.super_class = (Class)AAUIRemoteUIController;
  -[AAUIRemoteUIController loader:connection:willSendRequest:redirectResponse:](&v16, sel_loader_connection_willSendRequest_redirectResponse_, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { identifier: %@ }>"), v5, self, self->_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)loader:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  objc_msgSend(v9, "protectionSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "authenticationMethod");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB32C8]);

  if ((v13 & 1) == 0)
    goto LABEL_6;
  v14 = (void *)MEMORY[0x1E0CFABD8];
  objc_msgSend(v9, "protectionSpace");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "host");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = objc_msgSend(v14, "isSetupServiceHost:", v16);

  if ((v14 & 1) == 0)
  {
LABEL_6:
    -[AAUIRemoteUIController _loader:didReceiveChallenge:completionHandler:](self, "_loader:didReceiveChallenge:completionHandler:", v8, v9, v10);
    goto LABEL_7;
  }
  objc_msgSend(v9, "protectionSpace");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "serverTrust");

  if (!v18)
  {
    _AAUILogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[AAUIRemoteUIController loader:didReceiveChallenge:completionHandler:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_12;
  }
  if ((objc_msgSend(MEMORY[0x1E0CFABD8], "isValidCertificateTrust:", v18) & 1) == 0)
  {
    _AAUILogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[AAUIRemoteUIController loader:didReceiveChallenge:completionHandler:].cold.2(v20, v28, v29, v30, v31, v32, v33, v34);
LABEL_12:

    v10[2](v10, 2, 0);
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB39A8], "credentialForTrust:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v19);

LABEL_7:
}

- (void)_loader:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  objc_super v11;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  if (objc_msgSend((id)-[AAUIRemoteUIController superclass](self, "superclass"), "instancesRespondToSelector:", sel_loader_didReceiveChallenge_completionHandler_))
  {
    v11.receiver = self;
    v11.super_class = (Class)AAUIRemoteUIController;
    -[AAUIRemoteUIController loader:didReceiveChallenge:completionHandler:](&v11, sel_loader_didReceiveChallenge_completionHandler_, v8, v9, v10);
  }
  else
  {
    v10[2](v10, 1, 0);
  }

}

- (void)loader:(id)a3 willLoadRequest:(id)a4 redirectResponse:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, id, _QWORD);
  objc_super v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_storeStrong((id *)&self->_currentRequest, a4);
  v13 = (void (**)(id, id, _QWORD))a6;
  if (objc_msgSend((id)-[AAUIRemoteUIController superclass](self, "superclass"), "instancesRespondToSelector:", sel_loader_willLoadRequest_redirectResponse_completionHandler_))
  {
    v14.receiver = self;
    v14.super_class = (Class)AAUIRemoteUIController;
    -[AAUIRemoteUIController loader:willLoadRequest:redirectResponse:completionHandler:](&v14, sel_loader_willLoadRequest_redirectResponse_completionHandler_, v10, v11, v12, v13);
  }
  else
  {
    v13[2](v13, v11, 0);
  }

}

- (id)loader:(id)a3 willLoadRequest:(id)a4 redirectResponse:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_storeStrong((id *)&self->_currentRequest, a4);
  if (objc_msgSend((id)-[AAUIRemoteUIController superclass](self, "superclass"), "instancesRespondToSelector:", sel_loader_willLoadRequest_redirectResponse_))
  {
    v14.receiver = self;
    v14.super_class = (Class)AAUIRemoteUIController;
    -[AAUIRemoteUIController loader:willLoadRequest:redirectResponse:](&v14, sel_loader_willLoadRequest_redirectResponse_, v8, v9, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v9;
  }
  v12 = v11;

  return v12;
}

- (void)loader:(id)a3 didReceiveHTTPResponse:(id)a4
{
  id v6;
  id v7;
  NSURLRequest *currentRequest;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend((id)-[AAUIRemoteUIController superclass](self, "superclass"), "instancesRespondToSelector:", sel_loader_didReceiveHTTPResponse_))
  {
    v9.receiver = self;
    v9.super_class = (Class)AAUIRemoteUIController;
    -[AAUIRemoteUIController loader:didReceiveHTTPResponse:](&v9, sel_loader_didReceiveHTTPResponse_, v6, v7);
  }
  currentRequest = self->_currentRequest;
  self->_currentRequest = 0;

}

- (void)loader:(id)a3 didFinishLoadWithError:(id)a4
{
  id v6;
  id v7;
  NSURLRequest *currentRequest;
  objc_super v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend((id)-[AAUIRemoteUIController superclass](self, "superclass"), "instancesRespondToSelector:", sel_loader_didFinishLoadWithError_))
  {
    v9.receiver = self;
    v9.super_class = (Class)AAUIRemoteUIController;
    -[AAUIRemoteUIController loader:didFinishLoadWithError:](&v9, sel_loader_didFinishLoadWithError_, v6, v7);
  }
  currentRequest = self->_currentRequest;
  self->_currentRequest = 0;

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSURLRequest)currentRequest
{
  return self->_currentRequest;
}

- (NSHTTPURLResponse)redirectResponse
{
  return self->_redirectResponse;
}

- (void)setRedirectResponse:(id)a3
{
  objc_storeStrong((id *)&self->_redirectResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redirectResponse, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)loader:(uint64_t)a3 didReceiveChallenge:(uint64_t)a4 completionHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, a1, a3, "No certificate to validate, bailing!", a5, a6, a7, a8, 0);
}

- (void)loader:(uint64_t)a3 didReceiveChallenge:(uint64_t)a4 completionHandler:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DB4ED000, a1, a3, "Failed to validate certificate, bailing!", a5, a6, a7, a8, 0);
}

@end
