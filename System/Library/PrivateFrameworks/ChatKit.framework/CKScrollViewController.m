@implementation CKScrollViewController

- (CKScrollViewController)init
{
  CKScrollViewController *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  IMReasonTrackingUpdater *scrollGeometryUpdater;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKScrollViewController;
  v2 = -[CKScrollViewController init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_keyboardWillShow_, *MEMORY[0x1E0CEB978], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_keyboardWillHide_, *MEMORY[0x1E0CEB970], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_keyboardDidShow_, *MEMORY[0x1E0CEB828], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_keyboardDidHide_, *MEMORY[0x1E0CEB820], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_keyboardDidChangeFrame_, *MEMORY[0x1E0CEB818], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__changedStatusBarFrame_, *MEMORY[0x1E0CEB278], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__entryViewWillRotate_, *MEMORY[0x1E0CEB710], 0);
    -[CKScrollViewController scrollGeometryUpdaterLogHandle](v2, "scrollGeometryUpdaterLogHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D399C8]), "initWithLogHandle:delegate:", v4, v2);
    scrollGeometryUpdater = v2->_scrollGeometryUpdater;
    v2->_scrollGeometryUpdater = (IMReasonTrackingUpdater *)v5;

  }
  return v2;
}

+ (id)scrollGeometryUpdaterLogHandle
{
  if (scrollGeometryUpdaterLogHandle_onceToken != -1)
    dispatch_once(&scrollGeometryUpdaterLogHandle_onceToken, &__block_literal_global_235);
  return (id)scrollGeometryUpdaterLogHandle_sLogHandle;
}

void __56__CKScrollViewController_scrollGeometryUpdaterLogHandle__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Messages", "CKScrollViewGeometryUpdater");
  v1 = (void *)scrollGeometryUpdaterLogHandle_sLogHandle;
  scrollGeometryUpdaterLogHandle_sLogHandle = (uint64_t)v0;

}

- (id)scrollGeometryUpdaterLogHandle
{
  return (id)objc_msgSend((id)objc_opt_class(), "scrollGeometryUpdaterLogHandle");
}

- (CGRect)inputAccessoryViewFrameForFloatingKeyboard
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isKeyboardFloating
{
  return objc_msgSend(MEMORY[0x1E0CEA6E8], "isFloating");
}

- (void)inputAccessoryViewFrameUpdatedForFloatingKeyboard
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double MaxY;
  double v8;
  void *v9;
  void *v10;
  double MaxX;
  double v12;
  double Width;
  double v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  -[CKScrollViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKScrollViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    MaxY = CGRectGetMaxY(v15);
    -[CKScrollViewController inputAccessoryViewFrameForFloatingKeyboard](self, "inputAccessoryViewFrameForFloatingKeyboard");
    v8 = MaxY - CGRectGetHeight(v16);

    -[CKScrollViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    MaxX = CGRectGetMaxX(v17);
    -[CKScrollViewController inputAccessoryViewFrameForFloatingKeyboard](self, "inputAccessoryViewFrameForFloatingKeyboard");
    v12 = MaxX - CGRectGetWidth(v18);

    -[CKScrollViewController inputAccessoryViewFrameForFloatingKeyboard](self, "inputAccessoryViewFrameForFloatingKeyboard");
    Width = CGRectGetWidth(v19);
    -[CKScrollViewController accessoryViewHeight](self, "accessoryViewHeight");
    -[CKScrollViewController setKeyboardScreenFrame:](self, "setKeyboardScreenFrame:", v12, v8, Width, v14);
    -[CKScrollViewController updateScrollGeometryWithoutAnimationForReason:](self, "updateScrollGeometryWithoutAnimationForReason:", CFSTR("InputAccessoryFrameChanged"));
  }
}

