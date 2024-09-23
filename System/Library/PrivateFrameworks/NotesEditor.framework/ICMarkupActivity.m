@implementation ICMarkupActivity

- (id)initFromView:(id)a3 presentingViewController:(id)a4 frameBlock:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ICMarkupActivity *v14;
  ICMarkupActivity *v15;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)ICMarkupActivity;
  v14 = -[UIActivity init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    -[ICMarkupActivity setFromView:](v14, "setFromView:", v10);
    -[ICMarkupActivity setPresentingViewController:](v15, "setPresentingViewController:", v11);
    -[ICMarkupActivity setFrameBlock:](v15, "setFrameBlock:", v12);
    -[ICMarkupActivity setCompletionBlock:](v15, "setCompletionBlock:", v13);
    -[ICMarkupActivity setInkStyle:](v15, "setInkStyle:", 0);
  }

  return v15;
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.markup");
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Markup"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_systemImageName
{
  return CFSTR("pencil.tip.crop.circle");
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
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__ICMarkupActivity_canPerformWithActivityItems___block_invoke;
  v6[3] = &unk_1EA7DF2E8;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v6);
  v4 = v8[3] == 1;
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __48__ICMarkupActivity_canPerformWithActivityItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attachmentModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "canMarkup");

    if (v8)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  *a4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) > 1uLL;

}

- (void)prepareWithActivityItems:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  -[ICMarkupActivity setAttachment:](self, "setAttachment:", 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__ICMarkupActivity_prepareWithActivityItems___block_invoke;
  v5[3] = &unk_1EA7DF310;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __45__ICMarkupActivity_prepareWithActivityItems___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v12;
    objc_msgSend(v6, "attachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attachmentModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "canMarkup");

    if (v9)
    {
      objc_msgSend(v6, "attachment");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setAttachment:", v10);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "attachment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *a4 = v11 != 0;

}

- (void)performActivity
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;

  -[ICMarkupActivity attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMarkupActivity fromView](self, "fromView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMarkupActivity presentingViewController](self, "presentingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ICMarkupActivity inkStyle](self, "inkStyle");
  -[ICMarkupActivity frameBlock](self, "frameBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMarkupActivity completionBlock](self, "completionBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICMarkupPresenter markupAttachment:fromView:presentingViewController:inkStyle:frameBlock:startPresentBlock:completionBlock:dismissCompletionBlock:](ICMarkupPresenter, "markupAttachment:fromView:presentingViewController:inkStyle:frameBlock:startPresentBlock:completionBlock:dismissCompletionBlock:", v3, v4, v5, v6, v7, 0, v8, 0);

  -[ICMarkupActivity setAttachment:](self, "setAttachment:", 0);
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

- (ICAttachment)attachment
{
  return self->_attachment;
}

- (void)setAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_attachment, a3);
}

- (id)frameBlock
{
  return self->_frameBlock;
}

- (void)setFrameBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_frameBlock, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_fromView);
}

@end
