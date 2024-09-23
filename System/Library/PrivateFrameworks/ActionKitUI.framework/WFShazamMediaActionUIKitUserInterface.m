@implementation WFShazamMediaActionUIKitUserInterface

- (BOOL)prefersModalPresentation
{
  return 0;
}

- (void)showWithCompletionHandler:(id)a3
{
  _QWORD block[5];

  -[WFShazamMediaActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", a3);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__WFShazamMediaActionUIKitUserInterface_showWithCompletionHandler___block_invoke;
  block[3] = &unk_24E343958;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFShazamMediaActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __81__WFShazamMediaActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFShazamMediaActionUIKitUserInterface;
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
  -[WFShazamMediaActionUIKitUserInterface completionHandler](self, "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFShazamMediaActionUIKitUserInterface completionHandler](self, "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
  -[WFShazamMediaActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);

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

uint64_t __81__WFShazamMediaActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithError:", v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __67__WFShazamMediaActionUIKitUserInterface_showWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  WFShazamMediaActionView *v5;

  v5 = objc_alloc_init(WFShazamMediaActionView);
  -[WFShazamMediaActionView setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[WFShazamMediaActionView heightAnchor](v5, "heightAnchor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "constraintEqualToConstant:", 260.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActive:", 1);

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setView:", v5);
  objc_msgSend(*(id *)(a1 + 32), "presentContent:", v4);

}

@end
