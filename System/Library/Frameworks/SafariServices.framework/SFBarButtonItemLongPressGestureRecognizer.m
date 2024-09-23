@implementation SFBarButtonItemLongPressGestureRecognizer

+ (id)gestureRecognizerTarget:(id)a3 longPressAction:(SEL)a4 touchDownAction:(SEL)a5 attachedToBarButtonItem:(id)a6
{
  id v10;
  id v11;
  id *v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a3;
  v12 = (id *)objc_alloc_init((Class)a1);
  objc_msgSend(v12, "addTarget:action:", v12, sel_longPress_);
  objc_msgSend(MEMORY[0x1E0DC34F0], "_sf_longPressAllowableMovement");
  objc_msgSend(v12, "setAllowableMovement:");
  objc_msgSend(v12, "setDelegate:", v12);
  objc_storeWeak(v12 + 62, v10);

  v12[64] = (id)a4;
  objc_storeWeak(v12 + 63, v11);

  v12[65] = (id)a5;
  objc_msgSend(v12, "setButtonMaskRequired:", 3);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "preferredContentSizeCategory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "_updateMinimumPressDurationForContentSizeCategory:", v14);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", v12, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  return v12;
}

- (void)_updateMinimumPressDurationForContentSizeCategory:(id)a3
{
  _BOOL4 IsAccessibilityCategory;
  double v5;

  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)a3);
  v5 = 0.5;
  if (IsAccessibilityCategory)
    v5 = 1.0;
  -[SFBarButtonItemLongPressGestureRecognizer setMinimumPressDuration:](self, "setMinimumPressDuration:", v5);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;
  SEL touchDownAction;
  id WeakRetained;
  id v12;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SFBarButtonItemLongPressGestureRecognizer;
  -[SFBarButtonItemLongPressGestureRecognizer touchesBegan:withEvent:](&v13, sel_touchesBegan_withEvent_, a3, v6);
  if (!-[SFBarButtonItemLongPressGestureRecognizer state](self, "state"))
  {
    v7 = v6;
    if ((objc_msgSend(v7, "_keyModifierFlags") & 0x40000) != 0)
    {

    }
    else
    {
      v8 = objc_msgSend(v7, "buttonMask");

      if ((v8 & 2) == 0)
        goto LABEL_7;
    }
    -[SFBarButtonItemLongPressGestureRecognizer setState:](self, "setState:", 1);
  }
LABEL_7:
  if (!-[SFBarButtonItemLongPressGestureRecognizer state](self, "state") && self->_touchDownAction)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    touchDownAction = self->_touchDownAction;
    WeakRetained = objc_loadWeakRetained(&self->_target);
    v12 = objc_loadWeakRetained((id *)&self->_barButtonItem);
    objc_msgSend(v9, "sendAction:to:from:forEvent:", touchDownAction, WeakRetained, v12, 0);

  }
}

- (void)longPress:(id)a3
{
  if (-[SFBarButtonItemLongPressGestureRecognizer state](self, "state", a3) == 1)
    -[SFBarButtonItemLongPressGestureRecognizer _invokeLongPressAction](self, "_invokeLongPressAction");
}

- (void)_invokeLongPressAction
{
  SEL longPressAction;
  id WeakRetained;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  longPressAction = self->_longPressAction;
  WeakRetained = objc_loadWeakRetained(&self->_target);
  v5 = objc_loadWeakRetained((id *)&self->_barButtonItem);
  objc_msgSend(v6, "sendAction:to:from:forEvent:", longPressAction, WeakRetained, v5, 0);

}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0DC4928]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[SFBarButtonItemLongPressGestureRecognizer _updateMinimumPressDurationForContentSizeCategory:](self, "_updateMinimumPressDurationForContentSizeCategory:", v5);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id WeakRetained;
  SEL longPressAction;
  id v6;
  char v7;

  WeakRetained = objc_loadWeakRetained(&self->_target);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    longPressAction = self->_longPressAction;
    v6 = objc_loadWeakRetained((id *)&self->_barButtonItem);
    v7 = objc_msgSend(WeakRetained, "canPerformAction:withSender:", longPressAction, v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_destroyWeak((id *)&self->_barButtonItem);
}

@end
