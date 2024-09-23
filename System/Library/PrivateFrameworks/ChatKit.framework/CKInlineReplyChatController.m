@implementation CKInlineReplyChatController

+ (Class)transcriptControllerClass
{
  return (Class)objc_opt_class();
}

- (CKInlineReplyChatController)initWithConversation:(id)a3 threadIdentifier:(id)a4 threadOriginator:(id)a5 transitionContext:(id)a6 originatorMessageSummaryInfo:(id)a7 parentChatController:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  CKInlineReplyChatController *v19;
  CKInlineReplyChatController *v20;
  objc_super v22;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v22.receiver = self;
  v22.super_class = (Class)CKInlineReplyChatController;
  v19 = -[CKChatController initWithConversation:](&v22, sel_initWithConversation_, a3);
  v20 = v19;
  if (v19)
  {
    -[CKInlineReplyChatController setParentChatController:](v19, "setParentChatController:", v18);
    -[CKInlineReplyChatController setIsInitialLoad:](v20, "setIsInitialLoad:", 1);
    -[CKInlineReplyChatController setIsInitialSizing:](v20, "setIsInitialSizing:", 1);
    -[CKInlineReplyChatController setThreadOriginator:](v20, "setThreadOriginator:", v15);
    -[CKInlineReplyChatController setThreadIdentifier:](v20, "setThreadIdentifier:", v14);
    -[CKInlineReplyChatController setTransitionContext:](v20, "setTransitionContext:", v16);
    -[CKScrollViewController setEnableContentPinning:](v20, "setEnableContentPinning:", 1);
    v20->_showNavbarKeyline = 1;
    objc_storeStrong((id *)&v20->_originatorMessageSummaryInfo, a7);
  }

  return v20;
}

+ (Class)_gradientReferenceViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isModal
{
  void *v2;
  char v3;

  -[CKInlineReplyChatController transitionContext](self, "transitionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wantsModalPresentation");

  return v3;
}

- (BOOL)isUnanimated
{
  void *v2;
  char v3;

  -[CKInlineReplyChatController transitionContext](self, "transitionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wantsUnanimatedPresentation");

  return v3;
}

- (BOOL)isInline
{
  return 1;
}

- (BOOL)shouldListParticipantsInTitle
{
  return 0;
}

