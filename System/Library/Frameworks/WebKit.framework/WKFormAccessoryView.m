@implementation WKFormAccessoryView

- (id)_initForUniversalControlBar:(id)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *m_ptr;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[2];
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  self->_usesUniversalControlBar = 1;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__autoFill, 64);
  -[WKFormAccessoryView bounds](self, "bounds");
  v7 = v6;
  objc_msgSend(v5, "setFrame:", 0.0, 0.0, 0.0);
  objc_msgSend(v5, "setTintColor:", objc_msgSend(MEMORY[0x1E0CEA478], "labelColor"));
  v8 = (void *)objc_msgSend(v5, "titleLabel");
  objc_msgSend(v8, "setFrame:", 0.0, 0.0, 0.0, v7);
  objc_msgSend(v8, "setNumberOfLines:", 2);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v5);
  m_ptr = self->_autoFillButtonItem.m_ptr;
  self->_autoFillButtonItem.m_ptr = v9;
  if (m_ptr)
    CFRelease(m_ptr);
  v11 = objc_alloc(MEMORY[0x1E0CEA380]);
  v12 = (void *)objc_msgSend(v11, "initWithImage:style:target:action:", objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("chevron.up")), 0, self, sel__previousTapped);
  v13 = self->_previousItem.m_ptr;
  self->_previousItem.m_ptr = v12;
  if (v13)
  {
    CFRelease(v13);
    v12 = self->_previousItem.m_ptr;
  }
  objc_msgSend(v12, "setTintColor:", objc_msgSend(MEMORY[0x1E0CEA478], "blackColor"));
  objc_msgSend(self->_previousItem.m_ptr, "setEnabled:", 0);
  v14 = objc_alloc(MEMORY[0x1E0CEA380]);
  v15 = (void *)objc_msgSend(v14, "initWithImage:style:target:action:", objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("chevron.down")), 0, self, sel__nextTapped);
  v16 = self->_nextItem.m_ptr;
  self->_nextItem.m_ptr = v15;
  if (v16)
  {
    CFRelease(v16);
    v15 = self->_nextItem.m_ptr;
  }
  objc_msgSend(v15, "setTintColor:", objc_msgSend(MEMORY[0x1E0CEA478], "blackColor"));
  objc_msgSend(self->_nextItem.m_ptr, "setEnabled:", 0);
  v17 = objc_alloc(MEMORY[0x1E0CEA388]);
  v28[0] = self->_autoFillButtonItem.m_ptr;
  v18 = (void *)objc_msgSend(v17, "initWithBarButtonItems:representativeItem:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1), 0);
  v19 = self->_buttonGroupAutoFill.m_ptr;
  self->_buttonGroupAutoFill.m_ptr = v18;
  if (v19)
  {
    CFRelease(v19);
    v18 = self->_buttonGroupAutoFill.m_ptr;
  }
  objc_msgSend(v18, "setHidden:", 1);
  v20 = objc_alloc(MEMORY[0x1E0CEA388]);
  v21 = self->_nextItem.m_ptr;
  v27[0] = self->_previousItem.m_ptr;
  v27[1] = v21;
  v22 = (void *)objc_msgSend(v20, "initWithBarButtonItems:representativeItem:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2), 0);
  v23 = self->_buttonGroupNavigation.m_ptr;
  self->_buttonGroupNavigation.m_ptr = v22;
  if (v23)
    CFRelease(v23);
  v24 = (void *)objc_msgSend((id)objc_msgSend(a3, "leadingBarButtonGroups"), "mutableCopy");
  objc_msgSend(v24, "addObject:", self->_buttonGroupAutoFill.m_ptr);
  objc_msgSend(a3, "setLeadingBarButtonGroups:", v24);
  v25 = (void *)objc_msgSend((id)objc_msgSend(a3, "trailingBarButtonGroups"), "mutableCopy");
  objc_msgSend(v25, "addObject:", self->_buttonGroupNavigation.m_ptr);
  objc_msgSend(a3, "setTrailingBarButtonGroups:", v25);
  if (v25)
    CFRelease(v25);
  if (v24)
    CFRelease(v24);
  return self;
}

- (WKFormAccessoryView)initWithInputAssistantItem:(id)a3 delegate:(id)a4
{
  WKFormAccessoryView *v6;
  WKFormAccessoryView *v7;
  void *v8;
  void *v9;
  void *v10;
  void *m_ptr;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;

  v6 = -[WKFormAccessoryView init](self, "init");
  v7 = v6;
  if (!v6)
    return v7;
  objc_storeWeak((id *)&v6->_delegate, a4);
  v8 = (void *)-[WKFormAccessoryView subviews](v7, "subviews");
  v9 = (void *)objc_msgSend(v8, "firstObject");
  v10 = v9;
  if (v9)
    CFRetain(v9);
  m_ptr = v7->_leftContainerView.m_ptr;
  v7->_leftContainerView.m_ptr = v10;
  if (m_ptr)
    CFRelease(m_ptr);
  v12 = (void *)objc_msgSend(v8, "lastObject");
  v13 = v12;
  if (v12)
    CFRetain(v12);
  v14 = v7->_rightContainerView.m_ptr;
  v7->_rightContainerView.m_ptr = v13;
  if (v14)
    CFRelease(v14);
  if ((PAL::currentUserInterfaceIdiomIsSmallScreen((PAL *)v14) & 1) != 0)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = objc_alloc(MEMORY[0x1E0CEA380]);
    v17 = (void *)objc_msgSend(v16, "initWithImage:style:target:action:", objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("chevron.up")), 0, v7, sel__previousTapped);
    v18 = v7->_previousItem.m_ptr;
    v7->_previousItem.m_ptr = v17;
    if (v18)
    {
      CFRelease(v18);
      v17 = v7->_previousItem.m_ptr;
    }
    objc_msgSend(v17, "setEnabled:", 0);
    objc_msgSend(v15, "addObject:", v7->_previousItem.m_ptr);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
    v20 = v7->_nextPreviousSpacer.m_ptr;
    v7->_nextPreviousSpacer.m_ptr = v19;
    if (v20)
    {
      CFRelease(v20);
      v19 = v7->_nextPreviousSpacer.m_ptr;
    }
    objc_msgSend(v19, "setWidth:", 6.0);
    objc_msgSend(v15, "addObject:", v7->_nextPreviousSpacer.m_ptr);
    v21 = objc_alloc(MEMORY[0x1E0CEA380]);
    v22 = (void *)objc_msgSend(v21, "initWithImage:style:target:action:", objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("chevron.down")), 0, v7, sel__nextTapped);
    v23 = v7->_nextItem.m_ptr;
    v7->_nextItem.m_ptr = v22;
    if (v23)
    {
      CFRelease(v23);
      v22 = v7->_nextItem.m_ptr;
    }
    objc_msgSend(v22, "setEnabled:", 0);
    objc_msgSend(v15, "addObject:", v7->_nextItem.m_ptr);
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
    v25 = v7->_flexibleSpaceItem.m_ptr;
    v7->_flexibleSpaceItem.m_ptr = (void *)v24;
    if (v25)
      CFRelease(v25);
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
    v27 = v7->_autoFillButtonItemSpacer.m_ptr;
    v7->_autoFillButtonItemSpacer.m_ptr = v26;
    if (v27)
    {
      CFRelease(v27);
      v26 = v7->_autoFillButtonItemSpacer.m_ptr;
    }
    objc_msgSend(v26, "setWidth:", 6.0);
    v28 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 0, v7, sel__done);
    v29 = v7->_doneButton.m_ptr;
    v7->_doneButton.m_ptr = (void *)v28;
    if (v29)
      CFRelease(v29);
    objc_msgSend(v15, "addObject:", v7->_flexibleSpaceItem.m_ptr);
    objc_msgSend(v15, "addObject:", v7->_doneButton.m_ptr);
    v30 = objc_alloc_init(MEMORY[0x1E0CEAB20]);
    objc_msgSend(v30, "setBarStyle:", 0);
    objc_msgSend(v30, "setTranslucent:", 1);
    objc_msgSend(v30, "setAutoresizingMask:", 18);
    objc_msgSend(v30, "setItems:", v15);
    v31 = v7->_leftToolbar.m_ptr;
    v7->_leftToolbar.m_ptr = v30;
    if (v31)
    {
      CFRelease(v31);
      v30 = v7->_leftToolbar.m_ptr;
    }
    objc_msgSend(v7->_leftContainerView.m_ptr, "addSubview:", v30);
    v32 = objc_alloc_init(MEMORY[0x1E0CEAB20]);
    objc_msgSend(v32, "setBarStyle:", 0);
    objc_msgSend(v32, "setTranslucent:", 1);
    objc_msgSend(v32, "setAutoresizingMask:", 18);
    objc_msgSend(v32, "setItems:", MEMORY[0x1E0C9AA60]);
    v33 = v7->_rightToolbar.m_ptr;
    v7->_rightToolbar.m_ptr = v32;
    if (v33)
    {
      CFRelease(v33);
      v32 = v7->_rightToolbar.m_ptr;
    }
    objc_msgSend(v7->_rightContainerView.m_ptr, "addSubview:", v32);
    -[WKFormAccessoryView _updateFrame](v7, "_updateFrame");
    v34 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v34, "addObserver:selector:name:object:", v7, sel__updateFrame, *MEMORY[0x1E0CEB280], 0);
    return v7;
  }
  return (WKFormAccessoryView *)-[WKFormAccessoryView _initForUniversalControlBar:](v7, "_initForUniversalControlBar:", a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WKFormAccessoryView;
  -[WKFormAccessoryView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_);
  v5 = (void *)-[WKFormAccessoryView traitCollection](self, "traitCollection");
  if (objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", a3))
  {
    v6 = (void *)MEMORY[0x1E0C99E08];
    v7 = objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB568]);
    v8 = (void *)objc_msgSend(v6, "dictionaryWithObject:forKey:", v7, *MEMORY[0x1E0CEA098]);
    if (objc_msgSend(v5, "userInterfaceStyle") == 2)
    {
      v9 = objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CEA0A0]);
    }
    else
    {
      v9 = 0;
    }
    -[WKFormAccessoryView setTintColor:](self, "setTintColor:", v9);
    objc_msgSend(self->_doneButton.m_ptr, "setTitleTextAttributes:forState:", v8, 0);
  }
}