- (void)setKeyboardScreenFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  void *v8;
  void *v9;
  double MaxY;
  void *v11;
  void *v12;
  double MaxX;
  CGRect *p_keyboardScreenFrame;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[CKScrollViewController isKeyboardFloating](self, "isKeyboardFloating"))
  {
    -[CKScrollViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    MaxY = CGRectGetMaxY(v15);
    -[CKScrollViewController inputAccessoryViewFrameForFloatingKeyboard](self, "inputAccessoryViewFrameForFloatingKeyboard");
    y = MaxY - CGRectGetHeight(v16);

    -[CKScrollViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    MaxX = CGRectGetMaxX(v17);
    -[CKScrollViewController inputAccessoryViewFrameForFloatingKeyboard](self, "inputAccessoryViewFrameForFloatingKeyboard");
    x = MaxX - CGRectGetWidth(v18);

    p_keyboardScreenFrame = &self->_keyboardScreenFrame;
    -[CKScrollViewController inputAccessoryViewFrameForFloatingKeyboard](self, "inputAccessoryViewFrameForFloatingKeyboard");
    width = CGRectGetWidth(v19);
    -[CKScrollViewController inputAccessoryViewFrameForFloatingKeyboard](self, "inputAccessoryViewFrameForFloatingKeyboard");
    height = CGRectGetHeight(v20);
  }
  else
  {
    p_keyboardScreenFrame = &self->_keyboardScreenFrame;
  }
  p_keyboardScreenFrame->origin.x = x;
  p_keyboardScreenFrame->origin.y = y;
  p_keyboardScreenFrame->size.width = width;
  p_keyboardScreenFrame->size.height = height;
}

- (void)keyboardWillShow:(id)a3
{
  id v4;

  v4 = a3;
  -[CKScrollViewController setKeyboardVisible:](self, "setKeyboardVisible:", 1);
  -[CKScrollViewController _keyboardWillShowOrHide:](self, "_keyboardWillShowOrHide:", v4);

}

- (void)_keyboardWillShowOrHide:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  float v32;
  double v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  double v39;

  v4 = a3;
  -[CKScrollViewController screenFrameForNotification:](self, "screenFrameForNotification:", v4);
  v39 = v5;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v4, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CEB888]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "CGRectValue");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[CKScrollViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = CKKeyboardFrameInViewCoodinates(v22, v15, v17, v19, v21);
  v25 = v24;
  v27 = v26;
  v29 = v28;

  objc_msgSend(v4, "userInfo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKey:", *MEMORY[0x1E0CEB7F0]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "floatValue");
  v33 = v32;

  objc_msgSend(v4, "userInfo");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKey:", *MEMORY[0x1E0CEB7E8]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "integerValue");

  objc_msgSend(v4, "name");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = objc_msgSend(v37, "isEqualToString:", *MEMORY[0x1E0CEB978]);
  -[CKScrollViewController _updateKeyboardScreenFrameForShowOrHideWithNewScreenFrame:previousFrame:duration:animationCurve:isShowEvent:](self, "_updateKeyboardScreenFrameForShowOrHideWithNewScreenFrame:previousFrame:duration:animationCurve:isShowEvent:", v36, v38, v39, v7, v9, v11, v23, v25, v27, v29, *(_QWORD *)&v33);
}

- (void)_updateKeyboardScreenFrameForShowOrHideWithNewScreenFrame:(CGRect)a3 previousFrame:(CGRect)a4 duration:(double)a5 animationCurve:(int64_t)a6 isShowEvent:(BOOL)a7
{
  _BOOL4 v7;
  double height;
  double v10;
  double v11;
  double v12;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  _BOOL4 v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  int v31;
  char v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  double v42;
  BOOL v44;
  void *v45;
  void *v46;
  CGFloat x;
  CGFloat width;
  CGFloat rect2;
  double y;
  _QWORD aBlock[5];
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v7 = a7;
  width = a4.size.width;
  rect2 = a4.size.height;
  y = a4.origin.y;
  x = a4.origin.x;
  height = a3.size.height;
  v10 = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  -[CKScrollViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CKKeyboardFrameInViewCoodinates(v14, v12, v11, v10, height);
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[CKScrollViewController keyboardFrame](self, "keyboardFrame");
  v54.origin.x = v22;
  v54.origin.y = v23;
  v54.size.width = v24;
  v54.size.height = v25;
  v52.origin.x = v15;
  v52.origin.y = v17;
  v52.size.width = v19;
  v52.size.height = v21;
  if (CGRectEqualToRect(v52, v54))
    goto LABEL_3;
  v53.origin.x = v15;
  v53.origin.y = v17;
  v55.origin.y = y;
  v53.size.width = v19;
  v53.size.height = v21;
  v55.origin.x = x;
  v55.size.width = width;
  v55.size.height = rect2;
  if (CGRectEqualToRect(v53, v55))
LABEL_3:
    -[CKScrollViewController setKeyboardInteractionCancelled:](self, "setKeyboardInteractionCancelled:", 1);
  -[CKScrollViewController setKeyboardScreenFrame:](self, "setKeyboardScreenFrame:", v12, v11, v10, height);
  v26 = -[CKScrollViewController shouldIgnoreKeyboardAnimationDuration](self, "shouldIgnoreKeyboardAnimationDuration");
  v27 = 0.0;
  if (!-[CKScrollViewController keyboardInteractionCancelled](self, "keyboardInteractionCancelled"))
  {
    -[CKScrollViewController _visibleKeyboardHeight](self, "_visibleKeyboardHeight");
    if (v26)
      v29 = 0.0;
    else
      v29 = a5;
    if (v28 > 0.0)
      v27 = v29;
    else
      v27 = 0.0;
  }
  -[CKScrollViewController updateScrollGeometryForReason:withDuration:animationCurve:](self, "updateScrollGeometryForReason:withDuration:animationCurve:", CFSTR("KeyboardScreenFrameChanged"), a6, v27);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "isEntryViewInputAccessory");

  v32 = v7;
  if (v31)
  {
    -[CKScrollViewController accessoryViewHeight](self, "accessoryViewHeight");
    v34 = v33;
    -[CKScrollViewController firstResponder](self, "firstResponder");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "inputAccessoryViewController");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37)
    {
      v39 = v37;
    }
    else
    {
      -[CKScrollViewController firstResponder](self, "firstResponder");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "inputAccessoryView");
      v39 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[CKScrollViewController scrollView](self, "scrollView");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "contentInset");
    v44 = v42 != v34 || v39 == 0;

    v32 = v17 <= y || v44;
  }
  if (!-[CKScrollViewController keyboardInteractionCancelled](self, "keyboardInteractionCancelled") && (v32 & 1) == 0)
    -[CKScrollViewController keyboardWillHideViaGesture](self, "keyboardWillHideViaGesture");
  if (v7)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __134__CKScrollViewController__updateKeyboardScreenFrameForShowOrHideWithNewScreenFrame_previousFrame_duration_animationCurve_isShowEvent___block_invoke;
    aBlock[3] = &unk_1E274A208;
    aBlock[4] = self;
    v45 = _Block_copy(aBlock);
    if (v45)
    {
      v46 = v45;
      -[CKScrollViewController scrollWithDuration:animationCurve:scrollBlock:](self, "scrollWithDuration:animationCurve:scrollBlock:", a6, v45, v27);

    }
  }
}

