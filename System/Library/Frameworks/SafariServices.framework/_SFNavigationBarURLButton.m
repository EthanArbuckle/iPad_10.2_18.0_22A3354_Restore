@implementation _SFNavigationBarURLButton

- (_SFNavigationBarURLButton)initWithFrame:(CGRect)a3
{
  _SFNavigationBarURLButton *v3;
  UIVisualEffectView *v4;
  UIVisualEffectView *effectView;
  id v6;
  uint64_t v7;
  UIView *effectMask;
  void *v9;
  void *v10;
  uint64_t v11;
  UIEditMenuInteraction *editMenuInteraction;
  uint64_t v13;
  UIGestureRecognizer *longPressGestureRecognizer;
  void *v15;
  void *v16;
  PKScribbleInteraction *v17;
  PKScribbleInteraction *pencilScribbleInteraction;
  _SFNavigationBarURLButton *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)_SFNavigationBarURLButton;
  v3 = -[_SFNavigationBarURLButton initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0DC3F58]);
    effectView = v3->_effectView;
    v3->_effectView = v4;

    -[_SFNavigationBarURLButton bounds](v3, "bounds");
    -[UIVisualEffectView setFrame:](v3->_effectView, "setFrame:");
    -[UIVisualEffectView setAutoresizingMask:](v3->_effectView, "setAutoresizingMask:", 18);
    -[_SFNavigationBarURLButton addSubview:](v3, "addSubview:", v3->_effectView);
    v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[UIVisualEffectView bounds](v3->_effectView, "bounds");
    v7 = objc_msgSend(v6, "initWithFrame:");
    effectMask = v3->_effectMask;
    v3->_effectMask = (UIView *)v7;

    -[UIView setAutoresizingMask:](v3->_effectMask, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_effectMask, "setBackgroundColor:", v9);

    -[UIVisualEffectView contentView](v3->_effectView, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v3->_effectMask);

    v3->_backgroundAlphaFactor = 1.0;
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC37A0]), "initWithDelegate:", v3);
    editMenuInteraction = v3->_editMenuInteraction;
    v3->_editMenuInteraction = (UIEditMenuInteraction *)v11;

    -[_SFNavigationBarURLButton addInteraction:](v3, "addInteraction:", v3->_editMenuInteraction);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v3, sel__handleLongPress_);
    longPressGestureRecognizer = v3->_longPressGestureRecognizer;
    v3->_longPressGestureRecognizer = (UIGestureRecognizer *)v13;

    -[UIGestureRecognizer setDelegate:](v3->_longPressGestureRecognizer, "setDelegate:", v3);
    -[_SFNavigationBarURLButton addGestureRecognizer:](v3, "addGestureRecognizer:", v3->_longPressGestureRecognizer);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3858]), "initWithTarget:action:", v3, sel__hover_);
    -[_SFNavigationBarURLButton addGestureRecognizer:](v3, "addGestureRecognizer:", v15);

    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC40D0]), "initWithTarget:action:", v3, sel__handleLongPress_);
    -[_SFNavigationBarURLButton addGestureRecognizer:](v3, "addGestureRecognizer:", v16);

    -[_SFNavigationBarURLButton addTarget:action:forControlEvents:](v3, "addTarget:action:forControlEvents:", v3, sel__dismissMenu_, 1);
    v17 = (PKScribbleInteraction *)objc_alloc_init(MEMORY[0x1E0CD1210]);
    pencilScribbleInteraction = v3->_pencilScribbleInteraction;
    v3->_pencilScribbleInteraction = v17;

    -[PKScribbleInteraction setDelegate:](v3->_pencilScribbleInteraction, "setDelegate:", v3);
    -[PKScribbleInteraction setElementSource:](v3->_pencilScribbleInteraction, "setElementSource:", v3);
    -[_SFNavigationBarURLButton addInteraction:](v3, "addInteraction:", v3->_pencilScribbleInteraction);
    v19 = v3;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[UIGestureRecognizer setDelegate:](self->_longPressGestureRecognizer, "setDelegate:", 0);
  -[UIGestureRecognizer removeTarget:action:](self->_longPressGestureRecognizer, "removeTarget:action:", self, sel__handleLongPress_);
  v3.receiver = self;
  v3.super_class = (Class)_SFNavigationBarURLButton;
  -[_SFNavigationBarURLButton dealloc](&v3, sel_dealloc);
}