- (void)_doneButtonPressed
{
  if (-[CKInlineReplyChatController isModal](self, "isModal"))
    -[CKChatController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)dismissController
{
  -[CKInlineReplyChatController dismissControllerWithCompletion:](self, "dismissControllerWithCompletion:", 0);
}

- (void)dismissControllerWithCompletion:(id)a3
{
  id v4;
  id *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (-[CKInlineReplyChatController isModal](self, "isModal"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__CKInlineReplyChatController_dismissControllerWithCompletion___block_invoke;
    v8[3] = &unk_1E274AED0;
    v5 = &v9;
    v9 = v4;
    -[CKChatController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v8);
LABEL_5:

    goto LABEL_6;
  }
  if (!-[CKInlineReplyChatController animatingOut](self, "animatingOut"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__CKInlineReplyChatController_dismissControllerWithCompletion___block_invoke_2;
    v6[3] = &unk_1E274C308;
    v5 = &v7;
    v7 = v4;
    -[CKInlineReplyChatController _animateOutWithCompletion:](self, "_animateOutWithCompletion:", v6);
    goto LABEL_5;
  }
LABEL_6:

}

uint64_t __63__CKInlineReplyChatController_dismissControllerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __63__CKInlineReplyChatController_dismissControllerWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (double)accessoryViewHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[CKChatController entryView](self, "entryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "frame");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)updateScrollGeometryWithoutAnimationForReason:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;
  CGRect v7;

  v4 = a3;
  -[CKChatController entryView](self, "entryView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  -[CKScrollViewController setContentPinningThreshold:](self, "setContentPinningThreshold:", CGRectGetHeight(v7));

  v6.receiver = self;
  v6.super_class = (Class)CKInlineReplyChatController;
  -[CKScrollViewController updateScrollGeometryWithoutAnimationForReason:](&v6, sel_updateScrollGeometryWithoutAnimationForReason_, v4);

}

- (void)updateScrollGeometryForReason:(id)a3 withDuration:(double)a4 animationCurve:(int64_t)a5
{
  id v8;
  void *v9;
  objc_super v10;
  CGRect v11;

  v8 = a3;
  -[CKChatController entryView](self, "entryView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  -[CKScrollViewController setContentPinningThreshold:](self, "setContentPinningThreshold:", CGRectGetHeight(v11));

  v10.receiver = self;
  v10.super_class = (Class)CKInlineReplyChatController;
  -[CKScrollViewController updateScrollGeometryForReason:withDuration:animationCurve:](&v10, sel_updateScrollGeometryForReason_withDuration_animationCurve_, v8, a5, a4);

}

- (CGSize)contentSizeForPinning
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[CKChatController collectionView](self, "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionViewContentSize");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (UIEdgeInsets)navigationBarInsetsWithoutPalette
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  -[CKInlineReplyChatController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeAreaInsets");
  v4 = v3;

  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  v8 = v4;
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v8;
  return result;
}

- (CGRect)gradientFrameWithInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v25;
  CGRect result;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  if (-[CKInlineReplyChatController isModal](self, "isModal"))
  {
    v25.receiver = self;
    v25.super_class = (Class)CKInlineReplyChatController;
    -[CKCoreChatController gradientFrameWithInsets:](&v25, sel_gradientFrameWithInsets_, top, left, bottom, right);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
  }
  else
  {
    -[CKInlineReplyChatController interactionDelegate](self, "interactionDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "inlineReplyController:gradientFrameWithInsets:", self, top, left, bottom, right);
    v9 = v17;
    v11 = v18;
    v13 = v19;
    v15 = v20;

  }
  v21 = v9;
  v22 = v11;
  v23 = v13;
  v24 = v15;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (id)inputAccessoryView
{
  void *v3;
  objc_super v5;

  if (-[CKInlineReplyChatController isModal](self, "isModal"))
  {
    v5.receiver = self;
    v5.super_class = (Class)CKInlineReplyChatController;
    -[CKChatController inputAccessoryView](&v5, sel_inputAccessoryView);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)inputViewController
{
  void *v3;
  objc_super v5;

  if (-[CKInlineReplyChatController isModal](self, "isModal"))
  {
    v5.receiver = self;
    v5.super_class = (Class)CKInlineReplyChatController;
    -[CKChatController inputViewController](&v5, sel_inputViewController);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)reloadInputViews
{
  id v3;
  objc_super v4;

  if (-[CKInlineReplyChatController isModal](self, "isModal"))
  {
    v4.receiver = self;
    v4.super_class = (Class)CKInlineReplyChatController;
    -[CKInlineReplyChatController reloadInputViews](&v4, sel_reloadInputViews);
  }
  else
  {
    -[CKInlineReplyChatController interactionDelegate](self, "interactionDelegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "inlineReplyControllerRequestsReloadInputViews:", self);

  }
}

- (id)inputController
{
  void *v4;
  void *v5;
  objc_super v6;

  if (-[CKInlineReplyChatController isModal](self, "isModal"))
  {
    v6.receiver = self;
    v6.super_class = (Class)CKInlineReplyChatController;
    -[CKCoreChatController inputController](&v6, sel_inputController);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKInlineReplyChatController interactionDelegate](self, "interactionDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inlineReplyControllerChatInputController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
}

- (void)reloadEntryViewIfNeeded
{
  objc_super v3;

  if (-[CKInlineReplyChatController isModal](self, "isModal"))
  {
    v3.receiver = self;
    v3.super_class = (Class)CKInlineReplyChatController;
    -[CKChatController reloadEntryViewIfNeeded](&v3, sel_reloadEntryViewIfNeeded);
  }
}

- (void)addOrRemoveEntryViewIfNeeded
{
  objc_super v3;

  if (-[CKInlineReplyChatController isModal](self, "isModal"))
  {
    v3.receiver = self;
    v3.super_class = (Class)CKInlineReplyChatController;
    -[CKChatController addOrRemoveEntryViewIfNeeded](&v3, sel_addOrRemoveEntryViewIfNeeded);
  }
}

- (void)setUpEntryViewLayoutConstraintsIfNecessary
{
  objc_super v3;

  if (-[CKInlineReplyChatController isModal](self, "isModal"))
  {
    v3.receiver = self;
    v3.super_class = (Class)CKInlineReplyChatController;
    -[CKChatController setUpEntryViewLayoutConstraintsIfNecessary](&v3, sel_setUpEntryViewLayoutConstraintsIfNecessary);
  }
}

- (BOOL)becomeFirstResponder
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v7;
  char v8;
  objc_super v9;

  -[CKInlineReplyChatController interactionDelegate](self, "interactionDelegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3 && (v4 = (void *)v3, v5 = -[CKInlineReplyChatController isModal](self, "isModal"), v4, !v5))
  {
    -[CKInlineReplyChatController interactionDelegate](self, "interactionDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "inlineReplyControllerBecomeFirstResponder:", self);

    return v8;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CKInlineReplyChatController;
    return -[CKChatController becomeFirstResponder](&v9, sel_becomeFirstResponder);
  }
}

- (void)setTargetFirstResponder:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  BOOL v7;
  id v8;
  objc_super v9;

  -[CKInlineReplyChatController interactionDelegate](self, "interactionDelegate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5 && (v6 = (void *)v5, v7 = -[CKInlineReplyChatController isModal](self, "isModal"), v6, !v7))
  {
    -[CKInlineReplyChatController interactionDelegate](self, "interactionDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "inlineReplyController:setTargetFirstResponder:", self, a3);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CKInlineReplyChatController;
    -[CKChatController setTargetFirstResponder:](&v9, sel_setTargetFirstResponder_, a3);
  }
}

- (int64_t)targetFirstResponder
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  void *v7;
  int64_t v8;
  objc_super v9;

  -[CKInlineReplyChatController interactionDelegate](self, "interactionDelegate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3 && (v4 = (void *)v3, v5 = -[CKInlineReplyChatController isModal](self, "isModal"), v4, !v5))
  {
    -[CKInlineReplyChatController interactionDelegate](self, "interactionDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "inlineReplyControllerTargetFirstResponder:", self);

    return v8;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CKInlineReplyChatController;
    return -[CKChatController targetFirstResponder](&v9, sel_targetFirstResponder);
  }
}

- (BOOL)messageEntryViewWidth:(double *)a3 andOffset:(double *)a4
{
  uint64_t v7;
  void *v8;
  BOOL v9;
  void *v11;
  char v12;
  objc_super v13;

  -[CKInlineReplyChatController interactionDelegate](self, "interactionDelegate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7 && (v8 = (void *)v7, v9 = -[CKInlineReplyChatController isModal](self, "isModal"), v8, !v9))
  {
    -[CKInlineReplyChatController interactionDelegate](self, "interactionDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "inlineReplyController:containerWidth:offset:", self, a3, a4);

    return v12;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CKInlineReplyChatController;
    return -[CKChatController messageEntryViewWidth:andOffset:](&v13, sel_messageEntryViewWidth_andOffset_, a3, a4);
  }
}

- (void)setIsShowingPreview:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKInlineReplyChatController;
  -[CKChatController setIsShowingPreview:](&v6, sel_setIsShowingPreview_);
  -[CKInlineReplyChatController interactionDelegate](self, "interactionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inlineReplyController:setIsShowingPreview:", self, v3);

}

- (void)messageEntryViewSendLaterPluginInfoUpdated:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v4 = a3;
  -[CKInlineReplyChatController threadOriginator](self, "threadOriginator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "scheduleType");

  if (v6 == 2)
    -[CKInlineReplyChatController dismissController](self, "dismissController");
  v7.receiver = self;
  v7.super_class = (Class)CKInlineReplyChatController;
  -[CKChatController messageEntryViewSendLaterPluginInfoUpdated:](&v7, sel_messageEntryViewSendLaterPluginInfoUpdated_, v4);

}

- (void)messageEntryViewDidBeginEditingNotAlreadyActive:(id)a3
{
  id v4;
  objc_super *v5;
  CKInlineReplyChatController *v6;
  objc_super v7;

  v4 = a3;
  if (-[CKInlineReplyChatController isModal](self, "isModal"))
  {
    v6 = self;
    v5 = (objc_super *)&v6;
LABEL_7:
    v5->super_class = (Class)CKInlineReplyChatController;
    -[objc_super messageEntryViewDidBeginEditingNotAlreadyActive:](v5, sel_messageEntryViewDidBeginEditingNotAlreadyActive_, v4, v6);
    goto LABEL_8;
  }
  if (-[CKInlineReplyChatController targetFirstResponder](self, "targetFirstResponder") == 1)
    -[CKInlineReplyChatController setTargetFirstResponder:](self, "setTargetFirstResponder:", 0);
  if (!-[CKInlineReplyChatController animatingIn](self, "animatingIn"))
  {
    v7.receiver = self;
    v5 = &v7;
    goto LABEL_7;
  }
LABEL_8:

}

- (void)updateActiveEntryViewPositioningGuide
{
  void *v3;
  objc_super v4;

  if (-[CKInlineReplyChatController isModal](self, "isModal"))
  {
    v4.receiver = self;
    v4.super_class = (Class)CKInlineReplyChatController;
    -[CKChatController updateActiveEntryViewPositioningGuide](&v4, sel_updateActiveEntryViewPositioningGuide);
  }
  -[CKInlineReplyChatController interactionDelegate](self, "interactionDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateActiveEntryViewPositioningGuideForInlineReplyController:", self);

}

- (void)messageEntryView:(id)a3 didMoveToWindow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKInlineReplyChatController;
  v6 = a4;
  v7 = a3;
  -[CKChatController messageEntryView:didMoveToWindow:](&v9, sel_messageEntryView_didMoveToWindow_, v7, v6);
  -[CKInlineReplyChatController interactionDelegate](self, "interactionDelegate", v9.receiver, v9.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "inlineReplyController:messageEntryView:didMoveToWindow:", self, v7, v6);

}

- (UIEdgeInsets)transcriptContentInsetsForMessageEditingViewController:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  objc_super v22;
  objc_super v23;
  UIEdgeInsets result;

  v4 = a3;
  if (-[CKInlineReplyChatController isModal](self, "isModal"))
  {
    v23.receiver = self;
    v23.super_class = (Class)CKInlineReplyChatController;
    -[CKChatController transcriptContentInsetsForMessageEditingViewController:](&v23, sel_transcriptContentInsetsForMessageEditingViewController_, v4);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    -[CKInlineReplyChatController interactionDelegate](self, "interactionDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "parentTranscriptContentInsetsForInlineReplyController:", self);
    v6 = v14;
    v8 = v15;
    v12 = v16;
    v22.receiver = self;
    v22.super_class = (Class)CKInlineReplyChatController;
    -[CKChatController transcriptContentInsetsForMessageEditingViewController:](&v22, sel_transcriptContentInsetsForMessageEditingViewController_, v4);
    v10 = v17;

  }
  v18 = v6;
  v19 = v8;
  v20 = v10;
  v21 = v12;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (void)appCardDidChangeEntryViewAlignmentHeight:(double)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)CKInlineReplyChatController;
  -[CKChatController appCardDidChangeEntryViewAlignmentHeight:animated:](&v8, sel_appCardDidChangeEntryViewAlignmentHeight_animated_);
  -[CKInlineReplyChatController interactionDelegate](self, "interactionDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inlineReplyController:appCardDidChangeEntryViewAlignmentHeight:animated:", self, v4, a3);

}

- (double)visibleInputViewHeight
{
  double result;
  void *v4;
  double v5;
  double v6;
  objc_super v7;

  if (-[CKInlineReplyChatController isModal](self, "isModal"))
  {
    v7.receiver = self;
    v7.super_class = (Class)CKInlineReplyChatController;
    -[CKChatController visibleInputViewHeight](&v7, sel_visibleInputViewHeight);
  }
  else
  {
    -[CKInlineReplyChatController interactionDelegate](self, "interactionDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "visibleInputViewHeightForInlineReplyController:", self);
    v6 = v5;

    return v6;
  }
  return result;
}

- (UIEdgeInsets)_contentInsetForSendAnimation
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  UIEdgeInsets result;

  v18.receiver = self;
  v18.super_class = (Class)CKInlineReplyChatController;
  -[CKChatController _contentInsetForSendAnimation](&v18, sel__contentInsetForSendAnimation);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKChatController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentInset");
  v13 = v4 + v12 - v4;

  v14 = v13;
  v15 = v6;
  v16 = v8;
  v17 = v10;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (double)throwAnimationFinalFrameOffset:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[CKInlineReplyChatController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaInsets");
  v5 = v4;

  return v5;
}

- (void)sendMessage:(id)a3 forConversation:(id)a4 onService:(id)a5 newComposition:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v6 = a6;
  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      -[CKInlineReplyChatController threadIdentifier](self, "threadIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 136315394;
      v19 = "-[CKInlineReplyChatController sendMessage:forConversation:onService:newComposition:]";
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "%s Sending reply with thread identifier %@", (uint8_t *)&v18, 0x16u);

    }
  }
  -[CKInlineReplyChatController threadIdentifier](self, "threadIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setThreadIdentifier:", v15);

  -[CKInlineReplyChatController threadOriginator](self, "threadOriginator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInlineReplyChatController _imMessageForIMMessageItem:](self, "_imMessageForIMMessageItem:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setThreadOriginator:", v17);
  objc_msgSend(v11, "sendMessage:onService:newComposition:", v10, v12, v6);
  -[CKInlineReplyChatController collectMetricsForSending:](self, "collectMetricsForSending:", v10);

}

- (void)sendMessage:(id)a3 forConversation:(id)a4 newComposition:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v5 = a5;
  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      -[CKInlineReplyChatController threadIdentifier](self, "threadIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136315394;
      v16 = "-[CKInlineReplyChatController sendMessage:forConversation:newComposition:]";
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "%s Sending reply with thread identifier %@", (uint8_t *)&v15, 0x16u);

    }
  }
  -[CKInlineReplyChatController threadIdentifier](self, "threadIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setThreadIdentifier:", v12);

  -[CKInlineReplyChatController threadOriginator](self, "threadOriginator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInlineReplyChatController _imMessageForIMMessageItem:](self, "_imMessageForIMMessageItem:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setThreadOriginator:", v14);
  objc_msgSend(v9, "sendMessage:newComposition:", v8, v5);
  -[CKInlineReplyChatController collectMetricsForSending:](self, "collectMetricsForSending:", v8);

}

- (void)_didSendCompositionInConversation:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKInlineReplyChatController;
  -[CKChatController _didSendCompositionInConversation:](&v5, sel__didSendCompositionInConversation_, a3);
  -[CKInlineReplyChatController interactionDelegate](self, "interactionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inlineReplyControllerDidSendComposition:", self);

}

- (void)collectMetricsForSending:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[CKInlineReplyChatController originatorMessageSummaryInfo](self, "originatorMessageSummaryInfo", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__im_associatedMessageContentType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "integerValue");

  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D385F8];
  v9 = CFSTR("originatorType");
  IMMetricsValueForAssociatedMessageContentType();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trackEvent:withDictionary:", v6, v8);

}

- (BOOL)throwAnimationUsesAnimatedReloadForMessages:(id)a3
{
  return 0;
}

- (void)tapGestureRecognized:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKInlineReplyChatController;
  -[CKChatController tapGestureRecognized:](&v4, sel_tapGestureRecognized_, a3);
  -[CKInlineReplyChatController dismissController](self, "dismissController");
}

- (id)_defaultTranscriptNavBarAppearance
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CKInlineReplyChatController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "standardAppearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_msgSend(v5, "configureWithTransparentBackground");
  return v5;
}

- (id)_navigationBarAppearanceWithKeyline:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;

  v3 = a3;
  -[CKInlineReplyChatController _defaultTranscriptNavBarAppearance](self, "_defaultTranscriptNavBarAppearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "configureWithDefaultShadow");
  else
    objc_msgSend(v4, "configureWithoutShadow");
  return v5;
}

- (void)setShowNavbarKeyline:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  if (self->_showNavbarKeyline != a3)
  {
    v3 = a3;
    self->_showNavbarKeyline = a3;
    if (!-[CKInlineReplyChatController animatingIn](self, "animatingIn"))
    {
      -[CKInlineReplyChatController _navigationBarAppearanceWithKeyline:](self, "_navigationBarAppearanceWithKeyline:", v3);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (-[CKInlineReplyChatController isModal](self, "isModal"))
      {
        -[CKInlineReplyChatController navigationItem](self, "navigationItem");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[CKInlineReplyChatController parentViewController](self, "parentViewController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "navigationItem");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v5, "setStandardAppearance:", v7);
      objc_msgSend(v5, "setScrollEdgeAppearance:", v7);

    }
  }
}

- (void)viewDidLoad
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  CKInlineReplyTransparentBlurBackgroundView *v11;
  void *v12;
  CKInlineReplyTransparentBlurBackgroundView *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  uint8_t buf[16];

  IMLogHandleForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "viewDidLoad", buf, 2u);
  }

  v17.receiver = self;
  v17.super_class = (Class)CKInlineReplyChatController;
  -[CKChatController viewDidLoad](&v17, sel_viewDidLoad);
  -[CKInlineReplyChatController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", 0);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "replyTranscriptBackgroundDoesSupportTransparentBlurVisualEffect");

  IMLogHandleForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Using UIVisualEffectView for backgroudn blur", buf, 2u);
    }

    v9 = objc_alloc(MEMORY[0x1E0CEABE8]);
    -[CKInlineReplyChatController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v11 = (CKInlineReplyTransparentBlurBackgroundView *)objc_msgSend(v9, "initWithFrame:");

    -[CKInlineReplyChatController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertSubview:atIndex:", v11, 0);

    -[CKInlineReplyChatController setBlurView:](self, "setBlurView:", v11);
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Using CKInlineReplyTransparentBlurBackgroundView for background blur", buf, 2u);
    }

    v13 = [CKInlineReplyTransparentBlurBackgroundView alloc];
    -[CKInlineReplyChatController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v11 = -[CKInlineReplyTransparentBlurBackgroundView initWithFrame:](v13, "initWithFrame:");

    -[CKInlineReplyTransparentBlurBackgroundView setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CKInlineReplyChatController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "insertSubview:atIndex:", v11, 0);

    -[CKInlineReplyChatController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView __ck_makeEdgesEqualTo:](v11, "__ck_makeEdgesEqualTo:", v16);

    -[CKInlineReplyChatController setBlurParentView:](self, "setBlurParentView:", v11);
  }

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CKInlineReplyChatController;
  -[CKChatController viewDidLayoutSubviews](&v14, sel_viewDidLayoutSubviews);
  -[CKInlineReplyChatController blurView](self, "blurView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKInlineReplyChatController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    -[CKInlineReplyChatController blurView](self, "blurView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  }
}

- (void)viewIsAppearing:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  objc_super v24;
  uint8_t buf[4];
  _BOOL8 v26;
  __int16 v27;
  _BOOL8 v28;
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "viewIsAppearing", buf, 2u);
  }

  v24.receiver = self;
  v24.super_class = (Class)CKInlineReplyChatController;
  -[CKInlineReplyChatController viewIsAppearing:](&v24, sel_viewIsAppearing_, v3);
  v6 = -[CKInlineReplyChatController isInitialLoad](self, "isInitialLoad");
  IMLogHandleForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Performing initialLoad", buf, 2u);
    }

    -[CKInlineReplyChatController interactionDelegate](self, "interactionDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "inlineReplyControllerIsAppearing:", self);

    v10 = -[CKInlineReplyChatController isModal](self, "isModal");
    v11 = -[CKInlineReplyChatController isUnanimated](self, "isUnanimated");
    v12 = v11;
    if (v10 || v11)
    {
      IMLogHandleForCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        v26 = v10;
        v27 = 2048;
        v28 = v12;
        _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Calling _animateIn during initialLoad due to isModal: %ld isUnanimated:%ld", buf, 0x16u);
      }

      -[CKInlineReplyChatController _animateIn:](self, "_animateIn:", 1);
      -[CKInlineReplyChatController traitCollection](self, "traitCollection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "userInterfaceStyle");

      -[CKChatController entryView](self, "entryView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v18 == 2)
        v21 = 7;
      else
        v21 = 8;
      objc_msgSend(v19, "setStyle:", v21);

      -[CKChatController navbarCanvasViewController](self, "navbarCanvasViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setNavBarContext:", 2);

      -[CKInlineReplyChatController setTargetFirstResponder:](self, "setTargetFirstResponder:", 1);
      -[CKInlineReplyChatController becomeFirstResponder](self, "becomeFirstResponder");
    }
    else
    {
      -[CKInlineReplyChatController inlineCollectionViewController](self, "inlineCollectionViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAnimatingIn:", 1);

      -[CKChatController navbarCanvasViewController](self, "navbarCanvasViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setNavBarContext:", 1);

      if (UIAccessibilityIsReduceMotionEnabled())
      {
        -[CKChatController collectionView](self, "collectionView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setAlpha:", 0.0);
      }
      else
      {
        -[CKInlineReplyChatController transcriptOverlayTransitionDelegate](self, "transcriptOverlayTransitionDelegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKInlineReplyChatController _visibleGUIDs](self, "_visibleGUIDs");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "transcriptOverlayViewController:visibleGUIDsDidChange:", self, v23);

      }
      if (-[CKInlineReplyChatController shouldReloadInsetsForFloatingKeyboard](self, "shouldReloadInsetsForFloatingKeyboard"))
      {
        -[CKScrollViewController inputAccessoryViewFrameUpdatedForFloatingKeyboard](self, "inputAccessoryViewFrameUpdatedForFloatingKeyboard");
      }
    }
    -[CKInlineReplyChatController setIsInitialLoad:](self, "setIsInitialLoad:", 0);
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "viewIsAppearing, but initialLoad has already been completed", buf, 2u);
    }

  }
}

- (void)applyInitialContextToCollectionViewIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!UIAccessibilityIsReduceMotionEnabled() && !-[CKInlineReplyChatController isUnanimated](self, "isUnanimated"))
  {
    -[CKInlineReplyChatController transitionContext](self, "transitionContext");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CKInlineReplyChatController inlineCollectionViewController](self, "inlineCollectionViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "visibleChatItemToFrameMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCollectionViewCurrentFramesForNextLayout:", v4);
    -[CKInlineReplyChatController transitionContext](self, "transitionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "replyTransitionProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTransitionProperties:", v6);

  }
}

- (UIEdgeInsets)calculateTranscriptMarginInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  UIEdgeInsets result;

  v24.receiver = self;
  v24.super_class = (Class)CKInlineReplyChatController;
  -[CKCoreChatController calculateTranscriptMarginInsets](&v24, sel_calculateTranscriptMarginInsets);
  v6 = v5;
  v8 = v7;
  v9 = v3;
  v10 = v4;
  v11 = *MEMORY[0x1E0CEB4B0];
  if (*(double *)(MEMORY[0x1E0CEB4B0] + 8) == v7
    && v11 == v6
    && *(double *)(MEMORY[0x1E0CEB4B0] + 24) == v4
    && *(double *)(MEMORY[0x1E0CEB4B0] + 16) == v3)
  {
    -[CKInlineReplyChatController transitionContext](self, "transitionContext", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "transcriptMarginInsets");
    v6 = v16;
    v8 = v17;
    v9 = v18;
    v10 = v19;

  }
  v20 = v6;
  v21 = v8;
  v22 = v9;
  v23 = v10;
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (UIEdgeInsets)calculateTranscriptSafeAreaInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  UIEdgeInsets result;

  v24.receiver = self;
  v24.super_class = (Class)CKInlineReplyChatController;
  -[CKCoreChatController calculateTranscriptSafeAreaInsets](&v24, sel_calculateTranscriptSafeAreaInsets);
  v6 = v5;
  v8 = v7;
  v9 = v3;
  v10 = v4;
  v11 = *MEMORY[0x1E0CEB4B0];
  if (*(double *)(MEMORY[0x1E0CEB4B0] + 8) == v7
    && v11 == v6
    && *(double *)(MEMORY[0x1E0CEB4B0] + 24) == v4
    && *(double *)(MEMORY[0x1E0CEB4B0] + 16) == v3)
  {
    -[CKInlineReplyChatController transitionContext](self, "transitionContext", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "transcriptSafeAreaInsets");
    v6 = v16;
    v8 = v17;
    v9 = v18;
    v10 = v19;

  }
  v20 = v6;
  v21 = v8;
  v22 = v9;
  v23 = v10;
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (CGRect)_initialFrameForCollectionView
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[CKInlineReplyChatController transitionContext](self, "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentCollectionViewFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  -[CKInlineReplyChatController calculateTranscriptSafeAreaInsets](self, "calculateTranscriptSafeAreaInsets");
  v11 = v10;
  v12 = v9 - v10;

  v13 = v5;
  v14 = v11;
  v15 = v7;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_initialFrameForGradientReferenceView
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[CKInlineReplyChatController transitionContext](self, "transitionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentCollectionViewFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[16];

  v3 = a3;
  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "viewDidAppear", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)CKInlineReplyChatController;
  -[CKChatController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
  if (!-[CKInlineReplyChatController isModal](self, "isModal"))
    -[CKInlineReplyChatController _animateIn:](self, "_animateIn:", 0);
}

- (void)transcriptCollectionViewControllerDidSetChatItems:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKInlineReplyChatController;
  -[CKChatController transcriptCollectionViewControllerDidSetChatItems:](&v6, sel_transcriptCollectionViewControllerDidSetChatItems_, a3);
  -[CKInlineReplyChatController transcriptOverlayTransitionDelegate](self, "transcriptOverlayTransitionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInlineReplyChatController _visibleGUIDs](self, "_visibleGUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transcriptOverlayViewController:visibleGUIDsDidChange:", self, v5);

}

- (void)transcriptCollectionViewControllerRestingStateDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKInlineReplyChatController;
  -[CKCoreChatController transcriptCollectionViewControllerRestingStateDidChange:](&v8, sel_transcriptCollectionViewControllerRestingStateDidChange_, v4);
  if (!UIAccessibilityIsReduceMotionEnabled())
  {
    if (-[CKInlineReplyChatController animatingOut](self, "animatingOut"))
    {
      objc_msgSend(v4, "collectionView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "collectionViewLayout");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isResting");

      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
        -[CKInlineReplyChatController _requestDismissal](self, "_requestDismissal");
      }
    }
  }

}

