@implementation BNBannerSourceListenerPresentableViewController

- (id)_initWithPresentableIdentification:(id)a3 presentableBehavior:(int64_t)a4 contentBehavior:(int64_t)a5 serviceDomain:(id)a6 readyCompletion:(id)a7
{
  id v13;
  id v14;
  id v15;
  BNBannerSourceListenerPresentableViewController *v16;
  void *v17;
  uint64_t v18;
  NSString *requesterIdentifier;
  void *v20;
  uint64_t v21;
  NSString *requestIdentifier;
  void *v23;
  uint64_t v24;
  NSUUID *uniquePresentableIdentifier;
  uint64_t v26;
  NSString *serviceDomain;
  void *v29;
  objc_super v30;

  v13 = a3;
  v14 = a6;
  v15 = a7;
  v30.receiver = self;
  v30.super_class = (Class)BNBannerSourceListenerPresentableViewController;
  v16 = -[BNBannerSourceListenerPresentableViewController initWithNibName:bundle:](&v30, sel_initWithNibName_bundle_, 0, 0);
  if (v16)
  {
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("BNBannerSourceListenerPresentableViewController.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentableIdentification"));

    }
    objc_msgSend(v13, "requesterIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    requesterIdentifier = v16->_requesterIdentifier;
    v16->_requesterIdentifier = (NSString *)v18;

    objc_msgSend(v13, "requestIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    requestIdentifier = v16->_requestIdentifier;
    v16->_requestIdentifier = (NSString *)v21;

    objc_msgSend(v13, "uniquePresentableIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    uniquePresentableIdentifier = v16->_uniquePresentableIdentifier;
    v16->_uniquePresentableIdentifier = (NSUUID *)v24;

    v16->_presentableBehavior = a4;
    v16->_contentBehavior = a5;
    v26 = objc_msgSend(v14, "copy");
    serviceDomain = v16->_serviceDomain;
    v16->_serviceDomain = (NSString *)v26;

    v16->_draggingDismissalEnabled = kBNPresentableContextIsDraggingDismissalEnabledDefault;
    v16->_draggingInteractionEnabled = kBNPresentableContextIsDraggingInteractionEnabledDefault;
    v16->_touchOutsideDismissalEnabled = kBNPresentableContextIsTouchOutsideDismissalEnabledDefault;
    -[BNBannerSourceListenerPresentableViewController _setReadyCompletion:](v16, "_setReadyCompletion:", v15);
  }

  return v16;
}

- (BNBannerSourceListenerPresentableViewController)initWithSpecification:(id)a3 serviceDomain:(id)a4 readyCompletion:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  BNBannerSourceListenerPresentableViewController *v13;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerSourceListenerPresentableViewController.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("serviceDomain"));

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerSourceListenerPresentableViewController.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentableSpecification"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerSourceListenerPresentableViewController.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("readyCompletion"));

LABEL_4:
  v12 = BNLogContextHost;
  if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v9;
    _os_log_impl(&dword_1B9628000, v12, OS_LOG_TYPE_DEFAULT, "Hosted presentable initialized with presentable specification: %{public}@", buf, 0xCu);
  }
  v13 = -[BNBannerSourceListenerPresentableViewController _initWithPresentableIdentification:presentableBehavior:contentBehavior:serviceDomain:readyCompletion:](self, "_initWithPresentableIdentification:presentableBehavior:contentBehavior:serviceDomain:readyCompletion:", v9, objc_msgSend(v9, "presentableBehavior"), objc_msgSend(v9, "contentBehavior"), v10, v11);

  return v13;
}

