@implementation MPUContentSizeLayoutConstraint

+ (id)contentSizeAutoupdatingConstraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 multiplier:(double)a8 textStyle:(id)a9 defaultSizeConstant:(double)a10
{
  id v18;
  uint64_t v19;

  v18 = a9;
  objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, a4, a5, a6, a7, a8, 0.0);
  v19 = objc_claimAutoreleasedReturnValue();
  *(double *)(v19 + 128) = a10;
  *(_BYTE *)(v19 + 96) = 1;
  objc_msgSend((id)v19, "setTextStyle:", v18);

  return (id)v19;
}

+ (id)constraintWithAutoupdatingBaselineOfView:(id)a3 toView:(id)a4 attribute:(int64_t)a5 withTextStyle:(id)a6 nonStandardLeading:(double)a7
{
  return (id)objc_msgSend(a1, "constraintWithAutoupdatingBaselineOfView:relation:toView:attribute:withTextStyle:nonStandardLeading:", a3, 0, a4, a5, a6, a7);
}

+ (id)constraintWithAutoupdatingBaselineOfView:(id)a3 relation:(int64_t)a4 toView:(id)a5 attribute:(int64_t)a6 withTextStyle:(id)a7 nonStandardLeading:(double)a8
{
  return (id)objc_msgSend(a1, "constraintWithAutoupdatingBaselineOfView:relation:toView:attribute:withTextStyle:multiplier:nonStandardLeading:", a3, a4, a5, a6, a7, 1.0, a8);
}

+ (id)constraintWithAutoupdatingBaselineOfView:(id)a3 relation:(int64_t)a4 toView:(id)a5 attribute:(int64_t)a6 withTextStyle:(id)a7 multiplier:(double)a8 nonStandardLeading:(double)a9
{
  return (id)objc_msgSend(a1, "contentSizeAutoupdatingConstraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:textStyle:defaultSizeConstant:", a3, 12, a4, a5, a6, a7, a8, a9);
}

+ (id)constraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 multiplier:(double)a8 autoupdatingConstantFromLabel:(id)a9 textStyle:(id)a10 numberOfLines:(unint64_t)a11
{
  id v18;
  id v19;
  uint64_t v20;
  void *v21;

  v18 = a9;
  v19 = a10;
  objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", a3, a4, a5, a6, a7, a8, 0.0);
  v20 = objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v20 + 120) = 0x3FF0000000000000;
  *(_QWORD *)(v20 + 104) = a11;
  v21 = *(void **)(v20 + 112);
  *(_QWORD *)(v20 + 112) = v18;

  *(_BYTE *)(v20 + 97) = 1;
  objc_msgSend((id)v20, "setTextStyle:", v19);

  return (id)v20;
}

- (void)setFontSizeMultiplier:(double)a3
{
  if (self->_fontSizeMultiplier != a3)
  {
    self->_fontSizeMultiplier = a3;
    -[MPUContentSizeLayoutConstraint _updatePreferredContentSize](self, "_updatePreferredContentSize");
  }
}

- (void)setTextStyle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *textStyle;
  void *v7;
  double v8;
  void *v9;
  uint64_t v10;
  MPUNotificationObserver *v11;
  MPUNotificationObserver *preferredContentSizeDidChangeObserver;
  _QWORD v13[4];
  id v14;
  id location;

  v4 = a3;
  if (!-[NSString isEqualToString:](self->_textStyle, "isEqualToString:", v4))
  {
    v5 = (NSString *)objc_msgSend(v4, "copy");
    textStyle = self->_textStyle;
    self->_textStyle = v5;

    objc_msgSend(MEMORY[0x24BDF6A70], "defaultFontForTextStyle:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_bodyLeading");
    self->_textStyleDefaultLeading = v8;

    -[MPUContentSizeLayoutConstraint _updatePreferredContentSize](self, "_updatePreferredContentSize");
  }
  if (!self->_preferredContentSizeDidChangeObserver)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x24BDF7670];
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __47__MPUContentSizeLayoutConstraint_setTextStyle___block_invoke;
    v13[3] = &unk_24DD6E410;
    objc_copyWeak(&v14, &location);
    +[MPUNotificationObserver observerWithName:object:queue:observationHandler:](MPUNotificationObserver, "observerWithName:object:queue:observationHandler:", v10, 0, v9, v13);
    v11 = (MPUNotificationObserver *)objc_claimAutoreleasedReturnValue();
    preferredContentSizeDidChangeObserver = self->_preferredContentSizeDidChangeObserver;
    self->_preferredContentSizeDidChangeObserver = v11;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

}