- (void)transcriptCollectionViewController:(id)a3 collectionViewContentSizeDidChange:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  double v12;
  double v13;
  BOOL v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  objc_super v21;

  height = a4.height;
  width = a4.width;
  v21.receiver = self;
  v21.super_class = (Class)CKInlineReplyChatController;
  -[CKCoreChatController transcriptCollectionViewController:collectionViewContentSizeDidChange:](&v21, sel_transcriptCollectionViewController_collectionViewContentSizeDidChange_, a3);
  -[CKInlineReplyChatController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatController collectionView](self, "collectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCollectionView:", v8);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isOOPKeyboardEnabled");

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "transcriptScrollToBottomDuration");
  v13 = v12;

  -[CKInlineReplyChatController updateScrollGeometryForReason:withDuration:animationCurve:](self, "updateScrollGeometryForReason:withDuration:animationCurve:", CFSTR("InlineReplyContentCentering"), 0, v13);
  v14 = width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (!v14 && -[CKInlineReplyChatController isInitialSizing](self, "isInitialSizing"))
  {
    if (v10)
    {
      -[CKChatController collectionView](self, "collectionView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "endHoldingContentOffsetUpdatesForReason:", CFSTR("InlineReplyChatController"));

    }
    -[CKInlineReplyChatController transitionContext](self, "transitionContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "presentWithKeyboard");

    if (v17)
    {
      -[CKInlineReplyChatController transitionContext](self, "transitionContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "wantsModalPresentation");

      if (!v19)
      {
        -[CKChatController showKeyboardForReply](self, "showKeyboardForReply");
        if ((v10 & 1) != 0)
          goto LABEL_13;
        goto LABEL_12;
      }
      -[CKInlineReplyChatController setTargetFirstResponder:](self, "setTargetFirstResponder:", 1);
    }
    if ((v10 & 1) != 0)
    {
LABEL_13:
      -[CKInlineReplyChatController _setInitialScrollPositionIfNecessary](self, "_setInitialScrollPositionIfNecessary");
      -[CKInlineReplyChatController setIsInitialSizing:](self, "setIsInitialSizing:", 0);
      goto LABEL_14;
    }
LABEL_12:
    -[CKChatController collectionView](self, "collectionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "endHoldingContentOffsetUpdatesForReason:", CFSTR("InlineReplyChatController"));

    goto LABEL_13;
  }
LABEL_14:

}

- (void)transcriptCollectionViewController:(id)a3 didScroll:(CGPoint)a4
{
  double y;
  void *v6;
  double v7;
  _BOOL8 v8;

  y = a4.y;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a3, a4.x);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topTranscriptSpace");
  v8 = y > v7;

  -[CKInlineReplyChatController setShowNavbarKeyline:](self, "setShowNavbarKeyline:", v8);
}

- (double)transcriptCollectionViewController:(id)a3 targetAlphaForChatItem:(id)a4
{
  id v4;
  char isKindOfClass;
  double result;

  v4 = a4;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  result = 1.0;
  if ((isKindOfClass & 1) != 0)
    return 0.5;
  return result;
}

- (void)_animateIn:(BOOL)a3
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL IsReduceMotionEnabled;
  uint64_t v30;
  void (**v31)(_QWORD);
  void (**v32)(_QWORD);
  void (**v33)(_QWORD);
  void *v34;
  _QWORD v35[4];
  void (**v36)(_QWORD);
  _QWORD v37[5];
  _QWORD aBlock[5];
  NSObject *v39;
  BOOL v40;
  objc_super v41;
  uint8_t buf[16];

  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Performing _animateIn", buf, 2u);
  }

  if (-[CKInlineReplyChatController hasCompletedAnimationIn](self, "hasCompletedAnimationIn")
    || -[CKInlineReplyChatController animatingOut](self, "animatingOut"))
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "> Call made to perform _animateIn:, but we've already done this. Will not re-perform _animateIn:", buf, 2u);
    }
    goto LABEL_22;
  }
  -[CKInlineReplyChatController setAnimatingIn:](self, "setAnimatingIn:", 1);
  -[CKInlineReplyChatController blurView](self, "blurView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

LABEL_10:
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "replyTranscriptBackgroundBlurAnimationTime");
    v11 = v10;

    -[CKInlineReplyChatController transcriptOverlayTransitionDelegate](self, "transcriptOverlayTransitionDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transcriptOverlayViewControllerWillAnimateIn:", self);

    -[CKChatController navbarCanvasViewController](self, "navbarCanvasViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "backButtonView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAlpha:", 0.0);

    -[CKChatController navbarCanvasViewController](self, "navbarCanvasViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "unifiedCallButton");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAlpha:", 0.0);

    if (!-[CKInlineReplyChatController isModal](self, "isModal"))
    {
      v41.receiver = self;
      v41.super_class = (Class)CKInlineReplyChatController;
      -[CKChatController _defaultTranscriptNavBarAppearance](&v41, sel__defaultTranscriptNavBarAppearance);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKInlineReplyChatController parentViewController](self, "parentViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "navigationItem");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setStandardAppearance:", v17);

      -[CKInlineReplyChatController parentViewController](self, "parentViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "navigationItem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setScrollEdgeAppearance:", v17);

    }
    if (-[CKInlineReplyChatController isModal](self, "isModal"))
    {
      -[CKInlineReplyChatController navigationController](self, "navigationController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CKChatController splitViewController](self, "splitViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isCollapsed");
      -[CKChatController splitViewController](self, "splitViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if ((v24 & 1) != 0)
        objc_msgSend(v25, "masterViewController");
      else
        objc_msgSend(v25, "detailViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v22, "navigationBar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setNeedsLayout");

    objc_msgSend(v22, "navigationBar");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "layoutIfNeeded");

    IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    v30 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __42__CKInlineReplyChatController__animateIn___block_invoke;
    aBlock[3] = &unk_1E274E150;
    v40 = IsReduceMotionEnabled;
    aBlock[4] = self;
    v6 = v22;
    v39 = v6;
    v31 = (void (**)(_QWORD))_Block_copy(aBlock);
    v37[0] = v30;
    v37[1] = 3221225472;
    v37[2] = __42__CKInlineReplyChatController__animateIn___block_invoke_2;
    v37[3] = &unk_1E274A208;
    v37[4] = self;
    v32 = (void (**)(_QWORD))_Block_copy(v37);
    v33 = v32;
    if (a3)
    {
      v31[2](v31);
      v33[2](v33);
    }
    else
    {
      v34 = (void *)MEMORY[0x1E0CEABB0];
      v35[0] = v30;
      v35[1] = 3221225472;
      v35[2] = __42__CKInlineReplyChatController__animateIn___block_invoke_154;
      v35[3] = &unk_1E274C308;
      v36 = v32;
      objc_msgSend(v34, "animateWithDuration:animations:completion:", v31, v35, v11);

    }
    goto LABEL_22;
  }
  -[CKInlineReplyChatController blurParentView](self, "blurParentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_10;
  IMLogHandleForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[CKInlineReplyChatController _animateIn:].cold.1(v6);
LABEL_22:

}

void __42__CKInlineReplyChatController__animateIn___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAlpha:", 1.0);

  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "replyTranscriptBackgroundDoesSupportTransparentBlurVisualEffect");

  if (v4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "theme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "replyTranscriptBlurBackgroundEffects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "blurView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundEffects:", v7);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "theme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "replyTranscriptBlurBackgroundColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "blurView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v11);

    objc_msgSend(*(id *)(a1 + 32), "blurView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setGroupName:", CFSTR("inlineReplyVisualEffectViewGroup"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "blurParentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "animateIn");
  }

  objc_msgSend(*(id *)(a1 + 32), "_navigationBarAppearanceWithKeyline:", objc_msgSend(*(id *)(a1 + 32), "showNavbarKeyline"));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(*(id *)(a1 + 32), "isModal");
  v15 = *(void **)(a1 + 32);
  if ((v14 & 1) != 0)
  {
    objc_msgSend(v15, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v15, "parentViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v16, "setStandardAppearance:", v21);
  objc_msgSend(v16, "setScrollEdgeAppearance:", v21);
  objc_msgSend(*(id *)(a1 + 40), "navigationBar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setNeedsLayout");

  objc_msgSend(*(id *)(a1 + 40), "navigationBar");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "transcriptOverlayTransitionDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "transcriptOverlayViewControllerIsAnimatingIn:", *(_QWORD *)(a1 + 32));

}

void __42__CKInlineReplyChatController__animateIn___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  IMLogHandleForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Finished performing _animateIn", v5, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setAnimatingIn:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setHasCompletedAnimationIn:", 1);
  objc_msgSend(*(id *)(a1 + 32), "inlineCollectionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnimatingIn:", 0);

  objc_msgSend(*(id *)(a1 + 32), "transcriptOverlayTransitionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transcriptOverlayViewControllerDidAnimateIn:", *(_QWORD *)(a1 + 32));

}

uint64_t __42__CKInlineReplyChatController__animateIn___block_invoke_154(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_animateOutWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  BOOL IsReduceMotionEnabled;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  BOOL v24;
  _QWORD v25[5];
  BOOL v26;
  uint8_t buf[16];

  v4 = a3;
  IMLogHandleForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Performing _animateOut", buf, 2u);
  }

  -[CKInlineReplyChatController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  -[CKInlineReplyChatController setAnimatingOut:](self, "setAnimatingOut:", 1);
  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  -[CKInlineReplyChatController inlineCollectionViewController](self, "inlineCollectionViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAnimatingOut:", 1);
  -[CKChatController entryView](self, "entryView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKInlineReplyChatController traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEntryViewTraitCollection:resetStyle:", v10, 1);

  -[CKChatController collectionView](self, "collectionView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "beginHoldingContentOffsetUpdatesForReason:", CFSTR("InlineReplyChatController"));

  -[CKScrollViewController beginHoldingScrollGeometryUpdatesForReason:](self, "beginHoldingScrollGeometryUpdatesForReason:", CFSTR("InlineReplyAnimateOut"));
  if (!IsReduceMotionEnabled)
  {
    -[CKChatController _visibleChatItemsToScreenFrameMap](self, "_visibleChatItemsToScreenFrameMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKInlineReplyChatController transcriptOverlayTransitionDelegate](self, "transcriptOverlayTransitionDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "updatedFrameMapForTranscriptOverlayViewController:", self);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setCollectionViewTargetFrames:", v14);
    objc_msgSend(v8, "setCollectionViewCurrentFramesForNextLayout:", v12);
    objc_msgSend(v8, "performCollectionViewReloadForAnimateOut");

  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "replyTranscriptBackgroundBlurAnimationTime");
  v17 = v16;

  -[CKInlineReplyChatController transcriptOverlayTransitionDelegate](self, "transcriptOverlayTransitionDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "transcriptOverlayViewControllerWillAnimateOut:", self);

  -[CKChatController collectionView](self, "collectionView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setIgnoresReloadDataRequests:", 1);

  v20 = (void *)MEMORY[0x1E0CEABB0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __57__CKInlineReplyChatController__animateOutWithCompletion___block_invoke;
  v25[3] = &unk_1E274CA88;
  v25[4] = self;
  v26 = IsReduceMotionEnabled;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __57__CKInlineReplyChatController__animateOutWithCompletion___block_invoke_2;
  v22[3] = &unk_1E274E178;
  v24 = IsReduceMotionEnabled;
  v22[4] = self;
  v21 = v4;
  v23 = v21;
  objc_msgSend(v20, "animateWithDuration:animations:completion:", v25, v22, v17);
  if (!IsReduceMotionEnabled)
    -[CKInlineReplyChatController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__requestDismissal, 0, 1.5);

}

void __57__CKInlineReplyChatController__animateOutWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  objc_super v20;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "replyTranscriptBackgroundDoesSupportTransparentBlurVisualEffect");

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "blurView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundEffects:", MEMORY[0x1E0C9AA60]);

    objc_msgSend(*(id *)(a1 + 32), "blurView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", 0);
  }
  else
  {
    objc_msgSend(v4, "blurParentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "animateOut");
  }

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "collectionView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 0.0);

  }
  v20.receiver = *(id *)(a1 + 32);
  v20.super_class = (Class)CKInlineReplyChatController;
  objc_msgSendSuper2(&v20, sel__defaultTranscriptNavBarAppearance);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStandardAppearance:", v8);

  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v11, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setScrollEdgeAppearance:", v8);

  objc_msgSend(*(id *)(a1 + 32), "splitViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend(v13, "isCollapsed");
  objc_msgSend(*(id *)(a1 + 32), "splitViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v11 & 1) != 0)
    objc_msgSend(v14, "masterViewController");
  else
    objc_msgSend(v14, "detailViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "navigationBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setNeedsLayout");

  objc_msgSend(v16, "navigationBar");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "transcriptOverlayTransitionDelegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "transcriptOverlayViewControllerIsAnimatingOut:", *(_QWORD *)(a1 + 32));

}

void __57__CKInlineReplyChatController__animateOutWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "_requestDismissal");
  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endHoldingContentOffsetUpdatesForReason:", CFSTR("InlineReplyChatController"));

  if (*(_QWORD *)(a1 + 40))
  {
    IMLogHandleForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Calling completion on _animateOut", v4, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)_animateOut
{
  -[CKInlineReplyChatController _animateOutWithCompletion:](self, "_animateOutWithCompletion:", 0);
}

- (void)_setInitialScrollPositionIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  CGFloat v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double MidY;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  double MaxY;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  id v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;

  -[CKInlineReplyChatController transitionContext](self, "transitionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anchorChatItemGUID");
  v68 = (id)objc_claimAutoreleasedReturnValue();

  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chatItemForGUID:", v68);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (UIAccessibilityIsReduceMotionEnabled()
    || (-[CKInlineReplyChatController transitionContext](self, "transitionContext"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "presentWithKeyboard"),
        v6,
        v7))
  {
    -[CKCoreChatController collectionViewController](self, "collectionViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scrollTranscriptToEntryViewInsertionTimeWithAnimation:", 0);
  }
  else
  {
    if (!v5)
      goto LABEL_5;
    v9 = *MEMORY[0x1E0CEB4B0];
    -[CKInlineReplyChatController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeAreaInsets");
    v12 = v11;

    -[CKChatController collectionView](self, "collectionView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v14 = CGRectGetHeight(v69) - (v9 + v12);

    -[CKChatController collectionView](self, "collectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "collectionViewLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "collectionViewContentSize");
    v17 = v16;

    -[CKCoreChatController collectionViewController](self, "collectionViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17 >= v14)
    {
      objc_msgSend(v18, "chatItems");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "indexOfObject:", v5);

      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v21, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKChatController collectionView](self, "collectionView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "collectionViewLayout");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "layoutAttributesForItemAtIndexPath:", v19);
      v24 = (double *)objc_claimAutoreleasedReturnValue();

      v25 = v24[44];
      v26 = v24[45];
      v27 = v24[46];
      v28 = v24[47];
      objc_msgSend(v8, "bounds");
      v30 = v29;
      v32 = v31;
      v34 = v33;
      v36 = v35;
      objc_msgSend(v8, "contentInset");
      v66 = v37;
      v67 = v30;
      v39 = v30 + v38;
      v40 = v32 + v37;
      v42 = v34 - (v38 + v41);
      v44 = v36 - (v37 + v43);
      v70.origin.x = v25;
      v70.origin.y = v26;
      v70.size.width = v27;
      v70.size.height = v28;
      MidY = CGRectGetMidY(v70);
      v71.origin.x = v39;
      v71.origin.y = v40;
      v71.size.width = v42;
      v71.size.height = v44;
      v46 = MidY + CGRectGetHeight(v71) * -0.5;
      -[CKCoreChatController collectionViewController](self, "collectionViewController");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "chatItems");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "firstObject");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "layoutAttributesForItemAtIndexPath:", v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "frame");
        v53 = v52;
        v55 = v54;
        v57 = v56;
        v59 = v58;

        v72.origin.x = v53;
        v72.origin.y = v55;
        v72.size.width = v57;
        v72.size.height = v59;
        MaxY = CGRectGetMaxY(v72);
        if (v46 < MaxY)
          v46 = MaxY;
      }
      -[CKChatController collectionView](self, "collectionView");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "__ck_bottomOffset");
      v63 = v62;

      if (v63 >= v46 - v66)
        v64 = v46 - v66;
      else
        v64 = v63;
      if (v64 <= -v66)
        v65 = -v66;
      else
        v65 = v64;
      objc_msgSend(v8, "setContentOffset:animated:", 0, v67, v65);

    }
    else
    {
      objc_msgSend(v18, "scrollTranscriptToEntryViewInsertionTimeWithAnimation:", 0);
    }

  }
