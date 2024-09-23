@implementation DCMarkupPresenter

+ (void)markupDocumentInfo:(id)a3 imageCache:(id)a4 fromView:(id)a5 presentingViewController:(id)a6 inkStyle:(unint64_t)a7 frameBlock:(id)a8 startPresentBlock:(id)a9 completionBlock:(id)a10 dismissCompletionBlock:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  DCMarkupPresenter *v24;
  void *v25;
  id v26;

  v26 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v23 = (void *)currentMarkupPresenter;
  if (!currentMarkupPresenter)
  {
    v24 = objc_alloc_init(DCMarkupPresenter);
    v25 = (void *)currentMarkupPresenter;
    currentMarkupPresenter = (uint64_t)v24;

    v23 = (void *)currentMarkupPresenter;
  }
  objc_msgSend(v23, "setDocumentInfo:", v26);
  objc_msgSend((id)currentMarkupPresenter, "setImageCache:", v16);
  objc_msgSend((id)currentMarkupPresenter, "setPresentingViewController:", v18);
  objc_msgSend((id)currentMarkupPresenter, "setInkStyle:", a7);
  objc_msgSend((id)currentMarkupPresenter, "setFrameBlock:", v19);
  objc_msgSend((id)currentMarkupPresenter, "setStartPresentBlock:", v20);
  objc_msgSend((id)currentMarkupPresenter, "setCompletionBlock:", v21);
  objc_msgSend((id)currentMarkupPresenter, "setDismissCompletionBlock:", v22);
  objc_msgSend((id)currentMarkupPresenter, "presentMarkupFromView:", v17);

}

- (void)markupDoneAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  _QWORD v12[5];
  id v13;

  -[DCMarkupPresenter markupViewController](self, "markupViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createArchivedModelData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[DCMarkupPresenter markupViewController](self, "markupViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dataRepresentationEmbeddingSourceImageAndEditModel:error:", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[DCMarkupPresenter documentInfo](self, "documentInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __38__DCMarkupPresenter_markupDoneAction___block_invoke;
    v12[3] = &unk_24C5B7BF0;
    v12[4] = self;
    v13 = v7;
    v9 = v7;
    +[DCMarkupUtilities applyMarkupModelData:documentInfo:completionBlock:](DCMarkupUtilities, "applyMarkupModelData:documentInfo:completionBlock:", v5, v8, v12);

  }
  else
  {
    -[DCMarkupPresenter completionBlock](self, "completionBlock");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[DCMarkupPresenter completionBlock](self, "completionBlock");
      v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v11[2](v11, 0);

    }
    -[DCMarkupPresenter dismissMarkupViewController](self, "dismissMarkupViewController");
  }

}

uint64_t __38__DCMarkupPresenter_markupDoneAction___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completionBlock");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));

  }
  return objc_msgSend(*(id *)(a1 + 32), "dismissMarkupViewController");
}

- (void)dismissMarkupViewController
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[DCMarkupPresenter dismissCompletionBlock](self, "dismissCompletionBlock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[DCMarkupPresenter setDismissCompletionBlock:](self, "setDismissCompletionBlock:", 0);
  -[DCMarkupPresenter setMarkupViewController:](self, "setMarkupViewController:", 0);
  v3 = (void *)currentMarkupPresenter;
  currentMarkupPresenter = 0;

  -[DCMarkupPresenter presentingViewController](self, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);

}

