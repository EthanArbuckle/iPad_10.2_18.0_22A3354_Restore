@implementation CKChatInputController

- (void)_presentCompactSwitcherOverKeyboardWithCompletion:(id)a3
{
  id v4;
  CKPresentationControllerWindow *v5;
  void *v6;
  CKPresentationControllerWindow *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double *v17;
  double v18;
  double v19;
  double Width;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CKMessageEntryViewSnapshot *v45;
  void *v46;
  CKMessageEntryViewSnapshot *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  id v52;
  CKPresentationControllerWindow *v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double MinY;
  CGFloat v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD v68[4];
  CKMessageEntryViewSnapshot *v69;
  _QWORD aBlock[4];
  id v71;
  id v72;
  CKChatInputController *v73;
  CKPresentationControllerWindow *v74;
  id v75;
  char v76[9];
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  v4 = a3;
  -[CKChatInputController setInputViewWillBecomeVisible:](self, "setInputViewWillBecomeVisible:", 1);
  v5 = [CKPresentationControllerWindow alloc];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v7 = -[CKPresentationControllerWindow initWithFrame:allowsRotation:restrictedToPortraitOrientation:](v5, "initWithFrame:allowsRotation:restrictedToPortraitOrientation:", 0, 0);

  -[CKChatInputController browserSwitcher](self, "browserSwitcher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginAppearanceTransition:animated:", 1, 1);

  -[CKPresentationControllerWindow rootViewController](v7, "rootViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatInputController browserSwitcher](self, "browserSwitcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addChildViewController:", v11);

  -[CKChatInputController browserSwitcher](self, "browserSwitcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v13);

  -[CKChatInputController browserSwitcher](self, "browserSwitcher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "didMoveToParentViewController:", v9);

  v76[0] = 0;
  +[CKInputView defaultContentSizeLargerThanKeyboard:](CKInputView, "defaultContentSizeLargerThanKeyboard:", v76);
  v16 = v15;
  v17 = (double *)MEMORY[0x1E0C9D648];
  v18 = *MEMORY[0x1E0C9D648];
  -[CKPresentationControllerWindow bounds](v7, "bounds");
  v19 = CGRectGetMaxY(v77) - v16;
  -[CKPresentationControllerWindow bounds](v7, "bounds");
  Width = CGRectGetWidth(v78);
  -[CKChatInputController browserSwitcher](self, "browserSwitcher");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v18, v19, Width, v16);

  -[CKPresentationControllerWindow setHidden:](v7, "setHidden:", 0);
  -[CKChatInputController browserSwitcher](self, "browserSwitcher");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "layoutIfNeeded");

  -[CKChatInputController browserSwitcher](self, "browserSwitcher");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setUserInteractionEnabled:", 0);

  if (v76[0])
  {
    -[CKChatInputController entryView](self, "entryView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "frame");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    -[CKChatInputController entryView](self, "entryView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPresentationControllerWindow convertRect:fromView:](v7, "convertRect:fromView:", v36, v29, v31, v33, v35);
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;

    v45 = [CKMessageEntryViewSnapshot alloc];
    -[CKChatInputController entryView](self, "entryView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[CKMessageEntryViewSnapshot initWithFrame:entryView:](v45, "initWithFrame:entryView:", v46, v38, v40, v42, v44);

    -[CKChatInputController browserSwitcher](self, "browserSwitcher");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "view");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertSubview:belowSubview:", v47, v49);

  }
  else
  {
    v47 = 0;
    v40 = v17[1];
    v42 = v17[2];
    v38 = v18;
    v44 = v17[3];
  }
  v50 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __118__CKChatInputController_CKChatInputController_CompactPresentation___presentCompactSwitcherOverKeyboardWithCompletion___block_invoke;
  aBlock[3] = &unk_1E274CC88;
  v51 = v9;
  v71 = v51;
  v52 = v10;
  v72 = v52;
  v73 = self;
  v53 = v7;
  v74 = v53;
  v54 = v4;
  v75 = v54;
  v55 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI"))
  {
    -[CKChatInputController delegate](self, "delegate");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "chatInputControllerRequestShowKeyboardSnapshot:", self);

  }
  -[CKChatInputController browserSwitcher](self, "browserSwitcher");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "animateInCompactWithCompletion:", v55);

  -[CKChatInputController entryView](self, "entryView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "prepareForBrowserSwitcherCompactTransitionIsSnapshotting:", v76[0]);

  if (v76[0])
  {
    v79.origin.x = v18;
    v79.origin.y = v19;
    v79.size.width = Width;
    v79.size.height = v16;
    MinY = CGRectGetMinY(v79);
    v80.origin.x = v38;
    v80.origin.y = v40;
    v80.size.width = v42;
    v80.size.height = v44;
    v60 = MinY - CGRectGetHeight(v80);
    objc_msgSend(MEMORY[0x1E0CD2848], "animation");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setKeyPath:", CFSTR("position.y"));
    objc_msgSend(v61, "setBeginTime:", CACurrentMediaTime() + 0.0500000007);
    objc_msgSend(v61, "setDuration:", 0.400000006);
    objc_msgSend(v61, "setMass:", 1.0);
    objc_msgSend(v61, "setStiffness:", 450.0);
    objc_msgSend(v61, "setDamping:", 35.0);
    objc_msgSend(v61, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    objc_msgSend(v61, "setRemovedOnCompletion:", 0);
    v62 = (void *)MEMORY[0x1E0CB37E8];
    v81.origin.x = v38;
    v81.origin.y = v40;
    v81.size.width = v42;
    v81.size.height = v44;
    CGRectGetMidX(v81);
    v82.origin.x = v38;
    v82.origin.y = v40;
    v82.size.width = v42;
    v82.size.height = v44;
    objc_msgSend(v62, "numberWithDouble:", CGRectGetMidY(v82));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setFromValue:", v63);

    v64 = (void *)MEMORY[0x1E0CB37E8];
    v83.origin.x = v38;
    v83.origin.y = v60;
    v83.size.width = v42;
    v83.size.height = v44;
    CGRectGetMidX(v83);
    v84.origin.x = v38;
    v84.origin.y = v60;
    v84.size.width = v42;
    v84.size.height = v44;
    objc_msgSend(v64, "numberWithDouble:", CGRectGetMidY(v84));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setToValue:", v65);

    -[CKMessageEntryViewSnapshot layer](v47, "layer");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "addAnimation:forKey:", v61, CFSTR("SpringPresentation"));

    v67 = (void *)MEMORY[0x1E0CEABB0];
    v68[0] = v50;
    v68[1] = 3221225472;
    v68[2] = __118__CKChatInputController_CKChatInputController_CompactPresentation___presentCompactSwitcherOverKeyboardWithCompletion___block_invoke_6;
    v68[3] = &unk_1E274A208;
    v69 = v47;
    objc_msgSend(v67, "animateWithDuration:animations:", v68, 0.400000006);

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

void __118__CKChatInputController_CKChatInputController_CompactPresentation___presentCompactSwitcherOverKeyboardWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD block[5];
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "snapshotViewAfterScreenUpdates:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

  objc_msgSend(*(id *)(a1 + 40), "addSubview:", v3);
  if (objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI"))
  {
    objc_msgSend(*(id *)(a1 + 48), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "chatInputControllerRequestDismissKeyboardSnapshot:", *(_QWORD *)(a1 + 48));

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __118__CKChatInputController_CKChatInputController_CompactPresentation___presentCompactSwitcherOverKeyboardWithCompletion___block_invoke_2;
  block[3] = &unk_1E274CC10;
  v6 = *(void **)(a1 + 56);
  block[4] = *(_QWORD *)(a1 + 48);
  v8 = v6;
  v9 = *(id *)(a1 + 64);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_msgSend(*(id *)(a1 + 48), "setInputViewWillBecomeVisible:", 0);

}

void __118__CKChatInputController_CKChatInputController_CompactPresentation___presentCompactSwitcherOverKeyboardWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int64_t v3;
  dispatch_time_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(id *);
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[5];

  v2 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __118__CKChatInputController_CKChatInputController_CompactPresentation___presentCompactSwitcherOverKeyboardWithCompletion___block_invoke_3;
  v15[3] = &unk_1E274A208;
  v15[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v15);
  if (objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI"))
    v3 = 400000000;
  else
    v3 = 100000000;
  v4 = dispatch_time(0, v3);
  v8 = v2;
  v9 = 3221225472;
  v10 = __118__CKChatInputController_CKChatInputController_CompactPresentation___presentCompactSwitcherOverKeyboardWithCompletion___block_invoke_4;
  v11 = &unk_1E274CC10;
  v5 = *(void **)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = *(id *)(a1 + 48);
  dispatch_after(v4, MEMORY[0x1E0C80D38], &v8);
  objc_msgSend(*(id *)(a1 + 32), "browserSwitcher", v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", 1);

}

void __118__CKChatInputController_CKChatInputController_CompactPresentation___presentCompactSwitcherOverKeyboardWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "switcherInputViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "browserSwitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setViewController:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "switcherInputViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCurrentInputViewController:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setInputViewVisible:", 1);
  objc_msgSend(*(id *)(a1 + 32), "entryView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finishBrowserSwitcherCompactTransition");

}

void __118__CKChatInputController_CKChatInputController_CompactPresentation___presentCompactSwitcherOverKeyboardWithCompletion___block_invoke_4(id *a1)
{
  void *v2;
  id v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;

  objc_msgSend(a1[4], "entryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __118__CKChatInputController_CKChatInputController_CompactPresentation___presentCompactSwitcherOverKeyboardWithCompletion___block_invoke_5;
  block[3] = &unk_1E27509A0;
  v5 = a1[5];
  v3 = a1[6];
  v6 = a1[4];
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __118__CKChatInputController_CKChatInputController_CompactPresentation___presentCompactSwitcherOverKeyboardWithCompletion___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 40), "browserSwitcher");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endAppearanceTransition");

}

void __118__CKChatInputController_CKChatInputController_CompactPresentation___presentCompactSwitcherOverKeyboardWithCompletion___block_invoke_6(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "browserButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "theme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v3);

}

- (void)_dismissCompactSwitcherOverKeyboardWithCompletion:(id)a3
{
  id v4;
  CKPresentationControllerWindow *v5;
  void *v6;
  CKPresentationControllerWindow *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double MaxY;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CKMessageEntryViewSnapshot *v43;
  void *v44;
  CKMessageEntryViewSnapshot *v45;
  double v46;
  double v47;
  CGFloat v48;
  double v49;
  uint64_t v50;
  void *v51;
  void *v52;
  CGFloat v53;
  CKMessageEntryViewSnapshot *v54;
  id v55;
  id v56;
  CKPresentationControllerWindow *v57;
  double v58;
  double v59;
  _QWORD block[5];
  CKPresentationControllerWindow *v61;
  id v62;
  CKMessageEntryViewSnapshot *v63;
  id v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  char v73;
  _QWORD v74[5];
  char v75;
  char v76[9];
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;

  v4 = a3;
  v5 = [CKPresentationControllerWindow alloc];
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v7 = -[CKPresentationControllerWindow initWithFrame:allowsRotation:restrictedToPortraitOrientation:](v5, "initWithFrame:allowsRotation:restrictedToPortraitOrientation:", 0, 0);

  v76[0] = 0;
  +[CKInputView defaultContentSizeLargerThanKeyboard:](CKInputView, "defaultContentSizeLargerThanKeyboard:", v76);
  v59 = v8;
  -[CKPresentationControllerWindow rootViewController](v7, "rootViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatInputController browserSwitcher](self, "browserSwitcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "beginAppearanceTransition:animated:", 0, 1);

  -[CKChatInputController browserSwitcher](self, "browserSwitcher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "snapshotViewAfterScreenUpdates:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  -[CKPresentationControllerWindow convertRect:fromView:](v7, "convertRect:fromView:", v13);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[CKPresentationControllerWindow bounds](v7, "bounds");
  MaxY = CGRectGetMaxY(v77);
  v78.origin.x = v16;
  v78.origin.y = v18;
  v78.size.width = v20;
  v78.size.height = v22;
  v24 = MaxY - CGRectGetHeight(v78);
  objc_msgSend(v10, "addSubview:", v14);
  objc_msgSend(v14, "setFrame:", v16, v24, v20, v22);
  v58 = *MEMORY[0x1E0C9D648];
  if (v76[0])
  {
    -[CKChatInputController entryView](self, "entryView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "frame");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    -[CKChatInputController entryView](self, "entryView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKPresentationControllerWindow convertRect:fromView:](v7, "convertRect:fromView:", v34, v27, v29, v31, v33);
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;

    v43 = [CKMessageEntryViewSnapshot alloc];
    -[CKChatInputController entryView](self, "entryView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = -[CKMessageEntryViewSnapshot initWithFrame:entryView:](v43, "initWithFrame:entryView:", v44, v36, v38, v40, v42);

    objc_msgSend(v10, "addSubview:", v45);
    objc_msgSend(MEMORY[0x1E0CEA6C8], "sizeForInterfaceOrientation:ignoreInputView:", CKNonFlatDeviceOrientation(), 1);
    v47 = v46;
    objc_msgSend(v10, "bounds");
    v48 = CGRectGetHeight(v79) - v47;
    v80.origin.x = v36;
    v80.origin.y = v38;
    v80.size.width = v40;
    v80.size.height = v42;
    v49 = v48 - CGRectGetHeight(v80);
  }
  else
  {
    v45 = 0;
    v49 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v40 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v42 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v38 = v49;
    v36 = *MEMORY[0x1E0C9D648];
  }
  -[CKPresentationControllerWindow setHidden:](v7, "setHidden:", 0);
  v50 = MEMORY[0x1E0C809B0];
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __118__CKChatInputController_CKChatInputController_CompactPresentation___dismissCompactSwitcherOverKeyboardWithCompletion___block_invoke;
  v74[3] = &unk_1E274CA88;
  v74[4] = self;
  v75 = v76[0];
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v74);
  -[CKChatInputController browserSwitcher](self, "browserSwitcher");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addChildViewController:", v51);

  objc_msgSend(v10, "insertSubview:belowSubview:", v13, v14);
  -[CKChatInputController browserSwitcher](self, "browserSwitcher");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "didMoveToParentViewController:", v9);

  -[CKPresentationControllerWindow bounds](v7, "bounds");
  v53 = CGRectGetMaxY(v81) - v59;
  -[CKPresentationControllerWindow bounds](v7, "bounds");
  objc_msgSend(v13, "setFrame:", v58, v53, CGRectGetWidth(v82), v59);
  objc_msgSend(v13, "layoutIfNeeded");
  block[0] = v50;
  block[1] = 3221225472;
  block[2] = __118__CKChatInputController_CKChatInputController_CompactPresentation___dismissCompactSwitcherOverKeyboardWithCompletion___block_invoke_54;
  block[3] = &unk_1E27509C8;
  block[4] = self;
  v61 = v7;
  v63 = v45;
  v64 = v4;
  v73 = v76[0];
  v65 = v36;
  v66 = v38;
  v67 = v40;
  v68 = v42;
  v69 = v36;
  v70 = v49;
  v71 = v40;
  v72 = v42;
  v62 = v14;
  v54 = v45;
  v55 = v14;
  v56 = v4;
  v57 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __118__CKChatInputController_CKChatInputController_CompactPresentation___dismissCompactSwitcherOverKeyboardWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "setInputViewVisible:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setCurrentInputViewController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "switcherInputViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setViewController:", 0);

  objc_msgSend(*(id *)(a1 + 32), "setSwitcherInputViewController:", 0);
  if (*(_BYTE *)(a1 + 40))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Setting entry view alpha to 0", v5, 2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "entryView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 0.0);

  }
}

void __118__CKChatInputController_CKChatInputController_CompactPresentation___dismissCompactSwitcherOverKeyboardWithCompletion___block_invoke_54(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  void *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  void *v20;
  void *v21;
  _QWORD aBlock[5];
  id v23;
  id v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chatInputControllerWillDismissCompactBrowserViewController:", *(_QWORD *)(a1 + 32));

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __118__CKChatInputController_CKChatInputController_CompactPresentation___dismissCompactSwitcherOverKeyboardWithCompletion___block_invoke_2;
  aBlock[3] = &unk_1E274CC10;
  v3 = *(void **)(a1 + 40);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v23 = v3;
  v24 = *(id *)(a1 + 64);
  v4 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 48), "setHidden:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if (objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI"))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "chatInputControllerRequestShowKeyboardSnapshot:", *(_QWORD *)(a1 + 32));

  }
  objc_msgSend(*(id *)(a1 + 32), "browserSwitcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animateOutCompactWithCompletion:", v4);

  if (*(_BYTE *)(a1 + 136))
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setKeyPath:", CFSTR("position.y"));
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3040]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimingFunction:", v8);

    objc_msgSend(v7, "setBeginTime:", CACurrentMediaTime());
    objc_msgSend(v7, "setDuration:", 0.100000001);
    v9 = (void *)MEMORY[0x1E0CB37E8];
    v10 = *(double *)(a1 + 72);
    v11 = *(double *)(a1 + 80);
    v12 = *(double *)(a1 + 88);
    v13 = *(double *)(a1 + 96);
    v25.origin.x = v10;
    v25.origin.y = v11;
    v25.size.width = v12;
    v25.size.height = v13;
    CGRectGetMidX(v25);
    v26.origin.x = v10;
    v26.origin.y = v11;
    v26.size.width = v12;
    v26.size.height = v13;
    objc_msgSend(v9, "numberWithDouble:", CGRectGetMidY(v26));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFromValue:", v14);

    v15 = (void *)MEMORY[0x1E0CB37E8];
    v16 = *(double *)(a1 + 104);
    v17 = *(double *)(a1 + 112);
    v18 = *(double *)(a1 + 120);
    v19 = *(double *)(a1 + 128);
    v27.origin.x = v16;
    v27.origin.y = v17;
    v27.size.width = v18;
    v27.size.height = v19;
    CGRectGetMidX(v27);
    v28.origin.x = v16;
    v28.origin.y = v17;
    v28.size.width = v18;
    v28.size.height = v19;
    objc_msgSend(v15, "numberWithDouble:", CGRectGetMidY(v28));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setToValue:", v20);

    objc_msgSend(v7, "setFillMode:", *MEMORY[0x1E0CD2B58]);
    objc_msgSend(v7, "setRemovedOnCompletion:", 0);
    objc_msgSend(*(id *)(a1 + 56), "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addAnimation:forKey:", v7, CFSTR("EntryViewSlideout"));

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

void __118__CKChatInputController_CKChatInputController_CompactPresentation___dismissCompactSwitcherOverKeyboardWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD block[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "entryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  if (objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI"))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "chatInputControllerRequestDismissKeyboardSnapshot:", *(_QWORD *)(a1 + 32));

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __118__CKChatInputController_CKChatInputController_CompactPresentation___dismissCompactSwitcherOverKeyboardWithCompletion___block_invoke_3;
  block[3] = &unk_1E274CC10;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __118__CKChatInputController_CKChatInputController_CompactPresentation___dismissCompactSwitcherOverKeyboardWithCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "browserSwitcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endAppearanceTransition");

  objc_msgSend(*(id *)(a1 + 32), "setBrowserSwitcher:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setHidden:", 1);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chatInputControllerDidDismissCompactBrowserViewController:", *(_QWORD *)(a1 + 32));

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)_entryViewSnapshotWithFrame:(CGRect)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_msgSend(v4, "setBackgroundColor:", 0);
  objc_msgSend(v4, "setClipsToBounds:", 1);
  v5 = objc_alloc(MEMORY[0x1E0CEAC68]);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "theme");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entryViewBackdropSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithSettings:", v8);

  objc_msgSend(v9, "setAutoresizingMask:", 18);
  objc_msgSend(v4, "bounds");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "addSubview:", v9);
  -[CKChatInputController entryView](self, "entryView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "snapshotForCompactBrowserAnimation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setAutoresizingMask:", 18);
  objc_msgSend(v4, "bounds");
  objc_msgSend(v11, "setFrame:");
  objc_msgSend(v4, "addSubview:", v11);

  return v4;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  CKChatInputController *v5;
  CKChatInputController *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.MobileSMS.CKAppExtension.launch"), 0);
  -[CKChatInputController textInputPayloadController](self, "textInputPayloadController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "payloadDelegate");
  v5 = (CKChatInputController *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    objc_msgSend(v4, "setPayloadDelegate:", 0);
    objc_msgSend(v4, "setSupportedPayloadIds:", MEMORY[0x1E0C9AA60]);
  }
  objc_msgSend(__DDActionClass(), "clientActionsDelegate");
  v6 = (CKChatInputController *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
    objc_msgSend(__DDActionClass(), "setClientActionsDelegate:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  -[CKBrowserSwitcherViewController transitionCoordinator](self->_browserSwitcher, "transitionCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dismissCurrentFullScreenModalAnimated:completion:", 0, 0);

  -[CKBrowserSwitcherViewController transitionCoordinator](self->_browserSwitcher, "transitionCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dismissCurrentExpandedBrowserAnimated:completion:", 0, 0);

  -[CKScheduledUpdater invalidate](self->_orientationUpdater, "invalidate");
  -[CKDeviceOrientationManager setDelegate:](self->_orientationManager, "setDelegate:", 0);
  -[CKDeviceOrientationManager invalidate](self->_orientationManager, "invalidate");
  -[CKHandwritingPresentationController setSendDelegate:](self->_handwritingPresentationController, "setSendDelegate:", 0);

  v10.receiver = self;
  v10.super_class = (Class)CKChatInputController;
  -[CKChatInputController dealloc](&v10, sel_dealloc);
}

- (CKChatInputController)init
{
  CKChatInputController *v2;
  CKChatInputController *v3;
  void *v4;
  uint64_t v5;
  IMScheduledUpdater *dismissEntryViewShelfUpdater;
  CKScheduledUpdater *v7;
  CKScheduledUpdater *orientationUpdater;
  CKDeviceOrientationManager *v9;
  CKDeviceOrientationManager *orientationManager;
  CKChatEagerUploadController *v11;
  CKChatEagerUploadController *eagerUploadController;
  _QWORD block[4];
  CKChatInputController *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CKChatInputController;
  v2 = -[CKChatInputController init](&v16, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_isAppCardDraggingBelowKeyboardDetent = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_applicationWillAddDeactivationReasonNotification_, *MEMORY[0x1E0CEBF18], 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_composeRecipientViewDidBecomeFirstResponder_, CFSTR("com.apple.ChatKit.CKComposeRecipientView.BecameFirstResponder"), 0);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_extensionRemoteConnectionWasInterrupted_, *MEMORY[0x1E0D37E88], 0);
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D36AC8]), "initWithTarget:action:", 0, 0);
    dismissEntryViewShelfUpdater = v3->_dismissEntryViewShelfUpdater;
    v3->_dismissEntryViewShelfUpdater = (IMScheduledUpdater *)v5;

    v7 = -[CKScheduledUpdater initWithTarget:action:]([CKScheduledUpdater alloc], "initWithTarget:action:", v3, sel__handleOrientation);
    orientationUpdater = v3->_orientationUpdater;
    v3->_orientationUpdater = v7;

    v9 = objc_alloc_init(CKDeviceOrientationManager);
    orientationManager = v3->_orientationManager;
    v3->_orientationManager = v9;

    -[CKDeviceOrientationManager setDelegate:](v3->_orientationManager, "setDelegate:", v3);
    -[CKDeviceOrientationManager beginListeningForOrientationEventsWithKey:](v3->_orientationManager, "beginListeningForOrientationEventsWithKey:", CFSTR("KeyboardVisible"));
    v11 = objc_alloc_init(CKChatEagerUploadController);
    eagerUploadController = v3->_eagerUploadController;
    v3->_eagerUploadController = v11;

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __29__CKChatInputController_init__block_invoke;
    block[3] = &unk_1E274A208;
    v15 = v3;
    if (init_launchAppExtensionIfNecessaryToken != -1)
      dispatch_once(&init_launchAppExtensionIfNecessaryToken, block);

  }
  return v3;
}

uint64_t __29__CKChatInputController_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupObserverForLaunchAppExtensionForDebugging");
}

- (void)setEntryView:(id)a3
{
  CKMessageEntryView *v4;
  CKMessageEntryView *entryView;
  CKMessageEntryView *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (CKMessageEntryView *)a3;
  -[CKMessageEntryView setInputDelegate:](self->_entryView, "setInputDelegate:", 0);
  entryView = self->_entryView;
  self->_entryView = v4;
  v6 = v4;

  -[CKMessageEntryView setInputDelegate:](self->_entryView, "setInputDelegate:", self);
  if (v6)
  {
    -[CKChatInputController deferredComposition](self, "deferredComposition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CKChatInputController entryView](self, "entryView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKChatInputController deferredComposition](self, "deferredComposition");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setComposition:", v9);

      -[CKChatInputController setDeferredComposition:](self, "setDeferredComposition:", 0);
    }
  }
}

- (id)inputViewController
{
  void *v3;

  if (-[CKChatInputController isInputViewVisible](self, "isInputViewVisible"))
  {
    -[CKChatInputController currentInputViewController](self, "currentInputViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)clearBrowserViewControllerIfNecessary
{
  if (-[CKChatInputController keyboardIsHiding](self, "keyboardIsHiding")
    && !-[CKChatInputController appModalIsDisplayed](self, "appModalIsDisplayed")
    && !-[CKChatInputController inCollapseOrExpandAnimation](self, "inCollapseOrExpandAnimation"))
  {
    -[CKChatInputController setInputViewVisible:](self, "setInputViewVisible:", 0);
  }
}

- (void)_loadPhotosBrowser
{
  -[CKChatInputController _loadPhotosBrowserCollapsingEntryField:](self, "_loadPhotosBrowserCollapsingEntryField:", 1);
}

- (BOOL)_isRunningInMVS
{
  return CKIsRunningInMessagesViewService() != 0;
}

- (void)_loadPhotosBrowserCollapsingEntryField:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  CKKeyboardContentViewController *v10;
  CKKeyboardContentViewController *v11;
  void *v12;
  id v13;
  uint8_t buf[16];

  v3 = a3;
  if (self->_switcherInputViewController)
  {
    -[CKChatInputController browserSwitcher](self, "browserSwitcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unloadRemoteViewControllers");

    -[CKChatInputController setBrowserSwitcher:](self, "setBrowserSwitcher:", 0);
    -[CKChatInputController setSwitcherInputViewController:](self, "setSwitcherInputViewController:", 0);
    -[CKChatInputController setCurrentInputViewController:](self, "setCurrentInputViewController:", 0);
  }
  if (-[CKChatInputController _isRunningInMVS](self, "_isRunningInMVS"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Asked to show AE in MVS, bailing!", buf, 2u);
      }

    }
  }
  else
  {
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "existingPhotoBrowserViewController");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "photosBrowserViewControllerWithPluginPayloads:", 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v13, "setSendDelegate:", self);
    objc_msgSend(v13, "balloonPlugin");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatInputController setBrowserPlugin:](self, "setBrowserPlugin:", v9);

    v10 = [CKKeyboardContentViewController alloc];
    v11 = -[CKKeyboardContentViewController initWithViewController:identifier:](v10, "initWithViewController:identifier:", v13, *MEMORY[0x1E0D375E0]);
    -[CKKeyboardContentViewController view](v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDragTargetView:", v12);

    -[CKChatInputController setCurrentInputViewController:](self, "setCurrentInputViewController:", v11);
    -[CKChatInputController setInputViewVisible:entryFieldCollapsed:animated:](self, "setInputViewVisible:entryFieldCollapsed:animated:", 1, v3, 1);

  }
}

- (void)showPhotosExtension
{
  id v3;

  IMBalloonExtensionIDWithSuffix();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CKChatInputController showPluginWithExtensionIdentifier:](self, "showPluginWithExtensionIdentifier:", v3);

}

- (void)showPhotosBrowser
{
  void *v3;
  uint64_t v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAccessibilityPreferredContentSizeCategory") ^ 1;

  -[CKChatInputController showPhotosBrowserCollapsingEntryField:](self, "showPhotosBrowserCollapsingEntryField:", v4);
}

- (void)showPhotosBrowserCollapsingEntryField:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char isKindOfClass;
  void *v7;
  char v8;
  id v9;

  v3 = a3;
  if (-[CKChatInputController isInputViewVisible](self, "isInputViewVisible"))
  {
    -[CKChatInputController currentInputViewController](self, "currentInputViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[CKChatInputController currentInputViewController](self, "currentInputViewController");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D375E0]);

      if ((v8 & 1) != 0)
      {
        -[CKChatInputController setBrowserPlugin:](self, "setBrowserPlugin:", 0);
        -[CKChatInputController setBrowserPluginDataSource:](self, "setBrowserPluginDataSource:", 0);
        -[CKChatInputController dismissBrowserViewController](self, "dismissBrowserViewController");

        return;
      }

    }
  }
  -[CKChatInputController _loadPhotosBrowserCollapsingEntryField:](self, "_loadPhotosBrowserCollapsingEntryField:", v3);
}

- (void)showFunCamera
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD aBlock[4];
  id v10;
  id v11;
  id location;

  if (+[CKFunCameraUserConsentManager shouldPromptUserForFunCameraConsent](CKFunCameraUserConsentManager, "shouldPromptUserForFunCameraConsent"))
  {
    -[CKChatInputController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "activeSendMenuPresentationForChatInputController:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    location = 0;
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __38__CKChatInputController_showFunCamera__block_invoke;
    aBlock[3] = &unk_1E274D5D0;
    objc_copyWeak(&v11, &location);
    v5 = v4;
    v10 = v5;
    v6 = _Block_copy(aBlock);
    objc_msgSend(v5, "sendMenuViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKFunCameraUserConsentManager presentFromViewController:presentedBlock:confirmBlock:cancelBlock:](CKFunCameraUserConsentManager, "presentFromViewController:presentedBlock:confirmBlock:cancelBlock:", v7, &__block_literal_global_191, v6, 0);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
  else
  {
    -[CKChatInputController entryView](self, "entryView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[CKChatInputController showFunCamera:](self, "showFunCamera:", v8);

  }
}

void __38__CKChatInputController_showFunCamera__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "entryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "showFunCamera:", v2);

  objc_msgSend(*(id *)(a1 + 32), "sendMenuViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performFullScreenDismissAnimationWithCompletion:", 0);

}

- (void)showFunCamera:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[8];

  v4 = a3;
  if (-[CKChatInputController _isiMessageConversation](self, "_isiMessageConversation"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Camera button is hit and perfrom MMCS prewarm", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preWarmConnection");

  }
  -[CKChatInputController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeSendMenuPresentationForChatInputController:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && objc_msgSend(v8, "presentationStyle") == 1)
  {
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __39__CKChatInputController_showFunCamera___block_invoke;
    v13[3] = &unk_1E274DCB8;
    objc_copyWeak(&v14, (id *)buf);
    objc_msgSend(v8, "dismissAnimated:completion:", 1, v13);
    v9 = &v14;
  }
  else
  {
    if (!-[CKChatInputController isAppCardPresented](self, "isAppCardPresented"))
    {
      -[CKChatInputController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "chatInputControllerDidSelectFunCamera:", self);

      goto LABEL_14;
    }
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __39__CKChatInputController_showFunCamera___block_invoke_2;
    v11[3] = &unk_1E274B548;
    objc_copyWeak(&v12, (id *)buf);
    -[CKChatInputController dismissAppCardIfNecessaryAnimated:completion:](self, "dismissAppCardIfNecessaryAnimated:completion:", 1, v11);
    v9 = &v12;
  }
  objc_destroyWeak(v9);
  objc_destroyWeak((id *)buf);
LABEL_14:

}

void __39__CKChatInputController_showFunCamera___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "chatInputControllerDidSelectFunCamera:", WeakRetained);

  }
}