LABEL_5:

}

- (void)_requestDismissal
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  IMLogHandleForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Executing _requestDismissal", v8, 2u);
  }

  -[CKInlineReplyChatController transcriptOverlayTransitionDelegate](self, "transcriptOverlayTransitionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transcriptOverlayViewControllerDidAnimateOut:", self);

  -[CKInlineReplyChatController interactionDelegate](self, "interactionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatController entryView](self, "entryView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inlineReplyControllerRequestsDismissal:presentKeyboard:", self, objc_msgSend(v7, "isActive"));

}

- (id)_imMessageForIMMessageItem:(id)a3
{
  return +[CKUtilities imMessageForIMMessageItem:](CKUtilities, "imMessageForIMMessageItem:", a3);
}

- (id)_visibleGUIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chatItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__imArrayByApplyingBlock:", &__block_literal_global_44);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "associatedChatItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "__imArrayByApplyingBlock:", &__block_literal_global_161_0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __44__CKInlineReplyChatController__visibleGUIDs__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __44__CKInlineReplyChatController__visibleGUIDs__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)parentViewControllerForPluginViewControllerInMessageEntryView:(id)a3
{
  CKInlineReplyChatController *v4;

  if (-[CKInlineReplyChatController isModal](self, "isModal", a3))
  {
    v4 = self;
  }
  else
  {
    -[CKInlineReplyChatController parentChatController](self, "parentChatController");
    v4 = (CKInlineReplyChatController *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)wantsBackingTranscriptToIgnoreContentOffsetChanges
{
  return 0;
}

- (void)stageAssetArchive:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  void *v6;
  dispatch_time_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKInlineReplyChatController;
  -[CKChatController stageAssetArchive:skipShelf:completionHandler:](&v9, sel_stageAssetArchive_skipShelf_completionHandler_, a3, a4, a5);
  -[CKChatController deferredPresentationBlock](self, "deferredPresentationBlock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = dispatch_time(0, 200000000);
    -[CKChatController deferredPresentationBlock](self, "deferredPresentationBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_after(v7, MEMORY[0x1E0C80D38], v8);

    -[CKChatController setDeferredPresentationBlock:](self, "setDeferredPresentationBlock:", 0);
  }
}

- (NSString)threadIdentifier
{
  return self->_threadIdentifier;
}

- (void)setThreadIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 2432);
}

