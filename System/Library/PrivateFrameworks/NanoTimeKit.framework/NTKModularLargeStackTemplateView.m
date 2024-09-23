@implementation NTKModularLargeStackTemplateView

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (NTKModularLargeStackTemplateView)initWithFrame:(CGRect)a3
{
  NTKModularLargeStackTemplateView *v3;
  NTKModularLargeStackTemplateView *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CLKUIColoringLabel *headerLeadingLabel;
  uint64_t v11;
  CLKUIColoringLabel *headerTrailingLabel;
  uint64_t v13;
  CLKUIColoringLabel *body1Label;
  uint64_t v15;
  CLKUIColoringLabel *body2Label;
  _OWORD v18[3];
  uint64_t v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)NTKModularLargeStackTemplateView;
  v3 = -[NTKModuleView initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v19 = 0;
    memset(v18, 0, sizeof(v18));
    -[NTKModuleView device](v3, "device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_21(v5, (uint64_t)v18);

    v6 = *(double *)v18;
    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", *(double *)v18, *MEMORY[0x1E0DC1438]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NTKModularLargeStackTemplateView _newLabelSubviewWithFont:](v4, "_newLabelSubviewWithFont:", v7);
    headerLeadingLabel = v4->_headerLeadingLabel;
    v4->_headerLeadingLabel = (CLKUIColoringLabel *)v9;

    v11 = -[NTKModularLargeStackTemplateView _newLabelSubviewWithFont:](v4, "_newLabelSubviewWithFont:", v7);
    headerTrailingLabel = v4->_headerTrailingLabel;
    v4->_headerTrailingLabel = (CLKUIColoringLabel *)v11;

    v13 = -[NTKModularLargeStackTemplateView _newLabelSubviewWithFont:](v4, "_newLabelSubviewWithFont:", v8);
    body1Label = v4->_body1Label;
    v4->_body1Label = (CLKUIColoringLabel *)v13;

    v15 = -[NTKModularLargeStackTemplateView _newLabelSubviewWithFont:](v4, "_newLabelSubviewWithFont:", v8);
    body2Label = v4->_body2Label;
    v4->_body2Label = (CLKUIColoringLabel *)v15;

  }
  return v4;
}

