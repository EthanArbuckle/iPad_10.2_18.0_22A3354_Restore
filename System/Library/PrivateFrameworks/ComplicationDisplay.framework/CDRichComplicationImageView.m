@implementation CDRichComplicationImageView

- (CDRichComplicationImageView)initWithDevice:(id)a3 useAccentColor:(BOOL)a4
{
  id v7;
  CDRichComplicationImageView *v8;
  CDRichComplicationImageView *v9;
  void *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CDRichComplicationImageView;
  v8 = -[CDRichComplicationImageView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a3);
    v9->_useAccentColor = a4;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CDRichComplicationImageView setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[CDRichComplicationImageView setOpaque:](v9, "setOpaque:", 0);
  }

  return v9;
}

- (id)_createMonochromeImageView
{
  __objc2_class **v2;

  if (self->_useAccentColor)
    v2 = off_24CF20B80;
  else
    v2 = &off_24CF20B88;
  return objc_alloc_init(*v2);
}

- (void)setImageProvider:(id)a3 reason:(int64_t)a4
{
  objc_class *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v25 = a3;
  objc_storeStrong((id *)&self->_imageProvider, a3);
  if ((unint64_t)(a4 - 1) >= 3)
    a4 = 0;
  v7 = (objc_class *)objc_msgSend(v25, "ImageViewClass");
  if (!v7)
    v7 = (objc_class *)objc_opt_class();
  -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();

  if (v7 != (objc_class *)v9)
  {
    -[CDRichComplicationImageView layer](self, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFilters:", MEMORY[0x24BDBD1A8]);

    -[CDRichComplicationImageView setHostingOverrideView:](self, "setHostingOverrideView:", v7 != (objc_class *)objc_opt_class());
    -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeFromSuperview");

    -[CDRichComplicationImageView monochromeImageView](self, "monochromeImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeFromSuperview");

    if (-[CDRichComplicationImageView isHostingOverrideView](self, "isHostingOverrideView"))
    {
      v13 = [v7 alloc];
      -[CDRichComplicationImageView device](self, "device");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initFullColorImageViewWithDevice:", v14);
    }
    else
    {
      v16 = objc_alloc(MEMORY[0x24BEBD668]);
      v15 = (void *)objc_msgSend(v16, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      -[CDRichComplicationImageView _createMonochromeImageView](self, "_createMonochromeImageView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAutoresizingMask:", 0);
      objc_msgSend(v14, "setHidden:", 1);
      objc_msgSend(v14, "setFilterProvider:", self);
      objc_msgSend(v14, "setMulticolorAlpha:", 1.0);
      -[CDRichComplicationImageView addSubview:](self, "addSubview:", v14);
      -[CDRichComplicationImageView setMonochromeImageView:](self, "setMonochromeImageView:", v14);
    }

    -[CDRichComplicationImageView addSubview:](self, "addSubview:", v15);
    -[CDRichComplicationImageView setRichComplicationImageView:](self, "setRichComplicationImageView:", v15);
    if (-[CDRichComplicationImageView isHostingOverrideView](self, "isHostingOverrideView"))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v15, "setFilterProvider:", self);
      if (-[CDRichComplicationImageView isPaused](self, "isPaused"))
        objc_msgSend(v15, "pauseLiveFullColorImageView");
      else
        objc_msgSend(v15, "resumeLiveFullColorImageView");
    }

  }
  self->_monochromeFilterType = objc_msgSend(v25, "monochromeFilterType");
  if (v25)
  {
    if (-[CDRichComplicationImageView isHostingOverrideView](self, "isHostingOverrideView"))
    {
      -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[CDRichComplicationImageView fontDescriptor](self, "fontDescriptor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setFontDescriptor:", v18);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[CDRichComplicationImageView fontSizeFactor](self, "fontSizeFactor");
        objc_msgSend(v17, "setFontSizeFactor:");
      }
      objc_msgSend(v17, "configureWithImageProvider:reason:", v25, a4);
    }
    else
    {
      -[CDRichComplicationImageView setPrefersFilterOverTransition:](self, "setPrefersFilterOverTransition:", objc_msgSend(v25, "prefersFilterOverTransition"));
      -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[CDRichComplicationImageView _isSymbolImageProvider](self, "_isSymbolImageProvider"))
        objc_msgSend(v25, "createSymbolImage");
      else
        objc_msgSend(v25, "image");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setImage:", v21);

      objc_msgSend(v25, "tintColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTintColor:", v22);

      objc_msgSend(v17, "setHidden:", 0);
      objc_msgSend(v25, "tintedImageProvider");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        -[CDRichComplicationImageView monochromeImageView](self, "monochromeImageView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setImageProvider:", v23);

      }
    }

    if (self->_inMonochromeModeFraction == 1.0)
      -[CDRichComplicationImageView updateMonochromeColor](self, "updateMonochromeColor");
    else
      -[CDRichComplicationImageView transitionToMonochromeWithFraction:](self, "transitionToMonochromeWithFraction:");
    -[CDRichComplicationImageView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHidden:", 1);

    -[CDRichComplicationImageView monochromeImageView](self, "monochromeImageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHidden:", 1);

  }
}

