@implementation HUGridCellBackgroundView

+ (id)_sharedBlurEffect
{
  if (qword_1ED57FA98 != -1)
    dispatch_once(&qword_1ED57FA98, &__block_literal_global_108);
  return (id)_MergedGlobals_1_1;
}

void __45__HUGridCellBackgroundView__sharedBlurEffect__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 7);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1_1;
  _MergedGlobals_1_1 = v0;

}

- (void)_createEffectViewIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  -[HUGridCellBackgroundView effectView](self, "effectView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", 0);
    -[HUGridCellBackgroundView setEffectView:](self, "setEffectView:", v4);

    -[HUGridCellBackgroundView effectView](self, "effectView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAutoresizingMask:", 18);

    if (objc_msgSend(MEMORY[0x1E0D319D0], "isAMac"))
    {
      -[HUGridCellBackgroundView traitCollection](self, "traitCollection");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "userInterfaceStyle");

      if (v7 == 1)
      {
        -[HUGridCellBackgroundView effectView](self, "effectView");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "contentView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEA478], "systemMidGrayTintColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setBackgroundColor:", v9);

      }
    }
  }
}

- (void)_createOffCCMaterialViewIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  -[HUGridCellBackgroundView ccOffMaterialView](self, "ccOffMaterialView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[HUGridCellBackgroundView displayOptions](self, "displayOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "displayStyle");

    if (v5 == 3)
    {
      objc_msgSend(MEMORY[0x1E0D14788], "controlCenterModuleBackgroundMaterial");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HUGridCellBackgroundView displayOptions](self, "displayOptions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "displayStyle");

      if (v8 != 2)
      {
LABEL_7:
        -[HUGridCellBackgroundView bounds](self, "bounds");
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v17 = v16;
        -[HUGridCellBackgroundView ccOffMaterialView](self, "ccOffMaterialView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

        -[HUGridCellBackgroundView ccOffMaterialView](self, "ccOffMaterialView");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setAutoresizingMask:", 18);

        return;
      }
      objc_msgSend(MEMORY[0x1E0D14788], "controlCenterTertiaryCapturingMaterial");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v6;
    -[HUGridCellBackgroundView setCcOffMaterialView:](self, "setCcOffMaterialView:", v6);

    goto LABEL_7;
  }
}

- (void)_createOnCCMaterialViewIfNecessary
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  -[HUGridCellBackgroundView ccOnMaterialView](self, "ccOnMaterialView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    -[HUGridCellBackgroundView setCcOnMaterialView:](self, "setCcOnMaterialView:", v4);

    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCellBackgroundView ccOnMaterialView](self, "ccOnMaterialView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v5);

    -[HUGridCellBackgroundView bounds](self, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[HUGridCellBackgroundView ccOnMaterialView](self, "ccOnMaterialView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

    -[HUGridCellBackgroundView ccOnMaterialView](self, "ccOnMaterialView");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAutoresizingMask:", 18);

  }
}

- (void)_createHighlightCCMateriaViewIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  -[HUGridCellBackgroundView ccHighlightMaterialView](self, "ccHighlightMaterialView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0D14788], "controlCenterLightFill");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCellBackgroundView setCcHighlightMaterialView:](self, "setCcHighlightMaterialView:", v4);

    -[HUGridCellBackgroundView ccHighlightMaterialView](self, "ccHighlightMaterialView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 0.0);

    -[HUGridCellBackgroundView bounds](self, "bounds");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[HUGridCellBackgroundView ccHighlightMaterialView](self, "ccHighlightMaterialView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

    -[HUGridCellBackgroundView ccHighlightMaterialView](self, "ccHighlightMaterialView");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAutoresizingMask:", 18);

  }
}

- (void)dealloc
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[HUGridCellBackgroundView backgroundEffectViewGrouper](self, "backgroundEffectViewGrouper");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[HUGridCellBackgroundView effectView](self, "effectView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HUGridCellBackgroundView backgroundEffectViewGrouper](self, "backgroundEffectViewGrouper");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridCellBackgroundView effectView](self, "effectView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "backgroundEffectRemoveCaptureDependent:forBackgroundEffectIdentifier:", v7, CFSTR("HUSharedVisualEffectIdentifierTileOff"));

    }
  }
  v8.receiver = self;
  v8.super_class = (Class)HUGridCellBackgroundView;
  -[HUGridCellBackgroundView dealloc](&v8, sel_dealloc);
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
  -[HUGridCellBackgroundView _updateCornerRadius](self, "_updateCornerRadius");
}