- (void)_layoutContentView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  char isKindOfClass;
  _BOOL4 v10;
  void *v11;
  void *v12;
  CDComplicationImageView *headerGlyph;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  CLKUIColoringLabel *headerLeadingLabel;
  void *v23;
  CLKUIColoringLabel *headerTrailingLabel;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  CDComplicationImageView *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  CDComplicationImageView *body1Glyph;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  CLKUIColoringLabel *body1Label;
  void *v42;
  void *v43;
  CLKUIColoringLabel *v44;
  void *v45;
  void *v46;
  CLKUIColoringLabel *body2Label;
  CLKUIColoringLabel *v48;
  CLKUIColoringLabel *v49;
  void *v50;
  void *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  double v56;

  v56 = 0.0;
  v54 = 0u;
  v55 = 0u;
  v53 = 0u;
  -[NTKModuleView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_21(v3, (uint64_t)&v53);

  -[NTKModuleView device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = _LargeModularLayoutConstants(v4);
  v7 = v6;

  -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "body2TextProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v12 != 0;

  }
  -[NTKModularLargeStackTemplateView _updateLabelsMaxWidths](self, "_updateLabelsMaxWidths");
  headerGlyph = self->_headerGlyph;
  if (headerGlyph && (-[CDComplicationImageView isHidden](headerGlyph, "isHidden") & 1) == 0)
  {
    -[CDComplicationImageView sizeToFit](self->_headerGlyph, "sizeToFit");
    -[CDComplicationImageView center](self->_headerGlyph, "center");
    v15 = v14;
    -[CLKUIColoringLabel font](self->_headerLeadingLabel, "font");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "capHeight");
    -[NTKModuleView device](self, "device");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    CLKRoundForDevice();
    v19 = v5 - v18;

    -[CDComplicationImageView setCenter:](self->_headerGlyph, "setCenter:", v15, v19);
  }
  -[CLKUIColoringLabel sizeToFit](self->_headerLeadingLabel, "sizeToFit");
  -[CLKUIColoringLabel sizeToFit](self->_headerTrailingLabel, "sizeToFit");
  -[CLKUIColoringLabel frame](self->_headerLeadingLabel, "frame");
  -[CLKUIColoringLabel frame](self->_headerTrailingLabel, "frame");
  -[CLKUIColoringLabel maxWidth](self->_headerLeadingLabel, "maxWidth");
  -[CLKUIColoringLabel maxWidth](self->_headerTrailingLabel, "maxWidth");
  -[CLKUIColoringLabel font](self->_headerLeadingLabel, "font");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ascender");
  -[NTKModuleView device](self, "device");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  CLKCeilForDevice();

  headerLeadingLabel = self->_headerLeadingLabel;
  -[NTKModuleView device](self, "device");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](headerLeadingLabel, "setFrame:");

  headerTrailingLabel = self->_headerTrailingLabel;
  -[NTKModuleView device](self, "device");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](headerTrailingLabel, "setFrame:");

  v26 = (void *)MEMORY[0x1E0C99DE8];
  v27 = *(double *)&v54;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)&v54);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "arrayWithObject:", v28);
  v52 = (id)objc_claimAutoreleasedReturnValue();

  v29 = self->_headerGlyph;
  if (v29 && (-[CDComplicationImageView isHidden](v29, "isHidden") & 1) == 0)
  {
    objc_msgSend(v52, "addObject:", self->_headerGlyph);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)&v55 + 1));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addObject:", v30);

  }
  objc_msgSend(v52, "addObject:", self->_headerLeadingLabel);
  if ((-[CLKUIColoringLabel isHidden](self->_headerTrailingLabel, "isHidden") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v56);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "addObject:", v31);

    objc_msgSend(v52, "addObject:", self->_headerTrailingLabel);
  }
  -[NTKModuleView naturalHorizontalLayoutForViewsAndSpacing:columnAlignmentSpacing:](self, "naturalHorizontalLayoutForViewsAndSpacing:columnAlignmentSpacing:", v52, 0);
  v32 = *(double *)&v55;
  if ((isKindOfClass & 1) == 0)
    v32 = v7;
  v33 = v5 + v32;
  body1Glyph = self->_body1Glyph;
  if (body1Glyph)
  {
    -[CDComplicationImageView sizeToFit](body1Glyph, "sizeToFit");
    -[CDComplicationImageView center](self->_body1Glyph, "center");
    v36 = v35;
    -[CLKUIColoringLabel font](self->_body1Label, "font");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "capHeight");
    -[NTKModuleView device](self, "device");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    CLKRoundForDevice();
    v40 = v33 - v39;

    -[CDComplicationImageView setCenter:](self->_body1Glyph, "setCenter:", v36, v40);
  }
  -[CLKUIColoringLabel frame](self->_body1Label, "frame");
  body1Label = self->_body1Label;
  -[CLKUIColoringLabel maxWidth](body1Label, "maxWidth");
  -[CLKUIColoringLabel sizeThatFits:](body1Label, "sizeThatFits:");
  -[CLKUIColoringLabel maxWidth](self->_body1Label, "maxWidth");
  -[CLKUIColoringLabel font](self->_body1Label, "font");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "ascender");
  -[NTKModuleView device](self, "device");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  CLKCeilForDevice();

  v44 = self->_body1Label;
  -[NTKModuleView device](self, "device");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  -[CLKUIColoringLabel setFrame:](v44, "setFrame:");

  -[NTKModuleView viewsAndSpacingArrayForSpace:view:space:view:](self, "viewsAndSpacingArrayForSpace:view:space:view:", self->_body1Glyph, self->_body1Label, v27, *((double *)&v55 + 1));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKModuleView naturalHorizontalLayoutForViewsAndSpacing:columnAlignmentSpacing:](self, "naturalHorizontalLayoutForViewsAndSpacing:columnAlignmentSpacing:", v46, 0);
  body2Label = self->_body2Label;
  if (v10)
  {
    -[CLKUIColoringLabel setHidden:](body2Label, "setHidden:", 0);
    -[CLKUIColoringLabel frame](self->_body2Label, "frame");
    v48 = self->_body2Label;
    -[CLKUIColoringLabel maxWidth](v48, "maxWidth");
    -[CLKUIColoringLabel sizeThatFits:](v48, "sizeThatFits:");
    -[CLKUIColoringLabel maxWidth](self->_body2Label, "maxWidth");
    v49 = self->_body2Label;
    -[NTKModuleView device](self, "device");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    CLKPixelAlignRectForDevice();
    -[CLKUIColoringLabel setFrame:](v49, "setFrame:");

    -[NTKModuleView viewsAndSpacingArrayForSpace:view:](self, "viewsAndSpacingArrayForSpace:view:", self->_body2Label, v27);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKModuleView naturalHorizontalLayoutForViewsAndSpacing:columnAlignmentSpacing:](self, "naturalHorizontalLayoutForViewsAndSpacing:columnAlignmentSpacing:", v51, 0);

  }
  else
  {
    -[CLKUIColoringLabel setHidden:](body2Label, "setHidden:", 1);
  }

}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
  void (*v5)(void);
  id v6;

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  (*((void (**)(id, CDComplicationImageView *))a3 + 2))(v6, self->_body1Glyph);
  (*((void (**)(id, CLKUIColoringLabel *))a3 + 2))(v6, self->_headerLeadingLabel);
  (*((void (**)(id, CLKUIColoringLabel *))a3 + 2))(v6, self->_headerTrailingLabel);

}