- (BNBannerSourceListenerPresentableViewController)initWithPresentable:(id)a3
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id *v10;
  BNBannerSourceListenerPresentableViewController *v11;
  id *v12;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerSourceListenerPresentableViewController.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentable"));

  }
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_msgSend(v6, "providesTemplateContent") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    BNEffectivePresentableDescription(v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNBannerSourceListenerPresentableViewController.m"), 55, CFSTR("This initializer can only be used with host-side template content-providing presentables: %@"), v15);

  }
  v7 = (void *)BNLogContextHost;
  if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    BNEffectivePresentableDescription(v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v18 = v9;
    _os_log_impl(&dword_1B9628000, v8, OS_LOG_TYPE_DEFAULT, "Hosted presentable initialized with template presentable: %{public}@", buf, 0xCu);

  }
  v10 = -[BNBannerSourceListenerPresentableViewController _initWithPresentableIdentification:presentableBehavior:contentBehavior:serviceDomain:readyCompletion:](self, "_initWithPresentableIdentification:presentableBehavior:contentBehavior:serviceDomain:readyCompletion:", v6, objc_msgSend(v6, "presentableBehavior"), 1, 0, 0);
  v11 = (BNBannerSourceListenerPresentableViewController *)v10;
  if (v10)
  {
    v12 = v10 + 126;
    objc_storeStrong(v10 + 126, a3);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(*v12, "setPresentableContext:", v11);
    -[BNBannerSourceListenerPresentableViewController setHostNeedsUpdate](v11, "setHostNeedsUpdate");
  }

  return v11;
}

- (void)loadView
{
  BNBannerSourceListenerPresentableViewControllerView *v3;

  v3 = objc_alloc_init(BNBannerSourceListenerPresentableViewControllerView);
  -[BNBannerSourceListenerPresentableViewControllerView setDelegate:](v3, "setDelegate:", self);
  -[BNBannerSourceListenerPresentableViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BNBannerSourceListenerPresentableViewController;
  -[BNBannerSourceListenerPresentableViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[BNBannerSourceListenerPresentableViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClipsToBounds:", 1);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  -[BNBannerSourceListenerPresentableViewController invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BNBannerSourceListenerPresentableViewController;
  -[BNBannerSourceListenerPresentableViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)isReady
{
  return 1;
}

- (void)setDelegate:(id)a3
{
  BNBannerSourcePresentableContext *v4;
  BNBannerSourcePresentableContext *presentableContext;
  id v6;

  v6 = a3;
  objc_storeWeak((id *)&self->_delegate, v6);
  if (!self->_presentable
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v6, "bannerSourceListenerPresentableShouldEnablePresentableContextInterface:", self))
  {
    v4 = -[BNBannerSourcePresentableContext initWithPresentableIdentification:contentBehavior:serviceDomain:]([BNBannerSourcePresentableContext alloc], "initWithPresentableIdentification:contentBehavior:serviceDomain:", self, self->_contentBehavior, self->_serviceDomain);
    presentableContext = self->_presentableContext;
    self->_presentableContext = v4;

    -[BNBannerSourcePresentableContext setDelegate:](self->_presentableContext, "setDelegate:", self);
  }

}

- (void)makeReadyIfPossible
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  id v7;

  -[BNBannerSourceListenerPresentableViewController readyCompletion](self, "readyCompletion");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[BNBannerSourceListenerPresentableViewController isReady](self, "isReady");

    if (v5)
    {
      -[BNBannerSourceListenerPresentableViewController readyCompletion](self, "readyCompletion");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[BNBannerSourceListenerPresentableViewController _setReadyCompletion:](self, "_setReadyCompletion:", 0);
      v6 = v7;
      if (v7)
      {
        (*((void (**)(id, BNBannerSourceListenerPresentableViewController *, _QWORD))v7 + 2))(v7, self, 0);
        v6 = v7;
      }

    }
  }
}

- (void)handleTemplateContentEvent:(int64_t)a3
{
  id *p_presentable;

  p_presentable = (id *)&self->_presentable;
  if (!self->_presentable)
  {
    p_presentable = (id *)&self->_presentableContext;
    goto LABEL_5;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
LABEL_5:
    objc_msgSend(*p_presentable, "handleTemplateContentEvent:", a3);
}

- (void)invalidate
{
  BNBannerSourcePresentableContext *presentableContext;

  -[BNBannerSourcePresentableContext invalidate](self->_presentableContext, "invalidate");
  presentableContext = self->_presentableContext;
  self->_presentableContext = 0;

}

- (id)presentableDescription
{
  return BNPresentableDescription(self, 0);
}

- (NSSet)preferredBackgroundActivitiesToSuppress
{
  return 0;
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)BNLogContextHost;
  if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    BNEffectivePresentableDescription(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v7;
    _os_log_impl(&dword_1B9628000, v6, OS_LOG_TYPE_DEFAULT, "Hosted presentable will appear as banner: %{public}@", buf, 0xCu);

  }
  -[BNBannerSourceListenerPresentableViewController _setBannerAppearState:forPresentable:reason:](self, "_setBannerAppearState:forPresentable:reason:", 1, v4, 0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __81__BNBannerSourceListenerPresentableViewController_presentableWillAppearAsBanner___block_invoke;
  v9[3] = &unk_1E70445D0;
  v10 = v4;
  v8 = v4;
  -[BNBannerSourceListenerPresentableViewController _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_presentableWillAppearAsBanner_, v9);

}

uint64_t __81__BNBannerSourceListenerPresentableViewController_presentableWillAppearAsBanner___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentableWillAppearAsBanner:", *(_QWORD *)(a1 + 32));
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)BNLogContextHost;
  if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    BNEffectivePresentableDescription(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v12 = v7;
    _os_log_impl(&dword_1B9628000, v6, OS_LOG_TYPE_DEFAULT, "Hosted presentable did appear as banner: %{public}@", buf, 0xCu);

  }
  -[BNBannerSourceListenerPresentableViewController _setBannerAppearState:forPresentable:reason:](self, "_setBannerAppearState:forPresentable:reason:", 2, v4, 0);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__BNBannerSourceListenerPresentableViewController_presentableDidAppearAsBanner___block_invoke;
  v9[3] = &unk_1E70445D0;
  v10 = v4;
  v8 = v4;
  -[BNBannerSourceListenerPresentableViewController _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_presentableDidAppearAsBanner_, v9);

}