void __39__CKChatInputController_showFunCamera___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "chatInputControllerDidSelectFunCamera:", WeakRetained);

}

- (void)showDTCompose
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "balloonPluginForBundleID:", *MEMORY[0x1E0D37588]);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[CKChatInputController showBrowserForPlugin:dataSource:style:](self, "showBrowserForPlugin:dataSource:style:", v4, 0, 0);
}

- (void)showSendLater
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  CKTranscriptPluginPresentationConfiguration *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "balloonPluginForBundleID:", *MEMORY[0x1E0D37608]);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (IMSharedHelperDeviceIsiPad())
  {
    -[CKChatInputController entryView](self, "entryView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendLaterView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[CKChatInputController entryView](self, "entryView");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v8;

    v9 = -[CKTranscriptPluginPresentationConfiguration initWithSourceView:permittedArrowDirections:shouldDisableSnapshotView:]([CKTranscriptPluginPresentationConfiguration alloc], "initWithSourceView:permittedArrowDirections:shouldDisableSnapshotView:", v10, 2, 0);
  }
  else
  {
    v9 = 0;
  }
  -[CKChatInputController showBrowserForPlugin:dataSource:style:presentationConfiguration:](self, "showBrowserForPlugin:dataSource:style:presentationConfiguration:", v11, 0, 0, v9);

}

- (void)_sendLaterSelectedFromSendMenuWithPresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  char v20;
  _QWORD v21[5];
  char v22;
  _QWORD v23[5];
  uint8_t buf[4];
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "balloonPluginForBundleID:", *MEMORY[0x1E0D37608]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKChatInputController entryView](self, "entryView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "composition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasContent");

  -[CKChatInputController browserPlugin](self, "browserPlugin");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  v14 = objc_msgSend(v4, "presentationStyle");
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109632;
      v25 = v9;
      v26 = 1024;
      v27 = v13;
      v28 = 1024;
      v29 = v14 == 1;
      _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "_sendLaterSelectedFromSendMenu preferDatePicker: %{BOOL}d, datePickerIsPresented: %{BOOL}d, sendMenuInPopover: %{BOOL}d", buf, 0x14u);
    }

  }
  if ((v9 & 1) != 0)
  {
    if ((v13 & 1) == 0)
    {
      if (v14 == 1)
      {
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __72__CKChatInputController__sendLaterSelectedFromSendMenuWithPresentation___block_invoke;
        v23[3] = &unk_1E274A1B8;
        v23[4] = self;
        objc_msgSend(v4, "dismissAnimated:completion:", 1, v23);
      }
      else
      {
        -[CKChatInputController showSendLater](self, "showSendLater");
      }
      goto LABEL_27;
    }
    goto LABEL_14;
  }
  -[CKChatInputController pluginContextForPlugin:](self, "pluginContextForPlugin:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CKChatInputController entryView](self, "entryView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setSendLaterPluginInfo:animated:", v16, 1);

    }
  }

  if (v13)
  {
LABEL_14:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "_sendLaterSelectedFromSendMenuWithPresentation: Date Picker already presented. Not changing input mode.", buf, 2u);
      }

    }
    v19 = 0;
    goto LABEL_20;
  }
  v19 = 1;
LABEL_20:
  if (v14 == 1)
    v20 = v9;
  else
    v20 = 1;
  if ((v20 & 1) != 0)
  {
    if (v19)
      -[CKChatInputController showKeyboard](self, "showKeyboard");
  }
  else
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __72__CKChatInputController__sendLaterSelectedFromSendMenuWithPresentation___block_invoke_2;
    v21[3] = &unk_1E2756068;
    v22 = v19;
    v21[4] = self;
    objc_msgSend(v4, "dismissAnimated:completion:", 1, v21);
  }
LABEL_27:

}

uint64_t __72__CKChatInputController__sendLaterSelectedFromSendMenuWithPresentation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showSendLater");
}

uint64_t __72__CKChatInputController__sendLaterSelectedFromSendMenuWithPresentation___block_invoke_2(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "showKeyboard");
  return result;
}

- (void)sendLaterPluginInfoUpdated
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  -[CKChatInputController entryView](self, "entryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendLaterPluginInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (IMSharedHelperDeviceIsiPad()
      && (-[CKChatInputController browserPlugin](self, "browserPlugin"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "identifier"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D37608]),
          v6,
          v5,
          v7))
    {
      -[CKChatInputController dismissBrowserViewController](self, "dismissBrowserViewController");
    }
    else
    {
      -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "browserViewController");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend(v14, "browserViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "balloonPlugin");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D37608]);

        if (v13)
          -[CKChatInputController showKeyboard](self, "showKeyboard");
      }

    }
  }
}

- (void)_showFullScreenBrowser:(id)a3
{
  id v4;
  void *v5;
  CKFullscreenBrowserNavigationController *v6;
  CKExpandedAppViewController *v7;
  void *v8;
  void *v9;
  CKExpandedAppViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "balloonPlugin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatInputController setBrowserPlugin:](self, "setBrowserPlugin:", v5);

  objc_msgSend(v4, "setSendDelegate:", self);
  v6 = -[CKFullscreenBrowserNavigationController initWithNavigationBarClass:toolbarClass:]([CKFullscreenBrowserNavigationController alloc], "initWithNavigationBarClass:toolbarClass:", objc_opt_class(), 0);
  v7 = [CKExpandedAppViewController alloc];
  -[CKChatInputController targetConversation](self, "targetConversation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "balloonPlugin");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[CKExpandedAppViewController initWithConversation:plugin:](v7, "initWithConversation:plugin:", v8, v9);

  -[CKExpandedAppViewController setContentViewController:](v10, "setContentViewController:", v4);
  -[CKExpandedAppViewController setDelegate:](v10, "setDelegate:", self);
  v16[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKFullscreenBrowserNavigationController setViewControllers:](v6, "setViewControllers:", v11);

  -[CKChatInputController setStatusBarStyleViewController:](self, "setStatusBarStyleViewController:", v4);
  v14[4] = self;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__CKChatInputController__showFullScreenBrowser___block_invoke;
  v15[3] = &unk_1E274A208;
  v15[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __48__CKChatInputController__showFullScreenBrowser___block_invoke_99;
  v14[3] = &unk_1E274A1B8;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v15, v14, 0.5);
  -[CKChatInputController setPresentedBrowserNavigationController:](self, "setPresentedBrowserNavigationController:", v6);
  -[CKChatInputController delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "viewControllerForChatInputModalPresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentViewController:animated:completion:", v6, 1, 0);

}

void __48__CKChatInputController__showFullScreenBrowser___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Setting entry view alpha to 0", v4, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "entryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

}

void __48__CKChatInputController__showFullScreenBrowser___block_invoke_99(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "entryView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 1);

}

- (void)appSelectionInterfaceSelectedItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  CKTranscriptPluginPresentationConfiguration *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__ck_identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "balloonPluginForBundleID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "__ck_identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("kAppMenuAudio"));

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isScheduledMessagesEnabled");

  if (!v11)
  {
    v13 = 0;
    if (!v7)
      goto LABEL_3;
LABEL_6:
    -[CKChatInputController entryView](self, "entryView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sendMenuSourceView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[CKTranscriptPluginPresentationConfiguration initWithSourceView:permittedArrowDirections:shouldDisableSnapshotView:]([CKTranscriptPluginPresentationConfiguration alloc], "initWithSourceView:permittedArrowDirections:shouldDisableSnapshotView:", v18, 8, 0);
    -[CKChatInputController showBrowserForPlugin:dataSource:style:presentationConfiguration:](self, "showBrowserForPlugin:dataSource:style:presentationConfiguration:", v7, 0, 1, v19);

    goto LABEL_10;
  }
  objc_msgSend(v4, "__ck_identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D37608]);

  if (v7)
    goto LABEL_6;
LABEL_3:
  objc_msgSend(v4, "__ck_identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("kAppMenuPhotosItemIdentifier"));

  if (v15)
  {
    -[CKChatInputController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "chatInputDidSelectPhotoPicker");
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v4, "__ck_identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("kAppMenuEffectsItemIdentifier"));

  if (v21)
  {
    -[CKChatInputController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "chatInputDidSelectEffectPicker");
    goto LABEL_9;
  }
  objc_msgSend(v4, "__ck_identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "isEqualToString:", CFSTR("kAppMenuEmoji")) & 1) != 0)
  {
    -[CKChatInputController delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_opt_respondsToSelector();

    if ((v24 & 1) != 0)
    {
      -[CKChatInputController delegate](self, "delegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "chatInputDidSelectEmojiPicker");
      goto LABEL_9;
    }
  }
  else
  {

  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isAudioMessagesEntryViewRecordingEnabled");

    if (v26)
    {
      -[CKChatInputController entryView](self, "entryView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "startRecordingForAudioButtonInEntryView");
      goto LABEL_9;
    }
  }
  if (v13)
  {
    -[CKChatInputController entryView](self, "entryView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "composition");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "shelfPluginPayload");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29 && (objc_msgSend(v29, "supportsSendLater") & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v29, "pluginBundleID");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 138412290;
          v38 = v35;
          _os_log_impl(&dword_18DFCD000, v34, OS_LOG_TYPE_INFO, "User selected send later, but the currently staged plugin payload (%@) does not allow presentation alongside Send Later. Presenting unsupported item alert and aborting.", (uint8_t *)&v37, 0xCu);

        }
      }
      objc_msgSend(v29, "pluginBundleID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKChatInputController _presentSendLaterUnsupportedAlertForIdentifier:handler:](self, "_presentSendLaterUnsupportedAlertForIdentifier:handler:", v36, 0);

    }
    else
    {
      -[CKChatInputController sendLaterPluginInfo](self, "sendLaterPluginInfo");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKChatInputController entryView](self, "entryView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setSendLaterPluginInfo:animated:", v30, 1);

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "__ck_identifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138412290;
      v38 = v33;
      _os_log_impl(&dword_18DFCD000, v32, OS_LOG_TYPE_INFO, "unknown CKAppMenuItem:  %@", (uint8_t *)&v37, 0xCu);

    }
  }
LABEL_10:

}

- (void)showHandwritingBrowser
{
  -[CKChatInputController showHandwritingBrowserWithExistingPayload:](self, "showHandwritingBrowserWithExistingPayload:", 0);
}

- (void)swipeDismissBrowser
{
  void *v3;
  uint64_t v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAccessibilityPreferredContentSizeCategory") ^ 1;

  -[CKChatInputController setInputViewVisible:entryFieldCollapsed:animated:messageDelegate:](self, "setInputViewVisible:entryFieldCollapsed:animated:messageDelegate:", 0, v4, 0, 0);
}

- (void)dismissAppCardIfNecessary
{
  -[CKChatInputController dismissAppCardIfNecessaryAnimated:isFocusingKeyboard:completion:](self, "dismissAppCardIfNecessaryAnimated:isFocusingKeyboard:completion:", 1, 0, 0);
}

- (void)dismissAppCardIfNecessaryAnimated:(BOOL)a3 completion:(id)a4
{
  -[CKChatInputController dismissAppCardIfNecessaryAnimated:isFocusingKeyboard:completion:](self, "dismissAppCardIfNecessaryAnimated:isFocusingKeyboard:completion:", a3, 0, a4);
}

- (void)dismissAppCardIfNecessaryAnimated:(BOOL)a3 isFocusingKeyboard:(BOOL)a4 completion:(id)a5
{
  -[CKChatInputController dismissAppCardIfNecessaryAnimated:isFocusingKeyboard:overrideExceptions:completion:](self, "dismissAppCardIfNecessaryAnimated:isFocusingKeyboard:overrideExceptions:completion:", a3, a4, 0, a5);
}

- (void)dismissAppCardIfNecessaryAnimated:(BOOL)a3 isFocusingKeyboard:(BOOL)a4 overrideExceptions:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  uint64_t v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void (**v15)(_QWORD);
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  char v20;
  NSObject *v21;
  void *v22;
  void (**v23)(_QWORD);
  uint8_t v24[8];
  _QWORD v25[4];
  id v26;
  id v27;
  char v28;
  _QWORD aBlock[5];
  char v30;

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v10 = a6;
  if (CKIsAppCardsEnabled())
  {
    -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isPresentingCard");

    if (v12)
    {
      if (-[CKChatInputController isDismissingAppCardForKeyboardPresentation](self, "isDismissingAppCardForKeyboardPresentation")|| (_DWORD)v7)
      {
        -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v13, "shouldAnimateDismissal") ^ 1;

      }
      -[CKChatInputController setIsDismissingAppCardForKeyboardPresentation:](self, "setIsDismissingAppCardForKeyboardPresentation:", v7);
      v14 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __108__CKChatInputController_dismissAppCardIfNecessaryAnimated_isFocusingKeyboard_overrideExceptions_completion___block_invoke;
      aBlock[3] = &unk_1E274CA88;
      v30 = v7;
      aBlock[4] = self;
      v15 = (void (**)(_QWORD))_Block_copy(aBlock);
      -[CKChatInputController activeSendMenuPresentationForAppCardOverseer](self, "activeSendMenuPresentationForAppCardOverseer");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16
        && (v17 = (void *)v16,
            -[CKChatInputController activeSendMenuPresentationForAppCardOverseer](self, "activeSendMenuPresentationForAppCardOverseer"), v18 = (void *)objc_claimAutoreleasedReturnValue(), v19 = objc_msgSend(v18, "presentationStyle"), v18, v17, v19 == 1))
      {
        v20 = 1;
      }
      else
      {
        v15[2](v15);
        v20 = 0;
      }
      -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v14;
      v25[1] = 3221225472;
      v25[2] = __108__CKChatInputController_dismissAppCardIfNecessaryAnimated_isFocusingKeyboard_overrideExceptions_completion___block_invoke_2;
      v25[3] = &unk_1E274EB98;
      v28 = v20;
      v26 = v15;
      v27 = v10;
      v23 = v15;
      objc_msgSend(v22, "dismissCardAnimated:overrideExceptions:completion:", v8, v6, v25);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v24 = 0;
      }

    }
  }

}

uint64_t __108__CKChatInputController_dismissAppCardIfNecessaryAnimated_isFocusingKeyboard_overrideExceptions_completion___block_invoke(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "showKeyboard");
  return result;
}

uint64_t __108__CKChatInputController_dismissAppCardIfNecessaryAnimated_isFocusingKeyboard_overrideExceptions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 48))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setAppCardDismissPadding:(double)a3
{
  id v5;

  self->_appCardDismissPadding = a3;
  if (CKIsAppCardsEnabled())
  {
    -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAppCardDismissPadding:", a3);

  }
}

- (BOOL)isAppCardPresented
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = CKIsAppCardsEnabled();
  if (v3)
  {
    -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isPresentingCard");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)presentedAppBypassesSendMenu
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = CKIsAppCardsEnabled();
  if (v3)
  {
    -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "presentedAppBypassesSendMenu");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (id)_adamIDFromPluginPayloadData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v3, &v12);
  v5 = v12;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "_enableStrictSecureDecodingMode");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "strict-decoding 019 _enableStrictSecureDecodingMode called", buf, 2u);
      }

    }
  }
  IMExtensionPayloadUnarchivingClasses();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, *MEMORY[0x1E0CB2CD0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0D37E08]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v5;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Failed to unarchive the pluginPayload data. Error: %@", buf, 0xCu);
      }

    }
    v9 = 0;
  }

  return v9;
}

- (void)presentViewControllerWithPluginChatItem:(id)a3 presentationStyle:(unint64_t)a4
{
  -[CKChatInputController presentViewControllerWithPluginChatItem:presentationStyle:presentationConfiguration:](self, "presentViewControllerWithPluginChatItem:presentationStyle:presentationConfiguration:", a3, a4, 0);
}

- (void)presentViewControllerWithPluginChatItem:(id)a3 presentationStyle:(unint64_t)a4 presentationConfiguration:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a5;
  objc_msgSend(a3, "IMChatItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "balloonPluginForBundleID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKChatInputController browserPluginDataSource](self, "browserPluginDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 == v9)
  {
    -[CKChatInputController browserPlugin](self, "browserPlugin");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4 != 2 && v19 == v12)
      goto LABEL_7;
  }
  else
  {

  }
  objc_msgSend(v12, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D375D0]))
  {
    objc_msgSend(v9, "pluginPayload");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "data");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKChatInputController _adamIDFromPluginPayloadData:](self, "_adamIDFromPluginPayloadData:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatInputController setDeferredPluginDataSource:](self, "setDeferredPluginDataSource:", v9);
    -[CKChatInputController presentAppStoreForAdamID:](self, "presentAppStoreForAdamID:", v17);
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trackEvent:", *MEMORY[0x1E0D38490]);

  }
  else
  {
    -[CKChatInputController launchAndShowBrowserForPlugin:dataSource:style:presentationConfiguration:](self, "launchAndShowBrowserForPlugin:dataSource:style:presentationConfiguration:", v12, v9, a4, v20);
  }

LABEL_7:
}

- (void)presentAppStoreForAdamID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  v4 = a3;
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D37568];
  objc_msgSend(v5, "viewControllerForPluginIdentifier:dataSource:", *MEMORY[0x1E0D37568], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "setAdamID:", v4);
    objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "balloonPluginForBundleID:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKChatInputController showBrowserForPlugin:dataSource:style:](self, "showBrowserForPlugin:dataSource:style:", v9, 0, 1);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Not launching the app store, got nil back for the VC", v11, 2u);
    }

  }
}

- (void)presentAppStoreForURL:(id)a3
{
  -[CKChatInputController presentAppStoreForURL:fromSourceApplication:](self, "presentAppStoreForURL:fromSourceApplication:", a3, 0);
}

- (void)presentAppStoreForURL:(id)a3 fromSourceApplication:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];

  v6 = a3;
  v7 = a4;
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D37568];
  objc_msgSend(v8, "viewControllerForPluginIdentifier:dataSource:", *MEMORY[0x1E0D37568], 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "setSendDelegate:", self);
    if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "setStoreLaunchURL:sourceApplication:", v6, v7);
    objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "balloonPluginForBundleID:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKChatInputController showBrowserForPlugin:dataSource:style:](self, "showBrowserForPlugin:dataSource:style:", v12, 0, 1);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Not launching the app store, got nil back for the VC", v14, 2u);
    }

  }
}

- (void)presentAppManager
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerForPluginIdentifier:dataSource:", CFSTR("com.apple.messages.browser.MorePlugin"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setDelegate:", self);
  if (v4)
  {
    objc_msgSend(v4, "balloonPlugin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatInputController setBrowserPlugin:](self, "setBrowserPlugin:", v5);

    objc_msgSend(v4, "setSendDelegate:", self);
    objc_msgSend(v4, "setModalPresentationStyle:", 2);
    -[CKChatInputController delegate](self, "delegate");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject viewControllerForChatInputModalPresentation](v6, "viewControllerForChatInputModalPresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentViewController:animated:completion:", v4, 1, 0);

  }
  else
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_6;
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Not launching the app manager, got nil back for the VC", v8, 2u);
    }
  }

LABEL_6:
}

- (void)notifyBrowserViewControllerOfMatchingNewMessages:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          objc_msgSend(v10, "dataSource");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "bundleID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          -[CKChatInputController pluginBundleID](self, "pluginBundleID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqualToString:", v13);

          if (v14)
          {
            -[CKChatInputController browserSwitcher](self, "browserSwitcher");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "currentViewController");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(v10, "dataSource");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "messageAddedWithDataSource:", v17);

            }
          }

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

}

- (void)requestPhotoBrowserToAppendFinalImagesToComposition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "existingPhotoBrowserViewController");
  v20 = (id)objc_claimAutoreleasedReturnValue();

  -[CKChatInputController entryView](self, "entryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "composition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "shelfPluginPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pluginBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8 && objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D375E0]))
  {
    v9 = v20;
    -[CKChatInputController dismissEntryViewShelfUpdater](self, "dismissEntryViewShelfUpdater");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "beginHoldingUpdatesForKey:", _kHoldShelfUpdateForSend);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "fetchPluginPayloadsAndClear:", 1);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    -[CKChatInputController dismissEntryViewShelfUpdater](self, "dismissEntryViewShelfUpdater");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "endHoldingUpdatesForKey:", _kHoldShelfUpdateForSend);

    objc_msgSend(v6, "setAttachments:", v11);
LABEL_16:

    goto LABEL_17;
  }
  IMBalloonExtensionIDWithSuffix();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "isEqualToString:", v12);

  if (v13)
  {
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "viewControllerForPluginIdentifier:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setSendDelegate:", self);
    v11 = v6;
    objc_msgSend(v11, "photoShelfViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[CKChatInputController dismissEntryViewShelfUpdater](self, "dismissEntryViewShelfUpdater");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "beginHoldingUpdatesForKey:", _kHoldShelfUpdateForSend);

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v9, "fetchPluginPayloadsAndClear:", 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
      -[CKChatInputController dismissEntryViewShelfUpdater](self, "dismissEntryViewShelfUpdater");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "endHoldingUpdatesForKey:", _kHoldShelfUpdateForSend);

      objc_msgSend(v11, "setAttachments:", v17);
    }
    goto LABEL_16;
  }
LABEL_17:

}

- (void)requestPhotoBrowserToPrepareForDraft
{
  -[CKChatInputController requestPhotoBrowserToPrepareForDraftClearingPhotoShelfViewController:](self, "requestPhotoBrowserToPrepareForDraftClearingPhotoShelfViewController:", 1);
}

- (void)requestPhotoBrowserToPrepareForDraftClearingPhotoShelfViewController:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v3 = a3;
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "existingPhotoBrowserViewController");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  -[CKChatInputController entryView](self, "entryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "composition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "shelfPluginPayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9
    || (objc_msgSend(v8, "pluginBundleID"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D375E0]),
        v10,
        !v11))
  {
    objc_msgSend(v8, "pluginBundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    IMBalloonExtensionIDWithSuffix();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToString:", v14);

    if (!v15)
      goto LABEL_15;
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pluginBundleID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "viewControllerForPluginIdentifier:", v17);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setSendDelegate:", self);
  }
  else
  {
    v12 = v21;
  }
  -[CKChatInputController dismissEntryViewShelfUpdater](self, "dismissEntryViewShelfUpdater");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "beginHoldingUpdatesForKey:", _kHoldShelfUpdateForDraft);

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "fetchPluginPayloadsAndClear:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  -[CKChatInputController dismissEntryViewShelfUpdater](self, "dismissEntryViewShelfUpdater");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "endHoldingUpdatesForKey:", _kHoldShelfUpdateForDraft);

  objc_msgSend(v8, "setAttachments:", v19);
  if (v3)
    objc_msgSend(v8, "setPhotoShelfViewController:", 0);

LABEL_15:
}

- (void)requestPhotoBrowserInitFromDraft:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  uint8_t v24[16];

  v4 = a3;
  objc_msgSend(v4, "shelfPluginPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pluginBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D375E0]);

  if (v7)
  {
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "photosBrowserViewControllerWithPluginPayloads:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setSendDelegate:", self);
    objc_msgSend(v10, "balloonPlugin");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatInputController setBrowserPlugin:](self, "setBrowserPlugin:", v11);

    objc_msgSend(v5, "setAttachments:", 0);
  }
  else
  {
    objc_msgSend(v5, "pluginBundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    IMBalloonExtensionIDWithSuffix();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if (v14)
    {
      +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "invalidatePhotosViewController");

      +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "pluginBundleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "viewControllerForPluginIdentifier:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = v5;
        -[NSObject attachments](v19, "attachments");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");

        if (v21)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v24 = 0;
              _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Setting photo draft", v24, 2u);
            }

          }
          objc_msgSend(v18, "setSendDelegate:", self);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v18, "restoreDraftStateFromPayload:", v19);
          objc_msgSend(v18, "balloonPlugin");
          v23 = objc_claimAutoreleasedReturnValue();
          -[CKChatInputController setBrowserPlugin:](self, "setBrowserPlugin:", v23);
        }
        else
        {
          IMLogHandleForCategory();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[CKChatInputController requestPhotoBrowserInitFromDraft:].cold.2();
        }

      }
      else
      {
        IMLogHandleForCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[CKChatInputController requestPhotoBrowserInitFromDraft:].cold.1();
      }

    }
  }

}

- (void)requestPhotoBrowserToEnumerateSelectedImagesUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;

  v4 = a3;
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "existingPhotoBrowserViewController");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  -[CKChatInputController entryView](self, "entryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "composition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "shelfPluginPayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pluginBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10 || !objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D375E0]))
  {
    IMBalloonExtensionIDWithSuffix();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "isEqualToString:", v11))
    {
      v12 = 0;
LABEL_16:
      v14 = 0;
      goto LABEL_17;
    }
    objc_msgSend(v8, "photoShelfViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v14 = 0;
      goto LABEL_18;
    }
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "viewControllerForPluginIdentifier:", v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v18;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "fetchPluginPayloadsAndClear:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_16;
  objc_msgSend(v11, "fetchPluginStagedIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

LABEL_18:
  v15 = objc_msgSend(v14, "count", v18);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __80__CKChatInputController_requestPhotoBrowserToEnumerateSelectedImagesUsingBlock___block_invoke;
  v20[3] = &unk_1E2757EF0;
  v22 = v4;
  v23 = v15;
  v21 = v14;
  v16 = v4;
  v17 = v14;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v20);

}

void __80__CKChatInputController_requestPhotoBrowserToEnumerateSelectedImagesUsingBlock___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (*(_QWORD *)(a1 + 48) <= a3)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)requestPhotoBrowserToUnstageImages:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (objc_msgSend(v14, "count"))
  {
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "existingPhotoBrowserViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKChatInputController entryView](self, "entryView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "composition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "shelfPluginPayload");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pluginBundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v5 && v8 && objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D375E0]))
    {
      v11 = v5;
    }
    else
    {
      IMBalloonExtensionIDWithSuffix();
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "isEqualToString:", v11))
      {
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(v8, "photoShelfViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
LABEL_12:

        goto LABEL_13;
      }
      +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "viewControllerForPluginIdentifier:", v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v11, "clearPluginPackagesWithIdentifiers:", v14);
    goto LABEL_11;
  }
LABEL_13:

}

- (void)requestPhotoBrowserToUnstageAllImages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "existingPhotoBrowserViewController");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[CKChatInputController entryView](self, "entryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "composition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "shelfPluginPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pluginBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8 && objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D375E0]))
  {
    v9 = v12;
    goto LABEL_10;
  }
  IMBalloonExtensionIDWithSuffix();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", v9))
  {
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(v6, "photoShelfViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewControllerForPluginIdentifier:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v9, "clearAllStagedPluginPackages");
    goto LABEL_12;
  }
LABEL_13:

}

- (void)prepareForSuspend
{
  void *v3;
  int v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  __int16 v13;
  __int16 v14;

  +[CKPluginExtensionStateObserver sharedInstance](CKPluginExtensionStateObserver, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "passKitUIPresented");

  if (v4)
  {
    if (!IMOSLoggingEnabled())
      return;
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      goto LABEL_10;
    v14 = 0;
    v6 = "prepareForSuspend not doing suspend work as we are suspending due to passkit UI";
    v7 = (uint8_t *)&v14;
    goto LABEL_9;
  }
  +[CKPluginExtensionStateObserver sharedInstance](CKPluginExtensionStateObserver, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "iTunesStoreDialogPresented");

  if (!v9)
  {
    -[CKBrowserSwitcherViewController transitionCoordinator](self->_browserSwitcher, "transitionCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dismissCurrentFullScreenModalAnimated:completion:", 0, 0);

    -[CKBrowserSwitcherViewController transitionCoordinator](self->_browserSwitcher, "transitionCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dismissCurrentExpandedBrowserAnimated:completion:", 0, 0);

    -[CKChatInputController dismiss](self, "dismiss");
    -[CKChatInputController dismissBrowserViewController](self, "dismissBrowserViewController");
    -[CKChatInputController currentInputViewController](self, "currentInputViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setViewController:", 0);

    -[CKChatInputController setBrowserSwitcher:](self, "setBrowserSwitcher:", 0);
    -[CKChatInputController setSwitcherInputViewController:](self, "setSwitcherInputViewController:", 0);
    return;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_10:

      return;
    }
    v13 = 0;
    v6 = "prepareForSuspend not doing suspend work as we are suspending due to iTunesStore UI";
    v7 = (uint8_t *)&v13;
LABEL_9:
    _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
    goto LABEL_10;
  }
}

- (void)applicationWillAddDeactivationReasonNotification:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  void *v16;
  int v17;
  __int16 v18;
  __int16 v19;

  v4 = a3;
  -[CKChatInputController browserPlugin](self, "browserPlugin");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = CKIsRunningInMacCatalyst();

    if (!v7)
    {
      objc_msgSend(v4, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CEBED8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "longLongValue");

      if (v10 == 11)
      {
        +[CKPluginExtensionStateObserver sharedInstance](CKPluginExtensionStateObserver, "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "passKitUIPresented");

        if (v12)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              v19 = 0;
              v14 = "prepareForSuspend not doing suspend work as we are suspending due to passkit UI";
              v15 = (uint8_t *)&v19;
LABEL_12:
              _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, v14, v15, 2u);
              goto LABEL_13;
            }
            goto LABEL_13;
          }
        }
        else
        {
          +[CKPluginExtensionStateObserver sharedInstance](CKPluginExtensionStateObserver, "sharedInstance");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "iTunesStoreDialogPresented");

          if (!v17)
          {
            -[CKChatInputController setShouldRestoreAppSwitcher:](self, "setShouldRestoreAppSwitcher:", 0);
            -[CKChatInputController dismiss](self, "dismiss");
            goto LABEL_15;
          }
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              v18 = 0;
              v14 = "prepareForSuspend not doing suspend work as we are suspending due to iTunesStore UI";
              v15 = (uint8_t *)&v18;
              goto LABEL_12;
            }
LABEL_13:

          }
        }
      }
    }
  }
LABEL_15:

}

- (void)chatControllerReceivedKeyboardWillHideNotification:(id)a3
{
  void *v4;

  -[CKChatInputController entryView](self, "entryView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "beginDeferringEntryFieldCollapsedStateChanges");

  -[CKChatInputController setKeyboardIsHiding:](self, "setKeyboardIsHiding:", 1);
  -[CKChatInputController stickerPickerWasHidden](self, "stickerPickerWasHidden");
}

- (void)chatControllerReceivedKeyboardDidHideNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "keyboardDidHide: called", v8, 2u);
    }

  }
  -[CKChatInputController setKeyboardIsHiding:](self, "setKeyboardIsHiding:", 0);
  -[CKChatInputController setKeyboardIsVisible:](self, "setKeyboardIsVisible:", 0);
  -[CKChatInputController orientationManager](self, "orientationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endListeningForOrientationEventsWithKey:", CFSTR("KeyboardVisible"));

  -[CKChatInputController entryView](self, "entryView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDeferringEntryFieldCollapsedStateChanges");

}

- (void)chatControllerReceivedKeyboardWillShowNotification:(id)a3
{
  id v3;

  -[CKChatInputController orientationManager](self, "orientationManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginListeningForOrientationEventsWithKey:", CFSTR("KeyboardVisible"));

}

