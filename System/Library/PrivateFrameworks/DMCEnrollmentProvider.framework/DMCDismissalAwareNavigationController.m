@implementation DMCDismissalAwareNavigationController

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void (**dismissedCompletionBlock)(void);
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)DMCDismissalAwareNavigationController;
  -[DMCDismissalAwareNavigationController viewDidDisappear:](&v16, sel_viewDidDisappear_, a3);
  -[DMCDismissalAwareNavigationController presentingViewController](self, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[DMCDismissalAwareNavigationController viewControllers](self, "viewControllers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "conformsToProtocol:", &unk_254E5BE10))
            objc_msgSend(v10, "viewControllerHasBeenDismissed");
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
      }
      while (v7);
    }

    dismissedCompletionBlock = (void (**)(void))self->_dismissedCompletionBlock;
    if (dismissedCompletionBlock)
      dismissedCompletionBlock[2]();
  }
}

- (void)presentAlert:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  dispatch_time_t v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  BOOL v22;

  v4 = a4;
  v6 = a3;
  if ((-[DMCDismissalAwareNavigationController _isTransitioning](self, "_isTransitioning") & 1) != 0
    || (-[DMCDismissalAwareNavigationController disappearingViewController](self, "disappearingViewController"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __63__DMCDismissalAwareNavigationController_presentAlert_animated___block_invoke;
    v20[3] = &unk_24D52E870;
    v21 = v6;
    v22 = v4;
    v8 = v6;
    -[DMCDismissalAwareNavigationController setTransitionCompletionBlock:](self, "setTransitionCompletionBlock:", v20);
    v9 = v21;
  }
  else
  {
    -[DMCDismissalAwareNavigationController setIsPresentingAlert:](self, "setIsPresentingAlert:", 1);
    v10 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __63__DMCDismissalAwareNavigationController_presentAlert_animated___block_invoke_2;
    v18[3] = &unk_24D52E730;
    v18[4] = self;
    v19 = v6;
    v11 = v6;
    v12 = (void *)MEMORY[0x2199F7854](v18);
    -[DMCDismissalAwareNavigationController rootViewController](self, "rootViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __63__DMCDismissalAwareNavigationController_presentAlert_animated___block_invoke_3;
    v16[3] = &unk_24D52E780;
    v17 = v12;
    v14 = v12;
    objc_msgSend(v13, "presentViewController:animated:completion:", v11, v4, v16);

    v15 = dispatch_time(0, 1000000000);
    dispatch_after(v15, MEMORY[0x24BDAC9B8], v14);

    v9 = v19;
  }

}

uint64_t __63__DMCDismissalAwareNavigationController_presentAlert_animated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), 0);
}

void __63__DMCDismissalAwareNavigationController_presentAlert_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);

  if (objc_msgSend(*(id *)(a1 + 32), "isPresentingAlert"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsPresentingAlert:", 0);
    objc_msgSend(*(id *)(a1 + 32), "transitionCompletionBlock");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "transitionCompletionBlock");
      v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v3[2](v3, *(_QWORD *)(a1 + 40));

      objc_msgSend(*(id *)(a1 + 32), "setTransitionCompletionBlock:", 0);
    }
  }
}

void __63__DMCDismissalAwareNavigationController_presentAlert_animated___block_invoke_3(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__DMCDismissalAwareNavigationController_presentAlert_animated___block_invoke_4;
  block[3] = &unk_24D52E780;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __63__DMCDismissalAwareNavigationController_presentAlert_animated___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  id v11;
  BOOL v12;
  id location;

  v4 = a4;
  v6 = a3;
  if (-[DMCDismissalAwareNavigationController isPushBlocked](self, "isPushBlocked"))
  {
    v7 = (void *)objc_msgSend(v6, "copy");
    -[DMCDismissalAwareNavigationController setPendingViewControllers:](self, "setPendingViewControllers:", v7);

    -[DMCDismissalAwareNavigationController setPendingPushAnimated:](self, "setPendingPushAnimated:", v4);
  }
  else if (-[DMCDismissalAwareNavigationController isPresentingAlert](self, "isPresentingAlert"))
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __69__DMCDismissalAwareNavigationController_setViewControllers_animated___block_invoke;
    v9[3] = &unk_24D52E898;
    objc_copyWeak(&v11, &location);
    v10 = v6;
    v12 = v4;
    -[DMCDismissalAwareNavigationController setTransitionCompletionBlock:](self, "setTransitionCompletionBlock:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)DMCDismissalAwareNavigationController;
    -[DMCDismissalAwareNavigationController setViewControllers:animated:](&v8, sel_setViewControllers_animated_, v6, v4);
  }

}

void __69__DMCDismissalAwareNavigationController_setViewControllers_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setViewControllers:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));

}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMCDismissalAwareNavigationController;
  -[DMCDismissalAwareNavigationController didShowViewController:animated:](&v10, sel_didShowViewController_animated_, v6, v4);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __72__DMCDismissalAwareNavigationController_didShowViewController_animated___block_invoke;
  v8[3] = &unk_24D52E730;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

}

void __72__DMCDismissalAwareNavigationController_didShowViewController_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "transitionCompletionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "transitionCompletionBlock");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "setTransitionCompletionBlock:", 0);
  }
}

- (id)rootViewController
{
  void *v2;
  void *v3;

  -[DMCDismissalAwareNavigationController viewControllers](self, "viewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)blockNavigationPush
{
  -[DMCDismissalAwareNavigationController setIsPushBlocked:](self, "setIsPushBlocked:", 1);
}

- (void)unblockNavigationPush
{
  void *v3;
  void *v4;

  -[DMCDismissalAwareNavigationController setIsPushBlocked:](self, "setIsPushBlocked:", 0);
  -[DMCDismissalAwareNavigationController pendingViewControllers](self, "pendingViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DMCDismissalAwareNavigationController pendingViewControllers](self, "pendingViewControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMCDismissalAwareNavigationController setViewControllers:animated:](self, "setViewControllers:animated:", v4, -[DMCDismissalAwareNavigationController pendingPushAnimated](self, "pendingPushAnimated"));

    -[DMCDismissalAwareNavigationController setPendingViewControllers:](self, "setPendingViewControllers:", 0);
  }
}

- (id)dismissedCompletionBlock
{
  return self->_dismissedCompletionBlock;
}

- (void)setDismissedCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1416);
}

- (BOOL)isPresentingAlert
{
  return self->_isPresentingAlert;
}

- (void)setIsPresentingAlert:(BOOL)a3
{
  self->_isPresentingAlert = a3;
}

- (id)transitionCompletionBlock
{
  return self->_transitionCompletionBlock;
}

- (void)setTransitionCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1424);
}

- (BOOL)isPushBlocked
{
  return self->_isPushBlocked;
}

- (void)setIsPushBlocked:(BOOL)a3
{
  self->_isPushBlocked = a3;
}

- (BOOL)pendingPushAnimated
{
  return self->_pendingPushAnimated;
}

- (void)setPendingPushAnimated:(BOOL)a3
{
  self->_pendingPushAnimated = a3;
}

- (NSArray)pendingViewControllers
{
  return self->_pendingViewControllers;
}

- (void)setPendingViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->_pendingViewControllers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingViewControllers, 0);
  objc_storeStrong(&self->_transitionCompletionBlock, 0);
  objc_storeStrong(&self->_dismissedCompletionBlock, 0);
}

@end
