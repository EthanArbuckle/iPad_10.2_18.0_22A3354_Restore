@implementation WFChooseFromListActionUIKitUserInterface

- (void)showImagesWithPrompt:(id)a3 canSelectAll:(BOOL)a4 canSelectMultiple:(BOOL)a5 inputItems:(id)a6 completionHandler:(id)a7
{
  _BOOL4 v10;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD block[4];
  id v24;
  id v25;
  WFChooseFromListActionUIKitUserInterface *v26;
  id v27;
  BOOL v28;

  v10 = a4;
  v13 = a3;
  v14 = a6;
  v15 = a7;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFChooseFromListActionUIKitUserInterface.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  -[WFChooseFromListActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v15);
  v16 = (void *)MEMORY[0x24BDD15E0];
  if (v10 && a5)
  {
    objc_msgSend(v14, "items");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "indexSetWithIndexesInRange:", 0, objc_msgSend(v17, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = (void *)objc_opt_new();
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __125__WFChooseFromListActionUIKitUserInterface_showImagesWithPrompt_canSelectAll_canSelectMultiple_inputItems_completionHandler___block_invoke;
  block[3] = &unk_24E343330;
  v24 = v14;
  v25 = v18;
  v28 = a5;
  v26 = self;
  v27 = v13;
  v19 = v13;
  v20 = v18;
  v21 = v14;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFChooseFromListActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __84__WFChooseFromListActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFChooseFromListActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFEmbeddableActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

}

- (void)finishWithContent:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[WFChooseFromListActionUIKitUserInterface completionHandler](self, "completionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFChooseFromListActionUIKitUserInterface completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
  -[WFChooseFromListActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (void)chooseImageController:(id)a3 didSelectItems:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __81__WFChooseFromListActionUIKitUserInterface_chooseImageController_didSelectItems___block_invoke;
  v8[3] = &unk_24E3439C0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v8);

}

- (void)chooseImageControllerDidCancel:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __75__WFChooseFromListActionUIKitUserInterface_chooseImageControllerDidCancel___block_invoke;
  v3[3] = &unk_24E343958;
  v3[4] = self;
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, v3);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WFChooseFromListActionUIKitUserInterface finishWithContent:error:](self, "finishWithContent:error:", 0, v4);

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

void __75__WFChooseFromListActionUIKitUserInterface_chooseImageControllerDidCancel___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishWithContent:error:", 0, v2);

}

uint64_t __81__WFChooseFromListActionUIKitUserInterface_chooseImageController_didSelectItems___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithContent:error:", *(_QWORD *)(a1 + 40), 0);
}

uint64_t __84__WFChooseFromListActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithContent:error:", 0, v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __125__WFChooseFromListActionUIKitUserInterface_showImagesWithPrompt_canSelectAll_canSelectMultiple_inputItems_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  WFChooseImageViewController *v7;

  v7 = -[WFChooseImageViewController initWithCollection:selectedIndexes:]([WFChooseImageViewController alloc], "initWithCollection:selectedIndexes:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  -[WFChooseImageViewController setDelegate:](v7, "setDelegate:", *(_QWORD *)(a1 + 48));
  -[WFChooseImageViewController setMaximumNumberOfItems:](v7, "setMaximumNumberOfItems:", *(_BYTE *)(a1 + 64) == 0);
  v2 = *(_QWORD *)(a1 + 56);
  -[WFChooseImageViewController navigationItem](v7, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPrompt:", v2);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", v7);
  objc_msgSend(v4, "setModalPresentationStyle:", 1);
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "presentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v5);

  objc_msgSend(*(id *)(a1 + 48), "presentContent:", v4);
}

@end
