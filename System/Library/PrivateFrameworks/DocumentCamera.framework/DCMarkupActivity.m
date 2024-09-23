@implementation DCMarkupActivity

- (id)initFromView:(id)a3 presentingViewController:(id)a4 frameBlock:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  DCMarkupActivity *v14;
  DCMarkupActivity *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)DCMarkupActivity;
  v14 = -[UIActivity init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    -[DCMarkupActivity setFromView:](v14, "setFromView:", v10);
    -[DCMarkupActivity setPresentingViewController:](v15, "setPresentingViewController:", v11);
    -[DCMarkupActivity setFrameBlock:](v15, "setFrameBlock:", v12);
    -[DCMarkupActivity setCompletionBlock:](v15, "setCompletionBlock:", v13);
    -[DCMarkupActivity setInkStyle:](v15, "setInkStyle:", 0);
  }

  return v15;
}

- (id)activityType
{
  return CFSTR("com.apple.documentcamera.markup");
}

- (id)activityTitle
{
  return +[DCLocalization localizedStringForKey:value:table:](DCLocalization, "localizedStringForKey:value:table:", CFSTR("Markup"), CFSTR("Markup"), CFSTR("Localizable"));
}

- (id)activityImage
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v2 = (void *)MEMORY[0x24BDD1488];
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v3 = (void *)getMURemoteViewControllerClass_softClass;
  v12 = getMURemoteViewControllerClass_softClass;
  if (!getMURemoteViewControllerClass_softClass)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getMURemoteViewControllerClass_block_invoke;
    v8[3] = &unk_24C5B8008;
    v8[4] = &v9;
    __getMURemoteViewControllerClass_block_invoke((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v9, 8);
  objc_msgSend(v2, "bundleForClass:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageNamed:inBundle:", CFSTR("PlugIns/MarkupPrivateExtension.appex/MarkupActionExtensionIcon60x60"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  id v3;
  BOOL v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__DCMarkupActivity_canPerformWithActivityItems___block_invoke;
  v6[3] = &unk_24C5B87D8;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  v4 = v8[3] == 1;
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __48__DCMarkupActivity_canPerformWithActivityItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6;
  char isKindOfClass;

  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) > 1uLL;
}

- (void)prepareWithActivityItems:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  -[DCMarkupActivity setDocumentInfo:](self, "setDocumentInfo:", 0);
  -[DCMarkupActivity setImageCache:](self, "setImageCache:", 0);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__DCMarkupActivity_prepareWithActivityItems___block_invoke;
  v5[3] = &unk_24C5B8800;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __45__DCMarkupActivity_prepareWithActivityItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v10;
    objc_msgSend(v6, "documentInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setDocumentInfo:", v7);

    objc_msgSend(v6, "imageCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setImageCache:", v8);
  }
  objc_msgSend(*(id *)(a1 + 32), "documentInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = v9 != 0;

}

- (void)performActivity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  -[DCMarkupActivity documentInfo](self, "documentInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCMarkupActivity imageCache](self, "imageCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCMarkupActivity fromView](self, "fromView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCMarkupActivity presentingViewController](self, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DCMarkupActivity inkStyle](self, "inkStyle");
  -[DCMarkupActivity frameBlock](self, "frameBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DCMarkupActivity completionBlock](self, "completionBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[DCMarkupPresenter markupDocumentInfo:imageCache:fromView:presentingViewController:inkStyle:frameBlock:startPresentBlock:completionBlock:dismissCompletionBlock:](DCMarkupPresenter, "markupDocumentInfo:imageCache:fromView:presentingViewController:inkStyle:frameBlock:startPresentBlock:completionBlock:dismissCompletionBlock:", v3, v4, v5, v6, v7, v8, 0, v9, 0);

  -[DCMarkupActivity setDocumentInfo:](self, "setDocumentInfo:", 0);
  -[DCMarkupActivity setImageCache:](self, "setImageCache:", 0);
}

- (unint64_t)inkStyle
{
  return self->_inkStyle;
}

- (void)setInkStyle:(unint64_t)a3
{
  self->_inkStyle = a3;
}

- (UIView)fromView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_fromView);
}

- (void)setFromView:(id)a3
{
  objc_storeWeak((id *)&self->_fromView, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (ICDocCamDocumentInfo)documentInfo
{
  return self->_documentInfo;
}

- (void)setDocumentInfo:(id)a3
{
  objc_storeStrong((id *)&self->_documentInfo, a3);
}

- (ICDocCamImageCache)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_imageCache, a3);
}

- (id)frameBlock
{
  return self->_frameBlock;
}

- (void)setFrameBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_frameBlock, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_storeStrong((id *)&self->_documentInfo, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_fromView);
}

@end
