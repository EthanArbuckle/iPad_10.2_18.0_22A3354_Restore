@implementation CKMessageEditingViewController

- (void)modifySelectedTextByTogglingTextEffectType:(int64_t)a3
{
  id v4;

  -[CKMessageEditingViewController messageEditingView](self, "messageEditingView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modifySelectedTextByTogglingTextEffectType:", a3);

}

- (void)modifySelectedTextByTogglingTextStyle:(unint64_t)a3
{
  id v4;

  -[CKMessageEditingViewController messageEditingView](self, "messageEditingView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modifySelectedTextByTogglingTextStyle:", a3);

}

- (CKMessageEditingViewController)initWithTransitionContext:(id)a3 conversation:(id)a4
{
  id v7;
  id v8;
  CKMessageEditingViewController *v9;
  CKMessageEditingViewController *v10;
  CGSize v11;
  void *v12;
  int v13;
  CKTextEffectCoordinatorConfiguration *v14;
  _TtC7ChatKit23CKTextEffectCoordinator *v15;
  _TtC7ChatKit23CKTextEffectCoordinator *textEffectsCoordinator;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CKMessageEditingViewController;
  v9 = -[CKMessageEditingViewController init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_isInitialLoad = 1;
    objc_storeStrong((id *)&v9->_transitionContext, a3);
    v11 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v10->_editedMessageAchorPosition.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v10->_editedMessageAchorPosition.size = v11;
    objc_storeStrong((id *)&v10->_conversation, a4);
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isExpressiveTextEnabled");

    if (v13)
    {
      if (!+[CKTextEffectCoordinator messageEditingTextEffectCoordinationDisabled](_TtC7ChatKit23CKTextEffectCoordinator, "messageEditingTextEffectCoordinationDisabled"))
      {
        v14 = -[CKTextEffectCoordinatorConfiguration initWithLogIdentifier:timeAfterLastAnimationInSeconds:]([CKTextEffectCoordinatorConfiguration alloc], "initWithLogIdentifier:timeAfterLastAnimationInSeconds:", CFSTR("message_editing"), 3.5);
        v15 = -[CKTextEffectCoordinator initWithConfiguration:]([_TtC7ChatKit23CKTextEffectCoordinator alloc], "initWithConfiguration:", v14);
        textEffectsCoordinator = v10->_textEffectsCoordinator;
        v10->_textEffectsCoordinator = v15;

        -[CKTextEffectCoordinator setDelegate:](v10->_textEffectsCoordinator, "setDelegate:", v10);
      }
    }
  }

  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CKMessageEditingView *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  CKMentionsController *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CKMentionsController *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CKMessageEditingViewController;
  -[CKMessageEditingViewController viewDidLoad](&v28, sel_viewDidLoad);
  -[CKMessageEditingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", 0);

  v4 = objc_alloc(MEMORY[0x1E0CEABE8]);
  -[CKMessageEditingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v6 = (void *)objc_msgSend(v4, "initWithFrame:");

  -[CKMessageEditingViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertSubview:atIndex:", v6, 0);

  -[CKMessageEditingViewController setTranscriptOverlayView:](self, "setTranscriptOverlayView:", v6);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel_transcriptOverlayTapGestureRecognized_);
  objc_msgSend(v6, "addGestureRecognizer:", v8);
  v9 = -[CKMessageEditingView initWithMessageEditingViewDelegate:]([CKMessageEditingView alloc], "initWithMessageEditingViewDelegate:", self);
  -[CKMessageEditingView setMessageEditingViewDelegate:](v9, "setMessageEditingViewDelegate:", self);
  objc_msgSend(v6, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v9);

  -[CKMessageEditingViewController setMessageEditingView:](self, "setMessageEditingView:", v9);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isExpressiveTextEnabled");

  if (v12)
  {
    -[CKMessageEditingViewController conversation](self, "conversation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "chat");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "supportsCapabilities:", 0x100000);

    -[CKMessageEditingViewController messageEditingView](self, "messageEditingView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "messageEditingBalloonView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "messageEditingBalloonTextView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setExpressiveTextEnabled:", v15);

  }
  v19 = [CKMentionsController alloc];
  -[CKMessageEditingViewController messageEditingView](self, "messageEditingView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "messageEditingBalloonView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "messageEditingBalloonTextView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKMessageEditingViewController conversation](self, "conversation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[CKMentionsController initWithEntryTextView:conversation:](v19, "initWithEntryTextView:conversation:", v22, v23);
  -[CKMessageEditingViewController setMentionsController:](self, "setMentionsController:", v24);

  -[CKMessageEditingViewController mentionsController](self, "mentionsController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "deferredSetup");

  -[CKMessageEditingViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setNeedsLayout");

  -[CKMessageEditingViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "layoutIfNeeded");

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  dispatch_time_t v18;
  BOOL IsEmpty;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double MaxY;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  double v53;
  CGRect v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  _QWORD block[5];
  objc_super v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  v60.receiver = self;
  v60.super_class = (Class)CKMessageEditingViewController;
  -[CKMessageEditingViewController viewDidLayoutSubviews](&v60, sel_viewDidLayoutSubviews);
  -[CKMessageEditingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[CKMessageEditingViewController messageEditingView](self, "messageEditingView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v57 = v14;
  v58 = v13;
  v55 = v16;
  v56 = v15;

  -[CKMessageEditingViewController transcriptOverlayView](self, "transcriptOverlayView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v5, v7, v9, v11);

  if (-[CKMessageEditingViewController isInitialLoad](self, "isInitialLoad"))
  {
    -[CKMessageEditingViewController configureForInitialAppearance](self, "configureForInitialAppearance");
    -[CKMessageEditingViewController setIsInitialLoad:](self, "setIsInitialLoad:", 0);
    v18 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__CKMessageEditingViewController_viewDidLayoutSubviews__block_invoke;
    block[3] = &unk_1E274A208;
    block[4] = self;
    dispatch_after(v18, MEMORY[0x1E0C80D38], block);
  }
  IsEmpty = CGRectIsEmpty(self->_editedMessageAchorPosition);
  x = v5;
  y = v7;
  width = v9;
  height = v11;
  if (!IsEmpty)
  {
    x = self->_editedMessageAchorPosition.origin.x;
    y = self->_editedMessageAchorPosition.origin.y;
    width = self->_editedMessageAchorPosition.size.width;
    height = self->_editedMessageAchorPosition.size.height;
  }
  v54.origin.x = x;
  v54.origin.y = y;
  v54.size.width = width;
  v54.size.height = height;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "messageEditingKeyboardToBalloonPreferredPadding");
  v53 = v25;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "messageEditingKeyboardToBalloonMinimumPadding");
  v28 = v27;

  -[CKMessageEditingViewController interactionDelegate](self, "interactionDelegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "transcriptContentInsetsForMessageEditingViewController:", self);
  v31 = v30;
  v33 = v32;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "messageEditingBalloonToNavBarMinimumPadding");
  v36 = v35;

  v61.origin.x = v5;
  v61.origin.y = v7;
  v61.size.width = v9;
  v61.size.height = v11;
  v37 = v36 + v31 + CGRectGetMinY(v61);
  v62.origin.x = v5;
  v62.origin.y = v7;
  v62.size.width = v9;
  v62.size.height = v11;
  v38 = CGRectGetMaxY(v62) - v33;
  v39 = v38 - v53;
  v40 = v38 - v28;
  -[CKMessageEditingViewController messageEditingView](self, "messageEditingView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "sizeThatFits:", v9, v11);
  v43 = v42;

  MaxY = CGRectGetMaxY(v54);
  if (v39 < MaxY)
    MaxY = v39;
  v45 = MaxY - v43;
  if (v45 >= v37)
    v46 = v45;
  else
    v46 = v37;
  v47 = v43 + v46;
  if (v43 + v46 >= v40)
    v47 = v40;
  v48 = v47 - v46;
  -[CKMessageEditingViewController messageEditingView](self, "messageEditingView", *(_QWORD *)&v53);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setFrame:", v5, v46, v9, v48);

  -[CKMessageEditingViewController messageEditingView](self, "messageEditingView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "frame");
  v64.origin.y = v57;
  v64.origin.x = v58;
  v64.size.height = v55;
  v64.size.width = v56;
  if (CGRectEqualToRect(v63, v64))
  {

  }
  else
  {
    -[CKMessageEditingViewController messageEditingView](self, "messageEditingView");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "firstLayoutPassCompleted");

    if (v52)
      -[CKMessageEditingViewController _informDelegateOfUpdatedBalloonViewFrame](self, "_informDelegateOfUpdatedBalloonViewFrame");
  }
}

void __55__CKMessageEditingViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "textEffectsCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPaused:includingAnimators:", 0, 1);

  objc_msgSend(*(id *)(a1 + 32), "textEffectsCoordinator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateWithReason:", CFSTR("resuming coordinator because CKMessageEditingViewController did finish initialLoad"));

}

- (BOOL)becomeFirstResponder
{
  void *v2;
  char v3;

  -[CKMessageEditingViewController messageEditingView](self, "messageEditingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
}

- (void)configureForInitialAppearance
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "visibleChatItemToFrameMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_8(&dword_18DFCD000, a3, v6, "Anchor chat item %@ has no frame in the visible chat item map for inital layout. Map: %@", (uint8_t *)&v7);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKMessageEditingViewController;
  -[CKMessageEditingViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  -[CKMessageEditingViewController _animateIn](self, "_animateIn");
  -[CKMessageEditingViewController mentionsController](self, "mentionsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "checkForMentions");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  double v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  void *v11;
  _QWORD v12[4];
  void (**v13)(_QWORD);
  id v14;
  _QWORD aBlock[4];
  id v16[2];
  id location;
  objc_super v18;
  CGRect v19;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CKMessageEditingViewController;
  -[CKMessageEditingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v18, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[CKMessageEditingViewController editedMessageAchorPosition](self, "editedMessageAchorPosition");
  if (!CGRectIsEmpty(v19) && !-[CKMessageEditingViewController isInitialLoad](self, "isInitialLoad"))
  {
    -[CKMessageEditingViewController viewHeightForEditedMessageAnchorPosition](self, "viewHeightForEditedMessageAnchorPosition");
    if (vabdd_f64(v8, height) > 2.22044605e-16)
    {
      location = 0;
      objc_initWeak(&location, self);
      v9 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __85__CKMessageEditingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
      aBlock[3] = &unk_1E2750A18;
      objc_copyWeak(v16, &location);
      v16[1] = *(id *)&height;
      v10 = (void (**)(_QWORD))_Block_copy(aBlock);
      v11 = v10;
      if (v7)
      {
        v12[0] = v9;
        v12[1] = 3221225472;
        v12[2] = __85__CKMessageEditingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
        v12[3] = &unk_1E2756018;
        v13 = v10;
        objc_copyWeak(&v14, &location);
        objc_msgSend(v7, "animateAlongsideTransition:completion:", v12, 0);
        objc_destroyWeak(&v14);

      }
      else
      {
        v10[2](v10);
      }

      objc_destroyWeak(v16);
      objc_destroyWeak(&location);
    }
  }

}

void __85__CKMessageEditingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  id *v6;
  id WeakRetained;
  double v8;
  id v9;
  void *v10;
  id v11;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setEditedMessageAchorPosition:", v2, v3, v4, v5);

  v8 = *(double *)(a1 + 40);
  v9 = objc_loadWeakRetained(v6);
  objc_msgSend(v9, "setViewHeightForEditedMessageAnchorPosition:", v8);

  v11 = objc_loadWeakRetained(v6);
  objc_msgSend(v11, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsLayout");

}

void __85__CKMessageEditingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutIfNeeded");

}

- (void)dismissAndRejectChanges
{
  if (!-[CKMessageEditingViewController animatingOut](self, "animatingOut"))
    -[CKMessageEditingViewController _animateOutWithState:](self, "_animateOutWithState:", 4);
}

- (void)dismissIfNoChanges
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  -[CKMessageEditingViewController messageEditingView](self, "messageEditingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentComposition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMessageEditingViewController messageEditingView](self, "messageEditingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "originalComposition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v4, "isPlainTextEqual:", v6);
  v7 = IMOSLoggingEnabled();
  if ((_DWORD)v5)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Message content is unchanged, dismissing edit view controller", buf, 2u);
      }

    }
    -[CKMessageEditingViewController _animateOutWithState:](self, "_animateOutWithState:", 4);
  }
  else if (v7)
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Message content is changed, not dismissing edit view controller", v10, 2u);
    }

  }
}

- (void)_animateIn
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL IsReduceMotionEnabled;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD aBlock[5];
  BOOL v23;

  -[CKMessageEditingViewController setAnimatingIn:](self, "setAnimatingIn:", 1);
  -[CKMessageEditingViewController transcriptOverlayView](self, "transcriptOverlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageEditingAnimateInDuration");
    v6 = v5;

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "messageEditingAnimateInDamping");
    v9 = v8;

    -[CKMessageEditingViewController transcriptOverlayTransitionDelegate](self, "transcriptOverlayTransitionDelegate");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v10, "transcriptOverlayViewControllerWillAnimateIn:", self);

    -[CKMessageEditingViewController splitViewController](self, "splitViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = objc_msgSend(v11, "isCollapsed");
    -[CKMessageEditingViewController splitViewController](self, "splitViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((v10 & 1) != 0)
      objc_msgSend(v12, "masterViewController");
    else
      objc_msgSend(v12, "detailViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "navigationBar");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNeedsLayout");

    objc_msgSend(v14, "navigationBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "layoutIfNeeded");

    IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    v18 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__CKMessageEditingViewController__animateIn__block_invoke;
    aBlock[3] = &unk_1E274CA88;
    v23 = IsReduceMotionEnabled;
    aBlock[4] = self;
    v19 = _Block_copy(aBlock);
    v21[0] = v18;
    v21[1] = 3221225472;
    v21[2] = __44__CKMessageEditingViewController__animateIn__block_invoke_2;
    v21[3] = &unk_1E274A1B8;
    v21[4] = self;
    v20 = _Block_copy(v21);
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v19, v20, v6, 0.0, v9, 0.0);

  }
}

void __44__CKMessageEditingViewController__animateIn__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
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
  id v15;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "messageEditingView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAlpha:", 1.0);

  }
  objc_msgSend(*(id *)(a1 + 32), "messageEditingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMessageEditingViewState:", 2);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "theme");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageEditingTranscriptOverlayBackgroundEffects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transcriptOverlayView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundEffects:", v6);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "theme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageEditingTranscriptOverlayBackgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "transcriptOverlayView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v10);

  objc_msgSend(*(id *)(a1 + 32), "transcriptOverlayTransitionDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transcriptOverlayViewControllerIsAnimatingIn:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "interactionDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "messageEditingViewControllerIsAnimatingIn:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "messageEditingView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 32), "messageEditingView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutIfNeeded");

}

