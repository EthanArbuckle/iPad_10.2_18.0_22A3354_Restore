@implementation HUGridCell

- (void)setRearranging:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_rearranging != a3)
  {
    v3 = a3;
    self->_rearranging = a3;
    -[HUGridCell layer](self, "layer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[HUGridCell frame](self, "frame");
    +[HUGraphicsUtilities legacy_setRearrangingAnimation:layer:frame:](HUGraphicsUtilities, "legacy_setRearrangingAnimation:layer:frame:", v3, v5);

  }
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  return a3;
}

- (void)setContentEffect:(id)a3
{
  id v5;
  UIVisualEffect *v6;
  UIVisualEffect *v7;
  char v8;
  UIVisualEffect *v9;
  void *v10;
  UIVisualEffect *v11;

  v5 = a3;
  v6 = self->_contentEffect;
  v7 = (UIVisualEffect *)v5;
  v11 = v7;
  if (v6 == v7)
  {

    v10 = v11;
  }
  else
  {
    if (v6)
    {
      v8 = -[UIVisualEffect isEqual:](v6, "isEqual:", v7);

      v9 = v11;
      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_contentEffect, a3);
    -[HUGridCell gridForegroundView](self, "gridForegroundView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEffect:", v11);
  }

  v9 = v11;
LABEL_9:

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HUGridCell;
  -[HUGridCell layoutSubviews](&v21, sel_layoutSubviews);
  if (!-[HUGridCell managesOwnBackgroundViewLayout](self, "managesOwnBackgroundViewLayout"))
  {
    -[HUGridCell bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[HUGridCell gridBackgroundView](self, "gridBackgroundView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  }
  -[HUGridCell bounds](self, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[HUGridCell gridForegroundView](self, "gridForegroundView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

}

- (UIView)gridForegroundContentView
{
  void *v2;
  void *v3;

  -[HUGridCell gridForegroundView](self, "gridForegroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (UIVisualEffectView)gridForegroundView
{
  return self->_gridForegroundView;
}

- (BOOL)managesOwnBackgroundViewLayout
{
  return 0;
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  BOOL v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  double v59;
  id v60;
  uint64_t v61;
  void *v62;
  id v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  id v73;
  uint64_t v74;
  void *v75;
  void *v76;
  double v77;
  _QWORD v78[2];
  CGRect v79;
  CGRect v80;

  v78[1] = *MEMORY[0x1E0C80C00];
  -[HUGridCell item](self, "item", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E20]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridCell setPrimaryState:](self, "setPrimaryState:", objc_msgSend(v6, "integerValue"));

  -[HUGridCell item](self, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D30E80]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v9 && (v10 = -[HUGridCell primaryState](self, "primaryState"), v10 != objc_msgSend(v9, "integerValue"))
     || -[HUGridCell primaryState](self, "primaryState") == 2;
  -[HUGridCell gridBackgroundView](self, "gridBackgroundView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundState:", v11);

  -[HUGridCell _updateForegroundStyle](self, "_updateForegroundStyle");
  -[HUGridCell layoutOptions](self, "layoutOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "onStateBorderStyle");

  switch(v14)
  {
    case 0:
      goto LABEL_16;
    case 1:
      -[HUGridCell _removeDashedBorderLayer](self, "_removeDashedBorderLayer");
      objc_msgSend(MEMORY[0x1E0CEA478], "systemLightGrayColor");
      v73 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v74 = objc_msgSend(v73, "CGColor");
      -[HUGridCell gridBackgroundView](self, "gridBackgroundView");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "layer");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "setBorderColor:", v74);

      if (-[HUGridCell primaryState](self, "primaryState") == 2)
        v77 = 1.0;
      else
        v77 = 0.0;
      -[HUGridCell gridBackgroundView](self, "gridBackgroundView");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "layer");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v70;
      v72 = v77;
      goto LABEL_22;
    case 2:
      if (-[HUGridCell primaryState](self, "primaryState") == 2)
      {
        -[HUGridCell dashedBorderLayer](self, "dashedBorderLayer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          objc_msgSend(MEMORY[0x1E0CD2840], "layer");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUGridCell setDashedBorderLayer:](self, "setDashedBorderLayer:", v16);

          -[HUGridCell gridBackgroundView](self, "gridBackgroundView");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "layer");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUGridCell dashedBorderLayer](self, "dashedBorderLayer");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addSublayer:", v19);

          v78[0] = &unk_1E70410F8;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUGridCell dashedBorderLayer](self, "dashedBorderLayer");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setLineDashPattern:", v20);

          -[HUGridCell dashedBorderLayer](self, "dashedBorderLayer");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setLineWidth:", 2.0);

          -[HUGridCell dashedBorderLayer](self, "dashedBorderLayer");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setFillColor:", 0);

        }
        -[HUGridCell dashedBorderLayer](self, "dashedBorderLayer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "frame");
        v26 = v25;
        v28 = v27;
        v30 = v29;
        v32 = v31;
        -[HUGridCell bounds](self, "bounds");
        v80.origin.x = v33;
        v80.origin.y = v34;
        v80.size.width = v35;
        v80.size.height = v36;
        v79.origin.x = v26;
        v79.origin.y = v28;
        v79.size.width = v30;
        v79.size.height = v32;
        v37 = CGRectEqualToRect(v79, v80);

        if (!v37)
        {
          -[HUGridCell bounds](self, "bounds");
          v39 = v38;
          v41 = v40;
          v43 = v42;
          v45 = v44;
          -[HUGridCell dashedBorderLayer](self, "dashedBorderLayer");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);

          v47 = (void *)MEMORY[0x1E0CEA390];
          -[HUGridCell dashedBorderLayer](self, "dashedBorderLayer");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "frame");
          v50 = v49;
          v52 = v51;
          v54 = v53;
          v56 = v55;
          -[HUGridCell gridBackgroundView](self, "gridBackgroundView");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "layer");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "cornerRadius");
          objc_msgSend(v47, "bezierPathWithRoundedRect:cornerRadius:", v50, v52, v54, v56, v59);
          v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v61 = objc_msgSend(v60, "CGPath");
          -[HUGridCell dashedBorderLayer](self, "dashedBorderLayer");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "setPath:", v61);

        }
        objc_msgSend(MEMORY[0x1E0CEA478], "systemLightMidGrayColor");
        v63 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v64 = objc_msgSend(v63, "CGColor");

        -[HUGridCell traitCollection](self, "traitCollection");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v65, "userInterfaceStyle");

        if (v66 == 2)
        {
          objc_msgSend(MEMORY[0x1E0CEA478], "systemDarkLightMidGrayColor");
          v67 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v64 = objc_msgSend(v67, "CGColor");

        }
        -[HUGridCell dashedBorderLayer](self, "dashedBorderLayer");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setStrokeColor:", v64);

        goto LABEL_17;
      }