uint64_t __80__BNBannerSourceListenerPresentableViewController_presentableDidAppearAsBanner___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentableDidAppearAsBanner:", *(_QWORD *)(a1 + 32));
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)BNLogContextHost;
  if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    BNEffectivePresentableDescription(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v10;
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_1B9628000, v9, OS_LOG_TYPE_DEFAULT, "Hosted presentable will disappear as banner: %{public}@ (%{public}@)", buf, 0x16u);

  }
  -[BNBannerSourceListenerPresentableViewController _setBannerAppearState:forPresentable:reason:](self, "_setBannerAppearState:forPresentable:reason:", 3, v6, v7);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __95__BNBannerSourceListenerPresentableViewController_presentableWillDisappearAsBanner_withReason___block_invoke;
  v13[3] = &unk_1E7044580;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  -[BNBannerSourceListenerPresentableViewController _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_presentableWillDisappearAsBanner_withReason_, v13);

}

uint64_t __95__BNBannerSourceListenerPresentableViewController_presentableWillDisappearAsBanner_withReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentableWillDisappearAsBanner:withReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)BNLogContextHost;
  if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    BNEffectivePresentableDescription(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v10;
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_1B9628000, v9, OS_LOG_TYPE_DEFAULT, "Hosted presentable did disappear as banner: %{public}@ (%{public}@)", buf, 0x16u);

  }
  -[BNBannerSourceListenerPresentableViewController _setBannerAppearState:forPresentable:reason:](self, "_setBannerAppearState:forPresentable:reason:", 0, v6, v7);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __94__BNBannerSourceListenerPresentableViewController_presentableDidDisappearAsBanner_withReason___block_invoke;
  v13[3] = &unk_1E7044580;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  -[BNBannerSourceListenerPresentableViewController _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_presentableDidDisappearAsBanner_withReason_, v13);

}

