@implementation CNGroupAvatarViewController

- (CNGroupAvatarViewController)initWithGroup:(id)a3
{
  return -[CNGroupAvatarViewController initWithGroup:avatarViewControllerSettings:](self, "initWithGroup:avatarViewControllerSettings:", a3, 0);
}

- (CNGroupAvatarViewController)initWithGroup:(id)a3 avatarLayoutType:(unint64_t)a4
{
  return -[CNGroupAvatarViewController initWithGroup:avatarViewControllerSettings:avatarLayoutType:](self, "initWithGroup:avatarViewControllerSettings:avatarLayoutType:", a3, 0, a4);
}

- (CNGroupAvatarViewController)initWithGroup:(id)a3 avatarViewControllerSettings:(id)a4
{
  return -[CNGroupAvatarViewController initWithGroup:avatarViewControllerSettings:avatarLayoutType:](self, "initWithGroup:avatarViewControllerSettings:avatarLayoutType:", a3, a4, 0);
}

- (CNGroupAvatarViewController)initWithGroup:(id)a3 avatarViewControllerSettings:(id)a4 avatarLayoutType:(unint64_t)a5
{
  id v8;
  id v9;
  CNGroupAvatarViewController *v10;
  uint64_t v11;
  CNGroupIdentity *group;
  CNAvatarImageRendererSettings *v13;
  void *v14;
  void *v15;
  void *v16;
  CNAvatarImageRendererSettings *v17;
  CNVisualIdentityAvatarViewController *v18;
  CNVisualIdentity *v19;
  uint64_t v20;
  CNVisualIdentityAvatarViewController *avatarViewController;
  void *v22;
  void *v23;
  void *v24;
  CNGroupAvatarViewController *v25;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)CNGroupAvatarViewController;
  v10 = -[CNGroupAvatarViewController init](&v27, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "mutableCopy");
    group = v10->_group;
    v10->_group = (CNGroupIdentity *)v11;

    if (v9)
    {
      v13 = [CNAvatarImageRendererSettings alloc];
      objc_msgSend(v9, "likenessResolver");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "likenessRenderer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "schedulerProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[CNAvatarImageRendererSettings initWithLikenessResolver:likenessRenderer:schedulerProvider:](v13, "initWithLikenessResolver:likenessRenderer:schedulerProvider:", v14, v15, v16);

    }
    else
    {
      v17 = 0;
    }
    v18 = [CNVisualIdentityAvatarViewController alloc];
    v19 = -[CNVisualIdentity initWithGroupIdentity:]([CNVisualIdentity alloc], "initWithGroupIdentity:", v8);
    v20 = -[CNVisualIdentityAvatarViewController initWithVisualIdentity:primaryAvatarProvider:avatarImageRendererSettings:avatarLayoutType:](v18, "initWithVisualIdentity:primaryAvatarProvider:avatarImageRendererSettings:avatarLayoutType:", v19, 0, v17, a5);
    avatarViewController = v10->_avatarViewController;
    v10->_avatarViewController = (CNVisualIdentityAvatarViewController *)v20;

    -[CNVisualIdentityAvatarViewController view](v10->_avatarViewController, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAutoresizingMask:", 18);

    -[CNGroupAvatarViewController view](v10, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityAvatarViewController view](v10->_avatarViewController, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v24);

    -[CNGroupAvatarViewController addChildViewController:](v10, "addChildViewController:", v10->_avatarViewController);
    -[CNVisualIdentityAvatarViewController didMoveToParentViewController:](v10->_avatarViewController, "didMoveToParentViewController:", v10);
    v25 = v10;

  }
  return v10;
}

- (id)avatarLayers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CNGroupAvatarViewController avatarViewController](self, "avatarViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avatarLayoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avatarLayerItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_map:", &__block_literal_global_21_42472);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)loadView
{
  CNGroupAvatarContainerView *v3;
  void *v4;
  void *v5;
  void *v6;
  CNGroupAvatarContainerView *v7;

  v3 = [CNGroupAvatarContainerView alloc];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v7 = -[CNGroupAvatarContainerView initWithFrame:](v3, "initWithFrame:");

  -[CNGroupAvatarViewController avatarViewController](self, "avatarViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupAvatarContainerView setUnderlyingContainerView:](v7, "setUnderlyingContainerView:", v6);

  -[CNGroupAvatarViewController setView:](self, "setView:", v7);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)groupIdentityDidUpdate:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  CNVisualIdentity *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  CNVisualIdentity *v25;
  _QWORD v26[5];
  CNVisualIdentity *v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "groupPhoto");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[CNGroupAvatarViewController group](self, "group");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "groupPhoto");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v11 = 0;