- (BOOL)pointMostlyInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[_SFNavigationBarURLButton layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFNavigationBarURLButton layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentationLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:toLayer:", v10, x, y);
  v12.receiver = self;
  v12.super_class = (Class)_SFNavigationBarURLButton;
  LOBYTE(self) = -[_SFNavigationBarURLButton pointMostlyInside:withEvent:](&v12, sel_pointMostlyInside_withEvent_, v7);

  return (char)self;
}

- (void)setTheme:(uint64_t)a1
{
  id v4;
  id v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a2;
  if (a1)
  {
    v5 = *(id *)(a1 + 824);
    if (v5 != v4)
    {
      v12 = v4;
      v6 = objc_msgSend(v5, "isEqual:", v4);
      v4 = v12;
      if ((v6 & 1) == 0)
      {
        objc_storeStrong((id *)(a1 + 824), a2);
        v7 = objc_msgSend(v12, "tintStyle");
        objc_msgSend(MEMORY[0x1E0DC3F08], "_sf_effectWithStyle:forBarTintStyle:", 0, v7);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 760);
        *(_QWORD *)(a1 + 760) = v8;

        objc_msgSend(MEMORY[0x1E0DC3F08], "_sf_effectWithStyle:forBarTintStyle:", 1, v7);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = *(void **)(a1 + 752);
        *(_QWORD *)(a1 + 752) = v10;

        objc_msgSend((id)a1, "_setOverrideUserInterfaceStyle:", objc_msgSend(v12, "platterOverrideUserInterfaceStyle"));
        -[_SFNavigationBarURLButton _updateEffectView](a1);
        v4 = v12;
      }
    }
  }

}

- (void)_updateEffectView
{
  int v2;
  int *v3;
  void *v4;
  id v5;

  if (a1)
  {
    v2 = objc_msgSend((id)a1, "isHighlighted");
    v3 = &OBJC_IVAR____SFNavigationBarURLButton__vibrancyEffect;
    if (v2)
      v3 = &OBJC_IVAR____SFNavigationBarURLButton__highlightedVibrancyEffect;
    objc_msgSend(*(id *)(a1 + 768), "setEffect:", *(_QWORD *)(a1 + *v3));
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorWithAlphaComponent:", *(double *)(a1 + 816));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 776), "setBackgroundColor:", v4);

  }
}

- (void)_updateBackgroundImageAnimated:(void *)result
{
  void *v3;
  int v4;
  double v5;
  _QWORD v6[5];

  if (result)
  {
    v3 = result;
    if (objc_msgSend(result, "isHighlighted"))
    {
      v4 = objc_msgSend(v3, "isTracking");
      v5 = 0.47;
      if (v4)
        v5 = 0.2;
    }
    else
    {
      v5 = 0.47;
    }
    if (!a2)
      v5 = 0.0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __60___SFNavigationBarURLButton__updateBackgroundImageAnimated___block_invoke;
    v6[3] = &unk_1E4ABFE00;
    v6[4] = v3;
    return (void *)objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 50659332, v6, 0, v5, 0.0);
  }
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[_SFNavigationBarURLButton isHighlighted](self, "isHighlighted") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_SFNavigationBarURLButton;
    -[_SFNavigationBarURLButton setHighlighted:](&v5, sel_setHighlighted_, v3);
    if (-[_SFNavigationBarURLButton adjustsImageWhenHighlighted](self, "adjustsImageWhenHighlighted"))
      -[_SFNavigationBarURLButton _updateBackgroundImageAnimated:](self, 1);
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)copy:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationBarURLButtonDidReceiveCopyCommand:", self);

}

- (void)pasteAndSearch:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationBarURLButtonDidReceivePasteCommand:", self);

}

- (void)pasteAndGo:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationBarURLButtonDidReceivePasteCommand:", self);

}

- (void)_handleLongPress:(id)a3
{
  id WeakRetained;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "state") == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v5 = objc_msgSend(WeakRetained, "navigationBarURLButton:shouldShowMenuForGestureWithRecognizer:", self, v9);

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0DC3798];
      -[UIEditMenuInteraction view](self->_editMenuInteraction, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "locationInView:", v7);
      objc_msgSend(v6, "configurationWithIdentifier:sourcePoint:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIEditMenuInteraction presentEditMenuWithConfiguration:](self->_editMenuInteraction, "presentEditMenuWithConfiguration:", v8);
    }
  }

}