uint64_t __44__CKMessageEditingViewController__animateIn__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setAnimatingIn:", 0);
  objc_msgSend(*(id *)(a1 + 32), "transcriptOverlayTransitionDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transcriptOverlayViewControllerDidAnimateIn:", *(_QWORD *)(a1 + 32));

  return objc_msgSend(*(id *)(a1 + 32), "_applyProofreadingIfNecessary");
}

- (void)_animateOutWithState:(int64_t)a3
{
  void *v5;
  BOOL IsReduceMotionEnabled;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  BOOL v36;
  _QWORD aBlock[10];
  BOOL v38;
  uint8_t buf[16];

  -[CKMessageEditingViewController interactionDelegate](self, "interactionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageEditingViewControllerWillAnimateOut:", self);

  -[CKMessageEditingViewController setAnimatingOut:](self, "setAnimatingOut:", 1);
  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(_QWORD *)(MEMORY[0x1E0C9D648] + 24);
  -[CKMessageEditingViewController transitionContext](self, "transitionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!IsReduceMotionEnabled)
  {
    objc_msgSend(v11, "anchorChatItemGUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
    {
      -[CKMessageEditingViewController transcriptOverlayTransitionDelegate](self, "transcriptOverlayTransitionDelegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "updatedFrameMapForTranscriptOverlayViewController:", self);
      v15 = objc_claimAutoreleasedReturnValue();

      -[NSObject objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "CGRectValue");
        v7 = v18;
        v8 = v19;
        v9 = v20;
        v10 = v21;
      }
      else
      {
        IMLogHandleForCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[CKMessageEditingViewController _animateOutWithState:].cold.2((uint64_t)v13, (uint64_t)v15, v22);

      }
    }
    else
    {
      IMLogHandleForCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[CKMessageEditingViewController _animateOutWithState:].cold.1((uint64_t)v12, v15);
    }

  }
  if (a3 == 4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "Edit rejected, resetting balloon to original text", buf, 2u);
      }

    }
    -[CKMessageEditingViewController messageEditingView](self, "messageEditingView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "resetMessageToOriginalContent");

  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "messageEditingAnimateOutDuration");
  v27 = v26;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "messageEditingAnimateOutDamping");
  v30 = v29;

  -[CKMessageEditingViewController transcriptOverlayTransitionDelegate](self, "transcriptOverlayTransitionDelegate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "transcriptOverlayViewControllerWillAnimateOut:", self);

  v32 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__CKMessageEditingViewController__animateOutWithState___block_invoke;
  aBlock[3] = &unk_1E2756040;
  aBlock[4] = self;
  v38 = IsReduceMotionEnabled;
  aBlock[5] = v7;
  aBlock[6] = v8;
  aBlock[7] = v9;
  aBlock[8] = v10;
  aBlock[9] = a3;
  v33 = _Block_copy(aBlock);
  v35[0] = v32;
  v35[1] = 3221225472;
  v35[2] = __55__CKMessageEditingViewController__animateOutWithState___block_invoke_2;
  v35[3] = &unk_1E2756068;
  v36 = IsReduceMotionEnabled;
  v35[4] = self;
  v34 = _Block_copy(v35);
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 4, v33, v34, v27, 0.0, v30, 0.0);
  if (!IsReduceMotionEnabled)
    -[CKMessageEditingViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__requestDismissal, 0, v27);

}

