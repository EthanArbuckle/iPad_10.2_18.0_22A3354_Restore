@implementation WFDictateTextActionUIKitUserInterface

- (BOOL)prefersModalPresentation
{
  return 0;
}

- (void)showWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__WFDictateTextActionUIKitUserInterface_showWithCompletionHandler___block_invoke;
  v6[3] = &unk_24E3439E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (void)dismissWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__WFDictateTextActionUIKitUserInterface_dismissWithCompletionHandler___block_invoke;
  v6[3] = &unk_24E3439E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (void)actionDidReceiveTranscription:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__WFDictateTextActionUIKitUserInterface_actionDidReceiveTranscription___block_invoke;
  v6[3] = &unk_24E3439C0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);

  v4 = (void *)MEMORY[0x24BDD1540];
  v6 = (void (**)(void))a3;
  objc_msgSend(v4, "userCancelledError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDictateTextActionUIKitUserInterface finishWithError:](self, "finishWithError:", v5);

  v6[2]();
}

- (void)finishWithError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__WFDictateTextActionUIKitUserInterface_finishWithError___block_invoke;
  v6[3] = &unk_24E3439C0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (void)dictateTextActionViewDidTapStopButton:(id)a3
{
  -[WFDictateTextActionUIKitUserInterface cancelPresentationWithCompletionHandler:](self, "cancelPresentationWithCompletionHandler:", &__block_literal_global_28);
}

- (WFDictateTextActionView)actionView
{
  return self->_actionView;
}

- (void)setActionView:(id)a3
{
  objc_storeStrong((id *)&self->_actionView, a3);
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
  objc_storeStrong((id *)&self->_actionView, 0);
}

void __57__WFDictateTextActionUIKitUserInterface_finishWithError___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __57__WFDictateTextActionUIKitUserInterface_finishWithError___block_invoke_2;
  v2[3] = &unk_24E342510;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "dismissWithCompletionHandler:", v2);

}

uint64_t __57__WFDictateTextActionUIKitUserInterface_finishWithError___block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionHandler");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));

  }
  return objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", 0);
}

void __71__WFDictateTextActionUIKitUserInterface_actionDidReceiveTranscription___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "actionView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateWithTranscription:", *(_QWORD *)(a1 + 40));

}

void __70__WFDictateTextActionUIKitUserInterface_dismissWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  objc_super v2;
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __70__WFDictateTextActionUIKitUserInterface_dismissWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_24E343510;
  v1 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v2.receiver = v1;
  v2.super_class = (Class)WFDictateTextActionUIKitUserInterface;
  objc_msgSendSuper2(&v2, sel_cancelPresentationWithCompletionHandler_, v3);

}

uint64_t __70__WFDictateTextActionUIKitUserInterface_dismissWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__WFDictateTextActionUIKitUserInterface_showWithCompletionHandler___block_invoke(uint64_t a1)
{
  WFDictateTextActionView *v2;
  void *v3;
  void *v4;
  id v5;
  WFDictateTextActionView *v6;

  objc_msgSend(*(id *)(a1 + 32), "setCompletionHandler:", *(_QWORD *)(a1 + 40));
  v2 = [WFDictateTextActionView alloc];
  v6 = -[WFDictateTextActionView initWithFrame:padded:](v2, "initWithFrame:padded:", 1, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[WFDictateTextActionView setDelegate:](v6, "setDelegate:", *(_QWORD *)(a1 + 32));
  -[WFDictateTextActionView heightAnchor](v6, "heightAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintEqualToConstant:", 220.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", 1);

  v5 = objc_alloc_init(MEMORY[0x24BEBDB08]);
  objc_msgSend(v5, "setView:", v6);
  objc_msgSend(*(id *)(a1 + 32), "presentContent:", v5);
  objc_msgSend(*(id *)(a1 + 32), "setActionView:", v6);

}

@end
