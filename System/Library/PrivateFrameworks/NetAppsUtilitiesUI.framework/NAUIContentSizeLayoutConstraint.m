@implementation NAUIContentSizeLayoutConstraint

+ (id)_constraintForAutoitem:(id)a3 constrainedItem:(id)a4 attribute:(int64_t)a5 relatedBy:(int64_t)a6 toItem:(id)a7 attribute:(int64_t)a8 multiplier:(double)a9 defaultConstant:(double)a10 additionalConstant:(double)a11 initialize:(BOOL)a12
{
  id v21;
  uint64_t v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;

  v21 = a3;
  objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a4, a5, a6, a7, a8, a9, 0.0);
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v22, "_defaultConstantByFixingUpDefaultConstant:", a10);
  objc_msgSend((id)v22, "setConstant:", v23 + a11);
  objc_msgSend(v21, "naui_dynamicFontTextStyleDescriptor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "textStyle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v22, "setTextStyle:", v25);

  objc_msgSend(v21, "naui_dynamicFontTextStyleDescriptor");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = *(void **)(v22 + 104);
  *(_QWORD *)(v22 + 104) = v26;

  v28 = *(void **)(v22 + 80);
  *(_QWORD *)(v22 + 80) = v21;

  *(_BYTE *)(v22 + 96) = 1;
  *(double *)(v22 + 144) = a11;
  *(double *)(v22 + 136) = a10;
  *(_BYTE *)(v22 + 128) = 0;
  if (a12)
    objc_msgSend((id)v22, "_forceUpdatePreferredContentSize");
  return (id)v22;
}

+ (id)constraintForAutoitem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 multiplier:(double)a8 defaultConstant:(double)a9
{
  uint64_t v10;

  LOBYTE(v10) = 1;
  return (id)objc_msgSend(a1, "_constraintForAutoitem:constrainedItem:attribute:relatedBy:toItem:attribute:multiplier:defaultConstant:additionalConstant:initialize:", a3, a3, a4, a5, a6, a7, a8, a9, 0.0, v10);
}

+ (id)constraintForAutoitem:(id)a3 constrainedItem:(id)a4 attribute:(int64_t)a5 relatedBy:(int64_t)a6 toItem:(id)a7 attribute:(int64_t)a8 multiplier:(double)a9 defaultConstant:(double)a10
{
  uint64_t v11;

  LOBYTE(v11) = 1;
  return (id)objc_msgSend(a1, "_constraintForAutoitem:constrainedItem:attribute:relatedBy:toItem:attribute:multiplier:defaultConstant:additionalConstant:initialize:", a3, a4, a5, a6, a7, a8, a9, a10, 0.0, v11);
}