- (void)setDisplayOptions:(id)a3
{
  objc_storeStrong((id *)&self->_displayOptions, a3);
  -[HUGridCellBackgroundView _updateDisplay](self, "_updateDisplay");
}

- (void)setBackgroundTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundTintColor, a3);
  -[HUGridCellBackgroundView _updateBackgroundColor](self, "_updateBackgroundColor");
}

- (void)setOverrideBackgroundEffect:(id)a3
{
  id v5;
  UIBlurEffect *v6;
  UIBlurEffect *v7;
  char v8;
  UIBlurEffect *v9;

  v5 = a3;
  v6 = self->_overrideBackgroundEffect;
  v7 = (UIBlurEffect *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    if (v6)
    {
      v8 = -[UIBlurEffect isEqual:](v6, "isEqual:", v7);

      if ((v8 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_overrideBackgroundEffect, a3);
    -[HUGridCellBackgroundView _updateDisplay](self, "_updateDisplay");
  }
LABEL_8:

}

- (void)setBackgroundEffectViewGrouper:(id)a3
{
  id v4;
  id v5;
  id v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id obj;

  v4 = a3;
  v5 = objc_loadWeakRetained((id *)&self->_backgroundEffectViewGrouper);
  v6 = v4;
  obj = v6;
  if (v5 == v6)
  {

  }
  else
  {
    if (v5)
    {
      v7 = objc_msgSend(v5, "isEqual:", v6);

      v8 = obj;
      if ((v7 & 1) != 0)
        goto LABEL_12;
    }
    else
    {

    }
    -[HUGridCellBackgroundView backgroundEffectViewGrouper](self, "backgroundEffectViewGrouper");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[HUGridCellBackgroundView effectView](self, "effectView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[HUGridCellBackgroundView backgroundEffectViewGrouper](self, "backgroundEffectViewGrouper");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUGridCellBackgroundView effectView](self, "effectView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "backgroundEffectRemoveCaptureDependent:forBackgroundEffectIdentifier:", v13, CFSTR("HUSharedVisualEffectIdentifierTileOff"));

      }
    }
    -[HUGridCellBackgroundView effectView](self, "effectView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_captureSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCellBackgroundView effectView](self, "effectView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_removeCaptureDependent:", v16);

    objc_storeWeak((id *)&self->_backgroundEffectViewGrouper, obj);
    -[HUGridCellBackgroundView _updateDisplay](self, "_updateDisplay");
  }
  v8 = obj;
LABEL_12:

}

- (void)setBackgroundState:(unint64_t)a3
{
  if (self->_backgroundState != a3)
  {
    self->_backgroundState = a3;
    -[HUGridCellBackgroundView _updateDisplay](self, "_updateDisplay");
  }
}

- (void)setPressed:(BOOL)a3
{
  if (self->_pressed != a3)
  {
    self->_pressed = a3;
    -[HUGridCellBackgroundView _updateBackgroundColor](self, "_updateBackgroundColor");
    -[HUGridCellBackgroundView _updateHighlightView](self, "_updateHighlightView");
  }
}

- (void)setNormalizedWallpaperRect:(CGRect)a3
{
  self->_normalizedWallpaperRect = a3;
  -[HUGridCellBackgroundView _updateWallpaperContentsRect](self, "_updateWallpaperContentsRect");
}

- (void)setUseDefaultCellBackgroundColor:(BOOL)a3
{
  if (self->_useDefaultCellBackgroundColor != a3)
  {
    self->_useDefaultCellBackgroundColor = a3;
    -[HUGridCellBackgroundView _updateBackgroundColor](self, "_updateBackgroundColor");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUGridCellBackgroundView;
  -[HUGridCellBackgroundView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[HUGridCellBackgroundView _updateDisplay](self, "_updateDisplay");
}

- (void)_updateDisplay
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
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
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;

  -[HUGridCellBackgroundView displayOptions](self, "displayOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUGridCellBackgroundView _updateBackgroundColor](self, "_updateBackgroundColor");
    if (!-[HUGridCellBackgroundView _shouldUseCCMaterialView](self, "_shouldUseCCMaterialView"))
      goto LABEL_20;
    if (-[HUGridCellBackgroundView backgroundState](self, "backgroundState"))
    {
      if (-[HUGridCellBackgroundView backgroundState](self, "backgroundState") != 1)
      {
LABEL_17:
        -[HUGridCellBackgroundView ccHighlightMaterialView](self, "ccHighlightMaterialView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "superview");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v31)
        {
          -[HUGridCellBackgroundView _createHighlightCCMateriaViewIfNecessary](self, "_createHighlightCCMateriaViewIfNecessary");
          -[HUGridCellBackgroundView ccHighlightMaterialView](self, "ccHighlightMaterialView");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUGridCellBackgroundView addSubview:](self, "addSubview:", v32);

        }
        -[HUGridCellBackgroundView _updateHighlightView](self, "_updateHighlightView");
LABEL_20:
        if (!-[HUGridCellBackgroundView _shouldUseVisualEffectStyle](self, "_shouldUseVisualEffectStyle")
          || -[HUGridCellBackgroundView _shouldUsePrecomputedWallpaperContents](self, "_shouldUsePrecomputedWallpaperContents"))
        {
          -[HUGridCellBackgroundView effectView](self, "effectView");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "removeFromSuperview");
LABEL_29:

          -[HUGridCellBackgroundView _updateCornerRadius](self, "_updateCornerRadius");
          return;
        }
        -[HUGridCellBackgroundView _createEffectViewIfNecessary](self, "_createEffectViewIfNecessary");
        -[HUGridCellBackgroundView overrideBackgroundEffect](self, "overrideBackgroundEffect");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        -[HUGridCellBackgroundView backgroundEffectViewGrouper](self, "backgroundEffectViewGrouper");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if (v34)
        {
          -[HUGridCellBackgroundView effectView](self, "effectView");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "backgroundEffectRemoveCaptureDependent:forBackgroundEffectIdentifier:", v37, CFSTR("HUSharedVisualEffectIdentifierTileOff"));

          -[HUGridCellBackgroundView effectView](self, "effectView");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "_captureSource");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUGridCellBackgroundView effectView](self, "effectView");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "_removeCaptureDependent:", v40);

          -[HUGridCellBackgroundView overrideBackgroundEffect](self, "overrideBackgroundEffect");
          v41 = objc_claimAutoreleasedReturnValue();
        }
        else
        {

          if (v36)
          {
            -[HUGridCellBackgroundView backgroundEffectViewGrouper](self, "backgroundEffectViewGrouper");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[HUGridCellBackgroundView effectView](self, "effectView");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "backgroundEffectAddCaptureDependent:forBackgroundEffectIdentifier:", v43, CFSTR("HUSharedVisualEffectIdentifierTileOff"));
            goto LABEL_28;
          }
          objc_msgSend((id)objc_opt_class(), "_sharedBlurEffect");
          v41 = objc_claimAutoreleasedReturnValue();
        }
        v42 = (void *)v41;
        -[HUGridCellBackgroundView effectView](self, "effectView");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setEffect:", v42);
