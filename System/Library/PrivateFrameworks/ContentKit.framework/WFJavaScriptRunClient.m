@implementation WFJavaScriptRunClient

- (WFJavaScriptRunClient)initWithEndpoint:(id)a3
{
  id v6;
  WFJavaScriptRunClient *v7;
  WFJavaScriptRunClient *v8;
  WFJavaScriptRunClient *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFJavaScriptRunner.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endpoint"));

  }
  v12.receiver = self;
  v12.super_class = (Class)WFJavaScriptRunClient;
  v7 = -[WFJavaScriptRunClient init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_endpoint, a3);
    v9 = v8;
  }

  return v8;
}

- (void)runJavaScript:(id)a3 completionHandler:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x24BDD1988];
  v8 = a3;
  v9 = [v7 alloc];
  -[WFJavaScriptRunClient endpoint](self, "endpoint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithListenerEndpoint:", v10);

  WFJavaScriptRunnerHostProtocolXPCInterface();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRemoteObjectInterface:", v12);

  objc_msgSend(v11, "resume");
  objc_msgSend(v11, "remoteObjectProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __57__WFJavaScriptRunClient_runJavaScript_completionHandler___block_invoke;
  v16[3] = &unk_24C4E0998;
  v17 = v11;
  v18 = v6;
  v14 = v6;
  v15 = v11;
  objc_msgSend(v13, "runJavaScript:completionHandler:", v8, v16);

}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
}

void __57__WFJavaScriptRunClient_runJavaScript_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

@end
