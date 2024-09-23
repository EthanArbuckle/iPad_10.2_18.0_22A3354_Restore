@implementation CAMBarsAccessibilityHUDManager

- (CAMBarsAccessibilityHUDManager)initWithView:(id)a3 delegate:(id)a4 cancelsTouchesInView:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  CAMBarsAccessibilityHUDManager *v10;
  CAMBarsAccessibilityHUDManager *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CAMBarsAccessibilityHUDManager;
  v10 = -[CAMBarsAccessibilityHUDManager init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    -[CAMBarsAccessibilityHUDManager setDelegate:](v10, "setDelegate:", v9);
    -[CAMBarsAccessibilityHUDManager setView:](v11, "setView:", v8);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v11, sel__handleAccessibilityLongPressGesture_);
    objc_msgSend(v12, "setMinimumPressDuration:", 0.15);
    objc_msgSend(v12, "setDelegate:", v11);
    objc_msgSend(v12, "setCancelsTouchesInView:", v5);
    -[CAMBarsAccessibilityHUDManager _setAccessibilityLongPressGestureRecognizer:](v11, "_setAccessibilityLongPressGestureRecognizer:", v12);
    -[CAMBarsAccessibilityHUDManager view](v11, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addGestureRecognizer:", v12);

  }
  return v11;
}

- (CGPoint)locationOfAccessibilityGestureInView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v4 = a3;
  -[CAMBarsAccessibilityHUDManager _accessibilityLongPressGestureRecognizer](self, "_accessibilityLongPressGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v4);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a3;
  -[CAMBarsAccessibilityHUDManager _accessibilityLongPressGestureRecognizer](self, "_accessibilityLongPressGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  return v7;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  void *v4;
  void *v5;
  NSString *v6;
  _BOOL4 IsAccessibilityCategory;
  void *v8;
  char v9;
  void *v10;
  char v11;

  -[CAMBarsAccessibilityHUDManager view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (!IsAccessibilityCategory)
    return 0;
  -[CAMBarsAccessibilityHUDManager view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) == 0)
    return 1;
  -[CAMBarsAccessibilityHUDManager view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "shouldAccessibilityGestureBeginForHUDManager:", self);

  return v11;
}

- (void)_handleAccessibilityLongPressGesture:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "state");
  if (v4 == 3)
  {
    -[CAMBarsAccessibilityHUDManager delegate](self, "delegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dismissAccessibilityHUDViewForAccessibilityHUDManager:", self);

    -[CAMBarsAccessibilityHUDManager view](self, "view");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "selectedByAccessibilityHUDManager:", self);
    goto LABEL_16;
  }
  if (v4 != 2)
  {
    if (v4 == 1)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      -[CAMBarsAccessibilityHUDManager view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "touchingRecognizersToCancel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v20 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            v12 = objc_msgSend(v11, "isEnabled");
            objc_msgSend(v11, "setEnabled:", 0);
            objc_msgSend(v11, "setEnabled:", v12);
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v8);
      }

      goto LABEL_12;
    }
    -[CAMBarsAccessibilityHUDManager delegate](self, "delegate");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dismissAccessibilityHUDViewForAccessibilityHUDManager:", self);
LABEL_16:

    return;
  }
LABEL_12:
  -[CAMBarsAccessibilityHUDManager view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hudItemForAccessibilityHUDManager:", self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMBarsAccessibilityHUDManager delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14)
    objc_msgSend(v15, "accessibilityHUDManager:wantsToShowHUDItem:", self, v14);
  else
    objc_msgSend(v15, "dismissAccessibilityHUDViewForAccessibilityHUDManager:", self);

}

- (CAMBarsAccessibilityHUDManagerGestureProvider)view
{
  return (CAMBarsAccessibilityHUDManagerGestureProvider *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (CAMBarsAccessibilityHUDManagerDelegate)delegate
{
  return (CAMBarsAccessibilityHUDManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILongPressGestureRecognizer)_accessibilityLongPressGestureRecognizer
{
  return self->__accessibilityLongPressGestureRecognizer;
}

- (void)_setAccessibilityLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->__accessibilityLongPressGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__accessibilityLongPressGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
}

@end