uint64_t __94__BNBannerSourceListenerPresentableViewController_presentableDidDisappearAsBanner_withReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentableDidDisappearAsBanner:withReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)BNLogContextHost;
  if (os_log_type_enabled((os_log_t)BNLogContextHost, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    BNEffectivePresentableDescription(v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v10;
    v18 = 2114;
    v19 = v7;
    _os_log_impl(&dword_1B9628000, v9, OS_LOG_TYPE_DEFAULT, "Hosted presentable will NOT appear as banner: %{public}@ (%{public}@)", buf, 0x16u);

  }
  if (self->_presentable)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[BNPresentable presentableWillNotAppearAsBanner:withReason:](self->_presentable, "presentableWillNotAppearAsBanner:withReason:", self->_presentable, v7);
  }
  else
  {
    -[BNBannerSourcePresentableContext handlePresentableWillNotAppearWithReason:](self->_presentableContext, "handlePresentableWillNotAppearWithReason:", v7);
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __95__BNBannerSourceListenerPresentableViewController_presentableWillNotAppearAsBanner_withReason___block_invoke;
  v13[3] = &unk_1E7044580;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  -[BNBannerSourceListenerPresentableViewController _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_presentableWillNotAppearAsBanner_withReason_, v13);

}

uint64_t __95__BNBannerSourceListenerPresentableViewController_presentableWillNotAppearAsBanner_withReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentableWillNotAppearAsBanner:withReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  -[BNBannerSourceListenerPresentableViewController _setUserInteractionWillBegin:forPresentable:](self, "_setUserInteractionWillBegin:forPresentable:", 1, v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __99__BNBannerSourceListenerPresentableViewController_userInteractionWillBeginForBannerForPresentable___block_invoke;
  v6[3] = &unk_1E70445D0;
  v7 = v4;
  v5 = v4;
  -[BNBannerSourceListenerPresentableViewController _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_userInteractionWillBeginForBannerForPresentable_, v6);

}

uint64_t __99__BNBannerSourceListenerPresentableViewController_userInteractionWillBeginForBannerForPresentable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userInteractionWillBeginForBannerForPresentable:", *(_QWORD *)(a1 + 32));
}

- (void)userInteractionDidEndForBannerForPresentable:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  -[BNBannerSourceListenerPresentableViewController _setUserInteractionWillBegin:forPresentable:](self, "_setUserInteractionWillBegin:forPresentable:", 0, v4);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __96__BNBannerSourceListenerPresentableViewController_userInteractionDidEndForBannerForPresentable___block_invoke;
  v6[3] = &unk_1E70445D0;
  v7 = v4;
  v5 = v4;
  -[BNBannerSourceListenerPresentableViewController _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_userInteractionDidEndForBannerForPresentable_, v6);

}

uint64_t __96__BNBannerSourceListenerPresentableViewController_userInteractionDidEndForBannerForPresentable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "userInteractionDidEndForBannerForPresentable:", *(_QWORD *)(a1 + 32));
}

- (void)addPresentableObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v8 = v4;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v8);
    v4 = v8;
  }

}

- (void)removePresentableObserver:(id)a3
{
  NSHashTable *observers;

  if (a3)
  {
    observers = self->_observers;
    if (observers)
      -[NSHashTable removeObject:](observers, "removeObject:");
  }
}

- (BOOL)bannerSourcePresentableContext:(id)a3 isConnectingProcessAuthorized:(id)a4 error:(id *)a5
{
  id v7;
  id WeakRetained;
  char v9;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v9 = objc_msgSend(WeakRetained, "bannerSourceListenerPresentable:isConnectingProcessAuthorized:error:", self, v7, a5);
  else
    v9 = 0;

  return v9;
}

- (void)bannerSourcePresentableContextDraggingDismissalEnabledDidChange:(id)a3
{
  self->_draggingDismissalEnabled = objc_msgSend(a3, "isDraggingDismissalEnabled");
}

- (void)bannerSourcePresentableContextDraggingInteractionEnabledDidChange:(id)a3
{
  self->_draggingInteractionEnabled = objc_msgSend(a3, "isDraggingInteractionEnabled");
}

- (void)bannerSourcePresentableContextTouchOutsideDismissalEnabledDidChange:(id)a3
{
  self->_touchOutsideDismissalEnabled = objc_msgSend(a3, "isTouchOutsideDismissalEnabled");
}

- (void)setHostNeedsUpdate
{
  char v3;
  char v4;
  char v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = -[BNPresentable isDraggingDismissalEnabled](self->_presentable, "isDraggingDismissalEnabled");
  else
    v3 = kBNPresentableContextIsDraggingDismissalEnabledDefault != 0;
  self->_draggingDismissalEnabled = v3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = -[BNPresentable isDraggingInteractionEnabled](self->_presentable, "isDraggingInteractionEnabled");
  else
    v4 = kBNPresentableContextIsDraggingInteractionEnabledDefault != 0;
  self->_draggingInteractionEnabled = v4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = -[BNPresentable isTouchOutsideDismissalEnabled](self->_presentable, "isTouchOutsideDismissalEnabled");
  else
    v5 = kBNPresentableContextIsTouchOutsideDismissalEnabledDefault != 0;
  self->_touchOutsideDismissalEnabled = v5;
}