void __55__CKMessageEditingViewController__animateOutWithState___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "transcriptOverlayView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundEffects:", MEMORY[0x1E0C9AA60]);

  objc_msgSend(*(id *)(a1 + 32), "transcriptOverlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", 0);

  if (*(_BYTE *)(a1 + 80) || CGRectIsEmpty(*(CGRect *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "messageEditingView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", 0.0);
  }
  else
  {
    v5 = *(double *)(a1 + 40);
    v6 = *(double *)(a1 + 48);
    v7 = *(double *)(a1 + 56);
    v8 = *(double *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "messageEditingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFrame:", v5, v6, v7, v8);

    v10 = *(_QWORD *)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 32), "messageEditingView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMessageEditingViewState:", v10);

    objc_msgSend(*(id *)(a1 + 32), "messageEditingView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNeedsLayout");

    objc_msgSend(*(id *)(a1 + 32), "messageEditingView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutIfNeeded");
  }

  objc_msgSend(*(id *)(a1 + 32), "interactionDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "messageEditingViewControllerIsAnimatingOut:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "transcriptOverlayTransitionDelegate");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "transcriptOverlayViewControllerIsAnimatingOut:", *(_QWORD *)(a1 + 32));

}

void __55__CKMessageEditingViewController__animateOutWithState___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "_requestDismissal");
  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 0);

  objc_msgSend(*(id *)(a1 + 32), "interactionDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageEditingViewControllerDidFinishAnimatingOut:", *(_QWORD *)(a1 + 32));

}

