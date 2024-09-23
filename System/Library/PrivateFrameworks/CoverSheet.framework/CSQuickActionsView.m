@implementation CSQuickActionsView

- (CSQuickActionsView)initWithFrame:(CGRect)a3 delegate:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CSQuickActionsView *v10;
  CSQuickActionsView *v11;
  void *v12;
  uint64_t v13;
  CSDashBoardQuickActionsButtonSettings *quickActionsSettings;
  SBMiscellaneousDefaults *v15;
  SBMiscellaneousDefaults *miscellaneousDefaults;
  uint64_t v17;
  UIImage *luminanceMap;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CSQuickActionsView;
  v10 = -[CSQuickActionsView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v9);
    +[CSLockScreenDomain rootSettings](CSLockScreenDomain, "rootSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dashBoardQuickActionButtonSettings");
    v13 = objc_claimAutoreleasedReturnValue();
    quickActionsSettings = v11->_quickActionsSettings;
    v11->_quickActionsSettings = (CSDashBoardQuickActionsButtonSettings *)v13;

    -[PTSettings addKeyObserver:](v11->_quickActionsSettings, "addKeyObserver:", v11);
    v15 = (SBMiscellaneousDefaults *)objc_alloc_init(MEMORY[0x1E0DA9FB0]);
    miscellaneousDefaults = v11->_miscellaneousDefaults;
    v11->_miscellaneousDefaults = v15;

    objc_msgSend(MEMORY[0x1E0CEA638], "kitImageNamed:", CFSTR("UICoverSheetButtonLuminanceMap"));
    v17 = objc_claimAutoreleasedReturnValue();
    luminanceMap = v11->_luminanceMap;
    v11->_luminanceMap = (UIImage *)v17;

    -[CSQuickActionsView refreshSupportedButtons](v11, "refreshSupportedButtons");
  }

  return v11;
}

- (id)_createButtonGlyphForAction:(id)a3
{
  id v4;
  id v5;
  CSQuickActionControlGlyphView *v6;
  void *v7;
  double v8;
  double v9;
  CSQuickActionControlGlyphView *v10;
  CSQuickActionImageGlyphView *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = [CSQuickActionControlGlyphView alloc];
    objc_msgSend(v5, "controlInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "symbolScaleValue");
    v9 = v8;

    v10 = -[CSQuickActionControlGlyphView initWithControlInstance:symbolScaleValue:](v6, "initWithControlInstance:symbolScaleValue:", v7, v9);
  }
  else
  {
    v11 = [CSQuickActionImageGlyphView alloc];
    objc_msgSend(v4, "symbolName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedSymbolName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "symbolScaleValue");
    v14 = v13;
    -[CSQuickActionsView _buttonDiameter](self, "_buttonDiameter");
    v16 = v15;
    objc_msgSend(v4, "symbolOnColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CSQuickActionImageGlyphView initWithSystemImageName:selectedSystemImageName:symbolScaleValue:buttonDiameter:symbolOnColor:](v11, "initWithSystemImageName:selectedSystemImageName:symbolScaleValue:buttonDiameter:symbolOnColor:", v7, v12, v17, v14, v16);

  }
  return v10;
}

- (id)_createButtonForAction:(id)a3
{
  id v4;
  CSQuickActionsButton *v5;
  uint64_t v6;
  CSQuickActionsButton *v7;
  CSQuickActionsButton *v8;
  CSQuickActionsButton *v9;
  void *v10;
  void *v11;
  void *v12;
  CSQuickActionsButton *v13;

  v4 = a3;
  v5 = -[CSQuickActionsButton initWithAction:luminanceMap:]([CSQuickActionsButton alloc], "initWithAction:luminanceMap:", v4, self->_luminanceMap);
  v6 = objc_opt_class();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  -[CSQuickActionsView _createButtonGlyphForAction:](self, "_createButtonGlyphForAction:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSQuickActionsButton setGlyphView:](v9, "setGlyphView:", v10);
  -[CSQuickActionsButton setDelegate:](v7, "setDelegate:", self);
  -[CSQuickActionsView _buttonGroupName](self, "_buttonGroupName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSProminentButtonControl setBackgroundEffectViewGroupName:](v7, "setBackgroundEffectViewGroupName:", v11);

  -[CSQuickActionsButton setLegibilitySettings:](v7, "setLegibilitySettings:", self->_legibilitySettings);
  -[CSQuickActionsButton setHidden:](v7, "setHidden:", objc_msgSend(v4, "showsButton") ^ 1);
  -[CSQuickActionsButton setVisible:](v7, "setVisible:", 1);
  objc_msgSend(v4, "accessibilityIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSQuickActionsButton setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", v12);

  -[CSQuickActionsView _addTargetsToButton:](self, "_addTargetsToButton:", v7);
  v13 = v7;

  return v13;
}

- (void)setButtonActions:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *buttonActions;
  uint64_t v8;
  NSArray *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  CSProminentButtonsView *v45;
  CSProminentButtonsView *buttonContainerView;
  NSArray *v47;
  NSArray *v48;
  NSArray *buttons;
  id v50;
  _QWORD v51[5];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSArray isEqualToArray:](self->_buttonActions, "isEqualToArray:", v4))
    goto LABEL_50;
  v5 = (NSArray *)-[NSArray mutableCopy](self->_buttons, "mutableCopy");
  v6 = (NSArray *)-[NSArray mutableCopy](self->_buttonActions, "mutableCopy");
  buttonActions = self->_buttonActions;
  if (buttonActions && (v8 = -[NSArray count](buttonActions, "count"), v8 == objc_msgSend(v4, "count")))
  {
    if (!objc_msgSend(v4, "count"))
    {
      v19 = v6;
      goto LABEL_21;
    }
    v9 = v5;
    v10 = 0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_buttonActions, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = BSEqualObjects();

      if ((v13 & 1) == 0)
      {
        SBLogCoverSheet();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "objectAtIndexedSubscript:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v57 = v15;
          _os_log_impl(&dword_1D0337000, v14, OS_LOG_TYPE_DEFAULT, "[Quick Action] creating button for action %@", buf, 0xCu);

        }
        -[NSArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeFromSuperview");

        objc_msgSend(v4, "objectAtIndexedSubscript:", v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray setObject:atIndexedSubscript:](v6, "setObject:atIndexedSubscript:", v17, v10);
        -[CSQuickActionsView _createButtonForAction:](self, "_createButtonForAction:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray setObject:atIndexedSubscript:](v9, "setObject:atIndexedSubscript:", v18, v10);

      }
      ++v10;
    }
    while (objc_msgSend(v4, "count") > v10);
    v19 = v6;
  }
  else
  {
    v19 = (NSArray *)objc_msgSend(v4, "copy");

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v20 = self->_buttons;
    v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v53 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "removeFromSuperview");
        }
        v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      }
      while (v22);
    }

    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __39__CSQuickActionsView_setButtonActions___block_invoke;
    v51[3] = &unk_1E8E308E8;
    v51[4] = self;
    -[NSArray bs_map:](v19, "bs_map:", v51);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSArray *)objc_msgSend(v25, "mutableCopy");

  }
  v5 = v9;
LABEL_21:
  if (-[NSArray count](v5, "count") >= 2)
  {
    -[NSArray firstObject](self->_buttons, "firstObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_opt_class();
    v28 = v26;
    if (v27)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v29 = v28;
      else
        v29 = 0;
    }
    else
    {
      v29 = 0;
    }
    v50 = v29;

    -[NSArray firstObject](v5, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_opt_class();
    v32 = v30;
    if (v31)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v33 = v32;
      else
        v33 = 0;
    }
    else
    {
      v33 = 0;
    }
    v34 = v33;

    -[NSArray lastObject](self->_buttons, "lastObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_opt_class();
    v37 = v35;
    if (v36)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v38 = v37;
      else
        v38 = 0;
    }
    else
    {
      v38 = 0;
    }
    v39 = v38;

    -[NSArray lastObject](v5, "lastObject");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_opt_class();
    v42 = v40;
    if (v41)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v43 = v42;
      else
        v43 = 0;
    }
    else
    {
      v43 = 0;
    }
    v44 = v43;

    if (self->_buttonContainerView)
    {
      if ((BSEqualObjects() & 1) == 0)
        -[CSProminentButtonsView setLeadingButton:](self->_buttonContainerView, "setLeadingButton:", v34);
      if ((BSEqualObjects() & 1) == 0)
        -[CSProminentButtonsView setTrailingButton:](self->_buttonContainerView, "setTrailingButton:", v44);
    }
    else
    {
      v45 = (CSProminentButtonsView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1BC98]), "initWithLeadingButton:trailingButton:", v34, v44);
      buttonContainerView = self->_buttonContainerView;
      self->_buttonContainerView = v45;

      -[CSQuickActionsView addSubview:](self, "addSubview:", self->_buttonContainerView);
    }

  }
  v47 = self->_buttonActions;
  self->_buttonActions = v19;
  v48 = v19;

  buttons = self->_buttons;
  self->_buttons = v5;

LABEL_50:
}

id __39__CSQuickActionsView_setButtonActions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogCoverSheet();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_1D0337000, v4, OS_LOG_TYPE_DEFAULT, "[Quick Action] creating button for action %{public}@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_createButtonForAction:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setControlsActions:(id)a3
{
  NSArray **p_controlsActions;
  id v5;

  p_controlsActions = &self->_controlsActions;
  v5 = a3;
  if ((BSEqualArrays() & 1) == 0)
    objc_storeStrong((id *)p_controlsActions, a3);

}

- (void)setActionsVisible:(BOOL)a3
{
  _BOOL8 v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_buttons;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setVisible:", v3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)refreshSupportedButtons
{
  BOOL v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[CSQuickActionsView _hidesButtonsForWidgetControls](self, "_hidesButtonsForWidgetControls");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_buttons;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        if (v3)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "setHidden:", 1);
        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "action", (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "showsButtonDidChangeForAction:", v10);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v11 = !v3
     && -[CSDashBoardQuickActionsButtonSettings colorsBackground](self->_quickActionsSettings, "colorsBackground");
  -[CSQuickActionsView _setButtonBackgroundVisible:](self, "_setButtonBackgroundVisible:", v11, (_QWORD)v12);
}

- (BOOL)strictlyInterpretsLocationAsContent:(CGPoint)a3 inView:(id)a4
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[CSQuickActionsView _buttonDiameter](self, "_buttonDiameter", a4);
  -[CSDashBoardQuickActionsButtonSettings strictTouchExtraRadius](self->_quickActionsSettings, "strictTouchExtraRadius");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_buttons;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "center", (_QWORD)v10);
        if ((BSFloatLessThanOrEqualToFloat() & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)interpretsLocationAsContent:(CGPoint)a3 inView:(id)a4
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;
  CGPoint v20;
  CGRect v21;

  v19 = *MEMORY[0x1E0C80C00];
  -[CSQuickActionsView convertPoint:fromView:](self, "convertPoint:fromView:", a4, a3.x, a3.y);
  v6 = v5;
  v8 = v7;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = self->_buttons;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "frame", (_QWORD)v14);
        v20.x = v6;
        v20.y = v8;
        if (CGRectContainsPoint(v21, v20))
        {
          LOBYTE(v10) = 1;
          goto LABEL_11;
        }
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  return v10;
}

- (BOOL)interpretsLocationAsBesideContent:(CGPoint)a3 inView:(id)a4
{
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double MinX;
  double v24;
  double v25;
  CGFloat MinY;
  double MaxY;
  double v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  double Height;
  double MaxX;
  double Width;
  CGFloat v36;
  CGFloat rect;
  CGFloat rect_8;
  CGFloat rect_16;
  CGFloat rect_24;
  CGFloat v41;
  CGPoint v42;
  CGPoint v43;
  CGPoint v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  -[CSQuickActionsView convertPoint:fromView:](self, "convertPoint:fromView:", a4, a3.x, a3.y);
  rect_24 = v6;
  v41 = v5;
  -[CSQuickActionsView bounds](self, "bounds");
  Width = CGRectGetWidth(v45);
  -[CSQuickActionsView bounds](self, "bounds");
  Height = CGRectGetHeight(v46);
  -[CSQuickActionsView _leadingFrameWithOutsets:](self, "_leadingFrameWithOutsets:", 0);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CSQuickActionsView _trailingFrameWithOutsets:](self, "_trailingFrameWithOutsets:", 0);
  v16 = v15;
  v36 = v17;
  rect = v15;
  v19 = v18;
  v21 = v20;
  -[CSQuickActionsView _buttonDiameter](self, "_buttonDiameter");
  rect_16 = v22;
  v47.origin.x = v8;
  v47.origin.y = v10;
  v47.size.width = v12;
  v47.size.height = v14;
  MinX = CGRectGetMinX(v47);
  v48.origin.x = v16;
  v48.origin.y = v19;
  v48.size.width = v36;
  v48.size.height = v21;
  v24 = CGRectGetMinX(v48);
  if (MinX < v24)
    v24 = MinX;
  rect_8 = v24;
  v49.origin.x = v8;
  v49.origin.y = v10;
  v49.size.width = v12;
  v49.size.height = v14;
  MaxX = CGRectGetMaxX(v49);
  v50.origin.x = rect;
  v50.origin.y = v19;
  v50.size.width = v36;
  v50.size.height = v21;
  v25 = CGRectGetMaxX(v50);
  v51.origin.x = v8;
  v51.origin.y = v10;
  v51.size.width = v12;
  v51.size.height = v14;
  MinY = CGRectGetMinY(v51);
  v52.origin.x = v8;
  v52.origin.y = v10;
  v52.size.width = v12;
  v52.size.height = v14;
  MaxY = CGRectGetMaxY(v52);
  v53.origin.x = 0.0;
  v53.origin.y = MinY;
  v53.size.width = rect_8;
  v53.size.height = rect_16;
  v42.x = v41;
  v42.y = rect_24;
  if (CGRectContainsPoint(v53, v42))
    return 1;
  v28 = MaxX;
  if (MaxX < v25)
    v28 = v25;
  v29 = Width - v28;
  v30 = MinY;
  v31 = rect_16;
  v43.x = v41;
  v43.y = rect_24;
  if (CGRectContainsPoint(*(CGRect *)&v28, v43))
    return 1;
  v54.size.height = Height - MaxY;
  v54.origin.x = 0.0;
  v54.origin.y = MaxY;
  v54.size.width = Width;
  v44.x = v41;
  v44.y = rect_24;
  return CGRectContainsPoint(v54, v44);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSQuickActionsView;
  -[CSQuickActionsView layoutSubviews](&v3, sel_layoutSubviews);
  -[CSQuickActionsView _layoutWidgetContainerView](self, "_layoutWidgetContainerView");
}

- (BOOL)_showsControlButtons
{
  return CSFeatureEnabled(8);
}

- (double)_buttonDiameter
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  double v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t *v24;
  double v25;
  int v26;
  double v27;
  double v28;
  double v30;
  double v31;
  double v32;
  double v34;
  int v35;
  double v36;
  int v37;
  double v38;
  double v39;
  int v40;
  int v41;
  double v42;
  double v43;
  double v44;
  int v45;
  int v46;
  double v47;
  double v48;
  int v49;
  int v50;
  int v51;
  int v52;
  double v53;
  int v54;
  double v55;
  double v56;
  int v57;
  int v58;
  double v59;
  double v60;
  double v61;
  int v62;
  int v63;
  int v64;
  double v65;
  double v66;
  int v67;
  double v68;
  double v69;
  double v70;
  int v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  int v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  int v129;
  uint64_t v130;
  uint64_t v131;
  _BYTE v132[12];
  _BYTE v133[40];
  _BYTE v134[12];
  __int128 v135;
  int v136;
  int v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  int v144;

  v3 = __sb__runningInSpringBoard();
  v4 = (uint64_t)&CSQuickActionButtonDiameter;
  if (v3)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v5 = 0;
      v6 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v120, "userInterfaceIdiom") != 1)
    {
      v5 = 0;
      v6 = 1;
      goto LABEL_10;
    }
  }
  v6 = v3 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "_referenceBounds");
    }
    v5 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v28 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v27 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      v143 = v7 ^ 1;
      v144 = v6;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      v135 = 0uLL;
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v142 = 0;
      v129 = 0;
      v136 = 0;
      v126 = 0;
      v137 = 0;
      v138 = 0;
      v124 = 0;
      v125 = 0;
      v139 = 0;
      v123 = 0;
      v140 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v141 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048F9A8;
      goto LABEL_67;
    }
  }
  else
  {
    v5 = 0;
  }
LABEL_10:
  v8 = __sb__runningInSpringBoard();
  v143 = v5;
  v144 = v6;
  if (v8)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v9 = 0;
      v10 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v119, "userInterfaceIdiom") != 1)
    {
      v9 = 0;
      v10 = 1;
      goto LABEL_19;
    }
  }
  v10 = v8 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "_referenceBounds");
    }
    v9 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v30 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      v140 = v7 ^ 1;
      v141 = v10;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      v135 = 0uLL;
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v142 = 0;
      v129 = 0;
      v136 = 0;
      v126 = 0;
      v137 = 0;
      v138 = 0;
      v124 = 0;
      v125 = 0;
      v139 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048F9D0;
      goto LABEL_67;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_19:
  v11 = __sb__runningInSpringBoard();
  v140 = v9;
  v141 = v10;
  if (v11)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v12 = 0;
      v13 = 0;
      goto LABEL_28;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v118, "userInterfaceIdiom") != 1)
    {
      v12 = 0;
      v13 = 1;
      goto LABEL_28;
    }
  }
  v13 = v11 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "_referenceBounds");
    }
    v12 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v31 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      v138 = v7 ^ 1;
      v139 = v13;
      memset(v133, 0, sizeof(v133));
      memset(v132, 0, sizeof(v132));
      memset(v134, 0, sizeof(v134));
      v135 = 0uLL;
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v142 = 0;
      v129 = 0;
      v136 = 0;
      v126 = 0;
      v137 = 0;
      v125 = 0;
      v124 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048F9C0;
      goto LABEL_67;
    }
  }
  else
  {
    v12 = 0;
  }
LABEL_28:
  v14 = __sb__runningInSpringBoard();
  v138 = v12;
  v139 = v13;
  if (v14)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v15 = 0;
      v2 = 0;
      goto LABEL_37;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v117, "userInterfaceIdiom") != 1)
    {
      v15 = 0;
      v2 = 1;
      goto LABEL_37;
    }
  }
  v2 = v14 ^ 1u;
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v114, "_referenceBounds");
  }
  v15 = v7 ^ 1;
  BSSizeRoundForScale();
  if (v16 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    v136 = v7 ^ 1;
    v137 = v2;
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    v135 = 0uLL;
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v142 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048F9C8;
    goto LABEL_67;
  }
LABEL_37:
  v17 = __sb__runningInSpringBoard();
  v136 = v15;
  v137 = v2;
  if (v17)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v142 = 0;
      v4 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v116, "userInterfaceIdiom") != 1)
    {
      v142 = 0;
      v4 = 1;
      goto LABEL_47;
    }
  }
  v4 = v17 ^ 1u;
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v112, "_referenceBounds");
  }
  v142 = v7 ^ 1;
  BSSizeRoundForScale();
  if (v25 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    DWORD2(v135) = 0;
    HIDWORD(v135) = v4;
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    *(_QWORD *)&v135 = 0;
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048F9B8;
    goto LABEL_67;
  }
LABEL_47:
  v26 = __sb__runningInSpringBoard();
  HIDWORD(v135) = v4;
  if (v26)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)((char *)&v135 + 4) = 0;
      goto LABEL_178;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v115, "userInterfaceIdiom") != 1)
    {
      *(_QWORD *)((char *)&v135 + 4) = 0x100000000;
      goto LABEL_178;
    }
  }
  DWORD2(v135) = v26 ^ 1;
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "_referenceBounds");
  }
  DWORD1(v135) = v7 ^ 1;
  BSSizeRoundForScale();
  if (v34 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    LODWORD(v135) = 0;
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048F9B0;
    goto LABEL_67;
  }
LABEL_178:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_180;
LABEL_186:
    memset(v133, 0, sizeof(v133));
    memset(v132, 0, sizeof(v132));
    memset(v134, 0, sizeof(v134));
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048F9A0;
    LODWORD(v135) = v7 ^ 1;
    goto LABEL_67;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v113, "userInterfaceIdiom") == 1)
    goto LABEL_186;
