@implementation LPCaptionBarButtonView

- (LPCaptionBarButtonView)initWithHost:(id)a3
{

  return 0;
}

- (LPCaptionBarButtonView)initWithHost:(id)a3 properties:(id)a4 style:(id)a5
{
  id v8;
  id v9;
  id v10;
  LPCaptionBarButtonView *v11;
  LPCaptionBarButtonView *v12;
  LPCaptionBarButtonView *v13;
  id *p_properties;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  UIButton *collapsedButton;
  LPCaptionBarButtonView *v24;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)LPCaptionBarButtonView;
  v11 = -[LPComponentView initWithHost:](&v26, sel_initWithHost_, v8);
  v12 = v11;
  v13 = v11;
  if (!v11)
    goto LABEL_12;
  p_properties = (id *)&v11->_properties;
  objc_storeStrong((id *)&v11->_properties, a4);
  objc_storeStrong((id *)&v12->_style, a5);
  objc_msgSend(*p_properties, "actions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v15, "count") < 2)
  {

    goto LABEL_6;
  }
  v16 = -[LPButtonStyle useSegmentedControl](v12->_style, "useSegmentedControl");

  if (!v16)
  {
LABEL_6:
    -[LPCaptionBarButtonView createButton](v13, "createButton");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = 440;
    goto LABEL_7;
  }
  -[LPCaptionBarButtonView createSegmentedControl](v13, "createSegmentedControl");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = 456;
LABEL_7:
  v19 = (uint64_t *)((char *)v12 + v18);
  v20 = (void *)*v19;
  *v19 = v17;

  -[LPCaptionBarButtonView addSubview:](v13, "addSubview:", *v19);
  objc_msgSend(*p_properties, "collapsedButton");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[LPCaptionBarButtonView createCollapsedButton](v13, "createCollapsedButton");
    v22 = objc_claimAutoreleasedReturnValue();
    collapsedButton = v13->_collapsedButton;
    v13->_collapsedButton = (UIButton *)v22;

    -[LPCaptionBarButtonView addSubview:](v13, "addSubview:", v13->_collapsedButton);
  }
  if (-[LPCaptionBarButtonView shouldShowDownloadingIndicator](v13, "shouldShowDownloadingIndicator"))
    -[LPCaptionBarButtonView createProgressIndicator](v13, "createProgressIndicator");
  -[UIView _lp_setClipsToBounds:](v13, "_lp_setClipsToBounds:", 0);
  v24 = v13;
LABEL_12:

  return v13;
}

