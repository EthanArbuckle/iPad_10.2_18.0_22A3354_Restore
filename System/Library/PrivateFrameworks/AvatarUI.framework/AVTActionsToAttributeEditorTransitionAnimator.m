@implementation AVTActionsToAttributeEditorTransitionAnimator

+ (UIEdgeInsets)adjustedSafeAreaInsetsForView:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  objc_msgSend(a3, "safeAreaInsets");
  if (v3 > 40.0)
    v3 = v3 + -40.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (AVTActionsToAttributeEditorTransitionAnimator)initWithAVTViewLayoutInfo:(id)a3 userInfoViewHeight:(double)a4 RTL:(BOOL)a5 environment:(id)a6
{
  id v11;
  id v12;
  AVTActionsToAttributeEditorTransitionAnimator *v13;
  AVTActionsToAttributeEditorTransitionAnimator *v14;
  objc_super v16;

  v11 = a3;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)AVTActionsToAttributeEditorTransitionAnimator;
  v13 = -[AVTActionsToAttributeEditorTransitionAnimator init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_environment, a6);
    objc_storeStrong((id *)&v14->_avtViewLayoutInfo, a3);
    v14->_RTL = a5;
    v14->_userInfoViewHeight = a4;
  }

  return v14;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  __objc2_class *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  _BOOL8 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  double userInfoViewHeight;
  double v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[4];
  id v65;
  AVTActionsToAttributeEditorTransitionAnimator *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  double v74;

  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0CEBDA8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0CEBDB8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v6);
  v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("AVTTypeMismatchException"), CFSTR("Unexpected object class for %@"), v5);
  v8 = v5;
  objc_msgSend(v4, "viewForKey:", *MEMORY[0x1E0CEBDB0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForKey:", *MEMORY[0x1E0CEBDC0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalFrameForViewController:", v7);
  v62 = v12;
  v63 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v8, "currentLayout");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "buttonCount");

  -[AVTActionsToAttributeEditorTransitionAnimator environment](self, "environment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v14;
  v61 = v16;
  if (objc_msgSend(v19, "deviceIsPad"))
  {

  }
  else
  {
    -[AVTActionsToAttributeEditorTransitionAnimator environment](self, "environment");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "deviceIsMac");

    if (!v21)
    {
      v22 = AVTAvatarActionsViewControllerLayout;
      goto LABEL_10;
    }
  }
  v22 = AVTAvatarActionsViewControllerPadLayout;
LABEL_10:
  v23 = [v22 alloc];
  objc_msgSend(v9, "safeAreaInsets");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  -[AVTActionsToAttributeEditorTransitionAnimator avtViewLayoutInfo](self, "avtViewLayoutInfo");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v23, "initWithContainerSize:insets:buttonCount:avtViewLayoutInfo:", v18, v32, v14, v16, v25, v27, v29, v31);

  objc_msgSend((id)objc_opt_class(), "adjustedSafeAreaInsetsForView:", v9);
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  userInfoViewHeight = self->_userInfoViewHeight;
  v42 = -[AVTActionsToAttributeEditorTransitionAnimator RTL](self, "RTL");
  objc_msgSend(v33, "avatarContainerViewFrame");
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v50 = v49;
  -[AVTActionsToAttributeEditorTransitionAnimator environment](self, "environment");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTAvatarAttributeEditorLayoutProvider actionsToEditorTransitionStartingLayoutInContainerOfSize:attributesContentViewExtraHeight:insets:userInfoViewHeight:RTL:avatarViewStartFrame:avatarViewAlpha:environment:](AVTAvatarAttributeEditorLayoutProvider, "actionsToEditorTransitionStartingLayoutInContainerOfSize:attributesContentViewExtraHeight:insets:userInfoViewHeight:RTL:avatarViewStartFrame:avatarViewAlpha:environment:", v42, v51, v60, v61, 100.0, v35, v37, v39, v41, userInfoViewHeight, v44, v46, v48, v50, 0x3FF0000000000000);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "containerView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "addSubview:", v10);

  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __67__AVTActionsToAttributeEditorTransitionAnimator_animateTransition___block_invoke;
  v64[3] = &unk_1EA51DC78;
  v71 = v63;
  v72 = v62;
  v73 = v60;
  v74 = v61;
  v65 = v4;
  v66 = self;
  v67 = v10;
  v68 = v52;
  v69 = v9;
  v70 = v7;
  v54 = v7;
  v55 = v9;
  v56 = v52;
  v57 = v10;
  v58 = v4;
  objc_msgSend(v54, "prepareForAnimatedTransitionWithLayout:completionBlock:", v56, v64);

}