- (IMMessageItem)threadOriginator
{
  return self->_threadOriginator;
}

- (void)setThreadOriginator:(id)a3
{
  objc_storeStrong((id *)&self->_threadOriginator, a3);
}

- (CKTranscriptOverlayTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContext, a3);
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

- (BOOL)shouldReloadInsetsForFloatingKeyboard
{
  return self->_shouldReloadInsetsForFloatingKeyboard;
}

- (void)setShouldReloadInsetsForFloatingKeyboard:(BOOL)a3
{
  self->_shouldReloadInsetsForFloatingKeyboard = a3;
}

- (NSDictionary)originatorMessageSummaryInfo
{
  return self->_originatorMessageSummaryInfo;
}

- (CKTranscriptOverlayTransitionDelegate)transcriptOverlayTransitionDelegate
{
  return (CKTranscriptOverlayTransitionDelegate *)objc_loadWeakRetained((id *)&self->_transcriptOverlayTransitionDelegate);
}

- (void)setTranscriptOverlayTransitionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_transcriptOverlayTransitionDelegate, a3);
}

- (CKInlineReplyInteractionDelegate)interactionDelegate
{
  return (CKInlineReplyInteractionDelegate *)objc_loadWeakRetained((id *)&self->_interactionDelegate);
}

- (void)setInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interactionDelegate, a3);
}