LABEL_6:

      goto LABEL_7;
    }
  }
  objc_msgSend(v6, "groupPhoto");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNGroupAvatarViewController group](self, "group");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "groupPhoto");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "isEqualToData:", v10) ^ 1;

  if (!v7)
    goto LABEL_6;
LABEL_7:

  v12 = -[CNGroupAvatarViewController contactsEqualToContactsFromGroup:](self, "contactsEqualToContactsFromGroup:", v6);
  v13 = (void *)objc_msgSend(v6, "mutableCopy");
  -[CNGroupAvatarViewController setGroup:](self, "setGroup:", v13);

  objc_msgSend((id)objc_opt_class(), "log");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if ((v11 & 1) != 0 || !v12)
  {
    if (v15)
    {
      objc_msgSend(v6, "contacts");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");
      -[CNGroupAvatarViewController avatarViewController](self, "avatarViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "containingCellView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v29 = v22;
      v30 = 2114;
      v31 = v24;
      _os_log_impl(&dword_18AC56000, v14, OS_LOG_TYPE_INFO, "Group identity did update. itemCount:%lu, containingCell:%{public}@", buf, 0x16u);

    }
    v25 = -[CNVisualIdentity initWithGroupIdentity:]([CNVisualIdentity alloc], "initWithGroupIdentity:", v6);
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __54__CNGroupAvatarViewController_groupIdentityDidUpdate___block_invoke;
    v26[3] = &unk_1E204D520;
    v26[4] = self;
    v27 = v25;
    v20 = v25;
    -[CNGroupAvatarViewController performTransitionAnimationWithCompletion:](self, "performTransitionAnimationWithCompletion:", v26);

  }
  else
  {
    if (v15)
    {
      objc_msgSend(v6, "contacts");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");
      -[CNGroupAvatarViewController avatarViewController](self, "avatarViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "containingCellView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v29 = v17;
      v30 = 2114;
      v31 = v19;
      _os_log_impl(&dword_18AC56000, v14, OS_LOG_TYPE_INFO, "Skipping group identity update - no photo or contact changes. itemCount:%lu, containingCell:%{public}@", buf, 0x16u);

    }
    -[CNGroupAvatarViewController avatarViewController](self, "avatarViewController");
    v20 = (CNVisualIdentity *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentity logSublayersContent](v20, "logSublayersContent");
  }

}

- (BOOL)contactsEqualToContactsFromGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a3;
  -[CNGroupAvatarViewController group](self, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  objc_msgSend(v4, "contacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 == v9)
  {
    -[CNGroupAvatarViewController group](self, "group");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contacts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contacts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_cn_zip:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "_cn_all:", &__block_literal_global_26_42464);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)setBadgeImage:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_badgeImage, a3);
  v5 = a3;
  -[CNGroupAvatarViewController avatarViewController](self, "avatarViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBadgeImage:", v5);

}

- (void)setBadgeStyleSettings:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_badgeStyleSettings, a3);
  v5 = a3;
  -[CNGroupAvatarViewController avatarViewController](self, "avatarViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBadgeStyleSettings:", v5);

}

- (void)setMediaContextBadge:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_mediaContextBadge, a3);
  v5 = a3;
  -[CNGroupAvatarViewController avatarViewController](self, "avatarViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMediaContextBadge:", v5);

}

- (void)setIsMarkedForSyndication:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_isMarkedForSyndication != a3)
  {
    self->_isMarkedForSyndication = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("star.circle.fill"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNGroupAvatarViewController setBadgeImage:](self, "setBadgeImage:", v4);

      +[CNBadgingAvatarBadgeStyleSettings markedForSyndicationBadgeSettings](CNBadgingAvatarBadgeStyleSettings, "markedForSyndicationBadgeSettings");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[CNGroupAvatarViewController setBadgeStyleSettings:](self, "setBadgeStyleSettings:", v5);

    }
    else
    {
      -[CNGroupAvatarViewController setBadgeImage:](self, "setBadgeImage:", 0);
    }
  }
}

- (void)setIsDoNotDisturb:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_isDoNotDisturb != a3)
  {
    self->_isDoNotDisturb = a3;
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "cnui_symbolImageNamed:scale:withColor:useFixedSize:compatibleWithTextStyle:", CFSTR("moon.fill"), -1, 0, 1, *MEMORY[0x1E0DC4AB8]);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNGroupAvatarViewController setBadgeImage:](self, "setBadgeImage:", v4);

      +[CNBadgingAvatarBadgeStyleSettings doNotDisturbBadgeSettings](CNBadgingAvatarBadgeStyleSettings, "doNotDisturbBadgeSettings");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[CNGroupAvatarViewController setBadgeStyleSettings:](self, "setBadgeStyleSettings:", v5);

    }
    else
    {
      -[CNGroupAvatarViewController setBadgeImage:](self, "setBadgeImage:", 0);
    }
  }
}

