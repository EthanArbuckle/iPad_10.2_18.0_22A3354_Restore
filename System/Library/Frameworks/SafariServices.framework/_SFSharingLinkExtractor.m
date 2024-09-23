@implementation _SFSharingLinkExtractor

- (_SFSharingLinkExtractor)initWithWebView:(id)a3
{
  id v4;
  _SFSharingLinkExtractor *v5;
  _SFSharingLinkExtractor *v6;
  _SFSharingLinkExtractor *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFSharingLinkExtractor;
  v5 = -[_SFSharingLinkExtractor init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_webView, v4);
    v7 = v6;
  }

  return v6;
}

- (void)fetchSharingLinkWithCompletionHandler:(id)a3
{
  WKWebView **p_webView;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  p_webView = &self->_webView;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_webView);
  objc_msgSend(WeakRetained, "_remoteObjectRegistry");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EE791548);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxyWithInterface:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchSharingLinkWithCompletionHandler:", v4);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_webView);
}

@end
