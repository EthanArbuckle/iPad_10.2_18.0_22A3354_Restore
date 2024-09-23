@implementation WFOpenInActionUIKitUserInterface

- (void)showWithFile:(id)a3 contentManaged:(BOOL)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD block[4];
  id v16;
  WFOpenInActionUIKitUserInterface *v17;
  BOOL v18;

  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOpenInActionUIKitUserInterface.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("file"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOpenInActionUIKitUserInterface.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  -[WFOpenInActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v11);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__WFOpenInActionUIKitUserInterface_showWithFile_contentManaged_completionHandler___block_invoke;
  block[3] = &unk_24E343808;
  v16 = v9;
  v17 = self;
  v18 = a4;
  v12 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)finishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[WFOpenInActionUIKitUserInterface completionHandler](self, "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFOpenInActionUIKitUserInterface completionHandler](self, "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
  -[WFOpenInActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFOpenInActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __76__WFOpenInActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFOpenInActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

}

- (void)documentInteractionControllerDidDismissOpenInMenu:(id)a3
{
  -[WFOpenInActionUIKitUserInterface setDocumentController:](self, "setDocumentController:", 0);
  -[WFOpenInActionUIKitUserInterface finishWithError:](self, "finishWithError:", 0);
}

- (id)excludedActivityTypesForDocumentInteractionController:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v4[0] = *MEMORY[0x24BE8F690];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIDocumentInteractionController)documentController
{
  return self->_documentController;
}

- (void)setDocumentController:(id)a3
{
  objc_storeStrong((id *)&self->_documentController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentController, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

uint64_t __76__WFOpenInActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithError:", v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __82__WFOpenInActionUIKitUserInterface_showWithFile_contentManaged_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  char v16;
  void *v17;
  id v18;

  v2 = (void *)MEMORY[0x24BE8F668];
  objc_msgSend(*(id *)(a1 + 32), "wrappedURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interactionControllerWithURL:", v4);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v18, "setIsContentManaged:", *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "viewControllerForPresenting");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v5, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v18, "presentOpenInMenuFromRect:inView:animated:", v15, 1, v8, v10, v12, v14);

  v17 = *(void **)(a1 + 40);
  if ((v16 & 1) != 0)
    objc_msgSend(v17, "setDocumentController:", v18);
  else
    objc_msgSend(v17, "finishWithError:", 0);

}

@end