- (void)layoutComponentView
{
  _BOOL8 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL8 v12;
  UIButton *collapsedButton;
  double v14;
  int v15;
  UIButton *button;
  double v17;
  _QWORD v18[5];

  if (self->_collapsed)
  {
    -[UIButton setFrame:](self->_button, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v3 = self->_collapsed || self->_progressIndicator != 0;
    -[UIButton setHidden:](self->_button, "setHidden:", v3);
    -[LPCaptionBarButtonView bounds](self, "bounds");
    -[UIButton setFrame:](self->_collapsedButton, "setFrame:");
    -[UIButton setHidden:](self->_collapsedButton, "setHidden:", !self->_collapsed);
    collapsedButton = self->_collapsedButton;
    -[UIButton frame](collapsedButton, "frame");
    -[UIButton _lp_setCornerRadius:](collapsedButton, "_lp_setCornerRadius:", v14 * 0.5);
  }
  else
  {
    v4 = *MEMORY[0x1E0DC49E8];
    v5 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v6 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v7 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    -[LPCaptionBarButtonView bounds](self, "bounds");
    -[UIButton setFrame:](self->_button, "setFrame:", v8 - v5, v9 - v4, v10 - (-v7 - v5), v11 - (-v6 - v4));
    v12 = self->_collapsed || self->_progressIndicator != 0;
    -[UIButton setHidden:](self->_button, "setHidden:", v12);
    -[UIButton setFrame:](self->_collapsedButton, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIButton setHidden:](self->_collapsedButton, "setHidden:", !self->_collapsed);
    -[LPCaptionBarButtonView bounds](self, "bounds");
    -[UISegmentedControl setFrame:](self->_segmentedControl, "setFrame:");
    if (self->_progressIndicator)
    {
      -[UIButton frame](self->_button, "frame");
      -[LPCircularProgressIndicator setFrame:](self->_progressIndicator, "setFrame:");
    }
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __45__LPCaptionBarButtonView_layoutComponentView__block_invoke;
    v18[3] = &unk_1E44AA6D0;
    v18[4] = self;
    v15 = __45__LPCaptionBarButtonView_layoutComponentView__block_invoke((uint64_t)v18);
    button = self->_button;
    -[UIButton frame](button, "frame");
    -[UIButton _lp_setCornerRadius:](button, "_lp_setCornerRadius:", v17 / (double)v15);
  }
}

uint64_t __45__LPCaptionBarButtonView_layoutComponentView__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "shape");
  if (v2 == 2)
    return 4;
  if (v2 == 1)
    return 2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "configuration");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    return 4;
  v5 = (void *)v4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributedTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    return 4;
  else
    return 2;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  UISegmentedControl *segmentedControl;
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
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  CGSize result;

  segmentedControl = self->_segmentedControl;
  if (segmentedControl)
  {
    -[UISegmentedControl systemLayoutSizeFittingSize:](segmentedControl, "systemLayoutSizeFittingSize:", a3.width, a3.height);
    v6 = v5;
    v8 = v7;
  }
  else
  {
    -[UIButton systemLayoutSizeFittingSize:](self->_button, "systemLayoutSizeFittingSize:", a3.width, a3.height);
    v6 = v9;
    v8 = v10;
    -[UIButton menu](self->_button, "menu");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[LPButtonStyle indicatorSpacing](self->_style, "indicatorSpacing");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "value");
      v14 = v13;

      -[LPButtonStyle menuMinimumWidth](self->_style, "menuMinimumWidth");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "value");
      v6 = fmax(v6 + v14, v16);

    }
    -[UIButton configuration](self->_button, "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      if (!-[LPCaptionBarButtonView _menuButtonShowsSingleImage](self, "_menuButtonShowsSingleImage"))
      {
        -[LPButtonStyle additionalVerticalPadding](self->_style, "additionalVerticalPadding");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "value");
        v8 = v8 + v19;

      }
      -[UIButton configuration](self->_button, "configuration");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "attributedTitle");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        -[LPCaptionButtonPresentationProperties minimumWidth](self->_properties, "minimumWidth");
        if (v22 == 0.0)
        {
          -[LPButtonStyle minimumWidth](self->_style, "minimumWidth");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "value");
          v6 = fmax(v6, v24);

        }
        else
        {
          v6 = fmax(v6, v22);
        }
      }
      else
      {
        v6 = v8;
      }
    }
    if (-[LPCaptionBarButtonView hasAnyText](self, "hasAnyText"))
    {
      -[LPButtonStyle minimumWidth](self->_style, "minimumWidth");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "value");
      v27 = v26;

      -[LPButtonStyle height](self->_style, "height");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "value");
      v30 = v29;
      if (v29 == 0.0)
      {
        -[LPButtonStyle minimumHeight](self->_style, "minimumHeight");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "value");
        v30 = v32;

      }
      v6 = fmax(v6, v27);

      if (v30 != 0.0)
        v8 = fmax(v8, v30);
    }
  }
  v33 = v6;
  v34 = v8;
  result.height = v34;
  result.width = v33;
  return result;
}

- (BOOL)hasAnyText
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[LPCaptionButtonPresentationProperties text](self->_properties, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

    return 1;
  }
  -[LPCaptionButtonPresentationProperties attributedText](self->_properties, "attributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    return 1;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[LPCaptionButtonPresentationProperties actions](self->_properties, "actions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "visibleTitle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {

          return 1;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }

  return 0;
}