- (void)_requestDismissal
{
  void *v3;
  id v4;

  -[CKMessageEditingViewController transcriptOverlayTransitionDelegate](self, "transcriptOverlayTransitionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transcriptOverlayViewControllerDidAnimateOut:", self);

  -[CKMessageEditingViewController interactionDelegate](self, "interactionDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageEditingViewControllerRequestsDismissal:presentKeyboard:", self, 1);

}

- (void)transcriptOverlayTapGestureRecognized:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Transcript overlay tap gesture recognized", v6, 2u);
    }

  }
  -[CKMessageEditingViewController dismissIfNoChanges](self, "dismissIfNoChanges");

}

- (void)messageEditingViewConfirmButtonSelected:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint8_t v15[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Confirm edit button selected", v15, 2u);
    }

  }
  objc_msgSend(v4, "currentComposition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    objc_msgSend(v4, "originalComposition");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v6, "hasNotBeenEdited:", v9);
    if (v10)
      v11 = 0;
    else
      v11 = v6;
    if (v10)
      v12 = 4;
    else
      v12 = 3;
    v13 = v11;
    -[CKMessageEditingViewController interactionDelegate](self, "interactionDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "messageEditingViewController:confirmedEditWithComposition:", self, v13);

    -[CKMessageEditingViewController _animateOutWithState:](self, "_animateOutWithState:", v12);
  }
  else
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CKMessageEditingViewController messageEditingViewConfirmButtonSelected:].cold.1(v9);
  }

}