- (void)chatControllerReceivedKeyboardDidShowNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "keyboardDidShow: called", buf, 2u);
    }

  }
  -[CKChatInputController setKeyboardIsVisible:](self, "setKeyboardIsVisible:", 1);
  -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isPresentingCard")
    && (objc_msgSend(v6, "isPresentingInSendMenuPopover") & 1) == 0
    && (objc_msgSend(v6, "isExpanded") & 1) == 0
    && -[CKChatInputController isEntryViewFirstResponder](self, "isEntryViewFirstResponder"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __75__CKChatInputController_chatControllerReceivedKeyboardDidShowNotification___block_invoke;
    v7[3] = &unk_1E274A208;
    v8 = v6;
    objc_msgSend(v8, "fadeOutCardWithCompletion:", v7);

  }
}

uint64_t __75__CKChatInputController_chatControllerReceivedKeyboardDidShowNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissCardAnimated:overrideExceptions:completion:", 0, 1, &__block_literal_global_131_0);
}

- (void)composeRecipientViewDidBecomeFirstResponder:(id)a3
{
  if (!CKIsRunningInMacCatalyst())
  {
    -[CKChatInputController setBrowserPlugin:](self, "setBrowserPlugin:", 0);
    -[CKChatInputController setBrowserPluginDataSource:](self, "setBrowserPluginDataSource:", 0);
    -[CKChatInputController dismissBrowserViewController](self, "dismissBrowserViewController");
  }
}

- (BOOL)isHandwritingLandscape
{
  void *v2;
  char v3;

  -[CKChatInputController handwritingPresentationController](self, "handwritingPresentationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHandwritingLandscape");

  return v3;
}

- (void)setBrowserPlugin:(id)a3
{
  IMBalloonPlugin *v5;
  IMBalloonPlugin **p_browserPlugin;
  IMBalloonPlugin *browserPlugin;
  NSObject *v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (IMBalloonPlugin *)a3;
  browserPlugin = self->_browserPlugin;
  p_browserPlugin = &self->_browserPlugin;
  if (browserPlugin != v5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        -[IMBalloonPlugin identifier](*p_browserPlugin, "identifier");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        -[IMBalloonPlugin identifier](v5, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412546;
        v12 = v9;
        v13 = 2112;
        v14 = v10;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "CKChatInputController browserPlugin changing from %@ to %@", (uint8_t *)&v11, 0x16u);

      }
    }
    objc_storeStrong((id *)p_browserPlugin, a3);
  }

}

- (void)setInputViewVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;

  v3 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAccessibilityPreferredContentSizeCategory") ^ 1;

  -[CKChatInputController setInputViewVisible:entryFieldCollapsed:animated:](self, "setInputViewVisible:entryFieldCollapsed:animated:", v3, v6, 1);
}

- (void)setInputViewVisible:(BOOL)a3 entryFieldCollapsed:(BOOL)a4 animated:(BOOL)a5
{
  -[CKChatInputController setInputViewVisible:entryFieldCollapsed:animated:messageDelegate:](self, "setInputViewVisible:entryFieldCollapsed:animated:messageDelegate:", a3, a4, a5, 1);
}

- (void)setInputViewVisible:(BOOL)a3 entryFieldCollapsed:(BOOL)a4 animated:(BOOL)a5 messageDelegate:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v11;
  int v12;
  void *v14;
  void *v15;
  id v16;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  -[CKChatInputController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "keyboardIsVisibleForChatInputController:", self);

  if (self->_inputViewVisible != v9 || v9 & ~v12)
  {
    self->_inputViewVisible = v9;
    if (v6)
    {
      -[CKChatInputController delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "chatInputDidUpdateInputViewShowingBrowser:entryFieldCollapsed:animated:", v9, v8, v7);

    }
    -[CKChatInputController entryView](self, "entryView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNeedsLayout");

    if (!v9)
    {
      +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "commitInteractionTimeOrderingChanges");

    }
  }
}

- (void)setCurrentInputViewController:(id)a3
{
  CKKeyboardContentViewController *v5;
  _BOOL4 v6;
  void *v7;
  CKKeyboardContentViewController *v8;

  v5 = (CKKeyboardContentViewController *)a3;
  if (self->_currentInputViewController != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_currentInputViewController, a3);
    v6 = -[CKChatInputController isInputViewVisible](self, "isInputViewVisible");
    v5 = v8;
    if (v6)
    {
      -[CKChatInputController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "chatInputDidUpdateWithNewInputViewController:", self->_currentInputViewController);

      v5 = v8;
    }
  }

}

- (CKBrowserSwitcherViewController)browserSwitcher
{
  CKBrowserSwitcherViewController *browserSwitcher;
  CKBrowserSwitcherViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  CKBrowserSwitcherViewController *v8;
  CKBrowserSwitcherViewController *v9;

  browserSwitcher = self->_browserSwitcher;
  if (!browserSwitcher)
  {
    v4 = [CKBrowserSwitcherViewController alloc];
    -[CKChatInputController targetConversation](self, "targetConversation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatInputController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "viewControllerForChatInputModalPresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CKBrowserSwitcherViewController initWithConversation:sendDelegate:presentingViewController:](v4, "initWithConversation:sendDelegate:presentingViewController:", v5, self, v7);
    v9 = self->_browserSwitcher;
    self->_browserSwitcher = v8;

    -[CKBrowserSwitcherViewController setDelegate:](self->_browserSwitcher, "setDelegate:", self);
    browserSwitcher = self->_browserSwitcher;
  }
  return browserSwitcher;
}

- (CKAppCardPresentationOverseer)appCardPresentationOverseer
{
  CKAppCardPresentationOverseer *appCardPresentationOverseer;
  CKAppCardPresentationOverseer *v4;
  void *v5;
  void *v6;
  CKAppCardPresentationOverseer *v7;
  CKAppCardPresentationOverseer *v8;

  appCardPresentationOverseer = self->_appCardPresentationOverseer;
  if (!appCardPresentationOverseer)
  {
    v4 = [CKAppCardPresentationOverseer alloc];
    -[CKChatInputController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewControllerForChatInputModalPresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CKAppCardPresentationOverseer initWithPresentingViewController:sendDelegate:](v4, "initWithPresentingViewController:sendDelegate:", v6, self);
    v8 = self->_appCardPresentationOverseer;
    self->_appCardPresentationOverseer = v7;

    -[CKAppCardPresentationOverseer setDelegate:](self->_appCardPresentationOverseer, "setDelegate:", self);
    appCardPresentationOverseer = self->_appCardPresentationOverseer;
  }
  return appCardPresentationOverseer;
}

- (CKKeyboardContentViewController)switcherInputViewController
{
  CKKeyboardContentViewController *switcherInputViewController;
  CKBrowserSwitcherViewController *v4;
  CKBrowserSwitcherViewController *browserSwitcher;
  CKKeyboardContentViewController *v6;
  void *v7;
  CKKeyboardContentViewController *v8;
  CKKeyboardContentViewController *v9;
  void *v10;

  switcherInputViewController = self->_switcherInputViewController;
  if (!switcherInputViewController
    || (-[CKKeyboardContentViewController viewController](switcherInputViewController, "viewController"),
        v4 = (CKBrowserSwitcherViewController *)objc_claimAutoreleasedReturnValue(),
        browserSwitcher = self->_browserSwitcher,
        v4,
        v4 != browserSwitcher))
  {
    v6 = [CKKeyboardContentViewController alloc];
    -[CKChatInputController browserSwitcher](self, "browserSwitcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CKKeyboardContentViewController initWithViewController:identifier:](v6, "initWithViewController:identifier:", v7, CFSTR("Switcher"));
    v9 = self->_switcherInputViewController;
    self->_switcherInputViewController = v8;

    -[CKKeyboardContentViewController view](self->_switcherInputViewController, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "intrinsicContentSize");

  }
  return self->_switcherInputViewController;
}

- (UITextInputPayloadController)textInputPayloadController
{
  UITextInputPayloadController *textInputPayloadController;
  UITextInputPayloadController *v4;
  UITextInputPayloadController *v5;

  textInputPayloadController = self->_textInputPayloadController;
  if (!textInputPayloadController)
  {
    objc_msgSend(MEMORY[0x1E0CEAAE0], "sharedInstance");
    v4 = (UITextInputPayloadController *)objc_claimAutoreleasedReturnValue();
    v5 = self->_textInputPayloadController;
    self->_textInputPayloadController = v4;

    textInputPayloadController = self->_textInputPayloadController;
  }
  return textInputPayloadController;
}

- (CKConversation)targetConversation
{
  void *v3;
  void *v4;

  -[CKChatInputController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetConversationForChatInputController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKConversation *)v4;
}

- (BOOL)_isiMessageConversation
{
  void *v2;
  void *v3;
  char v4;

  -[CKChatInputController targetConversation](self, "targetConversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendingService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "__ck_isiMessage");

  return v4;
}

- (BOOL)_isBusinessConversation
{
  void *v2;
  char v3;

  -[CKChatInputController targetConversation](self, "targetConversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBusinessConversation");

  return v3;
}

- (BOOL)hasStickerReactionSession
{
  void *v2;
  BOOL v3;

  -[CKChatInputController stickerReactionSession](self, "stickerReactionSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)beginStickerReactionSessionWithChatItem:(id)a3 cell:(id)a4
{
  id v6;
  id v7;
  CKStickerReactionSession *v8;
  CKStickerReactionSession *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = [CKStickerReactionSession alloc];
  -[CKChatInputController targetConversation](self, "targetConversation");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = -[CKStickerReactionSession initWithConversation:chatItem:cell:](v8, "initWithConversation:chatItem:cell:", v10, v7, v6);

  -[CKChatInputController setStickerReactionSession:](self, "setStickerReactionSession:", v9);
}

- (void)endStickerReactionSession
{
  -[CKChatInputController setStickerReactionSession:](self, "setStickerReactionSession:", 0);
  -[CKChatInputController setCurrentPresentationConfig:](self, "setCurrentPresentationConfig:", 0);
}

- (void)presentSendMenuForAppCardOverseerWithAppCardViewController:(id)a3 presentationStyle:(unint64_t)a4
{
  -[CKChatInputController _presentSendMenuForAppCardContentViewController:appCardPresentationStyle:withCompletion:](self, "_presentSendMenuForAppCardContentViewController:appCardPresentationStyle:withCompletion:", a3, a4, &__block_literal_global_138_4);
}

- (BOOL)shouldPresentAppCardInSendMenuWithTraitCollection:(id)a3
{
  return -[CKChatInputController determineSendMenuPresentationStyleCompatibleWithTraitCollection:](self, "determineSendMenuPresentationStyleCompatibleWithTraitCollection:", a3) == 1;
}

- (id)activeSendMenuPresentationForAppCardOverseer
{
  void *v3;
  void *v4;

  -[CKChatInputController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeSendMenuPresentationForChatInputController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)appCardOverseerDidDismissAppCard
{
  void *v3;
  void *v4;

  self->_isAppCardDismissing = 0;
  -[CKChatInputController browserWillDismiss](self, "browserWillDismiss");
  -[CKChatInputController setIsDismissingAppCardForKeyboardPresentation:](self, "setIsDismissingAppCardForKeyboardPresentation:", 0);
  if (!-[CKChatInputController hasStickerReactionSession](self, "hasStickerReactionSession"))
  {
    -[CKChatInputController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateActiveEntryViewPositioningGuide");

  }
  -[CKChatInputController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appCardDidDismiss");

  self->_isAppCardDraggingBelowKeyboardDetent = 0;
}

- (void)appCardOverseerWillDismissAppCard
{
  id v3;

  self->_isAppCardDismissing = 1;
  if (!-[CKChatInputController hasStickerReactionSession](self, "hasStickerReactionSession"))
  {
    -[CKChatInputController delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateActiveEntryViewPositioningGuide");

  }
}

- (void)appCardDidMoveToWindow:(id)a3
{
  id v3;

  -[CKChatInputController delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enforceSendMenuOrderingInWindowSubviews");

}

- (void)appCardOverseerWillPresentAppCard
{
  id v2;

  self->_isAppCardAppearing = 1;
  -[CKChatInputController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateActiveEntryViewPositioningGuide");

}

- (void)appCardOverseerDidPresentAppCard
{
  id v3;

  self->_isAppCardAppearing = 0;
  -[CKChatInputController _informDelegateOfUpdatedAppCardHeightAnimated:](self, "_informDelegateOfUpdatedAppCardHeightAnimated:", 1);
  -[CKChatInputController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateActiveEntryViewPositioningGuide");

}

- (void)appCardOverseerCardDidChangeHeight:(double)a3 isBelowKeyboardDetent:(BOOL)a4 isDragging:(BOOL)a5 isGeneratingEndOfDragAnimations:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;

  v6 = a6;
  v7 = a5;
  if (a5)
    self->_isAppCardDraggingBelowKeyboardDetent = a4;
  if (a4 && !-[CKChatInputController preventResignFirstResponder](self, "preventResignFirstResponder"))
  {
    -[CKChatInputController delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appCardDidChangeEntryViewAlignmentHeight:animated:", !v7 | v6, a3);

  }
}

- (double)appCardOverseerCompactHeightExcludingSafeArea
{
  void *v3;
  int v4;
  uint64_t (*v5)(void);
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  int v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "keyboardSizeDeterminesAppCardDetentHeight");

  if (v4)
  {
    v5 = CKNonFlatDeviceOrientation();
    -[CKChatInputController entryView](self, "entryView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA6C8], "sizeForInterfaceOrientation:inputDelegate:", v5, v8);
    v10 = v9;
    -[CKChatInputController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewControllerForChatInputModalPresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safeAreaInsets");
    v15 = v14;

    v16 = v10 - v15;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v26 = 134217984;
        v27 = v16;
        _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "ChatInputController resolved compact app card height %.2f", (uint8_t *)&v26, 0xCu);
      }

    }
  }
  else
  {
    -[CKChatInputController delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "viewControllerForChatInputModalPresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    v22 = v21;

    objc_msgSend(v19, "traitCollection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "displayScale");
    v16 = round(v22 * 0.4 * v24) / v24;

  }
  return v16;
}

- (void)appCardOverseerDidRecognizeTouchTracker
{
  -[CKChatInputController setCurrentPluginAppDidRecieveTouchForSendAPI:](self, "setCurrentPluginAppDidRecieveTouchForSendAPI:", 1);
}

- (void)appCardOverseerViewStateDidChange:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CKChatInputController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appCardViewStateDidChange:", v3);

}

- (void)browserTransitionCoordinatorWillTransitionOrPresentToFullscreen:(id)a3 withReason:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t v10[16];

  v6 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Hiding entry view", v10, 2u);
    }

  }
  -[CKChatInputController entryView](self, "entryView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 1);

  if (!a4)
  {
    -[CKChatInputController setInCollapseOrExpandAnimation:](self, "setInCollapseOrExpandAnimation:", 1);
    -[CKChatInputController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "chatInputControllerWillTransitionExpanded:", self);
    goto LABEL_9;
  }
  if (a4 == 2)
  {
    -[CKChatInputController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "chatInputControllerWillPresentModalBrowserViewController:", self);
LABEL_9:

  }
}

- (void)browserTransitionCoordinatorDidTransitionOrPresentToFullscreen:(id)a3 withReason:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CKChatInputController entryView](self, "entryView", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 0);

  if (!a4)
  {
    -[CKChatInputController setInCollapseOrExpandAnimation:](self, "setInCollapseOrExpandAnimation:", 0);
    -[CKChatInputController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chatInputControllerDidTransitionExpanded:", self);
    goto LABEL_5;
  }
  if (a4 == 2)
  {
    -[CKChatInputController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chatInputControllerDidPresentModalBrowserViewController:", self);
LABEL_5:

  }
  -[CKChatInputController browserPlugin](self, "browserPlugin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[CKChatInputController adjustSupportedInterfaceOrientationForPluginID:requiredPortrait:](self, "adjustSupportedInterfaceOrientationForPluginID:requiredPortrait:", v9, 0);
}

- (void)browserTransitionCoordinatorWillCollapseOrDismiss:(id)a3 withReason:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];

  v6 = a3;
  if (a4 != 5)
  {
    v8 = v6;
    -[CKChatInputController _reconfigurePluginDataSourceWithBalloonControllerIfNecessary](self, "_reconfigurePluginDataSourceWithBalloonControllerIfNecessary");
    if (a4 == 3)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __86__CKChatInputController_browserTransitionCoordinatorWillCollapseOrDismiss_withReason___block_invoke_2;
      v10[3] = &unk_1E274A208;
      v10[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v10);
      -[CKChatInputController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "chatInputControllerWillDismissModalBrowserViewController:", self);
    }
    else
    {
      if (a4 != 1)
      {
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __86__CKChatInputController_browserTransitionCoordinatorWillCollapseOrDismiss_withReason___block_invoke_3;
        v9[3] = &unk_1E274A208;
        v9[4] = self;
        objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v9);
        goto LABEL_8;
      }
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __86__CKChatInputController_browserTransitionCoordinatorWillCollapseOrDismiss_withReason___block_invoke;
      v11[3] = &unk_1E274A208;
      v11[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v11);
      -[CKChatInputController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "chatInputControllerWillTransitionCollapsed:", self);
    }

LABEL_8:
    v6 = v8;
  }

}

uint64_t __86__CKChatInputController_browserTransitionCoordinatorWillCollapseOrDismiss_withReason___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  objc_msgSend(*(id *)(a1 + 32), "setInCollapseOrExpandAnimation:", 1);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "switcherInputViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCurrentInputViewController:", v3);

  objc_msgSend(*(id *)(a1 + 32), "entryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pluginEntryViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  return objc_msgSend(*(id *)(a1 + 32), "setInputViewVisible:entryFieldCollapsed:animated:", 1, v7, 1);
}

uint64_t __86__CKChatInputController_browserTransitionCoordinatorWillCollapseOrDismiss_withReason___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentInputViewController:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setInputViewVisible:entryFieldCollapsed:animated:", 1, 0, 0);
}

uint64_t __86__CKChatInputController_browserTransitionCoordinatorWillCollapseOrDismiss_withReason___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "switcherInputViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCurrentInputViewController:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "setInputViewVisible:entryFieldCollapsed:animated:", 1, 1, 0);
}

- (void)_reconfigurePluginDataSourceWithBalloonControllerIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (-[CKChatInputController currentPluginIsDT](self, "currentPluginIsDT"))
  {
    -[CKChatInputController browserPluginDataSource](self, "browserPluginDataSource");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[CKChatInputController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "chatInputTranscriptIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKChatInputController browserPlugin](self, "browserPlugin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageGUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "existingBalloonControllerWithMessageGUID:contextIdentifier:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setDataSource:", v8);
    -[CKChatInputController setBrowserPluginDataSource:](self, "setBrowserPluginDataSource:", 0);

  }
}

- (void)browserTransitionCoordinatorDidCollapseOrDismiss:(id)a3 withReason:(int64_t)a4
{
  id v6;
  void *v7;
  _QWORD block[5];

  v6 = a3;
  if ((a4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[CKChatInputController setInCollapseOrExpandAnimation:](self, "setInCollapseOrExpandAnimation:", 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__CKChatInputController_browserTransitionCoordinatorDidCollapseOrDismiss_withReason___block_invoke;
    block[3] = &unk_1E274A208;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else if (a4 == 3)
  {
    -[CKChatInputController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chatInputControllerDidDismissModalBrowserViewController:", self);

    -[CKChatInputController setBrowserPlugin:](self, "setBrowserPlugin:", 0);
    -[CKChatInputController setInputViewVisible:](self, "setInputViewVisible:", 0);
    -[CKChatInputController setBrowserSwitcher:](self, "setBrowserSwitcher:", 0);
    -[CKChatInputController setCurrentInputViewController:](self, "setCurrentInputViewController:", 0);
    -[CKChatInputController setSwitcherInputViewController:](self, "setSwitcherInputViewController:", 0);
  }

}

void __85__CKChatInputController_browserTransitionCoordinatorDidCollapseOrDismiss_withReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chatInputControllerDidTransitionCollapsed:", *(_QWORD *)(a1 + 32));

}

- (id)appTitleOverride
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CKChatInputController targetConversation](self, "targetConversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isBusinessConversation"))
  {
    objc_msgSend(v2, "chat");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "recipient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)appIconOverride
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CKChatInputController targetConversation](self, "targetConversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isBusinessConversation"))
  {
    objc_msgSend(v2, "chat");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "recipient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(v4, "brandSquareLogoImageData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    objc_msgSend(v5, "imageWithData:scale:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)switcherViewControllerWillAppear:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "balloonPlugin");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[CKChatInputController adjustSupportedInterfaceOrientationForPluginID:requiredPortrait:](self, "adjustSupportedInterfaceOrientationForPluginID:requiredPortrait:", v5, 0);
}

- (void)switcherViewControllerWillDisappear:(id)a3
{
  id v3;

  -[CKChatInputController delegate](self, "delegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopForcingOrientation");

}

- (void)switcherViewControllerDidFinishSwitching:(id)a3 toViewController:(id)a4
{
  -[CKChatInputController setConversationAndRecipientsForBrowser:](self, "setConversationAndRecipientsForBrowser:", a4);
}

- (void)setConversationAndRecipientsForBrowser:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = -[CKChatInputController appManagerIsDisplayed](self, "appManagerIsDisplayed");
  v5 = v16;
  if (v16 && !v4)
  {
    -[CKChatInputController targetConversation](self, "targetConversation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "senderIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setSender:", v7);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "recipientStrings");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setRecipients:", v8);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CKChatInputController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "generatedSummary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setGeneratedSummary:", v10);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CKChatInputController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "generativeContext");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setGenerativeContext:", v12);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v16, "setIsiMessage:", -[CKChatInputController _isiMessageConversation](self, "_isiMessageConversation"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v16, "setIsBusiness:", -[CKChatInputController _isBusinessConversation](self, "_isBusinessConversation"));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "chat");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "guid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setConversationID:", v14);

    }
    objc_msgSend(v16, "balloonPlugin");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatInputController setBrowserPlugin:](self, "setBrowserPlugin:", v15);

    v5 = v16;
  }

}

- (void)switcherViewControllerDidCollapse:(id)a3
{
  void *v4;

  -[CKChatInputController switcherInputViewController](self, "switcherInputViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatInputController setCurrentInputViewController:](self, "setCurrentInputViewController:", v4);

  -[CKChatInputController setInputViewVisible:](self, "setInputViewVisible:", 1);
}

- (void)switcherViewControllerDidSelectAppStore:(id)a3 shouldRestoreAppSwitcher:(BOOL)a4
{
  id v5;

  -[CKChatInputController setShouldRestoreAppSwitcher:](self, "setShouldRestoreAppSwitcher:", a4);
  -[CKChatInputController presentAppStoreForAdamID:](self, "presentAppStoreForAdamID:", 0);
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trackEvent:", *MEMORY[0x1E0D384A0]);

}

- (void)switcherViewControllerDidSelectAppManager:(id)a3 shouldRestoreAppSwitcher:(BOOL)a4
{
  -[CKChatInputController setShouldRestoreAppSwitcher:](self, "setShouldRestoreAppSwitcher:", a4);
  -[CKChatInputController presentAppManager](self, "presentAppManager");
}

- (void)switcherViewController:(id)a3 didSelectPluginAtIndexPath:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CKChatInputController entryView](self, "entryView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectPluginAtIndexPath:", v5);

}

- (void)switcherViewController:(id)a3 hasUpdatedLastTouchDate:(id)a4
{
  -[CKChatInputController setCurrentPluginAppDidRecieveTouchForSendAPI:](self, "setCurrentPluginAppDidRecieveTouchForSendAPI:", 1, a4);
}

- (void)switcherViewController:(id)a3 willPresentBrowserModally:(id)a4
{
  -[CKChatInputController setConversationAndRecipientsForBrowser:](self, "setConversationAndRecipientsForBrowser:", a4);
}

- (void)_launchAppExtensionForDebugging
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD block[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.MobileSMS.CKAppExtension.launch"), 0);
  CKAppExtensionDevelopmentTargetBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allPlugins");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "containsString:", v4);

          if ((v13 & 1) != 0)
            break;
        }
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_11;
        }
      }
      v14 = v11;

      if (!v14)
        goto LABEL_14;
      -[CKChatInputController showBrowserForPlugin:dataSource:style:](self, "showBrowserForPlugin:dataSource:style:", v14, 0, 0);
      -[CKChatInputController browserSwitcher](self, "browserSwitcher");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "showPlugin:", v14);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObserver:name:object:", self, *MEMORY[0x1E0D352C8], 0);

    }
    else
    {
LABEL_11:

LABEL_14:
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__CKChatInputController__launchAppExtensionForDebugging__block_invoke;
      block[3] = &unk_1E274A208;
      block[4] = self;
      if (_launchAppExtensionForDebugging_onceToken != -1)
        dispatch_once(&_launchAppExtensionForDebugging_onceToken, block);
    }
  }

}

void __56__CKChatInputController__launchAppExtensionForDebugging__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__launchAppExtensionForDebugging, *MEMORY[0x1E0D352C8], 0);

}

- (void)_setupObserverForLaunchAppExtensionForDebugging
{
  __CFNotificationCenter *DarwinNotifyCenter;
  id v4;

  CKAppExtensionDevelopmentTargetBundle();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_LaunchAppExtensionForDebuggingNotificationHandler, CFSTR("com.apple.MobileSMS.CKAppExtension.launch"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }

}

- (void)launchAndShowBrowserForPlugin:(id)a3 dataSource:(id)a4 style:(unint64_t)a5
{
  -[CKChatInputController launchAndShowBrowserForPlugin:dataSource:style:presentationConfiguration:](self, "launchAndShowBrowserForPlugin:dataSource:style:presentationConfiguration:", a3, a4, a5, 0);
}

- (void)launchAndShowBrowserForPlugin:(id)a3 dataSource:(id)a4 style:(unint64_t)a5 presentationConfiguration:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;

  v19 = a3;
  v10 = a4;
  v11 = a6;
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isPluginEnabled:", v13);

  if ((v14 & 1) == 0)
  {
    objc_msgSend(v19, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEnabled:forPlugin:", 1, v15);

  }
  objc_msgSend(v12, "visibleDrawerPlugins");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "containsObject:", v19);

  if ((v17 & 1) == 0)
  {
    objc_msgSend(v19, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateInteractionTimeForPlugin:", v18);

    objc_msgSend(v12, "commitInteractionTimeOrderingChanges");
  }
  -[CKChatInputController showBrowserForPlugin:dataSource:style:presentationConfiguration:](self, "showBrowserForPlugin:dataSource:style:presentationConfiguration:", v19, v10, a5, v11);

}

- (void)showBrowserPopoverForPlugin:(id)a3 dataSource:(id)a4 style:(unint64_t)a5 presentationConfiguration:(id)a6
{
  id v10;
  id v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  double v23;
  double v24;
  CKBrowserTransitionCoordinator *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  id v33;

  v33 = a3;
  v10 = a4;
  v11 = a6;
  v12 = (objc_class *)objc_msgSend(v33, "browserClass");
  if (a5 > 1)
  {
    _IMLog();
  }
  else
  {
    v13 = (void *)objc_msgSend([v12 alloc], "initWithBalloonPlugin:dataSource:", v33, v10);
    objc_msgSend(v33, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    IMBalloonExtensionIDWithSuffix();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqualToString:", v15);

    if ((v16 & 1) != 0)
    {
      v17 = 380.0;
      v18 = 280.0;
    }
    else
    {
      objc_msgSend(v33, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      IMBalloonExtensionIDWithSuffix();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqualToString:", v20);

      if (v21)
      {
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "stickerPopoverSize");
        v18 = v23;
        v17 = v24;

      }
      else
      {
        v17 = 480.0;
        v18 = 320.0;
      }
    }
    objc_msgSend(v13, "setPreferredContentSize:", v18, v17);
    v25 = objc_alloc_init(CKBrowserTransitionCoordinator);
    -[CKChatInputController targetConversation](self, "targetConversation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBrowserTransitionCoordinator setConversation:](v25, "setConversation:", v26);

    -[CKBrowserTransitionCoordinator updateBrowser:](v25, "updateBrowser:", v13);
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isScheduledMessagesCoreEnabled");

    if (v28)
    {
      -[CKChatInputController pluginContextForPlugin:](self, "pluginContextForPlugin:", v33);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isEqual:", *MEMORY[0x1E0D37608]);

      if (v31)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "performSelector:withObject:", sel_setPluginContext_, v29);
        if (v29)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[CKChatInputController entryView](self, "entryView");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setSendLaterPluginInfo:animated:", v29, 1);

          }
        }
      }

    }
    -[CKChatInputController showExpandedBrowserPopover:presentationConfiguration:](self, "showExpandedBrowserPopover:presentationConfiguration:", v13, v11);

  }
}

- (void)showExpandedBrowserPopover:(id)a3 presentationConfiguration:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(v14, "setSendDelegate:", self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v14, "setCurrentBrowserConsumer:", 2);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v14, "setShouldDisableSnapshotView:", objc_msgSend(v6, "shouldDisableSnapshotView"));
    objc_msgSend(v14, "setModalPresentationStyle:", 7);
    -[CKChatInputController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "viewControllerForChatInputModalPresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentViewController:animated:completion:", v14, 1, 0);

    objc_msgSend(v6, "sourceView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "popoverPresentationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setSourceView:", v9);

    v11 = objc_msgSend(v6, "permittedArrowDirections");
    objc_msgSend(v14, "popoverPresentationController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPermittedArrowDirections:", v11);

    objc_msgSend(v14, "popoverPresentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", self);

  }
  else
  {
    _IMLog();
  }

}

- (void)showBrowserForPlugin:(id)a3 dataSource:(id)a4 style:(unint64_t)a5
{
  -[CKChatInputController launchAndShowBrowserForPlugin:dataSource:style:presentationConfiguration:](self, "launchAndShowBrowserForPlugin:dataSource:style:presentationConfiguration:", a3, a4, a5, 0);
}

