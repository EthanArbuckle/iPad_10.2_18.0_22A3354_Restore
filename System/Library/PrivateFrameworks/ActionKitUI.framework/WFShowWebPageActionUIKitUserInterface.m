@implementation WFShowWebPageActionUIKitUserInterface

- (void)showURL:(id)a3 readerView:(BOOL)a4 completion:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD block[4];
  id v16;
  WFShowWebPageActionUIKitUserInterface *v17;
  BOOL v18;

  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFShowWebPageActionUIKitUserInterface.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("URL"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFShowWebPageActionUIKitUserInterface.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  -[WFShowWebPageActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v11);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__WFShowWebPageActionUIKitUserInterface_showURL_readerView_completion___block_invoke;
  block[3] = &unk_24E343808;
  v18 = a4;
  v16 = v9;
  v17 = self;
  v12 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)showRichText:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD block[4];
  id v14;
  WFShowWebPageActionUIKitUserInterface *v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFShowWebPageActionUIKitUserInterface.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("file"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFShowWebPageActionUIKitUserInterface.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  -[WFShowWebPageActionUIKitUserInterface setRichTextFile:](self, "setRichTextFile:", v7);
  -[WFShowWebPageActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v9);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__WFShowWebPageActionUIKitUserInterface_showRichText_completion___block_invoke;
  block[3] = &unk_24E3439C0;
  v14 = v7;
  v15 = self;
  v10 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFShowWebPageActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __81__WFShowWebPageActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFShowWebPageActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFEmbeddableActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

}

- (void)finishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[WFShowWebPageActionUIKitUserInterface completionHandler](self, "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFShowWebPageActionUIKitUserInterface completionHandler](self, "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
  -[WFShowWebPageActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);
  -[WFShowWebPageActionUIKitUserInterface setRichTextFile:](self, "setRichTextFile:", 0);

}

- (void)safariViewControllerDidFinish:(id)a3
{
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate", a3);
  lastDismissed = v4;
  -[WFShowWebPageActionUIKitUserInterface finishWithError:](self, "finishWithError:", 0);
}

- (void)safariViewControllerWillOpenInBrowser:(id)a3
{
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate", a3);
  lastDismissed = v4;
  -[WFShowWebPageActionUIKitUserInterface finishWithError:](self, "finishWithError:", 0);
}

- (void)webViewControllerDidFinish:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __68__WFShowWebPageActionUIKitUserInterface_webViewControllerDidFinish___block_invoke;
  v3[3] = &unk_24E343958;
  v3[4] = self;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v3);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFShowWebPageActionUIKitUserInterface finishWithError:](self, "finishWithError:", v4);

}

- (WFFileRepresentation)richTextFile
{
  return self->_richTextFile;
}

- (void)setRichTextFile:(id)a3
{
  objc_storeStrong((id *)&self->_richTextFile, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_richTextFile, 0);
}

uint64_t __68__WFShowWebPageActionUIKitUserInterface_webViewControllerDidFinish___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", 0);
}

uint64_t __81__WFShowWebPageActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithError:", v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __65__WFShowWebPageActionUIKitUserInterface_showRichText_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  WFWebViewController *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  objc_msgSend(MEMORY[0x24BE19678], "webResourceWithFile:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v3 = (void *)getWKWebViewClass_softClass;
  v23 = getWKWebViewClass_softClass;
  if (!getWKWebViewClass_softClass)
  {
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __getWKWebViewClass_block_invoke;
    v18 = &unk_24E343A50;
    v19 = &v20;
    __getWKWebViewClass_block_invoke((uint64_t)&v15);
    v3 = (void *)v21[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v20, 8);
  v5 = [v4 alloc];
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v6 = (void *)getWKWebViewConfigurationClass_softClass;
  v23 = getWKWebViewConfigurationClass_softClass;
  if (!getWKWebViewConfigurationClass_softClass)
  {
    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __getWKWebViewConfigurationClass_block_invoke;
    v18 = &unk_24E343A50;
    v19 = &v20;
    __getWKWebViewConfigurationClass_block_invoke((uint64_t)&v15);
    v6 = (void *)v21[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v20, 8);
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_msgSend(v5, "initWithFrame:configuration:", v8, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

  v10 = (id)objc_msgSend(v2, "loadInWKWebView:", v9);
  v11 = -[WFWebViewController initWithWebView:]([WFWebViewController alloc], "initWithWebView:", v9);
  -[WFWebViewController setDelegate:](v11, "setDelegate:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v11);
  v13 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v12, "presentationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", v13);

  objc_msgSend(*(id *)(a1 + 40), "presentContent:", v12);
}

void __71__WFShowWebPageActionUIKitUserInterface_showURL_readerView_completion___block_invoke(uint64_t a1)
{
  double v2;
  int64_t v4;
  dispatch_time_t v5;
  id v6;
  uint64_t v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  char v11;

  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  if (v2 - *(double *)&lastDismissed >= 0.55 || *(double *)&lastDismissed == 0.0)
    v4 = 0;
  else
    v4 = 550000000;
  v5 = dispatch_time(0, v4);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__WFShowWebPageActionUIKitUserInterface_showURL_readerView_completion___block_invoke_2;
  block[3] = &unk_24E343808;
  v11 = *(_BYTE *)(a1 + 48);
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9 = v6;
  v10 = v7;
  dispatch_after(v5, MEMORY[0x24BDAC9B8], block);

}

void __71__WFShowWebPageActionUIKitUserInterface_showURL_readerView_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v2 = (void *)getSFSafariViewControllerConfigurationClass_softClass;
  v18 = getSFSafariViewControllerConfigurationClass_softClass;
  if (!getSFSafariViewControllerConfigurationClass_softClass)
  {
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __getSFSafariViewControllerConfigurationClass_block_invoke;
    v13 = &unk_24E343A50;
    v14 = &v15;
    __getSFSafariViewControllerConfigurationClass_block_invoke((uint64_t)&v10);
    v2 = (void *)v16[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v15, 8);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setEntersReaderIfAvailable:", *(unsigned __int8 *)(a1 + 48));
  v15 = 0;
  v16 = &v15;
  v17 = 0x2050000000;
  v5 = (void *)getSFSafariViewControllerClass_softClass;
  v18 = getSFSafariViewControllerClass_softClass;
  if (!getSFSafariViewControllerClass_softClass)
  {
    v10 = MEMORY[0x24BDAC760];
    v11 = 3221225472;
    v12 = __getSFSafariViewControllerClass_block_invoke;
    v13 = &unk_24E343A50;
    v14 = &v15;
    __getSFSafariViewControllerClass_block_invoke((uint64_t)&v10);
    v5 = (void *)v16[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v15, 8);
  v7 = (void *)objc_msgSend([v6 alloc], "initWithURL:configuration:", *(_QWORD *)(a1 + 32), v4);
  objc_msgSend(v7, "setModalPresentationStyle:", 1);
  objc_msgSend(v7, "setDelegate:", *(_QWORD *)(a1 + 40));
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v7, "presentationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", v8);

  objc_msgSend(*(id *)(a1 + 40), "presentContent:", v7);
}

@end