- (CGSize)collapsedSizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIButton systemLayoutSizeFittingSize:](self->_collapsedButton, "systemLayoutSizeFittingSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)addTarget:(id)a3 action:(SEL)a4
{
  id v6;

  v6 = a3;
  -[UIButton addTarget:action:forControlEvents:](self->_button, "addTarget:action:forControlEvents:");
  -[UIButton addTarget:action:forControlEvents:](self->_collapsedButton, "addTarget:action:forControlEvents:", v6, a4, 0x2000);

}

- (void)removeTarget:(id)a3 action:(SEL)a4
{
  id v6;

  v6 = a3;
  -[UIButton removeTarget:action:forControlEvents:](self->_button, "removeTarget:action:forControlEvents:");
  -[UIButton removeTarget:action:forControlEvents:](self->_collapsedButton, "removeTarget:action:forControlEvents:", v6, a4, 0x2000);

}

- (void)createProgressIndicator
{
  LPCircularProgressIndicator *v3;
  void *v4;
  void *v5;
  LPCircularProgressIndicator *v6;
  LPCircularProgressIndicator *progressIndicator;

  v3 = [LPCircularProgressIndicator alloc];
  -[LPComponentView host](self, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPButtonStyle progressIndicatorStyle](self->_style, "progressIndicatorStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LPCircularProgressIndicator initWithHost:style:](v3, "initWithHost:style:", v4, v5);
  progressIndicator = self->_progressIndicator;
  self->_progressIndicator = v6;

  -[LPCaptionBarButtonView addSubview:](self, "addSubview:", self->_progressIndicator);
  -[LPCaptionBarButtonView updateProgressIndicator](self, "updateProgressIndicator");
}

- (void)updateProgressIndicator
{
  void *v3;
  LPCircularProgressIndicator *progressIndicator;
  id v5;

  if (self->_progressIndicator)
  {
    -[LPComponentView host](self, "host");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "downloadProgressForComponentView:", self);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    progressIndicator = self->_progressIndicator;
    objc_msgSend(v5, "progress");
    -[LPCircularProgressIndicator setProgress:](progressIndicator, "setProgress:");

  }
}

- (BOOL)shouldShowDownloadingIndicator
{
  void *v3;
  uint64_t v4;

  -[LPComponentView host](self, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sharedObjectDownloadStateForComponentView:", self);

  return v4 == 1;
}

- (void)selectAction:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[LPCaptionButtonPresentationProperties actions](self->_properties, "actions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setSelected:", 0);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  objc_msgSend(v4, "setSelected:", 1);
}

- (void)performAction:(id)a3
{
  void *v3;
  void (**v4)(void);
  id v5;

  v5 = a3;
  objc_msgSend(v5, "handler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v5, "handler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (id)createSegmentedControl
{
  void *v2;
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v24[6];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[LPCaptionButtonPresentationProperties actions](self->_properties, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3 < 2)
  {
    v18 = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C99DE8];
    -[LPCaptionButtonPresentationProperties actions](self->_properties, "actions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    -[LPCaptionButtonPresentationProperties actions](self->_properties, "actions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v12, "visibleTitle");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13 == 0;

          if (!v14)
          {
            if (objc_msgSend(v12, "isSelected"))
              v8 = objc_msgSend(v6, "count");
            v15 = (void *)MEMORY[0x1E0DC3428];
            objc_msgSend(v12, "visibleTitle");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __48__LPCaptionBarButtonView_createSegmentedControl__block_invoke;
            v24[3] = &unk_1E44AA6F8;
            v24[4] = self;
            v24[5] = v12;
            objc_msgSend(v15, "actionWithTitle:image:identifier:handler:", v16, 0, 0, v24);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v17);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v9);
    }

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C58]), "initWithItems:", v6);
    objc_msgSend(v18, "setSelectedSegmentIndex:", v8);
    -[LPCaptionBarButtonView configureSegmentedControl:](self, "configureSegmentedControl:", v18);

  }
  objc_msgSend(v18, "setAccessibilityIgnoresInvertColors:", -[LPButtonStyle ignoresInvertColors](self->_style, "ignoresInvertColors"));
  objc_msgSend(v18, "_setAutosizeText:", 1);
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v18, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPButtonStyle minimumWidth](self->_style, "minimumWidth");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "value");
  objc_msgSend(v19, "constraintGreaterThanOrEqualToConstant:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  return v18;
}