uint64_t __134__CKScrollViewController__updateKeyboardScreenFrameForShowOrHideWithNewScreenFrame_previousFrame_duration_animationCurve_isShowEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateScrollOffsetForAppearingKeyboard");
}

- (BOOL)shouldIgnoreKeyboardAnimationDuration
{
  return 0;
}

- (void)scrollWithDuration:(double)a3 animationCurve:(int64_t)a4 scrollBlock:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a5;
  v11 = v7;
  if (a3 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v7);
  }
  else
  {
    if (a4 == 103)
    {
      v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA9D8]), "initWithMass:stiffness:damping:initialVelocity:", 1.0, 333.34153, 36.51529, 0.0, 0.0);
    }
    else
    {
      if ((a4 & 7) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", a4 << 16, v7, 0, a3, 0.0);
        goto LABEL_9;
      }
      v8 = objc_alloc_init(MEMORY[0x1E0CEA9D8]);
    }
    v9 = v8;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABC8]), "initWithDuration:timingParameters:", v8, a3);
    objc_msgSend(v10, "addAnimations:", v11);
    objc_msgSend(v10, "startAnimation");

  }
LABEL_9:

}

- (void)keyboardDidShow:(id)a3
{
  -[CKScrollViewController updateScrollGeometryWithoutAnimationForReason:](self, "updateScrollGeometryWithoutAnimationForReason:", CFSTR("KeyboardDidShow"));
  -[CKScrollViewController setKeyboardInteractionCancelled:](self, "setKeyboardInteractionCancelled:", 0);
}

- (void)keyboardDidHide:(id)a3
{
  -[CKScrollViewController setKeyboardVisible:](self, "setKeyboardVisible:", 0);
  -[CKScrollViewController updateScrollGeometryWithoutAnimationForReason:](self, "updateScrollGeometryWithoutAnimationForReason:", CFSTR("KeyboardDidHide"));
  -[CKScrollViewController setKeyboardInteractionCancelled:](self, "setKeyboardInteractionCancelled:", 0);
}