LABEL_28:

        -[HUGridCellBackgroundView effectView](self, "effectView");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUGridCellBackgroundView addSubview:](self, "addSubview:", v44);

        -[HUGridCellBackgroundView bounds](self, "bounds");
        v46 = v45;
        v48 = v47;
        v50 = v49;
        v52 = v51;
        -[HUGridCellBackgroundView effectView](self, "effectView");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setFrame:", v46, v48, v50, v52);
        goto LABEL_29;
      }
      -[HUGridCellBackgroundView ccOffMaterialView](self, "ccOffMaterialView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        -[HUGridCellBackgroundView ccOffMaterialView](self, "ccOffMaterialView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "removeFromSuperview");

      }
      -[HUGridCellBackgroundView ccOnMaterialView](self, "ccOnMaterialView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        -[HUGridCellBackgroundView _createOnCCMaterialViewIfNecessary](self, "_createOnCCMaterialViewIfNecessary");
        -[HUGridCellBackgroundView ccOnMaterialView](self, "ccOnMaterialView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUGridCellBackgroundView addSubview:](self, "addSubview:", v9);

      }
      -[HUGridCellBackgroundView bounds](self, "bounds");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      -[HUGridCellBackgroundView ccOnMaterialView](self, "ccOnMaterialView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HUGridCellBackgroundView ccOnMaterialView](self, "ccOnMaterialView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "superview");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[HUGridCellBackgroundView ccOnMaterialView](self, "ccOnMaterialView");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeFromSuperview");

      }
      -[HUGridCellBackgroundView ccOffMaterialView](self, "ccOffMaterialView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "superview");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        -[HUGridCellBackgroundView _createOffCCMaterialViewIfNecessary](self, "_createOffCCMaterialViewIfNecessary");
        -[HUGridCellBackgroundView ccOffMaterialView](self, "ccOffMaterialView");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUGridCellBackgroundView addSubview:](self, "addSubview:", v24);

      }
      -[HUGridCellBackgroundView bounds](self, "bounds");
      v11 = v25;
      v13 = v26;
      v15 = v27;
      v17 = v28;
      -[HUGridCellBackgroundView ccOffMaterialView](self, "ccOffMaterialView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v29 = v18;
    objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

    goto LABEL_17;
  }
}