- (void)presentMarkupViewControllerFromView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD);
  void *v18;
  _QWORD v19[5];
  id v20;

  +[DCMarkupUtilities createMarkupViewController](DCMarkupUtilities, "createMarkupViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInkStyle:", -[DCMarkupPresenter inkStyle](self, "inkStyle"));
  -[DCMarkupPresenter documentInfo](self, "documentInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCMarkupPresenter imageCache](self, "imageCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markupModelData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[DCMarkupUtilities dataToEditForDocumentInfo:imageCache:includeMarkupModelData:](DCMarkupUtilities, "dataToEditForDocumentInfo:imageCache:includeMarkupModelData:", v5, v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "croppedAndFilteredImageUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getImage:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setData:withArchivedModelData:placeholderImage:", v8, v7, v10);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6BF8]), "initWithRootViewController:", v4);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_markupDoneAction_);
  objc_msgSend(v4, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLeftBarButtonItem:", v12);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_markupCancelAction_);
  objc_msgSend(v4, "navigationItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setRightBarButtonItem:", v14);

  -[DCMarkupPresenter setMarkupViewController:](self, "setMarkupViewController:", v4);
  objc_msgSend(v11, "setModalTransitionStyle:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "DCExtractedDocumentViewControllerBackgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v16);

  -[DCMarkupPresenter startPresentBlock](self, "startPresentBlock");
  v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[DCMarkupPresenter setStartPresentBlock:](self, "setStartPresentBlock:", 0);
  if (v17)
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __57__DCMarkupPresenter_presentMarkupViewControllerFromView___block_invoke;
    v19[3] = &unk_24C5B7BF0;
    v19[4] = self;
    v20 = v11;
    ((void (**)(_QWORD, _QWORD *))v17)[2](v17, v19);

  }
  else
  {
    -[DCMarkupPresenter presentingViewController](self, "presentingViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "presentViewController:animated:completion:", v11, 1, 0);

  }
}

void __57__DCMarkupPresenter_presentMarkupViewControllerFromView___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

- (void)handleReturnedURL:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__1;
  v7[4] = __Block_byref_object_dispose__1;
  -[DCMarkupPresenter markupRemoteViewController](self, "markupRemoteViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[DCMarkupPresenter documentInfo](self, "documentInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __39__DCMarkupPresenter_handleReturnedURL___block_invoke;
  v6[3] = &unk_24C5B8008;
  v6[4] = v7;
  +[DCMarkupUtilities applyReturnedMarkupURL:documentInfo:completionBlock:](DCMarkupUtilities, "applyReturnedMarkupURL:documentInfo:completionBlock:", v4, v5, v6);

  _Block_object_dispose(v7, 8);
}

void __39__DCMarkupPresenter_handleReturnedURL___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);
  uint64_t v4;
  void *v5;

  objc_msgSend((id)currentMarkupPresenter, "completionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend((id)currentMarkupPresenter, "completionBlock");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0);

  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_6);
}

void __39__DCMarkupPresenter_handleReturnedURL___block_invoke_2()
{
  void *v0;

  v0 = (void *)currentMarkupPresenter;
  currentMarkupPresenter = 0;

}

- (ICDocCamDocumentInfo)documentInfo
{
  return (ICDocCamDocumentInfo *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDocumentInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (ICDocCamImageCache)imageCache
{
  return (ICDocCamImageCache *)objc_getProperty(self, a2, 16, 1);
}

- (void)setImageCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (MURemoteViewController)markupRemoteViewController
{
  return self->_markupRemoteViewController;
}

- (void)setMarkupRemoteViewController:(id)a3
{
  objc_storeStrong((id *)&self->_markupRemoteViewController, a3);
}

- (MarkupViewController)markupViewController
{
  return self->_markupViewController;
}

- (void)setMarkupViewController:(id)a3
{
  objc_storeStrong((id *)&self->_markupViewController, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (unint64_t)inkStyle
{
  return self->_inkStyle;
}

- (void)setInkStyle:(unint64_t)a3
{
  self->_inkStyle = a3;
}

- (id)frameBlock
{
  return self->_frameBlock;
}

- (void)setFrameBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)startPresentBlock
{
  return self->_startPresentBlock;
}

- (void)setStartPresentBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)dismissCompletionBlock
{
  return self->_dismissCompletionBlock;
}

- (void)setDismissCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissCompletionBlock, 0);
  objc_storeStrong(&self->_startPresentBlock, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_frameBlock, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_markupViewController, 0);
  objc_storeStrong((id *)&self->_markupRemoteViewController, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_documentInfo, 0);
}

@end