- (void)layoutSubviews
{
  void *v3;
  double Width;
  double MidX;
  void *v6;
  double v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v19.receiver = self;
  v19.super_class = (Class)CDRichComplicationImageView;
  -[CDRichComplicationImageView layoutSubviews](&v19, sel_layoutSubviews);
  -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRichComplicationImageView bounds](self, "bounds");
  Width = CGRectGetWidth(v20);
  -[CDRichComplicationImageView bounds](self, "bounds");
  objc_msgSend(v3, "setBounds:", 0.0, 0.0, Width, CGRectGetHeight(v21));
  -[CDRichComplicationImageView bounds](self, "bounds");
  MidX = CGRectGetMidX(v22);
  -[CDRichComplicationImageView bounds](self, "bounds");
  objc_msgSend(v3, "setCenter:", MidX, CGRectGetMidY(v23));
  -[CDRichComplicationImageView monochromeImageView](self, "monochromeImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDRichComplicationImageView bounds](self, "bounds");
  v7 = CGRectGetMidX(v24);
  -[CDRichComplicationImageView bounds](self, "bounds");
  objc_msgSend(v6, "setCenter:", v7, CGRectGetMidY(v25));

  -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "size");
    v13 = v12;
    -[CDRichComplicationImageView bounds](self, "bounds");
    if (v13 <= v14
      && (objc_msgSend(v11, "size"), v16 = v15, -[CDRichComplicationImageView bounds](self, "bounds"), v16 <= v17))
    {
      v18 = 4;
    }
    else
    {
      v18 = 2;
    }
    objc_msgSend(v10, "setContentMode:", v18);

  }
}

- (void)setPaused:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL8 v6;
  void *v7;
  id v8;

  if (self->_paused != a3)
  {
    v3 = a3;
    self->_paused = a3;
    if (-[CDRichComplicationImageView isHostingOverrideView](self, "isHostingOverrideView"))
    {
      -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v5;
      if (v3)
        objc_msgSend(v5, "pauseLiveFullColorImageView");
      else
        objc_msgSend(v5, "resumeLiveFullColorImageView");
    }
    else
    {
      v6 = -[CDRichComplicationImageView isPaused](self, "isPaused");
      -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setShouldRasterize:", v6);

    }
  }
}

- (void)setFontDescriptor:(id)a3
{
  UIFontDescriptor *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  UIFontDescriptor *v9;

  v5 = (UIFontDescriptor *)a3;
  if (self->_fontDescriptor != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_fontDescriptor, a3);
    v6 = -[CDRichComplicationImageView isHostingOverrideView](self, "isHostingOverrideView");
    v5 = v9;
    if (v6)
    {
      -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[CDRichComplicationImageView fontDescriptor](self, "fontDescriptor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setFontDescriptor:", v8);

      }
      v5 = v9;
    }
  }

}

- (void)setFontSizeFactor:(double)a3
{
  id v4;

  if (self->_fontSizeFactor != a3)
  {
    self->_fontSizeFactor = a3;
    if (-[CDRichComplicationImageView isHostingOverrideView](self, "isHostingOverrideView"))
    {
      -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[CDRichComplicationImageView fontSizeFactor](self, "fontSizeFactor");
        objc_msgSend(v4, "setFontSizeFactor:");
      }

    }
  }
}

- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "renderSynchronouslyWithImageQueueDiscard:inGroup:", v4, v7);

}