- (void)_updateCornerRadius
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  id v22;

  -[HUGridCellBackgroundView effectView](self, "effectView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HUGridCellBackgroundView cornerRadius](self, "cornerRadius");
    v6 = v5;
    -[HUGridCellBackgroundView effectView](self, "effectView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setContinuousCornerRadius:", v6);

  }
  else
  {
    -[HUGridCellBackgroundView ccOffMaterialView](self, "ccOffMaterialView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "superview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

    }
    else
    {
      -[HUGridCellBackgroundView ccOnMaterialView](self, "ccOnMaterialView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "superview");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        -[HUGridCellBackgroundView cornerRadius](self, "cornerRadius");
        -[HUGridCellBackgroundView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
        v21 = 1;
        goto LABEL_8;
      }
    }
    -[HUGridCellBackgroundView cornerRadius](self, "cornerRadius");
    v13 = v12;
    -[HUGridCellBackgroundView ccOffMaterialView](self, "ccOffMaterialView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_setContinuousCornerRadius:", v13);

    -[HUGridCellBackgroundView cornerRadius](self, "cornerRadius");
    v16 = v15;
    -[HUGridCellBackgroundView ccOnMaterialView](self, "ccOnMaterialView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "_setContinuousCornerRadius:", v16);

    -[HUGridCellBackgroundView cornerRadius](self, "cornerRadius");
    v19 = v18;
    -[HUGridCellBackgroundView ccHighlightMaterialView](self, "ccHighlightMaterialView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_setContinuousCornerRadius:", v19);

    -[HUGridCellBackgroundView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", 0.0);
  }
  v21 = 0;
LABEL_8:
  -[HUGridCellBackgroundView layer](self, "layer");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setMasksToBounds:", v21);

}

- (void)_updateWallpaperContentsRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  if (-[HUGridCellBackgroundView _shouldUsePrecomputedWallpaperContents](self, "_shouldUsePrecomputedWallpaperContents"))
  {
    -[HUGridCellBackgroundView normalizedWallpaperRect](self, "normalizedWallpaperRect");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[HUGridCellBackgroundView layer](self, "layer");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContentsRect:", v4, v6, v8, v10);

  }
}

- (void)_updateBackgroundColor
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  HUGridCellBackgroundView *v10;
  void *v11;
  id v12;

  if (-[HUGridCellBackgroundView _shouldUseCCMaterialView](self, "_shouldUseCCMaterialView"))
  {
    -[HUGridCellBackgroundView setBackgroundColor:](self, "setBackgroundColor:", 0);
    return;
  }
  if (-[HUGridCellBackgroundView useDefaultCellBackgroundColor](self, "useDefaultCellBackgroundColor"))
  {
    -[HUGridCellBackgroundView traitCollection](self, "traitCollection");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "userInterfaceStyle") == 2)
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGray5Color");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  -[HUGridCellBackgroundView displayOptions](self, "displayOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "displayStyle");

  if (v5 == 4)
  {
    if (-[HUGridCellBackgroundView backgroundState](self, "backgroundState") == 1)
      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGray5Color");
    v9 = objc_claimAutoreleasedReturnValue();
    v12 = (id)v9;
    v10 = self;
  }
  else
  {
    -[HUGridCellBackgroundView backgroundTintColor](self, "backgroundTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v8;

    if (-[HUGridCellBackgroundView backgroundState](self, "backgroundState") != 1)
    {
      -[HUGridCellBackgroundView _normalBackgroundColor](self, "_normalBackgroundColor");
      v3 = objc_claimAutoreleasedReturnValue();
LABEL_20:
      v11 = (void *)v3;
      -[HUGridCellBackgroundView setBackgroundColor:](self, "setBackgroundColor:", v3);

      goto LABEL_21;
    }
    v10 = self;
    v9 = (uint64_t)v12;
  }
  -[HUGridCellBackgroundView setBackgroundColor:](v10, "setBackgroundColor:", v9);
LABEL_21:

}