void __47__MPUContentSizeLayoutConstraint_setTextStyle___block_invoke(uint64_t a1, void *a2)
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

- (void)setDefaultSizeConstant:(double)a3
{
  if (self->_defaultSizeConstant != a3)
  {
    self->_defaultSizeConstant = a3;
    -[MPUContentSizeLayoutConstraint _updatePreferredContentSize](self, "_updatePreferredContentSize");
  }
}

- (void)_updatePreferredContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  double v22;
  double textStyleDefaultLeading;
  UILabel *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  double v28;
  id v29;

  v3 = (void *)MEMORY[0x24BDF6A70];
  -[MPUContentSizeLayoutConstraint textStyle](self, "textStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredFontForTextStyle:", v4);
  v29 = (id)objc_claimAutoreleasedReturnValue();

  -[MPUContentSizeLayoutConstraint fontSizeMultiplier](self, "fontSizeMultiplier");
  if (v5 > 0.00000011920929)
  {
    -[MPUContentSizeLayoutConstraint fontSizeMultiplier](self, "fontSizeMultiplier");
    if (fabs(v6 + -1.0) > 0.00000011920929)
    {
      v7 = (void *)MEMORY[0x24BDF6A70];
      v8 = (void *)MEMORY[0x24BDF6A78];
      -[MPUContentSizeLayoutConstraint textStyle](self, "textStyle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "preferredFontDescriptorWithTextStyle:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "pointSize");
      v12 = v11;
      -[MPUContentSizeLayoutConstraint fontSizeMultiplier](self, "fontSizeMultiplier");
      objc_msgSend(v7, "fontWithDescriptor:size:", v10, ceil(v12 * v13));
      v14 = objc_claimAutoreleasedReturnValue();

      v29 = (id)v14;
    }
  }
  -[MPUContentSizeLayoutConstraint firstItem](self, "firstItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v15, "viewForLastBaselineLayout");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  if (objc_msgSend(v16, "conformsToProtocol:", &unk_255119C68)
    && (objc_msgSend(v16, "MPU_contentSizeUpdater"), (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v18 = v17;
    objc_msgSend(v17, "ensureTextStyleFontsMatchPreferredTextStyleFonts");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v16, "attributedText");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = v19;
        if (objc_msgSend(v20, "length"))
        {
          objc_msgSend(v20, "MPU_tallestFontFromAttributes");
          v21 = objc_claimAutoreleasedReturnValue();

          v29 = (id)v21;
        }
      }
      else
      {
        v20 = 0;
      }

    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v16, "setFont:", v29);
    v18 = 0;
  }
  if (self->_isBaselineConstraint)
  {
    -[MPUContentSizeLayoutConstraint defaultSizeConstant](self, "defaultSizeConstant");
    textStyleDefaultLeading = v22;
    if (MPUFloatEqualToFloat(v22, 0.0))
      textStyleDefaultLeading = self->_textStyleDefaultLeading;
    objc_msgSend(v29, "_scaledValueForValue:", textStyleDefaultLeading);
    -[MPUContentSizeLayoutConstraint setConstant:](self, "setConstant:");
  }
  if (self->_isLineNumberConstraint)
  {
    v24 = self->_targetLabel;
    -[UILabel text](v24, "text");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_numberOfLines)
    {
      v27 = 0;
      do
      {
        objc_msgSend(v26, "appendString:", CFSTR("x\n"));
        ++v27;
      }
      while (v27 < self->_numberOfLines);
    }
    -[UILabel setFont:](v24, "setFont:", v29);
    -[UILabel setNumberOfLines:](v24, "setNumberOfLines:", self->_numberOfLines);
    -[UILabel setText:](v24, "setText:", v26);
    -[UILabel intrinsicContentSize](v24, "intrinsicContentSize");
    -[MPUContentSizeLayoutConstraint setConstant:](self, "setConstant:", v28);
    -[UILabel setText:](v24, "setText:", v25);

  }
}

- (double)fontSizeMultiplier
{
  return self->_fontSizeMultiplier;
}

- (double)defaultSizeConstant
{
  return self->_defaultSizeConstant;
}

- (NSString)textStyle
{
  return self->_textStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textStyle, 0);
  objc_storeStrong((id *)&self->_targetLabel, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeDidChangeObserver, 0);
}

@end