- (BOOL)isShowingAppCardForExtensionIdentifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  if (CKIsAppCardsEnabled()
    && (-[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isPresentingCard"),
        v5,
        v6))
  {
    -[CKChatInputController browserPlugin](self, "browserPlugin");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "extensionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "isEqualToString:", v4);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)showBrowserForPlugin:(id)a3 dataSource:(id)a4 style:(unint64_t)a5 presentationConfiguration:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  char v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  CKChatInputController *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  int64_t v45;
  int v46;
  _BOOL4 v47;
  void *v48;
  CKChatInputController *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  BOOL v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  uint8_t buf[4];
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_msgSend(v10, "appBundle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[CKChatInputController shouldPreventAppFromDisplayingForBundleIdentifier:](self, "shouldPreventAppFromDisplayingForBundleIdentifier:", v14);

  if (!v15)
  {
    objc_msgSend(v10, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0D37608]);

    -[CKChatInputController entryView](self, "entryView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "composition");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "shelfPluginPayload");
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (v59)
    {
      v23 = objc_msgSend(v59, "supportsSendLater");
      if (v20)
      {
        if ((v23 & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v59, "pluginBundleID");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v61 = v25;
              _os_log_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_INFO, "showBrowserForPlugin: User selected send later, but the currently staged plugin payload (%@) does not allow presentation alongside Send Later. Presenting unsupported item alert and aborting.", buf, 0xCu);

            }
          }
          objc_msgSend(v59, "pluginBundleID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKChatInputController _presentSendLaterUnsupportedAlertForIdentifier:handler:](self, "_presentSendLaterUnsupportedAlertForIdentifier:handler:", v26, 0);

          goto LABEL_53;
        }
      }
    }
    v27 = v11;
    v28 = self;
    if (v12)
    {
      v29 = v12;
    }
    else
    {
      -[CKChatInputController setStickerPickerMessagePartChatItem:](self, "setStickerPickerMessagePartChatItem:", 0);
      -[CKChatInputController setStickerPickerMessagePartParentChatItem:](self, "setStickerPickerMessagePartParentChatItem:", 0);
      v28 = self;
      v29 = 0;
    }
    -[CKChatInputController setCurrentPresentationConfig:](v28, "setCurrentPresentationConfig:", v29);
    if (CKIsAppCardsEnabled())
    {
      -[CKChatInputController browserPlugin](self, "browserPlugin");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "identifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "identifier");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v31, "isEqualToString:", v32) & 1) != 0)
      {
        -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "isPresentingCard");

        if (v34)
        {
          v11 = v27;
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v10, "identifier");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v61 = v36;
              _os_log_impl(&dword_18DFCD000, v35, OS_LOG_TYPE_INFO, "presentModernCardForPlugin identifier is already the current plugin: %@. Doing nothing.", buf, 0xCu);

            }
          }
          -[CKChatInputController browserPluginDataSource](self, "browserPluginDataSource");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37 == v27)
          {

          }
          else
          {
            -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "updateCurrentBrowserWithDataSource:", v27);

            if (v39)
            {
              -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "requestPresentationStyle:animated:", a5, 1);

              -[CKChatInputController setBrowserPluginDataSource:](self, "setBrowserPluginDataSource:", v27);
            }
          }
          goto LABEL_53;
        }
      }
      else
      {

      }
    }
    if (a5 == 2)
    {
      v11 = v27;
      -[CKChatInputController _presentFullScreenModalBrowserForPlugin:dataSource:](self, "_presentFullScreenModalBrowserForPlugin:dataSource:", v10, v27);
LABEL_53:

      goto LABEL_54;
    }
    -[CKChatInputController setBrowserPlugin:](self, "setBrowserPlugin:", v10);
    -[CKChatInputController setBrowserPluginDataSource:](self, "setBrowserPluginDataSource:", v27);
    -[CKChatInputController delegate](self, "delegate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "viewControllerForChatInputModalPresentation");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "traitCollection");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v27;

    v45 = -[CKChatInputController determineSendMenuPresentationStyleCompatibleWithTraitCollection:](self, "determineSendMenuPresentationStyleCompatibleWithTraitCollection:", v43);
    v46 = CKIsRunningInMacCatalyst();
    v47 = v45 == 1 && v12 != 0;
    if (v46 || v47)
    {
      v11 = v44;
      -[CKChatInputController showBrowserPopoverForPlugin:dataSource:style:presentationConfiguration:](self, "showBrowserPopoverForPlugin:dataSource:style:presentationConfiguration:", v10, v44, a5, v12);
      goto LABEL_52;
    }
    v11 = v44;
    if (CKIsAppCardsEnabled())
    {
      -[CKChatInputController presentModernCardForPlugin:dataSource:presentationStyle:](self, "presentModernCardForPlugin:dataSource:presentationStyle:", v10, v44, a5);
LABEL_52:

      goto LABEL_53;
    }
    if (a5)
    {
      if (a5 != 1)
        goto LABEL_52;
      -[CKChatInputController browserSwitcher](self, "browserSwitcher");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "showBrowserFullscreenForPlugin:datasource:", v10, v44);

      -[CKChatInputController setCurrentInputViewController:](self, "setCurrentInputViewController:", 0);
      v49 = self;
      v50 = 0;
LABEL_51:
      -[CKChatInputController setInputViewVisible:](v49, "setInputViewVisible:", v50);
      goto LABEL_52;
    }
    -[CKChatInputController browserSwitcher](self, "browserSwitcher");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "showBrowserInSwitcherForPlugin:datasource:reloadData:", v10, v44, 0);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v52, "canPresentOverKeyboard"))
    {
      -[CKChatInputController delegate](self, "delegate");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v53, "keyboardIsVisibleForChatInputController:", self) & 1) != 0)
      {
        v54 = -[CKChatInputController isInputViewVisible](self, "isInputViewVisible");

        if (!v54)
        {
          buf[0] = 0;
          -[CKChatInputController delegate](self, "delegate");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v44;
          +[CKInputView defaultContentSizeLargerThanKeyboard:](CKInputView, "defaultContentSizeLargerThanKeyboard:", buf);
          objc_msgSend(v55, "chatInputWillChangeHeightForCompactPresentation:", v56);

          if (!buf[0])
          {
            -[CKChatInputController entryView](self, "entryView");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "setNeedsLayout");

          }
          -[CKChatInputController _presentCompactSwitcherOverKeyboardWithCompletion:](self, "_presentCompactSwitcherOverKeyboardWithCompletion:", 0);
          goto LABEL_52;
        }
        goto LABEL_50;
      }

    }
LABEL_50:
    -[CKChatInputController switcherInputViewController](self, "switcherInputViewController");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v44;
    -[CKChatInputController setCurrentInputViewController:](self, "setCurrentInputViewController:", v58);

    v49 = self;
    v50 = 1;
    goto LABEL_51;
  }
  -[CKChatInputController dismissAndReloadInputViews:](self, "dismissAndReloadInputViews:", 1);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "appBundle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v61 = v18;
      _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Dismissing App Browser: User attempted to open a plugin that is not allowed by App Limits with Bundle ID%@", buf, 0xCu);

    }
  }
LABEL_54:

}

- (void)_presentFullScreenModalBrowserForPlugin:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _BYTE buf[12];
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CKChatInputController browserPlugin](self, "browserPlugin");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqualToString:", v10);

  -[CKChatInputController setBrowserPlugin:](self, "setBrowserPlugin:", v6);
  -[CKChatInputController setBrowserPluginDataSource:](self, "setBrowserPluginDataSource:", v7);
  if (!-[CKChatInputController isAppCardPresented](self, "isAppCardPresented") || (v11 & 1) != 0)
  {
    objc_msgSend(v6, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatInputController requestPresentationStyleFullScreenModalForPlugin:dataSource:skipValidation:](self, "requestPresentationStyleFullScreenModalForPlugin:dataSource:skipValidation:", v16, v7, 1);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v13;
        v22 = 2112;
        v23 = v14;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "_presentFullScreenModalBrowserForPlugin: dismissing Send Menu presentation for outgoing plugin: %@, new plugin: %@", buf, 0x16u);

      }
    }
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __76__CKChatInputController__presentFullScreenModalBrowserForPlugin_dataSource___block_invoke;
    v17[3] = &unk_1E274CB00;
    objc_copyWeak(&v20, (id *)buf);
    v18 = v6;
    v19 = v7;
    objc_msgSend(v15, "dismissCardAnimated:completion:", 1, v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }

}

void __76__CKChatInputController__presentFullScreenModalBrowserForPlugin_dataSource___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "requestPresentationStyleFullScreenModalForPlugin:dataSource:skipValidation:", v2, *(_QWORD *)(a1 + 40), 1);

}

- (void)_presentSendLaterUnsupportedAlertForIdentifier:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  CKChatInputController *v28;
  id v29;

  v6 = a4;
  v7 = a3;
  CKFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SHELF_SEND_LATER_UNSUPPORTED_ITEM_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  CKFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SHELF_SEND_LATER_UNSUPPORTED_ITEM"), &stru_1E276D870, CFSTR("ChatKit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  IMBalloonExtensionIDWithSuffix();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "isEqualToString:", v12);

  if (v13)
  {
    CKFrameworkBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SHELF_SEND_LATER_UNSUPPORTED_APPLE_CASH_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v15 = objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SHELF_SEND_LATER_UNSUPPORTED_APPLE_CASH"), &stru_1E276D870, CFSTR("ChatKit"));
    v17 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v17;
    v9 = (void *)v15;
  }
  +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v9, v11, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CKFrameworkBundle();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E276D870, CFSTR("ChatKit"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __80__CKChatInputController__presentSendLaterUnsupportedAlertForIdentifier_handler___block_invoke;
  v27 = &unk_1E2755990;
  v28 = self;
  v29 = v6;
  v21 = v6;
  +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v20, 0, &v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAction:", v22, v24, v25, v26, v27, v28);

  -[CKChatInputController setIsDisplayingReplaceCompositionAlert:](self, "setIsDisplayingReplaceCompositionAlert:", 1);
  -[CKChatInputController delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "presentFromViewController:animated:completion:", v23, 1, 0);

}

uint64_t __80__CKChatInputController__presentSendLaterUnsupportedAlertForIdentifier_handler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(*(id *)(a1 + 32), "dismissPluginAppAfterReplaceAlertInteractedWithIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "setIsDisplayingReplaceCompositionAlert:", 0);
}

- (id)sendLaterPluginInfo
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  uint64_t v10;
  CKSendLaterPluginInfo *v11;
  void *v12;

  -[CKChatInputController entryView](self, "entryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendLaterPluginInfo");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {

    goto LABEL_5;
  }
  v5 = (void *)v4;
  -[CKChatInputController entryView](self, "entryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendLaterPluginInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_5:
    v11 = [CKSendLaterPluginInfo alloc];
    -[CKChatInputController targetConversation](self, "targetConversation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CKSendLaterPluginInfo initWithConversation:](v11, "initWithConversation:", v9);
    goto LABEL_6;
  }
  -[CKChatInputController entryView](self, "entryView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendLaterPluginInfo");
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v12 = (void *)v10;

  return v12;
}

- (id)pluginContextForPlugin:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isScheduledMessagesCoreEnabled");

  if (v6
    && (objc_msgSend(v4, "identifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D37608]),
        v7,
        v8))
  {
    -[CKChatInputController sendLaterPluginInfo](self, "sendLaterPluginInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v4;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "No pluginContext type known for plugin: %@", (uint8_t *)&v12, 0xCu);
      }

    }
    v9 = 0;
  }

  return v9;
}

- (void)presentModernCardForPlugin:(id)a3 dataSource:(id)a4 presentationStyle:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  unsigned int v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  CKChatInputController *v23;
  char v24;

  v8 = a4;
  v9 = a3;
  -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatInputController pluginContextForPlugin:](self, "pluginContextForPlugin:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateCurrentBrowserForPlugin:dataSource:pluginContext:", v9, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CKChatInputController entryView](self, "entryView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setSendLaterPluginInfo:animated:", v11, 1);

    }
  }
  -[CKChatInputController setConversationAndRecipientsForBrowser:](self, "setConversationAndRecipientsForBrowser:", v12);
  if ((objc_msgSend(v10, "isPresentingInSendMenuPopover") & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    -[CKChatInputController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isKeyboardVisible");

    if (v16)
      -[CKChatInputController setPreventResignFirstResponder:](self, "setPreventResignFirstResponder:", 1);
    v14 = v16 ^ 1;
  }
  -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "shouldAnimatePresentationForPresentationStyle:", a5);

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __81__CKChatInputController_presentModernCardForPlugin_dataSource_presentationStyle___block_invoke;
  v21[3] = &unk_1E274E150;
  v19 = v10;
  v22 = v19;
  v23 = self;
  v24 = v14 | v18;
  objc_msgSend(v19, "presentCardWithStyle:animated:completion:", a5, v14 | v18, v21);
  if (v18)
  {
    -[CKChatInputController setPreventResignFirstResponder:](self, "setPreventResignFirstResponder:", 0);
    -[CKChatInputController delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dismissKeyboard");

  }
}

void __81__CKChatInputController_presentModernCardForPlugin_dataSource_presentationStyle___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 40), "appCardDismissPadding");
  objc_msgSend(*(id *)(a1 + 32), "setAppCardDismissPadding:");
  if (!*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "setPreventResignFirstResponder:", 0);
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dismissKeyboard");

    objc_msgSend(*(id *)(a1 + 40), "appCardPresentationOverseer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isExpanded");

    if ((v4 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "_informDelegateOfUpdatedAppCardHeightAnimated:", 1);
      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "updateActiveEntryViewPositioningGuide");

    }
  }
}

- (void)extensionRemoteConnectionWasInterrupted:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_stringForKey:", *MEMORY[0x1E0D37E80]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  IMStickersExtensionIdentifier();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IMBalloonExtensionIDWithSuffix();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v8, "isEqualToString:", v6);

  if (v7)
    -[CKChatInputController dismissStickerPickerPreservingChatItem:completion:](self, "dismissStickerPickerPreservingChatItem:completion:", 0, 0);

}

- (void)_informDelegateOfUpdatedAppCardHeightAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[CKChatInputController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CKChatInputController _appCardHeightWithSafeArea](self, "_appCardHeightWithSafeArea");
  objc_msgSend(v5, "appCardDidChangeEntryViewAlignmentHeight:animated:", v3);

}

- (double)_appCardHeightWithSafeArea
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  -[CKChatInputController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerForChatInputModalPresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKChatInputController appCardOverseerCompactHeightExcludingSafeArea](self, "appCardOverseerCompactHeightExcludingSafeArea");
  v6 = v5;
  objc_msgSend(v4, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeAreaInsets");
  v9 = v6 + v8;

  return v9;
}

- (BOOL)isAppCardUsingSheetPresentation
{
  void *v2;
  char v3;

  -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPresentingInSheetController");

  return v3;
}

- (BOOL)isAppCardPresentationStyleExpanded
{
  void *v2;
  char v3;

  -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isExpanded");

  return v3;
}

- (void)dismissBrowserViewController
{
  -[CKChatInputController setDeferredPluginDataSource:](self, "setDeferredPluginDataSource:", 0);
  -[CKChatInputController _dismissBrowserViewControllerAndReloadInputViews:](self, "_dismissBrowserViewControllerAndReloadInputViews:", 0);
}

- (void)_dismissBrowserViewControllerAndReloadInputViews:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKChatInputController _deferredDismissToKeyboardAndFocusEntryView:](self, "_deferredDismissToKeyboardAndFocusEntryView:", v4);

}

- (void)showKeyboard
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  if (!CKIsAppCardsEnabled())
    -[CKChatInputController dismissBrowserViewController](self, "dismissBrowserViewController");
  -[CKChatInputController entryView](self, "entryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "becomeFirstResponder");

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "showKeyboard called", v7, 2u);
    }

  }
}

- (BOOL)isEntryViewFirstResponder
{
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;

  -[CKChatInputController entryView](self, "entryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subjectView");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)v5, "isFirstResponder");

  -[CKChatInputController entryView](self, "entryView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v9, "isFirstResponder");

  return v6 | v5;
}

- (BOOL)currentPluginIsDT
{
  void *v2;
  void *v3;
  char v4;

  -[CKChatInputController browserPlugin](self, "browserPlugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D37588]);

  return v4;
}

- (BOOL)currentPluginIsPhotos
{
  void *v2;
  void *v3;
  char v4;

  -[CKChatInputController browserPlugin](self, "browserPlugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D375E0]);

  return v4;
}

- (BOOL)currentPluginIsGenerativePlayground
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[CKChatInputController browserPlugin](self, "browserPlugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IMBalloonExtensionIDWithSuffix();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (BOOL)switcherPluginCanMessageAPIOnBehalfOfPlugin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CKChatInputController _isCombinedStickersApp](self, "_isCombinedStickersApp")
    || !objc_msgSend(v4, "length")
    || (-[CKChatInputController browserPlugin](self, "browserPlugin"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "identifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", v4),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    if (CKIsRunningInMacCatalyst())
      v8 = 1;
    else
      v8 = -[CKChatInputController _switcherPluginCanMessageAPI](self, "_switcherPluginCanMessageAPI");
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        -[CKBrowserSwitcherViewController balloonPlugin](self->_browserSwitcher, "balloonPlugin");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412546;
        v14 = v4;
        v15 = 2112;
        v16 = v11;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Denying action for plugin %@ (the current plugin is %@)", (uint8_t *)&v13, 0x16u);

      }
    }
    v8 = 0;
  }

  return v8;
}

- (BOOL)_pluginCanMessageAPI:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  char v10;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    IMBalloonExtensionIDWithSuffix();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "isEqualToString:", v4);

    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isZelkovaEnabled");

    if (v7)
    {
      IMBalloonExtensionIDWithSuffix();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v3, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }
    v10 = v5 | v9;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_isCombinedStickersApp
{
  void *v2;
  void *v3;
  char v4;

  -[CKChatInputController browserPlugin](self, "browserPlugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSuffix:", *MEMORY[0x1E0D374D0]);

  return v4;
}

- (BOOL)_switcherPluginCanMessageAPI
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  if (!CKIsAppCardsEnabled())
  {
    if (!self->_browserSwitcher)
      return 0;
    -[CKChatInputController browserSwitcher](self, "browserSwitcher");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isBrowserReadyForUserInteraction") & 1) == 0)
    {
      -[CKChatInputController browserSwitcher](self, "browserSwitcher");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "transitionCoordinator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v6, "currentConsumer") == 2;

LABEL_13:
      return v3;
    }
LABEL_8:
    v3 = 1;
    goto LABEL_13;
  }
  if (!-[CKChatInputController appModalIsDisplayed](self, "appModalIsDisplayed"))
  {
    -[CKChatInputController stickerReactionSession](self, "stickerReactionSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isPresentingCard") & 1) == 0)
    {
      v8 = objc_msgSend(v4, "presentationBegan");
      if (v7)
        v3 = 1;
      else
        v3 = v8;
      goto LABEL_13;
    }
    goto LABEL_8;
  }
  return 1;
}

- (BOOL)_shouldShowHandwriting
{
  CKChatInputController *v2;
  void *v3;

  v2 = self;
  -[CKChatInputController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "chatInputControllerShouldShowHandwriting:", v2);

  return (char)v2;
}

- (void)showHandwritingBrowserWithExistingPayload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  CKHandwritingPresentationController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  CKKeyboardContentViewController *v24;
  CKKeyboardContentViewController *v25;
  void *v26;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[CKChatInputController _shouldShowHandwriting](self, "_shouldShowHandwriting"))
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (v6)
    {
      if (v4)
      {
        v28[0] = v4;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
      +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handwritingViewControllerWithPluginPayloads:", v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "setSendDelegate:", self);
      objc_msgSend(v22, "balloonPlugin");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKChatInputController setBrowserPlugin:](self, "setBrowserPlugin:", v23);

      v24 = [CKKeyboardContentViewController alloc];
      v25 = -[CKKeyboardContentViewController initWithViewController:identifier:](v24, "initWithViewController:identifier:", v22, *MEMORY[0x1E0D375C0]);
      -[CKChatInputController setCurrentInputViewController:](self, "setCurrentInputViewController:", v25);
      -[CKChatInputController setInputViewVisible:](self, "setInputViewVisible:", 1);

    }
    else
    {
      -[CKChatInputController orientationManager](self, "orientationManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "beginListeningForOrientationEventsWithKey:", CFSTR("HandwritingOnscreen"));

      -[CKChatInputController handwritingPresentationController](self, "handwritingPresentationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v10 = objc_alloc_init(CKHandwritingPresentationController);
        -[CKChatInputController setHandwritingPresentationController:](self, "setHandwritingPresentationController:", v10);

        -[CKChatInputController handwritingPresentationController](self, "handwritingPresentationController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setDelegate:", self);

        -[CKChatInputController handwritingPresentationController](self, "handwritingPresentationController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setSendDelegate:", self);

        -[CKChatInputController orientationManager](self, "orientationManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKChatInputController handwritingPresentationController](self, "handwritingPresentationController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setDeviceOrientationManager:", v13);

      }
      -[CKChatInputController handwritingPresentationController](self, "handwritingPresentationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setPluginPayload:", v4);

      -[CKChatInputController orientationManager](self, "orientationManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isListeningForOrientationEvents");

      if (v17)
      {
        -[CKChatInputController orientationManager](self, "orientationManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "currentDeviceOrientation");

        if (v19 == 3)
          v20 = 3;
        else
          v20 = 4 * (v19 == 4);
      }
      else
      {
        v20 = 0;
      }
      -[CKChatInputController handwritingPresentationController](self, "handwritingPresentationController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setInitialInterfaceOrientation:", v20);

      -[CKChatInputController handwritingPresentationController](self, "handwritingPresentationController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setVisible:animated:", 1, 1);

    }
  }

}

- (BOOL)handwritingIsDisplayed
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[CKChatInputController browserPlugin](self, "browserPlugin");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D375C0]) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[CKChatInputController handwritingPresentationController](self, "handwritingPresentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "visible");

  }
  return v5;
}

- (BOOL)appStoreIsDisplayed
{
  void *v2;
  void *v3;
  char v4;

  -[CKChatInputController browserPlugin](self, "browserPlugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D37568]);

  return v4;
}

- (BOOL)appManagerIsDisplayed
{
  void *v2;
  void *v3;
  char v4;

  -[CKChatInputController browserPlugin](self, "browserPlugin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.browser.MorePlugin"));

  return v4;
}

- (BOOL)appModalIsDisplayed
{
  void *v2;
  char v3;

  -[CKBrowserSwitcherViewController transitionCoordinator](self->_browserSwitcher, "transitionCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPresentingFullScreenModal");

  return v3;
}

- (id)_browserViewControllerForInterfaceOrientationMethods
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;

  -[CKChatInputController inputViewController](self, "inputViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBrowserSwitcherViewController transitionCoordinator](self->_browserSwitcher, "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isExpanded");

  if (v5)
  {
    -[CKChatInputController browserSwitcher](self, "browserSwitcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transitionCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "expandedAppViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "viewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v3, "viewController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)browserShouldAutorotate
{
  void *v2;
  void *v3;
  char v4;

  -[CKChatInputController _browserViewControllerForInterfaceOrientationMethods](self, "_browserViewControllerForInterfaceOrientationMethods");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "shouldAutorotate");
  else
    v4 = 1;

  return v4;
}

- (unint64_t)browserSupportedInterfaceOrientations
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[CKChatInputController _browserViewControllerForInterfaceOrientationMethods](self, "_browserViewControllerForInterfaceOrientationMethods");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "supportedInterfaceOrientations");
  else
    v4 = 30;

  return v4;
}

- (void)_handleOrientation
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[CKChatInputController orientationManager](self, "orientationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentDeviceOrientation");

  if (-[CKChatInputController lastSeenOrientation](self, "lastSeenOrientation"))
  {
    if (v4 != -[CKChatInputController lastSeenOrientation](self, "lastSeenOrientation"))
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "userInterfaceIdiom");

      if (!v6
        && (unint64_t)(v4 - 1) <= 1
        && -[CKChatInputController handwritingIsDisplayed](self, "handwritingIsDisplayed"))
      {
        -[CKChatInputController handwritingPresentationController](self, "handwritingPresentationController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "pluginPayload");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          -[CKChatInputController startEditingPayload:dismiss:](self, "startEditingPayload:dismiss:", v8, 1);
        }
        else
        {
          -[CKChatInputController handwritingPresentationController](self, "handwritingPresentationController");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setVisible:animated:", 0, 1);

        }
      }
    }
  }
  -[CKChatInputController setLastSeenOrientation:](self, "setLastSeenOrientation:", v4);
}

- (void)setEntryViewHidden:(BOOL)a3
{
  NSLog(CFSTR("%s This method is deprecated and does nothing. Please stop calling it."), a2, a3, "-[CKChatInputController setEntryViewHidden:]");
}

- (void)setShouldBlurForMessageEditing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CKChatInputController entryView](self, "entryView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldBlurForMessageEditing:", v3);

}

- (BOOL)shouldBlurForMessageEditing
{
  void *v2;
  char v3;

  -[CKChatInputController entryView](self, "entryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldBlurForMessageEditing");

  return v3;
}

- (int64_t)determineSendMenuPresentationStyleCompatibleWithTraitCollection:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  int64_t v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  v6 = (v5 & 0xFFFFFFFFFFFFFFFBLL) == 1 && objc_msgSend(v3, "horizontalSizeClass") == 2;
  return v6;
}

- (void)handleTextInputPayload:(id)a3 withPayloadID:(id)a4 forPlugin:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "length"))
  {
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewControllerForPluginIdentifier:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v12, "setSendDelegate:", self);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __72__CKChatInputController_handleTextInputPayload_withPayloadID_forPlugin___block_invoke;
      v13[3] = &unk_1E274A1B8;
      v14 = v10;
      objc_msgSend(v12, "handleTextInputPayload:withPayloadID:completion:", v8, v9, v13);

    }
  }

}

void __72__CKChatInputController_handleTextInputPayload_withPayloadID_forPlugin___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 1024;
      v9 = a2;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Plugin %@ did handle text input payload: %d", (uint8_t *)&v6, 0x12u);
    }

  }
}

- (void)showLocationPlugin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;
  id v10;

  -[CKChatInputController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeSendMenuPresentationForChatInputController:", self);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IMBalloonExtensionIDWithSuffix();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pluginForExtensionIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_msgSend(v10, "presentationStyle") == 1;
    -[CKChatInputController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "sceneInterfaceOrientation");

    -[CKChatInputController showBrowserForPlugin:dataSource:style:](self, "showBrowserForPlugin:dataSource:style:", v6, 0, -[CKChatInputController presentationStyleInOrientation:inPopover:forPluginID:](self, "presentationStyleInOrientation:inPopover:forPluginID:", v9, v7, v5));
  }

}

- (void)sendMenuViewController:(id)a3 didSelectExtensionIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  _BOOL8 v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  int v29;
  _QWORD v30[4];
  id v31;

  v5 = a4;
  -[CKChatInputController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activeSendMenuPresentationForChatInputController:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  IMBalloonExtensionIDWithSuffix();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqualToString:", v8);

  if (v9)
  {
    -[CKChatInputController showFunCamera](self, "showFunCamera");
    goto LABEL_22;
  }
  IMBalloonExtensionIDWithSuffix();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v10) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isZelkovaEnabled");

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0D39A00], "sharedCoordinator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "appPayloadID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "viewControllerForPluginIdentifier:", v5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D39A00], "sharedCoordinator");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "appPayload");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v16, "setSendDelegate:", self);
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __77__CKChatInputController_sendMenuViewController_didSelectExtensionIdentifier___block_invoke;
        v30[3] = &unk_1E274A1B8;
        v31 = v5;
        objc_msgSend(v16, "handleTextInputPayload:withPayloadID:completion:", v18, v14, v30);

      }
LABEL_21:

      goto LABEL_22;
    }
  }
  else
  {

  }
  IMBalloonExtensionIDWithSuffix();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v19) & 1) == 0)
  {

    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isAudioMessagesEntryViewRecordingEnabled");

  if (!v21)
  {
LABEL_15:
    IMBalloonExtensionIDWithSuffix();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v5, "isEqualToString:", v23);

    if (v24)
    {
      -[CKChatInputController _sendLaterSelectedFromSendMenuWithPresentation:](self, "_sendLaterSelectedFromSendMenuWithPresentation:", v7);
      goto LABEL_22;
    }
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pluginForExtensionIdentifier:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v25 = objc_msgSend(v7, "presentationStyle") == 1;
      -[CKChatInputController delegate](self, "delegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "sceneInterfaceOrientation");

      v28 = -[CKChatInputController presentationStyleInOrientation:inPopover:forPluginID:](self, "presentationStyleInOrientation:inPopover:forPluginID:", v27, v25, v5);
      -[CKChatInputController showBrowserForPlugin:dataSource:style:](self, "showBrowserForPlugin:dataSource:style:", v16, 0, v28);
      v29 = IMSharedHelperDeviceIsiPad();
      if (v28 == 2)
      {
        if (v29)
          objc_msgSend(v7, "dismissAnimated:completion:", 1, 0);
      }
    }
    goto LABEL_21;
  }
  -[CKChatInputController entryView](self, "entryView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "startRecordingForAudioButtonInEntryView");

  if (objc_msgSend(v7, "presentationStyle") == 1)
    objc_msgSend(v7, "dismissAnimated:completion:", 1, 0);
LABEL_22:
  if (!objc_msgSend(v7, "presentationStyle"))
    objc_msgSend(v7, "dismissAnimated:completion:", 1, 0);

}

void __77__CKChatInputController_sendMenuViewController_didSelectExtensionIdentifier___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 1024;
      v9 = a2;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Plugin %@ did handle text input payload: %d", (uint8_t *)&v6, 0x12u);
    }

  }
}

- (void)sendMenuViewControllerRequestDismiss:(id)a3
{
  void *v4;
  id v5;

  -[CKChatInputController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeSendMenuPresentationForChatInputController:", self);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "dismissAnimated:completion:", 1, 0);
}

- (void)sendMenuViewControllerWillPerformFullScreenDismissAnimation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CKChatInputController entryView](self, "entryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endSendMenuPresentation");

  -[CKChatInputController setShouldSuppressStatusBarForSendMenu:](self, "setShouldSuppressStatusBarForSendMenu:", 0);
  -[CKChatInputController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chatInputController:willBeginFullScreenDismissAnimationForSendMenuViewController:", self, v4);

}

- (void)sendMenuDidAppear:(id)a3 presentationStyle:(int64_t)a4
{
  void *v5;
  id v6;

  -[CKChatInputController entryView](self, "entryView", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 1)
  {
    v6 = v5;
    objc_msgSend(v5, "beginSendMenuPopoverPresentation");
    goto LABEL_5;
  }
  if (!a4)
  {
    v6 = v5;
    objc_msgSend(v5, "beginSendMenuFullScreenPresentation");
LABEL_5:
    v5 = v6;
  }

}

- (void)sendMenuViewControllerDidFinishDismissAnimation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKChatInputController setShouldSuppressStatusBarForSendMenu:](self, "setShouldSuppressStatusBarForSendMenu:", 0);
  -[CKChatInputController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chatInputController:didFinishDismissAnimationForSendMenuViewController:", self, v4);

}

- (BOOL)isKeyboardSnapshotted
{
  void *v2;
  char v3;

  -[CKChatInputController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isKeyboardSnapshotted");

  return v3;
}

- (void)messageEntryViewDidExpand:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);

  -[CKChatInputController insertPayloadCompletionHandler](self, "insertPayloadCompletionHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKChatInputController insertPayloadCompletionHandler](self, "insertPayloadCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v5[2](v5, 0);

    -[CKChatInputController setInsertPayloadCompletionHandler:](self, "setInsertPayloadCompletionHandler:", 0);
  }
}

- (void)messageEntryViewInputDidTakeFocus:(id)a3
{
  if (!CKIsAppCardsEnabled())
  {
    -[CKChatInputController browserWillDismiss](self, "browserWillDismiss");
    -[CKChatInputController dismissBrowserViewController](self, "dismissBrowserViewController");
  }
}

- (void)browserWillDismiss
{
  -[CKChatInputController setBrowserPlugin:](self, "setBrowserPlugin:", 0);
  -[CKChatInputController setBrowserPluginDataSource:](self, "setBrowserPluginDataSource:", 0);
}

- (void)messageEntryViewPhotoButtonTouchDown:(id)a3
{
  id v4;

  -[CKChatInputController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chatInputControllerWillSelectFunCamera:", self);

}

- (void)messageEntryViewPhotoButtonTouchUpOutside:(id)a3
{
  id v4;

  -[CKChatInputController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chatInputControllerCancelSelectFunCamera:", self);

}

- (void)messageEntryViewPhotoButtonTouchCancel:(id)a3
{
  id v4;

  -[CKChatInputController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chatInputControllerCancelSelectFunCamera:", self);

}

- (void)messageEntryView:(id)a3 touchUpOutsidePlusButton:(id)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "chatInputControllerShouldEndDeferringSystemNavigationPopGestureForPlusButton:", self);

}

- (void)messageEntryView:(id)a3 touchCancelForPlusButton:(id)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "chatInputControllerShouldEndDeferringSystemNavigationPopGestureForPlusButton:", self);

}

- (void)messageEntryView:(id)a3 touchDragExitForPlusButton:(id)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "chatInputControllerShouldEndDeferringSystemNavigationPopGestureForPlusButton:", self);

}

- (void)messageEntryView:(id)a3 didLongPressPlusButton:(id)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "chatInputControllerShouldEndDeferringSystemNavigationPopGestureForPlusButton:", self);

  -[CKChatInputController showPhotosExtension](self, "showPhotosExtension");
}

