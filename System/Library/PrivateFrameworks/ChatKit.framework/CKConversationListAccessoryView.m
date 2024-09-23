@implementation CKConversationListAccessoryView

+ (double)defaultDiameter
{
  void *v2;
  double v3;
  double v4;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pinnedConversationDefaultAccessorySize");
  v4 = v3;

  return v4;
}

+ (id)defaultStateConfigMap
{
  CKConversationListAccessoryViewConfiguration *v2;
  void *v3;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = &unk_1E2870AE0;
  v2 = objc_alloc_init(CKConversationListAccessoryViewConfiguration);
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CKConversationListAccessoryView)initWithFrame:(CGRect)a3
{
  CKConversationListAccessoryView *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)CKConversationListAccessoryView;
  v3 = -[CKConversationListAccessoryView initWithFrame:](&v44, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[CKConversationListAccessoryView defaultStateConfigMap](CKConversationListAccessoryView, "defaultStateConfigMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListAccessoryView setConfigStateMap:](v3, "setConfigStateMap:", v4);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListAccessoryView setBackgroundColor:](v3, "setBackgroundColor:", v5);

    -[CKConversationListAccessoryView bounds](v3, "bounds");
    v7 = v6 * 0.5;
    -[CKConversationListAccessoryView layer](v3, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", v7);

    v9 = objc_alloc(MEMORY[0x1E0CEABB0]);
    -[CKConversationListAccessoryView bounds](v3, "bounds");
    v10 = (void *)objc_msgSend(v9, "initWithFrame:");
    -[CKConversationListAccessoryView setColorView:](v3, "setColorView:", v10);

    -[CKConversationListAccessoryView colorView](v3, "colorView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setClipsToBounds:", 1);

    -[CKConversationListAccessoryView colorView](v3, "colorView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13 * 0.5;
    -[CKConversationListAccessoryView colorView](v3, "colorView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setCornerRadius:", v14);

    -[CKConversationListAccessoryView colorView](v3, "colorView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setUserInteractionEnabled:", 0);

    -[CKConversationListAccessoryView colorView](v3, "colorView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListAccessoryView addSubview:](v3, "addSubview:", v18);

    v19 = objc_alloc(MEMORY[0x1E0CEA658]);
    -[CKConversationListAccessoryView imageView](v3, "imageView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "frame");
    v22 = v21;
    v24 = v23;
    -[CKConversationListAccessoryView backgroundView](v3, "backgroundView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bounds");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    if (CKMainScreenScale_once_73 != -1)
      dispatch_once(&CKMainScreenScale_once_73, &__block_literal_global_183);
    v34 = *(double *)&CKMainScreenScale_sMainScreenScale_73;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_73 == 0.0)
      v34 = 1.0;
    v35 = (void *)objc_msgSend(v19, "initWithFrame:", 1.0 / v34 * (v27 * v34 + floor((v31 * v34 - v22 * v34) * 0.5)), 1.0 / v34 * (v29 * v34 + floor((v33 * v34 - v24 * v34) * 0.5)), v22 * v34 * (1.0 / v34), v24 * v34 * (1.0 / v34));
    -[CKConversationListAccessoryView setImageView:](v3, "setImageView:", v35);

    -[CKConversationListAccessoryView imageView](v3, "imageView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setUserInteractionEnabled:", 0);

    -[CKConversationListAccessoryView preferredSymbolConfiguration](v3, "preferredSymbolConfiguration");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListAccessoryView imageView](v3, "imageView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setPreferredSymbolConfiguration:", v37);

    v39 = -[CKConversationListAccessoryView imageNeedsEdgeAntiAliasing](v3, "imageNeedsEdgeAntiAliasing");
    -[CKConversationListAccessoryView imageView](v3, "imageView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "layer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setAllowsEdgeAntialiasing:", v39);

    -[CKConversationListAccessoryView imageView](v3, "imageView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListAccessoryView addSubview:](v3, "addSubview:", v42);

    -[CKConversationListAccessoryView _setNeedsVisualAppearanceUpdate](v3, "_setNeedsVisualAppearanceUpdate");
    -[CKConversationListAccessoryView _updateVisualAppearanceForCurrentStateIfNeeded](v3, "_updateVisualAppearanceForCurrentStateIfNeeded");
  }
  return v3;
}

- (CKConversationListAccessoryView)initWithDiameter:(double)a3
{
  return -[CKConversationListAccessoryView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, a3, a3);
}

- (CKConversationListAccessoryView)init
{
  +[CKConversationListAccessoryView defaultDiameter](CKConversationListAccessoryView, "defaultDiameter");
  return -[CKConversationListAccessoryView initWithDiameter:](self, "initWithDiameter:");
}

- (id)configForState:(unint64_t)a3
{
  void *v4;
  void *v5;
  CKConversationListAccessoryViewConfiguration *v6;
  void *v7;

  -[CKConversationListAccessoryView configStateMap](self, "configStateMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (CKConversationListAccessoryViewConfiguration *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    v6 = objc_alloc_init(CKConversationListAccessoryViewConfiguration);
  v7 = (void *)-[CKConversationListAccessoryViewConfiguration copy](v6, "copy");

  return v7;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat x;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat point;
  CGPoint v20;
  CGRect v21;
  CGRect v22;

  point = a3.y;
  x = a3.x;
  -[CKConversationListAccessoryView bounds](self, "bounds", a4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[CKConversationListAccessoryView bounds](self, "bounds");
  if (v14 + -44.0 <= 0.0)
    v15 = v14 + -44.0;
  else
    v15 = 0.0;
  -[CKConversationListAccessoryView bounds](self, "bounds");
  if (v16 + -44.0 <= 0.0)
    v17 = v16 + -44.0;
  else
    v17 = 0.0;
  v21.origin.x = v7;
  v21.origin.y = v9;
  v21.size.width = v11;
  v21.size.height = v13;
  v22 = CGRectInset(v21, v15, v17);
  v20.x = x;
  v20.y = point;
  return CGRectContainsPoint(v22, v20);
}

- (void)_updateVisualAppearanceForCurrentStateIfNeeded
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;

  -[CKConversationListAccessoryView lastKnownState](self, "lastKnownState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CKConversationListAccessoryView state](self, "state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToNumber:", v4);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CKConversationListAccessoryView state](self, "state"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListAccessoryView setLastKnownState:](self, "setLastKnownState:", v6);

    -[CKConversationListAccessoryView configForState:](self, "configForState:", -[CKConversationListAccessoryView state](self, "state"));
    v76 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListAccessoryView colorView](self, "colorView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

    LODWORD(v8) = -[CKConversationListAccessoryView needsVisualEffects](self, "needsVisualEffects");
    -[CKConversationListAccessoryView backgroundView](self, "backgroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((_DWORD)v8)
    {

      if (!v10)
      {
        v11 = objc_alloc(MEMORY[0x1E0CEABE8]);
        -[CKConversationListAccessoryView bounds](self, "bounds");
        v12 = (void *)objc_msgSend(v11, "initWithFrame:");
        -[CKConversationListAccessoryView setBackgroundView:](self, "setBackgroundView:", v12);

        -[CKConversationListAccessoryView backgroundView](self, "backgroundView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setClipsToBounds:", 1);

        -[CKConversationListAccessoryView backgroundView](self, "backgroundView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "bounds");
        v16 = v15 * 0.5;
        -[CKConversationListAccessoryView backgroundView](self, "backgroundView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "layer");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setCornerRadius:", v16);

        -[CKConversationListAccessoryView backgroundView](self, "backgroundView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setUserInteractionEnabled:", 0);

        -[CKConversationListAccessoryView backgroundView](self, "backgroundView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKConversationListAccessoryView addSubview:](self, "addSubview:", v20);

      }
      objc_msgSend(v76, "blurEffect");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKConversationListAccessoryView backgroundView](self, "backgroundView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setEffect:", v21);

    }
    else
    {
      objc_msgSend(v9, "removeFromSuperview");

      -[CKConversationListAccessoryView setBackgroundView:](self, "setBackgroundView:", 0);
    }
    objc_msgSend(v76, "blurEffect");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23
      && (v24 = (void *)v23,
          v25 = -[CKConversationListAccessoryView needsVibrancy](self, "needsVibrancy"),
          v24,
          v25))
    {
      v26 = (void *)MEMORY[0x1E0CEABA8];
      objc_msgSend(v76, "blurEffect");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "effectForBlurEffect:style:", v27, objc_msgSend(v76, "vibrancyStyle"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKConversationListAccessoryView vibrancyView](self, "vibrancyView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", v28);
        -[CKConversationListAccessoryView setVibrancyView:](self, "setVibrancyView:", v30);

        -[CKConversationListAccessoryView backgroundView](self, "backgroundView");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "bounds");
        v33 = v32;
        v35 = v34;
        v37 = v36;
        v39 = v38;
        -[CKConversationListAccessoryView vibrancyView](self, "vibrancyView");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setFrame:", v33, v35, v37, v39);

        -[CKConversationListAccessoryView backgroundView](self, "backgroundView");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "contentView");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKConversationListAccessoryView vibrancyView](self, "vibrancyView");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addSubview:", v43);

      }
    }
    else
    {
      -[CKConversationListAccessoryView vibrancyView](self, "vibrancyView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "removeFromSuperview");

      -[CKConversationListAccessoryView setVibrancyView:](self, "setVibrancyView:", 0);
    }
    objc_msgSend(v76, "image");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListAccessoryView imageView](self, "imageView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setImage:", v45);

    -[CKConversationListAccessoryView imageView](self, "imageView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "sizeToFit");

    -[CKConversationListAccessoryView imageView](self, "imageView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "frame");
    v50 = v49;
    v52 = v51;
    -[CKConversationListAccessoryView backgroundView](self, "backgroundView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "bounds");
    v55 = v54;
    v57 = v56;
    v59 = v58;
    v61 = v60;
    if (CKMainScreenScale_once_73 != -1)
      dispatch_once(&CKMainScreenScale_once_73, &__block_literal_global_183);
    v62 = *(double *)&CKMainScreenScale_sMainScreenScale_73;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_73 == 0.0)
      v62 = 1.0;
    v63 = v50 * v62;
    v64 = v52 * v62;
    v65 = v55 * v62 + floor((v59 * v62 - v50 * v62) * 0.5);
    v66 = v57 * v62 + floor((v61 * v62 - v52 * v62) * 0.5);
    v67 = 1.0 / v62;
    v68 = v67 * v65;
    v69 = v67 * v66;
    v70 = v63 * v67;
    v71 = v64 * v67;
    -[CKConversationListAccessoryView imageView](self, "imageView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setFrame:", v68, v69, v70, v71);

    objc_msgSend(v76, "tintColor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListAccessoryView imageView](self, "imageView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setTintColor:", v73);

    -[CKConversationListAccessoryView imageView](self, "imageView");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKConversationListAccessoryView bringSubviewToFront:](self, "bringSubviewToFront:", v75);

  }
}

- (void)_setNeedsVisualAppearanceUpdate
{
  -[CKConversationListAccessoryView setLastKnownState:](self, "setLastKnownState:", 0);
}

- (UIImageSymbolConfiguration)preferredSymbolConfiguration
{
  void *v2;
  void *v3;

  -[CKConversationListAccessoryView imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredSymbolConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImageSymbolConfiguration *)v3;
}

- (void)setPreferredSymbolConfiguration:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKConversationListAccessoryView imageView](self, "imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredSymbolConfiguration:", v4);

}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKConversationListAccessoryView;
  -[CKConversationListAccessoryView setEnabled:](&v4, sel_setEnabled_, a3);
  -[CKConversationListAccessoryView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKConversationListAccessoryView;
  -[CKConversationListAccessoryView setHighlighted:](&v4, sel_setHighlighted_, a3);
  -[CKConversationListAccessoryView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKConversationListAccessoryView;
  -[CKConversationListAccessoryView setSelected:](&v4, sel_setSelected_, a3);
  -[CKConversationListAccessoryView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setConfig:(id)a3 forState:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a3;
  -[CKConversationListAccessoryView configStateMap](self, "configStateMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v6, v8);

  v9 = (void *)objc_msgSend(v10, "copy");
  -[CKConversationListAccessoryView setConfigStateMap:](self, "setConfigStateMap:", v9);

  -[CKConversationListAccessoryView _setNeedsVisualAppearanceUpdate](self, "_setNeedsVisualAppearanceUpdate");
  -[CKConversationListAccessoryView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setVibrancyEffectStyle:(int64_t)a3 forState:(unint64_t)a4
{
  id v7;

  -[CKConversationListAccessoryView configForState:](self, "configForState:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CKConversationListAccessoryView setNeedsVibrancy:](self, "setNeedsVibrancy:", 1);
  objc_msgSend(v7, "setVibrancyStyle:", a3);
  -[CKConversationListAccessoryView _setConfig:forState:](self, "_setConfig:forState:", v7, a4);

}

- (void)setBlurEffect:(id)a3 withVibrancyEffectStyle:(int64_t)a4 forState:(unint64_t)a5
{
  id v9;

  -[CKConversationListAccessoryView setBlurEffect:forState:](self, "setBlurEffect:forState:", a3, a5);
  if (a3)
  {
    -[CKConversationListAccessoryView setNeedsVibrancy:](self, "setNeedsVibrancy:", 1);
    -[CKConversationListAccessoryView configForState:](self, "configForState:", a5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setVibrancyStyle:", a4);
    -[CKConversationListAccessoryView _setConfig:forState:](self, "_setConfig:forState:", v9, a5);

  }
  else
  {
    _IMWarn();
  }
}

- (void)setBlurEffect:(id)a3 forState:(unint64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    -[CKConversationListAccessoryView setNeedsVisualEffects:](self, "setNeedsVisualEffects:", 1);
    -[CKConversationListAccessoryView configForState:](self, "configForState:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBlurEffect:", v7);
    -[CKConversationListAccessoryView _setConfig:forState:](self, "_setConfig:forState:", v6, a4);

  }
  else
  {
    _IMWarn();
  }

}

- (void)setBackgroundColor:(id)a3 forState:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[CKConversationListAccessoryView configForState:](self, "configForState:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  -[CKConversationListAccessoryView _setConfig:forState:](self, "_setConfig:forState:", v7, a4);
}

- (void)setTintColor:(id)a3 forState:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[CKConversationListAccessoryView configForState:](self, "configForState:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v6);

  -[CKConversationListAccessoryView _setConfig:forState:](self, "_setConfig:forState:", v7, a4);
}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[CKConversationListAccessoryView configForState:](self, "configForState:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v6);

  -[CKConversationListAccessoryView _setConfig:forState:](self, "_setConfig:forState:", v7, a4);
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  objc_super v62;

  v62.receiver = self;
  v62.super_class = (Class)CKConversationListAccessoryView;
  -[CKConversationListAccessoryView layoutSubviews](&v62, sel_layoutSubviews);
  -[CKConversationListAccessoryView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKConversationListAccessoryView colorView](self, "colorView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[CKConversationListAccessoryView bounds](self, "bounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[CKConversationListAccessoryView backgroundView](self, "backgroundView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  -[CKConversationListAccessoryView configForState:](self, "configForState:", -[CKConversationListAccessoryView state](self, "state"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "tintColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListAccessoryView imageView](self, "imageView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTintColor:", v22);

  -[CKConversationListAccessoryView imageView](self, "imageView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frame");
  v26 = v25;
  v28 = v27;
  -[CKConversationListAccessoryView backgroundView](self, "backgroundView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "frame");
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  if (CKMainScreenScale_once_73 != -1)
    dispatch_once(&CKMainScreenScale_once_73, &__block_literal_global_183);
  v38 = *(double *)&CKMainScreenScale_sMainScreenScale_73;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_73 == 0.0)
    v38 = 1.0;
  v39 = v26 * v38;
  v40 = v28 * v38;
  v41 = v31 * v38 + floor((v35 * v38 - v26 * v38) * 0.5);
  v42 = v33 * v38 + floor((v37 * v38 - v28 * v38) * 0.5);
  v43 = 1.0 / v38;
  v44 = v43 * v41;
  v45 = v43 * v42;
  v46 = v39 * v43;
  v47 = v40 * v43;
  -[CKConversationListAccessoryView imageView](self, "imageView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setFrame:", v44, v45, v46, v47);

  -[CKConversationListAccessoryView bounds](self, "bounds");
  v50 = v49 * 0.5;
  -[CKConversationListAccessoryView layer](self, "layer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setCornerRadius:", v50);

  -[CKConversationListAccessoryView colorView](self, "colorView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "bounds");
  v54 = v53 * 0.5;
  -[CKConversationListAccessoryView colorView](self, "colorView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "layer");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setCornerRadius:", v54);

  -[CKConversationListAccessoryView backgroundView](self, "backgroundView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "bounds");
  v59 = v58 * 0.5;
  -[CKConversationListAccessoryView backgroundView](self, "backgroundView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "layer");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setCornerRadius:", v59);

  -[CKConversationListAccessoryView _updateVisualAppearanceForCurrentStateIfNeeded](self, "_updateVisualAppearanceForCurrentStateIfNeeded");
}

- (BOOL)imageNeedsEdgeAntiAliasing
{
  return self->_imageNeedsEdgeAntiAliasing;
}

- (void)setImageNeedsEdgeAntiAliasing:(BOOL)a3
{
  self->_imageNeedsEdgeAntiAliasing = a3;
}

- (NSDictionary)configStateMap
{
  return self->_configStateMap;
}

- (void)setConfigStateMap:(id)a3
{
  objc_storeStrong((id *)&self->_configStateMap, a3);
}

- (BOOL)needsVisualEffects
{
  return self->_needsVisualEffects;
}

- (void)setNeedsVisualEffects:(BOOL)a3
{
  self->_needsVisualEffects = a3;
}

- (BOOL)needsVibrancy
{
  return self->_needsVibrancy;
}

- (void)setNeedsVibrancy:(BOOL)a3
{
  self->_needsVibrancy = a3;
}

- (UIView)colorView
{
  return self->_colorView;
}

- (void)setColorView:(id)a3
{
  objc_storeStrong((id *)&self->_colorView, a3);
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UIVisualEffectView)vibrancyView
{
  return self->_vibrancyView;
}

- (void)setVibrancyView:(id)a3
{
  objc_storeStrong((id *)&self->_vibrancyView, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (NSNumber)lastKnownState
{
  return self->_lastKnownState;
}

- (void)setLastKnownState:(id)a3
{
  objc_storeStrong((id *)&self->_lastKnownState, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKnownState, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_colorView, 0);
  objc_storeStrong((id *)&self->_configStateMap, 0);
}

@end
