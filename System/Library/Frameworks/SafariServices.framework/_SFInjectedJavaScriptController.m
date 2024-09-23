@implementation _SFInjectedJavaScriptController

- (_SFInjectedJavaScriptController)initWithWebView:(id)a3
{
  id v4;
  _SFInjectedJavaScriptController *v5;
  _SFInjectedJavaScriptController *v6;
  _SFInjectedJavaScriptController *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFInjectedJavaScriptController;
  v5 = -[_SFInjectedJavaScriptController init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_webView, v4);
    v7 = v6;
  }

  return v6;
}

- (id)_webProcessActivityProxy
{
  SFInjectedJavaScriptWebProcessController *activityProxy;
  id WeakRetained;
  void *v5;
  void *v6;
  SFInjectedJavaScriptWebProcessController *v7;
  SFInjectedJavaScriptWebProcessController *v8;

  activityProxy = self->_activityProxy;
  if (!activityProxy)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    objc_msgSend(WeakRetained, "_remoteObjectRegistry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EE770D08);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteObjectProxyWithInterface:", v6);
    v7 = (SFInjectedJavaScriptWebProcessController *)objc_claimAutoreleasedReturnValue();
    v8 = self->_activityProxy;
    self->_activityProxy = v7;

    activityProxy = self->_activityProxy;
  }
  return activityProxy;
}

- (void)runJavaScriptForActivity:(id)a3 withScript:(id)a4 object:(id)a5 invokeMethod:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  -[_SFInjectedJavaScriptController _webProcessActivityProxy](self, "_webProcessActivityProxy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __109___SFInjectedJavaScriptController_runJavaScriptForActivity_withScript_object_invokeMethod_completionHandler___block_invoke;
  v19[3] = &unk_1E4AC6D20;
  v20 = v12;
  v18 = v12;
  objc_msgSend(v17, "runJavaScriptForActivity:withScript:object:invokeMethod:completionHandler:", v16, v15, v14, v13, v19);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityProxy, 0);
  objc_destroyWeak((id *)&self->_webView);
}

@end