uint64_t __48__LPCaptionBarButtonView_createSegmentedControl__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "selectAction:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "performAction:", *(_QWORD *)(a1 + 40));
}

- (id)createButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  LPPointUnit *v10;
  double v11;
  double v12;
  double v13;
  LPPointUnit *v14;

  -[LPCaptionButtonPresentationProperties actions](self->_properties, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[LPCaptionBarButtonView configureMenuButton:](self, "configureMenuButton:", v4);
  else
    -[LPCaptionBarButtonView configurePillButton:](self, "configurePillButton:", v4);
  -[LPButtonStyle padding](self->_style, "padding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  -[LPCaptionButtonPresentationProperties icon](self->_properties, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[LPCaptionButtonPresentationProperties text](self->_properties, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8 || !v6)
      goto LABEL_9;
    -[LPButtonStyle imagePadding](self->_style, "imagePadding");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = [LPPointUnit alloc];
      objc_msgSend(v6, "leading");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "value");
      v12 = v11;
      -[LPButtonStyle imagePadding](self->_style, "imagePadding");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "value");
      v14 = -[LPPointUnit initWithValue:](v10, "initWithValue:", v12 + v13);
      objc_msgSend(v6, "setLeading:", v14);

LABEL_9:
    }
  }
  objc_msgSend(v6, "asInsetsForLTR:", -[UIView _lp_isLTR](self, "_lp_isLTR"));
  objc_msgSend(v4, "setContentEdgeInsets:");
  objc_msgSend(v4, "setAccessibilityIgnoresInvertColors:", -[LPButtonStyle ignoresInvertColors](self->_style, "ignoresInvertColors"));

  return v4;
}

