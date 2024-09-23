@implementation EDMailDropWebViewScriptHandler

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  BOOL v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _ef_log_EDMailDropMetadataGenerator();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_1D2F2C000, v6, OS_LOG_TYPE_INFO, "MailDrop: Received Script message with %@", (uint8_t *)&v12, 0xCu);
  }

  -[EDMailDropWebViewScriptHandler webView](self, "webView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "webView");
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v8 != v7)
    goto LABEL_6;
  -[EDMailDropWebViewScriptHandler handler](self, "handler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (!v10)
  {
    -[EDMailDropWebViewScriptHandler handler](self, "handler");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "body");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v11);

LABEL_6:
  }

}

- (WKWebView)webView
{
  return (WKWebView *)objc_loadWeakRetained((id *)&self->_webView);
}

- (void)setWebView:(id)a3
{
  objc_storeWeak((id *)&self->_webView, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_webView);
}

@end
