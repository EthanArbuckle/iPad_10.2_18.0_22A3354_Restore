@implementation CSRemoteContentInlineManager

- (CSRemoteContentInlineManager)initWithItemDestination:(id)a3
{
  id v5;
  CSRemoteContentInlineManager *v6;
  CSRemoteContentInlineManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSRemoteContentInlineManager;
  v6 = -[CSRemoteContentInlineManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_itemDestination, a3);

  return v7;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_remoteContentInlineProvider);
  objc_msgSend(WeakRetained, "removeRemoteContentInlineProvidingManager:", self);

  v4.receiver = self;
  v4.super_class = (Class)CSRemoteContentInlineManager;
  -[CSRemoteContentInlineManager dealloc](&v4, sel_dealloc);
}

- (void)setRemoteContentInlineProvider:(id)a3
{
  CSRemoteContentInlineProviding **p_remoteContentInlineProvider;
  id v5;

  p_remoteContentInlineProvider = &self->_remoteContentInlineProvider;
  v5 = a3;
  objc_storeWeak((id *)p_remoteContentInlineProvider, v5);
  objc_msgSend(v5, "addRemoteContentInlineProvidingManager:", self);

}

- (BOOL)isInlineRemoteContentVisible
{
  return self->_remoteInlineViewController && !self->_inlineRemoteContentHidden;
}

- (void)presentInlineRemoteContent:(id)a3 animatePresentation:(BOOL)a4
{
  -[CSRemoteContentInlineManager _presentInlineRemoteContent:animatePresentation:retryOnFailure:](self, "_presentInlineRemoteContent:animatePresentation:retryOnFailure:", a3, 0, 1);
}

- (void)_presentInlineRemoteContent:(id)a3 animatePresentation:(BOOL)a4 retryOnFailure:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v9;
  NSObject *v10;
  CSAdjunctListItem *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CSAdjunctListItem *v16;
  CSAdjunctListItem *item;
  _QWORD block[5];
  id v19;
  uint8_t buf[4];
  CSRemoteContentInlineManager *v21;
  uint64_t v22;

  v5 = a5;
  v6 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (self->_item)
  {
    SBLogDashBoard();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = self;
      _os_log_impl(&dword_1D0337000, v10, OS_LOG_TYPE_DEFAULT, "[RemoteContent] %{public}@: Already had remote item; dismissing before adding",
        buf,
        0xCu);
    }

    -[CSRemoteContentInlineManager removeInlineRemoteContentWithAnimatedDismissal:](self, "removeInlineRemoteContentWithAnimatedDismissal:", 0);
    if (v5)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __95__CSRemoteContentInlineManager__presentInlineRemoteContent_animatePresentation_retryOnFailure___block_invoke;
      block[3] = &unk_1E8E2DC00;
      block[4] = self;
      v19 = v9;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
  else
  {
    objc_storeStrong((id *)&self->_remoteInlineViewController, a3);
    self->_inlineRemoteContentHidden = 0;
    v11 = [CSAdjunctListItem alloc];
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ - %@"), CFSTR("remote content inline identifier"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[CSAdjunctListItem initWithIdentifier:](v11, "initWithIdentifier:", v15);
    item = self->_item;
    self->_item = v16;

    -[CSAdjunctListItem setAnimatePresentation:](self->_item, "setAnimatePresentation:", v6);
    -[CSAdjunctListItem setContentHost:](self->_item, "setContentHost:", v9);
    -[CSItemDestination addOrUpdateItem:](self->_itemDestination, "addOrUpdateItem:", self->_item);
  }

}

uint64_t __95__CSRemoteContentInlineManager__presentInlineRemoteContent_animatePresentation_retryOnFailure___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentInlineRemoteContent:animatePresentation:retryOnFailure:", *(_QWORD *)(a1 + 40), 0, 0);
}

- (void)removeInlineRemoteContentWithAnimatedDismissal:(BOOL)a3
{
  CSAdjunctListItem *item;
  CSItemDestination *itemDestination;
  void *v6;
  CSRemoteContentInlineViewController *remoteInlineViewController;
  CSAdjunctListItem *v8;

  item = self->_item;
  if (item)
  {
    -[CSAdjunctListItem setAnimateDismissal:](item, "setAnimateDismissal:", a3);
    itemDestination = self->_itemDestination;
    -[CSAdjunctListItem identifier](self->_item, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSItemDestination removeItemForIdentifier:](itemDestination, "removeItemForIdentifier:", v6);

  }
  remoteInlineViewController = self->_remoteInlineViewController;
  self->_remoteInlineViewController = 0;

  v8 = self->_item;
  self->_item = 0;

}

- (void)setInlineRemoteContentHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  double v5;
  id v6;

  if (self->_inlineRemoteContentHidden != a3)
  {
    v3 = a3;
    self->_inlineRemoteContentHidden = a3;
    -[CSAdjunctListItem itemView](self->_item, "itemView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v4;
    v5 = 1.0;
    if (v3)
      v5 = 0.0;
    objc_msgSend(v4, "setAlpha:", v5);

  }
}

- (BOOL)isInlineRemoteContentHidden
{
  return self->_inlineRemoteContentHidden && self->_remoteInlineViewController != 0;
}

- (CSRemoteContentInlineProviding)remoteContentInlineProvider
{
  return (CSRemoteContentInlineProviding *)objc_loadWeakRetained((id *)&self->_remoteContentInlineProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteContentInlineProvider);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_remoteInlineViewController, 0);
  objc_storeStrong((id *)&self->_itemDestination, 0);
}

@end