- (id)createCollapsedButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[LPCaptionButtonPresentationProperties collapsedButton](self->_properties, "collapsedButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v5);

  -[LPCaptionButtonPresentationProperties collapsedButton](self->_properties, "collapsedButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "platformImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:forState:", v8, 0);

  return v3;
}

- (void)configurePillButton:(id)a3
{
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
  double v15;
  double v16;
  _BOOL4 v17;
  double v18;
  double v19;
  void *v20;
  id v21;

  v21 = a3;
  -[LPCaptionButtonPresentationProperties backgroundColor](self->_properties, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    -[LPButtonStyle backgroundColor](self->_style, "backgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v21, "setBackgroundColor:", v5);
  if (!v4)

  -[LPCaptionButtonPresentationProperties attributedText](self->_properties, "attributedText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[LPCaptionButtonPresentationProperties attributedText](self->_properties, "attributedText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAttributedTitle:forState:", v7, 0);
  }
  else
  {
    -[LPButtonStyle font](self->_style, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFont:", v8);

    -[LPCaptionButtonPresentationProperties text](self->_properties, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTitle:forState:", v10, 0);

    -[LPButtonStyle foregroundColor](self->_style, "foregroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTitleColor:forState:", v7, 0);
  }

  objc_msgSend(v21, "setAccessibilityIdentifier:", CFSTR("LPCaptionBarPillButton"));
  -[LPCaptionButtonPresentationProperties icon](self->_properties, "icon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[LPCaptionButtonPresentationProperties icon](self->_properties, "icon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "platformImage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setImage:forState:", v13, 0);

    -[LPButtonStyle imagePadding](self->_style, "imagePadding");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "value");
    v16 = v15;

    v17 = -[UIView _lp_isLTR](self, "_lp_isLTR");
    if (v17)
      v18 = -v16;
    else
      v18 = 0.0;
    if (v17)
      v19 = 0.0;
    else
      v19 = -v16;
    objc_msgSend(v21, "setImageEdgeInsets:", 2.0, v18, 2.0, v19);
    objc_msgSend(v21, "imageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setContentMode:", 1);

  }
  if (-[LPCaptionButtonPresentationProperties disabled](self->_properties, "disabled"))
  {
    objc_msgSend(v21, "setEnabled:", 0);
    +[LPTheme disabledButtonOpacity](LPTheme, "disabledButtonOpacity");
    objc_msgSend(v21, "_lp_setOpacity:");
  }

}

- (void)configureSegmentedControl:(id)a3
{
  objc_msgSend(a3, "setAccessibilityIdentifier:", CFSTR("LPCaptionBarPillButton"));
}

- (void)configureMenuButton:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  id v27;
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
  void *v38;
  void *v39;
  int v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  _BOOL4 v48;
  LPButtonStyle *style;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  _BOOL4 v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  id v63;
  _QWORD v64[4];
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  void *v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v63 = a3;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  -[LPCaptionButtonPresentationProperties actions](self->_properties, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v67;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v67 != v6)
        objc_enumerationMutation(v4);
      v8 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v7);
      if ((objc_msgSend(v8, "isSelected") & 1) != 0)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v62 = v8;

    if (v62)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  -[LPCaptionButtonPresentationProperties actions](self->_properties, "actions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v62 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
  +[LPButtonConfiguration filledButtonConfiguration](LPButtonConfiguration, "filledButtonConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "visibleTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (v12 = -[LPButtonStyle behavior](self->_style, "behavior") == 0, v11, v12))
  {
    v16 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v62, "visibleTitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = *MEMORY[0x1E0DC32A0];
    -[LPButtonStyle menuFont](self->_style, "menuFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v16, "initWithString:attributes:", v17, v19);

    objc_msgSend(v10, "setAttributedTitle:", v15);
  }
  else
  {
    if (-[LPButtonStyle behavior](self->_style, "behavior") != 1)
      goto LABEL_21;
    -[LPCaptionButtonPresentationProperties attributedText](self->_properties, "attributedText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      v20 = objc_alloc(MEMORY[0x1E0CB3498]);
      -[LPCaptionButtonPresentationProperties text](self->_properties, "text");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v20, "initWithString:", v21);

    }
    objc_msgSend(v10, "setAttributedTitle:", v15);
  }

LABEL_21:
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (-[LPCaptionBarButtonView _menuButtonShowsIndicator](self, "_menuButtonShowsIndicator"))
  {
    objc_msgSend(v10, "_dci_setIndicator:", 2);
    objc_msgSend(v63, "setContentHorizontalAlignment:", 4);
  }
  else if (-[LPCaptionBarButtonView _menuButtonShowsChevron](self, "_menuButtonShowsChevron"))
  {
    objc_msgSend(v10, "attributedTitle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23 == 0;

    if (!v24)
    {
      -[LPButtonStyle menuFont](self->_style, "menuFont");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "fontDescriptor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectForKey:", *MEMORY[0x1E0DC4A38]);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3888], "_lp_configurationWithTextStyle:weight:scale:", v60, 6, 1);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_alloc(MEMORY[0x1E0CB3778]);
      objc_msgSend(v10, "attributedTitle");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v27, "initWithAttributedString:", v28);

      v61 = objc_alloc_init(MEMORY[0x1E0DC33D0]);
      +[LPResources chevron](LPResources, "chevron");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "platformImage");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "imageWithConfiguration:", v59);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "imageWithTintColor:", v22);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "setImage:", v33);

      v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
      objc_msgSend(v29, "appendAttributedString:", v34);

      objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v61);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "appendAttributedString:", v35);

      objc_msgSend(v10, "setAttributedTitle:", v29);
    }
  }
  if (!-[LPButtonStyle useSystemButtonAppearance](self->_style, "useSystemButtonAppearance", v59))
  {
    objc_msgSend(v10, "setButtonSize:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBaseForegroundColor:", v36);

    -[LPButtonStyle menuBackgroundColor](self->_style, "menuBackgroundColor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBaseBackgroundColor:", v37);

    objc_msgSend(v10, "baseBackgroundColor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (v40)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
      v41 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v63, "layer");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setBorderWidth:", 1.0);

      objc_msgSend(MEMORY[0x1E0DC3658], "_lp_systemFillColor");
      v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v44 = objc_msgSend(v43, "CGColor");
      objc_msgSend(v63, "layer");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setBorderColor:", v44);

      v22 = (id)v41;
    }
    if (-[LPCaptionBarButtonView _menuButtonShowsIndicator](self, "_menuButtonShowsIndicator"))
    {
      objc_msgSend(v10, "set_lp_indicatorColor:", v22);
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __46__LPCaptionBarButtonView_configureMenuButton___block_invoke;
      v64[3] = &unk_1E44A9E60;
      v22 = v22;
      v65 = v22;
      objc_msgSend(v10, "_dci_setIndicatorColorTransformer:", v64);

    }
  }
  if (-[LPCaptionBarButtonView _menuButtonShowsImages](self, "_menuButtonShowsImages"))
  {
    objc_msgSend(v62, "visibleImage");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "platformImage");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v47);

    if (!-[LPButtonStyle useSystemButtonAppearance](self->_style, "useSystemButtonAppearance"))
    {
      v48 = -[LPCaptionBarButtonView _menuButtonShowsSingleImage](self, "_menuButtonShowsSingleImage");
      style = self->_style;
      if (v48)
      {
        -[LPButtonStyle symbolConfiguration](style, "symbolConfiguration");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setPreferredSymbolConfigurationForImage:", v50);
      }
      else
      {
        -[LPButtonStyle menuFont](style, "menuFont");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "fontDescriptor");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "objectForKey:", *MEMORY[0x1E0DC4A38]);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", v50, 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setPreferredSymbolConfigurationForImage:", v53);

      }
    }
    objc_msgSend(v10, "setImagePadding:", 4.0);
  }
  objc_msgSend(v63, "setConfiguration:", v10);
  if (-[LPCaptionBarButtonView _menuButtonShowsSingleImage](self, "_menuButtonShowsSingleImage")
    || -[LPButtonStyle prefersBehavioralStylePad](self->_style, "prefersBehavioralStylePad"))
  {
    objc_msgSend(v63, "setPreferredBehavioralStyle:", 1);
  }
  -[LPCaptionButtonPresentationProperties actions](self->_properties, "actions");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (unint64_t)objc_msgSend(v54, "count") > 1;

  if (v55)
  {
    -[LPCaptionBarButtonView createMenu](self, "createMenu");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "setMenu:", v56);

    objc_msgSend(v63, "setShowsMenuAsPrimaryAction:", 1);
    objc_msgSend(v63, "setPreferredMenuElementOrder:", 2);
  }
  else
  {
    objc_msgSend(v62, "handler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v57 == 0;

    if (v58)
      objc_msgSend(v63, "setUserInteractionEnabled:", -[LPButtonStyle enableUserInteractionForDecorativeButton](self->_style, "enableUserInteractionForDecorativeButton"));
  }

}

