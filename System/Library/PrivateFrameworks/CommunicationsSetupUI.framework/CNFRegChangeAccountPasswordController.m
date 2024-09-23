@implementation CNFRegChangeAccountPasswordController

- (CNFRegChangeAccountPasswordController)initWithRegController:(id)a3 appleID:(id)a4
{
  id v6;
  CNFRegChangeAccountPasswordController *v7;
  CNFRegChangeAccountPasswordController *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CNFRegChangeAccountPasswordController;
  v7 = -[CNFRegAccountWebViewController initWithRegController:](&v10, sel_initWithRegController_, a3);
  v8 = v7;
  if (v7)
    -[CNFRegChangeAccountPasswordController setAppleID:](v7, "setAppleID:", v6);

  return v8;
}

- (void)dealloc
{
  objc_super v2;

  self->_delegate = 0;
  v2.receiver = self;
  v2.super_class = (Class)CNFRegChangeAccountPasswordController;
  -[CNFRegAccountWebViewController dealloc](&v2, sel_dealloc);
}

- (void)setHeadersForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNFRegChangeAccountPasswordController;
  -[CNFRegAuthorizedAccountWebViewController setHeadersForRequest:](&v8, sel_setHeadersForRequest_, v4);
  -[CNFRegAccountWebViewController pushTokenHeaderValue](self, "pushTokenHeaderValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "__imHexString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addValue:forHTTPHeaderField:", v7, CFSTR("x-push-token"));

  }
}

- (BOOL)canSendURLRequest:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  uint8_t v9[16];
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNFRegChangeAccountPasswordController;
  if (!-[CNFRegAuthorizedAccountWebViewController canSendURLRequest:](&v10, sel_canSendURLRequest_, v4))
  {
LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v4, "valueForHTTPHeaderField:", CFSTR("x-push-token"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
    {
      OSLogHandleForIDSCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_2138BA000, v7, OS_LOG_TYPE_DEFAULT, "No push token header for request, denying send", v9, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        IMLogString();
    }
    goto LABEL_10;
  }
  v6 = 1;
LABEL_11:

  return v6;
}

- (id)bagKey
{
  void *v2;
  uint64_t v3;

  -[CNFRegServerWebViewController regController](self, "regController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "serviceType");

  if (v3 == 1)
    return CFSTR("md-profile-password-change");
  else
    return CFSTR("vc-profile-password-change");
}

- (id)logName
{
  return CFSTR("ChangePassword");
}

- (id)overrideURLForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CNFRegChangeAccountPasswordController appleID](self, "appleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = v4;
  if (v5)
  {
    v7 = v4;
    if (objc_msgSend(v5, "length"))
    {
      if (-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
      {
        OSLogHandleForIDSCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v13 = v6;
          _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "Appending login {%@} to password change URL", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        {
          v11 = v6;
          IMLogString();
        }
      }
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v6, CFSTR("appleId"), v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "URLByAppendingCNFQueryDictionary:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

- (void)cancelTapped
{
  id v3;

  -[CNFRegChangeAccountPasswordController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "changePasswordControllerDidCancel:", self);

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
  -[CNFRegChangeAccountPasswordController delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "changePasswordControllerDidFinish:withAppleID:authID:authToken:", self, v11, v10, v9);

}

- (CNFRegChangeAccountPasswordDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CNFRegChangeAccountPasswordDelegate *)a3;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (void)setAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleID, 0);
}

@end