- (BOOL)shouldLaunchPhotosAppForPlusButtonLongPressInMessageEntryView:(id)a3
{
  void *v4;
  _BOOL4 v5;
  NSObject *v6;

  IMBalloonExtensionIDWithSuffix();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CKChatInputController isShowingAppCardForExtensionIdentifier:](self, "isShowingAppCardForExtensionIdentifier:", v4);
  if (v5)
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[CKChatInputController shouldLaunchPhotosAppForPlusButtonLongPressInMessageEntryView:].cold.1();

  }
  return !v5;
}

- (void)messageEntryView:(id)a3 didSelectPlusButton:(id)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "chatInputControllerShouldEndDeferringSystemNavigationPopGestureForPlusButton:", self);

  -[CKChatInputController _presentSendMenuForAppCardContentViewController:appCardPresentationStyle:withCompletion:](self, "_presentSendMenuForAppCardContentViewController:appCardPresentationStyle:withCompletion:", 0, 0, &__block_literal_global_197_0);
}

- (void)_presentSendMenuForAppCardContentViewController:(id)a3 appCardPresentationStyle:(unint64_t)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _BOOL4 v21;
  dispatch_time_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CKDefaultSceneOverlayPresentationContext *v27;
  void *v28;
  CKDefaultSceneOverlayPresentationContext *v29;
  void *v30;
  CKSendMenuViewController *v31;
  void *v32;
  _QWORD block[5];

  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if (v11 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstResponder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKChatInputController entryView](self, "entryView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "textView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKChatInputController entryView](self, "entryView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contentView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textView");
    v19 = objc_claimAutoreleasedReturnValue();
    if ((void *)v19 == v13)
    {

    }
    else
    {
      v20 = (void *)v19;
      v21 = -[CKChatInputController keyboardIsVisible](self, "keyboardIsVisible");

      if (v21)
        -[CKChatInputController showKeyboard](self, "showKeyboard");
    }
    if (v16 == v13)
    {
      objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "firstResponder");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "resignFirstResponder");

    }
    else
    {
      v22 = dispatch_time(0, 100000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __113__CKChatInputController__presentSendMenuForAppCardContentViewController_appCardPresentationStyle_withCompletion___block_invoke;
      block[3] = &unk_1E274A208;
      block[4] = self;
      dispatch_after(v22, MEMORY[0x1E0C80D38], block);
    }

  }
  -[CKChatInputController delegate](self, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "viewControllerForChatInputModalPresentation");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = [CKDefaultSceneOverlayPresentationContext alloc];
  objc_msgSend(v26, "traitCollection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[CKDefaultSceneOverlayPresentationContext initWithChatInputController:initialTraitCollection:](v27, "initWithChatInputController:initialTraitCollection:", self, v28);

  if (v8)
  {
    +[CKSendMenuPresentationRequest requestWithPresentationContext:appCardContentViewController:resolvedAppCardPresentationStyle:completion:](CKSendMenuPresentationRequest, "requestWithPresentationContext:appCardContentViewController:resolvedAppCardPresentationStyle:completion:", v29, v8, a4, v9);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = -[CKSendMenuViewController initWithPresentationContext:]([CKSendMenuViewController alloc], "initWithPresentationContext:", v29);
    -[CKSendMenuViewController setSendMenuViewControllerDelegate:](v31, "setSendMenuViewControllerDelegate:", self);
    -[CKChatInputController setShouldSuppressStatusBarForSendMenu:](self, "setShouldSuppressStatusBarForSendMenu:", -[CKSendMenuViewController prefersStatusBarHidden](v31, "prefersStatusBarHidden"));
    +[CKSendMenuPresentationRequest requestWithPresentationContext:sendMenuViewController:completion:](CKSendMenuPresentationRequest, "requestWithPresentationContext:sendMenuViewController:completion:", v29, v31, v9);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[CKChatInputController delegate](self, "delegate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "chatInputController:requestPresentSendMenu:", self, v30);

}

void __113__CKChatInputController__presentSendMenuForAppCardContentViewController_appCardPresentationStyle_withCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "entryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v6)
  {
    objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstResponder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resignFirstResponder");

  }
}

- (BOOL)messageEntryViewShouldResignFirstResponder:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v8[0] = 67109120;
        v8[1] = -[CKChatInputController preventResignFirstResponder](self, "preventResignFirstResponder");
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "messageEntryViewShouldResignFirstResponder called: prevented? %{BOOL}d", (uint8_t *)v8, 8u);
      }

    }
    v6 = !-[CKChatInputController preventResignFirstResponder](self, "preventResignFirstResponder");
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (void)messageEntryViewBrowserButtonHit:(id)a3
{
  void *v4;
  void *v5;

  -[CKChatInputController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chatInputWillUpdateInputViewShowingBrowser");

  if (!CKIsRunningInMacCatalyst())
  {
    -[CKChatInputController browserPlugin](self, "browserPlugin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[CKChatInputController setBrowserPlugin:](self, "setBrowserPlugin:", 0);
      -[CKChatInputController setBrowserPluginDataSource:](self, "setBrowserPluginDataSource:", 0);
      -[CKChatInputController dismissBrowserViewController](self, "dismissBrowserViewController");
    }
  }
}

- (BOOL)messageEntryShouldHideCaret:(id)a3
{
  void *v3;
  BOOL v4;

  -[CKChatInputController inputViewController](self, "inputViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (int64_t)messageEntryViewHighLightInputButton:(id)a3
{
  void *v4;
  char v5;
  int64_t v6;
  void *v7;
  void *v8;

  if (!-[CKChatInputController isInputViewVisible](self, "isInputViewVisible", a3)
    && !-[CKChatInputController inputViewWillBecomeVisible](self, "inputViewWillBecomeVisible"))
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSendMenuEnabled");

  if ((v5 & 1) != 0)
    return 0;
  -[CKChatInputController browserPlugin](self, "browserPlugin");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D375E0]))
      v6 = 1;
    else
      v6 = 2;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)shouldPreventAppFromDisplayingForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  char v5;

  if (!a3)
    return 0;
  v3 = a3;
  IMSharedDowntimeController();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowedToShowAppExtensionWithBundleIdentifier:", v3);

  return v5 ^ 1;
}

- (void)didSelectPlugin:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;
  void (**v16)(_QWORD);
  void *v17;
  dispatch_time_t v18;
  _QWORD aBlock[5];
  id v20;
  unint64_t v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v6;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Entry view selected plugin: %@", buf, 0xCu);

    }
  }
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateLaunchTimeForPlugin:", v4);

  -[CKChatInputController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "sceneInterfaceOrientation");

  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.messages.browser.MorePlugin"));

  if (v11)
  {
    -[CKChatInputController dismissBrowserViewController](self, "dismissBrowserViewController");
    -[CKChatInputController browserSwitcher](self, "browserSwitcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatInputController switcherViewControllerDidSelectAppManager:shouldRestoreAppSwitcher:](self, "switcherViewControllerDidSelectAppManager:shouldRestoreAppSwitcher:", v12, 0);

  }
  else
  {
    objc_msgSend(v4, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CKChatInputController presentationStyleInOrientation:inPopover:forPluginID:](self, "presentationStyleInOrientation:inPopover:forPluginID:", v9, 0, v13);

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __41__CKChatInputController_didSelectPlugin___block_invoke;
    aBlock[3] = &unk_1E274A420;
    aBlock[4] = self;
    v15 = v4;
    v20 = v15;
    v21 = v14;
    v16 = (void (**)(_QWORD))_Block_copy(aBlock);
    buf[0] = 0;
    objc_msgSend(v15, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatInputController adjustSupportedInterfaceOrientationForPluginID:requiredPortrait:](self, "adjustSupportedInterfaceOrientationForPluginID:requiredPortrait:", v17, buf);

    if (buf[0] && (unint64_t)(v9 - 3) <= 1)
    {
      v18 = dispatch_time(0, 50000000);
      dispatch_after(v18, MEMORY[0x1E0C80D38], v16);
    }
    else
    {
      v16[2](v16);
    }

  }
}

uint64_t __41__CKChatInputController_didSelectPlugin___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showBrowserForPlugin:dataSource:style:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48));
}

- (BOOL)messageEntryViewShouldVerticallyInsetForPresentedAppCard:(id)a3
{
  void *v4;
  int v5;

  -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPresentingCard");

  return v5 && !self->_isAppCardDraggingBelowKeyboardDetent;
}

- (void)adjustSupportedInterfaceOrientationForPluginID:(id)a3 requiredPortrait:(BOOL *)a4
{
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  id v10;

  v7 = -[CKChatInputController shouldInterfaceBeRestrictedToPortraitForPluginID:](self, "shouldInterfaceBeRestrictedToPortraitForPluginID:");
  if (a3)
  {
    v8 = v7;
    if (a4)
      *a4 = v7;
    -[CKChatInputController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v8)
      objc_msgSend(v9, "updateSupportedInterfaceOrientations:", 2);
    else
      objc_msgSend(v9, "stopForcingOrientation");

  }
}

- (BOOL)shouldInterfaceBeRestrictedToPortraitForPluginID:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = *MEMORY[0x1E0D37568];
  v4 = a3;
  LOBYTE(v3) = objc_msgSend(v4, "isEqualToString:", v3);
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D37588]);

  return v3 | v5;
}

- (unint64_t)presentationStyleInOrientation:(int64_t)a3 inPopover:(BOOL)a4 forPluginID:(id)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  char v9;
  unint64_t v10;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  uint64_t v20;

  v5 = a4;
  v7 = a5;
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D37568]) & 1) != 0
    || (IMBalloonExtensionIDWithSuffix(),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "isEqualToString:", v8),
        v8,
        (v9 & 1) != 0))
  {
    v10 = 1;
  }
  else
  {
    IMBalloonExtensionIDWithSuffix();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v7, "isEqualToString:", v12);

    if ((v13 & 1) != 0)
    {
      v10 = 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "userInterfaceIdiom");

      if ((v15 & 0xFFFFFFFFFFFFFFFBLL) == 1 && v5)
      {
        objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v16, "isSendMenuEnabled") & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isAppCardsEnabled");

          v10 = v18;
        }
        else
        {

          v10 = 0;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "userInterfaceIdiom");

        v10 = (unint64_t)(a3 - 3) < 2 && (v20 & 0xFFFFFFFFFFFFFFFBLL) != 1;
      }
    }
  }

  return v10;
}

- (id)balloonPluginForIndexPath:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "item");
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleDrawerPlugins");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") <= v4)
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CKChatInputController balloonPluginForIndexPath:].cold.1();

    v7 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)messageEntryView:(id)a3 didSelectPluginAtIndex:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;

  v5 = a4;
  -[CKChatInputController balloonPluginForIndexPath:](self, "balloonPluginForIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "appBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = objc_claimAutoreleasedReturnValue();

    if (-[CKChatInputController shouldPreventAppFromDisplayingForBundleIdentifier:](self, "shouldPreventAppFromDisplayingForBundleIdentifier:", v9))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "postNotificationName:object:", CFSTR("com.apple.messages.CKScreenTimeDidEnterCurrentAppRestrictionNotification"), 0);

    }
    else
    {
      -[CKChatInputController didSelectPlugin:](self, "didSelectPlugin:", v7);
    }
  }
  else
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CKChatInputController messageEntryView:didSelectPluginAtIndex:].cold.1((uint64_t)v5, v9, v11);
  }

}

- (void)messageEntryView:(id)a3 didSelectUIStickerInEmojiPicker:(id)a4
{
  -[CKChatInputController _insertUISticker:](self, "_insertUISticker:", a4);
}

- (void)entryViewDidChangeSize
{
  id v2;

  -[CKChatInputController delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chatInputDidChangeSize");

}

- (void)openURL:(id)a3 pluginID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD *v16;
  _QWORD block[4];
  _QWORD v18[2];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[CKChatInputController switcherPluginCanMessageAPIOnBehalfOfPlugin:](self, "switcherPluginCanMessageAPIOnBehalfOfPlugin:", v9))
  {
    if (v8)
    {
      dispatch_get_global_queue(2, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__CKChatInputController_openURL_pluginID_completionHandler___block_invoke_3;
      block[3] = &unk_1E27509A0;
      v12 = (id *)v18;
      v18[0] = v8;
      v13 = v10;
      v18[1] = self;
      v19 = v13;
      dispatch_async(v11, block);

LABEL_16:
      goto LABEL_17;
    }
    if (v10)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __60__CKChatInputController_openURL_pluginID_completionHandler___block_invoke_2;
      v20[3] = &unk_1E274AED0;
      v12 = &v21;
      v21 = v10;
      v15 = MEMORY[0x1E0C80D38];
      v16 = v20;
      goto LABEL_15;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(13);
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "_openURL not allowed as we are not user interactable", buf, 2u);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
      _CKLogExternal();
    if (v10)
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __60__CKChatInputController_openURL_pluginID_completionHandler___block_invoke;
      v22[3] = &unk_1E274AED0;
      v12 = &v23;
      v23 = v10;
      v15 = MEMORY[0x1E0C80D38];
      v16 = v22;
LABEL_15:
      dispatch_async(v15, v16);
      goto LABEL_16;
    }
  }
LABEL_17:

}

uint64_t __60__CKChatInputController_openURL_pluginID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60__CKChatInputController_openURL_pluginID_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__CKChatInputController_openURL_pluginID_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__CKChatInputController_openURL_pluginID_completionHandler___block_invoke_4;
  v6[3] = &unk_1E2757F18;
  v8 = *(id *)(a1 + 48);
  v5 = *(int8x16_t *)(a1 + 32);
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  objc_msgSend(v2, "openURL:configuration:completionHandler:", v3, 0, v6);

}

void __60__CKChatInputController_openURL_pluginID_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  if (*(_QWORD *)(a1 + 48))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __60__CKChatInputController_openURL_pluginID_completionHandler___block_invoke_5;
    v5[3] = &unk_1E2751308;
    v4 = *(void **)(a1 + 40);
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    v8 = *(id *)(a1 + 48);
    v7 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __60__CKChatInputController_openURL_pluginID_completionHandler___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(13);
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v5 = _Block_copy(*(const void **)(a1 + 56));
      v6 = v5;
      v7 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138413058;
      v12 = v3;
      if (v7)
        v8 = CFSTR("YES");
      else
        v8 = CFSTR("NO");
      v13 = 2112;
      v14 = v4;
      v15 = 2112;
      v16 = v5;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "LS _openURL %@ URL %@ completionHandler %@, result %@", buf, 0x2Au);

    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
  {
    v9 = _Block_copy(*(const void **)(a1 + 56));
    _CKLogExternal();

  }
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48) != 0);
}

- (void)openURL:(id)a3 applicationIdentifier:(id)a4 pluginID:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init((Class)MEMORY[0x193FF3C18](CFSTR("FBSOpenApplicationService"), CFSTR("FrontBoardServices")));
  -[CKChatInputController _openContainingBundleID:applicationService:withURL:pluginID:completionHandler:](self, "_openContainingBundleID:applicationService:withURL:pluginID:completionHandler:", v12, v14, v13, v11, v10);

}

- (void)_openContainingBundleID:(id)a3 applicationService:(id)a4 withURL:(id)a5 pluginID:(id)a6 completionHandler:(id)a7
{
  CKChatInputController *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  int v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void **v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  CKChatInputController *v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD block[4];
  id v38;
  uint8_t buf[4];
  CKChatInputController *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v12 = (CKChatInputController *)a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = -[CKChatInputController switcherPluginCanMessageAPIOnBehalfOfPlugin:](self, "switcherPluginCanMessageAPIOnBehalfOfPlugin:", v15);
  v18 = IMOSLoggingEnabled();
  if (v17)
  {
    if (v18)
    {
      CKLogCStringForType(13);
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = _Block_copy(v16);
        *(_DWORD *)buf = 138412802;
        v40 = self;
        v41 = 2112;
        v42 = v14;
        v43 = 2112;
        v44 = v20;
        _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "_openURL %@ URL %@ completionHandler %@", buf, 0x20u);

      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
    {
      v29 = _Block_copy(v16);
      _CKLogExternal();

    }
    if (v14)
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(13);
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v40 = v12;
          _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "_openURL containingBundleID: %@", buf, 0xCu);
        }

      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
        _CKLogExternal();
      v22 = _openContainingBundleID_applicationService_withURL_pluginID_completionHandler____FBSOpenApplicationOptionKeyPayloadURL;
      if (!_openContainingBundleID_applicationService_withURL_pluginID_completionHandler____FBSOpenApplicationOptionKeyPayloadURL)
      {
        v23 = (void **)MEMORY[0x193FF3C24]("FBSOpenApplicationOptionKeyPayloadURL", CFSTR("FrontBoardServices"));
        if (v23)
          v24 = *v23;
        else
          v24 = 0;
        objc_storeStrong((id *)&_openContainingBundleID_applicationService_withURL_pluginID_completionHandler____FBSOpenApplicationOptionKeyPayloadURL, v24);
        v22 = _openContainingBundleID_applicationService_withURL_pluginID_completionHandler____FBSOpenApplicationOptionKeyPayloadURL;
      }
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v14, v22, 0, v29);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (__FBSOpenApplicationOptionsClass_onceToken != -1)
        dispatch_once(&__FBSOpenApplicationOptionsClass_onceToken, &__block_literal_global_1262_1);
      objc_msgSend(objc_retainAutorelease((id)__FBSOpenApplicationOptionsClass__optionsClass), "optionsWithDictionary:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __103__CKChatInputController__openContainingBundleID_applicationService_withURL_pluginID_completionHandler___block_invoke_220;
      v30[3] = &unk_1E2757F40;
      v31 = v14;
      v32 = v12;
      v33 = v27;
      v34 = v16;
      v26 = v27;
      objc_msgSend(v13, "openApplication:withOptions:completion:", v32, v28, v30);

    }
    else
    {
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __103__CKChatInputController__openContainingBundleID_applicationService_withURL_pluginID_completionHandler___block_invoke_214;
      v35[3] = &unk_1E274AED0;
      v36 = v16;
      dispatch_async(MEMORY[0x1E0C80D38], v35);
      v26 = v36;
    }
    goto LABEL_35;
  }
  if (v18)
  {
    CKLogCStringForType(13);
    OSLogHandleForIMFoundationCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "_openURL not allowed as we are not user interactable", buf, 2u);
    }

  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
    _CKLogExternal();
  if (v16)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __103__CKChatInputController__openContainingBundleID_applicationService_withURL_pluginID_completionHandler___block_invoke;
    block[3] = &unk_1E274AED0;
    v38 = v16;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v26 = v38;
LABEL_35:

  }
}

uint64_t __103__CKChatInputController__openContainingBundleID_applicationService_withURL_pluginID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __103__CKChatInputController__openContainingBundleID_applicationService_withURL_pluginID_completionHandler___block_invoke_214(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __103__CKChatInputController__openContainingBundleID_applicationService_withURL_pluginID_completionHandler___block_invoke_220(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD block[4];
  id v12;
  BOOL v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(13);
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = *(_QWORD *)(a1 + 32);
        v9 = *(_QWORD *)(a1 + 40);
        v10 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138413058;
        v15 = v8;
        v16 = 2112;
        v17 = v9;
        v18 = 2112;
        v19 = v10;
        v20 = 2112;
        v21 = v6;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "_openURL error when trying to openURL %@ with bundle ID %@ options dict %@ error %@", buf, 0x2Au);
      }

    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
      _CKLogExternal();
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__CKChatInputController__openContainingBundleID_applicationService_withURL_pluginID_completionHandler___block_invoke_223;
  block[3] = &unk_1E274C610;
  v12 = *(id *)(a1 + 56);
  v13 = v6 == 0;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __103__CKChatInputController__openContainingBundleID_applicationService_withURL_pluginID_completionHandler___block_invoke_223(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  return result;
}

- (void)commitPayload:(id)a3
{
  -[CKChatInputController commitPayload:forPlugin:allowAllCommits:completionHandler:](self, "commitPayload:forPlugin:allowAllCommits:completionHandler:", a3, &stru_1E276D870, 1, &__block_literal_global_226_2);
}

- (BOOL)commitPayloadBypassingValidation:(id)a3 forPlugin:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setUseDirectSend:", 1);
  objc_msgSend(v6, "pluginBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    objc_msgSend(v6, "setPluginBundleID:", v7);
  -[CKChatInputController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_deferredCommitPayload_, v6, 0.1);

  return 1;
}

- (void)checkForTouchInRemoteProcessIfNecessaryWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "checkForTouchInExtensionWithCompletion:", v4);

}

- (void)deferredCommitPayload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD aBlock[5];
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setIsFromMe:", 1);
  if (objc_msgSend(v4, "isUpdate"))
  {
    -[CKChatInputController browserPluginDataSource](self, "browserPluginDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "datasource");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (void *)v6;
    else
      v8 = v5;
    objc_msgSend(v4, "setDatasource:", v8);

    objc_msgSend(v4, "messageGUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v4, "setMessageGUID:", v9);
    }
    else
    {
      objc_msgSend(v5, "messageGUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setMessageGUID:", v10);

    }
  }
  v11 = -[CKChatInputController handwritingIsDisplayed](self, "handwritingIsDisplayed");
  -[CKChatInputController handwritingPresentationController](self, "handwritingPresentationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[CKChatInputController handwritingPresentationController](self, "handwritingPresentationController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setVisible:animated:", 0, 1);

  }
  if (v4
    && (objc_msgSend(v4, "pluginBundleID"), v14 = (void *)objc_claimAutoreleasedReturnValue(), v14, v14))
  {
    if (objc_msgSend(v4, "shouldExpire"))
      v15 = +[CKComposition newExpirableCompositionWithText:subject:shelfPluginPayload:](CKComposition, "newExpirableCompositionWithText:subject:shelfPluginPayload:", 0, 0, v4);
    else
      v15 = 0;
    v18 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__CKChatInputController_deferredCommitPayload___block_invoke;
    aBlock[3] = &unk_1E274D9E8;
    aBlock[4] = self;
    v19 = v4;
    v26 = v19;
    v20 = _Block_copy(aBlock);
    v21 = v20;
    if (v15)
    {
      v22[0] = v18;
      v22[1] = 3221225472;
      v22[2] = __47__CKChatInputController_deferredCommitPayload___block_invoke_2;
      v22[3] = &unk_1E274DA38;
      v24 = v20;
      v23 = v15;
      dispatch_async(MEMORY[0x1E0C80D38], v22);

    }
    else
    {
      +[CKComposition compositionWithShelfPluginPayload:completionHandler:](CKComposition, "compositionWithShelfPluginPayload:completionHandler:", v19, v20);
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        -[CKChatInputController pluginBundleID](self, "pluginBundleID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v28 = v17;
        _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Attempting to commit nil payload or payload with no identifier; current visible plugin is %@",
          buf,
          0xCu);

      }
    }
    if (v11)
      -[CKChatInputController dismissBrowserViewController](self, "dismissBrowserViewController");
  }

}

void __47__CKChatInputController_deferredCommitPayload___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = a2;
    objc_msgSend(v3, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "chatInputSentComposition:", v4);

  }
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "pluginBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateInteractionTimeForPlugin:", v6);

}

uint64_t __47__CKChatInputController_deferredCommitPayload___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (id)_stickerPickerPlugin
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;

  IMStickersExtensionIdentifier();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IMBalloonExtensionIDWithSuffix();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadExtensionWithIdentifierIfNeeded:", v3);

  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "balloonPluginForBundleID:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CKChatInputController _stickerPickerPlugin].cold.2();

  }
  IMLogHandleForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CKChatInputController _stickerPickerPlugin].cold.1();

  return v6;
}

- (void)dismissStickerPickerPreservingChatItem:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  dispatch_time_t v12;
  dispatch_block_t block;

  v4 = a3;
  block = a4;
  -[CKChatInputController stickerPickerMessagePartChatItem](self, "stickerPickerMessagePartChatItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (!v4)
    {
      -[CKChatInputController setStickerPickerMessagePartChatItem:](self, "setStickerPickerMessagePartChatItem:", 0);
      -[CKChatInputController setStickerPickerMessagePartParentChatItem:](self, "setStickerPickerMessagePartParentChatItem:", 0);
      -[CKChatInputController endStickerReactionSession](self, "endStickerReactionSession");
    }
    if (CKIsAppCardsEnabled())
    {
      -[CKChatInputController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "viewControllerForChatInputModalPresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, block);

      -[CKChatInputController forceDismissBrowserWithoutAnimation](self, "forceDismissBrowserWithoutAnimation");
    }
    else
    {
      -[CKChatInputController dismissBrowserViewController](self, "dismissBrowserViewController");
      -[CKChatInputController entryView](self, "entryView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "resignFirstResponder");

      if (block)
      {
        v12 = dispatch_time(0, 300000000);
        dispatch_after(v12, MEMORY[0x1E0C80D38], block);
      }
    }
    -[CKChatInputController setBrowserPlugin:](self, "setBrowserPlugin:", 0);
    -[CKChatInputController stickerPickerWasHiddenPreservingChatItem:](self, "stickerPickerWasHiddenPreservingChatItem:", v4);
  }

}

- (BOOL)isPresentingStickerPicker
{
  void *v2;
  BOOL v3;

  -[CKChatInputController stickerPickerMessagePartChatItem](self, "stickerPickerMessagePartChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)stickerPickerWasHidden
{
  -[CKChatInputController stickerPickerWasHiddenPreservingChatItem:](self, "stickerPickerWasHiddenPreservingChatItem:", 0);
}

- (void)stickerPickerWasHiddenPreservingChatItem:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  -[CKChatInputController stickerPickerMessagePartChatItem](self, "stickerPickerMessagePartChatItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKChatInputController stickerPickerMessagePartChatItem](self, "stickerPickerMessagePartChatItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3)
    {
      -[CKChatInputController setStickerPickerMessagePartChatItem:](self, "setStickerPickerMessagePartChatItem:", 0);
      -[CKChatInputController setStickerPickerMessagePartParentChatItem:](self, "setStickerPickerMessagePartParentChatItem:", 0);
      -[CKChatInputController endStickerReactionSession](self, "endStickerReactionSession");
    }
    -[CKChatInputController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chatInputController:didPresentStickerPickerForChatItem:", self, v6);

    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CKChatInputController stickerPickerWasHiddenPreservingChatItem:].cold.1();

  }
}

- (void)commitStickerBypassingValidation:(id)a3 forPlugin:(id)a4 stickerFrame:(CGRect)a5
{
  -[CKChatInputController commitSticker:forPlugin:bypassValidation:stickerFrame:](self, "commitSticker:forPlugin:bypassValidation:stickerFrame:", a3, a4, 1, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (void)commitSticker:(id)a3 forPlugin:(id)a4 stickerFrame:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v12 = a3;
  -[CKChatInputController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "viewControllerForChatInputModalPresentation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentedViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "view");
  v29 = (id)objc_claimAutoreleasedReturnValue();

  -[CKChatInputController delegate](self, "delegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "viewControllerForChatInputModalPresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "window");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "coordinateSpace");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "convertRect:toCoordinateSpace:", v20, x, y, width, height);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  -[CKChatInputController commitSticker:forPlugin:bypassValidation:stickerFrame:](self, "commitSticker:forPlugin:bypassValidation:stickerFrame:", v12, v11, 0, v22, v24, v26, v28);
}

- (void)commitSticker:(id)a3 forPlugin:(id)a4 bypassValidation:(BOOL)a5 stickerFrame:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  int v26;
  id v27;
  uint64_t v28;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v28 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  -[CKChatInputController delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) == 0
    || (-[CKChatInputController delegate](self, "delegate"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "commitStickerAsTapback:", v13),
        v17,
        !v18))
  {
    -[CKChatInputController stickerReactionSession](self, "stickerReactionSession");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      -[CKChatInputController delegate](self, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKChatInputController stickerPickerMessagePartChatItem](self, "stickerPickerMessagePartChatItem");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKChatInputController stickerPickerMessagePartParentChatItem](self, "stickerPickerMessagePartParentChatItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "sendAutomaticallyPlacedSticker:stickerReactionSession:forChatItem:forParentChatItem:stickerFrame:animationCompletionHandler:", v13, v20, v22, v23, 0, x, y, width, height);

    }
    else
    {
      if (!a5
        && !-[CKChatInputController switcherPluginCanMessageAPIOnBehalfOfPlugin:](self, "switcherPluginCanMessageAPIOnBehalfOfPlugin:", v14))
      {
        IMBalloonExtensionIDWithSuffix();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v14, "isEqualToString:", v24);

        if (!v25)
          goto LABEL_13;
      }
      -[CKChatInputController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__deferredCommitSticker_, v13, 0.1);
      +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "updateInteractionTimeForPlugin:", v14);
    }

LABEL_13:
    goto LABEL_14;
  }
  IMLogHandleForCategory();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v26 = 138412290;
    v27 = v13;
    _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "Committed sticker as tapback: %@", (uint8_t *)&v26, 0xCu);
  }

LABEL_14:
}

- (void)commitSticker:(id)a3 stickerFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  id v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  -[CKChatInputController browserPlugin](self, "browserPlugin");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "updateInteractionTimeForPlugin:", v12);

  -[CKChatInputController commitSticker:forPlugin:stickerFrame:](self, "commitSticker:forPlugin:stickerFrame:", v9, 0, x, y, width, height);
}

- (void)_deferredCommitSticker:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Deferred Committing sticker: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trackEvent:", *MEMORY[0x1E0D389E0]);

  objc_msgSend(v4, "uiSticker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatInputController _insertUISticker:](self, "_insertUISticker:", v7);

}

- (void)_insertUISticker:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "_ck_plainStringEmojiText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Handling sticker app sticker insertion as plain string system emoji text", buf, 2u);
    }

    -[CKChatInputController entryView](self, "entryView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "insertText:", v5);
  }
  else
  {
    -[CKChatInputController targetConversation](self, "targetConversation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "supportsInlineAdaptiveImageGlyphs");

    v12 = objc_msgSend(v4, "_ck_shouldInsertInCompositionAsAdaptiveImageGlyph");
    IMLogHandleForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
    if (v11 && v12)
    {
      if (v14)
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Handling sticker app sticker insertion as adaptive image glyph", v18, 2u);
      }

      -[CKChatInputController insertUIStickerAsAdaptiveImageGlyph:](self, "insertUIStickerAsAdaptiveImageGlyph:", v4);
    }
    else
    {
      if (v14)
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Handling sticker app sticker insertion as sticker added to shelf", v17, 2u);
      }

      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39B18]), "initWithUISticker:adaptiveImageGlyph:", v4, 0);
      +[CKBrowserItemPayload browserItemFromSticker:](CKBrowserItemPayload, "browserItemFromSticker:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKChatInputController startEditingPayload:](self, "startEditingPayload:", v16);

    }
  }

}

- (void)commitSticker:(id)a3 withDragTarget:(id)a4 draggedSticker:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  IMLogHandleForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v9, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412546;
    v21 = v8;
    v22 = 2112;
    v23 = v12;
    _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Committing sticker: %@, for drag target: %@", (uint8_t *)&v20, 0x16u);

  }
  -[CKChatInputController stickerReactionSession](self, "stickerReactionSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "didSendSticker");

  if ((v14 & 1) == 0)
  {
    -[CKChatInputController browserPlugin](self, "browserPlugin");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateInteractionTimeForPlugin:", v16);

    -[CKChatInputController delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sendSticker:withDragTarget:draggedSticker:", v8, v9, v10);

    -[CKChatInputController stickerReactionSession](self, "stickerReactionSession");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[CKChatInputController endStickerReactionSession](self, "endStickerReactionSession");
      -[CKChatInputController dismissStickerPickerPreservingChatItem:completion:](self, "dismissStickerPickerPreservingChatItem:completion:", 0, 0);
    }

  }
}