LABEL_180:
  LODWORD(v135) = v7 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_184:
    *(_QWORD *)v134 = 0;
    goto LABEL_194;
  }
  v35 = __sb__runningInSpringBoard();
  if (v35)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_184;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v107, "userInterfaceIdiom"))
    {
      *(_QWORD *)v134 = 1;
      goto LABEL_194;
    }
  }
  *(_DWORD *)v134 = v35 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "_referenceBounds");
    }
    *(_DWORD *)&v134[4] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v38 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      memset(v133, 0, sizeof(v133));
      *(_DWORD *)&v134[8] = 0;
      memset(v132, 0, sizeof(v132));
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v129 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048F980;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v134[4] = 0;
  }
LABEL_194:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[36] = 0;
      *(_DWORD *)&v134[8] = 0;
      goto LABEL_204;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v108, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v133[36] = 0;
      *(_DWORD *)&v134[8] = 1;
      goto LABEL_204;
    }
  }
  *(_DWORD *)&v134[8] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "_referenceBounds");
    }
    *(_DWORD *)&v133[36] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v36 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_208;
  }
  else
  {
    *(_DWORD *)&v133[36] = 0;
  }
LABEL_204:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    memset(v133, 0, 36);
    memset(v132, 0, sizeof(v132));
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048F988;
    goto LABEL_67;
  }
LABEL_208:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_212:
    *(_QWORD *)&v133[28] = 0;
    goto LABEL_222;
  }
  v37 = __sb__runningInSpringBoard();
  if (v37)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_212;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v104, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v133[28] = 0;
      *(_DWORD *)&v133[32] = 1;
      goto LABEL_222;
    }
  }
  *(_DWORD *)&v133[32] = v37 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "_referenceBounds");
    }
    *(_DWORD *)&v133[28] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v43 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      memset(v133, 0, 28);
      memset(v132, 0, sizeof(v132));
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v129 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048F990;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[28] = 0;
  }
LABEL_222:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[24] = 0;
      *(_DWORD *)&v133[16] = 0;
      goto LABEL_232;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v106, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v133[16] = 0;
      *(_DWORD *)&v133[24] = 1;
      goto LABEL_232;
    }
  }
  *(_DWORD *)&v133[24] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v99, "_referenceBounds");
    }
    *(_DWORD *)&v133[16] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v39 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_236;
  }
  else
  {
    *(_DWORD *)&v133[16] = 0;
  }
LABEL_232:
  if ((_SBF_Private_IsD64Like() & 1) != 0)
  {
    *(_DWORD *)&v133[20] = 0;
    *(_OWORD *)v133 = 0uLL;
    memset(v132, 0, sizeof(v132));
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048F998;
    goto LABEL_67;
  }
LABEL_236:
  v40 = __sb__runningInSpringBoard();
  if (v40)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v133[20] = 0;
      *(_DWORD *)&v133[12] = 0;
      goto LABEL_246;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v105, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v133[12] = 0;
      *(_DWORD *)&v133[20] = 1;
      goto LABEL_246;
    }
  }
  *(_DWORD *)&v133[20] = v40 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v41 = __sb__runningInSpringBoard();
    if (v41)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v96, "_referenceBounds");
    }
    v7 = v41 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v133[12] = v7;
    if (v42 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      *(_QWORD *)v133 = 0;
      memset(v132, 0, sizeof(v132));
      *(_DWORD *)&v133[8] = 0;
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v129 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048F970;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[12] = 0;
  }
LABEL_246:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)v133 = 0;
      *(_DWORD *)v132 = 0;
      goto LABEL_256;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v102, "userInterfaceIdiom"))
    {
      *(_DWORD *)v132 = 0;
      *(_DWORD *)v133 = 1;
      goto LABEL_256;
    }
  }
  *(_DWORD *)v133 = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "_referenceBounds");
    }
    *(_DWORD *)v132 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v44 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_266;
  }
  else
  {
    *(_DWORD *)v132 = 0;
  }
LABEL_256:
  if ((_SBF_Private_IsD54() & 1) != 0)
  {
    *(_QWORD *)&v133[4] = 0;
    *(_QWORD *)&v132[4] = 0;
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048F978;
    goto LABEL_67;
  }
LABEL_266:
  v45 = __sb__runningInSpringBoard();
  if (v45)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v133[4] = 0;
      goto LABEL_276;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v101, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v133[4] = 0;
      *(_DWORD *)&v133[8] = 1;
      goto LABEL_276;
    }
  }
  *(_DWORD *)&v133[8] = v45 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v46 = __sb__runningInSpringBoard();
    if (v46)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "_referenceBounds");
    }
    v7 = v46 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v133[4] = v7;
    if (v47 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      *(_QWORD *)&v132[4] = 0;
      v130 = 0;
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v129 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048F940;
      goto LABEL_67;
    }
  }
  else
  {
    *(_DWORD *)&v133[4] = 0;
  }
LABEL_276:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v132[4] = 0;
      goto LABEL_286;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v98, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v132[4] = 0;
      *(_DWORD *)&v132[8] = 1;
      goto LABEL_286;
    }
  }
  *(_DWORD *)&v132[8] = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "_referenceBounds");
    }
    *(_DWORD *)&v132[4] = v7 ^ 1;
    BSSizeRoundForScale();
    if (v48 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_295;
  }
  else
  {
    *(_DWORD *)&v132[4] = 0;
  }
LABEL_286:
  if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
  {
    v130 = 0;
    v131 = 0;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048F948;
    goto LABEL_67;
  }
LABEL_295:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_299:
    v130 = 0;
    goto LABEL_306;
  }
  v49 = __sb__runningInSpringBoard();
  if (v49)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_299;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v93, "userInterfaceIdiom"))
    {
      v130 = 0x100000000;
      goto LABEL_306;
    }
  }
  HIDWORD(v130) = v49 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v50 = __sb__runningInSpringBoard();
    if (v50)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "_referenceBounds");
    }
    v7 = v50 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v130) = v7;
    if (v55 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      v131 = 0;
      v127 = 0;
      v128 = 0;
      v129 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048F930;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v130) = 0;
  }
LABEL_306:
  v51 = __sb__runningInSpringBoard();
  if (v51)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v131) = 0;
      v7 = 0;
      goto LABEL_316;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v97, "userInterfaceIdiom"))
    {
      v7 = 0;
      HIDWORD(v131) = 1;
      goto LABEL_316;
    }
  }
  HIDWORD(v131) = v51 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v52 = __sb__runningInSpringBoard();
    if (v52)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "_referenceBounds");
    }
    v7 = v52 ^ 1u;
    BSSizeRoundForScale();
    if (v53 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_320;
  }
  else
  {
    v7 = 0;
  }
LABEL_316:
  if ((_SBF_Private_IsD93Like() & 1) != 0)
  {
    LODWORD(v131) = v7;
    v127 = 0;
    v128 = 0;
    v129 = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048F938;
    goto LABEL_67;
  }
LABEL_320:
  LODWORD(v131) = v7;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_324:
    v128 = 0;
    goto LABEL_334;
  }
  v54 = __sb__runningInSpringBoard();
  if (v54)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_324;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v88, "userInterfaceIdiom"))
    {
      v128 = 0x100000000;
      goto LABEL_334;
    }
  }
  HIDWORD(v128) = v54 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "_referenceBounds");
    }
    LODWORD(v128) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v60 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v129 = 0;
      v127 = 0;
      v124 = 0;
      v125 = 0;
      v126 = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048F960;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v128) = 0;
  }
LABEL_334:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v129 = 0;
      HIDWORD(v127) = 0;
      goto LABEL_344;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v92, "userInterfaceIdiom"))
    {
      HIDWORD(v127) = 0;
      v129 = 1;
      goto LABEL_344;
    }
  }
  v129 = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "_referenceBounds");
    }
    HIDWORD(v127) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v56 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_348;
  }
  else
  {
    HIDWORD(v127) = 0;
  }
LABEL_344:
  if ((_SBF_Private_IsD63Like() & 1) != 0)
  {
    LODWORD(v127) = 0;
    v124 = 0;
    v125 = 0;
    v126 = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048F968;
    goto LABEL_67;
  }
LABEL_348:
  v57 = __sb__runningInSpringBoard();
  if (v57)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v127) = 0;
      HIDWORD(v124) = 0;
      goto LABEL_358;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v89, "userInterfaceIdiom"))
    {
      HIDWORD(v124) = 0;
      LODWORD(v127) = 1;
      goto LABEL_358;
    }
  }
  LODWORD(v127) = v57 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v58 = __sb__runningInSpringBoard();
    if (v58)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "_referenceBounds");
    }
    v7 = v58 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v124) = v7;
    if (v59 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      v125 = 0;
      v126 = 0;
      LODWORD(v124) = 0;
      v123 = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048F950;
      goto LABEL_67;
    }
  }
  else
  {
    HIDWORD(v124) = 0;
  }
LABEL_358:
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v126 = 0;
      goto LABEL_368;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v86, "userInterfaceIdiom"))
    {
      v126 = 0x100000000;
      goto LABEL_368;
    }
  }
  HIDWORD(v126) = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "_referenceBounds");
    }
    LODWORD(v126) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v61 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_378;
  }
  else
  {
    LODWORD(v126) = 0;
  }
LABEL_368:
  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
  {
    v125 = 0;
    LODWORD(v124) = 0;
    v123 = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048F958;
    goto LABEL_67;
  }
LABEL_378:
  v62 = __sb__runningInSpringBoard();
  if (v62)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v125) = 0;
      LODWORD(v124) = 0;
      goto LABEL_388;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v85, "userInterfaceIdiom"))
    {
      LODWORD(v124) = 0;
      HIDWORD(v125) = 1;
      goto LABEL_388;
    }
  }
  HIDWORD(v125) = v62 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v7 = __sb__runningInSpringBoard();
    if ((_DWORD)v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "_referenceBounds");
    }
    LODWORD(v124) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v65 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v123 = 0;
      LODWORD(v125) = 0;
      v122 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048F920;
      goto LABEL_67;
    }
  }
  else
  {
    LODWORD(v124) = 0;
  }
LABEL_388:
  v63 = __sb__runningInSpringBoard();
  if (v63)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v123) = 0;
      v7 = 0;
      goto LABEL_398;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v82, "userInterfaceIdiom"))
    {
      v7 = 0;
      HIDWORD(v123) = 1;
      goto LABEL_398;
    }
  }
  HIDWORD(v123) = v63 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v64 = __sb__runningInSpringBoard();
    if (v64)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "_referenceBounds");
    }
    v7 = v64 ^ 1u;
    BSSizeRoundForScale();
    if (v66 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_405;
  }
  else
  {
    v7 = 0;
  }
LABEL_398:
  if ((_SBF_Private_IsD53() & 1) != 0)
  {
    LODWORD(v125) = v7;
    LODWORD(v123) = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048F928;
    goto LABEL_67;
  }
LABEL_405:
  LODWORD(v125) = v7;
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    LODWORD(v123) = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048F900;
    goto LABEL_67;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
  {
    LODWORD(v123) = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048F908;
    goto LABEL_67;
  }
  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    LODWORD(v123) = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048F8F0;
    goto LABEL_67;
  }
  if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
  {
    LODWORD(v123) = 0;
    v122 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048F8F8;
    goto LABEL_67;
  }
  v7 = __sb__runningInSpringBoard();
  if ((_DWORD)v7)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v123) = 0;
      v122 = 0;
      goto LABEL_425;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v76, "userInterfaceIdiom"))
    {
      v122 = 0;
      LODWORD(v123) = 1;
      goto LABEL_425;
    }
  }
  LODWORD(v123) = v7 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v5 = __sb__runningInSpringBoard();
    if ((_DWORD)v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v74, "_referenceBounds");
    }
    v122 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v69 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048F910;
      goto LABEL_67;
    }
  }
  else
  {
    v122 = 0;
  }
LABEL_425:
  v67 = __sb__runningInSpringBoard();
  if (v67)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v18 = 0;
      v19 = 0;
      goto LABEL_435;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v75, "userInterfaceIdiom"))
    {
      v19 = 0;
      v18 = 1;
      goto LABEL_435;
    }
  }
  v18 = v67 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v5 = __sb__runningInSpringBoard();
    if ((_DWORD)v5)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "_referenceBounds");
    }
    v19 = v5 ^ 1;
    BSSizeRoundForScale();
    if (v70 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v20 = 0;
      v21 = 0;
      v22 = 0;
      v23 = 0;
      v24 = &qword_1D048F918;
      goto LABEL_67;
    }
  }
  else
  {
    v19 = 0;
  }
LABEL_435:
  v5 = __sb__runningInSpringBoard();
  if ((_DWORD)v5)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v20 = 0;
      v21 = 0;
      goto LABEL_445;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v7 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v7, "userInterfaceIdiom"))
    {
      v21 = 0;
      v20 = 1;
      goto LABEL_445;
    }
  }
  v20 = v5 ^ 1;
  v5 = __sb__runningInSpringBoard();
  if ((_DWORD)v5)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v2 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v2, "_referenceBounds");
  }
  v21 = v5 ^ 1;
  BSSizeRoundForScale();
  if (v68 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
  {
    v22 = 0;
    v23 = 0;
    v24 = &qword_1D048F8E8;
    goto LABEL_67;
  }
LABEL_445:
  v4 = __sb__runningInSpringBoard();
  if ((_DWORD)v4)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v22 = 0;
      v23 = 0;
LABEL_462:
      v24 = &CSQuickActionButtonDiameter;
      goto LABEL_67;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v5, "userInterfaceIdiom"))
    {
      v23 = 0;
      v22 = 1;
      goto LABEL_462;
    }
  }
  v22 = v4 ^ 1;
  v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v4, "_referenceBounds");
  }
  v23 = v71 ^ 1;
  BSSizeRoundForScale();
  if (v72 < *(double *)(MEMORY[0x1E0DAB260] + 40))
    goto LABEL_462;
  v24 = &qword_1D048F8E0;
LABEL_67:
  v32 = *(double *)v24;
  if (v23)

  if (v22)
  if (v21)

  if (v20)
  if (v19)

  if (v18)
  if (v122)

  if ((_DWORD)v123)
  if ((_DWORD)v125)

  if (HIDWORD(v123))
  if ((_DWORD)v124)

  if (HIDWORD(v125))
  if ((_DWORD)v126)

  if (HIDWORD(v126))
  if (HIDWORD(v124))

  if ((_DWORD)v127)
  if (HIDWORD(v127))

  if (v129)
  if ((_DWORD)v128)

  if (HIDWORD(v128))
  if ((_DWORD)v131)

  if (HIDWORD(v131))
  if ((_DWORD)v130)

  if (HIDWORD(v130))
  if (*(_DWORD *)&v132[4])

  if (*(_DWORD *)&v132[8])
  if (*(_DWORD *)&v133[4])

  if (*(_DWORD *)&v133[8])
  if (*(_DWORD *)v132)

  if (*(_DWORD *)v133)
  if (*(_DWORD *)&v133[12])

  if (*(_DWORD *)&v133[20])
  if (*(_DWORD *)&v133[16])

  if (*(_DWORD *)&v133[24])
  if (*(_DWORD *)&v133[28])

  if (*(_DWORD *)&v133[32])
  if (*(_DWORD *)&v133[36])

  if (*(_DWORD *)&v134[8])
  if (*(_DWORD *)&v134[4])

  if (*(_DWORD *)v134)
  if ((_DWORD)v135)

  if (DWORD1(v135))
  if (DWORD2(v135))

  if (v142)
  {

    if (!HIDWORD(v135))
      goto LABEL_155;
  }
  else if (!HIDWORD(v135))
  {
LABEL_155:
    if (v136)
      goto LABEL_156;
    goto LABEL_166;
  }

  if (v136)
  {
LABEL_156:

    if (!v137)
      goto LABEL_157;
    goto LABEL_167;
  }
LABEL_166:
  if (!v137)
  {
LABEL_157:
    if (v138)
      goto LABEL_158;
    goto LABEL_168;
  }
LABEL_167:

  if (v138)
  {
LABEL_158:

    if (!v139)
      goto LABEL_159;
    goto LABEL_169;
  }
LABEL_168:
  if (!v139)
  {
LABEL_159:
    if (v140)
      goto LABEL_160;
    goto LABEL_170;
  }
LABEL_169:

  if (v140)
  {
LABEL_160:

    if (!v141)
      goto LABEL_161;
    goto LABEL_171;
  }
LABEL_170:
  if (!v141)
  {
LABEL_161:
    if (v143)
      goto LABEL_162;
    goto LABEL_172;
  }
LABEL_171:

  if (v143)
  {
LABEL_162:

    if (!v144)
      return v32;
    goto LABEL_173;
  }
LABEL_172:
  if (v144)
LABEL_173:

  return v32;
}

- (void)_layoutWidgetContainerView
{
  CSProminentButtonsView *buttonContainerView;

  buttonContainerView = self->_buttonContainerView;
  -[CSQuickActionsView bounds](self, "bounds");
  -[CSProminentButtonsView setFrame:](buttonContainerView, "setFrame:");
}

- (BOOL)_hidesButtonsForWidgetControls
{
  NSUInteger v3;

  v3 = -[NSArray count](self->_controlsActions, "count");
  if (v3)
    LOBYTE(v3) = !-[CSQuickActionsView _showsControlButtons](self, "_showsControlButtons");
  return v3;
}

- (CGRect)_leadingFrameWithOutsets:(BOOL)a3
{
  _BOOL8 v3;
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
  double v17;
  double v18;
  double v19;
  CGRect result;

  v3 = a3;
  -[CSQuickActionsView _insetX](self, "_insetX");
  v6 = v5;
  -[CSQuickActionsView _buttonOutsets](self, "_buttonOutsets");
  v8 = v7;
  v10 = v9;
  -[CSQuickActionsView _minYWithOutsets:](self, "_minYWithOutsets:", v3);
  v12 = v11;
  v13 = 0.0;
  if (v3)
  {
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
      v13 = v10;
    else
      v13 = v8;
  }
  -[CSQuickActionsView _buttonSizeWithOutsets:](self, "_buttonSizeWithOutsets:", v3);
  v15 = v14;
  v17 = v16;
  v18 = v6 - v13;
  v19 = v12;
  result.size.height = v17;
  result.size.width = v15;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)_trailingFrameWithOutsets:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect result;

  v3 = a3;
  -[CSQuickActionsView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CSQuickActionsView _insetX](self, "_insetX");
  v14 = v13;
  -[CSQuickActionsView _buttonOutsets](self, "_buttonOutsets");
  v16 = v15;
  v18 = v17;
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") != 1)
    v18 = v16;
  -[CSQuickActionsView _minYWithOutsets:](self, "_minYWithOutsets:", v3);
  v20 = v19;
  v30.origin.x = v6;
  v30.origin.y = v8;
  v30.size.width = v10;
  v30.size.height = v12;
  v21 = CGRectGetWidth(v30) - v14;
  -[CSQuickActionsView _buttonDiameter](self, "_buttonDiameter");
  v23 = v21 - (v18 + v22);
  -[CSQuickActionsView _buttonSizeWithOutsets:](self, "_buttonSizeWithOutsets:", v3);
  v25 = v24;
  v27 = v26;
  v28 = v23;
  v29 = v20;
  result.size.height = v27;
  result.size.width = v25;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (double)_minYWithOutsets:(BOOL)a3
{
  _BOOL4 v3;
  double Height;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v12;

  v3 = a3;
  -[CSQuickActionsView bounds](self, "bounds");
  Height = CGRectGetHeight(v12);
  -[CSQuickActionsView _insetY](self, "_insetY");
  v7 = v6;
  -[CSQuickActionsView _buttonDiameter](self, "_buttonDiameter");
  v9 = v8;
  v10 = 0.0;
  if (v3)
    -[CSQuickActionsView _buttonOutsets](self, "_buttonOutsets", 0.0);
  return Height - v7 - (v9 + v10);
}

- (CGSize)_buttonSizeWithOutsets:(BOOL)a3
{
  _BOOL4 v3;
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
  CGSize result;

  v3 = a3;
  -[CSQuickActionsView _buttonDiameter](self, "_buttonDiameter");
  v6 = v5;
  -[CSQuickActionsView _buttonOutsets](self, "_buttonOutsets");
  v11 = v9 + v10;
  if (!v3)
    v11 = 0.0;
  v12 = v6 + v11;
  v13 = v7 + v8;
  if (!v3)
    v13 = 0.0;
  v14 = v6 + v13;
  v15 = v12;
  result.height = v14;
  result.width = v15;
  return result;
}