+ (id)constraintForAutoitem:(id)a3 additionalConstant:(double)a4 constantLoadingBlock:(id)a5
{
  id v8;
  void *v9;
  uint64_t v11;

  v8 = a5;
  LOBYTE(v11) = 0;
  objc_msgSend(a1, "_constraintForAutoitem:constrainedItem:attribute:relatedBy:toItem:attribute:multiplier:defaultConstant:additionalConstant:initialize:", a3, a3, 7, 0, 0, 0, 1.0, 0.0, a4, v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setConstantLoadingBlock:", v8);

  objc_msgSend(v9, "_updatePreferredContentSize");
  return v9;
}

+ (id)constraintForAutoitem:(id)a3 additionalConstant:(double)a4 constantWidthSizingStringsLoadingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __115__NAUIContentSizeLayoutConstraint_constraintForAutoitem_additionalConstant_constantWidthSizingStringsLoadingBlock___block_invoke;
  v14[3] = &unk_24D6125E0;
  v16 = v9;
  v17 = a1;
  v15 = v8;
  v10 = v9;
  v11 = v8;
  objc_msgSend(a1, "constraintForAutoitem:additionalConstant:constantLoadingBlock:", v11, v14, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

double __115__NAUIContentSizeLayoutConstraint_constraintForAutoitem_additionalConstant_constantWidthSizingStringsLoadingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(*(id *)(a1 + 32), "font");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_class();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_maximumWidthOfStrings:withFont:", v4, v2);
  v6 = v5;

  return v6;
}

+ (id)baselineConstraintForAutoitem:(id)a3 relation:(int64_t)a4 toView:(id)a5 attribute:(int64_t)a6 defaultConstant:(double)a7
{
  return (id)objc_msgSend(a1, "constraintForAutoitem:constrainedItem:attribute:relatedBy:toItem:attribute:multiplier:defaultConstant:", a3, a3, 11, a4, a5, a6, 1.0, a7);
}

+ (id)baselineConstraintForView:(id)a3 attribute:(int64_t)a4 relation:(int64_t)a5 toAutoitem:(id)a6 defaultConstant:(double)a7
{
  return (id)objc_msgSend(a1, "constraintForAutoitem:constrainedItem:attribute:relatedBy:toItem:attribute:multiplier:defaultConstant:", a6, a3, a4, a5, a6, 11, 1.0, a7);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_preferredContentSizeDidChangeObserver)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_preferredContentSizeDidChangeObserver);

  }
  v4.receiver = self;
  v4.super_class = (Class)NAUIContentSizeLayoutConstraint;
  -[NAUIContentSizeLayoutConstraint dealloc](&v4, sel_dealloc);
}

- (void)setTextStyle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *textStyle;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id preferredContentSizeDidChangeObserver;
  _QWORD v14[4];
  id v15;
  id location;

  v4 = a3;
  if (!-[NSString isEqualToString:](self->_textStyle, "isEqualToString:", v4))
  {
    v5 = (NSString *)objc_msgSend(v4, "copy");
    textStyle = self->_textStyle;
    self->_textStyle = v5;

    objc_msgSend(MEMORY[0x24BEBB520], "defaultFontForTextStyle:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_bodyLeading");
    self->_textStyleDefaultBodyLeading = v8;

    if (self->_autoitem)
      -[NAUIContentSizeLayoutConstraint _updatePreferredContentSize](self, "_updatePreferredContentSize");
  }
  if (!self->_preferredContentSizeDidChangeObserver)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x24BDF7670];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __48__NAUIContentSizeLayoutConstraint_setTextStyle___block_invoke;
    v14[3] = &unk_24D612608;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", v11, 0, v10, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    preferredContentSizeDidChangeObserver = self->_preferredContentSizeDidChangeObserver;
    self->_preferredContentSizeDidChangeObserver = v12;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

void __48__NAUIContentSizeLayoutConstraint_setTextStyle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id to;

  v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  v4 = objc_loadWeakRetained(&to);
  objc_msgSend(v4, "_updatePreferredContentSize");

  objc_destroyWeak(&to);
}

- (void)setDefaultConstant:(double)a3
{
  if (self->_defaultConstant != a3)
  {
    self->_defaultConstant = a3;
    -[NAUIContentSizeLayoutConstraint _updatePreferredContentSize](self, "_updatePreferredContentSize");
  }
}

- (void)setAutoUpdatingConstantShrinks:(BOOL)a3
{
  if (self->_autoUpdatingConstantShrinks != a3)
  {
    self->_autoUpdatingConstantShrinks = a3;
    -[NAUIContentSizeLayoutConstraint _updatePreferredContentSize](self, "_updatePreferredContentSize");
  }
}

