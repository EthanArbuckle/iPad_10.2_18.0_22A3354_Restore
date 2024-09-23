@implementation NTKModularSmallStackTemplateView

- (void)_update
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CDComplicationImageView *imageView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  CLKUIColoringLabel *titleLabel;
  void *v17;
  char v18;
  CDComplicationImageView *v19;
  CDComplicationImageView *v20;
  CDComplicationImageView *v21;
  CDComplicationImageView *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
  v27 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKModuleView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKOneColumnModularSmallLayoutAttributes attributesForTemplate:forDevice:](NTKOneColumnModularSmallLayoutAttributes, "attributesForTemplate:forDevice:", v27, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKModularSmallStackTemplateView subtitleLabel](self, "subtitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitleFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v6);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[CDComplicationImageView removeFromSuperview](self->_imageView, "removeFromSuperview");
    imageView = self->_imageView;
    self->_imageView = 0;

    -[NTKModularSmallStackTemplateView titleLabel](self, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "titleFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v9);

    -[NTKModularSmallStackTemplateView titleLabel](self, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "line1TextProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextProvider:", v11);

    -[NTKModularSmallStackTemplateView subtitleLabel](self, "subtitleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "line2TextProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextProvider:", v13);

    v14 = objc_msgSend(v27, "highlightMode");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[CLKUIColoringLabel removeFromSuperview](self->_titleLabel, "removeFromSuperview");
      titleLabel = self->_titleLabel;
      self->_titleLabel = 0;

      objc_msgSend(v27, "line1ImageProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(off_1E6BCA178, "existingImageView:supportsImageProvider:", self->_imageView, v17);
      v19 = self->_imageView;
      if ((v18 & 1) == 0)
      {
        -[CDComplicationImageView removeFromSuperview](v19, "removeFromSuperview");
        objc_msgSend(off_1E6BCA178, "viewForImageProvider:", v17);
        v20 = (CDComplicationImageView *)objc_claimAutoreleasedReturnValue();
        v21 = self->_imageView;
        self->_imageView = v20;

        v22 = self->_imageView;
        if (v22)
        {
          -[NTKModuleView foregroundColor](self, "foregroundColor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[CDComplicationImageView setColor:](v22, "setColor:", v23);

          -[NTKModuleView contentView](self, "contentView");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "addSubview:", self->_imageView);

          v19 = self->_imageView;
        }
        else
        {
          v19 = 0;
        }
      }
      -[CDComplicationImageView setImageProvider:](v19, "setImageProvider:", v17);
      -[NTKModularSmallStackTemplateView subtitleLabel](self, "subtitleLabel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "line2TextProvider");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setTextProvider:", v26);

      v14 = objc_msgSend(v27, "highlightMode");
    }
    else
    {
      v14 = 0;
    }
  }
  -[NTKModularTemplateView setHighlightMode:](self, "setHighlightMode:", v14);
  -[NTKModuleView contentView](self, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNeedsLayout");

}

- (void)_layoutContentView
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double width;
  double height;
  void *v18;
  CDComplicationImageView *imageView;
  void *v20;
  id v21;
  CGRect v22;
  CGRect v23;

  -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKModuleView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKOneColumnModularSmallLayoutAttributes attributesForTemplate:forDevice:](NTKOneColumnModularSmallLayoutAttributes, "attributesForTemplate:forDevice:", v21, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "subtitleBaselineOffset");
  -[NTKModularSmallStackTemplateView _updateLayoutForLabel:baselineOffset:](self, "_updateLayoutForLabel:baselineOffset:", self->_subtitleLabel);
  if (self->_titleLabel
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    objc_msgSend(v4, "titleBaselineOffset");
    -[NTKModularSmallStackTemplateView _updateLayoutForLabel:baselineOffset:](self, "_updateLayoutForLabel:baselineOffset:", self->_titleLabel);
  }
  else if (self->_imageView)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[NTKModuleView contentView](self, "contentView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bounds");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      objc_msgSend(v4, "marginWidth");
      v15 = v14;
      v22.origin.x = v7;
      v22.origin.y = v9;
      v22.size.width = v11;
      v22.size.height = v13;
      v23 = CGRectInset(v22, v15, 0.0);
      width = v23.size.width;
      height = v23.size.height;

      -[CDComplicationImageView sizeThatFits:](self->_imageView, "sizeThatFits:", width, height);
      objc_msgSend(v4, "imageHeight");
      objc_msgSend(v4, "imageOriginY");
      objc_msgSend(v4, "imageHeight");
      -[NTKModuleView device](self, "device");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      CLKRectCenteredXInRectForDevice();

      imageView = self->_imageView;
      -[NTKModuleView device](self, "device");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      CLKPixelAlignRectForDevice();
      -[CDComplicationImageView setFrame:](imageView, "setFrame:");

    }
  }

}