- (void)_updateFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[WKFormAccessoryView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  objc_msgSend(self->_leftToolbar.m_ptr, "sizeThatFits:", v7, v9);
  -[UIInputView setFrame:](self, "setFrame:", v4, v6, v8, v10);
}

- (void)layoutSubviews
{
  void *m_ptr;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WKFormAccessoryView;
  -[WKFormAccessoryView layoutSubviews](&v5, sel_layoutSubviews);
  if (!self->_usesUniversalControlBar || (objc_msgSend(self->_buttonGroupAutoFill.m_ptr, "isHidden") & 1) == 0)
  {
    if (self->_autoFillButtonItem.m_ptr)
    {
      -[WKFormAccessoryView _refreshAutofillPresentation](self, "_refreshAutofillPresentation");
      -[WKFormAccessoryView _applyTreatmentToAutoFillLabel](self, "_applyTreatmentToAutoFillLabel");
      m_ptr = self->_autoFillButtonItem.m_ptr;
      objc_msgSend(-[WKFormAccessoryView _autoFillButton](self, "_autoFillButton"), "frame");
      objc_msgSend(m_ptr, "setWidth:", v4);
    }
  }
}

- (void)_done
{
  objc_msgSend(objc_loadWeak((id *)&self->_delegate), "accessoryViewDone:", self);
}