- (void)messageEditingViewRejectButtonSelected:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Reject edit button selected", v6, 2u);
    }

  }
  -[CKMessageEditingViewController _animateOutWithState:](self, "_animateOutWithState:", 4);

}

- (double)messageEditingViewDismissAnimationBalloonMaxWidth
{
  void *v3;
  double v4;
  double v5;

  -[CKMessageEditingViewController interactionDelegate](self, "interactionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "balloonMaxWidthForMessageEditingViewController:", self);
  v5 = v4;

  return v5;
}

- (UIEdgeInsets)messageEditingViewDismissAnimationContentInsets
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
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
  double v17;
  UIEdgeInsets result;

  -[CKMessageEditingViewController transitionContext](self, "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anchorChatItemGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMessageEditingViewController interactionDelegate](self, "interactionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageEditingViewController:contentInsetsForChatItemGuid:", self, v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (BOOL)messageEditingViewBalloonHasTail
{
  CKMessageEditingViewController *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  -[CKMessageEditingViewController transitionContext](self, "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anchorChatItemGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMessageEditingViewController interactionDelegate](v2, "interactionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v5, "messageEditingViewController:balloonHasTailForChatItemGuid:", v2, v4);

  return (char)v2;
}

- (char)messageEditingColor
{
  CKMessageEditingViewController *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = self;
  -[CKMessageEditingViewController transitionContext](self, "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anchorChatItemGUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMessageEditingViewController interactionDelegate](v2, "interactionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v5, "messageEditingViewController:colorForChatItemGuid:", v2, v4);

  return (char)v2;
}

- (void)messageEditingViewDidUpdateBalloonViewContent:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  _TtC7ChatKit23CKTextEffectCoordinator *textEffectsCoordinator;

  -[CKMessageEditingViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isExpressiveTextEnabled");

  if (v6)
  {
    textEffectsCoordinator = self->_textEffectsCoordinator;
    if (textEffectsCoordinator)
      -[CKTextEffectCoordinator updateWithReason:](textEffectsCoordinator, "updateWithReason:", CFSTR("message editing balloon view did update balloon view content"));
  }
}

- (void)messageEditingView:(id)a3 didChangeTextAnimationInRange:(_NSRange)a4
{
  NSUInteger location;
  void *v6;
  int v7;
  CKTextEffectCoordinatorContinuationState *v8;

  location = a4.location;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", a3, a4.location, a4.length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isExpressiveTextEnabled");

  if (v7)
  {
    if (self->_textEffectsCoordinator)
    {
      v8 = -[CKTextEffectCoordinatorContinuationState initWithTextViewIdentifier:locationInAttributedText:ignoreTextViewEligibilityCheck:]([CKTextEffectCoordinatorContinuationState alloc], "initWithTextViewIdentifier:locationInAttributedText:ignoreTextViewEligibilityCheck:", CFSTR("textView"), location, 0);
      -[CKTextEffectCoordinator resetAndContinueFromState:](self->_textEffectsCoordinator, "resetAndContinueFromState:", v8);

    }
  }
}

- (void)_informDelegateOfUpdatedBalloonViewFrame
{
  void *v3;
  id v4;

  -[CKMessageEditingViewController interactionDelegate](self, "interactionDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKMessageEditingView balloonViewForAlignment](self->_messageEditingView, "balloonViewForAlignment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageEditingViewController:didUpdateFrameForBalloonView:", self, v3);

}

- (UIView)balloonViewForAlignment
{
  void *v2;
  void *v3;

  -[CKMessageEditingViewController messageEditingView](self, "messageEditingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "balloonViewForAlignment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)transcriptContentInsetsDidChange
{
  void *v3;
  id v4;

  -[CKMessageEditingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

  -[CKMessageEditingViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (void)_applyProofreadingIfNecessary
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isProofreadingEnabled");

  if (v4)
  {
    -[CKMessageEditingViewController messageEditingView](self, "messageEditingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applyGrammarCheckingIndication");

    -[CKMessageEditingViewController interactionDelegate](self, "interactionDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "proofReadingInfoForMessageEditingViewController:", self);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      -[CKMessageEditingViewController transitionContext](self, "transitionContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "anchorChatItemGUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D35438]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0D35430]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count"))
        {
          -[CKMessageEditingViewController messageEditingView](self, "messageEditingView");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "underlineWithProofreadingInfo:", v10);

        }
      }

    }
  }
}

- (BOOL)wantsBackingTranscriptToIgnoreContentOffsetChanges
{
  return 1;
}

- (id)visibleTextViewIdentifiersFor:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("textView");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)textEffectCoordinator:(id)a3 textViewIdentifierIsCandidateForTextEffectPlayback:(id)a4
{
  return objc_msgSend(a4, "isEqualToString:", CFSTR("textView"));
}