LABEL_16:
      -[HUGridCell _removeDashedBorderLayer](self, "_removeDashedBorderLayer");
LABEL_17:
      -[HUGridCell gridBackgroundView](self, "gridBackgroundView");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "layer");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = v70;
      v72 = 0.0;
LABEL_22:
      objc_msgSend(v70, "setBorderWidth:", v72);

      break;
  }

}

- (int64_t)primaryState
{
  return self->_primaryState;
}

- (void)setPrimaryState:(int64_t)a3
{
  self->_primaryState = a3;
}

- (void)layoutOptionsDidChange
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;

  -[HUGridCell layoutOptions](self, "layoutOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellCornerRadius");
  v5 = v4;
  -[HUGridCell gridBackgroundView](self, "gridBackgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCornerRadius:", v5);

  -[HUGridCell layoutOptions](self, "layoutOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backgroundDisplayOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridCell gridBackgroundView](self, "gridBackgroundView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDisplayOptions:", v8);

  -[HUGridCell layoutOptions](self, "layoutOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cellCornerRadius");
  v12 = v11;
  -[HUGridCell layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCornerRadius:", v12);

  -[HUGridCell _updateForegroundStyle](self, "_updateForegroundStyle");
}

- (void)_updateForegroundStyle
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  id v15;
  double v16;
  double v17;
  id v18;

  v3 = -[HUGridCell iconDisplayStyle](self, "iconDisplayStyle");
  if (v3 == 3)
    v4 = 2;
  else
    v4 = v3;
  if (v4 == 2)
  {
    -[HUGridCell layoutOptions](self, "layoutOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "vibrancyEffect");
    v18 = (id)objc_claimAutoreleasedReturnValue();

    -[HUGridCell layoutOptions](self, "layoutOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "secondaryVibrancyEffect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = v7;
    else
      v8 = v18;
    v9 = v8;

    -[HUGridCell layoutOptions](self, "layoutOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "secondaryContentDimmingFactor");
    v12 = v11;

  }
  else
  {
    v9 = 0;
    v18 = 0;
    v12 = 1.0;
  }
  -[HUGridCell gridForegroundContentView](self, "gridForegroundContentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridCell _updateTintColorSettingsForSubviewsOfView:desiredDisplayStyle:](self, "_updateTintColorSettingsForSubviewsOfView:desiredDisplayStyle:", v13, v4);

  -[HUGridCell contentEffect](self, "contentEffect");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (v18 == v14)
  {
    -[HUGridCell contentEffect](self, "contentEffect");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v9 == v15)
    {
      -[HUGridCell secondaryContentDimmingFactor](self, "secondaryContentDimmingFactor");
      v17 = v16;

      if (v12 == v17)
        goto LABEL_15;
      goto LABEL_14;
    }

    v14 = v18;
  }

LABEL_14:
  -[HUGridCell setContentEffect:](self, "setContentEffect:", v18);
  -[HUGridCell setSecondaryContentEffect:](self, "setSecondaryContentEffect:", v9);
  -[HUGridCell setSecondaryContentDimmingFactor:](self, "setSecondaryContentDimmingFactor:", v12);
  -[HUGridCell displayStyleDidChange](self, "displayStyleDidChange");
LABEL_15:

}

- (UIVisualEffect)contentEffect
{
  return self->_contentEffect;
}

- (unint64_t)iconDisplayStyle
{
  unint64_t result;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  result = -[HUGridCell backgroundState](self, "backgroundState");
  if (result != 1)
  {
    -[HUGridCell layoutOptions](self, "layoutOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "contentColorStyle");

    v6 = 3;
    if (v5 != 1)
      v6 = 1;
    if (v5)
      return v6;
    else
      return 2;
  }
  return result;
}

- (unint64_t)backgroundState
{
  void *v2;
  unint64_t v3;

  -[HUGridCell gridBackgroundView](self, "gridBackgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "backgroundState");

  return v3;
}

- (HUGridCellBackgroundView)gridBackgroundView
{
  return self->_gridBackgroundView;
}

- (void)_updateTintColorSettingsForSubviewsOfView:(id)a3 desiredDisplayStyle:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  HUGridCell *v18;
  unint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4 != 2)
    objc_msgSend(v6, "setTintColor:", 0);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v24 = v7;
  objc_msgSend(v7, "subviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v28;
    v12 = 1;
    if (a4 != 1)
      v12 = 2;
    v25 = v12;
    v13 = 0x1E0CEA000uLL;
    do
    {
      v14 = 0;
      v26 = v10;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v15, "_setTextColorFollowsTintColor:", a4 == 2);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = a4;
            v17 = v11;
            v18 = self;
            v19 = v13;
            v20 = v8;
            v21 = v15;
            objc_msgSend(v21, "image");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "imageWithRenderingMode:", v25);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setImage:", v23);

            v8 = v20;
            v13 = v19;
            self = v18;
            v11 = v17;
            a4 = v16;
            v10 = v26;

          }
        }
        -[HUGridCell _updateTintColorSettingsForSubviewsOfView:desiredDisplayStyle:](self, "_updateTintColorSettingsForSubviewsOfView:desiredDisplayStyle:", v15, a4);
        ++v14;
      }
      while (v10 != v14);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v10);
  }

}