- (id)_buttonGroupName
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.button"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setLegibilitySettings:(id)a3
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(v5, "sb_isEqualToLegibilitySettings:", self->_legibilitySettings) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_buttons;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setLegibilitySettings:", v5, (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)_addTargetsToButton:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel_handleButtonTouchBegan_, 1);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel_handleButtonTouchEnded_, 256);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel_handleButtonTouchEnded_, 64);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel_handleButtonTouchEnded_, 128);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel_handleButtonPress_, 0x2000);

}

- (void)_removeTargetsFromButton:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, 0, 1);
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, 0, 256);
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, 0, 64);
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, 0, 128);
  objc_msgSend(v4, "removeTarget:action:forControlEvents:", self, 0, 0x2000);

}

- (void)handleButtonTouchBegan:(id)a3
{
  id v4;
  id WeakRetained;

  v4 = a3;
  kdebug_trace();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "touchBeganForButton:", v4);

}

- (void)handleButtonPress:(id)a3
{
  id v4;
  id WeakRetained;

  v4 = a3;
  kdebug_trace();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "fireActionForButton:", v4);

}

- (void)handleButtonTouchEnded:(id)a3
{
  id v4;
  id WeakRetained;

  v4 = a3;
  kdebug_trace();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "touchEndedForButton:", v4);

}

- (double)_insetX
{
  uint64_t v2;
  id WeakRetained;
  int v4;
  int v5;
  int v6;
  int v7;
  char v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  int v18;
  unsigned int v19;
  int v20;
  unsigned int v21;
  int v22;
  int v23;
  int v24;
  unsigned int v25;
  int v26;
  unsigned int v27;
  int v28;
  int v29;
  int v30;
  double v31;
  int v32;
  int v33;
  double v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  uint64_t *v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  uint64_t *v51;
  double v52;
  int v53;
  double v54;
  int v55;
  double v56;
  double v57;
  double v59;
  double v60;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v68;
  int v69;
  double v70;
  int v71;
  double v72;
  int v73;
  double v74;
  int v75;
  double v76;
  double v77;
  double v78;
  int v79;
  int v80;
  double v81;
  int v82;
  int v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  int v89;
  double v90;
  int v91;
  int v92;
  int v93;
  double v94;
  double v95;
  double v96;
  int v97;
  double v98;
  int v99;
  int v100;
  int v101;
  int v102;
  double v103;
  int v104;
  int v105;
  int v106;
  int v107;
  double v108;
  int v109;
  double v110;
  double v111;
  double v112;
  int v113;
  int v114;
  double v115;
  int v116;
  int v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  int v123;
  double v124;
  int v125;
  int v126;
  int v127;
  double v128;
  double v129;
  double v130;
  double v131;
  int v132;
  int v133;
  int v134;
  int v135;
  int v136;
  int v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  int v144;
  double v145;
  int v146;
  double v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  int v197;
  void *v198;
  int v199;
  void *v200;
  int v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  _BYTE v210[12];
  __int128 v211;
  _BYTE v212[52];
  _BYTE v213[52];
  uint64_t v214;
  int v215;
  id v216;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_msgSend(WeakRetained, "isPortrait");

  v5 = __sb__runningInSpringBoard();
  v6 = v5;
  if (v4)
  {
    if (v5)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v7 = 0;
        v8 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v216 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v216, "userInterfaceIdiom") != 1)
      {
        v7 = 0;
        v8 = 1;
        goto LABEL_18;
      }
    }
    v8 = v6 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v12 = __sb__runningInSpringBoard();
      if ((_DWORD)v12)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v200 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v200, "_referenceBounds");
      }
      v7 = v12 ^ 1;
      BSSizeRoundForScale();
      if (v57 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v56 == *(double *)(MEMORY[0x1E0DAB260] + 280))
      {
        v215 = v12 ^ 1;
        v211 = 0uLL;
        memset(v210, 0, sizeof(v210));
        v208 = 0;
        v206 = 0;
        v204 = 0;
        memset(v212, 0, sizeof(v212));
        v36 = 0;
        v202 = 0;
        v37 = 0;
        v38 = 0;
        v39 = 0;
        v40 = 0;
        v41 = 0;
        v42 = 0;
        v43 = 0;
        memset(v213, 0, sizeof(v213));
        v214 = 0;
        v44 = &qword_1D048FAA8;
        goto LABEL_131;
      }
    }
    else
    {
      v7 = 0;
    }
LABEL_18:
    v14 = __sb__runningInSpringBoard();
    v215 = v7;
    if (v14)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v15 = 0;
        v16 = 0;
        goto LABEL_36;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v198, "userInterfaceIdiom") != 1)
      {
        v15 = 0;
        v16 = 1;
        goto LABEL_36;
      }
    }
    v16 = v14 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v12 = __sb__runningInSpringBoard();
      if ((_DWORD)v12)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v189, "_referenceBounds");
      }
      v15 = v12 ^ 1;
      BSSizeRoundForScale();
      if (v62 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
      {
        *(_DWORD *)&v213[48] = v12 ^ 1;
        v214 = v16;
        v211 = 0uLL;
        memset(v210, 0, sizeof(v210));
        v208 = 0;
        v206 = 0;
        v204 = 0;
        memset(v212, 0, sizeof(v212));
        v36 = 0;
        v202 = 0;
        v37 = 0;
        v38 = 0;
        v39 = 0;
        v40 = 0;
        v41 = 0;
        v42 = 0;
        v43 = 0;
        memset(v213, 0, 48);
        v44 = &qword_1D048FAD0;
        goto LABEL_131;
      }
    }
    else
    {
      v15 = 0;
    }
LABEL_36:
    v20 = __sb__runningInSpringBoard();
    *(_DWORD *)&v213[48] = v15;
    LODWORD(v214) = v16;
    if (v20)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v21 = 0;
        v22 = 0;
        goto LABEL_54;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v196, "userInterfaceIdiom") != 1)
      {
        v21 = 0;
        v22 = 1;
        goto LABEL_54;
      }
    }
    v22 = v20 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v12 = __sb__runningInSpringBoard();
      if ((_DWORD)v12)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v188, "_referenceBounds");
      }
      v21 = v12 ^ 1;
      BSSizeRoundForScale();
      if (v64 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
      {
        *(_DWORD *)&v213[40] = v12 ^ 1;
        *(_DWORD *)&v213[44] = v22;
        v211 = 0uLL;
        memset(v210, 0, sizeof(v210));
        v208 = 0;
        v206 = 0;
        v204 = 0;
        memset(v212, 0, sizeof(v212));
        v36 = 0;
        v202 = 0;
        v37 = 0;
        v38 = 0;
        v39 = 0;
        v40 = 0;
        v41 = 0;
        v42 = 0;
        v43 = 0;
        memset(v213, 0, 40);
        HIDWORD(v214) = 0;
        v44 = &qword_1D048FAC0;
        goto LABEL_131;
      }
    }
    else
    {
      v21 = 0;
    }
LABEL_54:
    v26 = __sb__runningInSpringBoard();
    *(_QWORD *)&v213[40] = __PAIR64__(v22, v21);
    if (v26)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v27 = 0;
        v28 = 0;
        goto LABEL_71;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v195, "userInterfaceIdiom") != 1)
      {
        v27 = 0;
        v28 = 1;
        goto LABEL_71;
      }
    }
    v28 = v26 ^ 1;
    v12 = __sb__runningInSpringBoard();
    if ((_DWORD)v12)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v192, "_referenceBounds");
    }
    v27 = v12 ^ 1;
    BSSizeRoundForScale();
    if (v31 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
    {
      *(_DWORD *)&v213[32] = v12 ^ 1;
      *(_DWORD *)&v213[36] = v28;
      v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      v208 = 0;
      v206 = 0;
      v204 = 0;
      memset(v212, 0, sizeof(v212));
      v36 = 0;
      v202 = 0;
      v37 = 0;
      v38 = 0;
      v39 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      memset(v213, 0, 32);
      HIDWORD(v214) = 0;
      v44 = &qword_1D048FAC8;
      goto LABEL_131;
    }
LABEL_71:
    v32 = __sb__runningInSpringBoard();
    *(_QWORD *)&v213[32] = __PAIR64__(v28, v27);
    if (v32)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        HIDWORD(v214) = 0;
        v33 = 0;
        goto LABEL_91;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v194, "userInterfaceIdiom") != 1)
      {
        HIDWORD(v214) = 0;
        v33 = 1;
        goto LABEL_91;
      }
    }
    v33 = v32 ^ 1;
    v12 = __sb__runningInSpringBoard();
    if ((_DWORD)v12)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "_referenceBounds");
    }
    HIDWORD(v214) = v12 ^ 1;
    BSSizeRoundForScale();
    if (v52 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
    {
      *(_DWORD *)&v213[28] = v33;
      v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      v208 = 0;
      v206 = 0;
      v204 = 0;
      memset(v212, 0, sizeof(v212));
      v36 = 0;
      v202 = 0;
      v37 = 0;
      v38 = 0;
      v39 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      memset(v213, 0, 28);
      v44 = &qword_1D048FAB8;
      goto LABEL_131;
    }
LABEL_91:
    v53 = __sb__runningInSpringBoard();
    *(_DWORD *)&v213[28] = v33;
    if (v53)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(_QWORD *)&v213[20] = 0;
        goto LABEL_352;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v193, "userInterfaceIdiom") != 1)
      {
        *(_QWORD *)&v213[20] = 0x100000000;
        goto LABEL_352;
      }
    }
    *(_DWORD *)&v213[24] = v53 ^ 1;
    v12 = __sb__runningInSpringBoard();
    if ((_DWORD)v12)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v187, "_referenceBounds");
    }
    *(_DWORD *)&v213[20] = v12 ^ 1;
    BSSizeRoundForScale();
    if (v68 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
    {
      v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      v208 = 0;
      v206 = 0;
      v204 = 0;
      memset(v212, 0, sizeof(v212));
      v36 = 0;
      v202 = 0;
      v37 = 0;
      v38 = 0;
      v39 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      memset(v213, 0, 20);
      v44 = &qword_1D048FAB0;
      goto LABEL_131;
    }
LABEL_352:
    v12 = __sb__runningInSpringBoard();
    if ((_DWORD)v12)
    {
      if (SBFEffectiveDeviceClass() != 2)
        goto LABEL_354;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v191, "userInterfaceIdiom") != 1)
      {
LABEL_354:
        *(_DWORD *)&v213[16] = v12 ^ 1;
        if (!_SBF_Private_IsD94Like())
        {
LABEL_358:
          *(_QWORD *)&v213[4] = 0;
          goto LABEL_383;
        }
        v69 = __sb__runningInSpringBoard();
        if (v69)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            goto LABEL_358;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v185 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v185, "userInterfaceIdiom"))
          {
            *(_QWORD *)&v213[4] = 1;
            goto LABEL_383;
          }
        }
        *(_DWORD *)&v213[4] = v69 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v178 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v178, "_referenceBounds");
          }
          *(_DWORD *)&v213[8] = v12 ^ 1;
          BSSizeRoundForScale();
          if (v76 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
          {
            v211 = 0uLL;
            memset(v210, 0, sizeof(v210));
            v208 = 0;
            v206 = 0;
            v204 = 0;
            memset(v212, 0, sizeof(v212));
            v36 = 0;
            v202 = 0;
            v37 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            v41 = 0;
            v42 = 0;
            v43 = 0;
            *(_DWORD *)v213 = 0;
            *(_DWORD *)&v213[12] = 0;
            v44 = &qword_1D048FA80;
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v213[8] = 0;
        }
LABEL_383:
        v12 = __sb__runningInSpringBoard();
        if ((_DWORD)v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)v213 = 0;
            *(_DWORD *)&v213[12] = 0;
            goto LABEL_393;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v186 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v186, "userInterfaceIdiom"))
          {
            *(_DWORD *)v213 = 0;
            *(_DWORD *)&v213[12] = 1;
            goto LABEL_393;
          }
        }
        *(_DWORD *)&v213[12] = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v181 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v181, "_referenceBounds");
          }
          *(_DWORD *)v213 = v12 ^ 1;
          BSSizeRoundForScale();
          if (v72 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
            goto LABEL_397;
        }
        else
        {
          *(_DWORD *)v213 = 0;
        }
LABEL_393:
        if ((_SBF_Private_IsD94Like() & 1) != 0)
        {
          v211 = 0uLL;
          memset(v210, 0, sizeof(v210));
          v208 = 0;
          v206 = 0;
          v204 = 0;
          memset(v212, 0, sizeof(v212));
          v36 = 0;
          v202 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v44 = &qword_1D048FA88;
          goto LABEL_131;
        }
LABEL_397:
        if (!_SBF_Private_IsD64Like())
        {
LABEL_401:
          *(_QWORD *)&v212[44] = 0;
          goto LABEL_439;
        }
        v73 = __sb__runningInSpringBoard();
        if (v73)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            goto LABEL_401;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v182 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v182, "userInterfaceIdiom"))
          {
            *(_QWORD *)&v212[44] = 0x100000000;
            goto LABEL_439;
          }
        }
        *(_DWORD *)&v212[48] = v73 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v173, "_referenceBounds");
          }
          *(_DWORD *)&v212[44] = v12 ^ 1;
          BSSizeRoundForScale();
          if (v86 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
          {
            v211 = 0uLL;
            memset(v210, 0, sizeof(v210));
            v208 = 0;
            v206 = 0;
            v204 = 0;
            memset(v212, 0, 44);
            v36 = 0;
            v202 = 0;
            v37 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            v41 = 0;
            v42 = 0;
            v43 = 0;
            v44 = &qword_1D048FA90;
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v212[44] = 0;
        }
LABEL_439:
        v12 = __sb__runningInSpringBoard();
        if ((_DWORD)v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v212[32] = 0;
            *(_DWORD *)&v212[40] = 0;
            goto LABEL_449;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v184 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v184, "userInterfaceIdiom"))
          {
            *(_DWORD *)&v212[32] = 0;
            *(_DWORD *)&v212[40] = 1;
            goto LABEL_449;
          }
        }
        *(_DWORD *)&v212[40] = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v177, "_referenceBounds");
          }
          *(_DWORD *)&v212[32] = v12 ^ 1;
          BSSizeRoundForScale();
          if (v78 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
            goto LABEL_453;
        }
        else
        {
          *(_DWORD *)&v212[32] = 0;
        }
LABEL_449:
        if ((_SBF_Private_IsD64Like() & 1) != 0)
        {
          v211 = 0uLL;
          memset(v210, 0, sizeof(v210));
          v208 = 0;
          v206 = 0;
          v204 = 0;
          memset(v212, 0, 32);
          v36 = 0;
          v202 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v43 = 0;
          *(_DWORD *)&v212[36] = 0;
          v44 = &qword_1D048FA98;
          goto LABEL_131;
        }
LABEL_453:
        v79 = __sb__runningInSpringBoard();
        if (v79)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v212[28] = 0;
            *(_DWORD *)&v212[36] = 0;
            goto LABEL_463;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v183 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v183, "userInterfaceIdiom"))
          {
            *(_DWORD *)&v212[28] = 0;
            *(_DWORD *)&v212[36] = 1;
            goto LABEL_463;
          }
        }
        *(_DWORD *)&v212[36] = v79 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v80 = __sb__runningInSpringBoard();
          if (v80)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v174 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v174, "_referenceBounds");
          }
          v12 = v80 ^ 1u;
          BSSizeRoundForScale();
          *(_DWORD *)&v212[28] = v12;
          if (v84 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
          {
            v211 = 0uLL;
            memset(v210, 0, sizeof(v210));
            v208 = 0;
            v206 = 0;
            v204 = 0;
            memset(v212, 0, 28);
            v36 = 0;
            v202 = 0;
            v37 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            v41 = 0;
            v42 = 0;
            v43 = 0;
            v44 = &qword_1D048FA70;
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v212[28] = 0;
        }
LABEL_463:
        v12 = __sb__runningInSpringBoard();
        if ((_DWORD)v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v212[4] = 0;
            *(_DWORD *)&v212[16] = 0;
            goto LABEL_507;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v180, "userInterfaceIdiom"))
          {
            *(_DWORD *)&v212[4] = 0;
            *(_DWORD *)&v212[16] = 1;
            goto LABEL_507;
          }
        }
        *(_DWORD *)&v212[16] = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v172 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v172, "_referenceBounds");
          }
          *(_DWORD *)&v212[4] = v12 ^ 1;
          BSSizeRoundForScale();
          if (v88 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
            goto LABEL_529;
        }
        else
        {
          *(_DWORD *)&v212[4] = 0;
        }
LABEL_507:
        if ((_SBF_Private_IsD54() & 1) != 0)
        {
          v211 = 0uLL;
          memset(v210, 0, sizeof(v210));
          v208 = 0;
          v206 = 0;
          v204 = 0;
          *(_DWORD *)v212 = 0;
          v36 = 0;
          v202 = 0;
          v37 = 0;
          v38 = 0;
          *(_QWORD *)&v212[8] = 0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          *(_QWORD *)&v212[20] = 0;
          v43 = 0;
          v44 = &qword_1D048FA78;
          goto LABEL_131;
        }
LABEL_529:
        v89 = __sb__runningInSpringBoard();
        if (v89)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_QWORD *)&v212[20] = 0;
            goto LABEL_547;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v179, "userInterfaceIdiom"))
          {
            *(_QWORD *)&v212[20] = 0x100000000;
            goto LABEL_547;
          }
        }
        *(_DWORD *)&v212[24] = v89 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v92 = __sb__runningInSpringBoard();
          if (v92)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v169 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v169, "_referenceBounds");
          }
          v12 = v92 ^ 1u;
          BSSizeRoundForScale();
          *(_DWORD *)&v212[20] = v12;
          if (v94 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
          {
            v211 = 0uLL;
            memset(v210, 0, sizeof(v210));
            v208 = 0;
            v206 = 0;
            v204 = 0;
            *(_DWORD *)v212 = 0;
            v36 = 0;
            v202 = 0;
            v37 = 0;
            v38 = 0;
            *(_QWORD *)&v212[8] = 0;
            v39 = 0;
            v40 = 0;
            v41 = 0;
            v42 = 0;
            v43 = 0;
            v44 = &qword_1D048FA40;
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v212[20] = 0;
        }
LABEL_547:
        v12 = __sb__runningInSpringBoard();
        if ((_DWORD)v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_QWORD *)&v212[8] = 0;
            goto LABEL_567;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v176 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v176, "userInterfaceIdiom"))
          {
            *(_QWORD *)&v212[8] = 0x100000000;
            goto LABEL_567;
          }
        }
        *(_DWORD *)&v212[12] = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v168 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v168, "_referenceBounds");
          }
          *(_DWORD *)&v212[8] = v12 ^ 1;
          BSSizeRoundForScale();
          if (v96 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
            goto LABEL_587;
        }
        else
        {
          *(_DWORD *)&v212[8] = 0;
        }
LABEL_567:
        if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
        {
          v211 = 0uLL;
          memset(v210, 0, sizeof(v210));
          v208 = 0;
          v206 = 0;
          v204 = 0;
          *(_DWORD *)v212 = 0;
          v36 = 0;
          v202 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v44 = &qword_1D048FA48;
          goto LABEL_131;
        }
LABEL_587:
        if (!_SBF_Private_IsD93Like())
        {
LABEL_591:
          *(_QWORD *)((char *)&v211 + 4) = 0;
          goto LABEL_607;
        }
        v97 = __sb__runningInSpringBoard();
        if (v97)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            goto LABEL_591;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v171, "userInterfaceIdiom"))
          {
            *(_QWORD *)((char *)&v211 + 4) = 0x100000000;
            goto LABEL_607;
          }
        }
        DWORD2(v211) = v97 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v100 = __sb__runningInSpringBoard();
          if (v100)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v162, "_referenceBounds");
          }
          v12 = v100 ^ 1u;
          BSSizeRoundForScale();
          DWORD1(v211) = v12;
          if (v110 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
          {
            LODWORD(v211) = 0;
            memset(v210, 0, sizeof(v210));
            v208 = 0;
            HIDWORD(v211) = 0;
            v206 = 0;
            v204 = 0;
            *(_DWORD *)v212 = 0;
            v202 = 0;
            v36 = 0;
            v37 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            v41 = 0;
            v42 = 0;
            v43 = 0;
            v44 = &qword_1D048FA30;
            goto LABEL_131;
          }
        }
        else
        {
          DWORD1(v211) = 0;
        }
