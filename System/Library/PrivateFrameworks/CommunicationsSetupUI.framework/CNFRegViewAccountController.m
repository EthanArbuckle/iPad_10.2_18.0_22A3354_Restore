@implementation CNFRegViewAccountController

- (void)dealloc
{
  objc_super v2;

  self->_delegate = 0;
  v2.receiver = self;
  v2.super_class = (Class)CNFRegViewAccountController;
  -[CNFRegAccountWebViewController dealloc](&v2, sel_dealloc);
}

- (id)logName
{
  return CFSTR("ViewAccount");
}

- (id)bagKey
{
  void *v2;
  uint64_t v3;

  -[CNFRegServerWebViewController regController](self, "regController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "serviceType");

  if (v3 == 1)
    return CFSTR("md-profile-edit-page");
  else
    return CFSTR("vc-profile-edit-page");
}

- (void)cancelTapped
{
  id v3;

  -[CNFRegViewAccountController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewAccountControllerDidFinish:withAppleId:", self, 0);

}

- (void)completeHandoffWithStatus:(int)a3 appleID:(id)a4 authID:(id)a5 authToken:(id)a6
{
  id v7;
  id v8;

  v7 = a4;
  -[CNFRegViewAccountController delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewAccountControllerDidFinish:withAppleId:", self, v7);

}

- (CNFRegViewAccountControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CNFRegViewAccountControllerDelegate *)a3;
}

@end