- (void)_previousTapped
{
  objc_msgSend(objc_loadWeak((id *)&self->_delegate), "accessoryView:tabInDirection:", self, 1);
}

- (void)_nextTapped
{
  objc_msgSend(objc_loadWeak((id *)&self->_delegate), "accessoryView:tabInDirection:", self, 0);
}

- (void)_autoFill
{
  objc_msgSend(objc_loadWeak((id *)&self->_delegate), "accessoryViewAutoFill:", self);
}

- (id)_autoFillButton
{
  void *v2;

  v2 = (void *)objc_msgSend(self->_autoFillButtonItem.m_ptr, "customView");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (void)_refreshAutofillPresentation
{
  double MaxX;
  double MinX;
  void *v5;
  void *v6;
  uint64_t v7;
  CGRect v8;
  CGRect v9;

  if (self->_autoFillButtonItem.m_ptr)
  {
    objc_msgSend(self->_leftContainerView.m_ptr, "frame");
    MaxX = CGRectGetMaxX(v8);
    objc_msgSend(self->_rightContainerView.m_ptr, "frame");
    MinX = CGRectGetMinX(v9);
    v5 = (void *)objc_msgSend((id)objc_msgSend(self->_leftToolbar.m_ptr, "items"), "mutableCopy");
    v6 = (void *)objc_msgSend((id)objc_msgSend(self->_rightToolbar.m_ptr, "items"), "mutableCopy");
    objc_msgSend(v5, "removeObject:", self->_autoFillButtonItemSpacer.m_ptr);
    objc_msgSend(v5, "removeObject:", self->_autoFillButtonItem.m_ptr);
    objc_msgSend(v6, "removeObject:", self->_flexibleSpaceItem.m_ptr);
    objc_msgSend(v6, "removeObject:", self->_autoFillButtonItem.m_ptr);
    if (MaxX == MinX)
    {
      if (objc_msgSend(v5, "containsObject:", self->_nextItem.m_ptr))
        v7 = objc_msgSend(v5, "indexOfObject:", self->_nextItem.m_ptr) + 1;
      else
        v7 = 0;
      objc_msgSend(v5, "insertObject:atIndex:", self->_autoFillButtonItemSpacer.m_ptr, v7);
      objc_msgSend(v5, "insertObject:atIndex:", self->_autoFillButtonItem.m_ptr, v7 + 1);
    }
    else
    {
      objc_msgSend(v6, "insertObject:atIndex:", self->_flexibleSpaceItem.m_ptr, 0);
      objc_msgSend(v6, "addObject:", self->_autoFillButtonItem.m_ptr);
    }
    objc_msgSend(self->_leftToolbar.m_ptr, "setItems:", v5);
    objc_msgSend(self->_rightToolbar.m_ptr, "setItems:", v6);
    if (v6)
      CFRelease(v6);
    if (v5)
      CFRelease(v5);
  }
}

- (void)_applyTreatmentToAutoFillLabel
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  double v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;

  v3 = -[WKFormAccessoryView _autoFillButton](self, "_autoFillButton");
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__491;
  v21 = __Block_byref_object_dispose__492;
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53__WKFormAccessoryView__applyTreatmentToAutoFillLabel__block_invoke;
  v16[3] = &unk_1E34CED10;
  v16[4] = v3;
  v16[5] = &v17;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v16);
  objc_msgSend((id)v18[5], "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB590]), 0.0);
  objc_msgSend((id)v18[5], "setFont:", v10);
  v11 = objc_msgSend((id)-[WKFormAccessoryView traitCollection](self, "traitCollection"), "horizontalSizeClass");
  objc_msgSend((id)v18[5], "sizeThatFits:", 1.79769313e308, v9);
  if (v11 == 1)
    v13 = 180.0;
  else
    v13 = 200.0;
  if (v12 > v13)
  {
    v14 = objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB558]), 0.0);
    objc_msgSend((id)v18[5], "setFont:", v14);
  }
  objc_msgSend((id)v18[5], "sizeThatFits:", v13, 1.79769313e308);
  objc_msgSend((id)v18[5], "setFrame:", v5, v7, v15, v9);
  objc_msgSend(v3, "frame");
  objc_msgSend(v3, "setFrame:");
  _Block_object_dispose(&v17, 8);
}