id __46__LPCaptionBarButtonView_configureMenuButton___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)createUIActionsFromLPActionsWithHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id obj;
  id v19;
  _QWORD v20[5];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  -[LPCaptionButtonPresentationProperties actions](self->_properties, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[LPCaptionButtonPresentationProperties actions](self->_properties, "actions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
        if (-[LPCaptionBarButtonView _menuButtonShowsImages](self, "_menuButtonShowsImages"))
        {
          objc_msgSend(v10, "image");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "platformImage");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v12 = 0;
        }
        v13 = (void *)MEMORY[0x1E0DC3428];
        objc_msgSend(v10, "title");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __66__LPCaptionBarButtonView_createUIActionsFromLPActionsWithHandler___block_invoke;
        v20[3] = &unk_1E44AA720;
        v15 = v19;
        v20[4] = v10;
        v21 = v15;
        objc_msgSend(v13, "actionWithTitle:image:identifier:handler:", v14, v12, 0, v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "isSelected"))
          objc_msgSend(v16, "setState:", 1);
        objc_msgSend(v6, "addObject:", v16);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v7);
  }

  return v6;
}

uint64_t __66__LPCaptionBarButtonView_createUIActionsFromLPActionsWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)createMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  id v10;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__LPCaptionBarButtonView_createMenu__block_invoke;
  aBlock[3] = &unk_1E44AA748;
  aBlock[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __36__LPCaptionBarButtonView_createMenu__block_invoke_2;
  v9[3] = &unk_1E44AA798;
  v9[4] = self;
  v3 = _Block_copy(aBlock);
  v10 = v3;
  __36__LPCaptionBarButtonView_createMenu__block_invoke_2((uint64_t)v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC39D0];
  -[LPCaptionBarButtonView createUIActionsFromLPActionsWithHandler:](self, "createUIActionsFromLPActionsWithHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "menuWithChildren:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __36__LPCaptionBarButtonView_createMenu__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "performAction:");
  objc_msgSend(*(id *)(a1 + 32), "createMenu");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setMenu:", v3);

  objc_msgSend(*(id *)(a1 + 32), "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentViewDidChangeIntrinsicContentSize:", *(_QWORD *)(a1 + 32));

}