- (void)stickerDropAnimationFinished
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (-[CKChatInputController didDismissAppCardForStickerDrag](self, "didDismissAppCardForStickerDrag"))
  {
    -[CKChatInputController setDidDismissAppCardForStickerDrag:](self, "setDidDismissAppCardForStickerDrag:", 0);
    -[CKChatInputController pluginToResumeForStickerDrag](self, "pluginToResumeForStickerDrag");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      IMStickersExtensionIdentifier();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      IMBalloonExtensionIDWithSuffix();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pluginForIdentifier:", v5);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[CKChatInputController setPluginToResumeForStickerDrag:](self, "setPluginToResumeForStickerDrag:", 0);
    -[CKChatInputController showBrowserForPlugin:dataSource:style:](self, "showBrowserForPlugin:dataSource:style:", v12, 0, -[CKChatInputController savedStyleForDragCompletion](self, "savedStyleForDragCompletion"));
    -[CKChatInputController setSavedStyleForDragCompletion:](self, "setSavedStyleForDragCompletion:", 0);
    goto LABEL_8;
  }
  -[CKChatInputController currentPresentationConfig](self, "currentPresentationConfig");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[CKChatInputController stickerReactionSession](self, "stickerReactionSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      IMStickersExtensionIdentifier();
      v12 = (id)objc_claimAutoreleasedReturnValue();
      IMBalloonExtensionIDWithSuffix();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKChatInputController currentPresentationConfig](self, "currentPresentationConfig");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sourceView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKChatInputController showPluginWithExtensionIdentifier:sourceView:](self, "showPluginWithExtensionIdentifier:sourceView:", v9, v11);

LABEL_8:
    }
  }
}

- (void)commitSticker:(id)a3 atScreenCoordinate:(CGPoint)a4 scale:(double)a5 rotation:(double)a6 stickerFrame:(CGRect)a7
{
  double y;
  double x;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  uint64_t v28;
  NSPoint v29;

  y = a4.y;
  x = a4.x;
  v28 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  IMLogHandleForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v29.x = x;
    v29.y = y;
    NSStringFromPoint(v29);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138413058;
    v21 = v12;
    v22 = 2112;
    v23 = v14;
    v24 = 2048;
    v25 = a5;
    v26 = 2048;
    v27 = a6;
    _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Committing sticker %@ at screen coordinate: %@, scale: %f, rotation: %f", (uint8_t *)&v20, 0x2Au);

  }
  +[CKBrowserDragControllerTarget targetWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:associatedLayoutIntent:](CKBrowserDragControllerTarget, "targetWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:associatedLayoutIntent:", 0, x, y, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), a5, 0.4, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatInputController browserPlugin](self, "browserPlugin");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updateInteractionTimeForPlugin:", v17);

  -[CKChatInputController delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sendSticker:withDragTarget:draggedSticker:", v12, v15, 0);

  -[CKChatInputController dismissStickerPickerPreservingChatItem:completion:](self, "dismissStickerPickerPreservingChatItem:completion:", 0, 0);
}

- (id)dragControllerTranscriptDelegate
{
  void *v2;
  void *v3;

  -[CKChatInputController delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dragControllerTranscriptDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dismissToKeyboard:(BOOL)a3
{
  -[CKChatInputController dismissAndReloadInputViews:](self, "dismissAndReloadInputViews:", 0);
}

- (void)dismiss
{
  -[CKChatInputController dismissAndReloadInputViews:](self, "dismissAndReloadInputViews:", 0);
}

- (void)dismissAndReloadInputViews:(BOOL)a3
{
  -[CKChatInputController dismissAndReloadInputViews:forPlugin:](self, "dismissAndReloadInputViews:forPlugin:", a3, 0);
}

- (void)dismissAndReloadInputViews:(BOOL)a3 forPlugin:(id)a4
{
  id v6;
  dispatch_time_t v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  v7 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__CKChatInputController_dismissAndReloadInputViews_forPlugin___block_invoke;
  block[3] = &unk_1E274E150;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_after(v7, MEMORY[0x1E0C80D38], block);

}

void __62__CKChatInputController_dismissAndReloadInputViews_forPlugin___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  _BYTE *v10;
  id v11;

  v2 = *(unsigned __int8 *)(a1 + 48);
  if ((objc_msgSend(*(id *)(a1 + 32), "currentPluginIsDT") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "handwritingIsDisplayed") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "appStoreIsDisplayed") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "appManagerIsDisplayed"))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2 != 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_deferredDismissToKeyboardAndFocusEntryView:", v4);

    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stopForcingOrientation");
LABEL_6:

    return;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "switcherPluginCanMessageAPIOnBehalfOfPlugin:", *(_QWORD *)(a1 + 40)) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 32), "appModalIsDisplayed") & 1) != 0)
  {
    v5 = 1;
    if (v2)
      goto LABEL_10;
LABEL_13:
    v7 = 0;
    if (!v5)
      return;
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "appCardPresentationOverseer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "isPresentingCard");

  if (!v2)
    goto LABEL_13;
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "appCardPresentationOverseer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldAnimateDismissal") ^ 1;

  if (!v5)
    return;
LABEL_14:
  v9 = objc_msgSend(*(id *)(a1 + 32), "isDisplayingReplaceCompositionAlert");
  v10 = *(_BYTE **)(a1 + 32);
  if ((v9 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "performSelector:withObject:afterDelay:", sel__deferredDismissToKeyboardAndFocusEntryView_, v11, 0.1);
    goto LABEL_6;
  }
  v10[19] = 1;
}

- (void)dismissOrHideHandwritingBrowser
{
  void *v3;
  id v4;

  -[CKChatInputController handwritingPresentationController](self, "handwritingPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKChatInputController handwritingPresentationController](self, "handwritingPresentationController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setVisible:animated:", 0, 1);

  }
  else
  {
    -[CKChatInputController dismissBrowserViewController](self, "dismissBrowserViewController");
  }
}

- (void)_deferredDismissToKeyboardAndFocusEntryView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  int isKindOfClass;
  _QWORD v31[5];
  _QWORD v32[10];
  _QWORD v33[5];

  v4 = a3;
  if (-[CKChatInputController isDisplayingReplaceCompositionAlert](self, "isDisplayingReplaceCompositionAlert"))
  {
    self->_dismissPluginAfterReplaceAlertInteractedWith = 1;
    goto LABEL_31;
  }
  -[CKChatInputController setIsDisplayingReplaceCompositionAlert:](self, "setIsDisplayingReplaceCompositionAlert:", 0);
  -[CKChatInputController handwritingPresentationController](self, "handwritingPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKChatInputController handwritingPresentationController](self, "handwritingPresentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setVisible:animated:", 0, 1);

  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v9 = 1;
  }
  else
  {
    -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "shouldAnimateDismissal");

  }
  v11 = objc_msgSend(v4, "BOOLValue");
  if ((v11 & 1) != 0 || -[CKChatInputController appManagerIsDisplayed](self, "appManagerIsDisplayed"))
  {
    -[CKChatInputController entryView](self, "entryView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clearAppStripSelection");

  }
  if (-[CKChatInputController appManagerIsDisplayed](self, "appManagerIsDisplayed"))
  {
    -[CKChatInputController setStatusBarStyleViewController:](self, "setStatusBarStyleViewController:", 0);
    -[CKChatInputController setBrowserPlugin:](self, "setBrowserPlugin:", 0);
    if (-[CKChatInputController shouldRestoreAppSwitcher](self, "shouldRestoreAppSwitcher"))
    {
      -[CKChatInputController setInputViewVisible:entryFieldCollapsed:animated:](self, "setInputViewVisible:entryFieldCollapsed:animated:", 1, 1, 0);
      -[CKChatInputController setShouldRestoreAppSwitcher:](self, "setShouldRestoreAppSwitcher:", 0);
    }
    -[CKChatInputController entryView](self, "entryView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 0);

    -[CKChatInputController entryView](self, "entryView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAlpha:", 1.0);

    -[CKChatInputController delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "viewControllerForChatInputModalPresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "presentedViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __69__CKChatInputController__deferredDismissToKeyboardAndFocusEntryView___block_invoke;
      v33[3] = &unk_1E274A208;
      v33[4] = self;
      objc_msgSend(v16, "dismissViewControllerAnimated:completion:", 1, v33);
    }
    if ((_DWORD)v11)
    {
      objc_msgSend(v16, "becomeFirstResponder");
      objc_msgSend(v16, "reloadInputViews");
    }
    goto LABEL_28;
  }
  if (-[CKChatInputController appModalIsDisplayed](self, "appModalIsDisplayed"))
  {
    self->_isDismissingAppModal = 1;
    -[CKChatInputController browserSwitcher](self, "browserSwitcher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "transitionCoordinator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_DWORD)v11)
    {
      -[CKChatInputController setInputViewVisible:](self, "setInputViewVisible:", 0);
      -[CKChatInputController setBrowserSwitcher:](self, "setBrowserSwitcher:", 0);
      -[CKChatInputController setSwitcherInputViewController:](self, "setSwitcherInputViewController:", 0);
      -[CKChatInputController setCurrentInputViewController:](self, "setCurrentInputViewController:", 0);
      v32[5] = MEMORY[0x1E0C809B0];
      v32[6] = 3221225472;
      v32[7] = __69__CKChatInputController__deferredDismissToKeyboardAndFocusEntryView___block_invoke_2;
      v32[8] = &unk_1E274A208;
      v32[9] = self;
      im_dispatch_after();
    }
    else
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __69__CKChatInputController__deferredDismissToKeyboardAndFocusEntryView___block_invoke_3;
      v32[3] = &unk_1E274A208;
      v32[4] = self;
      objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v32);
    }
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __69__CKChatInputController__deferredDismissToKeyboardAndFocusEntryView___block_invoke_4;
    v31[3] = &unk_1E274A208;
    v31[4] = self;
    objc_msgSend(v16, "dismissCurrentFullScreenModalAnimated:completion:", 1, v31);
LABEL_28:

    goto LABEL_29;
  }
  if (-[CKChatInputController _isAppBrowserFullScreen](self, "_isAppBrowserFullScreen"))
  {
    if ((_DWORD)v11)
      im_dispatch_after();
    if (CKIsAppCardsEnabled())
    {
      -[CKChatInputController _dismissAppCardIfNecessaryAnimatedAndResetFirstResponderPrevention:overrideExceptions:focusEntryView:](self, "_dismissAppCardIfNecessaryAnimatedAndResetFirstResponderPrevention:overrideExceptions:focusEntryView:", v9, 1, v11);
      goto LABEL_29;
    }
    -[CKChatInputController browserSwitcher](self, "browserSwitcher");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dismissBrowserFullscreenAnimated:withCompletion:", 1, 0);
    goto LABEL_48;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "canPresentOverKeyboard"))
  {
    v20 = -[CKChatInputController isInputViewVisible](self, "isInputViewVisible");

    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CEA6C8], "sizeForInterfaceOrientation:ignoreInputView:", CKNonFlatDeviceOrientation(), 1);
      v22 = v21;
      -[CKChatInputController delegate](self, "delegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "chatInputWillChangeHeightForCompactPresentation:", v22);

      -[CKChatInputController _dismissCompactSwitcherOverKeyboardWithCompletion:](self, "_dismissCompactSwitcherOverKeyboardWithCompletion:", 0);
      goto LABEL_29;
    }
  }
  else
  {

  }
  -[CKChatInputController setInputViewVisible:](self, "setInputViewVisible:", 0);
  -[CKChatInputController setBrowserSwitcher:](self, "setBrowserSwitcher:", 0);
  -[CKChatInputController setSwitcherInputViewController:](self, "setSwitcherInputViewController:", 0);
  -[CKChatInputController setCurrentInputViewController:](self, "setCurrentInputViewController:", 0);
  -[CKChatInputController setBrowserPlugin:](self, "setBrowserPlugin:", 0);
  -[CKChatInputController setBrowserPluginDataSource:](self, "setBrowserPluginDataSource:", 0);
  if (CKIsAppCardsEnabled())
    -[CKChatInputController _dismissAppCardIfNecessaryAnimatedAndResetFirstResponderPrevention:overrideExceptions:focusEntryView:](self, "_dismissAppCardIfNecessaryAnimatedAndResetFirstResponderPrevention:overrideExceptions:focusEntryView:", v9, 1, v11);
  if (!CKIsRunningInMacCatalyst())
    goto LABEL_29;
  -[CKChatInputController delegate](self, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "viewControllerForChatInputModalPresentation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v26 = objc_msgSend(v24, "isModal") ^ 1;
  else
    v26 = 1;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEmojiTapbacksEnabled");

  if (v28)
  {
    objc_msgSend(v24, "presentedViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((v26 & ~isKindOfClass & 1) == 0)
      goto LABEL_48;
    goto LABEL_47;
  }
  if (v26)
LABEL_47:
    objc_msgSend(v24, "dismissViewControllerAnimated:completion:", 1, 0);
LABEL_48:

LABEL_29:
  if (-[CKChatInputController isPresentingStickerPicker](self, "isPresentingStickerPicker"))
    -[CKChatInputController dismissStickerPickerPreservingChatItem:completion:](self, "dismissStickerPickerPreservingChatItem:completion:", 0, 0);
LABEL_31:

}

uint64_t __69__CKChatInputController__deferredDismissToKeyboardAndFocusEntryView___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBrowserPluginDataSource:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setPresentedBrowserNavigationController:", 0);
}

void __69__CKChatInputController__deferredDismissToKeyboardAndFocusEntryView___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chatInputControllerRequestInputViewFocusFromFullscreen:", *(_QWORD *)(a1 + 32));

}

uint64_t __69__CKChatInputController__deferredDismissToKeyboardAndFocusEntryView___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  if (objc_msgSend(*(id *)(a1 + 32), "isInputViewVisible"))
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "switcherInputViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setCurrentInputViewController:", v3);

    objc_msgSend(*(id *)(a1 + 32), "entryView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setKeyboardVisible:", 1);

  }
  objc_msgSend(*(id *)(a1 + 32), "entryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pluginEntryViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 == 0;

  return objc_msgSend(*(id *)(a1 + 32), "setInputViewVisible:entryFieldCollapsed:animated:", objc_msgSend(*(id *)(a1 + 32), "isInputViewVisible"), v8, 1);
}

void __69__CKChatInputController__deferredDismissToKeyboardAndFocusEntryView___block_invoke_4(uint64_t a1)
{
  void *v2;
  CKTranscriptPluginPresentationConfiguration *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CKTranscriptPluginPresentationConfiguration *v8;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 0;
  objc_msgSend(*(id *)(a1 + 32), "macBrowserViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = [CKTranscriptPluginPresentationConfiguration alloc];
    objc_msgSend(*(id *)(a1 + 32), "entryView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendMenuSourceView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CKTranscriptPluginPresentationConfiguration initWithSourceView:permittedArrowDirections:shouldDisableSnapshotView:](v3, "initWithSourceView:permittedArrowDirections:shouldDisableSnapshotView:", v5, 8, 0);

    v6 = *(void **)(a1 + 32);
    objc_msgSend(v6, "macBrowserViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "showExpandedBrowserPopover:presentationConfiguration:", v7, v8);

    objc_msgSend(*(id *)(a1 + 32), "setMacBrowserViewController:", 0);
  }
}

void __69__CKChatInputController__deferredDismissToKeyboardAndFocusEntryView___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chatInputControllerRequestInputViewFocusFromFullscreen:", *(_QWORD *)(a1 + 32));

}

- (void)_dismissAppCardIfNecessaryAnimatedAndResetFirstResponderPrevention:(BOOL)a3 focusEntryView:(BOOL)a4
{
  -[CKChatInputController _dismissAppCardIfNecessaryAnimatedAndResetFirstResponderPrevention:overrideExceptions:focusEntryView:](self, "_dismissAppCardIfNecessaryAnimatedAndResetFirstResponderPrevention:overrideExceptions:focusEntryView:", a3, 0, a4);
}

- (void)_dismissAppCardIfNecessaryAnimatedAndResetFirstResponderPrevention:(BOOL)a3 overrideExceptions:(BOOL)a4 focusEntryView:(BOOL)a5
{
  void *v9;
  int v10;
  dispatch_time_t v11;
  id v12;
  _QWORD block[5];
  BOOL v14;
  BOOL v15;
  BOOL v16;

  -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isPresentingCard");

  if (v10)
  {
    v11 = dispatch_time(0, 150000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __126__CKChatInputController__dismissAppCardIfNecessaryAnimatedAndResetFirstResponderPrevention_overrideExceptions_focusEntryView___block_invoke;
    block[3] = &unk_1E2757F68;
    block[4] = self;
    v14 = a3;
    v15 = a5;
    v16 = a4;
    dispatch_after(v11, MEMORY[0x1E0C80D38], block);
  }
  else if (-[CKChatInputController _isAppBrowserFullScreen](self, "_isAppBrowserFullScreen"))
  {
    -[CKChatInputController browserSwitcher](self, "browserSwitcher");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dismissBrowserFullscreenAnimated:withCompletion:", 1, 0);

  }
}

uint64_t __126__CKChatInputController__dismissAppCardIfNecessaryAnimatedAndResetFirstResponderPrevention_overrideExceptions_focusEntryView___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = objc_msgSend(*(id *)(a1 + 32), "preventResignFirstResponder");
  objc_msgSend(*(id *)(a1 + 32), "setPreventResignFirstResponder:", 1);
  objc_msgSend(*(id *)(a1 + 32), "dismissAppCardIfNecessaryAnimated:isFocusingKeyboard:overrideExceptions:completion:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41), *(unsigned __int8 *)(a1 + 42), 0);
  return objc_msgSend(*(id *)(a1 + 32), "setPreventResignFirstResponder:", v2);
}

- (void)forceDismissBrowserWithoutAnimation
{
  -[CKChatInputController setInputViewVisible:](self, "setInputViewVisible:", 0);
  -[CKChatInputController setBrowserSwitcher:](self, "setBrowserSwitcher:", 0);
  -[CKChatInputController setSwitcherInputViewController:](self, "setSwitcherInputViewController:", 0);
  -[CKChatInputController setCurrentInputViewController:](self, "setCurrentInputViewController:", 0);
  if (-[CKChatInputController isPresentingStickerPicker](self, "isPresentingStickerPicker"))
    -[CKChatInputController stickerPickerWasHiddenPreservingChatItem:](self, "stickerPickerWasHiddenPreservingChatItem:", 1);
}

- (void)requestPresentationStyleExpanded:(BOOL)a3
{
  -[CKChatInputController requestPresentationStyleExpanded:forPlugin:](self, "requestPresentationStyleExpanded:forPlugin:", a3, 0);
}

- (void)stickerDruidDragStarted
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[CKChatInputController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeSendMenuPresentationForChatInputController:", self);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[CKChatInputController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForChatInputModalPresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v17, "dismissAnimated:completion:", 1, 0);
    goto LABEL_12;
  }
  -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isPresentingCard") & 1) != 0)
  {
    objc_msgSend(v5, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "verticalSizeClass");

    if (v8 == 1)
    {
      -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      v11 = &__block_literal_global_241_0;
LABEL_9:
      objc_msgSend(v9, "dismissCardAnimated:completion:", 1, v11);

      goto LABEL_12;
    }
  }
  else
  {

  }
  -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isExpanded");

  if (v13)
  {
    -[CKChatInputController setDidDismissAppCardForStickerDrag:](self, "setDidDismissAppCardForStickerDrag:", 1);
    -[CKChatInputController browserPlugin](self, "browserPlugin");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatInputController setPluginToResumeForStickerDrag:](self, "setPluginToResumeForStickerDrag:", v14);

    -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatInputController setSavedStyleForDragCompletion:](self, "setSavedStyleForDragCompletion:", objc_msgSend(v15, "isExpanded"));

    -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = &__block_literal_global_242_1;
    goto LABEL_9;
  }
  -[CKChatInputController stickerReactionSession](self, "stickerReactionSession");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    -[CKChatInputController dismissStickerPickerPreservingChatItem:completion:](self, "dismissStickerPickerPreservingChatItem:completion:", 1, 0);
LABEL_12:

}

- (void)canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t);
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  if (-[CKChatInputController switcherPluginCanMessageAPIOnBehalfOfPlugin:](self, "switcherPluginCanMessageAPIOnBehalfOfPlugin:", v8))
  {
    v7 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D37568]);
  }
  else
  {
    v7 = 0;
  }
  v6[2](v6, v7);

}

- (void)showBrowserForPluginIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5
{
  void (**v7)(_QWORD);
  id v8;

  v8 = a3;
  v7 = (void (**)(_QWORD))a5;
  if (-[CKChatInputController switcherPluginCanMessageAPIOnBehalfOfPlugin:](self, "switcherPluginCanMessageAPIOnBehalfOfPlugin:", v8)&& objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D37568]))
  {
    -[CKChatInputController presentAppStoreForURL:](self, "presentAppStoreForURL:", 0);
  }
  if (v7)
    v7[2](v7);

}

- (void)requestPresentationStyleExpanded:(BOOL)a3 forPlugin:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKChatInputController currentPluginIsDT](self, "currentPluginIsDT"))
  {
    -[CKChatInputController _deferredRequestPresentationStyleExpanded:](self, "_deferredRequestPresentationStyleExpanded:", v6);
  }
  else if (-[CKChatInputController switcherPluginCanMessageAPIOnBehalfOfPlugin:](self, "switcherPluginCanMessageAPIOnBehalfOfPlugin:", v7))
  {
    -[CKChatInputController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__deferredRequestPresentationStyleExpanded_, v6, 0.1);
  }

}

- (void)requestPresentationStyleFullScreenModalForPlugin:(id)a3 preferredContentSize:(CGSize)a4
{
  -[CKChatInputController requestPresentationStyleFullScreenModalForPlugin:dataSource:preferredContentSize:skipValidation:](self, "requestPresentationStyleFullScreenModalForPlugin:dataSource:preferredContentSize:skipValidation:", a3, 0, 0, a4.width, a4.height);
}

- (void)requestTransitionPluginFromFullScreen:(id)a3 toExpanded:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  CKChatInputController *v10;
  BOOL v11;

  v6 = a3;
  -[CKChatInputController _deferredDismissToKeyboardAndFocusEntryView:](self, "_deferredDismissToKeyboardAndFocusEntryView:", MEMORY[0x1E0C9AAA0]);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__CKChatInputController_requestTransitionPluginFromFullScreen_toExpanded___block_invoke;
  block[3] = &unk_1E274E150;
  v11 = a4;
  v9 = v6;
  v10 = self;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __74__CKChatInputController_requestTransitionPluginFromFullScreen_toExpanded___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(unsigned __int8 *)(a1 + 48);
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pluginForExtensionIdentifier:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "showBrowserForPlugin:dataSource:style:", v3, 0, v2);

}

- (void)requestPresentationStyleFullScreenModalForPlugin:(id)a3 dataSource:(id)a4 skipValidation:(BOOL)a5
{
  -[CKChatInputController requestPresentationStyleFullScreenModalForPlugin:dataSource:preferredContentSize:skipValidation:](self, "requestPresentationStyleFullScreenModalForPlugin:dataSource:preferredContentSize:skipValidation:", a3, a4, a5, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (void)requestPresentationStyleFullScreenModalForPlugin:(id)a3 dataSource:(id)a4 preferredContentSize:(CGSize)a5 skipValidation:(BOOL)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  id v12;
  dispatch_time_t v13;
  _QWORD block[5];
  id v15;
  id v16;
  CGFloat v17;
  CGFloat v18;

  height = a5.height;
  width = a5.width;
  v11 = a3;
  v12 = a4;
  if (a6
    || -[CKChatInputController switcherPluginCanMessageAPIOnBehalfOfPlugin:](self, "switcherPluginCanMessageAPIOnBehalfOfPlugin:", v11))
  {
    v13 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __121__CKChatInputController_requestPresentationStyleFullScreenModalForPlugin_dataSource_preferredContentSize_skipValidation___block_invoke;
    block[3] = &unk_1E2757F90;
    block[4] = self;
    v15 = v11;
    v16 = v12;
    v17 = width;
    v18 = height;
    dispatch_after(v13, MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __121__CKChatInputController_requestPresentationStyleFullScreenModalForPlugin_dataSource_preferredContentSize_skipValidation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deferredRequestFullScreenModalForPluginIdentifier:dataSource:preferredContentSize:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)_deferredRequestPresentationStyleExpanded:(id)a3
{
  unsigned int v4;
  void *v5;
  id v6;

  v4 = objc_msgSend(a3, "BOOLValue");
  if (CKIsAppCardsEnabled())
  {
    -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requestPresentationStyle:animated:", v4, 1);
  }
  else
  {
    -[CKChatInputController browserSwitcher](self, "browserSwitcher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
      objc_msgSend(v5, "transitionToFullscreen");
    else
      objc_msgSend(v5, "transitionToCollapsed");
  }

}

- (void)_deferredRequestFullScreenModalForPluginIdentifier:(id)a3 dataSource:(id)a4 preferredContentSize:(CGSize)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  height = a5.height;
  width = a5.width;
  v9 = a4;
  v10 = a3;
  if (CKIsRunningInMacCatalyst())
  {
    -[CKChatInputController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewControllerForChatInputModalPresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentedViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "conformsToProtocol:", &unk_1EE1E8320))
      -[CKChatInputController setMacBrowserViewController:](self, "setMacBrowserViewController:", v13);

  }
  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "balloonPluginForBundleID:", v10);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  -[CKChatInputController browserSwitcher](self, "browserSwitcher");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "showBrowserFullscreenModalForPlugin:datasource:preferredContentSize:", v16, v9, width, height);

}

- (BOOL)_isAppBrowserFullScreen
{
  void *v3;
  char v4;
  void *v5;

  if (CKIsAppCardsEnabled())
  {
    -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isExpanded");
  }
  else
  {
    -[CKChatInputController browserSwitcher](self, "browserSwitcher");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "transitionCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "currentConsumer") == 2;

  }
  return v4;
}

- (BOOL)_shouldDeferCallbackForInsertingPayload
{
  void *v3;
  int v4;
  void *v6;
  BOOL v7;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSendMenuEnabled");

  if (v4)
    return -[CKChatInputController _isAppBrowserFullScreen](self, "_isAppBrowserFullScreen");
  -[CKChatInputController entryView](self, "entryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "entryFieldCollapsed"))
    v7 = -[CKChatInputController _isAppBrowserFullScreen](self, "_isAppBrowserFullScreen");
  else
    v7 = 1;

  return v7;
}

- (void)startEditingPayloadBypassingValidation:(id)a3 forPlugin:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  dispatch_time_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  CKChatInputController *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  if (v10)
  {
    if (-[CKChatInputController _shouldDeferCallbackForInsertingPayload](self, "_shouldDeferCallbackForInsertingPayload"))
    {
      -[CKChatInputController setInsertPayloadCompletionHandler:](self, "setInsertPayloadCompletionHandler:", v10);
    }
    else
    {
      v10[2](v10, 0);
    }
  }
  v11 = dispatch_time(0, 100000000);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __85__CKChatInputController_startEditingPayloadBypassingValidation_forPlugin_completion___block_invoke;
  v17 = &unk_1E274A108;
  v18 = self;
  v19 = v8;
  v12 = v8;
  dispatch_after(v11, MEMORY[0x1E0C80D38], &v14);
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance", v14, v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateInteractionTimeForPlugin:", v9);

}

uint64_t __85__CKChatInputController_startEditingPayloadBypassingValidation_forPlugin_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startEditingPayload:", *(_QWORD *)(a1 + 40));
}

- (void)appendMediaPayloadToText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKChatInputController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chatInputController:didRequestAppendToCompositionForPayload:", self, v4);

}

- (void)startEditingPayload:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CKChatInputController entryView](self, "entryView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "prepareForShelfPayloadAnimation");

  -[CKChatInputController _startEditingPayload:](self, "_startEditingPayload:", v6);
}

- (void)startEditingPayload:(id)a3 dismiss:(BOOL)a4
{
  -[CKChatInputController startEditingPayload:dismiss:forPlugin:](self, "startEditingPayload:dismiss:forPlugin:", a3, a4, 0);
}

- (void)startEditingPayload:(id)a3 dismiss:(BOOL)a4 forPlugin:(id)a5
{
  -[CKChatInputController startEditingPayload:dismiss:forPlugin:completion:](self, "startEditingPayload:dismiss:forPlugin:completion:", a3, a4, a5, 0);
}

- (void)startEditingPayload:(id)a3 dismiss:(BOOL)a4 forPlugin:(id)a5 completion:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  dispatch_time_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  CKChatInputController *v21;
  id v22;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, _QWORD))a6;
  if (-[CKChatInputController currentPluginIsDT](self, "currentPluginIsDT")
    || -[CKChatInputController handwritingIsDisplayed](self, "handwritingIsDisplayed"))
  {
    -[CKChatInputController startEditingPayload:](self, "startEditingPayload:", v10);
  }
  else if (-[CKChatInputController _pluginCanMessageAPI:](self, "_pluginCanMessageAPI:", v11)
         || -[CKChatInputController switcherPluginCanMessageAPIOnBehalfOfPlugin:](self, "switcherPluginCanMessageAPIOnBehalfOfPlugin:", v11))
  {
    if (v12)
    {
      if (-[CKChatInputController _shouldDeferCallbackForInsertingPayload](self, "_shouldDeferCallbackForInsertingPayload"))
      {
        -[CKChatInputController setInsertPayloadCompletionHandler:](self, "setInsertPayloadCompletionHandler:", v12);
      }
      else
      {
        v12[2](v12, 0);
      }
    }
    v16 = dispatch_time(0, 100000000);
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __74__CKChatInputController_startEditingPayload_dismiss_forPlugin_completion___block_invoke;
    v20 = &unk_1E274A108;
    v21 = self;
    v22 = v10;
    dispatch_after(v16, MEMORY[0x1E0C80D38], &v17);

  }
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance", v17, v18, v19, v20, v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updateInteractionTimeForPlugin:", v11);

  if (v8)
  {
    -[CKChatInputController dismiss](self, "dismiss");
    -[CKChatInputController handwritingPresentationController](self, "handwritingPresentationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[CKChatInputController handwritingPresentationController](self, "handwritingPresentationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setVisible:animated:", 0, 1);

    }
  }

}

uint64_t __74__CKChatInputController_startEditingPayload_dismiss_forPlugin_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startEditingPayload:", *(_QWORD *)(a1 + 40));
}

- (void)_startEditingPayload:(id)a3
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
  void (*v13)(uint64_t, void *);
  void *v14;
  CKChatInputController *v15;
  id v16;

  v4 = a3;
  objc_msgSend(v4, "pluginBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[CKChatInputController pluginBundleID](self, "pluginBundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPluginBundleID:", v6);

  }
  objc_msgSend(v4, "setIsFromMe:", 1);
  if (v4)
  {
    if (objc_msgSend(v4, "shouldExpire"))
      v7 = +[CKComposition newExpirableCompositionWithText:subject:shelfPluginPayload:](CKComposition, "newExpirableCompositionWithText:subject:shelfPluginPayload:", 0, 0, v4);
    else
      v7 = 0;
    -[CKChatInputController setIsDisplayingReplaceCompositionAlert:](self, "setIsDisplayingReplaceCompositionAlert:", 0);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __46__CKChatInputController__startEditingPayload___block_invoke;
    v14 = &unk_1E274D9E8;
    v15 = self;
    v8 = v4;
    v16 = v8;
    v9 = _Block_copy(&v11);
    v10 = v9;
    if (v7)
      (*((void (**)(void *, id, _QWORD))v9 + 2))(v9, v7, 0);
    else
      +[CKComposition compositionWithShelfPluginPayload:completionHandler:](CKComposition, "compositionWithShelfPluginPayload:completionHandler:", v8, v9, v11, v12, v13, v14, v15);

  }
  else if (-[CKChatInputController handwritingIsDisplayed](self, "handwritingIsDisplayed"))
  {
    -[CKChatInputController dismissBrowserViewController](self, "dismissBrowserViewController");
  }

}