- (BOOL)isInitialLoad
{
  return self->_isInitialLoad;
}

- (void)setIsInitialLoad:(BOOL)a3
{
  self->_isInitialLoad = a3;
}

- (BOOL)isInitialSizing
{
  return self->_isInitialSizing;
}

- (void)setIsInitialSizing:(BOOL)a3
{
  self->_isInitialSizing = a3;
}

- (BOOL)hasCompletedAnimationIn
{
  return self->_hasCompletedAnimationIn;
}

- (void)setHasCompletedAnimationIn:(BOOL)a3
{
  self->_hasCompletedAnimationIn = a3;
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

- (CKInlineReplyTransparentBlurBackgroundView)blurParentView
{
  return self->_blurParentView;
}

- (void)setBlurParentView:(id)a3
{
  objc_storeStrong((id *)&self->_blurParentView, a3);
}

- (BOOL)showNavbarKeyline
{
  return self->_showNavbarKeyline;
}

- (UINavigationBarAppearance)navBarAppearance
{
  return self->_navBarAppearance;
}

- (void)setNavBarAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_navBarAppearance, a3);
}

- (CKChatController)parentChatController
{
  return (CKChatController *)objc_loadWeakRetained((id *)&self->_parentChatController);
}

- (void)setParentChatController:(id)a3
{
  objc_storeWeak((id *)&self->_parentChatController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentChatController);
  objc_storeStrong((id *)&self->_navBarAppearance, 0);
  objc_storeStrong((id *)&self->_blurParentView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_destroyWeak((id *)&self->_transcriptOverlayTransitionDelegate);
  objc_storeStrong((id *)&self->_originatorMessageSummaryInfo, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_threadOriginator, 0);
  objc_storeStrong((id *)&self->_threadIdentifier, 0);
}

- (void)_animateIn:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "Not performing _animateIn because blur view is nil", v1, 2u);
}

@end