- (double)secondaryContentDimmingFactor
{
  return self->_secondaryContentDimmingFactor;
}

- (void)_removeDashedBorderLayer
{
  void *v3;
  void *v4;

  -[HUGridCell dashedBorderLayer](self, "dashedBorderLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HUGridCell dashedBorderLayer](self, "dashedBorderLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperlayer");

    -[HUGridCell setDashedBorderLayer:](self, "setDashedBorderLayer:", 0);
  }
}

- (CAShapeLayer)dashedBorderLayer
{
  return self->_dashedBorderLayer;
}

- (void)setSecondaryContentEffect:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryContentEffect, a3);
}

- (void)setSecondaryContentDimmingFactor:(double)a3
{
  self->_secondaryContentDimmingFactor = a3;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HUGridCell;
  -[HUGridCell applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "backgroundEffectViewGrouper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUGridCell gridBackgroundView](self, "gridBackgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundEffectViewGrouper:", v5);

  }
}

- (HUGridCell)initWithFrame:(CGRect)a3
{
  HUGridCell *v3;
  HUGridCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUGridCell;
  v3 = -[HUGridCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[HUGridCell _setupCommonCellAppearance](v3, "_setupCommonCellAppearance");
  return v4;
}

- (HUGridCell)initWithCoder:(id)a3
{
  HUGridCell *v3;
  HUGridCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUGridCell;
  v3 = -[HUGridCell initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[HUGridCell _setupCommonCellAppearance](v3, "_setupCommonCellAppearance");
  return v4;
}

- (void)setLayoutOptions:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_layoutOptions) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_layoutOptions, a3);
    -[HUGridCell layoutOptionsDidChange](self, "layoutOptionsDidChange");
  }

}