LABEL_607:
        v101 = __sb__runningInSpringBoard();
        if (v101)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v12 = 0;
            *(_DWORD *)v212 = 0;
            goto LABEL_617;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v175, "userInterfaceIdiom"))
          {
            v12 = 0;
            *(_DWORD *)v212 = 1;
            goto LABEL_617;
          }
        }
        *(_DWORD *)v212 = v101 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v102 = __sb__runningInSpringBoard();
          if (v102)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v165, "_referenceBounds");
          }
          v12 = v102 ^ 1u;
          BSSizeRoundForScale();
          if (v103 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
            goto LABEL_621;
        }
        else
        {
          v12 = 0;
        }
LABEL_617:
        if ((_SBF_Private_IsD93Like() & 1) != 0)
        {
          HIDWORD(v211) = v12;
          LODWORD(v211) = 0;
          memset(v210, 0, sizeof(v210));
          v208 = 0;
          v206 = 0;
          v204 = 0;
          v202 = 0;
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v44 = &qword_1D048FA38;
          goto LABEL_131;
        }
LABEL_621:
        HIDWORD(v211) = v12;
        if (!_SBF_Private_IsD63Like())
        {
LABEL_625:
          *(_QWORD *)&v210[4] = 0;
          goto LABEL_663;
        }
        v104 = __sb__runningInSpringBoard();
        if (v104)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            goto LABEL_625;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v166, "userInterfaceIdiom"))
          {
            *(_DWORD *)&v210[4] = 0;
            *(_DWORD *)&v210[8] = 1;
            goto LABEL_663;
          }
        }
        *(_DWORD *)&v210[8] = v104 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v158, "_referenceBounds");
          }
          *(_DWORD *)&v210[4] = v12 ^ 1;
          BSSizeRoundForScale();
          if (v120 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
          {
            LODWORD(v211) = 0;
            *(_DWORD *)v210 = 0;
            v206 = 0;
            v208 = 0;
            v202 = 0;
            v204 = 0;
            v36 = 0;
            v37 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            v41 = 0;
            v42 = 0;
            v43 = 0;
            v44 = &qword_1D048FA60;
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v210[4] = 0;
        }
LABEL_663:
        v12 = __sb__runningInSpringBoard();
        if ((_DWORD)v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v211) = 0;
            *(_DWORD *)v210 = 0;
            goto LABEL_673;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v170 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v170, "userInterfaceIdiom"))
          {
            *(_DWORD *)v210 = 0;
            LODWORD(v211) = 1;
            goto LABEL_673;
          }
        }
        LODWORD(v211) = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v161 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v161, "_referenceBounds");
          }
          *(_DWORD *)v210 = v12 ^ 1;
          BSSizeRoundForScale();
          if (v112 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
            goto LABEL_677;
        }
        else
        {
          *(_DWORD *)v210 = 0;
        }
LABEL_673:
        if ((_SBF_Private_IsD63Like() & 1) != 0)
        {
          v206 = 0;
          v208 = 0;
          v202 = 0;
          v204 = 0;
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v44 = &qword_1D048FA68;
          goto LABEL_131;
        }
LABEL_677:
        v113 = __sb__runningInSpringBoard();
        if (v113)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v208) = 0;
            HIDWORD(v204) = 0;
            goto LABEL_687;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v167, "userInterfaceIdiom"))
          {
            HIDWORD(v204) = 0;
            HIDWORD(v208) = 1;
            goto LABEL_687;
          }
        }
        HIDWORD(v208) = v113 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v114 = __sb__runningInSpringBoard();
          if (v114)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v159, "_referenceBounds");
          }
          v12 = v114 ^ 1u;
          BSSizeRoundForScale();
          HIDWORD(v204) = v12;
          if (v118 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
          {
            LODWORD(v208) = 0;
            v206 = 0;
            LODWORD(v204) = 0;
            v202 = 0;
            v36 = 0;
            v37 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            v41 = 0;
            v42 = 0;
            v43 = 0;
            v44 = &qword_1D048FA50;
            goto LABEL_131;
          }
        }
        else
        {
          HIDWORD(v204) = 0;
        }
LABEL_687:
        v12 = __sb__runningInSpringBoard();
        if ((_DWORD)v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v208) = 0;
            HIDWORD(v206) = 0;
            goto LABEL_731;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v164, "userInterfaceIdiom"))
          {
            HIDWORD(v206) = 0;
            LODWORD(v208) = 1;
            goto LABEL_731;
          }
        }
        LODWORD(v208) = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v157, "_referenceBounds");
          }
          HIDWORD(v206) = v12 ^ 1;
          BSSizeRoundForScale();
          if (v122 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
            goto LABEL_753;
        }
        else
        {
          HIDWORD(v206) = 0;
        }
LABEL_731:
        if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
        {
          LODWORD(v206) = 0;
          LODWORD(v204) = 0;
          v202 = 0;
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v44 = &qword_1D048FA58;
          goto LABEL_131;
        }
LABEL_753:
        v123 = __sb__runningInSpringBoard();
        if (v123)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v206) = 0;
            LODWORD(v204) = 0;
            goto LABEL_771;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v163, "userInterfaceIdiom"))
          {
            LODWORD(v204) = 0;
            LODWORD(v206) = 1;
            goto LABEL_771;
          }
        }
        LODWORD(v206) = v123 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v156, "_referenceBounds");
          }
          LODWORD(v204) = v12 ^ 1;
          BSSizeRoundForScale();
          if (v128 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
          {
            v202 = 0;
            v36 = 0;
            v37 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            v41 = 0;
            v42 = 0;
            v43 = 0;
            v44 = &qword_1D048FA20;
            goto LABEL_131;
          }
        }
        else
        {
          LODWORD(v204) = 0;
        }
LABEL_771:
        v12 = __sb__runningInSpringBoard();
        if ((_DWORD)v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v202) = 0;
            v36 = 0;
            goto LABEL_791;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v160, "userInterfaceIdiom"))
          {
            v36 = 0;
            HIDWORD(v202) = 1;
            goto LABEL_791;
          }
        }
        HIDWORD(v202) = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v155, "_referenceBounds");
          }
          v36 = v12 ^ 1;
          BSSizeRoundForScale();
          if (v130 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
            goto LABEL_807;
        }
        else
        {
          v36 = 0;
        }
LABEL_791:
        if ((_SBF_Private_IsD53() & 1) != 0)
        {
          LODWORD(v202) = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v44 = &qword_1D048FA28;
          goto LABEL_131;
        }
LABEL_807:
        if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
        {
          LODWORD(v202) = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v44 = &qword_1D048FA00;
          goto LABEL_131;
        }
        if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
        {
          LODWORD(v202) = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v44 = &qword_1D048FA08;
          goto LABEL_131;
        }
        if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
        {
          LODWORD(v202) = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v44 = &qword_1D048F9F0;
          goto LABEL_131;
        }
        if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
        {
          LODWORD(v202) = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v44 = &qword_1D048F9F8;
          goto LABEL_131;
        }
        v132 = __sb__runningInSpringBoard();
        if (v132)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v202) = 0;
            v37 = 0;
            goto LABEL_845;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v154, "userInterfaceIdiom"))
          {
            v37 = 0;
            LODWORD(v202) = 1;
            goto LABEL_845;
          }
        }
        LODWORD(v202) = v132 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v149, "_referenceBounds");
          }
          v37 = v12 ^ 1;
          BSSizeRoundForScale();
          if (v140 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
          {
            v38 = 0;
            v39 = 0;
            v40 = 0;
            v41 = 0;
            v42 = 0;
            v43 = 0;
            v44 = &qword_1D048FA10;
            goto LABEL_131;
          }
        }
        else
        {
          v37 = 0;
        }
LABEL_845:
        v134 = __sb__runningInSpringBoard();
        if (v134)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v38 = 0;
            v39 = 0;
            goto LABEL_865;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v153, "userInterfaceIdiom"))
          {
            v39 = 0;
            v38 = 1;
            goto LABEL_865;
          }
        }
        v38 = v134 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v148, "_referenceBounds");
          }
          v39 = v12 ^ 1;
          BSSizeRoundForScale();
          if (v142 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
          {
            v40 = 0;
            v41 = 0;
            v42 = 0;
            v43 = 0;
            v44 = &qword_1D048FA18;
            goto LABEL_131;
          }
        }
        else
        {
          v39 = 0;
        }
LABEL_865:
        v136 = __sb__runningInSpringBoard();
        if (v136)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v40 = 0;
            v41 = 0;
            goto LABEL_885;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v152, "userInterfaceIdiom"))
          {
            v41 = 0;
            v40 = 1;
            goto LABEL_885;
          }
        }
        v40 = v136 ^ 1;
        v12 = __sb__runningInSpringBoard();
        if ((_DWORD)v12)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v150, "_referenceBounds");
        }
        v41 = v12 ^ 1;
        BSSizeRoundForScale();
        if (v138 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
        {
          v42 = 0;
          v43 = 0;
          v44 = &qword_1D048F9E8;
          goto LABEL_131;
        }
LABEL_885:
        v12 = __sb__runningInSpringBoard();
        if ((_DWORD)v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v42 = 0;
            v43 = 0;
            goto LABEL_919;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v151, "userInterfaceIdiom"))
          {
            v43 = 0;
            v42 = 1;
            goto LABEL_919;
          }
        }
        v42 = v12 ^ 1;
        v144 = __sb__runningInSpringBoard();
        if (v144)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v12, "_referenceBounds");
        }
        v43 = v144 ^ 1;
        BSSizeRoundForScale();
        if (v145 >= *(double *)(MEMORY[0x1E0DAB260] + 40))
        {
          v44 = &qword_1D048F9E0;
LABEL_131:
          v65 = *(double *)v44;
          if (v43)

          if (v42)
          if (v41)

          if (v40)
          if (v39)

          if (v38)
          if (v37)

          if ((_DWORD)v202)
          if (v36)

          if (HIDWORD(v202))
          if ((_DWORD)v204)

          if ((_DWORD)v206)
          if (HIDWORD(v206))

          if ((_DWORD)v208)
          if (HIDWORD(v204))

          if (HIDWORD(v208))
          if (*(_DWORD *)v210)

          if ((_DWORD)v211)
          if (*(_DWORD *)&v210[4])

          if (*(_DWORD *)&v210[8])
          if (HIDWORD(v211))

          if (*(_DWORD *)v212)
          if (DWORD1(v211))

          if (DWORD2(v211))
          if (*(_DWORD *)&v212[8])

          if (*(_DWORD *)&v212[12])
          if (*(_DWORD *)&v212[20])

          if (*(_DWORD *)&v212[24])
          if (*(_DWORD *)&v212[4])

          if (*(_DWORD *)&v212[16])
          if (*(_DWORD *)&v212[28])

          if (*(_DWORD *)&v212[36])
          if (*(_DWORD *)&v212[32])

          if (*(_DWORD *)&v212[40])
          if (*(_DWORD *)&v212[44])

          if (*(_DWORD *)&v212[48])
          if (*(_DWORD *)v213)

          if (*(_DWORD *)&v213[12])
          if (*(_DWORD *)&v213[8])

          if (*(_DWORD *)&v213[4])
          if (*(_DWORD *)&v213[16])

          if (*(_DWORD *)&v213[20])
          if (*(_DWORD *)&v213[24])

          if (HIDWORD(v214))
          {

            if (!*(_DWORD *)&v213[28])
              goto LABEL_219;
          }
          else if (!*(_DWORD *)&v213[28])
          {
LABEL_219:
            if (*(_DWORD *)&v213[32])
              goto LABEL_220;
            goto LABEL_231;
          }

          if (*(_DWORD *)&v213[32])
          {
LABEL_220:

            if (!*(_DWORD *)&v213[36])
              goto LABEL_221;
            goto LABEL_232;
          }
LABEL_231:
          if (!*(_DWORD *)&v213[36])
          {
LABEL_221:
            if (*(_DWORD *)&v213[40])
              goto LABEL_222;
            goto LABEL_233;
          }
LABEL_232:

          if (*(_DWORD *)&v213[40])
          {
LABEL_222:

            if (!*(_DWORD *)&v213[44])
              goto LABEL_223;
            goto LABEL_234;
          }
LABEL_233:
          if (!*(_DWORD *)&v213[44])
          {
LABEL_223:
            if (*(_DWORD *)&v213[48])
              goto LABEL_224;
            goto LABEL_235;
          }
LABEL_234:

          if (*(_DWORD *)&v213[48])
          {
LABEL_224:

            if (!(_DWORD)v214)
              goto LABEL_225;
            goto LABEL_236;
          }
LABEL_235:
          if (!(_DWORD)v214)
          {
LABEL_225:
            if (!v215)
              goto LABEL_227;
            goto LABEL_226;
          }
LABEL_236:

          if (!v215)
          {
LABEL_227:
            if ((v8 & 1) == 0)
              return v65;
            goto LABEL_347;
          }
LABEL_226:

          goto LABEL_227;
        }
LABEL_919:
        v44 = &CSQuickActionButtonInsetX;
        goto LABEL_131;
      }
    }
    v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    v208 = 0;
    v206 = 0;
    v204 = 0;
    memset(v212, 0, sizeof(v212));
    v36 = 0;
    v202 = 0;
    v37 = 0;
    v38 = 0;
    v39 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    *(_OWORD *)v213 = 0uLL;
    v44 = &qword_1D048FAA0;
    *(_DWORD *)&v213[16] = v12 ^ 1;
    goto LABEL_131;
  }
  v9 = (uint64_t)&CSQuickActionButtonInsetY;
  if (v5)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v10 = 0;
      v11 = 0;
      goto LABEL_27;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v216 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v216, "userInterfaceIdiom") != 1)
    {
      v11 = 0;
      v10 = 1;
      goto LABEL_27;
    }
  }
  v10 = v6 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v187, "_referenceBounds");
    }
    v11 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v60 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v59 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      HIDWORD(v214) = v13 ^ 1;
      v215 = v10;
      LODWORD(v214) = 0;
      memset(v213, 0, sizeof(v213));
      memset(v212, 0, sizeof(v212));
      v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      v207 = 0;
      v209 = 0;
      v203 = 0;
      v205 = 0;
      v201 = 0;
      v199 = 0;
      v197 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FBA8;
      goto LABEL_241;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_27:
  v17 = __sb__runningInSpringBoard();
  HIDWORD(v214) = v11;
  v215 = v10;
  if (v17)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v18 = 0;
      v19 = 0;
      goto LABEL_45;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v195, "userInterfaceIdiom") != 1)
    {
      v19 = 0;
      v18 = 1;
      goto LABEL_45;
    }
  }
  v18 = v17 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "_referenceBounds");
    }
    v19 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v63 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      *(_DWORD *)&v213[44] = v13 ^ 1;
      *(_DWORD *)&v213[48] = v18;
      LODWORD(v214) = 0;
      memset(v213, 0, 44);
      memset(v212, 0, sizeof(v212));
      v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      v207 = 0;
      v209 = 0;
      v203 = 0;
      v205 = 0;
      v201 = 0;
      v199 = 0;
      v197 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FBD0;
      goto LABEL_241;
    }
  }
  else
  {
    v19 = 0;
  }
LABEL_45:
  v23 = __sb__runningInSpringBoard();
  *(_QWORD *)&v213[44] = __PAIR64__(v18, v19);
  if (v23)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v24 = 0;
      v25 = 0;
      goto LABEL_62;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v194, "userInterfaceIdiom") != 1)
    {
      v25 = 0;
      v24 = 1;
      goto LABEL_62;
    }
  }
  v24 = v23 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "_referenceBounds");
    }
    v25 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v66 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      *(_DWORD *)&v213[36] = v13 ^ 1;
      *(_DWORD *)&v213[40] = v24;
      LODWORD(v214) = 0;
      memset(v213, 0, 36);
      memset(v212, 0, sizeof(v212));
      v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      v207 = 0;
      v209 = 0;
      v203 = 0;
      v205 = 0;
      v201 = 0;
      v199 = 0;
      v197 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FBC0;
      goto LABEL_241;
    }
  }
  else
  {
    v25 = 0;
  }
LABEL_62:
  v29 = __sb__runningInSpringBoard();
  *(_QWORD *)&v213[36] = __PAIR64__(v24, v25);
  if (v29)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v30 = 0;
      v2 = 0;
      goto LABEL_80;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v193, "userInterfaceIdiom") != 1)
    {
      v2 = 0;
      v30 = 1;
      goto LABEL_80;
    }
  }
  v30 = v29 ^ 1;
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "_referenceBounds");
  }
  v2 = v13 ^ 1;
  BSSizeRoundForScale();
  if (v34 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    *(_QWORD *)&v213[28] = __PAIR64__(v30, v2);
    LODWORD(v214) = 0;
    memset(v213, 0, 28);
    memset(v212, 0, sizeof(v212));
    v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    v207 = 0;
    v209 = 0;
    v203 = 0;
    v205 = 0;
    v201 = 0;
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FBC8;
    goto LABEL_241;
  }
LABEL_80:
  v35 = __sb__runningInSpringBoard();
  *(_QWORD *)&v213[28] = __PAIR64__(v30, v2);
  if (v35)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v9 = 0;
      LODWORD(v214) = 0;
      goto LABEL_100;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v192, "userInterfaceIdiom") != 1)
    {
      LODWORD(v214) = 0;
      v9 = 1;
      goto LABEL_100;
    }
  }
  v9 = v35 ^ 1u;
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "_referenceBounds");
  }
  LODWORD(v214) = v13 ^ 1;
  BSSizeRoundForScale();
  if (v54 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    *(_DWORD *)&v213[24] = v9;
    memset(v213, 0, 24);
    memset(v212, 0, sizeof(v212));
    v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    v207 = 0;
    v209 = 0;
    v203 = 0;
    v205 = 0;
    v201 = 0;
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FBB8;
    goto LABEL_241;
  }
LABEL_100:
  v55 = __sb__runningInSpringBoard();
  *(_DWORD *)&v213[24] = v9;
  if (v55)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)&v213[16] = 0;
      goto LABEL_364;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v191, "userInterfaceIdiom") != 1)
    {
      *(_DWORD *)&v213[16] = 0;
      *(_DWORD *)&v213[20] = 1;
      goto LABEL_364;
    }
  }
  *(_DWORD *)&v213[20] = v55 ^ 1;
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "_referenceBounds");
  }
  *(_DWORD *)&v213[16] = v13 ^ 1;
  BSSizeRoundForScale();
  if (v70 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    *(_QWORD *)v213 = 0;
    *(_QWORD *)&v213[8] = 0;
    memset(v212, 0, sizeof(v212));
    v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    v207 = 0;
    v209 = 0;
    v203 = 0;
    v205 = 0;
    v201 = 0;
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FBB0;
    goto LABEL_241;
  }
LABEL_364:
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_366;
LABEL_372:
    *(_QWORD *)v213 = 0;
    *(_DWORD *)&v213[8] = 0;
    memset(v212, 0, sizeof(v212));
    v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    v207 = 0;
    v209 = 0;
    v203 = 0;
    v205 = 0;
    v201 = 0;
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FBA0;
    *(_DWORD *)&v213[12] = v13 ^ 1;
    goto LABEL_241;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v189, "userInterfaceIdiom") == 1)
    goto LABEL_372;
LABEL_366:
  *(_DWORD *)&v213[12] = v13 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_370:
    *(_QWORD *)v213 = 0;
    goto LABEL_408;
  }
  v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_370;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v182, "userInterfaceIdiom"))
    {
      *(_QWORD *)v213 = 1;
      goto LABEL_408;
    }
  }
  *(_DWORD *)v213 = v71 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "_referenceBounds");
    }
    *(_DWORD *)&v213[4] = v13 ^ 1;
    BSSizeRoundForScale();
    if (v77 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      *(_DWORD *)&v213[8] = 0;
      memset(v212, 0, sizeof(v212));
      v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      v207 = 0;
      v209 = 0;
      v203 = 0;
      v205 = 0;
      v201 = 0;
      v199 = 0;
      v197 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FB80;
      goto LABEL_241;
    }
  }
  else
  {
    *(_DWORD *)&v213[4] = 0;
  }
