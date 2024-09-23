@implementation CNAvatarViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, 0);
  objc_destroyWeak((id *)&self->objectViewControllerDelegate);
}

- (void)setObjectViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->objectViewControllerDelegate, a3);
}

- (CNAvatarViewController)initWithSettings:(id)a3
{
  id v4;
  CNAvatarViewController *v5;
  CNAvatarViewController *v6;
  objc_super v8;

  v4 = a3;
  if (-[CNAvatarViewController isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
  {

    v5 = (CNAvatarViewController *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "defaultImplementation")), "initWithSettings:", v4);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CNAvatarViewController;
    v5 = -[CNAvatarViewController initWithNibName:bundle:](&v8, sel_initWithNibName_bundle_, 0, 0);
  }
  v6 = v5;

  return v6;
}

+ (Class)defaultImplementation
{
  return (Class)objc_opt_class();
}

- (CNAvatarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  void *v5;
  CNAvatarViewController *v6;

  +[CNAvatarViewControllerSettings defaultSettings](CNAvatarViewControllerSettings, "defaultSettings", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CNAvatarViewController initWithSettings:](self, "initWithSettings:", v5);

  return v6;
}

+ (id)descriptorForRequiredKeysWithThreeDTouchEnabled:(BOOL)a3
{
  return +[CNAvatarView descriptorForRequiredKeysWithThreeDTouchEnabled:](CNAvatarView, "descriptorForRequiredKeysWithThreeDTouchEnabled:", a3);
}

- (id)descriptorForRequiredKeys
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[CNAvatarViewController descriptorForRequiredKeys]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptorWithKeyDescriptors:description:", MEMORY[0x1E0C9AA60], v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CNAvatarViewController)initWithCoder:(id)a3
{
  void *v4;
  CNAvatarViewController *v5;

  +[CNAvatarViewControllerSettings defaultSettings](CNAvatarViewControllerSettings, "defaultSettings", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNAvatarViewController initWithSettings:](self, "initWithSettings:", v4);

  return v5;
}

- (CALayer)sourceAvatarLayer
{
  void *v2;
  void *v3;

  -[CNAvatarViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceAvatarLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CALayer *)v3;
}

- (UIImageView)destinationAvatarImageView
{
  void *v2;
  void *v3;

  -[CNAvatarViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "destinationAvatarImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImageView *)v3;
}

- (void)performTransitionAnimationWithCompletion:(id)a3
{
  -[CNAvatarViewController performTransitionAnimationWithStartHandler:completion:](self, "performTransitionAnimationWithStartHandler:completion:", 0, a3);
}

- (void)performTransitionAnimationWithStartHandler:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t);
  void (**v7)(id, uint64_t);
  void *v8;
  NSObject *v9;
  CNSharedProfileAnimationGenerator *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(id, uint64_t);
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  void (**v26)(id, uint64_t);
  _QWORD v27[5];
  void (**v28)(id, uint64_t);
  uint8_t buf[16];

  v6 = (void (**)(id, uint64_t))a3;
  v7 = (void (**)(id, uint64_t))a4;
  -[CNAvatarViewController sharedProfileStateOracle](self, "sharedProfileStateOracle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    CNUILogAvatarView();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_18AC56000, v9, OS_LOG_TYPE_DEBUG, "Skipping transition animation, no state oracle", buf, 2u);
    }
    goto LABEL_7;
  }
  if (!-[CNAvatarViewController isPerformingTransition](self, "isPerformingTransition"))
  {
    v10 = objc_alloc_init(CNSharedProfileAnimationGenerator);
    -[CNAvatarViewController sharedProfileStateOracle](self, "sharedProfileStateOracle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "avatarViewAnimationTypeForEffectiveState");

    if (v6)
      v6[2](v6, v12);
    if (v12 == 2)
    {
      CNUILogAvatarView();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18AC56000, v19, OS_LOG_TYPE_DEFAULT, "No transition animation to perform", buf, 2u);
      }

      if (v7)
        v7[2](v7, 2);
      goto LABEL_25;
    }
    if (v12 == 1)
    {
      CNUILogAvatarView();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18AC56000, v20, OS_LOG_TYPE_DEFAULT, "Performing transition animation (peek-a-boo)", buf, 2u);
      }

      -[CNAvatarViewController setIsPerformingTransition:](self, "setIsPerformingTransition:", 1);
      -[CNAvatarViewController sharedProfileStateOracle](self, "sharedProfileStateOracle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "pendingNickname");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAvatarViewController sharedProfileStateOracle](self, "sharedProfileStateOracle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "contact");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __80__CNAvatarViewController_performTransitionAnimationWithStartHandler_completion___block_invoke_7;
      v25[3] = &unk_1E204F9B0;
      v25[4] = self;
      v26 = v7;
      -[CNSharedProfileAnimationGenerator performPeekABooAnimationForAnimatingAvatarView:pendingNickname:contact:completionHandler:](v10, "performPeekABooAnimationForAnimatingAvatarView:pendingNickname:contact:completionHandler:", self, v22, v24, v25);

      v18 = v26;
    }
    else
    {
      if (v12)
      {
LABEL_25:

        goto LABEL_26;
      }
      CNUILogAvatarView();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18AC56000, v13, OS_LOG_TYPE_DEFAULT, "Performing transition animation (coin flip)", buf, 2u);
      }

      -[CNAvatarViewController setIsPerformingTransition:](self, "setIsPerformingTransition:", 1);
      -[CNAvatarViewController sharedProfileStateOracle](self, "sharedProfileStateOracle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pendingNickname");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNAvatarViewController sharedProfileStateOracle](self, "sharedProfileStateOracle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "contact");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __80__CNAvatarViewController_performTransitionAnimationWithStartHandler_completion___block_invoke;
      v27[3] = &unk_1E204F9B0;
      v27[4] = self;
      v28 = v7;
      -[CNSharedProfileAnimationGenerator performCoinFlipAnimationForAnimatingAvatarView:pendingNickname:contact:completionHandler:](v10, "performCoinFlipAnimationForAnimatingAvatarView:pendingNickname:contact:completionHandler:", self, v15, v17, v27);

      v18 = v28;
    }

    goto LABEL_25;
  }
  CNUILogAvatarView();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18AC56000, v9, OS_LOG_TYPE_DEFAULT, "Skipping transition animation, animation already in progress", buf, 2u);
  }
LABEL_7:

  if (v7)
    v7[2](v7, 2);
LABEL_26:

}

- (CNUIObjectViewControllerDelegate)objectViewControllerDelegate
{
  return (CNUIObjectViewControllerDelegate *)objc_loadWeakRetained((id *)&self->objectViewControllerDelegate);
}

- (CNSharedProfileStateOracle)sharedProfileStateOracle
{
  return self->_sharedProfileStateOracle;
}

- (void)setSharedProfileStateOracle:(id)a3
{
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, a3);
}

- (BOOL)isPerformingTransition
{
  return self->_isPerformingTransition;
}

- (void)setIsPerformingTransition:(BOOL)a3
{
  self->_isPerformingTransition = a3;
}

- (BOOL)allowStaleRendering
{
  return self->_allowStaleRendering;
}

- (void)setAllowStaleRendering:(BOOL)a3
{
  self->_allowStaleRendering = a3;
}

uint64_t __80__CNAvatarViewController_performTransitionAnimationWithStartHandler_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setIsPerformingTransition:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __80__CNAvatarViewController_performTransitionAnimationWithStartHandler_completion___block_invoke_7(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setIsPerformingTransition:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

@end