- (CGSize)primaryAvatarSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[CNGroupAvatarViewController avatarViewController](self, "avatarViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryAvatarSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CALayer)sourceAvatarLayer
{
  void *v2;
  void *v3;

  -[CNGroupAvatarViewController avatarViewController](self, "avatarViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryAvatarLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CALayer *)v3;
}

- (UIImageView)destinationAvatarImageView
{
  void *v2;
  void *v3;

  -[CNGroupAvatarViewController avatarViewController](self, "avatarViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryAvatarAlternativeImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImageView *)v3;
}

- (void)performTransitionAnimationWithCompletion:(id)a3
{
  -[CNGroupAvatarViewController performTransitionAnimationWithStartHandler:completion:](self, "performTransitionAnimationWithStartHandler:completion:", 0, a3);
}

- (void)setIsPerformingTransition:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_isPerformingTransition != a3)
  {
    v3 = a3;
    self->_isPerformingTransition = a3;
    -[CNGroupAvatarViewController avatarViewController](self, "avatarViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsPerformingTransition:", v3);

  }
}

- (void)performTransitionAnimationWithStartHandler:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t);
  void (**v7)(id, uint64_t);
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  CNSharedProfileAnimationGenerator *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void (**v21)(id, uint64_t);
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  void (**v29)(id, uint64_t);
  _QWORD v30[5];
  void (**v31)(id, uint64_t);
  uint8_t buf[4];
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t))a3;
  v7 = (void (**)(id, uint64_t))a4;
  -[CNGroupAvatarViewController group](self, "group");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfContacts");

  if (v9 != 1)
  {
    CNUILogAvatarView();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      -[CNGroupAvatarViewController group](self, "group");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v33 = objc_msgSend(v12, "numberOfContacts");
      _os_log_impl(&dword_18AC56000, v11, OS_LOG_TYPE_INFO, "Skipping transition animation, not supported for groups of %ld", buf, 0xCu);

    }
    goto LABEL_10;
  }
  -[CNGroupAvatarViewController sharedProfileStateOracle](self, "sharedProfileStateOracle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    CNUILogAvatarView();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_18AC56000, v11, OS_LOG_TYPE_DEBUG, "Skipping transition animation, no state oracle", buf, 2u);
    }
    goto LABEL_10;
  }
  if (!-[CNGroupAvatarViewController isPerformingTransition](self, "isPerformingTransition"))
  {
    v13 = objc_alloc_init(CNSharedProfileAnimationGenerator);
    -[CNGroupAvatarViewController sharedProfileStateOracle](self, "sharedProfileStateOracle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "avatarViewAnimationTypeForEffectiveState");

    if (v6)
      v6[2](v6, v15);
    if (v15 == 2)
    {
      CNUILogAvatarView();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18AC56000, v22, OS_LOG_TYPE_DEFAULT, "No transition animation to perform", buf, 2u);
      }

      if (v7)
        v7[2](v7, 2);
      goto LABEL_28;
    }
    if (v15 == 1)
    {
      CNUILogAvatarView();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18AC56000, v23, OS_LOG_TYPE_DEFAULT, "Performing transition animation (peek-a-boo)", buf, 2u);
      }

      -[CNGroupAvatarViewController setIsPerformingTransition:](self, "setIsPerformingTransition:", 1);
      -[CNGroupAvatarViewController sharedProfileStateOracle](self, "sharedProfileStateOracle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "pendingNickname");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNGroupAvatarViewController sharedProfileStateOracle](self, "sharedProfileStateOracle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "contact");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __85__CNGroupAvatarViewController_performTransitionAnimationWithStartHandler_completion___block_invoke_33;
      v28[3] = &unk_1E204F9B0;
      v28[4] = self;
      v29 = v7;
      -[CNSharedProfileAnimationGenerator performPeekABooAnimationForAnimatingAvatarView:pendingNickname:contact:completionHandler:](v13, "performPeekABooAnimationForAnimatingAvatarView:pendingNickname:contact:completionHandler:", self, v25, v27, v28);

      v21 = v29;
    }
    else
    {
      if (v15)
      {
LABEL_28:

        goto LABEL_29;
      }
      CNUILogAvatarView();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18AC56000, v16, OS_LOG_TYPE_DEFAULT, "Performing transition animation (coin flip)", buf, 2u);
      }

      -[CNGroupAvatarViewController setIsPerformingTransition:](self, "setIsPerformingTransition:", 1);
      -[CNGroupAvatarViewController sharedProfileStateOracle](self, "sharedProfileStateOracle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pendingNickname");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNGroupAvatarViewController sharedProfileStateOracle](self, "sharedProfileStateOracle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "contact");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __85__CNGroupAvatarViewController_performTransitionAnimationWithStartHandler_completion___block_invoke;
      v30[3] = &unk_1E204F9B0;
      v30[4] = self;
      v31 = v7;
      -[CNSharedProfileAnimationGenerator performCoinFlipAnimationForAnimatingAvatarView:pendingNickname:contact:completionHandler:](v13, "performCoinFlipAnimationForAnimatingAvatarView:pendingNickname:contact:completionHandler:", self, v18, v20, v30);

      v21 = v31;
    }

    goto LABEL_28;
  }
  CNUILogAvatarView();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18AC56000, v11, OS_LOG_TYPE_DEFAULT, "Skipping transition animation, animation already in progress", buf, 2u);
  }