- (void)_setBannerAppearState:(int)a3 forPresentable:(id)a4 reason:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;

  v6 = *(_QWORD *)&a3;
  v9 = a4;
  v8 = a5;
  self->_bannerAppearState = v6;
  if (self->_presentable)
  {
    switch((int)v6)
    {
      case 0:
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[BNPresentable presentableDidDisappearAsBanner:withReason:](self->_presentable, "presentableDidDisappearAsBanner:withReason:", self->_presentable, v8);
        break;
      case 1:
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[BNPresentable presentableWillAppearAsBanner:](self->_presentable, "presentableWillAppearAsBanner:", self->_presentable);
        break;
      case 2:
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[BNPresentable presentableDidAppearAsBanner:](self->_presentable, "presentableDidAppearAsBanner:", self->_presentable);
        break;
      case 3:
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[BNPresentable presentableWillDisappearAsBanner:withReason:](self->_presentable, "presentableWillDisappearAsBanner:withReason:", self->_presentable, v8);
        break;
      default:
        break;
    }
  }
  else
  {
    -[BNBannerSourcePresentableContext updatePresentableAppearState:reason:](self->_presentableContext, "updatePresentableAppearState:reason:", v6, v8);
  }

}

- (void)_setUserInteractionWillBegin:(BOOL)a3 forPresentable:(id)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a3;
  v6 = a4;
  if (self->_presentable)
  {
    if (v4)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[BNPresentable userInteractionWillBeginForBannerForPresentable:](self->_presentable, "userInteractionWillBeginForBannerForPresentable:", self->_presentable);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[BNPresentable userInteractionDidEndForBannerForPresentable:](self->_presentable, "userInteractionDidEndForBannerForPresentable:", self->_presentable);
    }
  }
  else
  {
    -[BNBannerSourcePresentableContext updateUserInteractionWillBegin:](self->_presentableContext, "updateUserInteractionWillBegin:", v4);
  }

}

- (BNPresentable)presentable
{
  return self->_presentable;
}

- (NSUUID)uniquePresentableIdentifier
{
  return self->_uniquePresentableIdentifier;
}

- (int)bannerAppearState
{
  return self->_bannerAppearState;
}

- (BNBannerSourceListenerPresentableDelegate)delegate
{
  return (BNBannerSourceListenerPresentableDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)requesterIdentifier
{
  return self->_requesterIdentifier;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (int64_t)presentableBehavior
{
  return self->_presentableBehavior;
}

- (BOOL)isDraggingDismissalEnabled
{
  return self->_draggingDismissalEnabled;
}

- (BOOL)isDraggingInteractionEnabled
{
  return self->_draggingInteractionEnabled;
}

- (BOOL)isTouchOutsideDismissalEnabled
{
  return self->_touchOutsideDismissalEnabled;
}

- (int64_t)contentBehavior
{
  return self->_contentBehavior;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_requesterIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_uniquePresentableIdentifier, 0);
  objc_storeStrong((id *)&self->_presentable, 0);
  objc_storeStrong((id *)&self->_serviceDomain, 0);
  objc_storeStrong(&self->_readyCompletion, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_presentableContext, 0);
}

- (void)_setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (id)readyCompletion
{
  return (id)MEMORY[0x1BCCC21C4](self->_readyCompletion, a2);
}

- (void)_setReadyCompletion:(id)a3
{
  void *v4;
  id readyCompletion;

  v4 = (void *)objc_msgSend(a3, "copy");
  readyCompletion = self->_readyCompletion;
  self->_readyCompletion = v4;

}

- (BOOL)_isPresentableContextInterfaceAvailable
{
  id WeakRetained;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_presentableContext)
  {
    v4 = 1;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(WeakRetained, "bannerSourceListenerPresentableShouldEnablePresentableContextInterface:", self);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a4;
  if (v5 && -[NSHashTable count](self->_observers, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v5[2](v5, v11);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

@end