void __67__AVTActionsToAttributeEditorTransitionAnimator_animateTransition___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  AVTAvatarAttributeEditorOverridingLayout *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  AVTAvatarAttributeEditorOverridingLayout *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  AVTAvatarAttributeEditorOverridingLayout *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  AVTAvatarAttributeEditorOverridingLayout *v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;

  v3 = a2;
  objc_msgSend(v3, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setAlpha:", 0.0);
  v6 = [AVTAvatarAttributeEditorOverridingLayout alloc];
  objc_msgSend((id)objc_opt_class(), "adjustedSafeAreaInsetsForView:", *(_QWORD *)(a1 + 48));
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(*(id *)(a1 + 56), "userInfoViewHeight");
  v16 = v15;
  v17 = objc_msgSend(*(id *)(a1 + 40), "RTL");
  objc_msgSend(*(id *)(a1 + 40), "environment");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTAvatarAttributeEditorLayoutProvider defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:](AVTAvatarAttributeEditorLayoutProvider, "defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:", v17, v18, *(double *)(a1 + 96), *(double *)(a1 + 104), v8, v10, v12, v14, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[AVTAvatarAttributeEditorOverridingLayout initWithLayout:](v6, "initWithLayout:", v19);

  -[AVTAvatarAttributeEditorOverridingLayout attributesContentViewFrame](v20, "attributesContentViewFrame");
  -[AVTAvatarAttributeEditorOverridingLayout setAttributesContentViewFrame:](v20, "setAttributesContentViewFrame:", v21 + 0.0, v22 + 0.0);
  objc_msgSend((id)objc_opt_class(), "adjustedSafeAreaInsetsForView:", *(_QWORD *)(a1 + 48));
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  objc_msgSend(*(id *)(a1 + 56), "userInfoViewHeight");
  v32 = v31;
  v33 = objc_msgSend(*(id *)(a1 + 40), "RTL");
  objc_msgSend(*(id *)(a1 + 40), "environment");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTAvatarAttributeEditorLayoutProvider defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:](AVTAvatarAttributeEditorLayoutProvider, "defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:", v33, v34, *(double *)(a1 + 96), *(double *)(a1 + 104), v24, v26, v28, v30, v32);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "transitionDuration:", *(_QWORD *)(a1 + 32));
  v37 = v36;
  v38 = v36 * 0.25;
  v39 = MEMORY[0x1E0C809B0];
  v40 = (void *)MEMORY[0x1E0CEABB0];
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __67__AVTActionsToAttributeEditorTransitionAnimator_animateTransition___block_invoke_2;
  v56[3] = &unk_1EA51D188;
  v57 = *(id *)(a1 + 64);
  v54[0] = v39;
  v54[1] = 3221225472;
  v54[2] = __67__AVTActionsToAttributeEditorTransitionAnimator_animateTransition___block_invoke_3;
  v54[3] = &unk_1EA51D250;
  v55 = v3;
  v41 = v3;
  objc_msgSend(v40, "animateWithDuration:animations:completion:", v56, v54, v38);
  v42 = (void *)MEMORY[0x1E0CEABB0];
  v51[0] = v39;
  v51[1] = 3221225472;
  v51[2] = __67__AVTActionsToAttributeEditorTransitionAnimator_animateTransition___block_invoke_4;
  v51[3] = &unk_1EA51D570;
  v52 = *(id *)(a1 + 72);
  v53 = v20;
  v45[0] = v39;
  v45[1] = 3221225472;
  v45[2] = __67__AVTActionsToAttributeEditorTransitionAnimator_animateTransition___block_invoke_5;
  v45[3] = &unk_1EA51DC50;
  v46 = *(id *)(a1 + 72);
  v47 = v35;
  v48 = *(id *)(a1 + 64);
  v49 = *(id *)(a1 + 32);
  v50 = *(id *)(a1 + 48);
  v43 = v35;
  v44 = v20;
  objc_msgSend(v42, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v51, v45, v37 * 0.75, v38, 0.7, 0.65);

}

uint64_t __67__AVTActionsToAttributeEditorTransitionAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __67__AVTActionsToAttributeEditorTransitionAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __67__AVTActionsToAttributeEditorTransitionAnimator_animateTransition___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyLayout:", *(_QWORD *)(a1 + 40));
}

uint64_t __67__AVTActionsToAttributeEditorTransitionAnimator_animateTransition___block_invoke_5(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "applyLayout:", *(_QWORD *)(a1 + 40));
  v2 = (id *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 1.0);
  if (objc_msgSend(*(id *)(a1 + 56), "transitionWasCancelled"))
  {
    v2 = (id *)(a1 + 64);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "containerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v3);

  }
  objc_msgSend(*v2, "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 32), "setDisableAvatarSnapshotting:", 0);
  return objc_msgSend(*(id *)(a1 + 56), "completeTransition:", objc_msgSend(*(id *)(a1 + 56), "transitionWasCancelled") ^ 1);
}

- (double)transitionDuration:(id)a3
{
  void *v3;
  double v4;
  double v5;

  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionAnimationsMultiplier");
  v5 = v4 * 0.84;

  return v5;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTViewLayoutInfo)avtViewLayoutInfo
{
  return self->_avtViewLayoutInfo;
}

- (BOOL)RTL
{
  return self->_RTL;
}

- (double)userInfoViewHeight
{
  return self->_userInfoViewHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avtViewLayoutInfo, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
