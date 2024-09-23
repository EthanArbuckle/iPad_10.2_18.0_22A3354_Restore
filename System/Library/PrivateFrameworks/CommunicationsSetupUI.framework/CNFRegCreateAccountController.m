@implementation CNFRegCreateAccountController

- (void)dealloc
{
  objc_super v2;

  self->_delegate = 0;
  v2.receiver = self;
  v2.super_class = (Class)CNFRegCreateAccountController;
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
    return CFSTR("md-profile-setup-page");
  else
    return CFSTR("vc-profile-setup-page");
}

- (id)logName
{
  return CFSTR("CreateAccount");
}

- (void)cancelTapped
{
  id v3;

  -[CNFRegCreateAccountController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createAccountControllerDidFinish:withAppleId:authID:authToken:", self, 0, 0, 0);

}

- (void)completeHandoffWithStatus:(int)a3 appleID:(id)a4 authID:(id)a5 authToken:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  -[CNFRegCreateAccountController delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createAccountControllerDidFinish:withAppleId:authID:authToken:", self, v11, v10, v9);

}

- (CNFRegCreateAccountControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CNFRegCreateAccountControllerDelegate *)a3;
}

@end
