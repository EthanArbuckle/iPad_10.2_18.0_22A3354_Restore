@implementation AVTAttributeEditorToActionsTransitionAnimator

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

- (AVTAttributeEditorToActionsTransitionAnimator)initWithAVTViewLayoutInfo:(id)a3 userInfoViewHeight:(double)a4 RTL:(BOOL)a5 environment:(id)a6
{
  id v11;
  id v12;
  AVTAttributeEditorToActionsTransitionAnimator *v13;
  AVTAttributeEditorToActionsTransitionAnimator *v14;
  objc_super v16;

  v11 = a3;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)AVTAttributeEditorToActionsTransitionAnimator;
  v13 = -[AVTAttributeEditorToActionsTransitionAnimator init](&v16, sel_init);
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
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double userInfoViewHeight;
  _BOOL8 v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  _BOOL8 v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  _BOOL8 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  AVTAvatarActionsViewControllerTransitionPadStartingLayout *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  AVTAvatarActionsViewControllerTransitionStartingLayout *v80;
  __objc2_class *v81;
  AVTAvatarActionsViewControllerTransitionStartingLayout *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  void *v105;
  void *v106;
  id v107;
  id v108;
  id v109;
  id v110;
  id v111;
  id v112;
  id v113;
  id v114;
  id v115;
  double v116;
  double v117;
  void *v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  id v123;
  double v124;
  _QWORD v125[5];
  id v126;
  id v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;

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
  v123 = v5;
  objc_msgSend(v7, "currentLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = objc_msgSend(v8, "buttonCount");

  objc_msgSend(v4, "finalFrameForViewController:", v7);
  v10 = v9;
  v124 = v9;
  v12 = v11;
  objc_msgSend(v4, "viewForKey:", *MEMORY[0x1E0CEBDB0]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForKey:", *MEMORY[0x1E0CEBDC0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "backgroundColor");
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = (void *)v15;
  objc_msgSend(v16, "setBackgroundColor:", v15);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBackgroundColor:", v17);

  objc_msgSend(v4, "containerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", v14);

  objc_msgSend((id)objc_opt_class(), "adjustedSafeAreaInsetsForView:", v13);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  userInfoViewHeight = self->_userInfoViewHeight;
  v28 = -[AVTAttributeEditorToActionsTransitionAnimator RTL](self, "RTL");
  -[AVTAttributeEditorToActionsTransitionAnimator environment](self, "environment");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = v12;
  +[AVTAvatarAttributeEditorLayoutProvider defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:](AVTAvatarAttributeEditorLayoutProvider, "defaultLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:", v28, v29, v10, v12, v20, v22, v24, v26, userInfoViewHeight);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "adjustedSafeAreaInsetsForView:", v13);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v39 = self->_userInfoViewHeight;
  v40 = -[AVTAttributeEditorToActionsTransitionAnimator RTL](self, "RTL");
  -[AVTAttributeEditorToActionsTransitionAnimator environment](self, "environment");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTAvatarAttributeEditorLayoutProvider editorToActionsTransitionStartingLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:](AVTAvatarAttributeEditorLayoutProvider, "editorToActionsTransitionStartingLayoutInContainerOfSize:insets:userInfoViewHeight:RTL:environment:", v40, v41, v10, v12, v32, v34, v36, v38, v39);
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "adjustedSafeAreaInsetsForView:", v13);
  v116 = v42;
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v49 = self->_userInfoViewHeight;
  v50 = -[AVTAttributeEditorToActionsTransitionAnimator RTL](self, "RTL");
  objc_msgSend(v30, "avatarContainerFrame");
  v52 = v51;
  v54 = v53;
  v56 = v55;
  v58 = v57;
  -[AVTAttributeEditorToActionsTransitionAnimator environment](self, "environment");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTAvatarAttributeEditorLayoutProvider actionsToEditorTransitionStartingLayoutInContainerOfSize:attributesContentViewExtraHeight:insets:userInfoViewHeight:RTL:avatarViewStartFrame:avatarViewAlpha:environment:](AVTAvatarAttributeEditorLayoutProvider, "actionsToEditorTransitionStartingLayoutInContainerOfSize:attributesContentViewExtraHeight:insets:userInfoViewHeight:RTL:avatarViewStartFrame:avatarViewAlpha:environment:", v50, v59, v124, v117, 0.0, v116, v44, v46, v48, v49, v52, v54, v56, v58, 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTAttributeEditorToActionsTransitionAnimator environment](self, "environment");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = v7;
  v118 = v30;
  if (objc_msgSend(v61, "deviceIsPad"))
  {

  }
  else
  {
    -[AVTAttributeEditorToActionsTransitionAnimator environment](self, "environment");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "deviceIsMac");

    if (!v63)
    {
      v82 = [AVTAvatarActionsViewControllerTransitionStartingLayout alloc];
      objc_msgSend(v14, "safeAreaInsets");
      v84 = v83;
      v86 = v85;
      v88 = v87;
      v90 = v89;
      -[AVTAttributeEditorToActionsTransitionAnimator avtViewLayoutInfo](self, "avtViewLayoutInfo");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "avatarContainerFrame");
      v74 = v124;
      v75 = v120;
      v80 = -[AVTAvatarActionsViewControllerTransitionStartingLayout initWithContainerSize:insets:buttonCount:avtViewLayoutInfo:startingAvatarViewFrame:](v82, "initWithContainerSize:insets:buttonCount:avtViewLayoutInfo:startingAvatarViewFrame:", v120, v91, v124, v117, v84, v86, v88, v90, v92, v93, v94, v95);

      v81 = AVTAvatarActionsViewControllerLayout;
      goto LABEL_10;
    }
  }
  v64 = [AVTAvatarActionsViewControllerTransitionPadStartingLayout alloc];
  objc_msgSend(v14, "safeAreaInsets");
  v66 = v65;
  v68 = v67;
  v70 = v69;
  v72 = v71;
  -[AVTAttributeEditorToActionsTransitionAnimator avtViewLayoutInfo](self, "avtViewLayoutInfo");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "avatarContainerFrame");
  v74 = v124;
  v75 = v120;
  v80 = -[AVTAvatarActionsViewControllerTransitionPadStartingLayout initWithContainerSize:insets:buttonCount:avtViewLayoutInfo:startingAvatarViewFrame:](v64, "initWithContainerSize:insets:buttonCount:avtViewLayoutInfo:startingAvatarViewFrame:", v120, v73, v124, v117, v66, v68, v70, v72, v76, v77, v78, v79);

  v81 = AVTAvatarActionsViewControllerPadLayout;