- (id)textEffectCoordinator:(id)a3 textViewForTextViewIdentifier:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  if (objc_msgSend(a4, "isEqualToString:", CFSTR("textView")))
  {
    -[CKMessageEditingViewController messageEditingView](self, "messageEditingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "messageEditingBalloonView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "messageEditingBalloonTextView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)textEffectCoordinator:(id)a3 highPriorityTextViewIdentifiersForUnplayedVisibleTextViewIdentifiers:(id)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)canStartNewTextAnimationsInTextEffectCoordinator:(id)a3
{
  return 1;
}

- (CKTranscriptOverlayTransitionDelegate)transcriptOverlayTransitionDelegate
{
  return (CKTranscriptOverlayTransitionDelegate *)objc_loadWeakRetained((id *)&self->_transcriptOverlayTransitionDelegate);
}

- (void)setTranscriptOverlayTransitionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_transcriptOverlayTransitionDelegate, a3);
}

- (CKMessageEditingViewControllerInteractionDelegate)interactionDelegate
{
  return (CKMessageEditingViewControllerInteractionDelegate *)objc_loadWeakRetained((id *)&self->_interactionDelegate);
}

- (void)setInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interactionDelegate, a3);
}

- (double)entryViewOffset
{
  return self->_entryViewOffset;
}

