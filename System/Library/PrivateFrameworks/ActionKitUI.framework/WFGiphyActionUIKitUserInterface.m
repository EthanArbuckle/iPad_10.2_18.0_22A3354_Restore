@implementation WFGiphyActionUIKitUserInterface

- (void)showWithQuery:(id)a3 selectMultiple:(BOOL)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD block[4];
  id v16;
  WFGiphyActionUIKitUserInterface *v17;
  BOOL v18;

  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFGiphyActionUIKitUserInterface.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("query"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFGiphyActionUIKitUserInterface.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  -[WFGiphyActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v11);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__WFGiphyActionUIKitUserInterface_showWithQuery_selectMultiple_completionHandler___block_invoke;
  block[3] = &unk_24E343808;
  v18 = a4;
  v16 = v9;
  v17 = self;
  v12 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)finishWithContent:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[WFGiphyActionUIKitUserInterface completionHandler](self, "completionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFGiphyActionUIKitUserInterface completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
  -[WFGiphyActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFGiphyActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __75__WFGiphyActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFGiphyActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFEmbeddableActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

}

- (void)giphyViewControllerDidCancel:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __64__WFGiphyActionUIKitUserInterface_giphyViewControllerDidCancel___block_invoke;
  v3[3] = &unk_24E343958;
  v3[4] = self;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v3);
}

- (void)giphyViewController:(id)a3 didSelectObjects:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72__WFGiphyActionUIKitUserInterface_giphyViewController_didSelectObjects___block_invoke;
  v8[3] = &unk_24E3439C0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v8);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFGiphyActionUIKitUserInterface finishWithContent:error:](self, "finishWithContent:error:", 0, v4);

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

uint64_t __72__WFGiphyActionUIKitUserInterface_giphyViewController_didSelectObjects___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithContent:error:", *(_QWORD *)(a1 + 40), 0);
}

void __64__WFGiphyActionUIKitUserInterface_giphyViewControllerDidCancel___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithContent:error:", 0, v2);

}

uint64_t __75__WFGiphyActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithContent:error:", 0, v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __82__WFGiphyActionUIKitUserInterface_showWithQuery_selectMultiple_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  WFGiphyViewController *v5;

  v5 = -[WFGiphyViewController initWithQuery:selectMultiple:]([WFGiphyViewController alloc], "initWithQuery:selectMultiple:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
  -[WFGiphyViewController setDelegate:](v5, "setDelegate:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v5);
  objc_msgSend(v2, "setModalPresentationStyle:", 2);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "presentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", v3);

  objc_msgSend(*(id *)(a1 + 40), "presentContent:", v2);
}

@end
