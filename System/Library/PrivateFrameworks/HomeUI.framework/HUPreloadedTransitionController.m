@implementation HUPreloadedTransitionController

- (HUPreloadedTransitionController)init
{
  HUPreloadedTransitionController *v2;
  NAFuture *v3;
  NAFuture *completionFuture;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUPreloadedTransitionController;
  v2 = -[HUPreloadedTransitionController init](&v6, sel_init);
  if (v2)
  {
    v3 = (NAFuture *)objc_alloc_init(MEMORY[0x1E0D519C0]);
    completionFuture = v2->_completionFuture;
    v2->_completionFuture = v3;

  }
  return v2;
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0CEBDB8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUPreloadedTransitionController completionFuture](self, "completionFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EF230988))
  {
    _HUPreloadViewController(v5, 0, &__block_literal_global_38);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__HUPreloadedTransitionController_animateTransition___block_invoke_2;
    v11[3] = &unk_1E6F4D160;
    v12 = v6;
    v13 = v5;
    v14 = v4;
    v15 = v7;
    v9 = (id)objc_msgSend(v8, "addCompletionBlock:", v11);

  }
  else
  {
    objc_msgSend(v5, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v10);

    objc_msgSend(v4, "completeTransition:", 1);
    objc_msgSend(v7, "finishWithNoResult");
  }

}

uint64_t __53__HUPreloadedTransitionController_animateTransition___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

void __53__HUPreloadedTransitionController_animateTransition___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v7 = a3;
  v9 = a2;
  objc_msgSend(v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", v8);

  objc_msgSend(*(id *)(a1 + 48), "completeTransition:", v7 == 0);
  objc_msgSend(*(id *)(a1 + 56), "finishWithResult:error:", v9, v7);

}

- (NAFuture)completionFuture
{
  return self->_completionFuture;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionFuture, 0);
}

@end
