@implementation WFOverlayImageActionUIKitUserInterface

- (void)showWithOverlayImage:(id)a3 images:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD block[4];
  id v18;
  id v19;
  WFOverlayImageActionUIKitUserInterface *v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOverlayImageActionUIKitUserInterface.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("images"));

    if (v11)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOverlayImageActionUIKitUserInterface.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFOverlayImageActionUIKitUserInterface.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("image"));

  if (!v10)
    goto LABEL_6;
LABEL_3:
  if (!v11)
    goto LABEL_7;
LABEL_4:
  -[WFOverlayImageActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", v11);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__WFOverlayImageActionUIKitUserInterface_showWithOverlayImage_images_completionHandler___block_invoke;
  block[3] = &unk_24E3433F8;
  v18 = v10;
  v19 = v9;
  v20 = self;
  v12 = v9;
  v13 = v10;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)finishWithFileRepresentations:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  id v9;

  v9 = a3;
  v6 = a4;
  -[WFOverlayImageActionUIKitUserInterface completionHandler](self, "completionHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFOverlayImageActionUIKitUserInterface completionHandler](self, "completionHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v8)[2](v8, v9, v6);

  }
  -[WFOverlayImageActionUIKitUserInterface setCompletionHandler:](self, "setCompletionHandler:", 0);

}

- (void)cancelPresentationWithCompletionHandler:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  WFOverlayImageActionUIKitUserInterface *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __82__WFOverlayImageActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke;
  v5[3] = &unk_24E3439E8;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)WFOverlayImageActionUIKitUserInterface;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[WFEmbeddableActionUserInterface cancelPresentationWithCompletionHandler:](&v4, sel_cancelPresentationWithCompletionHandler_, v5);

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

uint64_t __82__WFOverlayImageActionUIKitUserInterface_cancelPresentationWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishWithFileRepresentations:error:", 0, v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __88__WFOverlayImageActionUIKitUserInterface_showWithOverlayImage_images_completionHandler___block_invoke(uint64_t a1)
{
  WFOverlayImageEditorViewController *v2;
  uint64_t v3;
  uint64_t v4;
  WFOverlayImageEditorViewController *v5;
  _QWORD v6[5];

  v2 = [WFOverlayImageEditorViewController alloc];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __88__WFOverlayImageActionUIKitUserInterface_showWithOverlayImage_images_completionHandler___block_invoke_2;
  v6[3] = &unk_24E343B20;
  v6[4] = *(_QWORD *)(a1 + 48);
  v5 = -[WFOverlayImageEditorViewController initWithFileRepresentations:overlayImage:completionHandler:](v2, "initWithFileRepresentations:overlayImage:completionHandler:", v3, v4, v6);
  objc_msgSend(*(id *)(a1 + 48), "presentContent:", v5);

}

uint64_t __88__WFOverlayImageActionUIKitUserInterface_showWithOverlayImage_images_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithFileRepresentations:error:", a2, a3);
}

@end