LABEL_10:

  if (v7)
    v7[2](v7, 2);
LABEL_29:

}

- (CNSharedProfileStateOracle)sharedProfileStateOracle
{
  return self->_sharedProfileStateOracle;
}

- (void)setSharedProfileStateOracle:(id)a3
{
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, a3);
}

- (UIImage)badgeImage
{
  return self->_badgeImage;
}

- (CNBadgingAvatarBadgeStyleSettings)badgeStyleSettings
{
  return self->_badgeStyleSettings;
}

- (BOOL)isMarkedForSyndication
{
  return self->_isMarkedForSyndication;
}

- (BOOL)isDoNotDisturb
{
  return self->_isDoNotDisturb;
}

- (CNAvatarAccessoryView)mediaContextBadge
{
  return self->_mediaContextBadge;
}

- (CNGroupIdentity)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (CNVisualIdentityAvatarViewController)avatarViewController
{
  return self->_avatarViewController;
}

- (void)setAvatarViewController:(id)a3
{
  objc_storeStrong((id *)&self->_avatarViewController, a3);
}

- (BOOL)isPerformingTransition
{
  return self->_isPerformingTransition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarViewController, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_mediaContextBadge, 0);
  objc_storeStrong((id *)&self->_badgeStyleSettings, 0);
  objc_storeStrong((id *)&self->_badgeImage, 0);
  objc_storeStrong((id *)&self->_sharedProfileStateOracle, 0);
}

uint64_t __85__CNGroupAvatarViewController_performTransitionAnimationWithStartHandler_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setIsPerformingTransition:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __85__CNGroupAvatarViewController_performTransitionAnimationWithStartHandler_completion___block_invoke_33(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setIsPerformingTransition:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __64__CNGroupAvatarViewController_contactsEqualToContactsFromGroup___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "first");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "second");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v3, "isEqualIgnoringIdentifiers:", v4);
  return v5;
}

void __54__CNGroupAvatarViewController_groupIdentityDidUpdate___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "avatarViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visualIdentityDidUpdate:", *(_QWORD *)(a1 + 40));

}

uint64_t __43__CNGroupAvatarViewController_avatarLayers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "layer");
}

+ (id)log
{
  if (log_cn_once_token_1_42489 != -1)
    dispatch_once(&log_cn_once_token_1_42489, &__block_literal_global_42490);
  return (id)log_cn_once_object_1_42491;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_2_42483 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_2_42483, &__block_literal_global_13_42484);
  return (id)descriptorForRequiredKeys_cn_once_object_2_42485;
}

+ (unint64_t)maxContactAvatars
{
  return +[CNVisualIdentityAvatarViewController maxContactAvatars](CNVisualIdentityAvatarViewController, "maxContactAvatars");
}

void __56__CNGroupAvatarViewController_descriptorForRequiredKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C97200];
  +[CNVisualIdentityAvatarViewController descriptorForRequiredKeys](CNVisualIdentityAvatarViewController, "descriptorForRequiredKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNGroupAvatarViewController descriptorForRequiredKeys]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "descriptorWithKeyDescriptors:description:", v2, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)descriptorForRequiredKeys_cn_once_object_2_42485;
  descriptorForRequiredKeys_cn_once_object_2_42485 = v4;

}

void __34__CNGroupAvatarViewController_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.ui", "CNGroupAvatarViewController");
  v1 = (void *)log_cn_once_object_1_42491;
  log_cn_once_object_1_42491 = (uint64_t)v0;

}

@end