- (void)_enumerateSecondaryForegroundColoringViewsWithBlock:(id)a3
{
  void (*v5)(void);
  id v6;

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  (*((void (**)(id, CLKUIColoringLabel *))a3 + 2))(v6, self->_body2Label);

}

- (id)_newLabelSubview
{
  id v3;
  double v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v3 = objc_alloc_init((Class)off_1E6BCA6E0);
  -[NTKModularLargeStackTemplateView bounds](self, "bounds");
  objc_msgSend(v3, "setMaxWidth:", v4);
  objc_msgSend(v3, "setUppercase:", 0);
  -[NTKModularTemplateView timeTravelDate](self, "timeTravelDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInTimeTravel:", v5 != 0);

  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__NTKModularLargeStackTemplateView__newLabelSubview__block_invoke;
  v11[3] = &unk_1E6BCD7C8;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "setNowProvider:", v11);
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __52__NTKModularLargeStackTemplateView__newLabelSubview__block_invoke_2;
  v9[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setNeedsResizeHandler:", v9);
  -[NTKModuleView contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v3);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v3;
}

id __52__NTKModularLargeStackTemplateView__newLabelSubview__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "timeTravelDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C944A0], "complicationDate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

void __52__NTKModularLargeStackTemplateView__newLabelSubview__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "contentView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsLayout");

}

- (id)_newLabelSubviewWithFont:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[NTKModularLargeStackTemplateView _newLabelSubview](self, "_newLabelSubview");
  objc_msgSend(v5, "setFont:", v4);

  return v5;
}

- (void)_update
{
  void *v3;
  id v4;

  -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NTKModularLargeStackTemplateView _updateForStandardBodyTemplate:](self, "_updateForStandardBodyTemplate:", v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NTKModularLargeStackTemplateView _updateForTallBodyTemplate:](self, "_updateForTallBodyTemplate:", v4);
  }
  -[NTKModuleView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsLayout");

}

