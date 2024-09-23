@implementation CNFRegAccountAuthorizationController

- (CNFRegAccountAuthorizationController)initWithRegController:(id)a3 authID:(id)a4 token:(id)a5
{
  id v8;
  id v9;
  CNFRegAccountAuthorizationController *v10;
  CNFRegAccountAuthorizationController *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CNFRegAccountAuthorizationController;
  v10 = -[CNFRegAccountWebViewController initWithRegController:](&v13, sel_initWithRegController_, a3);
  v11 = v10;
  if (v10)
  {
    -[CNFRegAccountAuthorizationController setAuthID:](v10, "setAuthID:", v8);
    -[CNFRegAccountAuthorizationController setAuthToken:](v11, "setAuthToken:", v9);
  }

  return v11;
}

- (void)dealloc
{
  objc_super v2;

  self->_delegate = 0;
  v2.receiver = self;
  v2.super_class = (Class)CNFRegAccountAuthorizationController;
  -[CNFRegAccountWebViewController dealloc](&v2, sel_dealloc);
}

- (id)bagKey
{
  void *v2;
  uint64_t v3;

  -[CNFRegServerWebViewController regController](self, "regController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "serviceType");

  if (v3 == 1)
    return CFSTR("md-profile-authorize");
  else
    return CFSTR("vc-profile-authorize");
}

- (id)logName
{
  return CFSTR("AccountAuthorize");
}

- (void)cancelTapped
{
  id v3;

  -[CNFRegAccountAuthorizationController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authorizationController:authorizedAccount:", self, 0);

}

- (void)completeHandoffWithStatus:(int)a3 appleID:(id)a4 authID:(id)a5 authToken:(id)a6
{
  _BOOL8 v7;
  id v8;

  v7 = a3 == 0;
  -[CNFRegAccountAuthorizationController delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "authorizationController:authorizedAccount:", self, v7);

}

- (NSString)authID
{
  return self->_authID;
}

- (void)setAuthID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (NSString)authToken
{
  return self->_authToken;
}

- (void)setAuthToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (CNFRegAccountAuthorizationDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CNFRegAccountAuthorizationDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_authID, 0);
}

@end