- (void)keyboardDidChangeFrame:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  NSObject *v25;
  const char *v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  _BOOL4 v31;
  _BOOL4 v32;
  _BOOL4 v33;
  _BOOL4 v34;
  void *v35;
  int v36;
  NSObject *v37;
  int v38;
  const __CFString *v39;
  uint64_t v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKScrollViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyWindow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v8)
  {
    -[CKScrollViewController screenFrameForNotification:](self, "screenFrameForNotification:", v4);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[CKScrollViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = CKKeyboardFrameInViewCoodinates(v17, v10, v12, v14, v16);
    v20 = v19;
    v22 = v21;
    v24 = v23;

    v41.origin.x = v18;
    v41.origin.y = v20;
    v41.size.width = v22;
    v41.size.height = v24;
    if (CGRectIsEmpty(v41))
    {
      IMLogHandleForCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        LOWORD(v38) = 0;
        v26 = "Ignoring keyboard frame change because frame is empty";
LABEL_19:
        _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, v26, (uint8_t *)&v38, 2u);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    -[CKScrollViewController keyboardFrame](self, "keyboardFrame");
    v43.origin.x = v27;
    v43.origin.y = v28;
    v43.size.width = v29;
    v43.size.height = v30;
    v42.origin.x = v18;
    v42.origin.y = v20;
    v42.size.width = v22;
    v42.size.height = v24;
    v31 = CGRectEqualToRect(v42, v43);
    IMLogHandleForCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
    if (v31)
    {
      if (v32)
      {
        LOWORD(v38) = 0;
        v26 = "Ignoring keyboard frame change because value has not changed";
        goto LABEL_19;
      }
LABEL_20:

      goto LABEL_21;
    }
    if (v32)
    {
      LOWORD(v38) = 0;
      _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "Updating keyboard screen frame", (uint8_t *)&v38, 2u);
    }

    -[CKScrollViewController setKeyboardScreenFrame:](self, "setKeyboardScreenFrame:", v10, v12, v14, v16);
    v33 = -[CKScrollViewController shouldUpdateScrollPositionForKeyboardScreenFrameChanges](self, "shouldUpdateScrollPositionForKeyboardScreenFrameChanges");
    IMLogHandleForCategory();
    v25 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
    if (!v33)
    {
      if (v34)
      {
        LOWORD(v38) = 0;
        v26 = "Not updating scroll position due to current view controller configuration.";
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    if (v34)
    {
      v38 = 138412290;
      v39 = CFSTR("KeyboardDidChangeFrame");
      _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "Updating scroll geometry for reason: %@", (uint8_t *)&v38, 0xCu);
    }

    -[CKScrollViewController updateScrollGeometryWithoutAnimationForReason:](self, "updateScrollGeometryWithoutAnimationForReason:", CFSTR("KeyboardDidChangeFrame"));
    -[CKScrollViewController scrollView](self, "scrollView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "__ck_isScrolledToBottom");

    if (v36)
    {
      IMLogHandleForCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        LOWORD(v38) = 0;
        _os_log_impl(&dword_18DFCD000, v37, OS_LOG_TYPE_INFO, "Is scrolling to bottom", (uint8_t *)&v38, 2u);
      }

      -[CKScrollViewController scrollView](self, "scrollView");
      v25 = objc_claimAutoreleasedReturnValue();
      -[NSObject __ck_scrollToBottom:](v25, "__ck_scrollToBottom:", 1);
      goto LABEL_20;
    }
  }
LABEL_21:

}

- (BOOL)shouldUpdateScrollPositionForKeyboardScreenFrameChanges
{
  return 1;
}

- (void)reasonTrackingUpdater:(id)a3 needsUpdateForReasons:(id)a4 followingHoldForReason:(id)a5
{
  if (self->_scrollGeometryUpdater == a3)
    -[CKScrollViewController scrollGeometryIsUpdatingForReasons:followingHoldForReason:](self, "scrollGeometryIsUpdatingForReasons:followingHoldForReason:", a4, a5);
}

- (void)reasonTrackingUpdater:(id)a3 didBeginHoldingUpdatesWithInitialReason:(id)a4
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_scrollGeometryUpdater == a3)
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Scroll geometry is being held. Initial reason: %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)reasonTrackingUpdater:(id)a3 didEndHoldingUpdatesWithFinalReason:(id)a4
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_scrollGeometryUpdater == a3)
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Scroll geometry hold ending. Final reason: %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKScrollViewController;
  -[CKScrollViewController viewSafeAreaInsetsDidChange](&v3, sel_viewSafeAreaInsetsDidChange);
  -[CKScrollViewController updateScrollGeometryWithoutAnimationForReason:](self, "updateScrollGeometryWithoutAnimationForReason:", CFSTR("SafeAreaInsetsChanged"));
}

- (void)updateScrollGeometryWithoutAnimationForReason:(id)a3
{
  id v4;
  CKScrollViewScrollGeometryUpdateReason *v5;
  id v6;

  v4 = a3;
  +[CKScrollViewAnimationProperties unanimated](CKScrollViewAnimationProperties, "unanimated");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[CKScrollViewScrollGeometryUpdateReason initWithReasonType:animationProperties:]([CKScrollViewScrollGeometryUpdateReason alloc], "initWithReasonType:animationProperties:", v4, v6);

  -[IMReasonTrackingUpdater updateImmediatelyWithReason:](self->_scrollGeometryUpdater, "updateImmediatelyWithReason:", v5);
}