uint64_t __53__WKFormAccessoryView__applyTreatmentToAutoFillLabel__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "titleLabel");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)hideAutoFillButton
{
  void *v3;
  void *m_ptr;

  if (self->_autoFillButtonItem.m_ptr)
  {
    v3 = (void *)objc_msgSend((id)objc_msgSend(self->_leftToolbar.m_ptr, "items"), "mutableCopy");
    objc_msgSend(v3, "removeObject:", self->_autoFillButtonItem.m_ptr);
    objc_msgSend(self->_leftToolbar.m_ptr, "setItems:", v3);
    if (self->_usesUniversalControlBar)
    {
      objc_msgSend(self->_buttonGroupAutoFill.m_ptr, "setHidden:", 1);
    }
    else
    {
      m_ptr = self->_autoFillButtonItem.m_ptr;
      self->_autoFillButtonItem.m_ptr = 0;
      if (m_ptr)
        CFRelease(m_ptr);
    }
    if (v3)
      CFRelease(v3);
  }
}

- (void)showAutoFillButtonWithTitle:(id)a3
{
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *m_ptr;

  v5 = -[WKFormAccessoryView _autoFillButton](self, "_autoFillButton");
  if (!v5)
  {
    v5 = (id)objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 1);
    objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__autoFill, 64);
    -[WKFormAccessoryView bounds](self, "bounds");
    v7 = v6;
    objc_msgSend(v5, "setFrame:", 0.0, 0.0, 0.0);
    v8 = (void *)objc_msgSend(v5, "titleLabel");
    objc_msgSend(v8, "setFrame:", 0.0, 0.0, 0.0, v7);
    objc_msgSend(v8, "setNumberOfLines:", 2);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithCustomView:", v5);
    m_ptr = self->_autoFillButtonItem.m_ptr;
    self->_autoFillButtonItem.m_ptr = v9;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  if ((objc_msgSend(a3, "isEqualToString:", objc_msgSend(v5, "titleForState:", 0)) & 1) == 0)
    objc_msgSend(v5, "setTitle:forState:", a3, 0);
  if (self->_usesUniversalControlBar)
    objc_msgSend(self->_buttonGroupAutoFill.m_ptr, "setHidden:", 0);
  -[WKFormAccessoryView setNeedsLayout](self, "setNeedsLayout");
}