void __46__CKChatInputController__startEditingPayload___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "eagerUploadPayload:identifier:replace:", *(_QWORD *)(a1 + 40), 0, 1);
    objc_msgSend(*(id *)(a1 + 32), "entryView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__CKChatInputController__startEditingPayload___block_invoke_2;
    v8[3] = &unk_1E2757FE0;
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 32);
    v9 = v5;
    v10 = v6;
    v11 = v3;
    v12 = v4;
    v7 = v4;
    objc_msgSend(v7, "compositionWithAcceptedAutocorrection:", v8);

  }
}

void __46__CKChatInputController__startEditingPayload___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void (**v16)(void *, _QWORD);
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  _QWORD v40[5];
  _QWORD aBlock[4];
  id v42;
  id v43;
  uint64_t v44;
  char v45;
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "shelfPluginPayload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pluginBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pluginBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  objc_msgSend(v4, "pluginBundleID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v39, "isEqualToString:", *MEMORY[0x1E0D375E0]) & 1) != 0)
    v8 = 1;
  else
    v8 = objc_msgSend(v39, "containsString:", *MEMORY[0x1E0D375E8]);
  if (objc_msgSend(*(id *)(a1 + 40), "_isiMessageConversation"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Insert extension file and ask for MMCS prewarm", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preWarmConnection");

  }
  v11 = *(void **)(a1 + 48);
  if (v3)
  {
    objc_msgSend(v3, "compositionByAppendingComposition:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = v11;
  }
  v13 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__CKChatInputController__startEditingPayload___block_invoke_487;
  aBlock[3] = &unk_1E2757FB8;
  v42 = *(id *)(a1 + 56);
  v14 = v12;
  v45 = v8;
  v15 = *(_QWORD *)(a1 + 40);
  v38 = v14;
  v43 = v14;
  v44 = v15;
  v16 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  v40[0] = v13;
  v40[1] = 3221225472;
  v40[2] = __46__CKChatInputController__startEditingPayload___block_invoke_2_488;
  v40[3] = &unk_1E274B0D8;
  v40[4] = *(_QWORD *)(a1 + 40);
  v17 = _Block_copy(v40);
  if ((objc_msgSend(*(id *)(a1 + 32), "supportsSendLater") & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "entryView"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v18, "sendLaterPluginInfo"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = v19 == 0,
        v19,
        v18,
        v20))
  {
    if (v4)
      v25 = v7;
    else
      v25 = 1;
    if ((v25 & 1) != 0)
    {
      v16[2](v16, 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setIsDisplayingReplaceCompositionAlert:", 1);
      CKFrameworkBundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("SHELF_REPLACE_ITEM_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      CKFrameworkBundle();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("SHELF_REPLACE_ITEM"), &stru_1E276D870, CFSTR("ChatKit"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v27, v29, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      CKFrameworkBundle();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("SHELF_REPLACE_ITEM_OK_ACTION_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v32, 0, v16);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addAction:", v33);

      CKFrameworkBundle();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("SHELF_REPLACE_ITEM_CANCEL_ACTION_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v35, 0, v17);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addAction:", v36);

      objc_msgSend(*(id *)(a1 + 40), "delegate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "presentFromViewController:animated:completion:", v37, 1, 0);

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "pluginBundleID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v47 = v22;
        _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "_startEditingPayload: Plugin bundle ID (%@) not supported for Send Later. Presenting alert and aborting.", buf, 0xCu);

      }
    }
    v23 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "pluginBundleID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_presentSendLaterUnsupportedAlertForIdentifier:handler:", v24, v17);

  }
}

uint64_t __46__CKChatInputController__startEditingPayload___block_invoke_487(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;
  void (**v6)(_QWORD, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "setComposition:", *(_QWORD *)(a1 + 40));
  if (*(_BYTE *)(a1 + 56))
  {
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "invalidatePhotosPlugin");

  }
  objc_msgSend(*(id *)(a1 + 48), "insertPayloadCompletionHandler");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    if ((objc_msgSend(*(id *)(a1 + 48), "_isAppBrowserFullScreen") & 1) != 0)
    {

LABEL_7:
      objc_msgSend(*(id *)(a1 + 48), "insertPayloadCompletionHandler");
      v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v6[2](v6, 0);

      objc_msgSend(*(id *)(a1 + 48), "setInsertPayloadCompletionHandler:", 0);
      goto LABEL_8;
    }
    v5 = objc_msgSend(*(id *)(a1 + 48), "appModalIsDisplayed");

    if ((v5 & 1) != 0)
      goto LABEL_7;
  }
LABEL_8:
  objc_msgSend(*(id *)(a1 + 48), "dismissPluginAppAfterReplaceAlertInteractedWithIfNeeded");
  return objc_msgSend(*(id *)(a1 + 48), "setIsDisplayingReplaceCompositionAlert:", 0);
}

uint64_t __46__CKChatInputController__startEditingPayload___block_invoke_2_488(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "dismissPluginAppAfterReplaceAlertInteractedWithIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "setIsDisplayingReplaceCompositionAlert:", 0);
}

- (void)dismissPluginAppAfterReplaceAlertInteractedWithIfNeeded
{
  if (self->_dismissPluginAfterReplaceAlertInteractedWith)
  {
    -[CKChatInputController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__deferredDismissToKeyboardAndFocusEntryView_, MEMORY[0x1E0C9AAB0], 0.1);
    self->_dismissPluginAfterReplaceAlertInteractedWith = 0;
  }
}

- (BOOL)_shouldSendTypingIndicatorDataForPluginIdentifier:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
    v4 = objc_msgSend(v3, "rangeOfString:", *MEMORY[0x1E0D375D0]) != 0x7FFFFFFFFFFFFFFFLL;
  else
    v4 = 0;

  return v4;
}

- (id)pluginBundleID
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[CKChatInputController handwritingPresentationController](self, "handwritingPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "visible");

  if (v4)
  {
    -[CKChatInputController handwritingPresentationController](self, "handwritingPresentationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pluginBundleID");
  }
  else
  {
    -[CKChatInputController browserPlugin](self, "browserPlugin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setLocalUserIsTyping:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  -[CKChatInputController pluginBundleID](self, "pluginBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CKChatInputController _shouldSendTypingIndicatorDataForPluginIdentifier:](self, "_shouldSendTypingIndicatorDataForPluginIdentifier:", v5);

  if (v6)
  {
    -[CKChatInputController browserPlugin](self, "browserPlugin");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "__ck_statusJPEGImageDataForTransportWithCompressionFactor:", 0.2);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  -[CKChatInputController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatInputController pluginBundleID](self, "pluginBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocalUserIsComposing:withPluginBundleID:typingIndicatorData:", v3, v9, v10);

}

- (void)expandedAppViewControllerWantsToCollapse:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKChatInputController _deferredRequestPresentationStyleExpanded:](self, "_deferredRequestPresentationStyleExpanded:", v4);

}

- (void)showEntryViewPhotosShelf:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  CKBrowserItemPayload *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void (**v33)(id, uint64_t);
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void (**v43)(id, uint64_t);
  void *v44;
  void *v45;
  void *v46;
  int v47;
  _QWORD v48[5];
  void (**v49)(id, uint64_t);
  char v50;
  _QWORD v51[5];
  id v52;
  void (**v53)(id, uint64_t);
  uint8_t buf[16];

  v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  IMBalloonExtensionIDWithSuffix();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatInputController entryView](self, "entryView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "composition");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shelfPluginPayload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "pluginBundleID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v45, "isEqualToString:", *MEMORY[0x1E0D375E0]);
  v46 = v11;
  if (v8)
  {
    IMBalloonExtensionIDWithSuffix();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "isEqualToString:", v12);
  }
  else
  {
    objc_msgSend(v11, "pluginBundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    IMBalloonExtensionIDWithSuffix();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", v14))
      v13 = objc_msgSend(v11, "shouldSendAsMediaObject");
    else
      v13 = 0;

  }
  v15 = objc_alloc_init(CKBrowserItemPayload);
  -[CKBrowserItemPayload setPluginBundleID:](v15, "setPluginBundleID:", v8);
  -[CKBrowserItemPayload setPhotoShelfViewController:](v15, "setPhotoShelfViewController:", v6);
  +[CKComposition compositionWithShelfPluginPayload:](CKComposition, "compositionWithShelfPluginPayload:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatInputController entryView](self, "entryView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "composition");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "shelfPluginPayload");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[CKChatInputController _isiMessageConversation](self, "_isiMessageConversation"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "User insert Photo and ask for MMCS prewarm", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "preWarmConnection");

  }
  v44 = v16;
  if (v18)
  {
    objc_msgSend(v18, "compositionByAppendingComposition:", v16);
    v22 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = v16;
  }
  if (v19)
    v23 = v47;
  else
    v23 = 1;
  if (((v23 | v13) & 1) != 0)
  {
    -[CKChatInputController entryView](self, "entryView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[CKChatInputController entryView](self, "entryView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setComposition:", v22);

    }
    else
    {
      -[CKChatInputController setDeferredComposition:](self, "setDeferredComposition:", v22);
    }
    v40 = v45;
    v39 = v46;
    if (v7)
      v7[2](v7, 1);
  }
  else
  {
    CKFrameworkBundle();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("SHELF_REPLACE_ITEM_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v41 = v8;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    CKFrameworkBundle();
    v43 = v7;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("SHELF_REPLACE_ITEM"), &stru_1E276D870, CFSTR("ChatKit"));
    v42 = v6;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v27, v29, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("SHELF_REPLACE_ITEM_OK_ACTION_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __61__CKChatInputController_showEntryViewPhotosShelf_completion___block_invoke;
    v51[3] = &unk_1E274D070;
    v51[4] = self;
    v52 = v22;
    v33 = v43;
    v53 = v33;
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v32, 0, v51);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addAction:", v34);

    v8 = v41;
    CKFrameworkBundle();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("SHELF_REPLACE_ITEM_CANCEL_ACTION_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __61__CKChatInputController_showEntryViewPhotosShelf_completion___block_invoke_2;
    v48[3] = &unk_1E2758008;
    v50 = v47;
    v48[4] = self;
    v49 = v33;
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v36, 0, v48);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addAction:", v37);

    v6 = v42;
    v7 = v43;
    -[CKChatInputController delegate](self, "delegate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "presentFromViewController:animated:completion:", v38, 1, 0);

    v40 = v45;
    v39 = v46;
  }

}

uint64_t __61__CKChatInputController_showEntryViewPhotosShelf_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "entryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setComposition:", *(_QWORD *)(a1 + 40));

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

void __61__CKChatInputController_showEntryViewPhotosShelf_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  if (*(_BYTE *)(a1 + 48))
  {
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidatePhotosPlugin");

    objc_msgSend(*(id *)(a1 + 32), "_loadPhotosBrowser");
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);

}

- (void)generatePreviewAndStoreInCacheForSendingPhotoFromPayload:(id)a3
{
  id v4;

  objc_msgSend(a3, "fileURL");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKChatInputController _beginPreviewCreationWithFileURL:](self, "_beginPreviewCreationWithFileURL:", v4);

}

+ (id)previewQueue
{
  if (previewQueue_onceToken_0 != -1)
    dispatch_once(&previewQueue_onceToken_0, &__block_literal_global_499_1);
  return (id)previewQueue__previewQueue_0;
}

uint64_t __37__CKChatInputController_previewQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)previewQueue__previewQueue_0;
  previewQueue__previewQueue_0 = (uint64_t)v0;

  objc_msgSend((id)previewQueue__previewQueue_0, "setQualityOfService:", 33);
  return objc_msgSend((id)previewQueue__previewQueue_0, "setMaxConcurrentOperationCount:", -1);
}

- (void)_beginPreviewCreationWithFileURL:(id)a3
{
  id v4;
  CKDBFileTransfer *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;

  v4 = a3;
  if (v4)
  {
    v5 = -[CKDBFileTransfer initWithFileURL:transcoderUserInfo:attributionInfo:hideAttachment:]([CKDBFileTransfer alloc], "initWithFileURL:transcoderUserInfo:attributionInfo:hideAttachment:", v4, 0, 0, 0);
    objc_msgSend(v4, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDBFileTransfer setFilename:](v5, "setFilename:", v6);

    -[CKDBFileTransfer setTransferState:](v5, "setTransferState:", 5);
    +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDBFileTransfer filename](v5, "filename");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_msgSend(v7, "classForFilename:", v8);

    +[CKMessageContext selfContext](CKMessageContext, "selfContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend([v9 alloc], "initWithTransfer:context:forceInlinePreview:", v5, v10, 1);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "previewMaxWidth");
    v14 = v13;

    objc_msgSend(v11, "previewCacheKeyWithOrientation:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatInputController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fileURLKeyToGuidMapping");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v15, v4);

    if ((objc_msgSend(v11, "needsAnimation") & 1) == 0)
    {
      +[CKChatInputController previewQueue](CKChatInputController, "previewQueue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __58__CKChatInputController__beginPreviewCreationWithFileURL___block_invoke;
      v19[3] = &unk_1E274C9C0;
      v20 = v11;
      v21 = v14;
      objc_msgSend(v18, "addOperationWithBlock:", v19);

    }
  }
  else
  {
    IMLogHandleForCategory();
    v5 = (CKDBFileTransfer *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR))
      -[CKChatInputController _beginPreviewCreationWithFileURL:].cold.1();
  }

}

id __58__CKChatInputController__beginPreviewCreationWithFileURL___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "previewForWidth:orientation:", 1, *(double *)(a1 + 40));
}

- (void)showModalViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isPresentingCard");

  if (v11)
  {
    -[CKChatInputController appCardPresentationOverseer](self, "appCardPresentationOverseer");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "containerViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentViewController:animated:completion:", v9, v5, v8);

    v8 = v9;
    v9 = v12;
  }
  else
  {
    -[CKChatInputController delegate](self, "delegate");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "chatInputController:presentShelfModal:animated:completion:", self, v9, v5, v8);
  }

}

- (void)dismissEntryViewShelf
{
  void *v3;
  char v4;
  id v5;

  -[CKChatInputController dismissEntryViewShelfUpdater](self, "dismissEntryViewShelfUpdater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHoldingUpdates");

  if ((v4 & 1) == 0)
  {
    -[CKChatInputController entryView](self, "entryView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidateCompositionForReason:", 2);

  }
}

- (id)workingDirForDraft
{
  return -[CKChatInputController workingDraftDirForPluginIdentifier:](self, "workingDraftDirForPluginIdentifier:", *MEMORY[0x1E0D375E0]);
}

- (id)workingDraftDirForPluginIdentifier:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  __CFString *v13;
  id v15;
  uint8_t buf[4];
  __CFString *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKChatInputController targetConversation](self, "targetConversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = CFSTR("Pending");
      goto LABEL_6;
    }
    objc_msgSend(v5, "uniqueIdentifier");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
LABEL_6:
      CKPluginTmpSubDirectoryURL(v6, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v15);
      v7 = v15;

      if (v8)
        goto LABEL_20;
      goto LABEL_9;
    }
    v7 = 0;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
LABEL_9:
  IMLogHandleForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[CKChatInputController workingDraftDirForPluginIdentifier:].cold.1();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Failure info - guid: %@, error: %@", buf, 0x16u);
    }

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[CKChatInputController entryView](self, "entryView");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v13;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Failure info - entryView: %@", buf, 0xCu);

    }
  }
  v8 = 0;
LABEL_20:

  return v8;
}

- (void)stageAssetArchive:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  IMBalloonExtensionIDWithSuffix();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewControllerForPluginIdentifier:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setSendDelegate:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "_stageAssetArchive:skipShelf:completionHandler:", v8, v6, v9);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Failed to dispatch asset archive to the photos browser", v14, 2u);
    }

  }
}

- (void)removeAssetArchiveWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];

  v6 = a3;
  v7 = a4;
  IMBalloonExtensionIDWithSuffix();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewControllerForPluginIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setSendDelegate:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "_removeAssetArchiveWithIdentifier:completionHandler:", v6, v7);
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Failed to dispatch asset archive removal to the photos browser", v12, 2u);
    }

  }
}

- (void)notifyActiveBrowserAssetArchiveWasRemoved:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (-[CKChatInputController currentPluginIsPhotos](self, "currentPluginIsPhotos")
    || -[CKChatInputController currentPluginIsGenerativePlayground](self, "currentPluginIsGenerativePlayground"))
  {
    IMBalloonExtensionIDWithSuffix();
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "viewControllerForPluginIdentifier:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "_assetArchiveRemoved:", v8);
    }
  }

}

- (id)configurePhotosDraftAssetArchivesWithConversationID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[16];

  v4 = a3;
  IMBalloonExtensionIDWithSuffix();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "viewControllerForPluginIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setSendDelegate:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "_configurePhotosDraftAssetArchivesWithConversationID:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Failed to dispatch configureDraftAssetArchives to the photos browser", v11, 2u);
      }

    }
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (void)didStageAssetArchive:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D397A0], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "checksForSensitivityOnSend"))
  {
    objc_msgSend(v6, "mediaObjectFromPayload");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D39798], "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatInputController targetConversation](self, "targetConversation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "chat");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "chatIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __57__CKChatInputController_didStageAssetArchive_identifier___block_invoke;
    v16[3] = &unk_1E274B1A0;
    v17 = v9;
    v15 = v9;
    objc_msgSend(v10, "isSensitiveContent:withChatID:completionHandler:", v11, v14, v16);

  }
  -[CKChatInputController eagerUploadPayload:identifier:replace:](self, "eagerUploadPayload:identifier:replace:", v6, v7, 0);

}

void __57__CKChatInputController_didStageAssetArchive_identifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "filename");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      v9 = CFSTR("NO");
      if (a2)
        v9 = CFSTR("YES");
      v10 = 138412546;
      v11 = v7;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Staged asset %@ is sensitive: %@", (uint8_t *)&v10, 0x16u);

    }
  }

}

- (void)dismissPlugin
{
  void *v3;
  id v4;

  -[CKChatInputController dismiss](self, "dismiss");
  -[CKChatInputController dismissBrowserViewController](self, "dismissBrowserViewController");
  -[CKChatInputController handwritingPresentationController](self, "handwritingPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKChatInputController handwritingPresentationController](self, "handwritingPresentationController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setVisible:animated:", 0, 1);

  }
}

- (void)handwritingPresentationControllerDidShowHandwriting:(id)a3
{
  id v4;

  -[CKChatInputController setShouldSuppressStatusBarForHandwriting:](self, "setShouldSuppressStatusBarForHandwriting:", 1);
  -[CKChatInputController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chatInputControllerDidShowHandwriting:", self);

}

- (void)handwritingPresentationControllerWillHideHandwriting:(id)a3
{
  id v4;

  -[CKChatInputController setShouldSuppressStatusBarForHandwriting:](self, "setShouldSuppressStatusBarForHandwriting:", 0);
  -[CKChatInputController delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chatInputControllerWillHideHandwriting:", self);

}

- (void)didBeginInstallingAppWithBundleIdentifier:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKChatInputController.m"), 4107, CFSTR("Cannot call -didBeginInstallingAppWithBundleIdentifier: with nil identifier!"));

  }
  +[CKAppInstallationWatcher sharedInstance](CKAppInstallationWatcher, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startListeningForAppBundleIdentifier:", v7);

}

- (void)openAppExtensionWithAdamID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allPlugins");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "adamID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToNumber:", v4);

        if ((v12 & 1) != 0)
          break;
      }
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v13 = v10;

    if (!v13)
      goto LABEL_13;
    -[CKChatInputController browserSwitcher](self, "browserSwitcher");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "transitionCoordinator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isExpanded");

    -[CKChatInputController deferredPluginDataSource](self, "deferredPluginDataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatInputController showBrowserForPlugin:dataSource:style:](self, "showBrowserForPlugin:dataSource:style:", v13, v17, v16);

    -[CKChatInputController setDeferredPluginDataSource:](self, "setDeferredPluginDataSource:", 0);
  }
  else
  {
LABEL_10:

LABEL_13:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v4;
        _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Failed to find and open app with adam ID: %@", buf, 0xCu);
      }

    }
  }

}

- (void)deviceOrientationManager:(id)a3 orientationDidChange:(int64_t)a4
{
  id v4;

  -[CKChatInputController orientationUpdater](self, "orientationUpdater", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdate");

}

- (void)showFindMyPlugin
{
  id v3;

  IMBalloonExtensionIDWithSuffix();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CKChatInputController showPluginWithExtensionIdentifier:](self, "showPluginWithExtensionIdentifier:", v3);

}

- (void)showPluginWithExtensionIdentifier:(id)a3
{
  -[CKChatInputController showPluginWithExtensionIdentifier:sourceView:](self, "showPluginWithExtensionIdentifier:sourceView:", a3, 0);
}

- (unint64_t)appPresentationStyleForShowingPluginID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  -[CKChatInputController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerForChatInputModalPresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[CKChatInputController presentationStyleInOrientation:inPopover:forPluginID:](self, "presentationStyleInOrientation:inPopover:forPluginID:", objc_msgSend(v5, "sceneInterfaceOrientation"), -[CKChatInputController determineSendMenuPresentationStyleCompatibleWithTraitCollection:](self, "determineSendMenuPresentationStyleCompatibleWithTraitCollection:", v7) == 1, v4);
  return v8;
}

- (void)showPluginWithExtensionIdentifier:(id)a3 sourceView:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  CKTranscriptPluginPresentationConfiguration *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pluginForExtensionIdentifier:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[CKChatInputController appPresentationStyleForShowingPluginID:](self, "appPresentationStyleForShowingPluginID:", v11);
    if (v6)
      v10 = -[CKTranscriptPluginPresentationConfiguration initWithSourceView:permittedArrowDirections:shouldDisableSnapshotView:]([CKTranscriptPluginPresentationConfiguration alloc], "initWithSourceView:permittedArrowDirections:shouldDisableSnapshotView:", v6, 15, 0);
    else
      v10 = 0;
    -[CKChatInputController showBrowserForPlugin:dataSource:style:presentationConfiguration:](self, "showBrowserForPlugin:dataSource:style:presentationConfiguration:", v8, 0, v9, v10);

  }
}

- (void)browserAppManagerDidSelectPlugin:(id)a3
{
  -[CKChatInputController showBrowserForPlugin:dataSource:style:](self, "showBrowserForPlugin:dataSource:style:", a3, 0, 0);
}

- (void)willSendComposition
{
  -[CKChatEagerUploadController didSendComposition](self->_eagerUploadController, "didSendComposition");
}

- (void)eagerUploadCancelIdentifier:(id)a3
{
  -[CKChatEagerUploadController cancelIdentifier:](self->_eagerUploadController, "cancelIdentifier:", a3);
}

- (void)eagerUploadPayload:(id)a3 identifier:(id)a4 replace:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  _BOOL4 v17;
  CKChatEagerUploadController *eagerUploadController;
  void *v19;
  os_activity_scope_state_s v20;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (-[CKChatInputController _isiMessageConversation](self, "_isiMessageConversation"))
  {
    -[CKChatInputController targetConversation](self, "targetConversation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isBusinessConversation") & 1) == 0)
    {
      v11 = _os_activity_create(&dword_18DFCD000, "com.apple.messages.iMessageAttachmentEagerUpload", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
      v20.opaque[0] = 0;
      v20.opaque[1] = 0;
      os_activity_scope_enter(v11, &v20);
      objc_msgSend(v8, "mediaObjectFromPayload");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (objc_msgSend(v12, "duration"), v14 = v13, objc_msgSend(v10, "maxTrimDurationForMedia:", v12), v14 <= v15))
      {
        objc_msgSend(v12, "transfer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = CKFileSizeEligibleForEagerUpload(objc_msgSend(v16, "totalBytes"));

        if (v17)
        {
          eagerUploadController = self->_eagerUploadController;
          -[CKChatInputController participantHandles](self, "participantHandles");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKChatEagerUploadController uploadPayload:identifier:replace:recipients:](eagerUploadController, "uploadPayload:identifier:replace:recipients:", v8, v9, v5, v19);

        }
      }

      os_activity_scope_leave(&v20);
    }

  }
}

- (id)participantHandles
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v10[16];

  -[CKChatInputController targetConversation](self, "targetConversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "senderIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IMChatCanonicalIDSIDsForAddress();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v2, "recipients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "__im_canonicalIDSAddressesFromEntities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByAddingObject:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "canonicalAddress is nil!", v10, 2u);
      }

    }
    objc_msgSend(v2, "recipients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "__im_canonicalIDSAddressesFromEntities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)popoverPresentationControllerDidDismissPopover:(id)a3
{
  -[CKChatInputController dismissStickerPickerPreservingChatItem:completion:](self, "dismissStickerPickerPreservingChatItem:completion:", 0, 0);
}

- (void)presentationControllerWillDismiss:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[CKChatInputController isPresentingStickerPicker](self, "isPresentingStickerPicker"))
  {
    -[CKChatInputController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inputController:willDismissPresentationController:", self, v5);

    -[CKChatInputController endStickerReactionSession](self, "endStickerReactionSession");
  }

}

- (void)presentationControllerDidDismiss:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EE1E8320);

  if (v5
    && CKIsRunningInMacCatalyst()
    && !-[CKChatInputController appModalIsDisplayed](self, "appModalIsDisplayed"))
  {
    -[CKChatInputController browserWillDismiss](self, "browserWillDismiss");
    objc_msgSend(v7, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "deferredForceTearDownRemoteView");

  }
}

- (BOOL)currentPluginAppDidRecieveTouchForSendAPI
{
  return self->_currentPluginAppDidRecieveTouchForSendAPI;
}

- (CKChatInputControllerDelegate)delegate
{
  return (CKChatInputControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKExternalPluginViewControllerProvider)externalPluginControllerProvider
{
  return (CKExternalPluginViewControllerProvider *)objc_loadWeakRetained((id *)&self->_externalPluginControllerProvider);
}

- (void)setExternalPluginControllerProvider:(id)a3
{
  objc_storeWeak((id *)&self->_externalPluginControllerProvider, a3);
}

- (IMBalloonPlugin)browserPlugin
{
  return self->_browserPlugin;
}

- (IMBalloonPluginDataSource)browserPluginDataSource
{
  return self->_browserPluginDataSource;
}

- (void)setBrowserPluginDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_browserPluginDataSource, a3);
}

- (BOOL)isDismissingAppModal
{
  return self->_isDismissingAppModal;
}

- (BOOL)preventResignFirstResponder
{
  return self->_preventResignFirstResponder;
}

- (void)setPreventResignFirstResponder:(BOOL)a3
{
  self->_preventResignFirstResponder = a3;
}

- (UIViewController)statusBarStyleViewController
{
  return self->_statusBarStyleViewController;
}

- (void)setStatusBarStyleViewController:(id)a3
{
  objc_storeStrong((id *)&self->_statusBarStyleViewController, a3);
}

- (void)setTextInputPayloadController:(id)a3
{
  objc_storeStrong((id *)&self->_textInputPayloadController, a3);
}

- (CKMessagePartChatItem)stickerPickerMessagePartChatItem
{
  return self->_stickerPickerMessagePartChatItem;
}

- (void)setStickerPickerMessagePartChatItem:(id)a3
{
  objc_storeStrong((id *)&self->_stickerPickerMessagePartChatItem, a3);
}

- (CKMessagePartChatItem)stickerPickerMessagePartParentChatItem
{
  return self->_stickerPickerMessagePartParentChatItem;
}

- (void)setStickerPickerMessagePartParentChatItem:(id)a3
{
  objc_storeStrong((id *)&self->_stickerPickerMessagePartParentChatItem, a3);
}

- (double)appCardDismissPadding
{
  return self->_appCardDismissPadding;
}

- (BOOL)isAppCardDismissing
{
  return self->_isAppCardDismissing;
}

- (BOOL)isAppCardAppearing
{
  return self->_isAppCardAppearing;
}

- (BOOL)isAppCardUsingPopoverPresentation
{
  return self->_isAppCardUsingPopoverPresentation;
}

- (void)setIsAppCardUsingPopoverPresentation:(BOOL)a3
{
  self->_isAppCardUsingPopoverPresentation = a3;
}

- (BOOL)shouldSuppressStatusBarForHandwriting
{
  return self->_shouldSuppressStatusBarForHandwriting;
}

- (void)setShouldSuppressStatusBarForHandwriting:(BOOL)a3
{
  self->_shouldSuppressStatusBarForHandwriting = a3;
}

- (BOOL)shouldSuppressStatusBarForSendMenu
{
  return self->_shouldSuppressStatusBarForSendMenu;
}

- (void)setShouldSuppressStatusBarForSendMenu:(BOOL)a3
{
  self->_shouldSuppressStatusBarForSendMenu = a3;
}

- (BOOL)_isRunningPPT
{
  return self->__isRunningPPT;
}

- (void)set_isRunningPPT:(BOOL)a3
{
  self->__isRunningPPT = a3;
}

- (BOOL)isInputViewVisible
{
  return self->_inputViewVisible;
}

- (CKMessageEntryView)entryView
{
  return self->_entryView;
}

- (CKKeyboardContentViewController)currentInputViewController
{
  return self->_currentInputViewController;
}

- (BOOL)inputViewWillBecomeVisible
{
  return self->_inputViewWillBecomeVisible;
}

- (void)setInputViewWillBecomeVisible:(BOOL)a3
{
  self->_inputViewWillBecomeVisible = a3;
}

- (void)setSwitcherInputViewController:(id)a3
{
  objc_storeStrong((id *)&self->_switcherInputViewController, a3);
}

- (void)setBrowserSwitcher:(id)a3
{
  objc_storeStrong((id *)&self->_browserSwitcher, a3);
}

- (void)setAppCardPresentationOverseer:(id)a3
{
  objc_storeStrong((id *)&self->_appCardPresentationOverseer, a3);
}

- (void)setCurrentPluginAppDidRecieveTouchForSendAPI:(BOOL)a3
{
  self->_currentPluginAppDidRecieveTouchForSendAPI = a3;
}

- (CKDeviceOrientationManager)orientationManager
{
  return self->_orientationManager;
}

- (void)setOrientationManager:(id)a3
{
  objc_storeStrong((id *)&self->_orientationManager, a3);
}

- (int64_t)lastSeenOrientation
{
  return self->_lastSeenOrientation;
}

- (void)setLastSeenOrientation:(int64_t)a3
{
  self->_lastSeenOrientation = a3;
}

- (UINavigationController)presentedBrowserNavigationController
{
  return self->_presentedBrowserNavigationController;
}

- (void)setPresentedBrowserNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_presentedBrowserNavigationController, a3);
}

- (CKBrowserViewControllerProtocol)macBrowserViewController
{
  return self->_macBrowserViewController;
}

- (void)setMacBrowserViewController:(id)a3
{
  objc_storeStrong((id *)&self->_macBrowserViewController, a3);
}

- (UINavigationController)wolfBrowserNavController
{
  return (UINavigationController *)objc_loadWeakRetained((id *)&self->_wolfBrowserNavController);
}

- (void)setWolfBrowserNavController:(id)a3
{
  objc_storeWeak((id *)&self->_wolfBrowserNavController, a3);
}

- (CKStickerReactionSession)stickerReactionSession
{
  return self->_stickerReactionSession;
}