LABEL_10:
  v96 = [v81 alloc];
  objc_msgSend(v14, "safeAreaInsets");
  v98 = v97;
  v100 = v99;
  v102 = v101;
  v104 = v103;
  -[AVTAttributeEditorToActionsTransitionAnimator avtViewLayoutInfo](self, "avtViewLayoutInfo");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = (void *)objc_msgSend(v96, "initWithContainerSize:insets:buttonCount:avtViewLayoutInfo:", v75, v105, v74, v117, v98, v100, v102, v104);

  v125[0] = MEMORY[0x1E0C809B0];
  v125[1] = 3221225472;
  v125[2] = __67__AVTAttributeEditorToActionsTransitionAnimator_animateTransition___block_invoke;
  v125[3] = &unk_1EA51E4E8;
  v125[4] = self;
  v126 = v4;
  v127 = v123;
  v128 = v119;
  v129 = v60;
  v130 = v13;
  v131 = v122;
  v132 = v106;
  v133 = v14;
  v134 = v121;
  v107 = v121;
  v108 = v14;
  v109 = v106;
  v110 = v122;
  v111 = v13;
  v112 = v60;
  v113 = v119;
  v114 = v123;
  v115 = v4;
  objc_msgSend(v110, "prepareForAnimatedTransitionWithLayout:completionBlock:", v80, v125);

}

void __67__AVTAttributeEditorToActionsTransitionAnimator_animateTransition___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  objc_msgSend(*(id *)(a1 + 32), "transitionDuration:", *(_QWORD *)(a1 + 40));
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 48), "applyLayout:", *(_QWORD *)(a1 + 56));
  v4 = (void *)MEMORY[0x1E0CEABB0];
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __67__AVTAttributeEditorToActionsTransitionAnimator_animateTransition___block_invoke_2;
  v17[3] = &unk_1EA51D570;
  v18 = *(id *)(a1 + 48);
  v19 = *(id *)(a1 + 64);
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __67__AVTAttributeEditorToActionsTransitionAnimator_animateTransition___block_invoke_3;
  v15[3] = &unk_1EA51D250;
  v16 = *(id *)(a1 + 72);
  objc_msgSend(v4, "animateWithDuration:animations:completion:", v17, v15, v3 * 0.4);
  v6 = (void *)MEMORY[0x1E0CEABB0];
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __67__AVTAttributeEditorToActionsTransitionAnimator_animateTransition___block_invoke_4;
  v12[3] = &unk_1EA51D570;
  v13 = *(id *)(a1 + 80);
  v14 = *(id *)(a1 + 88);
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __67__AVTAttributeEditorToActionsTransitionAnimator_animateTransition___block_invoke_5;
  v7[3] = &unk_1EA51E4C0;
  v8 = *(id *)(a1 + 96);
  v9 = *(id *)(a1 + 104);
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 72);
  objc_msgSend(v6, "animateWithDuration:delay:options:animations:completion:", 0, v12, v7, v3 * 0.3, v3 * 0.35);

}

uint64_t __67__AVTAttributeEditorToActionsTransitionAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyLayout:", *(_QWORD *)(a1 + 40));
}

uint64_t __67__AVTAttributeEditorToActionsTransitionAnimator_animateTransition___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __67__AVTAttributeEditorToActionsTransitionAnimator_animateTransition___block_invoke_4(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "applyLayout:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

uint64_t __67__AVTAttributeEditorToActionsTransitionAnimator_animateTransition___block_invoke_5(uint64_t a1)
{
  int v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "setBackgroundColor:", *(_QWORD *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(a1 + 48), "transitionWasCancelled");
  v3 = 56;
  if (v2)
    v3 = 32;
  objc_msgSend(*(id *)(a1 + v3), "removeFromSuperview");
  return objc_msgSend(*(id *)(a1 + 48), "completeTransition:", objc_msgSend(*(id *)(a1 + 48), "transitionWasCancelled") ^ 1);
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