- (UIBarButtonItem)autoFillButtonItem
{
  return (UIBarButtonItem *)self->_autoFillButtonItem.m_ptr;
}

- (void)setNextPreviousItemsVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  BOOL v10;
  void *v11;
  void *v12;

  v3 = a3;
  if (self->_usesUniversalControlBar)
  {
    objc_msgSend(self->_buttonGroupNavigation.m_ptr, "setHidden:", !a3);
  }
  else
  {
    v5 = (void *)objc_msgSend(self->_leftToolbar.m_ptr, "items");
    v6 = objc_msgSend(v5, "containsObject:", self->_previousItem.m_ptr);
    v7 = objc_msgSend(v5, "containsObject:", self->_nextPreviousSpacer.m_ptr);
    v8 = objc_msgSend(v5, "containsObject:", self->_nextItem.m_ptr);
    v9 = v8;
    if (!v3 || (v6 ? (v10 = v7 == 0) : (v10 = 1), v10 || (v8 & 1) == 0))
    {
      if ((v3 | v6 | v7 | v8) == 1)
      {
        v11 = (void *)objc_msgSend(v5, "mutableCopy");
        v12 = v11;
        if (v3)
        {
          if ((v9 & 1) == 0)
            objc_msgSend(v11, "insertObject:atIndex:", self->_nextItem.m_ptr, 0);
          if ((v7 & 1) == 0)
            objc_msgSend(v12, "insertObject:atIndex:", self->_nextPreviousSpacer.m_ptr, 0);
          if ((v6 & 1) == 0)
            objc_msgSend(v12, "insertObject:atIndex:", self->_previousItem.m_ptr, 0);
        }
        else
        {
          if (v6)
            objc_msgSend(v11, "removeObject:", self->_previousItem.m_ptr);
          if (v7)
            objc_msgSend(v12, "removeObject:", self->_nextPreviousSpacer.m_ptr);
          if (v9)
            objc_msgSend(v12, "removeObject:", self->_nextItem.m_ptr);
        }
        objc_msgSend(self->_leftToolbar.m_ptr, "setItems:", v12);
        -[WKFormAccessoryView setNeedsLayout](self, "setNeedsLayout");
        if (v12)
          CFRelease(v12);
      }
    }
  }
}