LABEL_408:
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v213[8] = 0;
      *(_DWORD *)&v212[48] = 0;
      goto LABEL_418;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v183, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v212[48] = 0;
      *(_DWORD *)&v213[8] = 1;
      goto LABEL_418;
    }
  }
  *(_DWORD *)&v213[8] = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v178, "_referenceBounds");
    }
    *(_DWORD *)&v212[48] = v13 ^ 1;
    BSSizeRoundForScale();
    if (v74 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_422;
  }
  else
  {
    *(_DWORD *)&v212[48] = 0;
  }
LABEL_418:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    memset(v212, 0, 48);
    v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    v207 = 0;
    v209 = 0;
    v203 = 0;
    v205 = 0;
    v201 = 0;
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FB88;
    goto LABEL_241;
  }
LABEL_422:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_426:
    *(_QWORD *)&v212[40] = 0;
    goto LABEL_473;
  }
  v75 = __sb__runningInSpringBoard();
  if (v75)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_426;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v179, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v212[40] = 0;
      *(_DWORD *)&v212[44] = 1;
      goto LABEL_473;
    }
  }
  *(_DWORD *)&v212[44] = v75 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "_referenceBounds");
    }
    *(_DWORD *)&v212[40] = v13 ^ 1;
    BSSizeRoundForScale();
    if (v87 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      memset(v212, 0, 40);
      v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      v207 = 0;
      v209 = 0;
      v203 = 0;
      v205 = 0;
      v201 = 0;
      v199 = 0;
      v197 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FB90;
      goto LABEL_241;
    }
  }
  else
  {
    *(_DWORD *)&v212[40] = 0;
  }
LABEL_473:
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v212[36] = 0;
      *(_DWORD *)&v212[28] = 0;
      goto LABEL_483;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v181, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v212[28] = 0;
      *(_DWORD *)&v212[36] = 1;
      goto LABEL_483;
    }
  }
  *(_DWORD *)&v212[36] = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "_referenceBounds");
    }
    *(_DWORD *)&v212[28] = v13 ^ 1;
    BSSizeRoundForScale();
    if (v81 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_487;
  }
  else
  {
    *(_DWORD *)&v212[28] = 0;
  }
LABEL_483:
  if ((_SBF_Private_IsD64Like() & 1) != 0)
  {
    *(_DWORD *)&v212[32] = 0;
    memset(v212, 0, 28);
    v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    v207 = 0;
    v209 = 0;
    v203 = 0;
    v205 = 0;
    v201 = 0;
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FB98;
    goto LABEL_241;
  }
LABEL_487:
  v82 = __sb__runningInSpringBoard();
  if (v82)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v212[32] = 0;
      *(_DWORD *)&v212[24] = 0;
      goto LABEL_497;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v180, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v212[24] = 0;
      *(_DWORD *)&v212[32] = 1;
      goto LABEL_497;
    }
  }
  *(_DWORD *)&v212[32] = v82 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v83 = __sb__runningInSpringBoard();
    if (v83)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v171, "_referenceBounds");
    }
    v13 = v83 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v212[24] = v13;
    if (v85 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      memset(v212, 0, 24);
      v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      v207 = 0;
      v209 = 0;
      v203 = 0;
      v205 = 0;
      v201 = 0;
      v199 = 0;
      v197 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FB70;
      goto LABEL_241;
    }
  }
  else
  {
    *(_DWORD *)&v212[24] = 0;
  }
LABEL_497:
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v212[12] = 0;
      *(_DWORD *)v212 = 0;
      goto LABEL_513;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v177, "userInterfaceIdiom"))
    {
      *(_DWORD *)v212 = 0;
      *(_DWORD *)&v212[12] = 1;
      goto LABEL_513;
    }
  }
  *(_DWORD *)&v212[12] = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v169, "_referenceBounds");
    }
    *(_DWORD *)v212 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v90 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_537;
  }
  else
  {
    *(_DWORD *)v212 = 0;
  }
LABEL_513:
  if ((_SBF_Private_IsD54() & 1) != 0)
  {
    *(_QWORD *)&v212[16] = 0;
    *(_QWORD *)&v212[4] = 0;
    v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    v207 = 0;
    v209 = 0;
    v203 = 0;
    v205 = 0;
    v201 = 0;
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FB78;
    goto LABEL_241;
  }
LABEL_537:
  v91 = __sb__runningInSpringBoard();
  if (v91)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v212[16] = 0;
      goto LABEL_557;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v176, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v212[16] = 0;
      *(_DWORD *)&v212[20] = 1;
      goto LABEL_557;
    }
  }
  *(_DWORD *)&v212[20] = v91 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v93 = __sb__runningInSpringBoard();
    if (v93)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "_referenceBounds");
    }
    v13 = v93 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v212[16] = v13;
    if (v95 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      *(_QWORD *)&v212[4] = 0;
      v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      v207 = 0;
      v209 = 0;
      v203 = 0;
      v205 = 0;
      v201 = 0;
      v199 = 0;
      v197 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FB40;
      goto LABEL_241;
    }
  }
  else
  {
    *(_DWORD *)&v212[16] = 0;
  }
LABEL_557:
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v212[4] = 0;
      goto LABEL_574;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v173, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v212[4] = 0;
      *(_DWORD *)&v212[8] = 1;
      goto LABEL_574;
    }
  }
  *(_DWORD *)&v212[8] = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "_referenceBounds");
    }
    *(_DWORD *)&v212[4] = v13 ^ 1;
    BSSizeRoundForScale();
    if (v98 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_596;
  }
  else
  {
    *(_DWORD *)&v212[4] = 0;
  }
LABEL_574:
  if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
  {
    v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    v207 = 0;
    v209 = 0;
    v203 = 0;
    v205 = 0;
    v201 = 0;
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FB48;
    goto LABEL_241;
  }
LABEL_596:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_600:
    *(_QWORD *)&v211 = 0;
    goto LABEL_632;
  }
  v99 = __sb__runningInSpringBoard();
  if (v99)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_600;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v168, "userInterfaceIdiom"))
    {
      *(_QWORD *)&v211 = 0x100000000;
      goto LABEL_632;
    }
  }
  DWORD1(v211) = v99 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v105 = __sb__runningInSpringBoard();
    if (v105)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "_referenceBounds");
    }
    v13 = v105 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v211) = v13;
    if (v111 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      *((_QWORD *)&v211 + 1) = 0;
      memset(v210, 0, sizeof(v210));
      v207 = 0;
      v209 = 0;
      v203 = 0;
      v205 = 0;
      v201 = 0;
      v199 = 0;
      v197 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FB30;
      goto LABEL_241;
    }
  }
  else
  {
    LODWORD(v211) = 0;
  }
LABEL_632:
  v106 = __sb__runningInSpringBoard();
  if (v106)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v211) = 0;
      v13 = 0;
      goto LABEL_642;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v172, "userInterfaceIdiom"))
    {
      v13 = 0;
      HIDWORD(v211) = 1;
      goto LABEL_642;
    }
  }
  HIDWORD(v211) = v106 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v107 = __sb__runningInSpringBoard();
    if (v107)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "_referenceBounds");
    }
    v13 = v107 ^ 1u;
    BSSizeRoundForScale();
    if (v108 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_646;
  }
  else
  {
    v13 = 0;
  }
LABEL_642:
  if ((_SBF_Private_IsD93Like() & 1) != 0)
  {
    DWORD2(v211) = v13;
    memset(v210, 0, sizeof(v210));
    v207 = 0;
    v209 = 0;
    v203 = 0;
    v205 = 0;
    v201 = 0;
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FB38;
    goto LABEL_241;
  }
LABEL_646:
  DWORD2(v211) = v13;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_650:
    *(_QWORD *)v210 = 0;
    goto LABEL_697;
  }
  v109 = __sb__runningInSpringBoard();
  if (v109)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_650;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v163, "userInterfaceIdiom"))
    {
      *(_QWORD *)v210 = 0x100000000;
      goto LABEL_697;
    }
  }
  *(_DWORD *)&v210[4] = v109 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v155, "_referenceBounds");
    }
    *(_DWORD *)v210 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v121 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      *(_DWORD *)&v210[8] = 0;
      v207 = 0;
      v209 = 0;
      v203 = 0;
      v205 = 0;
      v201 = 0;
      v199 = 0;
      v197 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FB60;
      goto LABEL_241;
    }
  }
  else
  {
    *(_DWORD *)v210 = 0;
  }
LABEL_697:
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v210[8] = 0;
      HIDWORD(v209) = 0;
      goto LABEL_707;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v167, "userInterfaceIdiom"))
    {
      HIDWORD(v209) = 0;
      *(_DWORD *)&v210[8] = 1;
      goto LABEL_707;
    }
  }
  *(_DWORD *)&v210[8] = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "_referenceBounds");
    }
    HIDWORD(v209) = v13 ^ 1;
    BSSizeRoundForScale();
    if (v115 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_711;
  }
  else
  {
    HIDWORD(v209) = 0;
  }
LABEL_707:
  if ((_SBF_Private_IsD63Like() & 1) != 0)
  {
    LODWORD(v209) = 0;
    v203 = 0;
    v205 = 0;
    v207 = 0;
    v201 = 0;
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FB68;
    goto LABEL_241;
  }
LABEL_711:
  v116 = __sb__runningInSpringBoard();
  if (v116)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v209) = 0;
      HIDWORD(v203) = 0;
      goto LABEL_721;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v164, "userInterfaceIdiom"))
    {
      HIDWORD(v203) = 0;
      LODWORD(v209) = 1;
      goto LABEL_721;
    }
  }
  LODWORD(v209) = v116 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v117 = __sb__runningInSpringBoard();
    if (v117)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "_referenceBounds");
    }
    v13 = v117 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v203) = v13;
    if (v119 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      v205 = 0;
      v207 = 0;
      LODWORD(v203) = 0;
      v201 = 0;
      v199 = 0;
      v197 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FB50;
      goto LABEL_241;
    }
  }
  else
  {
    HIDWORD(v203) = 0;
  }
LABEL_721:
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v207 = 0;
      goto LABEL_737;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v161, "userInterfaceIdiom"))
    {
      v207 = 0x100000000;
      goto LABEL_737;
    }
  }
  HIDWORD(v207) = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "_referenceBounds");
    }
    LODWORD(v207) = v13 ^ 1;
    BSSizeRoundForScale();
    if (v124 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_761;
  }
  else
  {
    LODWORD(v207) = 0;
  }
LABEL_737:
  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
  {
    v205 = 0;
    LODWORD(v203) = 0;
    v201 = 0;
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FB58;
    goto LABEL_241;
  }
LABEL_761:
  v125 = __sb__runningInSpringBoard();
  if (v125)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v205) = 0;
      LODWORD(v203) = 0;
      goto LABEL_781;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v160, "userInterfaceIdiom"))
    {
      LODWORD(v203) = 0;
      HIDWORD(v205) = 1;
      goto LABEL_781;
    }
  }
  HIDWORD(v205) = v125 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "_referenceBounds");
    }
    LODWORD(v203) = v13 ^ 1;
    BSSizeRoundForScale();
    if (v129 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v201 = 0;
      LODWORD(v205) = 0;
      v199 = 0;
      v197 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FB20;
      goto LABEL_241;
    }
  }
  else
  {
    LODWORD(v203) = 0;
  }
LABEL_781:
  v126 = __sb__runningInSpringBoard();
  if (v126)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v201 = 0;
      v13 = 0;
      goto LABEL_797;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v157, "userInterfaceIdiom"))
    {
      v13 = 0;
      v201 = 1;
      goto LABEL_797;
    }
  }
  v201 = v126 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v127 = __sb__runningInSpringBoard();
    if (v127)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "_referenceBounds");
    }
    v13 = v127 ^ 1u;
    BSSizeRoundForScale();
    if (v131 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_819;
  }
  else
  {
    v13 = 0;
  }
LABEL_797:
  if ((_SBF_Private_IsD53() & 1) != 0)
  {
    LODWORD(v205) = v13;
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FB28;
    goto LABEL_241;
  }
LABEL_819:
  LODWORD(v205) = v13;
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FB00;
    goto LABEL_241;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
  {
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FB08;
    goto LABEL_241;
  }
  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FAF0;
    goto LABEL_241;
  }
  if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
  {
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FAF8;
    goto LABEL_241;
  }
  v133 = __sb__runningInSpringBoard();
  if (v133)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v199 = 0;
      v197 = 0;
      goto LABEL_855;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v151, "userInterfaceIdiom"))
    {
      v197 = 0;
      v199 = 1;
      goto LABEL_855;
    }
  }
  v199 = v133 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v149, "_referenceBounds");
    }
    v197 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v141 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FB10;
      goto LABEL_241;
    }
  }
  else
  {
    v197 = 0;
  }
LABEL_855:
  v135 = __sb__runningInSpringBoard();
  if (v135)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v45 = 0;
      v46 = 0;
      goto LABEL_875;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v150, "userInterfaceIdiom"))
    {
      v46 = 0;
      v45 = 1;
      goto LABEL_875;
    }
  }
  v45 = v135 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "_referenceBounds");
    }
    v46 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v143 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FB18;
      goto LABEL_241;
    }
  }
  else
  {
    v46 = 0;
  }
LABEL_875:
  v137 = __sb__runningInSpringBoard();
  if (v137)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v47 = 0;
      v48 = 0;
      goto LABEL_896;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v11 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v11, "userInterfaceIdiom"))
    {
      v48 = 0;
      v47 = 1;
      goto LABEL_896;
    }
  }
  v47 = v137 ^ 1;
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v9, "_referenceBounds");
  }
  v48 = v13 ^ 1;
  BSSizeRoundForScale();
  if (v139 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
  {
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FAE8;
    goto LABEL_241;
  }
LABEL_896:
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v49 = 0;
      v50 = 0;
LABEL_925:
      v51 = &CSQuickActionButtonInsetY;
      goto LABEL_241;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v2, "userInterfaceIdiom"))
    {
      v50 = 0;
      v49 = 1;
      goto LABEL_925;
    }
  }
  v49 = v13 ^ 1;
  v146 = __sb__runningInSpringBoard();
  if (v146)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v13, "_referenceBounds");
  }
  v50 = v146 ^ 1;
  BSSizeRoundForScale();
  if (v147 < *(double *)(MEMORY[0x1E0DAB260] + 40))
    goto LABEL_925;
  v51 = &qword_1D048FAE0;
LABEL_241:
  v65 = *(double *)v51;
  if (v50)

  if (v49)
  if (v48)

  if (v47)
  if (v46)

  if (v45)
  if (v197)

  if (v199)
  if ((_DWORD)v205)

  if (v201)
  if ((_DWORD)v203)

  if (HIDWORD(v205))
  if ((_DWORD)v207)

  if (HIDWORD(v207))
  if (HIDWORD(v203))

  if ((_DWORD)v209)
  if (HIDWORD(v209))

  if (*(_DWORD *)&v210[8])
  if (*(_DWORD *)v210)

  if (*(_DWORD *)&v210[4])
  if (DWORD2(v211))

  if (HIDWORD(v211))
  if ((_DWORD)v211)

  if (DWORD1(v211))
  if (*(_DWORD *)&v212[4])

  if (*(_DWORD *)&v212[8])
  if (*(_DWORD *)&v212[16])

  if (*(_DWORD *)&v212[20])
  if (*(_DWORD *)v212)

  if (*(_DWORD *)&v212[12])
  if (*(_DWORD *)&v212[24])

  if (*(_DWORD *)&v212[32])
  if (*(_DWORD *)&v212[28])

  if (*(_DWORD *)&v212[36])
  if (*(_DWORD *)&v212[40])

  if (*(_DWORD *)&v212[44])
  if (*(_DWORD *)&v212[48])

  if (*(_DWORD *)&v213[8])
  if (*(_DWORD *)&v213[4])

  if (*(_DWORD *)v213)
  if (*(_DWORD *)&v213[12])

  if (*(_DWORD *)&v213[16])
  if (*(_DWORD *)&v213[20])

  if ((_DWORD)v214)
  {

    if (!*(_DWORD *)&v213[24])
      goto LABEL_329;
  }
  else if (!*(_DWORD *)&v213[24])
  {
LABEL_329:
    if (*(_DWORD *)&v213[28])
      goto LABEL_330;
    goto LABEL_340;
  }

  if (*(_DWORD *)&v213[28])
  {
LABEL_330:

    if (!*(_DWORD *)&v213[32])
      goto LABEL_331;
    goto LABEL_341;
  }
LABEL_340:
  if (!*(_DWORD *)&v213[32])
  {
LABEL_331:
    if (*(_DWORD *)&v213[36])
      goto LABEL_332;
    goto LABEL_342;
  }
LABEL_341:

  if (*(_DWORD *)&v213[36])
  {
LABEL_332:

    if (!*(_DWORD *)&v213[40])
      goto LABEL_333;
    goto LABEL_343;
  }
LABEL_342:
  if (!*(_DWORD *)&v213[40])
  {
LABEL_333:
    if (*(_DWORD *)&v213[44])
      goto LABEL_334;
    goto LABEL_344;
  }
LABEL_343:

  if (*(_DWORD *)&v213[44])
  {
LABEL_334:

    if (!*(_DWORD *)&v213[48])
      goto LABEL_335;
    goto LABEL_345;
  }
LABEL_344:
  if (!*(_DWORD *)&v213[48])
  {
LABEL_335:
    if (HIDWORD(v214))
      goto LABEL_336;
    goto LABEL_346;
  }
LABEL_345:

  if (HIDWORD(v214))
  {
LABEL_336:

    if (!v215)
      return v65;
    goto LABEL_347;
  }
LABEL_346:
  if (v215)
LABEL_347:

  return v65;
}

- (double)_insetY
{
  uint64_t v2;
  id WeakRetained;
  int v4;
  int v5;
  int v6;
  int v7;
  char v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  unsigned int v16;
  int v17;
  int v18;
  unsigned int v19;
  int v20;
  unsigned int v21;
  int v22;
  int v23;
  int v24;
  unsigned int v25;
  int v26;
  unsigned int v27;
  int v28;
  int v29;
  int v30;
  double v31;
  int v32;
  int v33;
  double v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  uint64_t *v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  uint64_t *v51;
  double v52;
  int v53;
  double v54;
  int v55;
  double v56;
  double v57;
  double v59;
  double v60;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v68;
  int v69;
  double v70;
  int v71;
  double v72;
  int v73;
  double v74;
  int v75;
  double v76;
  double v77;
  double v78;
  int v79;
  int v80;
  double v81;
  int v82;
  int v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  int v89;
  double v90;
  int v91;
  int v92;
  int v93;
  double v94;
  double v95;
  double v96;
  int v97;
  double v98;
  int v99;
  int v100;
  int v101;
  int v102;
  double v103;
  int v104;
  int v105;
  int v106;
  int v107;
  double v108;
  int v109;
  double v110;
  double v111;
  double v112;
  int v113;
  int v114;
  double v115;
  int v116;
  int v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  int v123;
  double v124;
  int v125;
  int v126;
  int v127;
  double v128;
  double v129;
  double v130;
  double v131;
  int v132;
  int v133;
  int v134;
  int v135;
  int v136;
  int v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  int v144;
  double v145;
  int v146;
  double v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  int v197;
  void *v198;
  int v199;
  void *v200;
  int v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  _BYTE v210[12];
  __int128 v211;
  _BYTE v212[52];
  _BYTE v213[52];
  uint64_t v214;
  int v215;
  id v216;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_msgSend(WeakRetained, "isPortrait");

  v5 = __sb__runningInSpringBoard();
  v6 = v5;
  if (v4)
  {
    if (v5)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v7 = 0;
        v8 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v216 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v216, "userInterfaceIdiom") != 1)
      {
        v7 = 0;
        v8 = 1;
        goto LABEL_18;
      }
    }
    v8 = v6 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v12 = __sb__runningInSpringBoard();
      if ((_DWORD)v12)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v200 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v200, "_referenceBounds");
      }
      v7 = v12 ^ 1;
      BSSizeRoundForScale();
      if (v57 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v56 == *(double *)(MEMORY[0x1E0DAB260] + 280))
      {
        v215 = v12 ^ 1;
        v211 = 0uLL;
        memset(v210, 0, sizeof(v210));
        v208 = 0;
        v206 = 0;
        v204 = 0;
        memset(v212, 0, sizeof(v212));
        v36 = 0;
        v202 = 0;
        v37 = 0;
        v38 = 0;
        v39 = 0;
        v40 = 0;
        v41 = 0;
        v42 = 0;
        v43 = 0;
        memset(v213, 0, sizeof(v213));
        v214 = 0;
        v44 = &qword_1D048FBA8;
        goto LABEL_131;
      }
    }
    else
    {
      v7 = 0;
    }
