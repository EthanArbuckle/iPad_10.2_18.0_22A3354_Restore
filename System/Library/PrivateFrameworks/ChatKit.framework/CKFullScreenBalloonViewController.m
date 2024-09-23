@implementation CKFullScreenBalloonViewController

- (CKFullScreenBalloonViewController)initWithChatItem:(id)a3 gradientReferenceView:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  CKFullScreenBalloonViewController *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[CKFullScreenBalloonViewDisplayConfiguration tapbackPickerContext](CKFullScreenBalloonViewDisplayConfiguration, "tapbackPickerContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CKFullScreenBalloonViewController initWithChatItem:gradientReferenceView:displayConfiguration:delegate:](self, "initWithChatItem:gradientReferenceView:displayConfiguration:delegate:", v10, v9, v11, v8);

  return v12;
}

- (CKFullScreenBalloonViewController)initWithChatItem:(id)a3 gradientReferenceView:(id)a4 displayConfiguration:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CKFullScreenBalloonViewController *v15;
  CKFullScreenBalloonViewController *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)CKFullScreenBalloonViewController;
  v15 = -[CKFullScreenBalloonViewController init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_chatItem, a3);
    objc_storeWeak((id *)&v16->_delegate, v14);
    objc_msgSend(v12, "gradientFrame");
    v16->_gradientFrame.origin.x = v17;
    v16->_gradientFrame.origin.y = v18;
    v16->_gradientFrame.size.width = v19;
    v16->_gradientFrame.size.height = v20;
    objc_storeStrong((id *)&v16->_displayConfiguration, a5);
    v16->_tintDimissalAnimationDuration = 0.2;
  }

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[CKFullScreenBalloonViewController removeTapRecognizer](self, "removeTapRecognizer");
  v3.receiver = self;
  v3.super_class = (Class)CKFullScreenBalloonViewController;
  -[CKFullScreenBalloonViewController dealloc](&v3, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  int v4;
  CKGradientReferenceView *v5;
  void *v6;
  CKGradientReferenceView *v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmojiTapbacksEnabled");

  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)CKFullScreenBalloonViewController;
    -[CKFullScreenBalloonViewController loadView](&v8, sel_loadView);
  }
  else
  {
    v5 = [CKGradientReferenceView alloc];
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v7 = -[CKGradientReferenceView initWithFrame:](v5, "initWithFrame:");

    -[CKGradientReferenceView setAutoresizingMask:](v7, "setAutoresizingMask:", 18);
    -[CKFullScreenBalloonViewController gradientFrame](self, "gradientFrame");
    -[CKGradientReferenceView setGradientFrame:](v7, "setGradientFrame:");
    -[CKGradientReferenceView setBackgroundColor:](v7, "setBackgroundColor:", 0);
    -[CKFullScreenBalloonViewController setView:](self, "setView:", v7);

  }
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  void *v16;
  CKMessageAcknowledgmentPickerBarViewController *v17;
  CKMessageAcknowledgmentPickerBarViewController *pickerBar;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CKFullScreenBalloonViewController;
  -[CKFullScreenBalloonViewController viewDidLoad](&v27, sel_viewDidLoad);
  -[CKFullScreenBalloonViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLayoutMarginsFollowReadableWidth:", 1);

  v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
  -[CKFullScreenBalloonViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v6 = (void *)objc_msgSend(v4, "initWithFrame:");

  objc_msgSend(v6, "setAutoresizingMask:", 18);
  -[CKFullScreenBalloonViewController displayConfiguration](self, "displayConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tintViewBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v8);

  objc_msgSend(v6, "setAlpha:", 0.0);
  objc_storeStrong((id *)&self->_tintView, v6);
  -[CKFullScreenBalloonViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v6);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "isEmojiTapbacksEnabled");

  -[CKFullScreenBalloonViewController chatItem](self, "chatItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEmojiTapbacksEnabled");

  if ((v13 & 1) == 0
    && -[CKFullScreenBalloonViewController shouldShowTapbackPicker](self, "shouldShowTapbackPicker")
    && objc_msgSend(v11, "canSendTapbacks"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc((Class)objc_msgSend(v14, "acknowledgementPickerBarClass"));
    -[CKFullScreenBalloonViewController chatItem](self, "chatItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (CKMessageAcknowledgmentPickerBarViewController *)objc_msgSend(v15, "initWithChatItem:", v16);
    pickerBar = self->_pickerBar;
    self->_pickerBar = v17;

    if (self->_useForcedOrientation)
    {
      -[CKMessageAcknowledgmentPickerBarViewController setUseForcedOrientation:](self->_pickerBar, "setUseForcedOrientation:", 1);
      -[CKMessageAcknowledgmentPickerBarViewController setForcedOrientation:](self->_pickerBar, "setForcedOrientation:", self->_forcedOrientation);
    }
    -[CKMessageAcknowledgmentPickerBarViewController setDelegate:](self->_pickerBar, "setDelegate:", self);
    -[CKFullScreenBalloonViewController addChildViewController:](self, "addChildViewController:", self->_pickerBar);
    -[CKFullScreenBalloonViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMessageAcknowledgmentPickerBarViewController view](self->_pickerBar, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v20);

  }
  -[CKFullScreenBalloonViewController delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_opt_respondsToSelector();

  if ((v22 & 1) != 0)
  {
    -[CKFullScreenBalloonViewController delegate](self, "delegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "fullScreenBalloonViewControllerShouldShowReplyButton:", self);

    if (v24)
    {
      -[CKFullScreenBalloonViewController displayConfiguration](self, "displayConfiguration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "shouldShowReplyButton");

      if (v26)
      {
        if (objc_msgSend(v11, "canInlineReply"))
          -[CKFullScreenBalloonViewController setupReplyButton](self, "setupReplyButton");
      }
    }
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKFullScreenBalloonViewController;
  -[CKViewController viewWillAppear:](&v8, sel_viewWillAppear_);
  -[CKFullScreenBalloonViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CKFullScreenBalloonViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fullScreenBalloonViewController:willAppearAnimated:", self, v3);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKFullScreenBalloonViewController;
  -[CKViewController viewDidAppear:](&v8, sel_viewDidAppear_);
  -[CKFullScreenBalloonViewController addTapRecognizerWithTarget:action:](self, "addTapRecognizerWithTarget:action:", self, sel_dismissTapGestureRecognized_);
  -[CKFullScreenBalloonViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CKFullScreenBalloonViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fullScreenBalloonViewController:didAppearAnimated:", self, v3);

  }
  if (!-[CKFullScreenBalloonViewController hasPerformedInitialAnimations](self, "hasPerformedInitialAnimations"))
  {
    -[CKFullScreenBalloonViewController performInitialAnimations](self, "performInitialAnimations");
    -[CKFullScreenBalloonViewController setHasPerformedInitialAnimations:](self, "setHasPerformedInitialAnimations:", 1);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKFullScreenBalloonViewController;
  -[CKViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[CKFullScreenBalloonViewController removeTapRecognizer](self, "removeTapRecognizer");
}

- (BOOL)wantsWindowedPresentation
{
  void *v3;
  char v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fullScreenBalloonWantsWindowedPresentation");
  self->_wantsWindowedPresentation = v4;

  return v4;
}

- (BOOL)preserveModalPresentationStyle
{
  self->_preserveModalPresentationStyle = 1;
  return 1;
}

- (BOOL)constrainToPresentingVCBounds
{
  return 1;
}

- (BOOL)forceWindowedPresentation
{
  void *v2;
  char v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fullScreenBalloonForceWindowedPresentation");

  return v3;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEmojiTapbacksEnabled");

  return v5 ^ 1;
}

- (void)dismissTapGestureRecognized:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  CGPoint v11;
  CGRect v12;

  v4 = a3;
  -[CKFullScreenBalloonViewController view](self, "view");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  -[CKMessageAcknowledgmentPickerBarViewController view](self->_pickerBar, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v11.x = v7;
  v11.y = v9;
  LOBYTE(v5) = CGRectContainsPoint(v12, v11);

  if ((v5 & 1) == 0)
    -[CKFullScreenBalloonViewController beginDismissal](self, "beginDismissal");
}

- (void)replyButtonPressed:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  -[CKFullScreenBalloonViewController setWillPresentInlineReplies:](self, "setWillPresentInlineReplies:", 1);
  -[CKFullScreenBalloonViewController performCancelAnimationWithCompletion:](self, "performCancelAnimationWithCompletion:", 0);
  -[CKFullScreenBalloonViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CKFullScreenBalloonViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[CKFullScreenBalloonViewController chatItem](self, "chatItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fullScreenBalloonViewController:replyButtonPressedForChatItem:", self, v6);

  }
}

- (id)viewToAlignWith
{
  NSObject *v2;

  IMLogHandleForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[CKFullScreenBalloonViewController viewToAlignWith].cold.1(v2);

  return 0;
}

- (void)performClosingAnimationsAnimated:(BOOL)a3 withSendAnimation:(BOOL)a4 withCompletion:(id)a5
{
  if (a5)
    (*((void (**)(id))a5 + 2))(a5);
}

- (void)_performClosingAnimationsAnimated:(BOOL)a3 withSendAnimation:(BOOL)a4 duration:(double)a5 withCompletion:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a4;
  v8 = a3;
  v10 = a6;
  -[CKFullScreenBalloonViewController removeTapRecognizer](self, "removeTapRecognizer");
  -[CKFullScreenBalloonViewController delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[CKFullScreenBalloonViewController delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fullScreenBalloonViewController:willDisappearWithSendAnimation:duration:", self, v7, a5);

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __113__CKFullScreenBalloonViewController__performClosingAnimationsAnimated_withSendAnimation_duration_withCompletion___block_invoke;
  v15[3] = &unk_1E274AED0;
  v16 = v10;
  v14 = v10;
  -[CKFullScreenBalloonViewController performClosingAnimationsAnimated:withSendAnimation:withCompletion:](self, "performClosingAnimationsAnimated:withSendAnimation:withCompletion:", v8, v7, v15);

}

uint64_t __113__CKFullScreenBalloonViewController__performClosingAnimationsAnimated_withSendAnimation_duration_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)performSendAndCloseAnimationWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKFullScreenBalloonViewController displayConfiguration](self, "displayConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollDuration");
  -[CKFullScreenBalloonViewController _performClosingAnimationsAnimated:withSendAnimation:duration:withCompletion:](self, "_performClosingAnimationsAnimated:withSendAnimation:duration:withCompletion:", 1, 1, v4);

}

- (void)performCancelAnimationWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKFullScreenBalloonViewController displayConfiguration](self, "displayConfiguration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollDuration");
  -[CKFullScreenBalloonViewController _performClosingAnimationsAnimated:withSendAnimation:duration:withCompletion:](self, "_performClosingAnimationsAnimated:withSendAnimation:duration:withCompletion:", 1, 0, v4);

}

- (void)dismissImmediatelyWithNoAnimations
{
  id v3;

  -[CKFullScreenBalloonViewController displayConfiguration](self, "displayConfiguration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scrollDuration");
  -[CKFullScreenBalloonViewController _performClosingAnimationsAnimated:withSendAnimation:duration:withCompletion:](self, "_performClosingAnimationsAnimated:withSendAnimation:duration:withCompletion:", 0, 0, 0);

}

- (void)messageAcknowledgmentPickerViewController:(id)a3 didPickAcknowledgment:(int64_t)a4
{
  void *v6;
  id v7;

  -[CKFullScreenBalloonViewController delegate](self, "delegate", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CKFullScreenBalloonViewController chatItem](self, "chatItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fullScreenBalloonViewController:sendMessageAcknowledgment:forChatItem:", self, a4, v6);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceivePress:(id)a4
{
  return 1;
}

- (void)addTapRecognizerWithTarget:(id)a3 action:(SEL)a4
{
  objc_class *v6;
  id v7;
  UIGestureRecognizer *v8;
  UIGestureRecognizer *tapRecognizer;
  void *v10;
  id v11;

  v6 = (objc_class *)MEMORY[0x1E0CEAA88];
  v7 = a3;
  v8 = (UIGestureRecognizer *)objc_msgSend([v6 alloc], "initWithTarget:action:", v7, a4);

  tapRecognizer = self->_tapRecognizer;
  self->_tapRecognizer = v8;

  -[UIGestureRecognizer setDelegate:](self->_tapRecognizer, "setDelegate:", self);
  -[UIGestureRecognizer setEnabled:](self->_tapRecognizer, "setEnabled:", 1);
  -[UIGestureRecognizer setDelaysTouchesBegan:](self->_tapRecognizer, "setDelaysTouchesBegan:", 1);
  -[UIGestureRecognizer setDelaysTouchesEnded:](self->_tapRecognizer, "setDelaysTouchesEnded:", 1);
  -[UIGestureRecognizer setRequiresExclusiveTouchType:](self->_tapRecognizer, "setRequiresExclusiveTouchType:", 0);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v10, "isEmojiTapbacksEnabled");

  if ((_DWORD)v6)
    -[CKFullScreenBalloonViewController tintView](self, "tintView");
  else
    -[CKFullScreenBalloonViewController view](self, "view");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addGestureRecognizer:", self->_tapRecognizer);

}

- (void)removeTapRecognizer
{
  void *v3;
  UIGestureRecognizer *tapRecognizer;

  if (self->_tapRecognizer)
  {
    -[CKFullScreenBalloonViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeGestureRecognizer:", self->_tapRecognizer);

    tapRecognizer = self->_tapRecognizer;
    self->_tapRecognizer = 0;

  }
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (UIView)balloonWrapperView
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "isEmojiTapbacksEnabled");

  return (UIView *)-[CKFullScreenBalloonViewController view](self, "view");
}

- (void)hideTint:(BOOL)a3 duration:(double)a4
{
  _QWORD v4[5];

  if (!a3)
    a4 = 0.0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__CKFullScreenBalloonViewController_hideTint_duration___block_invoke;
  v4[3] = &unk_1E274A208;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v4, 0, a4, 0.0);
}

void __55__CKFullScreenBalloonViewController_hideTint_duration___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tintView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

- (BOOL)shouldShowTapbackAttribution
{
  void *v3;
  char v4;
  void *v6;
  char v7;

  -[CKFullScreenBalloonViewController displayConfiguration](self, "displayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldHideTapbackAttributionAndPicker");

  if ((v4 & 1) != 0)
    return 0;
  -[CKFullScreenBalloonViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldShowTapbackAttributionForFullScreenBalloonViewController:", self);

  return v7;
}

- (BOOL)shouldShowTapbackPicker
{
  void *v3;
  char v4;
  void *v6;
  char v7;

  -[CKFullScreenBalloonViewController displayConfiguration](self, "displayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldHideTapbackAttributionAndPicker");

  if ((v4 & 1) != 0)
    return 0;
  -[CKFullScreenBalloonViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldShowTapbackPickerForFullScreenBalloonViewController:", self);

  return v7;
}

- (void)beginDismissal
{
  void *v3;
  char v4;
  id v5;

  if (!-[CKFullScreenBalloonViewController beganDismissing](self, "beganDismissing"))
  {
    -[CKFullScreenBalloonViewController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      -[CKFullScreenBalloonViewController setBeganDismissing:](self, "setBeganDismissing:", 1);
      -[CKFullScreenBalloonViewController delegate](self, "delegate");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fullScreenBalloonViewControllerHandleDismissTap:", self);

    }
  }
}

- (void)setWantsWindowedPresentation:(BOOL)a3
{
  self->_wantsWindowedPresentation = a3;
}

- (void)setPreserveModalPresentationStyle:(BOOL)a3
{
  self->_preserveModalPresentationStyle = a3;
}

- (CKFullScreenBalloonViewControllerDelegate)delegate
{
  return (CKFullScreenBalloonViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKMessagePartChatItem)chatItem
{
  return self->_chatItem;
}

- (CKMessagePartChatItem)supplementaryLayoutChatItem
{
  return self->_supplementaryLayoutChatItem;
}

- (void)setSupplementaryLayoutChatItem:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryLayoutChatItem, a3);
}

- (id)supplementaryLayoutContext
{
  return self->_supplementaryLayoutContext;
}

- (void)setSupplementaryLayoutContext:(id)a3
{
  objc_storeStrong(&self->_supplementaryLayoutContext, a3);
}

- (char)forcedOrientation
{
  return self->_forcedOrientation;
}

- (void)setForcedOrientation:(char)a3
{
  self->_forcedOrientation = a3;
}

- (BOOL)useForcedOrientation
{
  return self->_useForcedOrientation;
}

- (void)setUseForcedOrientation:(BOOL)a3
{
  self->_useForcedOrientation = a3;
}

- (double)tintDimissalAnimationDuration
{
  return self->_tintDimissalAnimationDuration;
}

- (void)setTintDimissalAnimationDuration:(double)a3
{
  self->_tintDimissalAnimationDuration = a3;
}

- (UIGestureRecognizer)tapRecognizer
{
  return self->_tapRecognizer;
}

- (void)setTapRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapRecognizer, a3);
}

- (BOOL)hasPerformedInitialAnimations
{
  return self->_hasPerformedInitialAnimations;
}

- (void)setHasPerformedInitialAnimations:(BOOL)a3
{
  self->_hasPerformedInitialAnimations = a3;
}

- (CKMessageAcknowledgmentPickerBarViewController)pickerBar
{
  return self->_pickerBar;
}

- (UIButton)replyButton
{
  return self->_replyButton;
}

- (void)setReplyButton:(id)a3
{
  objc_storeStrong((id *)&self->_replyButton, a3);
}

- (UIView)tintView
{
  return self->_tintView;
}

- (UIView)keyboardSnapshotView
{
  return self->_keyboardSnapshotView;
}

- (void)setKeyboardSnapshotView:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardSnapshotView, a3);
}

- (CGRect)gradientFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_gradientFrame.origin.x;
  y = self->_gradientFrame.origin.y;
  width = self->_gradientFrame.size.width;
  height = self->_gradientFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CKFullScreenBalloonViewDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (BOOL)followsParentBalloonView
{
  return self->_followsParentBalloonView;
}

- (void)setFollowsParentBalloonView:(BOOL)a3
{
  self->_followsParentBalloonView = a3;
}

- (BOOL)willPresentInlineReplies
{
  return self->_willPresentInlineReplies;
}

- (void)setWillPresentInlineReplies:(BOOL)a3
{
  self->_willPresentInlineReplies = a3;
}

- (BOOL)hasInsertedCatalystEmoji
{
  return self->_hasInsertedCatalystEmoji;
}

- (void)setHasInsertedCatalystEmoji:(BOOL)a3
{
  self->_hasInsertedCatalystEmoji = a3;
}

- (BOOL)beganDismissing
{
  return self->_beganDismissing;
}

- (void)setBeganDismissing:(BOOL)a3
{
  self->_beganDismissing = a3;
}

- (CGRect)preservedBoundsInBalloonWindowAtAppearance
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_preservedBoundsInBalloonWindowAtAppearance.origin.x;
  y = self->_preservedBoundsInBalloonWindowAtAppearance.origin.y;
  width = self->_preservedBoundsInBalloonWindowAtAppearance.size.width;
  height = self->_preservedBoundsInBalloonWindowAtAppearance.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPreservedBoundsInBalloonWindowAtAppearance:(CGRect)a3
{
  self->_preservedBoundsInBalloonWindowAtAppearance = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_keyboardSnapshotView, 0);
  objc_storeStrong((id *)&self->_tintView, 0);
  objc_storeStrong((id *)&self->_replyButton, 0);
  objc_storeStrong((id *)&self->_pickerBar, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong(&self->_supplementaryLayoutContext, 0);
  objc_storeStrong((id *)&self->_supplementaryLayoutChatItem, 0);
  objc_storeStrong((id *)&self->_chatItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)viewToAlignWith
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "Did not override viewToAlignWith - this is an implementation error.", v1, 2u);
}

@end
