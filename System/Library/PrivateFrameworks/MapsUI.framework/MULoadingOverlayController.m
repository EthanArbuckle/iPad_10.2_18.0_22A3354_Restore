@implementation MULoadingOverlayController

- (MULoadingOverlayController)initWithParentView:(id)a3 contentView:(id)a4
{
  id v6;
  id v7;
  MULoadingOverlayController *v8;
  MULoadingOverlayController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MULoadingOverlayController;
  v8 = -[MULoadingOverlayController init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_parentView, v6);
    objc_storeWeak((id *)&v9->_contentView, v7);
  }

  return v9;
}

- (void)attachLoadingOverlay
{
  MULoadingView *v3;
  MULoadingView *v4;
  MULoadingView *loadingView;
  id WeakRetained;
  id v7;
  dispatch_time_t v8;
  _QWORD v9[4];
  id v10;
  id location;

  -[MULoadingView removeFromSuperview](self->_loadingView, "removeFromSuperview");
  if (!self->_loadingView)
  {
    v3 = [MULoadingView alloc];
    v4 = -[MULoadingView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    loadingView = self->_loadingView;
    self->_loadingView = v4;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
  objc_msgSend(WeakRetained, "addSubview:", self->_loadingView);

  -[MULoadingOverlayController updateLayoutForBoundsChange](self, "updateLayoutForBoundsChange");
  v7 = objc_loadWeakRetained((id *)&self->_contentView);
  objc_msgSend(v7, "setHidden:", 1);

  objc_initWeak(&location, self);
  v8 = dispatch_time(0, 200000002);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__MULoadingOverlayController_attachLoadingOverlay__block_invoke;
  v9[3] = &unk_1E2E01DA8;
  objc_copyWeak(&v10, &location);
  dispatch_after(v8, MEMORY[0x1E0C80D38], v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __50__MULoadingOverlayController_attachLoadingOverlay__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[1], "setAlpha:", 1.0);
    objc_msgSend(v2[1], "beginAnimatingActivityIndicator");
    WeakRetained = v2;
  }

}

- (void)removeLoadingOverlayAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  id v9;
  void (**v10)(void *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  _QWORD aBlock[4];
  id v18;
  id location;

  v4 = a3;
  v6 = a4;
  -[MULoadingView endAnimatingActivityIndicatorWithError:](self->_loadingView, "endAnimatingActivityIndicatorWithError:", 0);
  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__MULoadingOverlayController_removeLoadingOverlayAnimated_completion___block_invoke;
  aBlock[3] = &unk_1E2E01DA8;
  objc_copyWeak(&v18, &location);
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  v11 = v7;
  v12 = 3221225472;
  v13 = __70__MULoadingOverlayController_removeLoadingOverlayAnimated_completion___block_invoke_2;
  v14 = &unk_1E2E02260;
  objc_copyWeak(&v16, &location);
  v9 = v6;
  v15 = v9;
  v10 = (void (**)(void *, uint64_t))_Block_copy(&v11);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v8, v10, 0.200000003, 0.0, v11, v12, v13, v14);
  }
  else
  {
    v8[2](v8);
    v10[2](v10, 1);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __70__MULoadingOverlayController_removeLoadingOverlayAnimated_completion___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[1], "setAlpha:", 0.0);
    v2 = objc_loadWeakRetained(v3 + 2);
    objc_msgSend(v2, "setHidden:", 0);

    WeakRetained = v3;
  }

}

void __70__MULoadingOverlayController_removeLoadingOverlayAnimated_completion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  uint64_t v4;
  id *v5;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained[1], "removeFromSuperview");
    v3 = v5;
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      (*(void (**)(uint64_t, id *))(v4 + 16))(v4, v5);
      v3 = v5;
    }
  }

}

- (void)updateLayoutForBoundsChange
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_parentView);
  objc_msgSend(WeakRetained, "bounds");
  -[MULoadingView setFrame:](self->_loadingView, "setFrame:");

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentView);
  objc_destroyWeak((id *)&self->_contentView);
  objc_storeStrong((id *)&self->_loadingView, 0);
}

@end