- (void)_updateLayoutForLabel:(id)a3 baselineOffset:(double)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double width;
  double height;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  CGRect v40;
  CGRect v41;

  v39 = a3;
  -[NTKModularTemplateView complicationTemplate](self, "complicationTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKModuleView device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKOneColumnModularSmallLayoutAttributes attributesForTemplate:forDevice:](NTKOneColumnModularSmallLayoutAttributes, "attributesForTemplate:forDevice:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKModuleView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v7, "marginWidth");
  v18 = v17;
  v19 = 0.0;
  v40.origin.x = v10;
  v40.origin.y = v12;
  v40.size.width = v14;
  v40.size.height = v16;
  v41 = CGRectInset(v40, v18, 0.0);
  width = v41.size.width;
  height = v41.size.height;

  objc_msgSend(v39, "setMaxWidth:", width);
  objc_msgSend(v39, "sizeThatFits:", width, height);
  v23 = v22;
  objc_msgSend(v39, "textProvider");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "shrinkTextPreference");

  if (v25)
  {
    objc_msgSend(v39, "font");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "pointSize");
    v28 = v27;

    if (v25 == 1)
    {
      objc_msgSend(v7, "minimumFontSize");
      v19 = v29;
    }
    if (width > 0.0 && v23 > width && v28 > v19)
    {
      do
      {
        v28 = v28 + -1.0;
        objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "widthForMaxWidth:withFont:", v30, width);
        v32 = v31;

      }
      while (v32 > width && v28 > v19);
    }
    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:", v28);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setFont:", v34);

    objc_msgSend(v39, "sizeThatFits:", width, height);
  }
  objc_msgSend(v39, "font");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "ascender");
  -[NTKModuleView device](self, "device");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRoundForDevice();

  -[NTKModuleView device](self, "device");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  CLKRectCenteredXInRectForDevice();

  -[NTKModuleView device](self, "device");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  CLKPixelAlignRectForDevice();
  objc_msgSend(v39, "setFrame:");

}