- (void)setStickerReactionSession:(id)a3
{
  objc_storeStrong((id *)&self->_stickerReactionSession, a3);
}

- (BOOL)dismissPluginAfterReplaceAlertInteractedWith
{
  return self->_dismissPluginAfterReplaceAlertInteractedWith;
}

- (void)setDismissPluginAfterReplaceAlertInteractedWith:(BOOL)a3
{
  self->_dismissPluginAfterReplaceAlertInteractedWith = a3;
}

- (BOOL)isDisplayingReplaceCompositionAlert
{
  return self->_isDisplayingReplaceCompositionAlert;
}

- (void)setIsDisplayingReplaceCompositionAlert:(BOOL)a3
{
  self->_isDisplayingReplaceCompositionAlert = a3;
}

- (BOOL)keyboardIsHiding
{
  return self->_keyboardIsHiding;
}

- (void)setKeyboardIsHiding:(BOOL)a3
{
  self->_keyboardIsHiding = a3;
}

- (BOOL)keyboardIsVisible
{
  return self->_keyboardIsVisible;
}

- (void)setKeyboardIsVisible:(BOOL)a3
{
  self->_keyboardIsVisible = a3;
}

- (BOOL)isDismissingAppCardForKeyboardPresentation
{
  return self->_isDismissingAppCardForKeyboardPresentation;
}

- (void)setIsDismissingAppCardForKeyboardPresentation:(BOOL)a3
{
  self->_isDismissingAppCardForKeyboardPresentation = a3;
}

- (BOOL)inCollapseOrExpandAnimation
{
  return self->_inCollapseOrExpandAnimation;
}

- (void)setInCollapseOrExpandAnimation:(BOOL)a3
{
  self->_inCollapseOrExpandAnimation = a3;
}

- (IMScheduledUpdater)dismissEntryViewShelfUpdater
{
  return self->_dismissEntryViewShelfUpdater;
}

- (void)setDismissEntryViewShelfUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_dismissEntryViewShelfUpdater, a3);
}

- (unint64_t)savedStyleForDragCompletion
{
  return self->_savedStyleForDragCompletion;
}

- (void)setSavedStyleForDragCompletion:(unint64_t)a3
{
  self->_savedStyleForDragCompletion = a3;
}

- (CKScheduledUpdater)orientationUpdater
{
  return self->_orientationUpdater;
}

- (void)setOrientationUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_orientationUpdater, a3);
}

- (CKHandwritingPresentationController)handwritingPresentationController
{
  return self->_handwritingPresentationController;
}

- (void)setHandwritingPresentationController:(id)a3
{
  objc_storeStrong((id *)&self->_handwritingPresentationController, a3);
}

- (BOOL)shouldRestoreAppSwitcher
{
  return self->_shouldRestoreAppSwitcher;
}

- (void)setShouldRestoreAppSwitcher:(BOOL)a3
{
  self->_shouldRestoreAppSwitcher = a3;
}

- (BOOL)didDismissAppCardForStickerDrag
{
  return self->_didDismissAppCardForStickerDrag;
}

- (void)setDidDismissAppCardForStickerDrag:(BOOL)a3
{
  self->_didDismissAppCardForStickerDrag = a3;
}

- (IMBalloonPlugin)pluginToResumeForStickerDrag
{
  return self->_pluginToResumeForStickerDrag;
}

- (void)setPluginToResumeForStickerDrag:(id)a3
{
  objc_storeStrong((id *)&self->_pluginToResumeForStickerDrag, a3);
}

- (id)insertPayloadCompletionHandler
{
  return self->_insertPayloadCompletionHandler;
}

- (void)setInsertPayloadCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (IMBalloonPluginDataSource)deferredPluginDataSource
{
  return self->_deferredPluginDataSource;
}

- (void)setDeferredPluginDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_deferredPluginDataSource, a3);
}

- (CKChatEagerUploadController)eagerUploadController
{
  return self->_eagerUploadController;
}

- (void)setEagerUploadController:(id)a3
{
  objc_storeStrong((id *)&self->_eagerUploadController, a3);
}

- (BOOL)isAppCardDraggingBelowKeyboardDetent
{
  return self->_isAppCardDraggingBelowKeyboardDetent;
}

- (void)setIsAppCardDraggingBelowKeyboardDetent:(BOOL)a3
{
  self->_isAppCardDraggingBelowKeyboardDetent = a3;
}

- (CKTranscriptPluginPresentationConfiguration)currentPresentationConfig
{
  return self->_currentPresentationConfig;
}

- (void)setCurrentPresentationConfig:(id)a3
{
  objc_storeStrong((id *)&self->_currentPresentationConfig, a3);
}

- (CKComposition)deferredComposition
{
  return self->_deferredComposition;
}

- (void)setDeferredComposition:(id)a3
{
  objc_storeStrong((id *)&self->_deferredComposition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredComposition, 0);
  objc_storeStrong((id *)&self->_currentPresentationConfig, 0);
  objc_storeStrong((id *)&self->_eagerUploadController, 0);
  objc_storeStrong((id *)&self->_deferredPluginDataSource, 0);
  objc_storeStrong(&self->_insertPayloadCompletionHandler, 0);
  objc_storeStrong((id *)&self->_pluginToResumeForStickerDrag, 0);
  objc_storeStrong((id *)&self->_handwritingPresentationController, 0);
  objc_storeStrong((id *)&self->_orientationUpdater, 0);
  objc_storeStrong((id *)&self->_dismissEntryViewShelfUpdater, 0);
  objc_storeStrong((id *)&self->_stickerReactionSession, 0);
  objc_destroyWeak((id *)&self->_wolfBrowserNavController);
  objc_storeStrong((id *)&self->_macBrowserViewController, 0);
  objc_storeStrong((id *)&self->_presentedBrowserNavigationController, 0);
  objc_storeStrong((id *)&self->_orientationManager, 0);
  objc_storeStrong((id *)&self->_appCardPresentationOverseer, 0);
  objc_storeStrong((id *)&self->_browserSwitcher, 0);
  objc_storeStrong((id *)&self->_switcherInputViewController, 0);
  objc_storeStrong((id *)&self->_currentInputViewController, 0);
  objc_storeStrong((id *)&self->_entryView, 0);
  objc_storeStrong((id *)&self->_stickerPickerMessagePartParentChatItem, 0);
  objc_storeStrong((id *)&self->_stickerPickerMessagePartChatItem, 0);
  objc_storeStrong((id *)&self->_textInputPayloadController, 0);
  objc_storeStrong((id *)&self->_statusBarStyleViewController, 0);
  objc_storeStrong((id *)&self->_browserPluginDataSource, 0);
  objc_storeStrong((id *)&self->_browserPlugin, 0);
  objc_destroyWeak((id *)&self->_externalPluginControllerProvider);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)registerForTextInputPayloadHandling:(BOOL)a3 isGroupChat:(BOOL)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (!CKIsRunningInMessagesViewService())
  {
    -[CKChatInputController textInputPayloadController](self, "textInputPayloadController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = CFSTR("com.apple.messages.currentLocation");
    v11[1] = CFSTR("com.apple.messages.stageSticker");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[CKMentionsUtilities supportsSupplementalLexiconMentions](CKMentionsUtilities, "supportsSupplementalLexiconMentions"))
    {
      objc_msgSend(v8, "arrayByAddingObject:", CFSTR("com.apple.messages.mentions"));
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    if (!a3)
    {
      objc_msgSend(v8, "arrayByAddingObject:", CFSTR("com.apple.messages.photos"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!CKShouldShowSURF() || a4)
      {
        v8 = v10;
      }
      else
      {
        objc_msgSend(v10, "arrayByAddingObject:", CFSTR("com.apple.messages.surf"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend(getDDActionClass(), "setClientActionsDelegate:", self);
    objc_msgSend(v7, "setSupportedPayloadIds:", v8);
    objc_msgSend(v7, "setPayloadDelegate:", self);

  }
}

- (void)registerForTextInputPayloadHandlingForSenderHandleID:(id)a3 receiverHandleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isZelkovaEnabled");

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D39A00], "sharedCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __114__CKChatInputController_TextInputPayloads__registerForTextInputPayloadHandlingForSenderHandleID_receiverHandleID___block_invoke;
    v11[3] = &unk_1E274FBC8;
    v11[4] = self;
    v12 = v6;
    v13 = v7;
    objc_msgSend(v10, "shouldShowKeyboardSuggestionForInitiator:andReceiver:completion:", v12, v13, v11);

  }
}

void __114__CKChatInputController_TextInputPayloads__registerForTextInputPayloadHandlingForSenderHandleID_receiverHandleID___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __114__CKChatInputController_TextInputPayloads__registerForTextInputPayloadHandlingForSenderHandleID_receiverHandleID___block_invoke_2;
    block[3] = &unk_1E274A0B8;
    v3 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v5 = v3;
    v6 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __114__CKChatInputController_TextInputPayloads__registerForTextInputPayloadHandlingForSenderHandleID_receiverHandleID___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "textInputPayloadController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "supportedPayloadIds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "addObject:", *MEMORY[0x1E0D37500]);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      v9 = 138412802;
      v10 = v4;
      v11 = 2112;
      v12 = v6;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Updating supported Payload IDs: %@ for sender:%@ and receiver: %@", (uint8_t *)&v9, 0x20u);
    }

  }
  v8 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v2, "setSupportedPayloadIds:", v8);

}

- (void)unregisterForTextInputPayloadHandling
{
  CKChatInputController *v3;
  CKChatInputController *v4;
  id v5;

  -[CKChatInputController textInputPayloadController](self, "textInputPayloadController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "payloadDelegate");
  v3 = (CKChatInputController *)objc_claimAutoreleasedReturnValue();

  if (v3 == self)
  {
    objc_msgSend(v5, "setPayloadDelegate:", 0);
    objc_msgSend(v5, "setSupportedPayloadIds:", MEMORY[0x1E0C9AA60]);
  }
  objc_msgSend(getDDActionClass(), "clientActionsDelegate");
  v4 = (CKChatInputController *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
    objc_msgSend(getDDActionClass(), "setClientActionsDelegate:", 0);

}

- (void)presentPluginWithBundleID:(id)a3 appLaunchPayload:(id)a4
{
  id v6;
  const __CFString *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  if (objc_msgSend(v6, "count"))
    v7 = CFSTR("com.apple.messages.appLaunchURLPluginPayload");
  else
    v7 = 0;
  -[CKChatInputController _presentPluginWithBundleID:sendingTextInputPayload:withPayloadID:](self, "_presentPluginWithBundleID:sendingTextInputPayload:withPayloadID:", v8, v6, v7);

}

- (void)handlePayload:(id)a3 withPayloadId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  int v42;
  int v43;
  NSObject *v44;
  _BOOL4 v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  CKChatInputController *v49;
  uint8_t buf[4];
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.messages.currentLocation")))
    {
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isWaldoEnabled");

      if (v10)
      {
        objc_msgSend(v6, "valueForKey:", CFSTR("shouldSendRequestLocation"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "valueForKey:", CFSTR("shouldSendCurrentLocation"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "BOOLValue"))
        {
          -[CKChatInputController delegate](self, "delegate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "chatInputControllerDidSelectRequestLocation:", self);

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v12, "BOOLValue"))
            -[CKChatInputController showFindMyPlugin](self, "showFindMyPlugin");
        }

      }
      else
      {
        -[CKChatInputController delegate](self, "delegate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "sendCurrentLocation");

      }
    }
    else
    {
      if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D37500]))
      {
        v14 = (void *)*MEMORY[0x1E0D375D0];
        v15 = v8;
        objc_msgSend(v14, "stringByAppendingFormat:", CFSTR(":%@:%@"), CFSTR("0000000000"), v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D39A00], "sharedCoordinator");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "appPayloadID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "viewControllerForPluginIdentifier:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v19, "setSendDelegate:", self);
          v47[0] = MEMORY[0x1E0C809B0];
          v47[1] = 3221225472;
          v47[2] = __72__CKChatInputController_TextInputPayloads__handlePayload_withPayloadId___block_invoke;
          v47[3] = &unk_1E274BE58;
          v48 = v8;
          v49 = self;
          objc_msgSend(v19, "handleTextInputPayload:withPayloadID:completion:", v6, v48, v47);

        }
      }
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.messages.mentions")))
      {
        if (+[CKMentionsUtilities supportsSupplementalLexiconMentions](CKMentionsUtilities, "supportsSupplementalLexiconMentions"))
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("name"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "length"))
          {
            -[CKChatInputController entryView](self, "entryView");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "contentView");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "textView");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "insertMentionByName:", v20);

          }
        }
      }
      else if (!-[CKChatInputController _presentPluginIfNecessaryWithPayload:withPayloadID:](self, "_presentPluginIfNecessaryWithPayload:withPayloadID:", v6, v8))
      {
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.messages.stageSticker")))
        {
          __ck_UIStickerCreateStickerFromTextInputPayload(v6);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "representations");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "count") == 0;

          if (v27)
          {
            IMLogHandleForCategory();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              -[CKChatInputController(TextInputPayloads) handlePayload:withPayloadId:].cold.1(v28, v34, v35, v36, v37, v38, v39, v40);
          }
          else
          {
            objc_msgSend(v25, "_ck_plainStringEmojiText");
            v28 = objc_claimAutoreleasedReturnValue();
            if (-[NSObject length](v28, "length"))
            {
              IMLogHandleForCategory();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18DFCD000, v29, OS_LOG_TYPE_INFO, "Handling received sticker payload as plain string system emoji text", buf, 2u);
              }

              -[CKChatInputController entryView](self, "entryView");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "contentView");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "textView");
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v32, "insertText:", v28);
            }
            else
            {
              -[CKChatInputController targetConversation](self, "targetConversation");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v41, "supportsInlineAdaptiveImageGlyphs");

              v43 = objc_msgSend(v25, "_ck_shouldInsertInCompositionAsAdaptiveImageGlyph");
              IMLogHandleForCategory();
              v44 = objc_claimAutoreleasedReturnValue();
              v45 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);
              if ((v42 & v43) != 0)
              {
                if (v45)
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_18DFCD000, v44, OS_LOG_TYPE_INFO, "Handling received sticker payload as an adaptive image glyph", buf, 2u);
                }

                -[CKChatInputController insertUIStickerAsAdaptiveImageGlyph:](self, "insertUIStickerAsAdaptiveImageGlyph:", v25);
              }
              else
              {
                if (v45)
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_18DFCD000, v44, OS_LOG_TYPE_INFO, "Handling received sticker payload as staged sticker object", buf, 2u);
                }

                v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39B18]), "initWithUISticker:adaptiveImageGlyph:", v25, 0);
                -[CKChatInputController commitStickerBypassingValidation:forPlugin:stickerFrame:](self, "commitStickerBypassingValidation:forPlugin:stickerFrame:", v46, *MEMORY[0x1E0D374D0], *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

              }
            }
          }

        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v51 = v8;
            _os_log_impl(&dword_18DFCD000, v33, OS_LOG_TYPE_INFO, "Unhandled text input payload ID: %@", buf, 0xCu);
          }

        }
      }
    }
  }

}

void __72__CKChatInputController_TextInputPayloads__handlePayload_withPayloadId___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v8 = v5;
      v9 = 1024;
      v10 = a2;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Keyboard Suggestion. Plugin %@ did handle text input payload: %d", buf, 0x12u);
    }

  }
  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__CKChatInputController_TextInputPayloads__handlePayload_withPayloadId___block_invoke_79;
    block[3] = &unk_1E274A208;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __72__CKChatInputController_TextInputPayloads__handlePayload_withPayloadId___block_invoke_79(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "textInputPayloadController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "supportedPayloadIds");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "removeObject:", *MEMORY[0x1E0D37500]);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Removing SafetyMonitor as a supported payloadID. Updated list: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  v5 = (void *)objc_msgSend(v3, "copy");
  objc_msgSend(v1, "setSupportedPayloadIds:", v5);

}

- (void)insertUIStickerAsAdaptiveImageGlyph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  __ck_UIStickerCreateAdaptiveImageGlyphFromSticker();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CKChatInputController entryView](self, "entryView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textView");
    v8 = objc_claimAutoreleasedReturnValue();

    -[NSObject existingMediaObjectMatchingAdaptiveImageGlyph:](v8, "existingMediaObjectMatchingAdaptiveImageGlyph:", v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39B18]), "initWithUISticker:adaptiveImageGlyph:", v4, v5);
      +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "mediaObjectWithSticker:stickerUserInfo:", v10, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v12;
      }
      else
      {
        IMLogHandleForCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[CKChatInputController(TextInputPayloads) insertUIStickerAsAdaptiveImageGlyph:].cold.2(v20, v21, v22, v23, v24, v25, v26, v27);

        v9 = 0;
      }

    }
    -[NSObject insertAdaptiveImageGlyph:withMediaObject:](v8, "insertAdaptiveImageGlyph:withMediaObject:", v5, v9);

  }
  else
  {
    IMLogHandleForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CKChatInputController(TextInputPayloads) insertUIStickerAsAdaptiveImageGlyph:].cold.1(v8, v13, v14, v15, v16, v17, v18, v19);
  }

}

- (BOOL)_presentPluginIfNecessaryWithPayload:(id)a3 withPayloadID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0D37620];
  v15[0] = CFSTR("com.apple.messages.surf");
  v15[1] = CFSTR("com.apple.messages.photos");
  v9 = *MEMORY[0x1E0D375E8];
  v16[0] = v8;
  v16[1] = v9;
  v16[2] = *MEMORY[0x1E0D37560];
  v15[2] = CFSTR("com.apple.messages.animoji.stickers");
  v15[3] = CFSTR("com.apple.messages.stickers");
  IMStickersExtensionIdentifier();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForKeyedSubscript:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[CKChatInputController _formattedPayload:forPayloadID:](self, "_formattedPayload:forPayloadID:", v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKChatInputController _presentPluginWithBundleID:sendingTextInputPayload:withPayloadID:style:](self, "_presentPluginWithBundleID:sendingTextInputPayload:withPayloadID:style:", v12, v13, v7, objc_msgSend(v12, "isEqualToString:", v9));

  }
  return v12 != 0;
}

- (void)_stageStickerWithFileURL:(id)a3 accessibilityLabel:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  v6 = (objc_class *)MEMORY[0x1E0D39B18];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  objc_msgSend(v8, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D37560];
  v12 = (id)objc_msgSend(v9, "initWithStickerID:stickerPackID:fileURL:accessibilityLabel:moodCategory:stickerName:", v10, *MEMORY[0x1E0D37560], v8, v7, 0, 0);

  -[CKChatInputController commitStickerBypassingValidation:forPlugin:stickerFrame:](self, "commitStickerBypassingValidation:forPlugin:stickerFrame:", v12, v11, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (id)_formattedPayload:(id)a3 forPayloadID:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v7;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.messages.surf")) & 1) == 0)
  {
    v8 = v7;
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.messages.photos")))
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("message"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("Text"));
      v15 = CFSTR("Photos");
      v11 = (void *)objc_msgSend(v9, "copy");
      v14 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v8;
}

- (void)_presentPluginWithBundleID:(id)a3 sendingTextInputPayload:(id)a4 withPayloadID:(id)a5
{
  -[CKChatInputController _presentPluginWithBundleID:sendingTextInputPayload:withPayloadID:style:](self, "_presentPluginWithBundleID:sendingTextInputPayload:withPayloadID:style:", a3, a4, a5, 0);
}

- (void)_presentPluginWithBundleID:(id)a3 sendingTextInputPayload:(id)a4 withPayloadID:(id)a5 style:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "balloonPluginIdentifierForAppExtensionBundleIdentifier:", v10);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D37620]))
    {
      v15 = (id)*MEMORY[0x1E0D37628];

      +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "balloonPluginIdentifierForAppExtensionBundleIdentifier:", v15);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      v10 = v15;
    }
    else
    {
      v14 = 0;
    }
  }
  if (objc_msgSend(v10, "containsString:", *MEMORY[0x1E0D37500]))
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isZelkovaEnabled");

    if (v18)
    {
      v19 = objc_msgSend(v12, "length");
      v20 = v10;

      v10 = v20;
      if (!v19)
      {
        objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR(".NewMessage"), &stru_1E276D870);
        v10 = (id)objc_claimAutoreleasedReturnValue();

      }
      +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "balloonPluginIdentifierForAppExtensionBundleIdentifier:", v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0D39A00], "sharedCoordinator");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "appPayload");
        v11 = (id)objc_claimAutoreleasedReturnValue();

      }
      +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "viewControllerForPluginIdentifier:", v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v14 = v22;
        v12 = v20;
        goto LABEL_31;
      }
      objc_msgSend(v25, "setSendDelegate:", self);
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __115__CKChatInputController_TextInputPayloads___presentPluginWithBundleID_sendingTextInputPayload_withPayloadID_style___block_invoke;
      v37[3] = &unk_1E274A1B8;
      v26 = &v38;
      v14 = v22;
      v38 = v14;
      objc_msgSend(v25, "handleTextInputPayload:withPayloadID:completion:", v11, v20, v37);
      v12 = v20;
LABEL_29:

LABEL_31:
      goto LABEL_32;
    }
  }
  if (v14
    || objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D37570])
    && (+[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance"),
        v31 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v31, "balloonPluginIdentifierForAppExtensionBundleIdentifier:", v10),
        v14 = (id)objc_claimAutoreleasedReturnValue(),
        v31,
        v14))
  {
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "viewControllerForPluginIdentifier:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKChatInputController browserPlugin](self, "browserPlugin");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "identifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v29, "isEqualToString:", v14))
    {
      v30 = -[CKChatInputController isInputViewVisible](self, "isInputViewVisible");

      if (v30)
      {
LABEL_25:
        v34 = objc_msgSend(v11, "count");
        if (!v12 || !v34 || (objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_31;
        objc_msgSend(v25, "setSendDelegate:", self);
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __115__CKChatInputController_TextInputPayloads___presentPluginWithBundleID_sendingTextInputPayload_withPayloadID_style___block_invoke_97;
        v35[3] = &unk_1E274A1B8;
        v26 = &v36;
        v14 = v14;
        v36 = v14;
        objc_msgSend(v25, "handleTextInputPayload:withPayloadID:completion:", v11, v12, v35);
        goto LABEL_29;
      }
    }
    else
    {

    }
    objc_msgSend(v25, "balloonPlugin");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if ((CKIsSendMenuEnabled() & 1) != 0 || objc_msgSend(v32, "showInBrowser"))
    {
      objc_msgSend(v25, "balloonPluginDataSource");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKChatInputController launchAndShowBrowserForPlugin:dataSource:style:](self, "launchAndShowBrowserForPlugin:dataSource:style:", v32, v33, a6);

    }
    goto LABEL_25;
  }
LABEL_32:

}

void __115__CKChatInputController_TextInputPayloads___presentPluginWithBundleID_sendingTextInputPayload_withPayloadID_style___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 1024;
      v9 = a2;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Plugin %@ did handle text input payload: %d", (uint8_t *)&v6, 0x12u);
    }

  }
}

void __115__CKChatInputController_TextInputPayloads___presentPluginWithBundleID_sendingTextInputPayload_withPayloadID_style___block_invoke_97(uint64_t a1, int a2)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 1024;
      v9 = a2;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Plugin %@ did handle text input payload: %d", (uint8_t *)&v6, 0x12u);
    }

  }
}

- (BOOL)canHandleClientActionFromUrl:(id)a3
{
  return 1;
}

- (id)localizedTitleForClientActionFromUrl:(id)a3 context:(id)a4
{
  void *v4;
  void *v5;

  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DATA_DETECTORS_PHOTOS_ACTION"), &stru_1E276D870, CFSTR("ChatKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)handleClientActionFromUrl:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CKChatInputController *v25;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v8 = (_QWORD *)getkDataDetectorsReferenceDateKeySymbolLoc_ptr_0;
  v30 = getkDataDetectorsReferenceDateKeySymbolLoc_ptr_0;
  if (!getkDataDetectorsReferenceDateKeySymbolLoc_ptr_0)
  {
    v9 = (void *)DataDetectorsUILibrary_0();
    v8 = dlsym(v9, "kDataDetectorsReferenceDateKey");
    v28[3] = (uint64_t)v8;
    getkDataDetectorsReferenceDateKeySymbolLoc_ptr_0 = (uint64_t)v8;
  }
  _Block_object_dispose(&v27, 8);
  if (!v8)
    -[CKChatInputController(DDClientActionsDelegate) handleClientActionFromUrl:context:].cold.1();
  v25 = self;
  objc_msgSend(v6, "objectForKeyedSubscript:", *v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("Timestamp"));
  v11 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v12 = (_QWORD *)getkDataDetectorsLeadingTextSymbolLoc_ptr;
  v30 = getkDataDetectorsLeadingTextSymbolLoc_ptr;
  if (!getkDataDetectorsLeadingTextSymbolLoc_ptr)
  {
    v13 = (void *)DataDetectorsUILibrary_0();
    v12 = dlsym(v13, "kDataDetectorsLeadingText");
    v28[3] = (uint64_t)v12;
    getkDataDetectorsLeadingTextSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v27, 8);
  if (!v12)
    -[CKChatInputController(DDClientActionsDelegate) handleClientActionFromUrl:context:].cold.2();
  objc_msgSend(v6, "objectForKeyedSubscript:", *v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v11, "appendString:", v14);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v15 = (_QWORD *)getkDataDetectorsMiddleTextSymbolLoc_ptr;
  v30 = getkDataDetectorsMiddleTextSymbolLoc_ptr;
  if (!getkDataDetectorsMiddleTextSymbolLoc_ptr)
  {
    v16 = (void *)DataDetectorsUILibrary_0();
    v15 = dlsym(v16, "kDataDetectorsMiddleText");
    v28[3] = (uint64_t)v15;
    getkDataDetectorsMiddleTextSymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v27, 8);
  if (!v15)
    -[CKChatInputController(DDClientActionsDelegate) handleClientActionFromUrl:context:].cold.3();
  objc_msgSend(v6, "objectForKeyedSubscript:", *v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v11, "appendString:", v17);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v18 = (_QWORD *)getkDataDetectorsTrailingTextSymbolLoc_ptr;
  v30 = getkDataDetectorsTrailingTextSymbolLoc_ptr;
  if (!getkDataDetectorsTrailingTextSymbolLoc_ptr)
  {
    v19 = (void *)DataDetectorsUILibrary_0();
    v18 = dlsym(v19, "kDataDetectorsTrailingText");
    v28[3] = (uint64_t)v18;
    getkDataDetectorsTrailingTextSymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v27, 8);
  if (!v18)
    -[CKChatInputController(DDClientActionsDelegate) handleClientActionFromUrl:context:].cold.4();
  objc_msgSend(v6, "objectForKeyedSubscript:", *v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(v11, "appendString:", v20);
  if (objc_msgSend(v11, "length"))
  {
    v21 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, CFSTR("Text"));

  }
  v32 = CFSTR("Photos");
  v22 = (void *)objc_msgSend(v7, "copy");
  v31 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKChatInputController _presentPluginWithBundleID:sendingTextInputPayload:withPayloadID:style:](v25, "_presentPluginWithBundleID:sendingTextInputPayload:withPayloadID:style:", *MEMORY[0x1E0D375E8], v24, CFSTR("com.apple.messages.datadetectors.photos"), 1);
}

- (BOOL)shouldShowMoneyActionWithAmount:(id)a3 currencies:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char ShouldDisplayResultForDetectedAmount;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
    goto LABEL_9;
  if (!objc_msgSend(v7, "count"))
    goto LABEL_9;
  -[CKChatInputController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "recipientsCount");

  if (!v10 || !CKShouldShowSURF())
    goto LABEL_9;
  if (shouldShowMoneyActionWithAmount_currencies___pred_PKPeerPaymentShouldDisplayResultForDetectedAmountPassKitCore != -1)
    dispatch_once(&shouldShowMoneyActionWithAmount_currencies___pred_PKPeerPaymentShouldDisplayResultForDetectedAmountPassKitCore, &__block_literal_global_263);
  objc_msgSend(v8, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ShouldDisplayResultForDetectedAmount = PKPeerPaymentShouldDisplayResultForDetectedAmount();

  if ((ShouldDisplayResultForDetectedAmount & 1) != 0)
    v13 = 1;
  else
LABEL_9:
    v13 = 0;

  return v13;
}

uint64_t __93__CKChatInputController_DDClientActionsDelegate__shouldShowMoneyActionWithAmount_currencies___block_invoke()
{
  uint64_t result;

  result = MEMORY[0x193FF3C24]("PKPeerPaymentShouldDisplayResultForDetectedAmount", CFSTR("PassKitCore"));
  shouldShowMoneyActionWithAmount_currencies___PKPeerPaymentShouldDisplayResultForDetectedAmount = result;
  return result;
}

- (void)handleMoneyActionWithAmount:(id)a3 currencies:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  const __CFString *v25;
  void *v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && objc_msgSend(v7, "count"))
  {
    v20 = v6;
    objc_msgSend(v6, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          v27[0] = CFSTR("CurrencyType");
          v27[1] = CFSTR("CurrencyValue");
          v28[0] = v16;
          v28[1] = v9;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v17);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      }
      while (v13);
    }

    v25 = CFSTR("Currency");
    v18 = (void *)objc_msgSend(v10, "copy");
    v26 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKChatInputController _presentPluginWithBundleID:sendingTextInputPayload:withPayloadID:](self, "_presentPluginWithBundleID:sendingTextInputPayload:withPayloadID:", *MEMORY[0x1E0D37620], v19, CFSTR("com.apple.messages.datadetectors.currency"));
    v6 = v20;
  }

}

- (void)commitPayload:(CKBrowserItemPayload *)a3 forPlugin:(NSString *)a4 allowAllCommits:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  CKBrowserItemPayload *v19;
  NSString *v20;
  CKChatInputController *v21;
  uint64_t v22;

  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECF63C60);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a3;
  *(_QWORD *)(v15 + 24) = a4;
  *(_BYTE *)(v15 + 32) = a5;
  *(_QWORD *)(v15 + 40) = v14;
  *(_QWORD *)(v15 + 48) = self;
  v16 = sub_18E768BA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1EE10F268;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EE108D18;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = self;
  sub_18E691CC8((uint64_t)v13, (uint64_t)&unk_1EE109740, (uint64_t)v18);
  swift_release();
}

- (void)requestPhotoBrowserInitFromDraft:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Tried to load a photo draft but the plugin isn't available yet", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)requestPhotoBrowserInitFromDraft:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Tried to load a photo draft but there is no attachment available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)shouldLaunchPhotosAppForPlusButtonLongPressInMessageEntryView:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_18DFCD000, v0, OS_LOG_TYPE_DEBUG, "Not attempting to launch photos app following long press on plus button, photos app is already shown.", v1, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)balloonPluginForIndexPath:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_8(&dword_18DFCD000, v1, (uint64_t)v1, "Tried to select a balloon plugin at an invalid index: %@, visiblePlugins: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)messageEntryView:(uint64_t)a3 didSelectPluginAtIndex:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136315394;
  v4 = "-[CKChatInputController messageEntryView:didSelectPluginAtIndex:]";
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_8(&dword_18DFCD000, a2, a3, "%s can't select plugin at index: %@, aborting.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)_stickerPickerPlugin
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "Unable to load plugin for id: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)stickerPickerWasHiddenPreservingChatItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5_1(&dword_18DFCD000, v0, v1, "Sticker picker for chat item was hidden: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_beginPreviewCreationWithFileURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Trying to generate preview with nil URL.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)workingDraftDirForPluginIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_18DFCD000, v0, v1, "Failed to create draft directory for conversation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
