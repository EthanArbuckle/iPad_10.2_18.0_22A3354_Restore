@implementation TabCollectionViewSpringLoadingBehavior

+ (void)addSpringLoadedInteractionToTabView:(id)a3
{
  id v3;
  TabCollectionViewSpringLoadingBehavior *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, void *);
  void *v11;
  id v12;
  id location;

  v3 = a3;
  v4 = objc_alloc_init(TabCollectionViewSpringLoadingBehavior);
  -[TabCollectionViewSpringLoadingBehavior setTabView:](v4, "setTabView:", v3);
  objc_initWeak(&location, v3);
  objc_msgSend(v3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0DC3C98]);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __78__TabCollectionViewSpringLoadingBehavior_addSpringLoadedInteractionToTabView___block_invoke;
  v11 = &unk_1E9CFB178;
  objc_copyWeak(&v12, &location);
  v7 = (void *)objc_msgSend(v6, "initWithInteractionBehavior:interactionEffect:activationHandler:", v4, v4, &v8);
  objc_msgSend(v5, "addInteraction:", v7, v8, v9, v10, v11);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)setTabView:(id)a3
{
  objc_storeWeak((id *)&self->_tabView, a3);
}

- (TabCollectionViewSpringLoadingBehavior)init
{
  TabCollectionViewSpringLoadingBehavior *v2;
  uint64_t v3;
  UISpringLoadedInteractionBehavior *behavior;
  uint64_t v5;
  UISpringLoadedInteractionEffect *effect;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TabCollectionViewSpringLoadingBehavior;
  v2 = -[TabCollectionViewSpringLoadingBehavior init](&v8, sel_init);
  objc_msgSend(MEMORY[0x1E0DC3C98], "_defaultInteractionBehavior");
  v3 = objc_claimAutoreleasedReturnValue();
  behavior = v2->_behavior;
  v2->_behavior = (UISpringLoadedInteractionBehavior *)v3;

  objc_msgSend(MEMORY[0x1E0DC3C98], "_blinkEffect");
  v5 = objc_claimAutoreleasedReturnValue();
  effect = v2->_effect;
  v2->_effect = (UISpringLoadedInteractionEffect *)v5;

  return v2;
}

void __78__TabCollectionViewSpringLoadingBehavior_addSpringLoadedInteractionToTabView___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id WeakRetained;

  v3 = (id *)(a1 + 32);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  objc_msgSend(WeakRetained, "itemAtPoint:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(WeakRetained, "activateItem:", v10);

}

- (BOOL)shouldAllowInteraction:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  int v15;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabView);
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(WeakRetained, "presentationState") != 2)
  {
    LOBYTE(self) = 0;
  }
  else
  {
    objc_msgSend(WeakRetained, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", v9);
    v11 = v10;
    v13 = v12;

    objc_msgSend(WeakRetained, "itemAtPoint:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && !objc_msgSend(WeakRetained, "shouldSpringLoadItem:", v14))
    {
      LOBYTE(self) = 0;
    }
    else
    {
      objc_msgSend(v7, "setTargetItem:", v14);
      v15 = -[UISpringLoadedInteractionBehavior shouldAllowInteraction:withContext:](self->_behavior, "shouldAllowInteraction:withContext:", v6, v7);
      LOBYTE(self) = 0;
      if (v15 && v14)
        LODWORD(self) = objc_msgSend(v14, "isPlaceholder") ^ 1;
    }

  }
  return (char)self;
}

- (void)interactionDidFinish:(id)a3
{
  -[UISpringLoadedInteractionBehavior interactionDidFinish:](self->_behavior, "interactionDidFinish:", a3);
}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabView);
  objc_msgSend(v10, "targetItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(WeakRetained, "viewForItem:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTargetView:", v9);

  }
  else
  {
    objc_msgSend(v10, "setTargetView:", 0);
  }
  -[UISpringLoadedInteractionEffect interaction:didChangeWithContext:](self->_effect, "interaction:didChangeWithContext:", v6, v10);

}

- (TabCollectionView)tabView
{
  return (TabCollectionView *)objc_loadWeakRetained((id *)&self->_tabView);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabView);
  objc_storeStrong((id *)&self->_effect, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
}

@end