- (void)updateScrollGeometryWithInheritedAnimationForReason:(id)a3
{
  id v4;
  CKScrollViewScrollGeometryUpdateReason *v5;
  id v6;

  v4 = a3;
  +[CKScrollViewAnimationProperties inheritedAnimation](CKScrollViewAnimationProperties, "inheritedAnimation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[CKScrollViewScrollGeometryUpdateReason initWithReasonType:animationProperties:]([CKScrollViewScrollGeometryUpdateReason alloc], "initWithReasonType:animationProperties:", v4, v6);

  -[IMReasonTrackingUpdater updateImmediatelyWithReason:](self->_scrollGeometryUpdater, "updateImmediatelyWithReason:", v5);
}

- (void)updateScrollGeometryForReason:(id)a3 withDuration:(double)a4 animationCurve:(int64_t)a5
{
  id v8;
  CKScrollViewScrollGeometryUpdateReason *v9;
  id v10;

  v8 = a3;
  +[CKScrollViewAnimationProperties animatedWithDuration:animationCurve:](CKScrollViewAnimationProperties, "animatedWithDuration:animationCurve:", a5, a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = -[CKScrollViewScrollGeometryUpdateReason initWithReasonType:animationProperties:]([CKScrollViewScrollGeometryUpdateReason alloc], "initWithReasonType:animationProperties:", v8, v10);

  -[IMReasonTrackingUpdater updateImmediatelyWithReason:](self->_scrollGeometryUpdater, "updateImmediatelyWithReason:", v9);
}

- (void)scrollGeometryIsUpdatingForReasons:(id)a3 followingHoldForReason:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[CKScrollViewController scrollView](self, "scrollView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v10, "__ck_isScrolledToBottom");
  +[CKScrollViewAnimationProperties unanimated](CKScrollViewAnimationProperties, "unanimated");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKScrollViewController scrollGeometryContentInsetIsUpdatingForReasons:followingHoldForReason:withAnimationProperties:](self, "scrollGeometryContentInsetIsUpdatingForReasons:followingHoldForReason:withAnimationProperties:", v7, v6, v9);

  if (v8)
    objc_msgSend(v10, "__ck_scrollToBottom:", 0);

}

- (CGRect)keyboardFrameInViewCoordinates
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  -[CKScrollViewController keyboardScreenFrame](self, "keyboardScreenFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKScrollViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CKKeyboardFrameInViewCoodinates(v11, v4, v6, v8, v10);
  v14 = v13;
  v16 = v15;
  v18 = v17;

  v19 = v12;
  v20 = v14;
  v21 = v16;
  v22 = v18;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (UIEdgeInsets)navigationBarInsets
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
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  -[CKScrollViewController navigationBarInsetsWithoutPalette](self, "navigationBarInsetsWithoutPalette");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKScrollViewController navigationController](self, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "existingPaletteForEdge:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && objc_msgSend(v12, "isAttached"))
  {
    objc_msgSend(v12, "frame");
    v4 = v4 + v13;
  }

  v14 = v4;
  v15 = v6;
  v16 = v8;
  v17 = v10;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (UIEdgeInsets)navigationBarInsetsWithoutPalette
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  double v15;
  void *v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  int v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  UIEdgeInsets result;

  v3 = *MEMORY[0x1E0CEB4B0];
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  -[CKScrollViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "shouldInsetForStatusBar");

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "statusBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isStatusBarHidden");

    if ((v14 & 1) == 0)
    {
      objc_msgSend(v12, "currentHeight");
      v3 = v15;
    }

  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "useMacToolbar");

    if (v17)
    {
      -[CKScrollViewController macToolbarInsets](self, "macToolbarInsets");
      v3 = v18;
      v4 = v19;
      v6 = v20;
      v5 = v21;
    }
    else if ((objc_msgSend(v8, "isTranslucent") & 1) != 0
           || (+[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors"),
               v22 = (void *)objc_claimAutoreleasedReturnValue(),
               v23 = objc_msgSend(v22, "shouldInsetForStatusBarWithSafeArea"),
               v22,
               v23))
    {
      -[CKScrollViewController view](self, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "safeAreaInsets");
      v3 = v25;

      v5 = 0.0;
      v6 = 0.0;
      v4 = 0.0;
    }
  }

  v26 = v3;
  v27 = v4;
  v28 = v6;
  v29 = v5;
  result.right = v29;
  result.bottom = v28;
  result.left = v27;
  result.top = v26;
  return result;
}

- (UIEdgeInsets)bannerInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0CEB4B0];
  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)macToolbarInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0CEB4B0];
  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)visibleHeightAboveKeyboard
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v13;

  -[CKScrollViewController keyboardFrame](self, "keyboardFrame");
  v4 = v3;
  v6 = v5;
  v7 = *MEMORY[0x1E0C9D538];
  v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[CKScrollViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  if (v4 != v7 || v6 != v8)
  {
    -[CKScrollViewController keyboardFrame](self, "keyboardFrame");
    v11 = v11 - v13;
  }

  return v11;
}