- (BOOL)_isSymbolImageProvider
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)_isSymbolImageProviderWithoutSpecificSize
{
  void *v3;
  BOOL v4;
  void *v5;

  if (!-[CDRichComplicationImageView _isSymbolImageProvider](self, "_isSymbolImageProvider"))
    return 0;
  -[CLKFullColorImageProvider pointSize](self->_imageProvider, "pointSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[CLKFullColorImageProvider overridePointSize](self->_imageProvider, "overridePointSize");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;

  }
  return v4;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  float v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  float v41;
  void *v42;
  void *v43;
  double v44;
  id v45;

  self->_inMonochromeModeFraction = a3;
  if (-[CDRichComplicationImageView isHostingOverrideView](self, "isHostingOverrideView"))
  {
    -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      v45 = v7;
      v22 = a3;
LABEL_13:
      objc_msgSend(v7, "transitionToMonochromeWithFraction:", v22);
      goto LABEL_14;
    }
  }
  -[CDRichComplicationImageView monochromeImageView](self, "monochromeImageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CDRichComplicationImageView layer](self, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFilters:", MEMORY[0x24BDBD1A8]);

    if (fabs(a3) >= 0.00000011920929)
    {
      if (fabs(a3 + -1.0) < 0.00000011920929)
      {
        -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setHidden:", 1);

        -[CDRichComplicationImageView monochromeImageView](self, "monochromeImageView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setHidden:", 0);

        -[CDRichComplicationImageView monochromeImageView](self, "monochromeImageView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "layer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v21) = 1.0;
        objc_msgSend(v20, "setOpacity:", v21);

        -[CDRichComplicationImageView monochromeImageView](self, "monochromeImageView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
      v23 = -[CDRichComplicationImageView prefersFilterOverTransition](self, "prefersFilterOverTransition");
      -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (!v23)
      {
        objc_msgSend(v24, "setHidden:", 0);

        -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "layer");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 1.0 - a3;
        *(float *)&v39 = v36;
        objc_msgSend(v38, "setOpacity:", v39);

        -[CDRichComplicationImageView monochromeImageView](self, "monochromeImageView");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setHidden:", 0);

        -[CDRichComplicationImageView monochromeImageView](self, "monochromeImageView");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "layer");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = a3;
        *(float *)&v44 = v41;
        objc_msgSend(v43, "setOpacity:", v44);

        -[CDRichComplicationImageView monochromeImageView](self, "monochromeImageView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v7;
        v22 = 1.0;
        goto LABEL_13;
      }
      objc_msgSend(v24, "setHidden:", 1);

      -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "layer");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v28) = 1.0;
      objc_msgSend(v27, "setOpacity:", v28);

      -[CDRichComplicationImageView monochromeImageView](self, "monochromeImageView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setHidden:", 0);

      -[CDRichComplicationImageView monochromeImageView](self, "monochromeImageView");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "layer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v32) = 1.0;
      objc_msgSend(v31, "setOpacity:", v32);

      -[CDRichComplicationImageView filterProvider](self, "filterProvider");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[CDRichComplicationImageView monochromeImageView](self, "monochromeImageView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "filtersForView:style:fraction:", v34, -[CDRichComplicationImageView _filterStyle](self, "_filterStyle"), a3);
      v45 = (id)objc_claimAutoreleasedReturnValue();

      v16 = v45;
      if (!v45)
        goto LABEL_15;
      -[CDRichComplicationImageView monochromeImageView](self, "monochromeImageView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "layer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setFilters:", v45);

    }
    else
    {
      -[CDRichComplicationImageView monochromeImageView](self, "monochromeImageView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setHidden:", 1);

      -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHidden:", 0);

      -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
      v45 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v14) = 1.0;
      objc_msgSend(v13, "setOpacity:", v14);
    }
LABEL_9:

LABEL_14:
    v16 = v45;
    goto LABEL_15;
  }
  -[CDRichComplicationImageView filterProvider](self, "filterProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "filtersForView:style:fraction:", self, -[CDRichComplicationImageView _filterStyle](self, "_filterStyle"), a3);
  v45 = (id)objc_claimAutoreleasedReturnValue();

  v16 = v45;
  if (v45)
  {
    -[CDRichComplicationImageView layer](self, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFilters:", v45);
    goto LABEL_9;
  }
LABEL_15:

}

- (void)updateMonochromeColor
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  self->_inMonochromeModeFraction = 1.0;
  if (-[CDRichComplicationImageView isHostingOverrideView](self, "isHostingOverrideView"))
  {
    -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_respondsToSelector();

    if ((v4 & 1) != 0)
    {
      -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "updateMonochromeColor");
LABEL_8:
      v14 = v16;
      goto LABEL_9;
    }
  }
  -[CDRichComplicationImageView monochromeImageView](self, "monochromeImageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CDRichComplicationImageView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFilters:", MEMORY[0x24BDBD1A8]);

    -[CDRichComplicationImageView monochromeImageView](self, "monochromeImageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 0);

    -[CDRichComplicationImageView monochromeImageView](self, "monochromeImageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = 1.0;
    objc_msgSend(v10, "setOpacity:", v11);

    -[CDRichComplicationImageView monochromeImageView](self, "monochromeImageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateMonochromeColor");

    -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidden:", 1);
    goto LABEL_8;
  }
  -[CDRichComplicationImageView filterProvider](self, "filterProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "filtersForView:style:", self, -[CDRichComplicationImageView _filterStyle](self, "_filterStyle"));
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v14 = v16;
  if (v16)
  {
    -[CDRichComplicationImageView layer](self, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFilters:", v16);

    goto LABEL_8;
  }
LABEL_9:

}

- (int64_t)_filterStyle
{
  int64_t v2;

  v2 = 3;
  if (!self->_useAccentColor)
    v2 = 1;
  if (self->_monochromeFilterType)
    return 2 * self->_useAccentColor;
  else
    return v2;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  void *v8;
  void *v9;

  -[CDRichComplicationImageView filterProvider](self, "filterProvider", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filtersForView:style:fraction:", self, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  void *v6;
  void *v7;

  -[CDRichComplicationImageView filterProvider](self, "filterProvider", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filtersForView:style:", self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  void *v8;
  void *v9;

  -[CDRichComplicationImageView filterProvider](self, "filterProvider", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filterForView:style:fraction:", self, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  void *v6;
  void *v7;

  -[CDRichComplicationImageView filterProvider](self, "filterProvider", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filterForView:style:", self, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[CDRichComplicationImageView filterProvider](self, "filterProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "colorForView:accented:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)interpolatedColorForView:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[CDRichComplicationImageView filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CDRichComplicationImageView filterProvider](self, "filterProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "interpolatedColorForView:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)backgroundColorForView:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CDRichComplicationImageView filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "backgroundColorForView:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)viewShouldIgnoreTwoPieceImage:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;

  v4 = a3;
  -[CDRichComplicationImageView filterProvider](self, "filterProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CDRichComplicationImageView filterProvider](self, "filterProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "viewShouldIgnoreTwoPieceImage:", v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setTintedFraction:(double)a3
{
  id v4;

  -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_254B82818))
    objc_msgSend(v4, "setTintedFraction:", a3);

}

- (void)setTintedPlatterColor:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CDRichComplicationImageView richComplicationImageView](self, "richComplicationImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_254B82818))
    objc_msgSend(v4, "setTintedPlatterColor:", v5);

}

- (CLKMonochromeFilterProvider)filterProvider
{
  return (CLKMonochromeFilterProvider *)objc_loadWeakRetained((id *)&self->_filterProvider);
}

- (void)setFilterProvider:(id)a3
{
  objc_storeWeak((id *)&self->_filterProvider, a3);
}

- (CLKDevice)device
{
  return self->_device;
}

- (BOOL)useAccentColor
{
  return self->_useAccentColor;
}

- (NSNumber)tritiumUpdateMode
{
  return self->_tritiumUpdateMode;
}

- (UIFontDescriptor)fontDescriptor
{
  return self->_fontDescriptor;
}

- (double)fontSizeFactor
{
  return self->_fontSizeFactor;
}

- (CLKFullColorImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(id)a3
{
  objc_storeStrong((id *)&self->_imageProvider, a3);
}

- (UIView)richComplicationImageView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_richComplicationImageView);
}

- (void)setRichComplicationImageView:(id)a3
{
  objc_storeWeak((id *)&self->_richComplicationImageView, a3);
}

- (CDStackedImagesComplicationImageView)monochromeImageView
{
  return (CDStackedImagesComplicationImageView *)objc_loadWeakRetained((id *)&self->_monochromeImageView);
}

- (void)setMonochromeImageView:(id)a3
{
  objc_storeWeak((id *)&self->_monochromeImageView, a3);
}

- (BOOL)isHostingOverrideView
{
  return self->_hostingOverrideView;
}

- (void)setHostingOverrideView:(BOOL)a3
{
  self->_hostingOverrideView = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (int64_t)monochromeFilterType
{
  return self->_monochromeFilterType;
}

- (void)setMonochromeFilterType:(int64_t)a3
{
  self->_monochromeFilterType = a3;
}

- (double)inMonochromeModeFraction
{
  return self->_inMonochromeModeFraction;
}

- (void)setInMonochromeModeFraction:(double)a3
{
  self->_inMonochromeModeFraction = a3;
}

- (BOOL)prefersFilterOverTransition
{
  return self->_prefersFilterOverTransition;
}

- (void)setPrefersFilterOverTransition:(BOOL)a3
{
  self->_prefersFilterOverTransition = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_monochromeImageView);
  objc_destroyWeak((id *)&self->_richComplicationImageView);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_fontDescriptor, 0);
  objc_storeStrong((id *)&self->_tritiumUpdateMode, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
}

@end
