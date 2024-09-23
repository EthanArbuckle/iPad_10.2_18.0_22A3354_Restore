@implementation MUWebViewFactoryItem

- (MUWebViewFactoryItem)initWithBridgeConfiguration:(id)a3 webView:(id)a4 messageHandlerProxy:(id)a5
{
  id v8;
  id v9;
  id v10;
  MUWebViewFactoryItem *v11;
  uint64_t v12;
  MUWebBridgeConfiguration *bridgeConfiguration;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MUWebViewFactoryItem;
  v11 = -[MUWebViewFactoryItem init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    bridgeConfiguration = v11->_bridgeConfiguration;
    v11->_bridgeConfiguration = (MUWebBridgeConfiguration *)v12;

    objc_storeStrong((id *)&v11->_webView, a4);
    objc_storeStrong((id *)&v11->_messageHandlerProxy, a5);
  }

  return v11;
}

- (MUWebBridgeConfiguration)bridgeConfiguration
{
  return self->_bridgeConfiguration;
}

- (WKWebView)webView
{
  return self->_webView;
}

- (MUWebViewMessageHandlerProxy)messageHandlerProxy
{
  return self->_messageHandlerProxy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageHandlerProxy, 0);
  objc_storeStrong((id *)&self->_webView, 0);
  objc_storeStrong((id *)&self->_bridgeConfiguration, 0);
}

@end