- (BOOL)isKeyboardUndocked
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CEA828], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUndocked");

  return v3;
}

- (BOOL)isKeyboardOnscreenWithoutAccessoryView
{
  double v2;

  -[CKScrollViewController bottomInsetWithoutAccessoryView](self, "bottomInsetWithoutAccessoryView");
  return v2 > 0.0;
}

- (double)accessoryViewHeight
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;

  -[CKScrollViewController inputAccessoryViewController](self, "inputAccessoryViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;

  }
  else
  {
    -[CKScrollViewController inputAccessoryView](self, "inputAccessoryView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      return 0.0;
  }
  objc_msgSend(v5, "frame");
  v7 = v6;

  return v7;
}

- (double)bottomInsetWithoutAccessoryView
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double result;

  -[CKScrollViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentInset");
  v5 = v4;
  -[CKScrollViewController accessoryViewHeight](self, "accessoryViewHeight");
  v7 = v5 - v6;

  result = 0.0;
  if (v7 >= 0.0)
    return v7;
  return result;
}

- (void)beginHoldingScrollGeometryUpdatesForReason:(id)a3
{
  -[IMReasonTrackingUpdater beginHoldingUpdatesForReason:](self->_scrollGeometryUpdater, "beginHoldingUpdatesForReason:", a3);
}

- (void)endHoldingScrollGeometryUpdatesForReason:(id)a3
{
  -[IMReasonTrackingUpdater endHoldingUpdatesForReason:updateTriggeredIfNotHeldShouldBeDeferred:](self->_scrollGeometryUpdater, "endHoldingUpdatesForReason:updateTriggeredIfNotHeldShouldBeDeferred:", a3, 0);
}

- (BOOL)isHoldingScrollGeometryUpdates
{
  return -[IMReasonTrackingUpdater isHoldingUpdates](self->_scrollGeometryUpdater, "isHoldingUpdates");
}

- (void)primeWithKeyboardFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKScrollViewController setKeyboardScreenFrame:](self, "setKeyboardScreenFrame:");
  v10.origin.x = x;
  v10.origin.y = y;
  v10.size.width = width;
  v10.size.height = height;
  v8 = CGRectGetHeight(v10);
  -[CKScrollViewController accessoryViewHeight](self, "accessoryViewHeight");
  if (v8 > v9)
    -[CKScrollViewController setKeyboardVisible:](self, "setKeyboardVisible:", 1);
  -[CKScrollViewController updateScrollGeometryWithoutAnimationForReason:](self, "updateScrollGeometryWithoutAnimationForReason:", CFSTR("PrimeKeyboardFrame"));
}

- (BOOL)manuallyUpdateKeyboardScreenFrameWithFrameIfNeeded:(CGRect)a3 animationDuration:(double)a4 animationCurve:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  NSObject *v11;
  id v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  BOOL v18;
  NSObject *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  uint64_t v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v37 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      -[CKScrollViewController keyboardScreenFrame](self, "keyboardScreenFrame");
      NSStringFromCGRect(v38);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v39.origin.x = x;
      v39.origin.y = y;
      v39.size.width = width;
      v39.size.height = height;
      NSStringFromCGRect(v39);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v32 = "-[CKScrollViewController manuallyUpdateKeyboardScreenFrameWithFrameIfNeeded:animationDuration:animationCurve:]";
      v33 = 2112;
      v34 = v12;
      v35 = 2112;
      v36 = v13;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "%s current %@ updated %@", buf, 0x20u);

    }
  }
  -[CKScrollViewController keyboardScreenFrame](self, "keyboardScreenFrame");
  v41.origin.x = v14;
  v41.origin.y = v15;
  v41.size.width = v16;
  v41.size.height = v17;
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  v18 = CGRectEqualToRect(v40, v41);
  if (!v18)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v32 = "-[CKScrollViewController manuallyUpdateKeyboardScreenFrameWithFrameIfNeeded:animationDuration:animationCurve:]";
        _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "%s applying fix-up for keyboard insets!", buf, 0xCu);
      }

    }
    -[CKScrollViewController keyboardScreenFrame](self, "keyboardScreenFrame");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    -[CKScrollViewController keyboardScreenFrame](self, "keyboardScreenFrame");
    -[CKScrollViewController _updateKeyboardScreenFrameForShowOrHideWithNewScreenFrame:previousFrame:duration:animationCurve:isShowEvent:](self, "_updateKeyboardScreenFrameForShowOrHideWithNewScreenFrame:previousFrame:duration:animationCurve:isShowEvent:", a5, y > v28, x, y, width, height, v21, v23, v25, v27, *(_QWORD *)&a4);
  }
  return !v18;
}

