@implementation CNFRegAuthorizedAccountWebViewController

- (void)setHeadersForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CNFRegAuthorizedAccountWebViewController;
  -[CNFRegAccountWebViewController setHeadersForRequest:](&v7, sel_setHeadersForRequest_, v4);
  -[CNFRegAccountWebViewController authIdHeaderValue](self, "authIdHeaderValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addValue:forHTTPHeaderField:", v5, CFSTR("x-vc-profile-id"));
  -[CNFRegAccountWebViewController authTokenHeaderValue](self, "authTokenHeaderValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "addValue:forHTTPHeaderField:", v6, CFSTR("x-vc-auth-token"));

}

- (BOOL)canSendURLRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v11[16];
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNFRegAuthorizedAccountWebViewController;
  if (!-[CNFRegAccountWebViewController canSendURLRequest:](&v12, sel_canSendURLRequest_, v4))
    goto LABEL_17;
  objc_msgSend(v4, "valueForHTTPHeaderField:", CFSTR("x-vc-auth-token"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    if (!-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
      goto LABEL_17;
    OSLogHandleForIDSCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_2138BA000, v8, OS_LOG_TYPE_DEFAULT, "No auth token for request, denying send", v11, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || (IMShouldLog() & 1) == 0)
      goto LABEL_17;
LABEL_16:
    IMLogString();
LABEL_17:
    v7 = 0;
    goto LABEL_18;
  }
  objc_msgSend(v4, "valueForHTTPHeaderField:", CFSTR("x-vc-profile-id"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (!-[CNFRegServerWebViewController _shouldLog](self, "_shouldLog"))
      goto LABEL_17;
    OSLogHandleForIDSCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_2138BA000, v9, OS_LOG_TYPE_DEFAULT, "No auth id for request, denying send", v11, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || (IMShouldLog() & 1) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
  v7 = 1;
LABEL_18:

  return v7;
}

@end