- (CLKUIColoringLabel)titleLabel
{
  CLKUIColoringLabel *titleLabel;
  CLKUIColoringLabel *v4;
  CLKUIColoringLabel *v5;
  CLKUIColoringLabel *v6;
  void *v7;
  CLKUIColoringLabel *v8;
  void *v9;
  void *v10;
  CLKUIColoringLabel *v11;
  uint64_t v12;
  CLKUIColoringLabel *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v4 = (CLKUIColoringLabel *)objc_opt_new();
    v5 = self->_titleLabel;
    self->_titleLabel = v4;

    v6 = self->_titleLabel;
    -[NTKModularTemplateView timeTravelDate](self, "timeTravelDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setInTimeTravel:](v6, "setInTimeTravel:", v7 != 0);

    v8 = self->_titleLabel;
    -[NTKModuleView foregroundColor](self, "foregroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v8, "setTextColor:", v9);

    -[NTKModuleView contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", self->_titleLabel);

    objc_initWeak(&location, self);
    v11 = self->_titleLabel;
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __46__NTKModularSmallStackTemplateView_titleLabel__block_invoke;
    v17[3] = &unk_1E6BCD7C8;
    objc_copyWeak(&v18, &location);
    -[CLKUIColoringLabel setNowProvider:](v11, "setNowProvider:", v17);
    v13 = self->_titleLabel;
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __46__NTKModularSmallStackTemplateView_titleLabel__block_invoke_2;
    v15[3] = &unk_1E6BCD7F0;
    objc_copyWeak(&v16, &location);
    -[CLKUIColoringLabel setNeedsResizeHandler:](v13, "setNeedsResizeHandler:", v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

id __46__NTKModularSmallStackTemplateView_titleLabel__block_invoke(uint64_t a1)
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

void __46__NTKModularSmallStackTemplateView_titleLabel__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "contentView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsLayout");

}

- (CLKUIColoringLabel)subtitleLabel
{
  CLKUIColoringLabel *subtitleLabel;
  CLKUIColoringLabel *v4;
  CLKUIColoringLabel *v5;
  CLKUIColoringLabel *v6;
  void *v7;
  CLKUIColoringLabel *v8;
  void *v9;
  void *v10;
  CLKUIColoringLabel *v11;
  uint64_t v12;
  CLKUIColoringLabel *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  subtitleLabel = self->_subtitleLabel;
  if (!subtitleLabel)
  {
    v4 = (CLKUIColoringLabel *)objc_opt_new();
    v5 = self->_subtitleLabel;
    self->_subtitleLabel = v4;

    v6 = self->_subtitleLabel;
    -[NTKModularTemplateView timeTravelDate](self, "timeTravelDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setInTimeTravel:](v6, "setInTimeTravel:", v7 != 0);

    v8 = self->_subtitleLabel;
    -[NTKModuleView secondaryForegroundColor](self, "secondaryForegroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v8, "setTextColor:", v9);

    -[NTKModuleView contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", self->_subtitleLabel);

    objc_initWeak(&location, self);
    v11 = self->_subtitleLabel;
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __49__NTKModularSmallStackTemplateView_subtitleLabel__block_invoke;
    v17[3] = &unk_1E6BCD7C8;
    objc_copyWeak(&v18, &location);
    -[CLKUIColoringLabel setNowProvider:](v11, "setNowProvider:", v17);
    v13 = self->_subtitleLabel;
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __49__NTKModularSmallStackTemplateView_subtitleLabel__block_invoke_2;
    v15[3] = &unk_1E6BCD7F0;
    objc_copyWeak(&v16, &location);
    -[CLKUIColoringLabel setNeedsResizeHandler:](v13, "setNeedsResizeHandler:", v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    subtitleLabel = self->_subtitleLabel;
  }
  return subtitleLabel;
}

id __49__NTKModularSmallStackTemplateView_subtitleLabel__block_invoke(uint64_t a1)
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

void __49__NTKModularSmallStackTemplateView_subtitleLabel__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "contentView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNeedsLayout");

}

+ (BOOL)handlesComplicationTemplate:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (handlesComplicationTemplate__onceToken != -1)
    dispatch_once(&handlesComplicationTemplate__onceToken, &__block_literal_global_6);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = (id)handlesComplicationTemplate___supportedClasses;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          LOBYTE(v5) = 1;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_13:

  return v5;
}

void __64__NTKModularSmallStackTemplateView_handlesComplicationTemplate___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)handlesComplicationTemplate___supportedClasses;
  handlesComplicationTemplate___supportedClasses = v0;

}

+ (BOOL)supportsComplicationFamily:(int64_t)a3
{
  return !a3 || a3 == 7;
}

- (void)_enumerateForegroundColoringViewsWithBlock:(id)a3
{
  void (*v5)(void);
  id v6;

  v5 = (void (*)(void))*((_QWORD *)a3 + 2);
  v6 = a3;
  v5();
  (*((void (**)(id, CDComplicationImageView *))a3 + 2))(v6, self->_imageView);

}

- (void)_enumerateSecondaryForegroundColoringViewsWithBlock:(id)a3
{
  (*((void (**)(id, CLKUIColoringLabel *))a3 + 2))(a3, self->_subtitleLabel);
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (CDComplicationImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
}

@end
