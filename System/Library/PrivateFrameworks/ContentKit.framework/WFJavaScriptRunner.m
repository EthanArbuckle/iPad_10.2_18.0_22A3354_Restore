@implementation WFJavaScriptRunner

- (WFJavaScriptRunner)initWithItemProvider:(id)a3
{
  id v6;
  void *v7;
  WFJavaScriptRunner *v8;
  WFJavaScriptRunner *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFJavaScriptRunner.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemProvider"));

  }
  WFJavaScriptRunnerHostProtocolXPCInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)WFJavaScriptRunner;
  v8 = -[WFSingleConnectionXPCListener initWithExportedObject:exportedInterface:](&v12, sel_initWithExportedObject_exportedInterface_, self, v7);

  if (v8)
  {
    objc_storeStrong((id *)&v8->_itemProvider, a3);
    v9 = v8;
  }

  return v8;
}

- (void)runJavaScript:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  const __CFString *v16;
  id v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v17 = a3;
  v18 = CFSTR("extraArguments");
  v16 = CFSTR("WFJavaScriptToRun");
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFJavaScriptRunner itemProvider](self, "itemProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF8530], "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __54__WFJavaScriptRunner_runJavaScript_completionHandler___block_invoke;
  v14[3] = &unk_24C4E0970;
  v15 = v6;
  v13 = v6;
  objc_msgSend(v11, "loadItemForTypeIdentifier:options:completionHandler:", v12, v10, v14);

}

- (NSItemProvider)itemProvider
{
  return self->_itemProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemProvider, 0);
}

void __54__WFJavaScriptRunner_runJavaScript_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v5 = objc_opt_class();
    WFEnforceClass(v10, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDD0C40]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    WFEnforceClass(v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

@end