- (void)_dismissMenu:(id)a3
{
  -[UIEditMenuInteraction dismissMenu](self->_editMenuInteraction, "dismissMenu", a3);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  unsigned __int8 v10;
  BOOL v11;
  objc_super v13;

  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = WeakRetained;
  if (sel_copy_ == a3)
  {
    v10 = objc_msgSend(WeakRetained, "navigationBarURLButtonShouldCopy:", self);
  }
  else if (sel_pasteAndSearch_ == a3 || sel_pasteAndGo_ == a3)
  {
    v10 = objc_msgSend(WeakRetained, "navigationBarURLButtonShouldPaste:", self);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)_SFNavigationBarURLButton;
    v10 = -[_SFNavigationBarURLButton canPerformAction:withSender:](&v13, sel_canPerformAction_withSender_, a3, v6);
  }
  v11 = v10;

  return v11;
}

- (void)setOverlayConfiguration:(uint64_t)a1
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  if (a1)
  {
    v4 = *(id *)(a1 + 848);
    objc_storeStrong((id *)(a1 + 848), a2);
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = WBSIsEqual();

    v8 = *(void **)(a1 + 808);
    if (v7)
    {
      objc_msgSend(v8, "setConfiguration:", v13);
    }
    else
    {
      objc_msgSend(v8, "dismissAndRemove");
      if (v13)
      {
        v9 = objc_alloc(MEMORY[0x1E0D4EE90]);
        objc_msgSend((id)a1, "bounds");
        v10 = objc_msgSend(v9, "initWithFrame:configuration:", v13);
        v11 = *(void **)(a1 + 808);
        *(_QWORD *)(a1 + 808) = v10;

        objc_msgSend(*(id *)(a1 + 808), "setAutoresizingMask:", 18);
        objc_msgSend(*(id *)(a1 + 808), "_setContinuousCornerRadius:", *(double *)(a1 + 840));
        objc_msgSend((id)a1, "addSubview:", *(_QWORD *)(a1 + 808));
        objc_msgSend(*(id *)(a1 + 808), "present");
      }
      else
      {
        v12 = *(void **)(a1 + 808);
        *(_QWORD *)(a1 + 808) = 0;

      }
    }

  }
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  NSObject *v5;
  id WeakRetained;
  char v7;

  v5 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_SFNavigationBarURLButton _scribbleInteraction:focusWillTransformElement:].cold.1();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_msgSend(WeakRetained, "navigationBarURLButtonIsUsingNarrowLayout:", self);

  return v7;
}

- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  NSObject *v5;
  id WeakRetained;

  v5 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_SFNavigationBarURLButton _scribbleInteraction:willBeginWritingInElement:].cold.1();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationBarURLButtonBeginSuppressingPlaceholder:", self);

}

- (void)_scribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4
{
  NSObject *v5;
  id WeakRetained;

  v5 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_SFNavigationBarURLButton _scribbleInteraction:didFinishWritingInElement:].cold.1();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationBarURLButtonEndSuppressingPlaceholder:", self);

}

- (BOOL)_scribbleInteraction:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  double y;
  double x;
  NSObject *v7;
  id WeakRetained;
  char v9;

  y = a4.y;
  x = a4.x;
  v7 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_SFNavigationBarURLButton _scribbleInteraction:shouldBeginAtLocation:].cold.1();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_msgSend(WeakRetained, "navigationBarURLButton:canWriteAtLocation:", self, x, y);

  return v9;
}

- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
  void (**v6)(id, void *, uint64_t);
  NSObject *v7;
  id WeakRetained;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, uint64_t))a5;
  v7 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_SFNavigationBarURLButton _scribbleInteraction:requestElementsInRect:completion:].cold.1();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_msgSend(WeakRetained, "textFieldIsEditableForNavigationBarURLButton:", self) & 1) != 0)
  {
    objc_msgSend(WeakRetained, "textFieldForNavigationBarURLButton:", self);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isFirstResponder");

    if (v10)
      v11 = 0;
    else
      v11 = 0x7FFFFFFFFFFFFFFFLL;
    v13[0] = CFSTR("pencilTextInputElementIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v12, v11);

  }
  else
  {
    v6[2](v6, (void *)MEMORY[0x1E0C9AA60], 0x7FFFFFFFFFFFFFFFLL);
  }

}

- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4
{
  NSObject *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v5 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_SFNavigationBarURLButton _scribbleInteraction:frameForElement:].cold.1();
  -[_SFNavigationBarURLButton bounds](self, "bounds");
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6
{
  void (**v8)(id, _QWORD);
  id v9;
  NSObject *v10;
  id WeakRetained;
  int v12;
  id v13;
  void (**v14)(id, _QWORD);
  _QWORD v15[4];
  id v16;
  _SFNavigationBarURLButton *v17;
  id v18;

  v8 = (void (**)(id, _QWORD))a6;
  v9 = a4;
  v10 = WBS_LOG_CHANNEL_PREFIXPencilInput();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[_SFNavigationBarURLButton _scribbleInteraction:focusElement:initialFocusSelectionReferencePoint:completion:].cold.1();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = objc_msgSend(v9, "isEqual:", CFSTR("pencilTextInputElementIdentifier"));

  if (!v12 || !WeakRetained)
    v8[2](v8, 0);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __110___SFNavigationBarURLButton__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke;
  v15[3] = &unk_1E4AC14A0;
  v17 = self;
  v18 = v8;
  v16 = WeakRetained;
  v13 = WeakRetained;
  v14 = v8;
  objc_msgSend(v13, "navigationBarURLButtonDidRequestFocusForPencilInput:completionHandler:", self, v15);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  _SFNavigationBarURLButtonDelegate **p_delegate;
  id v6;
  id WeakRetained;
  double v8;
  double v9;
  double v10;
  double v11;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v6, "locationInView:", self);
  v9 = v8;
  v11 = v10;

  LODWORD(v6) = objc_msgSend(WeakRetained, "navigationBarURLButton:shouldAllowLongPressAtPoint:", self, v9, v11);
  if (!(_DWORD)v6)
    return 0;
  if (-[_SFNavigationBarURLButton canPerformAction:withSender:](self, "canPerformAction:withSender:", sel_copy_, 0)
    || -[_SFNavigationBarURLButton canPerformAction:withSender:](self, "canPerformAction:withSender:", sel_pasteAndSearch_, 0))
  {
    return 1;
  }
  return -[_SFNavigationBarURLButton canPerformAction:withSender:](self, "canPerformAction:withSender:", sel_pasteAndGo_, 0);
}

- (void)_hover:(id)a3
{
  uint64_t v4;

  if ((unint64_t)(objc_msgSend(a3, "state") - 1) >= 2)
    v4 = -[_SFNavigationBarURLButton isTracking](self, "isTracking");
  else
    v4 = 1;
  -[_SFNavigationBarURLButton setHighlighted:](self, "setHighlighted:", v4);
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v7;
  id v8;
  id WeakRetained;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a5;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v8, "locationInView:", self);
  v11 = v10;
  v13 = v12;

  if ((objc_msgSend(WeakRetained, "navigationBarURLButton:shouldAllowLongPressAtPoint:", self, v11, v13) & 1) != 0)
  {
    v14 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "safari_pasteAndNavigateCommand");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "safari_addObjectUnlessNil:", v16);

    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", MEMORY[0x1E0C9AA60]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_pencilScribbleInteraction, 0);
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_effectMask, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_vibrancyEffect, 0);
  objc_storeStrong((id *)&self->_highlightedVibrancyEffect, 0);
}

- (void)_scribbleInteraction:focusWillTransformElement:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1A3B2D000, v0, v1, "-_scribbleInteraction:focusWillTransformElement:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_scribbleInteraction:willBeginWritingInElement:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1A3B2D000, v0, v1, "-_scribbleInteraction:willBeginWritingInElement:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_scribbleInteraction:didFinishWritingInElement:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1A3B2D000, v0, v1, "-_scribbleInteraction:didFinishWritingInElement:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_scribbleInteraction:shouldBeginAtLocation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1A3B2D000, v0, v1, "-_scribbleInteraction:shouldBeginAtLocation:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_scribbleInteraction:requestElementsInRect:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1A3B2D000, v0, v1, "-_scribbleInteraction:requestElementsInRect:completion:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_scribbleInteraction:frameForElement:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1A3B2D000, v0, v1, "-_scribbleInteraction:frameForElement:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_scribbleInteraction:focusElement:initialFocusSelectionReferencePoint:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1A3B2D000, v0, v1, "-_scribbleInteraction:focusElement:initialFocusSelectionReferencePoint:completion:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