- (void)setNextEnabled:(BOOL)a3
{
  objc_msgSend(self->_nextItem.m_ptr, "setEnabled:", a3);
}

- (BOOL)isNextEnabled
{
  return objc_msgSend(self->_nextItem.m_ptr, "isEnabled");
}

- (void)setPreviousEnabled:(BOOL)a3
{
  objc_msgSend(self->_previousItem.m_ptr, "setEnabled:", a3);
}

- (BOOL)isPreviousEnabled
{
  return objc_msgSend(self->_previousItem.m_ptr, "isEnabled");
}

- (double)contentRatio
{
  return 1.0;
}

- (void).cxx_destruct
{
  void *m_ptr;
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
  void *v15;

  m_ptr = self->_rightContainerView.m_ptr;
  self->_rightContainerView.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_leftContainerView.m_ptr;
  self->_leftContainerView.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_buttonGroupNavigation.m_ptr;
  self->_buttonGroupNavigation.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->_buttonGroupAutoFill.m_ptr;
  self->_buttonGroupAutoFill.m_ptr = 0;
  if (v6)
    CFRelease(v6);
  v7 = self->_autoFillButtonItemSpacer.m_ptr;
  self->_autoFillButtonItemSpacer.m_ptr = 0;
  if (v7)
    CFRelease(v7);
  v8 = self->_autoFillButtonItem.m_ptr;
  self->_autoFillButtonItem.m_ptr = 0;
  if (v8)
    CFRelease(v8);
  v9 = self->_nextPreviousSpacer.m_ptr;
  self->_nextPreviousSpacer.m_ptr = 0;
  if (v9)
    CFRelease(v9);
  v10 = self->_nextItem.m_ptr;
  self->_nextItem.m_ptr = 0;
  if (v10)
    CFRelease(v10);
  v11 = self->_previousItem.m_ptr;
  self->_previousItem.m_ptr = 0;
  if (v11)
    CFRelease(v11);
  v12 = self->_flexibleSpaceItem.m_ptr;
  self->_flexibleSpaceItem.m_ptr = 0;
  if (v12)
    CFRelease(v12);
  v13 = self->_doneButton.m_ptr;
  self->_doneButton.m_ptr = 0;
  if (v13)
    CFRelease(v13);
  v14 = self->_rightToolbar.m_ptr;
  self->_rightToolbar.m_ptr = 0;
  if (v14)
    CFRelease(v14);
  v15 = self->_leftToolbar.m_ptr;
  self->_leftToolbar.m_ptr = 0;
  if (v15)
    CFRelease(v15);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 80) = 0;
  *((_QWORD *)self + 81) = 0;
  *((_QWORD *)self + 82) = 0;
  *((_QWORD *)self + 83) = 0;
  *((_QWORD *)self + 84) = 0;
  *((_QWORD *)self + 85) = 0;
  *((_QWORD *)self + 86) = 0;
  *((_QWORD *)self + 87) = 0;
  *((_QWORD *)self + 88) = 0;
  *((_QWORD *)self + 89) = 0;
  *((_QWORD *)self + 90) = 0;
  *((_QWORD *)self + 91) = 0;
  *((_QWORD *)self + 92) = 0;
  return self;
}

@end