- (void)_updateHighlightView
{
  _QWORD v3[5];

  if (-[HUGridCellBackgroundView _shouldUseCCMaterialView](self, "_shouldUseCCMaterialView"))
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __48__HUGridCellBackgroundView__updateHighlightView__block_invoke;
    v3[3] = &unk_1E6F4D988;
    v3[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v3, 0.25);
  }
}

void __48__HUGridCellBackgroundView__updateHighlightView__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;

  if (objc_msgSend(*(id *)(a1 + 32), "isPressed") && !objc_msgSend(*(id *)(a1 + 32), "backgroundState"))
  {
    objc_msgSend(*(id *)(a1 + 32), "ccHighlightMaterialView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 0.25;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "ccHighlightMaterialView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = 0.0;
  }
  v4 = v2;
  objc_msgSend(v2, "setAlpha:", v3);

}

- (BOOL)_shouldUseCCMaterialView
{
  void *v2;
  unint64_t v3;

  -[HUGridCellBackgroundView displayOptions](self, "displayOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "displayStyle");

  return (v3 < 5) & (0xCu >> v3);
}

- (BOOL)_shouldUseVisualEffectStyle
{
  void *v3;
  unint64_t v4;

  -[HUGridCellBackgroundView displayOptions](self, "displayOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "displayStyle");

  return v4 <= 1
      && !-[HUGridCellBackgroundView backgroundState](self, "backgroundState")
      && !UIAccessibilityIsReduceTransparencyEnabled();
}

- (BOOL)_shouldUsePrecomputedWallpaperContents
{
  void *v3;
  BOOL v4;

  if (!-[HUGridCellBackgroundView _shouldUseVisualEffectStyle](self, "_shouldUseVisualEffectStyle"))
    return 0;
  -[HUGridCellBackgroundView displayOptions](self, "displayOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "displayStyle"))
    v4 = 0;
  else
    v4 = +[HUGraphicsUtilities shouldReduceVisualEffects](HUGraphicsUtilities, "shouldReduceVisualEffects");

  return v4;
}

- (id)_normalBackgroundColor
{
  void *v3;
  uint64_t v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  double *v8;
  void *v9;

  if (!-[HUGridCellBackgroundView _shouldUseCCMaterialView](self, "_shouldUseCCMaterialView")
    && UIAccessibilityIsReduceTransparencyEnabled())
  {
    -[HUGridCellBackgroundView displayOptions](self, "displayOptions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "contentColorStyle");

    if (v4 == 1)
    {
      -[HUGridCellBackgroundView traitCollection](self, "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "userInterfaceStyle") == 2;
      v7 = (void *)MEMORY[0x1E0CEA478];
      v8 = (double *)&unk_1B9442550;
      goto LABEL_9;
    }
    if (!v4)
    {
      -[HUGridCellBackgroundView traitCollection](self, "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "userInterfaceStyle") == 2;
      v7 = (void *)MEMORY[0x1E0CEA478];
      v8 = (double *)&unk_1B9442560;
LABEL_9:
      objc_msgSend(v7, "colorWithWhite:alpha:", v8[v6], 1.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      return v9;
    }
  }
  v9 = 0;
  return v9;
}

- (unint64_t)backgroundState
{
  return self->_backgroundState;
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (HUGridCellBackgroundDisplayOptions)displayOptions
{
  return self->_displayOptions;
}

- (UIColor)backgroundTintColor
{
  return self->_backgroundTintColor;
}

- (UIBlurEffect)overrideBackgroundEffect
{
  return self->_overrideBackgroundEffect;
}

- (BOOL)useDefaultCellBackgroundColor
{
  return self->_useDefaultCellBackgroundColor;
}

- (CGRect)normalizedWallpaperRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedWallpaperRect.origin.x;
  y = self->_normalizedWallpaperRect.origin.y;
  width = self->_normalizedWallpaperRect.size.width;
  height = self->_normalizedWallpaperRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (HUBackgroundEffectViewGrouping)backgroundEffectViewGrouper
{
  return (HUBackgroundEffectViewGrouping *)objc_loadWeakRetained((id *)&self->_backgroundEffectViewGrouper);
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_effectView, a3);
}

- (UIView)ccOnMaterialView
{
  return self->_ccOnMaterialView;
}

- (void)setCcOnMaterialView:(id)a3
{
  objc_storeStrong((id *)&self->_ccOnMaterialView, a3);
}

- (UIView)ccOffMaterialView
{
  return self->_ccOffMaterialView;
}

- (void)setCcOffMaterialView:(id)a3
{
  objc_storeStrong((id *)&self->_ccOffMaterialView, a3);
}

- (UIView)ccHighlightMaterialView
{
  return self->_ccHighlightMaterialView;
}

- (void)setCcHighlightMaterialView:(id)a3
{
  objc_storeStrong((id *)&self->_ccHighlightMaterialView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ccHighlightMaterialView, 0);
  objc_storeStrong((id *)&self->_ccOffMaterialView, 0);
  objc_storeStrong((id *)&self->_ccOnMaterialView, 0);
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_destroyWeak((id *)&self->_backgroundEffectViewGrouper);
  objc_storeStrong((id *)&self->_overrideBackgroundEffect, 0);
  objc_storeStrong((id *)&self->_backgroundTintColor, 0);
  objc_storeStrong((id *)&self->_displayOptions, 0);
}

@end