LABEL_18:
    v14 = __sb__runningInSpringBoard();
    v215 = v7;
    if (v14)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v15 = 0;
        v16 = 0;
        goto LABEL_36;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v198 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v198, "userInterfaceIdiom") != 1)
      {
        v15 = 0;
        v16 = 1;
        goto LABEL_36;
      }
    }
    v16 = v14 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v12 = __sb__runningInSpringBoard();
      if ((_DWORD)v12)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v189, "_referenceBounds");
      }
      v15 = v12 ^ 1;
      BSSizeRoundForScale();
      if (v62 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
      {
        *(_DWORD *)&v213[48] = v12 ^ 1;
        v214 = v16;
        v211 = 0uLL;
        memset(v210, 0, sizeof(v210));
        v208 = 0;
        v206 = 0;
        v204 = 0;
        memset(v212, 0, sizeof(v212));
        v36 = 0;
        v202 = 0;
        v37 = 0;
        v38 = 0;
        v39 = 0;
        v40 = 0;
        v41 = 0;
        v42 = 0;
        v43 = 0;
        memset(v213, 0, 48);
        v44 = &qword_1D048FBD0;
        goto LABEL_131;
      }
    }
    else
    {
      v15 = 0;
    }
LABEL_36:
    v20 = __sb__runningInSpringBoard();
    *(_DWORD *)&v213[48] = v15;
    LODWORD(v214) = v16;
    if (v20)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v21 = 0;
        v22 = 0;
        goto LABEL_54;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v196 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v196, "userInterfaceIdiom") != 1)
      {
        v21 = 0;
        v22 = 1;
        goto LABEL_54;
      }
    }
    v22 = v20 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v12 = __sb__runningInSpringBoard();
      if ((_DWORD)v12)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v188, "_referenceBounds");
      }
      v21 = v12 ^ 1;
      BSSizeRoundForScale();
      if (v64 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
      {
        *(_DWORD *)&v213[40] = v12 ^ 1;
        *(_DWORD *)&v213[44] = v22;
        v211 = 0uLL;
        memset(v210, 0, sizeof(v210));
        v208 = 0;
        v206 = 0;
        v204 = 0;
        memset(v212, 0, sizeof(v212));
        v36 = 0;
        v202 = 0;
        v37 = 0;
        v38 = 0;
        v39 = 0;
        v40 = 0;
        v41 = 0;
        v42 = 0;
        v43 = 0;
        memset(v213, 0, 40);
        HIDWORD(v214) = 0;
        v44 = &qword_1D048FBC0;
        goto LABEL_131;
      }
    }
    else
    {
      v21 = 0;
    }
LABEL_54:
    v26 = __sb__runningInSpringBoard();
    *(_QWORD *)&v213[40] = __PAIR64__(v22, v21);
    if (v26)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        v27 = 0;
        v28 = 0;
        goto LABEL_71;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v195, "userInterfaceIdiom") != 1)
      {
        v27 = 0;
        v28 = 1;
        goto LABEL_71;
      }
    }
    v28 = v26 ^ 1;
    v12 = __sb__runningInSpringBoard();
    if ((_DWORD)v12)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v192, "_referenceBounds");
    }
    v27 = v12 ^ 1;
    BSSizeRoundForScale();
    if (v31 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
    {
      *(_DWORD *)&v213[32] = v12 ^ 1;
      *(_DWORD *)&v213[36] = v28;
      v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      v208 = 0;
      v206 = 0;
      v204 = 0;
      memset(v212, 0, sizeof(v212));
      v36 = 0;
      v202 = 0;
      v37 = 0;
      v38 = 0;
      v39 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      memset(v213, 0, 32);
      HIDWORD(v214) = 0;
      v44 = &qword_1D048FBC8;
      goto LABEL_131;
    }
LABEL_71:
    v32 = __sb__runningInSpringBoard();
    *(_QWORD *)&v213[32] = __PAIR64__(v28, v27);
    if (v32)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        HIDWORD(v214) = 0;
        v33 = 0;
        goto LABEL_91;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v194, "userInterfaceIdiom") != 1)
      {
        HIDWORD(v214) = 0;
        v33 = 1;
        goto LABEL_91;
      }
    }
    v33 = v32 ^ 1;
    v12 = __sb__runningInSpringBoard();
    if ((_DWORD)v12)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v190 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v190, "_referenceBounds");
    }
    HIDWORD(v214) = v12 ^ 1;
    BSSizeRoundForScale();
    if (v52 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
    {
      *(_DWORD *)&v213[28] = v33;
      v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      v208 = 0;
      v206 = 0;
      v204 = 0;
      memset(v212, 0, sizeof(v212));
      v36 = 0;
      v202 = 0;
      v37 = 0;
      v38 = 0;
      v39 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      memset(v213, 0, 28);
      v44 = &qword_1D048FBB8;
      goto LABEL_131;
    }
LABEL_91:
    v53 = __sb__runningInSpringBoard();
    *(_DWORD *)&v213[28] = v33;
    if (v53)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        *(_QWORD *)&v213[20] = 0;
        goto LABEL_352;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v193, "userInterfaceIdiom") != 1)
      {
        *(_QWORD *)&v213[20] = 0x100000000;
        goto LABEL_352;
      }
    }
    *(_DWORD *)&v213[24] = v53 ^ 1;
    v12 = __sb__runningInSpringBoard();
    if ((_DWORD)v12)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v187, "_referenceBounds");
    }
    *(_DWORD *)&v213[20] = v12 ^ 1;
    BSSizeRoundForScale();
    if (v68 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
    {
      v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      v208 = 0;
      v206 = 0;
      v204 = 0;
      memset(v212, 0, sizeof(v212));
      v36 = 0;
      v202 = 0;
      v37 = 0;
      v38 = 0;
      v39 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      memset(v213, 0, 20);
      v44 = &qword_1D048FBB0;
      goto LABEL_131;
    }
LABEL_352:
    v12 = __sb__runningInSpringBoard();
    if ((_DWORD)v12)
    {
      if (SBFEffectiveDeviceClass() != 2)
        goto LABEL_354;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v191, "userInterfaceIdiom") != 1)
      {
LABEL_354:
        *(_DWORD *)&v213[16] = v12 ^ 1;
        if (!_SBF_Private_IsD94Like())
        {
LABEL_358:
          *(_QWORD *)&v213[4] = 0;
          goto LABEL_383;
        }
        v69 = __sb__runningInSpringBoard();
        if (v69)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            goto LABEL_358;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v185 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v185, "userInterfaceIdiom"))
          {
            *(_QWORD *)&v213[4] = 1;
            goto LABEL_383;
          }
        }
        *(_DWORD *)&v213[4] = v69 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v178 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v178, "_referenceBounds");
          }
          *(_DWORD *)&v213[8] = v12 ^ 1;
          BSSizeRoundForScale();
          if (v76 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
          {
            v211 = 0uLL;
            memset(v210, 0, sizeof(v210));
            v208 = 0;
            v206 = 0;
            v204 = 0;
            memset(v212, 0, sizeof(v212));
            v36 = 0;
            v202 = 0;
            v37 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            v41 = 0;
            v42 = 0;
            v43 = 0;
            *(_DWORD *)v213 = 0;
            *(_DWORD *)&v213[12] = 0;
            v44 = &qword_1D048FB80;
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v213[8] = 0;
        }
LABEL_383:
        v12 = __sb__runningInSpringBoard();
        if ((_DWORD)v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)v213 = 0;
            *(_DWORD *)&v213[12] = 0;
            goto LABEL_393;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v186 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v186, "userInterfaceIdiom"))
          {
            *(_DWORD *)v213 = 0;
            *(_DWORD *)&v213[12] = 1;
            goto LABEL_393;
          }
        }
        *(_DWORD *)&v213[12] = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v181 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v181, "_referenceBounds");
          }
          *(_DWORD *)v213 = v12 ^ 1;
          BSSizeRoundForScale();
          if (v72 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
            goto LABEL_397;
        }
        else
        {
          *(_DWORD *)v213 = 0;
        }
LABEL_393:
        if ((_SBF_Private_IsD94Like() & 1) != 0)
        {
          v211 = 0uLL;
          memset(v210, 0, sizeof(v210));
          v208 = 0;
          v206 = 0;
          v204 = 0;
          memset(v212, 0, sizeof(v212));
          v36 = 0;
          v202 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v44 = &qword_1D048FB88;
          goto LABEL_131;
        }
LABEL_397:
        if (!_SBF_Private_IsD64Like())
        {
LABEL_401:
          *(_QWORD *)&v212[44] = 0;
          goto LABEL_439;
        }
        v73 = __sb__runningInSpringBoard();
        if (v73)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            goto LABEL_401;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v182 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v182, "userInterfaceIdiom"))
          {
            *(_QWORD *)&v212[44] = 0x100000000;
            goto LABEL_439;
          }
        }
        *(_DWORD *)&v212[48] = v73 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v173, "_referenceBounds");
          }
          *(_DWORD *)&v212[44] = v12 ^ 1;
          BSSizeRoundForScale();
          if (v86 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
          {
            v211 = 0uLL;
            memset(v210, 0, sizeof(v210));
            v208 = 0;
            v206 = 0;
            v204 = 0;
            memset(v212, 0, 44);
            v36 = 0;
            v202 = 0;
            v37 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            v41 = 0;
            v42 = 0;
            v43 = 0;
            v44 = &qword_1D048FB90;
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v212[44] = 0;
        }
LABEL_439:
        v12 = __sb__runningInSpringBoard();
        if ((_DWORD)v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v212[32] = 0;
            *(_DWORD *)&v212[40] = 0;
            goto LABEL_449;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v184 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v184, "userInterfaceIdiom"))
          {
            *(_DWORD *)&v212[32] = 0;
            *(_DWORD *)&v212[40] = 1;
            goto LABEL_449;
          }
        }
        *(_DWORD *)&v212[40] = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v177, "_referenceBounds");
          }
          *(_DWORD *)&v212[32] = v12 ^ 1;
          BSSizeRoundForScale();
          if (v78 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
            goto LABEL_453;
        }
        else
        {
          *(_DWORD *)&v212[32] = 0;
        }
LABEL_449:
        if ((_SBF_Private_IsD64Like() & 1) != 0)
        {
          v211 = 0uLL;
          memset(v210, 0, sizeof(v210));
          v208 = 0;
          v206 = 0;
          v204 = 0;
          memset(v212, 0, 32);
          v36 = 0;
          v202 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v43 = 0;
          *(_DWORD *)&v212[36] = 0;
          v44 = &qword_1D048FB98;
          goto LABEL_131;
        }
LABEL_453:
        v79 = __sb__runningInSpringBoard();
        if (v79)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v212[28] = 0;
            *(_DWORD *)&v212[36] = 0;
            goto LABEL_463;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v183 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v183, "userInterfaceIdiom"))
          {
            *(_DWORD *)&v212[28] = 0;
            *(_DWORD *)&v212[36] = 1;
            goto LABEL_463;
          }
        }
        *(_DWORD *)&v212[36] = v79 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v80 = __sb__runningInSpringBoard();
          if (v80)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v174 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v174, "_referenceBounds");
          }
          v12 = v80 ^ 1u;
          BSSizeRoundForScale();
          *(_DWORD *)&v212[28] = v12;
          if (v84 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
          {
            v211 = 0uLL;
            memset(v210, 0, sizeof(v210));
            v208 = 0;
            v206 = 0;
            v204 = 0;
            memset(v212, 0, 28);
            v36 = 0;
            v202 = 0;
            v37 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            v41 = 0;
            v42 = 0;
            v43 = 0;
            v44 = &qword_1D048FB70;
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v212[28] = 0;
        }
LABEL_463:
        v12 = __sb__runningInSpringBoard();
        if ((_DWORD)v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_DWORD *)&v212[4] = 0;
            *(_DWORD *)&v212[16] = 0;
            goto LABEL_507;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v180 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v180, "userInterfaceIdiom"))
          {
            *(_DWORD *)&v212[4] = 0;
            *(_DWORD *)&v212[16] = 1;
            goto LABEL_507;
          }
        }
        *(_DWORD *)&v212[16] = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v172 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v172, "_referenceBounds");
          }
          *(_DWORD *)&v212[4] = v12 ^ 1;
          BSSizeRoundForScale();
          if (v88 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
            goto LABEL_529;
        }
        else
        {
          *(_DWORD *)&v212[4] = 0;
        }
LABEL_507:
        if ((_SBF_Private_IsD54() & 1) != 0)
        {
          v211 = 0uLL;
          memset(v210, 0, sizeof(v210));
          v208 = 0;
          v206 = 0;
          v204 = 0;
          *(_DWORD *)v212 = 0;
          v36 = 0;
          v202 = 0;
          v37 = 0;
          v38 = 0;
          *(_QWORD *)&v212[8] = 0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          *(_QWORD *)&v212[20] = 0;
          v43 = 0;
          v44 = &qword_1D048FB78;
          goto LABEL_131;
        }
LABEL_529:
        v89 = __sb__runningInSpringBoard();
        if (v89)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_QWORD *)&v212[20] = 0;
            goto LABEL_547;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v179 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v179, "userInterfaceIdiom"))
          {
            *(_QWORD *)&v212[20] = 0x100000000;
            goto LABEL_547;
          }
        }
        *(_DWORD *)&v212[24] = v89 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v92 = __sb__runningInSpringBoard();
          if (v92)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v169 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v169, "_referenceBounds");
          }
          v12 = v92 ^ 1u;
          BSSizeRoundForScale();
          *(_DWORD *)&v212[20] = v12;
          if (v94 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
          {
            v211 = 0uLL;
            memset(v210, 0, sizeof(v210));
            v208 = 0;
            v206 = 0;
            v204 = 0;
            *(_DWORD *)v212 = 0;
            v36 = 0;
            v202 = 0;
            v37 = 0;
            v38 = 0;
            *(_QWORD *)&v212[8] = 0;
            v39 = 0;
            v40 = 0;
            v41 = 0;
            v42 = 0;
            v43 = 0;
            v44 = &qword_1D048FB40;
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v212[20] = 0;
        }
LABEL_547:
        v12 = __sb__runningInSpringBoard();
        if ((_DWORD)v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(_QWORD *)&v212[8] = 0;
            goto LABEL_567;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v176 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v176, "userInterfaceIdiom"))
          {
            *(_QWORD *)&v212[8] = 0x100000000;
            goto LABEL_567;
          }
        }
        *(_DWORD *)&v212[12] = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v168 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v168, "_referenceBounds");
          }
          *(_DWORD *)&v212[8] = v12 ^ 1;
          BSSizeRoundForScale();
          if (v96 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
            goto LABEL_587;
        }
        else
        {
          *(_DWORD *)&v212[8] = 0;
        }
LABEL_567:
        if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
        {
          v211 = 0uLL;
          memset(v210, 0, sizeof(v210));
          v208 = 0;
          v206 = 0;
          v204 = 0;
          *(_DWORD *)v212 = 0;
          v36 = 0;
          v202 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v44 = &qword_1D048FB48;
          goto LABEL_131;
        }
LABEL_587:
        if (!_SBF_Private_IsD93Like())
        {
LABEL_591:
          *(_QWORD *)((char *)&v211 + 4) = 0;
          goto LABEL_607;
        }
        v97 = __sb__runningInSpringBoard();
        if (v97)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            goto LABEL_591;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v171, "userInterfaceIdiom"))
          {
            *(_QWORD *)((char *)&v211 + 4) = 0x100000000;
            goto LABEL_607;
          }
        }
        DWORD2(v211) = v97 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v100 = __sb__runningInSpringBoard();
          if (v100)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v162, "_referenceBounds");
          }
          v12 = v100 ^ 1u;
          BSSizeRoundForScale();
          DWORD1(v211) = v12;
          if (v110 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
          {
            LODWORD(v211) = 0;
            memset(v210, 0, sizeof(v210));
            v208 = 0;
            HIDWORD(v211) = 0;
            v206 = 0;
            v204 = 0;
            *(_DWORD *)v212 = 0;
            v202 = 0;
            v36 = 0;
            v37 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            v41 = 0;
            v42 = 0;
            v43 = 0;
            v44 = &qword_1D048FB30;
            goto LABEL_131;
          }
        }
        else
        {
          DWORD1(v211) = 0;
        }
LABEL_607:
        v101 = __sb__runningInSpringBoard();
        if (v101)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v12 = 0;
            *(_DWORD *)v212 = 0;
            goto LABEL_617;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v175, "userInterfaceIdiom"))
          {
            v12 = 0;
            *(_DWORD *)v212 = 1;
            goto LABEL_617;
          }
        }
        *(_DWORD *)v212 = v101 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v102 = __sb__runningInSpringBoard();
          if (v102)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v165, "_referenceBounds");
          }
          v12 = v102 ^ 1u;
          BSSizeRoundForScale();
          if (v103 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
            goto LABEL_621;
        }
        else
        {
          v12 = 0;
        }
LABEL_617:
        if ((_SBF_Private_IsD93Like() & 1) != 0)
        {
          HIDWORD(v211) = v12;
          LODWORD(v211) = 0;
          memset(v210, 0, sizeof(v210));
          v208 = 0;
          v206 = 0;
          v204 = 0;
          v202 = 0;
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v44 = &qword_1D048FB38;
          goto LABEL_131;
        }
LABEL_621:
        HIDWORD(v211) = v12;
        if (!_SBF_Private_IsD63Like())
        {
LABEL_625:
          *(_QWORD *)&v210[4] = 0;
          goto LABEL_663;
        }
        v104 = __sb__runningInSpringBoard();
        if (v104)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
            goto LABEL_625;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v166, "userInterfaceIdiom"))
          {
            *(_DWORD *)&v210[4] = 0;
            *(_DWORD *)&v210[8] = 1;
            goto LABEL_663;
          }
        }
        *(_DWORD *)&v210[8] = v104 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v158 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v158, "_referenceBounds");
          }
          *(_DWORD *)&v210[4] = v12 ^ 1;
          BSSizeRoundForScale();
          if (v120 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
          {
            LODWORD(v211) = 0;
            *(_DWORD *)v210 = 0;
            v206 = 0;
            v208 = 0;
            v202 = 0;
            v204 = 0;
            v36 = 0;
            v37 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            v41 = 0;
            v42 = 0;
            v43 = 0;
            v44 = &qword_1D048FB60;
            goto LABEL_131;
          }
        }
        else
        {
          *(_DWORD *)&v210[4] = 0;
        }
LABEL_663:
        v12 = __sb__runningInSpringBoard();
        if ((_DWORD)v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v211) = 0;
            *(_DWORD *)v210 = 0;
            goto LABEL_673;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v170 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v170, "userInterfaceIdiom"))
          {
            *(_DWORD *)v210 = 0;
            LODWORD(v211) = 1;
            goto LABEL_673;
          }
        }
        LODWORD(v211) = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v161 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v161, "_referenceBounds");
          }
          *(_DWORD *)v210 = v12 ^ 1;
          BSSizeRoundForScale();
          if (v112 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
            goto LABEL_677;
        }
        else
        {
          *(_DWORD *)v210 = 0;
        }
LABEL_673:
        if ((_SBF_Private_IsD63Like() & 1) != 0)
        {
          v206 = 0;
          v208 = 0;
          v202 = 0;
          v204 = 0;
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v44 = &qword_1D048FB68;
          goto LABEL_131;
        }
LABEL_677:
        v113 = __sb__runningInSpringBoard();
        if (v113)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v208) = 0;
            HIDWORD(v204) = 0;
            goto LABEL_687;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v167 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v167, "userInterfaceIdiom"))
          {
            HIDWORD(v204) = 0;
            HIDWORD(v208) = 1;
            goto LABEL_687;
          }
        }
        HIDWORD(v208) = v113 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v114 = __sb__runningInSpringBoard();
          if (v114)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v159, "_referenceBounds");
          }
          v12 = v114 ^ 1u;
          BSSizeRoundForScale();
          HIDWORD(v204) = v12;
          if (v118 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
          {
            LODWORD(v208) = 0;
            v206 = 0;
            LODWORD(v204) = 0;
            v202 = 0;
            v36 = 0;
            v37 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            v41 = 0;
            v42 = 0;
            v43 = 0;
            v44 = &qword_1D048FB50;
            goto LABEL_131;
          }
        }
        else
        {
          HIDWORD(v204) = 0;
        }