- (CGRect)screenFrameForNotification:(id)a3
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
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CEB890]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGRectValue");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)setKeyboardVisible:(BOOL)a3
{
  if (self->_keyboardVisible != a3)
  {
    self->_keyboardVisible = a3;
    -[CKScrollViewController keyboardVisibilityWillChange](self, "keyboardVisibilityWillChange");
  }
}

- (UIEdgeInsets)_calculateContentInsets
{
  double v3;
  double v4;
  uint64_t v5;
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
  double v18;
  double v19;
  void *v20;
  double Height;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  UIEdgeInsets result;

  if (-[CKScrollViewController topInsetIncludesPalette](self, "topInsetIncludesPalette"))
    -[CKScrollViewController navigationBarInsets](self, "navigationBarInsets");
  else
    -[CKScrollViewController navigationBarInsetsWithoutPalette](self, "navigationBarInsetsWithoutPalette");
  v4 = v3;
  v5 = MEMORY[0x1E0CEB4B0];
  -[CKScrollViewController topInsetPadding](self, "topInsetPadding");
  v7 = v6;
  v8 = 0.0;
  if (-[CKScrollViewController isUsingVisibleInputViewHeightWhenUpdatingScrollGeometry](self, "isUsingVisibleInputViewHeightWhenUpdatingScrollGeometry"))
  {
    -[CKScrollViewController visibleInputViewHeight](self, "visibleInputViewHeight");
    v8 = v9;
  }
  v10 = *(double *)(v5 + 8);
  v11 = *(double *)(v5 + 24);
  -[CKScrollViewController _bottomRotatingFooterHeight](self, "_bottomRotatingFooterHeight");
  v13 = v12;
  -[CKScrollViewController bottomInsetPadding](self, "bottomInsetPadding");
  if (v8 >= v13)
    v15 = v8;
  else
    v15 = v13;
  v16 = v14 + v15;
  -[CKScrollViewController minimumBottomInset](self, "minimumBottomInset");
  if (v16 < v17)
    v16 = v17;
  if (self->_enableContentPinning)
  {
    -[CKScrollViewController contentSizeForPinning](self, "contentSizeForPinning");
    v19 = v18;
    -[CKScrollViewController scrollView](self, "scrollView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    Height = CGRectGetHeight(v27);

    v22 = 0.0;
    if (v19 < Height - v16)
    {
      v23 = Height - v16 - v19;
      if (v16 <= self->_contentPinningThreshold)
        v23 = v23 * 0.5;
      v22 = fmax(v23, 0.0);
    }
  }
  else
  {
    v22 = v4 + v7;
  }
  v24 = v10;
  v25 = v16;
  v26 = v11;
  result.right = v26;
  result.bottom = v25;
  result.left = v24;
  result.top = v22;
  return result;
}

- (void)scrollGeometryContentInsetIsUpdatingForReasons:(id)a3 followingHoldForReason:(id)a4 withAnimationProperties:(id)a5
{
  void *v6;
  void *v7;
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
  double v18;
  double v19;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;

  v27 = a5;
  -[CKScrollViewController scrollView](self, "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "contentInset");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[CKScrollViewController _calculateContentInsets](self, "_calculateContentInsets");
    if (v17 != v11 || v16 != v9 || v19 != v15 || v18 != v13)
    {
      v23 = v16;
      v24 = v17;
      v25 = v18;
      v26 = v19;
      -[CKScrollViewController contentInsetWillChange:withAnimationProperties:](self, "contentInsetWillChange:withAnimationProperties:", v27);
      objc_msgSend(v7, "setContentInset:", v23, v24, v25, v26);
      -[CKScrollViewController contentInsetDidChangeWithAnimationProperties:](self, "contentInsetDidChangeWithAnimationProperties:", v27);
    }
  }

}

- (void)_changedStatusBarFrame:(id)a3
{
  -[CKScrollViewController updateScrollGeometryWithoutAnimationForReason:](self, "updateScrollGeometryWithoutAnimationForReason:", CFSTR("StatusBarFrameChanged"));
}

- (void)_entryViewWillRotate:(id)a3
{
  -[CKScrollViewController screenFrameForNotification:](self, "screenFrameForNotification:", a3);
  -[CKScrollViewController setKeyboardScreenFrame:](self, "setKeyboardScreenFrame:");
}

- (double)_bottomRotatingFooterHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[CKScrollViewController rotatingFooterView](self, "rotatingFooterView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
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

- (BOOL)isUsingVisibleInputViewHeightWhenUpdatingScrollGeometry
{
  return 1;
}

- (double)_visibleKeyboardHeight
{
  double v3;
  double x;
  double y;
  double width;
  double height;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  NSObject *v33;
  double MaxY;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v3 = 0.0;
  if (!-[CKScrollViewController isKeyboardFloating](self, "isKeyboardFloating"))
  {
    -[CKScrollViewController keyboardFrame](self, "keyboardFrame");
    x = v46.origin.x;
    y = v46.origin.y;
    width = v46.size.width;
    height = v46.size.height;
    if (!CGRectIsEmpty(v46))
    {
      -[CKScrollViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "convertRect:fromView:", 0, x, y, width, height);
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;

      -[CKScrollViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bounds");
      v52.origin.x = v10;
      v52.origin.y = v12;
      v52.size.width = v14;
      v52.size.height = v16;
      v48 = CGRectIntersection(v47, v52);
      v18 = v48.origin.x;
      v19 = v48.origin.y;
      v20 = v48.size.width;
      v21 = v48.size.height;

      v49.origin.x = v18;
      v49.origin.y = v19;
      v49.size.width = v20;
      v49.size.height = v21;
      if (!CGRectIsEmpty(v49))
      {
        -[CKScrollViewController view](self, "view");
        v33 = objc_claimAutoreleasedReturnValue();
        -[NSObject bounds](v33, "bounds");
        MaxY = CGRectGetMaxY(v50);
        v51.origin.x = v18;
        v51.origin.y = v19;
        v51.size.width = v20;
        v51.size.height = v21;
        v3 = MaxY - CGRectGetMinY(v51);
LABEL_21:

        return v3;
      }
      if (x != *MEMORY[0x1E0C9D538] || y != *(double *)(MEMORY[0x1E0C9D538] + 8))
      {
        v23 = CKIsRunningInMessagesViewService();
        -[CKScrollViewController view](self, "view");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v23)
        {
          objc_msgSend(v24, "window");
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "windowScene");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "screen");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "coordinateSpace");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "coordinateSpace");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "convertRect:toCoordinateSpace:", v30, x, y, width, height);
          v32 = v31;

          v25 = v26;
        }
        else
        {
          CKKeyboardFrameInViewCoodinates(v24, x, y, width, height);
          v32 = v40;
        }
        v3 = 0.0;

        if (v32 == 0.0)
        {
          IMLogHandleForCategory();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            -[CKScrollViewController _visibleKeyboardHeight].cold.1(v33);
        }
        else
        {
          -[CKScrollViewController view](self, "view");
          v33 = objc_claimAutoreleasedReturnValue();
          -[NSObject frame](v33, "frame");
          v3 = v44 - v32;
        }
        goto LABEL_21;
      }
      -[CKScrollViewController firstResponder](self, "firstResponder");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "inputAccessoryViewController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "view");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v37)
      {
        v39 = v37;
      }
      else
      {
        -[CKScrollViewController inputAccessoryView](self, "inputAccessoryView");
        v39 = (id)objc_claimAutoreleasedReturnValue();
      }
      v41 = v39;

      if (v41)
      {
        -[CKScrollViewController inputAccessoryView](self, "inputAccessoryView");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "frame");
        v3 = v43;

      }
      else
      {
        v3 = 0.0;
      }

    }
  }
  return v3;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (BOOL)topInsetIncludesPalette
{
  return self->_topInsetIncludesPalette;
}