- (void)_updateForStandardBodyTemplate:(id)a3
{
  void *v4;
  char v5;
  CDComplicationImageView *headerGlyph;
  CDComplicationImageView *v7;
  CDComplicationImageView *v8;
  void *v9;
  CDComplicationImageView *v10;
  void *v11;
  void *v12;
  char v13;
  CDComplicationImageView *body1Glyph;
  CDComplicationImageView *v15;
  CDComplicationImageView *v16;
  void *v17;
  CDComplicationImageView *v18;
  void *v19;
  CLKUIColoringLabel *headerLeadingLabel;
  void *v21;
  void *v22;
  CLKUIColoringLabel *body1Label;
  void *v24;
  CLKUIColoringLabel *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  CLKUIColoringLabel *v30;
  CLKUIColoringLabel *body2Label;
  void *v32;
  id v33;
  double v34[7];

  v33 = a3;
  objc_msgSend(v33, "headerImageProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(off_1E6BCA178, "existingImageView:supportsImageProvider:", self->_headerGlyph, v4);
  headerGlyph = self->_headerGlyph;
  if ((v5 & 1) == 0)
  {
    -[CDComplicationImageView removeFromSuperview](headerGlyph, "removeFromSuperview");
    objc_msgSend(off_1E6BCA178, "viewForImageProvider:", v4);
    v7 = (CDComplicationImageView *)objc_claimAutoreleasedReturnValue();
    v8 = self->_headerGlyph;
    self->_headerGlyph = v7;

    if (self->_headerGlyph)
    {
      -[NTKModuleView contentView](self, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", self->_headerGlyph);

      v10 = self->_headerGlyph;
      -[NTKModuleView foregroundColor](self, "foregroundColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDComplicationImageView setColor:](v10, "setColor:", v11);

      headerGlyph = self->_headerGlyph;
    }
    else
    {
      headerGlyph = 0;
    }
  }
  -[CDComplicationImageView setImageProvider:](headerGlyph, "setImageProvider:", v4);
  objc_msgSend(v33, "body1ImageProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(off_1E6BCA178, "existingImageView:supportsImageProvider:", self->_body1Glyph, v12);
  body1Glyph = self->_body1Glyph;
  if ((v13 & 1) == 0)
  {
    -[CDComplicationImageView removeFromSuperview](body1Glyph, "removeFromSuperview");
    objc_msgSend(off_1E6BCA178, "viewForImageProvider:", v12);
    v15 = (CDComplicationImageView *)objc_claimAutoreleasedReturnValue();
    v16 = self->_body1Glyph;
    self->_body1Glyph = v15;

    if (self->_body1Glyph)
    {
      -[NTKModuleView contentView](self, "contentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addSubview:", self->_body1Glyph);

      v18 = self->_body1Glyph;
      -[NTKModuleView foregroundColor](self, "foregroundColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDComplicationImageView setColor:](v18, "setColor:", v19);

      body1Glyph = self->_body1Glyph;
    }
    else
    {
      body1Glyph = 0;
    }
  }
  -[CDComplicationImageView setImageProvider:](body1Glyph, "setImageProvider:", v12);
  headerLeadingLabel = self->_headerLeadingLabel;
  objc_msgSend(v33, "headerTextProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](headerLeadingLabel, "setTextProvider:", v21);

  objc_msgSend(v33, "headerTrailingTextProvider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](self->_headerTrailingLabel, "setTextProvider:", v22);
  -[CLKUIColoringLabel setHidden:](self->_headerTrailingLabel, "setHidden:", v22 == 0);
  self->_shouldTruncateHeaderLeadingLabelFirst = objc_msgSend(v33, "shouldTruncateHeaderLeadingLabelFirst");
  body1Label = self->_body1Label;
  objc_msgSend(v33, "body1TextProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](body1Label, "setTextProvider:", v24);

  v25 = self->_body1Label;
  v26 = (void *)MEMORY[0x1E0C944D0];
  -[NTKModuleView device](self, "device");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_21(v27, (uint64_t)v34);
  objc_msgSend(v26, "systemFontOfSize:", v34[0]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setFont:](v25, "setFont:", v28);

  objc_msgSend(v33, "body2TextProvider");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = self->_body1Label;
  if (v29)
  {
    -[CLKUIColoringLabel setNumberOfLines:](v30, "setNumberOfLines:", 1);
    body2Label = self->_body2Label;
    v32 = v29;
  }
  else
  {
    -[CLKUIColoringLabel setNumberOfLines:](v30, "setNumberOfLines:", 2);
    body2Label = self->_body2Label;
    v32 = 0;
  }
  -[CLKUIColoringLabel setTextProvider:](body2Label, "setTextProvider:", v32);

}

- (void)_updateForTallBodyTemplate:(id)a3
{
  id v4;
  char v5;
  CDComplicationImageView *headerGlyph;
  CDComplicationImageView *v7;
  CDComplicationImageView *v8;
  void *v9;
  CDComplicationImageView *v10;
  void *v11;
  CLKUIColoringLabel *headerLeadingLabel;
  void *v13;
  void *v14;
  CLKUIColoringLabel *body1Label;
  void *v16;
  CLKUIColoringLabel *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _BYTE v22[8];
  double v23;

  v4 = a3;
  objc_msgSend(v4, "headerImageProvider");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(off_1E6BCA178, "existingImageView:supportsImageProvider:", self->_headerGlyph);
  headerGlyph = self->_headerGlyph;
  if ((v5 & 1) == 0)
  {
    -[CDComplicationImageView removeFromSuperview](headerGlyph, "removeFromSuperview");
    objc_msgSend(off_1E6BCA178, "viewForImageProvider:", v21);
    v7 = (CDComplicationImageView *)objc_claimAutoreleasedReturnValue();
    v8 = self->_headerGlyph;
    self->_headerGlyph = v7;

    if (self->_headerGlyph)
    {
      -[NTKModuleView contentView](self, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addSubview:", self->_headerGlyph);

      v10 = self->_headerGlyph;
      -[NTKModuleView foregroundColor](self, "foregroundColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDComplicationImageView setColor:](v10, "setColor:", v11);

      headerGlyph = self->_headerGlyph;
    }
    else
    {
      headerGlyph = 0;
    }
  }
  -[CDComplicationImageView setImageProvider:](headerGlyph, "setImageProvider:", v21);
  -[CLKUIColoringLabel setTextProvider:](self->_body2Label, "setTextProvider:", 0);
  headerLeadingLabel = self->_headerLeadingLabel;
  objc_msgSend(v4, "headerTextProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](headerLeadingLabel, "setTextProvider:", v13);

  objc_msgSend(v4, "headerTrailingTextProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setTextProvider:](self->_headerTrailingLabel, "setTextProvider:", v14);
  -[CLKUIColoringLabel setHidden:](self->_headerTrailingLabel, "setHidden:", v14 == 0);
  self->_shouldTruncateHeaderLeadingLabelFirst = objc_msgSend(v4, "shouldTruncateHeaderLeadingLabelFirst");
  body1Label = self->_body1Label;
  objc_msgSend(v4, "bodyTextProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[CLKUIColoringLabel setTextProvider:](body1Label, "setTextProvider:", v16);
  -[CLKUIColoringLabel setNumberOfLines:](self->_body1Label, "setNumberOfLines:", 1);
  v17 = self->_body1Label;
  v18 = (void *)MEMORY[0x1E0C944D0];
  -[NTKModuleView device](self, "device");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_21(v19, (uint64_t)v22);
  objc_msgSend(v18, "systemFontOfSize:weight:", v23, *MEMORY[0x1E0DC1430]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setFont:](v17, "setFont:", v20);

}

- (void)_updateLabelsMaxWidths
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  CDComplicationImageView *headerGlyph;
  double v14;
  double v15;
  int *v16;
  int *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  double v26;

  v26 = 0.0;
  v24 = 0u;
  v25 = 0u;
  v23 = 0u;
  -[NTKModuleView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_21(v3, (uint64_t)&v23);

  v4 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[CDComplicationImageView sizeThatFits:](self->_headerGlyph, "sizeThatFits:", *MEMORY[0x1E0C9D820], v5);
  v7 = v6;
  -[CDComplicationImageView sizeThatFits:](self->_body1Glyph, "sizeThatFits:", v4, v5);
  v9 = v8;
  -[NTKModuleView contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11 - *(double *)&v24 - *((double *)&v24 + 1);

  headerGlyph = self->_headerGlyph;
  v14 = 0.0;
  if (headerGlyph && (-[CDComplicationImageView isHidden](headerGlyph, "isHidden") & 1) == 0)
    v14 = v7 + *((double *)&v25 + 1);
  v15 = v12 - v14;
  if (self->_shouldTruncateHeaderLeadingLabelFirst)
    v16 = &OBJC_IVAR___NTKModularLargeStackTemplateView__headerLeadingLabel;
  else
    v16 = &OBJC_IVAR___NTKModularLargeStackTemplateView__headerTrailingLabel;
  v22 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + *v16);
  if (self->_shouldTruncateHeaderLeadingLabelFirst)
    v17 = &OBJC_IVAR___NTKModularLargeStackTemplateView__headerTrailingLabel;
  else
    v17 = &OBJC_IVAR___NTKModularLargeStackTemplateView__headerLeadingLabel;
  v18 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + *v17);
  if ((objc_msgSend(v18, "isHidden") & 1) == 0)
  {
    objc_msgSend(v18, "setMaxWidth:", v12 - v14);
    objc_msgSend(v18, "sizeThatFits:", v12 - v14, 1.79769313e308);
    v20 = v15 - v19 - v26;
    if (v20 >= 0.0)
      v15 = v20;
    else
      v15 = 0.0;
  }
  objc_msgSend(v22, "setMaxWidth:", v15);
  v21 = v9 + *((double *)&v25 + 1);
  if (!self->_body1Glyph)
    v21 = 0.0;
  -[CLKUIColoringLabel setMaxWidth:](self->_body1Label, "setMaxWidth:", v12 - v21);
  -[CLKUIColoringLabel setMaxWidth:](self->_body2Label, "setMaxWidth:", v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body1Glyph, 0);
  objc_storeStrong((id *)&self->_headerGlyph, 0);
  objc_storeStrong((id *)&self->_body2Label, 0);
  objc_storeStrong((id *)&self->_body1Label, 0);
  objc_storeStrong((id *)&self->_headerTrailingLabel, 0);
  objc_storeStrong((id *)&self->_headerLeadingLabel, 0);
}

@end