- (void)setEntryViewOffset:(double)a3
{
  self->_entryViewOffset = a3;
}

- (CKTranscriptOverlayTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContext, a3);
}

- (BOOL)isInitialLoad
{
  return self->_isInitialLoad;
}

- (void)setIsInitialLoad:(BOOL)a3
{
  self->_isInitialLoad = a3;
}

- (BOOL)animatingIn
{
  return self->_animatingIn;
}

- (void)setAnimatingIn:(BOOL)a3
{
  self->_animatingIn = a3;
}

- (BOOL)animatingOut
{
  return self->_animatingOut;
}

- (void)setAnimatingOut:(BOOL)a3
{
  self->_animatingOut = a3;
}

- (UIVisualEffectView)transcriptOverlayView
{
  return self->_transcriptOverlayView;
}

- (void)setTranscriptOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptOverlayView, a3);
}

- (CKMessageEditingView)messageEditingView
{
  return self->_messageEditingView;
}

- (void)setMessageEditingView:(id)a3
{
  objc_storeStrong((id *)&self->_messageEditingView, a3);
}

- (CGRect)editedMessageAchorPosition
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_editedMessageAchorPosition.origin.x;
  y = self->_editedMessageAchorPosition.origin.y;
  width = self->_editedMessageAchorPosition.size.width;
  height = self->_editedMessageAchorPosition.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setEditedMessageAchorPosition:(CGRect)a3
{
  self->_editedMessageAchorPosition = a3;
}

- (double)viewHeightForEditedMessageAnchorPosition
{
  return self->_viewHeightForEditedMessageAnchorPosition;
}

- (void)setViewHeightForEditedMessageAnchorPosition:(double)a3
{
  self->_viewHeightForEditedMessageAnchorPosition = a3;
}

- (NSDictionary)proofreadingInfo
{
  return self->_proofreadingInfo;
}

- (void)setProofreadingInfo:(id)a3
{
  objc_storeStrong((id *)&self->_proofreadingInfo, a3);
}

- (CKMentionsController)mentionsController
{
  return self->_mentionsController;
}

- (void)setMentionsController:(id)a3
{
  objc_storeStrong((id *)&self->_mentionsController, a3);
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (_TtC7ChatKit23CKTextEffectCoordinator)textEffectsCoordinator
{
  return self->_textEffectsCoordinator;
}

- (void)setTextEffectsCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_textEffectsCoordinator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textEffectsCoordinator, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_mentionsController, 0);
  objc_storeStrong((id *)&self->_proofreadingInfo, 0);
  objc_storeStrong((id *)&self->_messageEditingView, 0);
  objc_storeStrong((id *)&self->_transcriptOverlayView, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_destroyWeak((id *)&self->_transcriptOverlayTransitionDelegate);
}

- (void)_animateOutWithState:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "Anchor chat item not on transition context for animate out animation. Context: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_animateOutWithState:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_8(&dword_18DFCD000, a3, (uint64_t)a3, "Anchor chat item %@ has no frame in the visible chat item map for animating out. Map: %@", (uint8_t *)&v3);
}

- (void)messageEditingViewConfirmButtonSelected:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "Ignoring attempt to edit message to an empty string.", v1, 2u);
}

@end
