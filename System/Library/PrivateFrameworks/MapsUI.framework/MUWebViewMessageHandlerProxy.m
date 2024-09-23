@implementation MUWebViewMessageHandlerProxy

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[MUWebViewMessageHandlerProxy target](self, "target");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "userContentController:didReceiveScriptMessage:", v7, v6);

}

- (WKScriptMessageHandler)target
{
  return (WKScriptMessageHandler *)objc_loadWeakRetained((id *)&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak((id *)&self->_target, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_target);
}

@end
