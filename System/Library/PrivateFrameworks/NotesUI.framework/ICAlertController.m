@implementation ICAlertController

- (ICAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  ICAlertController *v4;
  ICAlertController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICAlertController;
  v4 = -[ICAlertController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[ICAlertController commonInit](v4, "commonInit");
  return v5;
}

- (ICAlertController)initWithCoder:(id)a3
{
  ICAlertController *v3;
  ICAlertController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICAlertController;
  v3 = -[ICAlertController initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[ICAlertController commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  self->_shouldDismissWhenShowingNote = 1;
}

- (void)dealloc
{
  id dismissWithoutActionBlock;
  void *v4;
  id v5;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;

  dismissWithoutActionBlock = self->_dismissWithoutActionBlock;
  if (dismissWithoutActionBlock && !self->_didPerformAction)
  {
    v4 = (void *)objc_msgSend(dismissWithoutActionBlock, "copy");
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __28__ICAlertController_dealloc__block_invoke;
    v10 = &unk_1E5C1DB38;
    v11 = v4;
    v5 = v4;
    dispatchMainAfterDelay();

  }
  v6.receiver = self;
  v6.super_class = (Class)ICAlertController;
  -[ICAlertController dealloc](&v6, sel_dealloc);
}

uint64_t __28__ICAlertController_dealloc__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)dismissWhenPossible
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__ICAlertController_dismissWhenPossible__block_invoke;
  v2[3] = &unk_1E5C1F720;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __40__ICAlertController_dismissWhenPossible__block_invoke(uint64_t a1)
{
  void *v1;
  int v2;
  void *v3;
  void *v4;
  int isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissWithoutActionBlock");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = objc_msgSend(WeakRetained, "didDismissWithDismissWithoutActionBlock") ^ 1;
  else
    v2 = 0;

  objc_msgSend(WeakRetained, "dismissAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 || v2)
  {
    objc_msgSend(WeakRetained, "setDidDismissWithDismissWithoutActionBlock:", 1);
    objc_msgSend(WeakRetained, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if ((v2 & 1) != 0)
      {
        v9 = objc_alloc_init(MEMORY[0x1E0DC3448]);
      }
      else
      {
        objc_msgSend(WeakRetained, "dismissAction");
        v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      v10 = v9;
      objc_msgSend(WeakRetained, "_dismissWithAction:", v9);

    }
    objc_msgSend(WeakRetained, "setDismissAction:", 0);
    goto LABEL_14;
  }
  objc_msgSend(WeakRetained, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v6 = WeakRetained;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(WeakRetained, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 0, 0);

LABEL_14:
    v6 = WeakRetained;
  }

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)didPerformAction
{
  return self->_didPerformAction;
}

- (void)setDidPerformAction:(BOOL)a3
{
  self->_didPerformAction = a3;
}

- (id)dismissWithoutActionBlock
{
  return self->_dismissWithoutActionBlock;
}

- (void)setDismissWithoutActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1312);
}

- (UIAlertAction)dismissAction
{
  return self->_dismissAction;
}

- (void)setDismissAction:(id)a3
{
  objc_storeStrong((id *)&self->_dismissAction, a3);
}

- (BOOL)shouldDismissWhenShowingNote
{
  return self->_shouldDismissWhenShowingNote;
}

- (void)setShouldDismissWhenShowingNote:(BOOL)a3
{
  self->_shouldDismissWhenShowingNote = a3;
}

- (BOOL)canAppearAbovePasswordEntryView
{
  return self->_canAppearAbovePasswordEntryView;
}

- (void)setCanAppearAbovePasswordEntryView:(BOOL)a3
{
  self->_canAppearAbovePasswordEntryView = a3;
}

- (BOOL)didDismissWithDismissWithoutActionBlock
{
  return self->_didDismissWithDismissWithoutActionBlock;
}

- (void)setDidDismissWithDismissWithoutActionBlock:(BOOL)a3
{
  self->_didDismissWithDismissWithoutActionBlock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissAction, 0);
  objc_storeStrong(&self->_dismissWithoutActionBlock, 0);
}

@end