LABEL_687:
        v12 = __sb__runningInSpringBoard();
        if ((_DWORD)v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v208) = 0;
            HIDWORD(v206) = 0;
            goto LABEL_731;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v164, "userInterfaceIdiom"))
          {
            HIDWORD(v206) = 0;
            LODWORD(v208) = 1;
            goto LABEL_731;
          }
        }
        LODWORD(v208) = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v157, "_referenceBounds");
          }
          HIDWORD(v206) = v12 ^ 1;
          BSSizeRoundForScale();
          if (v122 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
            goto LABEL_753;
        }
        else
        {
          HIDWORD(v206) = 0;
        }
LABEL_731:
        if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
        {
          LODWORD(v206) = 0;
          LODWORD(v204) = 0;
          v202 = 0;
          v36 = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v44 = &qword_1D048FB58;
          goto LABEL_131;
        }
LABEL_753:
        v123 = __sb__runningInSpringBoard();
        if (v123)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v206) = 0;
            LODWORD(v204) = 0;
            goto LABEL_771;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v163, "userInterfaceIdiom"))
          {
            LODWORD(v204) = 0;
            LODWORD(v206) = 1;
            goto LABEL_771;
          }
        }
        LODWORD(v206) = v123 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v156, "_referenceBounds");
          }
          LODWORD(v204) = v12 ^ 1;
          BSSizeRoundForScale();
          if (v128 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
          {
            v202 = 0;
            v36 = 0;
            v37 = 0;
            v38 = 0;
            v39 = 0;
            v40 = 0;
            v41 = 0;
            v42 = 0;
            v43 = 0;
            v44 = &qword_1D048FB20;
            goto LABEL_131;
          }
        }
        else
        {
          LODWORD(v204) = 0;
        }
LABEL_771:
        v12 = __sb__runningInSpringBoard();
        if ((_DWORD)v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v202) = 0;
            v36 = 0;
            goto LABEL_791;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v160, "userInterfaceIdiom"))
          {
            v36 = 0;
            HIDWORD(v202) = 1;
            goto LABEL_791;
          }
        }
        HIDWORD(v202) = v12 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v155, "_referenceBounds");
          }
          v36 = v12 ^ 1;
          BSSizeRoundForScale();
          if (v130 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
            goto LABEL_807;
        }
        else
        {
          v36 = 0;
        }
LABEL_791:
        if ((_SBF_Private_IsD53() & 1) != 0)
        {
          LODWORD(v202) = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v44 = &qword_1D048FB28;
          goto LABEL_131;
        }
LABEL_807:
        if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
        {
          LODWORD(v202) = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v44 = &qword_1D048FB00;
          goto LABEL_131;
        }
        if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
        {
          LODWORD(v202) = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v44 = &qword_1D048FB08;
          goto LABEL_131;
        }
        if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
        {
          LODWORD(v202) = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v44 = &qword_1D048FAF0;
          goto LABEL_131;
        }
        if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
        {
          LODWORD(v202) = 0;
          v37 = 0;
          v38 = 0;
          v39 = 0;
          v40 = 0;
          v41 = 0;
          v42 = 0;
          v43 = 0;
          v44 = &qword_1D048FAF8;
          goto LABEL_131;
        }
        v132 = __sb__runningInSpringBoard();
        if (v132)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v202) = 0;
            v37 = 0;
            goto LABEL_845;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v154, "userInterfaceIdiom"))
          {
            v37 = 0;
            LODWORD(v202) = 1;
            goto LABEL_845;
          }
        }
        LODWORD(v202) = v132 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v149 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v149, "_referenceBounds");
          }
          v37 = v12 ^ 1;
          BSSizeRoundForScale();
          if (v140 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
          {
            v38 = 0;
            v39 = 0;
            v40 = 0;
            v41 = 0;
            v42 = 0;
            v43 = 0;
            v44 = &qword_1D048FB10;
            goto LABEL_131;
          }
        }
        else
        {
          v37 = 0;
        }
LABEL_845:
        v134 = __sb__runningInSpringBoard();
        if (v134)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v38 = 0;
            v39 = 0;
            goto LABEL_865;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v153 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v153, "userInterfaceIdiom"))
          {
            v39 = 0;
            v38 = 1;
            goto LABEL_865;
          }
        }
        v38 = v134 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          v12 = __sb__runningInSpringBoard();
          if ((_DWORD)v12)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
            v148 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v148, "_referenceBounds");
          }
          v39 = v12 ^ 1;
          BSSizeRoundForScale();
          if (v142 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
          {
            v40 = 0;
            v41 = 0;
            v42 = 0;
            v43 = 0;
            v44 = &qword_1D048FB18;
            goto LABEL_131;
          }
        }
        else
        {
          v39 = 0;
        }
LABEL_865:
        v136 = __sb__runningInSpringBoard();
        if (v136)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v40 = 0;
            v41 = 0;
            goto LABEL_885;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v152 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v152, "userInterfaceIdiom"))
          {
            v41 = 0;
            v40 = 1;
            goto LABEL_885;
          }
        }
        v40 = v136 ^ 1;
        v12 = __sb__runningInSpringBoard();
        if ((_DWORD)v12)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v150, "_referenceBounds");
        }
        v41 = v12 ^ 1;
        BSSizeRoundForScale();
        if (v138 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
        {
          v42 = 0;
          v43 = 0;
          v44 = &qword_1D048FAE8;
          goto LABEL_131;
        }
LABEL_885:
        v12 = __sb__runningInSpringBoard();
        if ((_DWORD)v12)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            v42 = 0;
            v43 = 0;
            goto LABEL_919;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v151, "userInterfaceIdiom"))
          {
            v43 = 0;
            v42 = 1;
            goto LABEL_919;
          }
        }
        v42 = v12 ^ 1;
        v144 = __sb__runningInSpringBoard();
        if (v144)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v12, "_referenceBounds");
        }
        v43 = v144 ^ 1;
        BSSizeRoundForScale();
        if (v145 >= *(double *)(MEMORY[0x1E0DAB260] + 40))
        {
          v44 = &qword_1D048FAE0;
LABEL_131:
          v65 = *(double *)v44;
          if (v43)

          if (v42)
          if (v41)

          if (v40)
          if (v39)

          if (v38)
          if (v37)

          if ((_DWORD)v202)
          if (v36)

          if (HIDWORD(v202))
          if ((_DWORD)v204)

          if ((_DWORD)v206)
          if (HIDWORD(v206))

          if ((_DWORD)v208)
          if (HIDWORD(v204))

          if (HIDWORD(v208))
          if (*(_DWORD *)v210)

          if ((_DWORD)v211)
          if (*(_DWORD *)&v210[4])

          if (*(_DWORD *)&v210[8])
          if (HIDWORD(v211))

          if (*(_DWORD *)v212)
          if (DWORD1(v211))

          if (DWORD2(v211))
          if (*(_DWORD *)&v212[8])

          if (*(_DWORD *)&v212[12])
          if (*(_DWORD *)&v212[20])

          if (*(_DWORD *)&v212[24])
          if (*(_DWORD *)&v212[4])

          if (*(_DWORD *)&v212[16])
          if (*(_DWORD *)&v212[28])

          if (*(_DWORD *)&v212[36])
          if (*(_DWORD *)&v212[32])

          if (*(_DWORD *)&v212[40])
          if (*(_DWORD *)&v212[44])

          if (*(_DWORD *)&v212[48])
          if (*(_DWORD *)v213)

          if (*(_DWORD *)&v213[12])
          if (*(_DWORD *)&v213[8])

          if (*(_DWORD *)&v213[4])
          if (*(_DWORD *)&v213[16])

          if (*(_DWORD *)&v213[20])
          if (*(_DWORD *)&v213[24])

          if (HIDWORD(v214))
          {

            if (!*(_DWORD *)&v213[28])
              goto LABEL_219;
          }
          else if (!*(_DWORD *)&v213[28])
          {
LABEL_219:
            if (*(_DWORD *)&v213[32])
              goto LABEL_220;
            goto LABEL_231;
          }

          if (*(_DWORD *)&v213[32])
          {
LABEL_220:

            if (!*(_DWORD *)&v213[36])
              goto LABEL_221;
            goto LABEL_232;
          }
LABEL_231:
          if (!*(_DWORD *)&v213[36])
          {
LABEL_221:
            if (*(_DWORD *)&v213[40])
              goto LABEL_222;
            goto LABEL_233;
          }
LABEL_232:

          if (*(_DWORD *)&v213[40])
          {
LABEL_222:

            if (!*(_DWORD *)&v213[44])
              goto LABEL_223;
            goto LABEL_234;
          }
LABEL_233:
          if (!*(_DWORD *)&v213[44])
          {
LABEL_223:
            if (*(_DWORD *)&v213[48])
              goto LABEL_224;
            goto LABEL_235;
          }
LABEL_234:

          if (*(_DWORD *)&v213[48])
          {
LABEL_224:

            if (!(_DWORD)v214)
              goto LABEL_225;
            goto LABEL_236;
          }
LABEL_235:
          if (!(_DWORD)v214)
          {
LABEL_225:
            if (!v215)
              goto LABEL_227;
            goto LABEL_226;
          }
LABEL_236:

          if (!v215)
          {
LABEL_227:
            if ((v8 & 1) == 0)
              return v65;
            goto LABEL_347;
          }
LABEL_226:

          goto LABEL_227;
        }
LABEL_919:
        v44 = &CSQuickActionButtonInsetY;
        goto LABEL_131;
      }
    }
    v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    v208 = 0;
    v206 = 0;
    v204 = 0;
    memset(v212, 0, sizeof(v212));
    v36 = 0;
    v202 = 0;
    v37 = 0;
    v38 = 0;
    v39 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    *(_OWORD *)v213 = 0uLL;
    v44 = &qword_1D048FBA0;
    *(_DWORD *)&v213[16] = v12 ^ 1;
    goto LABEL_131;
  }
  v9 = (uint64_t)&CSQuickActionButtonInsetX;
  if (v5)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v10 = 0;
      v11 = 0;
      goto LABEL_27;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v216 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v216, "userInterfaceIdiom") != 1)
    {
      v11 = 0;
      v10 = 1;
      goto LABEL_27;
    }
  }
  v10 = v6 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v187, "_referenceBounds");
    }
    v11 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v60 == *(double *)(MEMORY[0x1E0DAB260] + 272) && v59 == *(double *)(MEMORY[0x1E0DAB260] + 280))
    {
      HIDWORD(v214) = v13 ^ 1;
      v215 = v10;
      LODWORD(v214) = 0;
      memset(v213, 0, sizeof(v213));
      memset(v212, 0, sizeof(v212));
      v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      v207 = 0;
      v209 = 0;
      v203 = 0;
      v205 = 0;
      v201 = 0;
      v199 = 0;
      v197 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FAA8;
      goto LABEL_241;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_27:
  v17 = __sb__runningInSpringBoard();
  HIDWORD(v214) = v11;
  v215 = v10;
  if (v17)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v18 = 0;
      v19 = 0;
      goto LABEL_45;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v195, "userInterfaceIdiom") != 1)
    {
      v19 = 0;
      v18 = 1;
      goto LABEL_45;
    }
  }
  v18 = v17 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v186, "_referenceBounds");
    }
    v19 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v63 >= *(double *)(MEMORY[0x1E0DAB260] + 424))
    {
      *(_DWORD *)&v213[44] = v13 ^ 1;
      *(_DWORD *)&v213[48] = v18;
      LODWORD(v214) = 0;
      memset(v213, 0, 44);
      memset(v212, 0, sizeof(v212));
      v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      v207 = 0;
      v209 = 0;
      v203 = 0;
      v205 = 0;
      v201 = 0;
      v199 = 0;
      v197 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FAD0;
      goto LABEL_241;
    }
  }
  else
  {
    v19 = 0;
  }
LABEL_45:
  v23 = __sb__runningInSpringBoard();
  *(_QWORD *)&v213[44] = __PAIR64__(v18, v19);
  if (v23)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v24 = 0;
      v25 = 0;
      goto LABEL_62;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v194, "userInterfaceIdiom") != 1)
    {
      v25 = 0;
      v24 = 1;
      goto LABEL_62;
    }
  }
  v24 = v23 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "_referenceBounds");
    }
    v25 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v66 >= *(double *)(MEMORY[0x1E0DAB260] + 360))
    {
      *(_DWORD *)&v213[36] = v13 ^ 1;
      *(_DWORD *)&v213[40] = v24;
      LODWORD(v214) = 0;
      memset(v213, 0, 36);
      memset(v212, 0, sizeof(v212));
      v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      v207 = 0;
      v209 = 0;
      v203 = 0;
      v205 = 0;
      v201 = 0;
      v199 = 0;
      v197 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FAC0;
      goto LABEL_241;
    }
  }
  else
  {
    v25 = 0;
  }
LABEL_62:
  v29 = __sb__runningInSpringBoard();
  *(_QWORD *)&v213[36] = __PAIR64__(v24, v25);
  if (v29)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v30 = 0;
      v2 = 0;
      goto LABEL_80;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v193, "userInterfaceIdiom") != 1)
    {
      v2 = 0;
      v30 = 1;
      goto LABEL_80;
    }
  }
  v30 = v29 ^ 1;
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v190, "_referenceBounds");
  }
  v2 = v13 ^ 1;
  BSSizeRoundForScale();
  if (v34 >= *(double *)(MEMORY[0x1E0DAB260] + 264))
  {
    *(_QWORD *)&v213[28] = __PAIR64__(v30, v2);
    LODWORD(v214) = 0;
    memset(v213, 0, 28);
    memset(v212, 0, sizeof(v212));
    v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    v207 = 0;
    v209 = 0;
    v203 = 0;
    v205 = 0;
    v201 = 0;
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FAC8;
    goto LABEL_241;
  }
LABEL_80:
  v35 = __sb__runningInSpringBoard();
  *(_QWORD *)&v213[28] = __PAIR64__(v30, v2);
  if (v35)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      v9 = 0;
      LODWORD(v214) = 0;
      goto LABEL_100;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v192, "userInterfaceIdiom") != 1)
    {
      LODWORD(v214) = 0;
      v9 = 1;
      goto LABEL_100;
    }
  }
  v9 = v35 ^ 1u;
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v188, "_referenceBounds");
  }
  LODWORD(v214) = v13 ^ 1;
  BSSizeRoundForScale();
  if (v54 >= *(double *)(MEMORY[0x1E0DAB260] + 248))
  {
    *(_DWORD *)&v213[24] = v9;
    memset(v213, 0, 24);
    memset(v212, 0, sizeof(v212));
    v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    v207 = 0;
    v209 = 0;
    v203 = 0;
    v205 = 0;
    v201 = 0;
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FAB8;
    goto LABEL_241;
  }
LABEL_100:
  v55 = __sb__runningInSpringBoard();
  *(_DWORD *)&v213[24] = v9;
  if (v55)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(_QWORD *)&v213[16] = 0;
      goto LABEL_364;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v191, "userInterfaceIdiom") != 1)
    {
      *(_DWORD *)&v213[16] = 0;
      *(_DWORD *)&v213[20] = 1;
      goto LABEL_364;
    }
  }
  *(_DWORD *)&v213[20] = v55 ^ 1;
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "_referenceBounds");
  }
  *(_DWORD *)&v213[16] = v13 ^ 1;
  BSSizeRoundForScale();
  if (v70 >= *(double *)(MEMORY[0x1E0DAB260] + 232))
  {
    *(_QWORD *)v213 = 0;
    *(_QWORD *)&v213[8] = 0;
    memset(v212, 0, sizeof(v212));
    v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    v207 = 0;
    v209 = 0;
    v203 = 0;
    v205 = 0;
    v201 = 0;
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FAB0;
    goto LABEL_241;
  }
LABEL_364:
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    if (SBFEffectiveDeviceClass() != 2)
      goto LABEL_366;
LABEL_372:
    *(_QWORD *)v213 = 0;
    *(_DWORD *)&v213[8] = 0;
    memset(v212, 0, sizeof(v212));
    v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    v207 = 0;
    v209 = 0;
    v203 = 0;
    v205 = 0;
    v201 = 0;
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FAA0;
    *(_DWORD *)&v213[12] = v13 ^ 1;
    goto LABEL_241;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v189, "userInterfaceIdiom") == 1)
    goto LABEL_372;
LABEL_366:
  *(_DWORD *)&v213[12] = v13 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_370:
    *(_QWORD *)v213 = 0;
    goto LABEL_408;
  }
  v71 = __sb__runningInSpringBoard();
  if (v71)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_370;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v182, "userInterfaceIdiom"))
    {
      *(_QWORD *)v213 = 1;
      goto LABEL_408;
    }
  }
  *(_DWORD *)v213 = v71 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v175, "_referenceBounds");
    }
    *(_DWORD *)&v213[4] = v13 ^ 1;
    BSSizeRoundForScale();
    if (v77 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
    {
      *(_DWORD *)&v213[8] = 0;
      memset(v212, 0, sizeof(v212));
      v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      v207 = 0;
      v209 = 0;
      v203 = 0;
      v205 = 0;
      v201 = 0;
      v199 = 0;
      v197 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FA80;
      goto LABEL_241;
    }
  }
  else
  {
    *(_DWORD *)&v213[4] = 0;
  }
LABEL_408:
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v213[8] = 0;
      *(_DWORD *)&v212[48] = 0;
      goto LABEL_418;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v183, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v212[48] = 0;
      *(_DWORD *)&v213[8] = 1;
      goto LABEL_418;
    }
  }
  *(_DWORD *)&v213[8] = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v178, "_referenceBounds");
    }
    *(_DWORD *)&v212[48] = v13 ^ 1;
    BSSizeRoundForScale();
    if (v74 >= *(double *)(MEMORY[0x1E0DAB260] + 200))
      goto LABEL_422;
  }
  else
  {
    *(_DWORD *)&v212[48] = 0;
  }
LABEL_418:
  if ((_SBF_Private_IsD94Like() & 1) != 0)
  {
    memset(v212, 0, 48);
    v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    v207 = 0;
    v209 = 0;
    v203 = 0;
    v205 = 0;
    v201 = 0;
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FA88;
    goto LABEL_241;
  }
LABEL_422:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_426:
    *(_QWORD *)&v212[40] = 0;
    goto LABEL_473;
  }
  v75 = __sb__runningInSpringBoard();
  if (v75)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_426;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v179, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v212[40] = 0;
      *(_DWORD *)&v212[44] = 1;
      goto LABEL_473;
    }
  }
  *(_DWORD *)&v212[44] = v75 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v170 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v170, "_referenceBounds");
    }
    *(_DWORD *)&v212[40] = v13 ^ 1;
    BSSizeRoundForScale();
    if (v87 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      memset(v212, 0, 40);
      v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      v207 = 0;
      v209 = 0;
      v203 = 0;
      v205 = 0;
      v201 = 0;
      v199 = 0;
      v197 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FA90;
      goto LABEL_241;
    }
  }
  else
  {
    *(_DWORD *)&v212[40] = 0;
  }
LABEL_473:
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v212[36] = 0;
      *(_DWORD *)&v212[28] = 0;
      goto LABEL_483;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v181, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v212[28] = 0;
      *(_DWORD *)&v212[36] = 1;
      goto LABEL_483;
    }
  }
  *(_DWORD *)&v212[36] = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v174, "_referenceBounds");
    }
    *(_DWORD *)&v212[28] = v13 ^ 1;
    BSSizeRoundForScale();
    if (v81 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_487;
  }
  else
  {
    *(_DWORD *)&v212[28] = 0;
  }
LABEL_483:
  if ((_SBF_Private_IsD64Like() & 1) != 0)
  {
    *(_DWORD *)&v212[32] = 0;
    memset(v212, 0, 28);
    v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    v207 = 0;
    v209 = 0;
    v203 = 0;
    v205 = 0;
    v201 = 0;
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FA98;
    goto LABEL_241;
  }