- (void)_setupCommonCellAppearance
{
  HUGridCellBackgroundView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[HUGridCell setPrimaryState:](self, "setPrimaryState:", 0);
  v3 = objc_alloc_init(HUGridCellBackgroundView);
  -[HUGridCell setGridBackgroundView:](self, "setGridBackgroundView:", v3);

  -[HUGridCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUGridCell gridBackgroundView](self, "gridBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", 0);
  -[HUGridCell setGridForegroundView:](self, "setGridForegroundView:", v6);

  -[HUGridCell contentView](self, "contentView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[HUGridCell gridForegroundView](self, "gridForegroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v7);

}

- (void)prepareForReuse
{
  objc_super v3;

  -[HUGridCell setCellContentsHidden:](self, "setCellContentsHidden:", 0);
  -[HUGridCell setPrimaryState:](self, "setPrimaryState:", 0);
  -[HUGridCell setRearranging:](self, "setRearranging:", 0);
  v3.receiver = self;
  v3.super_class = (Class)HUGridCell;
  -[HUGridCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HUGridCell;
  -[HUGridCell setHighlighted:](&v6, sel_setHighlighted_);
  -[HUGridCell gridBackgroundView](self, "gridBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPressed:", v3);

}

- (void)setPointerInteractionEnabled:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_pointerInteractionEnabled != a3)
  {
    self->_pointerInteractionEnabled = a3;
    if (a3)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA860]), "initWithDelegate:", self);
      -[HUGridCell setPointerInteraction:](self, "setPointerInteraction:", v4);

      -[HUGridCell pointerInteraction](self, "pointerInteraction");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[HUGridCell addInteraction:](self, "addInteraction:", v6);

    }
    else
    {
      -[HUGridCell pointerInteraction](self, "pointerInteraction");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUGridCell removeInteraction:](self, "removeInteraction:", v5);

      -[HUGridCell setPointerInteraction:](self, "setPointerInteraction:", 0);
    }
  }
}

+ (Class)layoutOptionsClass
{
  return (Class)objc_opt_class();
}

