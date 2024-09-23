@implementation _MXExtensionHostContext

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[_MXExtensionHostContext URLHandlingDelegate](self, "URLHandlingDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53___MXExtensionHostContext_openURL_completionHandler___block_invoke;
  v10[3] = &unk_1E20D8688;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "openURL:completionHandler:", v7, v10);

}

- (_MXExtensionURLHandling)URLHandlingDelegate
{
  return (_MXExtensionURLHandling *)objc_loadWeakRetained((id *)&self->_URLHandlingDelegate);
}

- (void)setURLHandlingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_URLHandlingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_URLHandlingDelegate);
}

@end
