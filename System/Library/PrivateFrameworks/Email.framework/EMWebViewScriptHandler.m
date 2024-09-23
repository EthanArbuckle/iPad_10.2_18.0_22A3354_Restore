@implementation EMWebViewScriptHandler

+ (void)addScriptHandlerForWebView:(id)a3 key:(id)a4 handler:(id)a5
{
  id v9;
  id v10;
  EMWebViewScriptHandler *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = a5;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("EMWebViewScriptHandler.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("webView"));

  }
  v11 = objc_alloc_init(EMWebViewScriptHandler);
  -[EMWebViewScriptHandler setName:](v11, "setName:", v9);
  -[EMWebViewScriptHandler setWebView:](v11, "setWebView:", v16);
  -[EMWebViewScriptHandler setHandler:](v11, "setHandler:", v10);
  objc_msgSend(v16, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userContentController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMWebViewScriptHandler name](v11, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addScriptMessageHandler:name:", v11, v14);

}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[EMWebViewScriptHandler webView](self, "webView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "webView");
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v6 != v5)
    goto LABEL_4;
  -[EMWebViewScriptHandler handler](self, "handler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[EMWebViewScriptHandler handler](self, "handler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "body");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v6)[2](v6, v8);

LABEL_4:
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