- (void)setCellContentsHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_cellContentsHidden != a3)
  {
    v3 = a3;
    self->_cellContentsHidden = a3;
    -[HUGridCell contentView](self, "contentView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", v3);

  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
  double v7;
  id v8;
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
  CGFloat v20;
  double x;
  double y;
  double width;
  double height;
  void *v25;
  void *v26;
  CGRect v28;
  CGRect v29;

  v6 = a5;
  -[HUGridCell pointerRegionMargin](self, "pointerRegionMargin");
  if (v7 == 0.0)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v6, "rect");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[HUGridCell pointerRegionMargin](self, "pointerRegionMargin");
    v18 = -v17;
    -[HUGridCell pointerRegionMargin](self, "pointerRegionMargin");
    v20 = -v19;
    v28.origin.x = v10;
    v28.origin.y = v12;
    v28.size.width = v14;
    v28.size.height = v16;
    v29 = CGRectInset(v28, v18, v20);
    x = v29.origin.x;
    y = v29.origin.y;
    width = v29.size.width;
    height = v29.size.height;
    v25 = (void *)MEMORY[0x1E0CEA870];
    objc_msgSend(v6, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "regionWithRect:identifier:", v26, x, y, width, height);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:", self);
  objc_msgSend(MEMORY[0x1E0CEA868], "effectWithPreview:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CEA878];
  -[HUGridCell frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[HUGridCell layoutOptions](self, "layoutOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cellCornerRadius");
  objc_msgSend(v7, "shapeWithRoundedRect:cornerRadius:", v9, v11, v13, v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v6, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  BOOL v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  objc_super v23;
  CGPoint v24;
  CGRect v25;
  CGRect v26;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HUGridCell;
  if (-[HUGridCell pointInside:withEvent:](&v23, sel_pointInside_withEvent_, v7, x, y))
  {
    v8 = 1;
  }
  else if (objc_msgSend(v7, "type") != 11
         || (-[HUGridCell pointerRegionMargin](self, "pointerRegionMargin"), v9 == 0.0))
  {
    v8 = 0;
  }
  else
  {
    -[HUGridCell bounds](self, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[HUGridCell pointerRegionMargin](self, "pointerRegionMargin");
    v19 = -v18;
    -[HUGridCell pointerRegionMargin](self, "pointerRegionMargin");
    v21 = -v20;
    v25.origin.x = v11;
    v25.origin.y = v13;
    v25.size.width = v15;
    v25.size.height = v17;
    v26 = CGRectInset(v25, v19, v21);
    v24.x = x;
    v24.y = y;
    v8 = CGRectContainsPoint(v26, v24);
  }

  return v8;
}

- (BOOL)areCellContentsHidden
{
  return self->_cellContentsHidden;
}

- (HUGridCellLayoutOptions)layoutOptions
{
  return self->_layoutOptions;
}

- (BOOL)isRearranging
{
  return self->_rearranging;
}

- (BOOL)isPointerInteractionEnabled
{
  return self->_pointerInteractionEnabled;
}

- (double)pointerRegionMargin
{
  return self->_pointerRegionMargin;
}

- (void)setPointerRegionMargin:(double)a3
{
  self->_pointerRegionMargin = a3;
}

- (UIVisualEffect)secondaryContentEffect
{
  return self->_secondaryContentEffect;
}

- (void)setGridBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_gridBackgroundView, a3);
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (void)setGridForegroundView:(id)a3
{
  objc_storeStrong((id *)&self->_gridForegroundView, a3);
}

- (UIPointerInteraction)pointerInteraction
{
  return self->_pointerInteraction;
}

- (void)setPointerInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_pointerInteraction, a3);
}

- (void)setDashedBorderLayer:(id)a3
{
  objc_storeStrong((id *)&self->_dashedBorderLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dashedBorderLayer, 0);
  objc_storeStrong((id *)&self->_pointerInteraction, 0);
  objc_storeStrong((id *)&self->_gridForegroundView, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_gridBackgroundView, 0);
  objc_storeStrong((id *)&self->_secondaryContentEffect, 0);
  objc_storeStrong((id *)&self->_contentEffect, 0);
  objc_storeStrong((id *)&self->_layoutOptions, 0);
}

@end