LABEL_487:
  v82 = __sb__runningInSpringBoard();
  if (v82)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v212[32] = 0;
      *(_DWORD *)&v212[24] = 0;
      goto LABEL_497;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v180, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v212[24] = 0;
      *(_DWORD *)&v212[32] = 1;
      goto LABEL_497;
    }
  }
  *(_DWORD *)&v212[32] = v82 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v83 = __sb__runningInSpringBoard();
    if (v83)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v171, "_referenceBounds");
    }
    v13 = v83 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v212[24] = v13;
    if (v85 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
    {
      memset(v212, 0, 24);
      v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      v207 = 0;
      v209 = 0;
      v203 = 0;
      v205 = 0;
      v201 = 0;
      v199 = 0;
      v197 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FA70;
      goto LABEL_241;
    }
  }
  else
  {
    *(_DWORD *)&v212[24] = 0;
  }
LABEL_497:
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v212[12] = 0;
      *(_DWORD *)v212 = 0;
      goto LABEL_513;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v177, "userInterfaceIdiom"))
    {
      *(_DWORD *)v212 = 0;
      *(_DWORD *)&v212[12] = 1;
      goto LABEL_513;
    }
  }
  *(_DWORD *)&v212[12] = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v169, "_referenceBounds");
    }
    *(_DWORD *)v212 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v90 >= *(double *)(MEMORY[0x1E0DAB260] + 136))
      goto LABEL_537;
  }
  else
  {
    *(_DWORD *)v212 = 0;
  }
LABEL_513:
  if ((_SBF_Private_IsD54() & 1) != 0)
  {
    *(_QWORD *)&v212[16] = 0;
    *(_QWORD *)&v212[4] = 0;
    v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    v207 = 0;
    v209 = 0;
    v203 = 0;
    v205 = 0;
    v201 = 0;
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FA78;
    goto LABEL_241;
  }
LABEL_537:
  v91 = __sb__runningInSpringBoard();
  if (v91)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v212[16] = 0;
      goto LABEL_557;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v176, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v212[16] = 0;
      *(_DWORD *)&v212[20] = 1;
      goto LABEL_557;
    }
  }
  *(_DWORD *)&v212[20] = v91 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v93 = __sb__runningInSpringBoard();
    if (v93)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v166, "_referenceBounds");
    }
    v13 = v93 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v212[16] = v13;
    if (v95 >= *(double *)(MEMORY[0x1E0DAB260] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
    {
      *(_QWORD *)&v212[4] = 0;
      v211 = 0uLL;
      memset(v210, 0, sizeof(v210));
      v207 = 0;
      v209 = 0;
      v203 = 0;
      v205 = 0;
      v201 = 0;
      v199 = 0;
      v197 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FA40;
      goto LABEL_241;
    }
  }
  else
  {
    *(_DWORD *)&v212[16] = 0;
  }
LABEL_557:
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_QWORD *)&v212[4] = 0;
      goto LABEL_574;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v173, "userInterfaceIdiom"))
    {
      *(_DWORD *)&v212[4] = 0;
      *(_DWORD *)&v212[8] = 1;
      goto LABEL_574;
    }
  }
  *(_DWORD *)&v212[8] = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v165, "_referenceBounds");
    }
    *(_DWORD *)&v212[4] = v13 ^ 1;
    BSSizeRoundForScale();
    if (v98 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_596;
  }
  else
  {
    *(_DWORD *)&v212[4] = 0;
  }
LABEL_574:
  if (_SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice() & 1) != 0)
  {
    v211 = 0uLL;
    memset(v210, 0, sizeof(v210));
    v207 = 0;
    v209 = 0;
    v203 = 0;
    v205 = 0;
    v201 = 0;
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FA48;
    goto LABEL_241;
  }
LABEL_596:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_600:
    *(_QWORD *)&v211 = 0;
    goto LABEL_632;
  }
  v99 = __sb__runningInSpringBoard();
  if (v99)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_600;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v168, "userInterfaceIdiom"))
    {
      *(_QWORD *)&v211 = 0x100000000;
      goto LABEL_632;
    }
  }
  DWORD1(v211) = v99 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v105 = __sb__runningInSpringBoard();
    if (v105)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v159, "_referenceBounds");
    }
    v13 = v105 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v211) = v13;
    if (v111 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
    {
      *((_QWORD *)&v211 + 1) = 0;
      memset(v210, 0, sizeof(v210));
      v207 = 0;
      v209 = 0;
      v203 = 0;
      v205 = 0;
      v201 = 0;
      v199 = 0;
      v197 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FA30;
      goto LABEL_241;
    }
  }
  else
  {
    LODWORD(v211) = 0;
  }
LABEL_632:
  v106 = __sb__runningInSpringBoard();
  if (v106)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v211) = 0;
      v13 = 0;
      goto LABEL_642;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v172, "userInterfaceIdiom"))
    {
      v13 = 0;
      HIDWORD(v211) = 1;
      goto LABEL_642;
    }
  }
  HIDWORD(v211) = v106 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v107 = __sb__runningInSpringBoard();
    if (v107)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v162 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v162, "_referenceBounds");
    }
    v13 = v107 ^ 1u;
    BSSizeRoundForScale();
    if (v108 >= *(double *)(MEMORY[0x1E0DAB260] + 184))
      goto LABEL_646;
  }
  else
  {
    v13 = 0;
  }
LABEL_642:
  if ((_SBF_Private_IsD93Like() & 1) != 0)
  {
    DWORD2(v211) = v13;
    memset(v210, 0, sizeof(v210));
    v207 = 0;
    v209 = 0;
    v203 = 0;
    v205 = 0;
    v201 = 0;
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FA38;
    goto LABEL_241;
  }
LABEL_646:
  DWORD2(v211) = v13;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_650:
    *(_QWORD *)v210 = 0;
    goto LABEL_697;
  }
  v109 = __sb__runningInSpringBoard();
  if (v109)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      goto LABEL_650;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v163, "userInterfaceIdiom"))
    {
      *(_QWORD *)v210 = 0x100000000;
      goto LABEL_697;
    }
  }
  *(_DWORD *)&v210[4] = v109 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v155, "_referenceBounds");
    }
    *(_DWORD *)v210 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v121 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      *(_DWORD *)&v210[8] = 0;
      v207 = 0;
      v209 = 0;
      v203 = 0;
      v205 = 0;
      v201 = 0;
      v199 = 0;
      v197 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FA60;
      goto LABEL_241;
    }
  }
  else
  {
    *(_DWORD *)v210 = 0;
  }
LABEL_697:
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v210[8] = 0;
      HIDWORD(v209) = 0;
      goto LABEL_707;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v167, "userInterfaceIdiom"))
    {
      HIDWORD(v209) = 0;
      *(_DWORD *)&v210[8] = 1;
      goto LABEL_707;
    }
  }
  *(_DWORD *)&v210[8] = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v158, "_referenceBounds");
    }
    HIDWORD(v209) = v13 ^ 1;
    BSSizeRoundForScale();
    if (v115 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_711;
  }
  else
  {
    HIDWORD(v209) = 0;
  }
LABEL_707:
  if ((_SBF_Private_IsD63Like() & 1) != 0)
  {
    LODWORD(v209) = 0;
    v203 = 0;
    v205 = 0;
    v207 = 0;
    v201 = 0;
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FA68;
    goto LABEL_241;
  }
LABEL_711:
  v116 = __sb__runningInSpringBoard();
  if (v116)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v209) = 0;
      HIDWORD(v203) = 0;
      goto LABEL_721;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v164, "userInterfaceIdiom"))
    {
      HIDWORD(v203) = 0;
      LODWORD(v209) = 1;
      goto LABEL_721;
    }
  }
  LODWORD(v209) = v116 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v117 = __sb__runningInSpringBoard();
    if (v117)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "_referenceBounds");
    }
    v13 = v117 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v203) = v13;
    if (v119 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
    {
      v205 = 0;
      v207 = 0;
      LODWORD(v203) = 0;
      v201 = 0;
      v199 = 0;
      v197 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FA50;
      goto LABEL_241;
    }
  }
  else
  {
    HIDWORD(v203) = 0;
  }
LABEL_721:
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v207 = 0;
      goto LABEL_737;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v161, "userInterfaceIdiom"))
    {
      v207 = 0x100000000;
      goto LABEL_737;
    }
  }
  HIDWORD(v207) = v13 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "_referenceBounds");
    }
    LODWORD(v207) = v13 ^ 1;
    BSSizeRoundForScale();
    if (v124 >= *(double *)(MEMORY[0x1E0DAB260] + 120))
      goto LABEL_761;
  }
  else
  {
    LODWORD(v207) = 0;
  }
LABEL_737:
  if ((_SBF_Private_IsD33OrSimilarDevice() & 1) != 0)
  {
    v205 = 0;
    LODWORD(v203) = 0;
    v201 = 0;
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FA58;
    goto LABEL_241;
  }
LABEL_761:
  v125 = __sb__runningInSpringBoard();
  if (v125)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v205) = 0;
      LODWORD(v203) = 0;
      goto LABEL_781;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v160, "userInterfaceIdiom"))
    {
      LODWORD(v203) = 0;
      HIDWORD(v205) = 1;
      goto LABEL_781;
    }
  }
  HIDWORD(v205) = v125 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "_referenceBounds");
    }
    LODWORD(v203) = v13 ^ 1;
    BSSizeRoundForScale();
    if (v129 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
    {
      v201 = 0;
      LODWORD(v205) = 0;
      v199 = 0;
      v197 = 0;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FA20;
      goto LABEL_241;
    }
  }
  else
  {
    LODWORD(v203) = 0;
  }
LABEL_781:
  v126 = __sb__runningInSpringBoard();
  if (v126)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v201 = 0;
      v13 = 0;
      goto LABEL_797;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v157, "userInterfaceIdiom"))
    {
      v13 = 0;
      v201 = 1;
      goto LABEL_797;
    }
  }
  v201 = v126 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v127 = __sb__runningInSpringBoard();
    if (v127)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "_referenceBounds");
    }
    v13 = v127 ^ 1u;
    BSSizeRoundForScale();
    if (v131 >= *(double *)(MEMORY[0x1E0DAB260] + 104))
      goto LABEL_819;
  }
  else
  {
    v13 = 0;
  }
LABEL_797:
  if ((_SBF_Private_IsD53() & 1) != 0)
  {
    LODWORD(v205) = v13;
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FA28;
    goto LABEL_241;
  }
LABEL_819:
  LODWORD(v205) = v13;
  if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FA00;
    goto LABEL_241;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0)
  {
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048FA08;
    goto LABEL_241;
  }
  if ((_SBF_Private_IsD52OrSimilarDevice() & 1) != 0)
  {
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048F9F0;
    goto LABEL_241;
  }
  if ((_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
  {
    v199 = 0;
    v197 = 0;
    v45 = 0;
    v46 = 0;
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048F9F8;
    goto LABEL_241;
  }
  v133 = __sb__runningInSpringBoard();
  if (v133)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v199 = 0;
      v197 = 0;
      goto LABEL_855;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v151, "userInterfaceIdiom"))
    {
      v197 = 0;
      v199 = 1;
      goto LABEL_855;
    }
  }
  v199 = v133 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v149, "_referenceBounds");
    }
    v197 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v141 >= *(double *)(MEMORY[0x1E0DAB260] + 88))
    {
      v45 = 0;
      v46 = 0;
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FA10;
      goto LABEL_241;
    }
  }
  else
  {
    v197 = 0;
  }
LABEL_855:
  v135 = __sb__runningInSpringBoard();
  if (v135)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v45 = 0;
      v46 = 0;
      goto LABEL_875;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v150, "userInterfaceIdiom"))
    {
      v46 = 0;
      v45 = 1;
      goto LABEL_875;
    }
  }
  v45 = v135 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    v13 = __sb__runningInSpringBoard();
    if ((_DWORD)v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "_referenceBounds");
    }
    v46 = v13 ^ 1;
    BSSizeRoundForScale();
    if (v143 >= *(double *)(MEMORY[0x1E0DAB260] + 72))
    {
      v47 = 0;
      v48 = 0;
      v49 = 0;
      v50 = 0;
      v51 = &qword_1D048FA18;
      goto LABEL_241;
    }
  }
  else
  {
    v46 = 0;
  }
LABEL_875:
  v137 = __sb__runningInSpringBoard();
  if (v137)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v47 = 0;
      v48 = 0;
      goto LABEL_896;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v11 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v11, "userInterfaceIdiom"))
    {
      v48 = 0;
      v47 = 1;
      goto LABEL_896;
    }
  }
  v47 = v137 ^ 1;
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v9, "_referenceBounds");
  }
  v48 = v13 ^ 1;
  BSSizeRoundForScale();
  if (v139 >= *(double *)(MEMORY[0x1E0DAB260] + 56))
  {
    v49 = 0;
    v50 = 0;
    v51 = &qword_1D048F9E8;
    goto LABEL_241;
  }
LABEL_896:
  v13 = __sb__runningInSpringBoard();
  if ((_DWORD)v13)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v49 = 0;
      v50 = 0;
LABEL_925:
      v51 = &CSQuickActionButtonInsetX;
      goto LABEL_241;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v2 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)v2, "userInterfaceIdiom"))
    {
      v50 = 0;
      v49 = 1;
      goto LABEL_925;
    }
  }
  v49 = v13 ^ 1;
  v146 = __sb__runningInSpringBoard();
  if (v146)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v13, "_referenceBounds");
  }
  v50 = v146 ^ 1;
  BSSizeRoundForScale();
  if (v147 < *(double *)(MEMORY[0x1E0DAB260] + 40))
    goto LABEL_925;
  v51 = &qword_1D048F9E0;
LABEL_241:
  v65 = *(double *)v51;
  if (v50)

  if (v49)
  if (v48)

  if (v47)
  if (v46)

  if (v45)
  if (v197)

  if (v199)
  if ((_DWORD)v205)

  if (v201)
  if ((_DWORD)v203)

  if (HIDWORD(v205))
  if ((_DWORD)v207)

  if (HIDWORD(v207))
  if (HIDWORD(v203))

  if ((_DWORD)v209)
  if (HIDWORD(v209))

  if (*(_DWORD *)&v210[8])
  if (*(_DWORD *)v210)

  if (*(_DWORD *)&v210[4])
  if (DWORD2(v211))

  if (HIDWORD(v211))
  if ((_DWORD)v211)

  if (DWORD1(v211))
  if (*(_DWORD *)&v212[4])

  if (*(_DWORD *)&v212[8])
  if (*(_DWORD *)&v212[16])

  if (*(_DWORD *)&v212[20])
  if (*(_DWORD *)v212)

  if (*(_DWORD *)&v212[12])
  if (*(_DWORD *)&v212[24])

  if (*(_DWORD *)&v212[32])
  if (*(_DWORD *)&v212[28])

  if (*(_DWORD *)&v212[36])
  if (*(_DWORD *)&v212[40])

  if (*(_DWORD *)&v212[44])
  if (*(_DWORD *)&v212[48])

  if (*(_DWORD *)&v213[8])
  if (*(_DWORD *)&v213[4])

  if (*(_DWORD *)v213)
  if (*(_DWORD *)&v213[12])

  if (*(_DWORD *)&v213[16])
  if (*(_DWORD *)&v213[20])

  if ((_DWORD)v214)
  {

    if (!*(_DWORD *)&v213[24])
      goto LABEL_329;
  }
  else if (!*(_DWORD *)&v213[24])
  {
LABEL_329:
    if (*(_DWORD *)&v213[28])
      goto LABEL_330;
    goto LABEL_340;
  }

  if (*(_DWORD *)&v213[28])
  {
LABEL_330:

    if (!*(_DWORD *)&v213[32])
      goto LABEL_331;
    goto LABEL_341;
  }
LABEL_340:
  if (!*(_DWORD *)&v213[32])
  {
LABEL_331:
    if (*(_DWORD *)&v213[36])
      goto LABEL_332;
    goto LABEL_342;
  }
LABEL_341:

  if (*(_DWORD *)&v213[36])
  {
LABEL_332:

    if (!*(_DWORD *)&v213[40])
      goto LABEL_333;
    goto LABEL_343;
  }
LABEL_342:
  if (!*(_DWORD *)&v213[40])
  {
LABEL_333:
    if (*(_DWORD *)&v213[44])
      goto LABEL_334;
    goto LABEL_344;
  }
LABEL_343:

  if (*(_DWORD *)&v213[44])
  {
LABEL_334:

    if (!*(_DWORD *)&v213[48])
      goto LABEL_335;
    goto LABEL_345;
  }
LABEL_344:
  if (!*(_DWORD *)&v213[48])
  {
LABEL_335:
    if (HIDWORD(v214))
      goto LABEL_336;
    goto LABEL_346;
  }
LABEL_345:

  if (HIDWORD(v214))
  {
LABEL_336:

    if (!v215)
      return v65;
    goto LABEL_347;
  }
LABEL_346:
  if (v215)
LABEL_347:

  return v65;
}

- (UIEdgeInsets)_buttonOutsets
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
  double v12;
  double v13;
  UIEdgeInsets result;

  -[CSDashBoardQuickActionsButtonSettings topOutset](self->_quickActionsSettings, "topOutset");
  v4 = v3;
  -[CSDashBoardQuickActionsButtonSettings leadingOutset](self->_quickActionsSettings, "leadingOutset");
  v6 = v5;
  -[CSDashBoardQuickActionsButtonSettings bottomOutset](self->_quickActionsSettings, "bottomOutset");
  v8 = v7;
  -[CSDashBoardQuickActionsButtonSettings trailingOutset](self->_quickActionsSettings, "trailingOutset");
  v10 = v9;
  v11 = v4;
  v12 = v6;
  v13 = v8;
  result.right = v10;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)_setButtonBackgroundVisible:(BOOL)a3
{
  void *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorWithAlphaComponent:", 0.35);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_buttons;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "setBackgroundColor:", v5, (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)_prototypingAllowsButtons
{
  return -[CSDashBoardQuickActionsButtonSettings showsButtons](self->_quickActionsSettings, "showsButtons");
}

- (BOOL)shouldAllowClickInteraction:(id)a3 toBeginForButton:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  BOOL v13;

  v5 = a3;
  -[CSQuickActionsView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v6, "shouldTouchesBeginForClick:", v5))
  {
    v13 = 0;
  }
  else if (-[CSDashBoardQuickActionsButtonSettings usesStrictTouchAllowance](self->_quickActionsSettings, "usesStrictTouchAllowance"))
  {
    -[CSQuickActionsView coordinateSpace](self, "coordinateSpace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationInCoordinateSpace:", v7);
    v9 = v8;
    v11 = v10;

    objc_msgSend(v5, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[CSQuickActionsView strictlyInterpretsLocationAsContent:inView:](self, "strictlyInterpretsLocationAsContent:inView:", v12, v9, v11);

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_quickActionsSettings == a3)
  {
    -[CSQuickActionsView refreshSupportedButtons](self, "refreshSupportedButtons");
    -[CSQuickActionsView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  -[CSQuickActionsView animatedLayerProperties](self, "animatedLayerProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CSQuickActionsView;
    v7 = -[CSQuickActionsView _shouldAnimatePropertyWithKey:](&v9, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v7;
}

- (NSArray)animatedLayerProperties
{
  return self->animatedLayerProperties;
}

- (void)setAnimatedLayerProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (CSQuickActionsDelegate)delegate
{
  return (CSQuickActionsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)controlsActions
{
  return self->_controlsActions;
}

- (NSArray)buttonActions
{
  return self->_buttonActions;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)actionsVisible
{
  return self->_actionsVisible;
}

- (CSDashBoardQuickActionsButtonSettings)quickActionsSettings
{
  return self->_quickActionsSettings;
}

- (void)setQuickActionsSettings:(id)a3
{
  objc_storeStrong((id *)&self->_quickActionsSettings, a3);
}

- (CSProminentButtonsView)buttonContainerView
{
  return self->_buttonContainerView;
}

- (void)setButtonContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonContainerView, a3);
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (void)setButtons:(id)a3
{
  objc_storeStrong((id *)&self->_buttons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_buttonContainerView, 0);
  objc_storeStrong((id *)&self->_quickActionsSettings, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_buttonActions, 0);
  objc_storeStrong((id *)&self->_controlsActions, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->animatedLayerProperties, 0);
  objc_storeStrong((id *)&self->_luminanceMap, 0);
  objc_storeStrong((id *)&self->_miscellaneousDefaults, 0);
}

@end