id __36__LPCaptionBarButtonView_createMenu__block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  id v8;

  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "behavior");
  if (v3 == 1)
  {
    v1 = _Block_copy(*(const void **)(a1 + 40));
  }
  else if (!v3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__LPCaptionBarButtonView_createMenu__block_invoke_3;
    v7[3] = &unk_1E44AA770;
    v4 = *(void **)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v4;
    v5 = _Block_copy(v7);

    return v5;
  }
  return v1;
}

void __36__LPCaptionBarButtonView_createMenu__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  uint64_t v10;
  id v11;

  v3 = a2;
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __36__LPCaptionBarButtonView_createMenu__block_invoke_4;
  v9 = &unk_1E44A7D10;
  v10 = *(_QWORD *)(a1 + 32);
  v4 = v3;
  v11 = v4;
  v5 = _Block_copy(&v6);
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v5, v6, v7, v8, v9, v10);
  objc_msgSend(*(id *)(a1 + 32), "selectAction:", v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __36__LPCaptionBarButtonView_createMenu__block_invoke_4(uint64_t a1)
{
  id *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 440);
  v4 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(v2[1], "visibleTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0DC32A0];
  objc_msgSend(*((id *)*v2 + 54), "menuFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithString:attributes:", v5, v7);
  objc_msgSend(v3, "setAttributedTitle:forState:", v8, 0);

  if (objc_msgSend(*(id *)(a1 + 32), "_menuButtonShowsImages"))
  {
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 440);
    objc_msgSend(*(id *)(a1 + 40), "visibleImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "platformImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:forState:", v11, 0);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "_lp_layoutIfNeeded");
}

- (BOOL)_menuButtonShowsImages
{
  return 1;
}

- (BOOL)_menuButtonShowsIndicator
{
  void *v2;
  BOOL v3;

  -[LPCaptionButtonPresentationProperties actions](self->_properties, "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (BOOL)_menuButtonShowsChevron
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  if (!-[LPButtonStyle showsChevronForSingleAction](self->_style, "showsChevronForSingleAction"))
    return 0;
  -[LPCaptionButtonPresentationProperties actions](self->_properties, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    -[LPCaptionButtonPresentationProperties actions](self->_properties, "actions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_menuButtonShowsSingleImage
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[LPCaptionButtonPresentationProperties actions](self->_properties, "actions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 != 1)
    return 0;
  -[LPCaptionButtonPresentationProperties actions](self->_properties, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 == 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (void)setCollapsed:(BOOL)a3
{
  self->_collapsed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressIndicator, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_collapsedButton, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