- (double)_defaultConstantByFixingUpDefaultConstant:(double)a3
{
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  char v9;
  void *v10;

  -[NAUIContentSizeLayoutConstraint firstItem](self, "firstItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[NAUIContentSizeLayoutConstraint firstItem](self, "firstItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "borderStyle")
      && -[NAUIContentSizeLayoutConstraint firstAttribute](self, "firstAttribute") == 12)
    {
      a3 = UIScreenPixelHeight() + a3;
    }

  }
  -[NAUIContentSizeLayoutConstraint secondItem](self, "secondItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) != 0)
  {
    -[NAUIContentSizeLayoutConstraint secondItem](self, "secondItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "borderStyle")
      && -[NAUIContentSizeLayoutConstraint secondAttribute](self, "secondAttribute") == 12)
    {
      a3 = a3 - UIScreenPixelHeight();
    }

  }
  return a3;
}

+ (double)_maximumWidthOfStrings:(id)a3 withFont:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  double v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  objc_msgSend(v7, "setFont:", v6);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "setText:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
        objc_msgSend(v7, "intrinsicContentSize");
        if (v12 < v14)
          v12 = v14;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 0.0;
  }

  return v12;
}

- (void)_forceUpdatePreferredContentSize
{
  -[NAUIContentSizeLayoutConstraint _reloadPreferredContentSize:](self, "_reloadPreferredContentSize:", 1);
}

- (void)_updatePreferredContentSize
{
  -[NAUIContentSizeLayoutConstraint _reloadPreferredContentSize:](self, "_reloadPreferredContentSize:", 0);
}

- (void)_reloadPreferredContentSize:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  void (**constantLoadingBlock)(void);
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  double v18;
  double v19;
  id v21;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(self->_autoitem, "naui_dynamicFontTextStyleDescriptor");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    +[NAUITextStyleDescriptor fontWithTextStyleDescriptor:](NAUITextStyleDescriptor, "fontWithTextStyleDescriptor:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(self->_autoitem, "naui_reloadDynamicFontWithTextStyleDescriptor:", v21);
    objc_msgSend(self->_autoitem, "viewForLastBaselineLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "naui_reloadDynamicFontWithTextStyleDescriptor:", v21);
    -[NAUIContentSizeLayoutConstraint _defaultConstantByFixingUpDefaultConstant:](self, "_defaultConstantByFixingUpDefaultConstant:", self->_defaultConstant);
    constantLoadingBlock = (void (**)(void))self->_constantLoadingBlock;
    if (constantLoadingBlock)
    {
      constantLoadingBlock[2]();
    }
    else
    {
      v10 = v7;
      objc_msgSend(v5, "_bodyLeading");
      v12 = 1.0;
      if (fabs(v10) > 0.000000238418579)
        v12 = v11 / self->_textStyleDefaultBodyLeading;
      v13 = 1.0 / v12;
      if (!self->_autoUpdatingConstantShrinks)
        v13 = v12;
      v9 = v10 * v13;
    }
    v14 = v9 + self->_additionalConstant;
    v15 = v14 / UIScreenPixelHeight();
    v16 = UIScreenPixelHeight();
    v17 = v15;
    v18 = v16 * roundf(v17);
    -[NAUIContentSizeLayoutConstraint constant](self, "constant");
    if (v19 != v18 || v3)
      -[NAUIContentSizeLayoutConstraint setConstant:](self, "setConstant:", v18);

  }
}

- (BOOL)autoUpdatingConstantShrinks
{
  return self->_autoUpdatingConstantShrinks;
}

- (double)defaultConstant
{
  return self->_defaultConstant;
}

- (double)additionalConstant
{
  return self->_additionalConstant;
}

- (void)setAdditionalConstant:(double)a3
{
  self->_additionalConstant = a3;
}

- (NSString)textStyle
{
  return self->_textStyle;
}

- (id)constantLoadingBlock
{
  return self->_constantLoadingBlock;
}

- (void)setConstantLoadingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_constantLoadingBlock, 0);
  objc_storeStrong((id *)&self->_textStyle, 0);
  objc_storeStrong((id *)&self->_dynamicTextStyleDescriptor, 0);
  objc_storeStrong(&self->_preferredContentSizeDidChangeObserver, 0);
  objc_storeStrong(&self->_autoitem, 0);
}

@end