- (double)topInsetPadding
{
  return self->_topInsetPadding;
}

- (double)bottomInsetPadding
{
  return self->_bottomInsetPadding;
}

- (double)minimumBottomInset
{
  return self->_minimumBottomInset;
}

- (BOOL)isKeyboardVisible
{
  return self->_keyboardVisible;
}

- (BOOL)enableContentPinning
{
  return self->_enableContentPinning;
}

- (void)setEnableContentPinning:(BOOL)a3
{
  self->_enableContentPinning = a3;
}

- (double)contentPinningThreshold
{
  return self->_contentPinningThreshold;
}

- (void)setContentPinningThreshold:(double)a3
{
  self->_contentPinningThreshold = a3;
}

- (CGSize)contentSizeForPinning
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSizeForPinning.width;
  height = self->_contentSizeForPinning.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGRect)keyboardScreenFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_keyboardScreenFrame.origin.x;
  y = self->_keyboardScreenFrame.origin.y;
  width = self->_keyboardScreenFrame.size.width;
  height = self->_keyboardScreenFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)keyboardInteractionCancelled
{
  return self->_keyboardInteractionCancelled;
}

- (void)setKeyboardInteractionCancelled:(BOOL)a3
{
  self->_keyboardInteractionCancelled = a3;
}

- (IMReasonTrackingUpdater)scrollGeometryUpdater
{
  return self->_scrollGeometryUpdater;
}

- (void)setScrollGeometryUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_scrollGeometryUpdater, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollGeometryUpdater, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
}

- (void)_visibleKeyboardHeight
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "Invalid keyboard frame, keyboard covers entire view. Ignoring.", v1, 2u);
}

@end
