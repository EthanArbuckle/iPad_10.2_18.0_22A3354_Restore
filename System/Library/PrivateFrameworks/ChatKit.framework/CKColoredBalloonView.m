@implementation CKColoredBalloonView

- (void)setGradientReferenceView:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CKColoredBalloonView gradientView](self, "gradientView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setReferenceView:", v4);

  -[CKColoredBalloonView updateWantsGradient](self, "updateWantsGradient");
  -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
}

- (CKColoredBalloonView)initWithFrame:(CGRect)a3
{
  CKColoredBalloonView *v3;
  CKColoredBalloonView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  int v14;
  CKGradientView *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CKColoredBalloonView;
  v3 = -[CKBalloonView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[CKColoredBalloonView bounds](v3, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "shouldUseDynamicGradient");

    if (v14)
    {
      v15 = -[CKGradientView initWithFrame:]([CKGradientView alloc], "initWithFrame:", v6, v8, v10, v12);
      -[CKColoredBalloonView setGradientView:](v4, "setGradientView:", v15);

    }
    -[CKColoredBalloonView setColor:](v4, "setColor:", 0xFFFFFFFFLL);
  }
  return v4;
}

- (void)updateWantsGradient
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldUseDynamicGradient");

  if (v4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "theme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "balloonColorsForColorType:", -[CKBalloonView color](self, "color"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v8, "count") <= 1)
    {
      -[CKColoredBalloonView setWantsGradient:](self, "setWantsGradient:", 0);
    }
    else
    {
      -[CKColoredBalloonView gradientReferenceView](self, "gradientReferenceView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKColoredBalloonView setWantsGradient:](self, "setWantsGradient:", v7 != 0);

    }
  }
}

- (void)setWantsGradient:(BOOL)a3
{
  if (self->_wantsGradient != a3)
  {
    self->_wantsGradient = a3;
    -[CKColoredBalloonView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_gradientView, a3);
}

- (void)setColor:(char)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKColoredBalloonView;
  -[CKBalloonView setColor:](&v4, sel_setColor_, a3);
  -[CKColoredBalloonView updateWantsGradient](self, "updateWantsGradient");
  -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKColoredBalloonView;
  -[CKBalloonView prepareForReuse](&v3, sel_prepareForReuse);
  -[CKColoredBalloonView setIsBeingShownAsPreview:](self, "setIsBeingShownAsPreview:", 0);
  -[CKColoredBalloonView setGradientReferenceView:](self, "setGradientReferenceView:", 0);
}

- (void)setCanUseOpaqueMask:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[CKBalloonView canUseOpaqueMask](self, "canUseOpaqueMask") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CKColoredBalloonView;
    -[CKBalloonView setCanUseOpaqueMask:](&v5, sel_setCanUseOpaqueMask_, v3);
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
    -[CKColoredBalloonView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHasTail:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (-[CKBalloonView hasTail](self, "hasTail") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CKColoredBalloonView;
    -[CKBalloonView setHasTail:](&v5, sel_setHasTail_, v3);
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
  }
}

- (CKGradientView)gradientView
{
  return self->_gradientView;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKColoredBalloonView frame](self, "frame");
  v9 = v8;
  v10.receiver = self;
  v10.super_class = (Class)CKColoredBalloonView;
  -[CKBalloonView setFrame:](&v10, sel_setFrame_, x, y, width, height);
  if (v9 != width)
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
}

- (void)configureForComposition:(id)a3
{
  id v4;
  _BOOL4 v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKColoredBalloonView;
  v4 = a3;
  -[CKBalloonView configureForComposition:](&v7, sel_configureForComposition_, v4);
  v5 = -[CKColoredBalloonView _shouldApplySendLaterStyleForComposition:](self, "_shouldApplySendLaterStyleForComposition:", v4, v7.receiver, v7.super_class);

  if (v5)
    v6 = 15;
  else
    v6 = 1;
  -[CKColoredBalloonView setColor:](self, "setColor:", v6);
}

- (BOOL)_shouldApplySendLaterStyleForComposition:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isScheduledMessagesCoreEnabled");

  v7 = 0;
  if (v5)
  {
    objc_msgSend(v3, "sendLaterPluginInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      v7 = 1;
  }

  return v7;
}

- (void)configureForMessagePart:(id)a3
{
  id v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKColoredBalloonView;
  v4 = a3;
  -[CKBalloonView configureForMessagePart:](&v6, sel_configureForMessagePart_, v4);
  v5 = objc_msgSend(v4, "color", v6.receiver, v6.super_class);

  -[CKColoredBalloonView setColor:](self, "setColor:", v5);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[CKBalloonView color](self, "color");
  v5 = -[CKColoredBalloonView wantsGradient](self, "wantsGradient");
  v9.receiver = self;
  v9.super_class = (Class)CKColoredBalloonView;
  -[CKBalloonView description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[CKColoredBalloonView color:%ld wantsGradient:%d %@]"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  CKBalloonImageView *effectViewMask;
  void *v19;
  void *v20;
  char v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CKColoredBalloonView;
  -[CKBalloonView layoutSubviews](&v22, sel_layoutSubviews);
  -[CKColoredBalloonView gradientView](self, "gradientView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKColoredBalloonView bounds](self, "bounds");
  objc_msgSend(v3, "setFrame:");
  -[CKColoredBalloonView bounds](self, "bounds");
  -[CKBalloonShapeView setFrame:](self->_balloonShapeView, "setFrame:");
  -[CKColoredBalloonView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (-[CKColoredBalloonView wantsGradient](self, "wantsGradient")
    && -[CKBalloonView canUseOpaqueMask](self, "canUseOpaqueMask"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKColoredBalloonView balloonDescriptor](self, "balloonDescriptor");
    objc_msgSend(v12, "balloonMaskFrameInsetsWithBalloonShape:", v21);
    v5 = v5 - v13;
    v7 = v7 - v14;
    v9 = v9 + v13 + v15;
    v11 = v11 + v14 + v16;

  }
  -[CKColoredBalloonView mask](self, "mask");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v5, v7, v9, v11);

  if (-[CKColoredBalloonView wantsInvisibleInkEffectMask](self, "wantsInvisibleInkEffectMask"))
  {
    effectViewMask = self->_effectViewMask;
    -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "effectView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    -[CKBalloonImageView setFrame:](effectViewMask, "setFrame:");

  }
}

- (UIEdgeInsets)alignmentRectInsets
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  char v22;
  UIEdgeInsets result;

  if (-[CKColoredBalloonView wantsGradient](self, "wantsGradient")
    || -[CKBalloonView canUseOpaqueMask](self, "canUseOpaqueMask")
    && -[CKColoredBalloonView wantsInvisibleInkEffectMask](self, "wantsInvisibleInkEffectMask"))
  {
    -[CKColoredBalloonView mask](self, "mask");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKColoredBalloonView balloonDescriptor](self, "balloonDescriptor");
    if (v22 < 3)
    {
      v21.receiver = self;
      v21.super_class = (Class)CKColoredBalloonView;
      -[CKBalloonImageView alignmentRectInsets](&v21, sel_alignmentRectInsets);
      v6 = v17;
      v8 = v18;
      v10 = v19;
      v12 = v20;
      goto LABEL_4;
    }
    if ((v22 - 3) >= 2)
    {
      v6 = *MEMORY[0x1E0CEB4B0];
      v8 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
      v10 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
      v12 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
      goto LABEL_4;
    }
    -[CKColoredBalloonView balloonShapeView](self, "balloonShapeView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  objc_msgSend(v3, "alignmentRectInsets");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

LABEL_4:
  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CKColoredBalloonView bounds](self, "bounds");
  v9 = v8;
  v10.receiver = self;
  v10.super_class = (Class)CKColoredBalloonView;
  -[CKBalloonImageView setBounds:](&v10, sel_setBounds_, x, y, width, height);
  if (v9 != width)
    -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
}

- (void)setIsBeingShownAsPreview:(BOOL)a3
{
  CKBalloonShapeView *balloonShapeView;
  _OWORD v5[10];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKColoredBalloonView;
  -[CKBalloonView setIsBeingShownAsPreview:](&v6, sel_setIsBeingShownAsPreview_, a3);
  -[CKColoredBalloonView balloonDescriptor](self, "balloonDescriptor");
  balloonShapeView = self->_balloonShapeView;
  v5[2] = v5[7];
  v5[3] = v5[8];
  v5[4] = v5[9];
  v5[0] = v5[5];
  v5[1] = v5[6];
  -[CKBalloonShapeView setDescriptor:](balloonShapeView, "setDescriptor:", v5);
}

- (void)prepareForDisplay
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  _OWORD v35[10];
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  _QWORD v43[5];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)CKColoredBalloonView;
  -[CKBalloonView prepareForDisplay](&v49, sel_prepareForDisplay);
  -[CKBalloonShapeView removeFromSuperview](self->_balloonShapeView, "removeFromSuperview");
  -[CKColoredBalloonView alignmentRectInsets](self, "alignmentRectInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v44 = 0u;
  -[CKColoredBalloonView balloonDescriptor](self, "balloonDescriptor");
  -[CKColoredBalloonView gradientView](self, "gradientView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "theme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "balloonColorsForColorType:", (char)v45);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __41__CKColoredBalloonView_prepareForDisplay__block_invoke;
  v43[3] = &unk_1E2758068;
  v43[4] = self;
  objc_msgSend(v14, "__imArrayByApplyingBlock:", v43);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKPrintController sharedInstance](CKPrintController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isPrinting");

  if (v17)
  {
    v42 = v15;
    +[CKPrintController printResolvedColors:balloonDescriptor:coloredBalloonView:](CKPrintController, "printResolvedColors:balloonDescriptor:coloredBalloonView:", &v42, &v44, self);
    v18 = v42;

    v15 = v18;
  }
  -[CKColoredBalloonView mask](self, "mask");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKColoredBalloonView wantsGradient](self, "wantsGradient"))
  {
    -[CKBalloonImageView setImage:](self, "setImage:", 0);
    -[CKColoredBalloonView setBackgroundColor:](self, "setBackgroundColor:", 0);
    objc_msgSend(v19, "removeFromSuperview");
    v39 = v46;
    v40 = v47;
    v41 = v48;
    v37 = v44;
    v38 = v45;
    if (BYTE8(v48))
      CKResizableBalloonPunchout(&v37);
    else
      CKResizableBalloonMask(&v37);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setImage:", v27);

    objc_msgSend(v11, "setColors:", v15);
    if (!BYTE8(v48)
      && -[CKColoredBalloonView wantsInvisibleInkEffectMask](self, "wantsInvisibleInkEffectMask")
      && -[CKColoredBalloonView hasBackground](self, "hasBackground"))
    {
      objc_msgSend(v19, "image");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKColoredBalloonView setEffectViewMaskImage:](self, "setEffectViewMaskImage:", v28);

    }
    else
    {
      -[CKColoredBalloonView setEffectViewMaskImage:](self, "setEffectViewMaskImage:", 0);
    }
    v39 = v46;
    v40 = v47;
    v41 = v48;
    v37 = v44;
    v38 = v45;
    CKResizableBalloonMask(&v37);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setMaskImage:", v29);

    objc_msgSend(v11, "superview");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
      -[CKColoredBalloonView insertSubview:atIndex:](self, "insertSubview:atIndex:", v11, 0);
    goto LABEL_30;
  }
  objc_msgSend(v11, "superview");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    objc_msgSend(v11, "removeFromSuperview");
  if (!BYTE8(v48)
    || !-[CKColoredBalloonView wantsInvisibleInkEffectMask](self, "wantsInvisibleInkEffectMask")
    || !-[CKColoredBalloonView hasBackground](self, "hasBackground"))
  {
    -[CKColoredBalloonView balloonDescriptor](self, "balloonDescriptor");
    if (v36 >= 3)
    {
      if ((v36 - 3) >= 2)
      {
LABEL_18:
        -[CKColoredBalloonView setBackgroundColor:](self, "setBackgroundColor:", 0);
        objc_msgSend(v19, "removeFromSuperview");
        if (-[CKColoredBalloonView wantsInvisibleInkEffectMask](self, "wantsInvisibleInkEffectMask")
          && -[CKColoredBalloonView hasBackground](self, "hasBackground"))
        {
          v39 = v46;
          v40 = v47;
          v41 = v48;
          v37 = v44;
          v38 = v45;
          CKResizableBalloonMask(&v37);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKColoredBalloonView setEffectViewMaskImage:](self, "setEffectViewMaskImage:", v26);

        }
        else
        {
          -[CKColoredBalloonView setEffectViewMaskImage:](self, "setEffectViewMaskImage:", 0);
        }
        goto LABEL_30;
      }
      -[CKBalloonImageView setImage:](self, "setImage:", 0);
      -[CKBalloonImageView setImageHidden:](self, "setImageHidden:", 1);
      -[CKColoredBalloonView balloonDescriptor](self, "balloonDescriptor");
      -[CKColoredBalloonView balloonShapeView](self, "balloonShapeView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v35[2] = v35[7];
      v35[3] = v35[8];
      v35[4] = v35[9];
      v35[0] = v35[5];
      v35[1] = v35[6];
      objc_msgSend(v25, "setDescriptor:", v35);

      -[CKColoredBalloonView balloonShapeView](self, "balloonShapeView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKColoredBalloonView insertSubview:atIndex:](self, "insertSubview:atIndex:", v24, 0);
    }
    else
    {
      v39 = v46;
      v40 = v47;
      v41 = v48;
      v37 = v44;
      v38 = v45;
      CKResizableBalloonImage((uint64_t)&v37);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBalloonImageView setImage:](self, "setImage:", v24);
    }

    goto LABEL_18;
  }
  -[CKColoredBalloonView setEffectViewMaskImage:](self, "setEffectViewMaskImage:", 0);
  -[CKBalloonImageView setImage:](self, "setImage:", 0);
  objc_msgSend(v15, "lastObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKColoredBalloonView setBackgroundColor:](self, "setBackgroundColor:", v21);

  v39 = v46;
  v40 = v47;
  v41 = v48;
  v37 = v44;
  v38 = v45;
  CKResizableBalloonPunchout(&v37);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setImage:", v22);

  objc_msgSend(v19, "superview");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
    -[CKColoredBalloonView addSubview:](self, "addSubview:", v19);
LABEL_30:
  -[CKColoredBalloonView alignmentRectInsets](self, "alignmentRectInsets");
  if (v6 != v34 || v4 != v31 || v10 != v33 || v8 != v32)
    -[CKColoredBalloonView setNeedsLayout](self, "setNeedsLayout");

}

id __41__CKColoredBalloonView_prepareForDisplay__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolvedColorForTraitCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)needsGroupOpacity
{
  _BOOL4 v3;

  v3 = -[CKColoredBalloonView wantsGradient](self, "wantsGradient");
  if (v3)
    LOBYTE(v3) = -[CKBalloonView canUseOpaqueMask](self, "canUseOpaqueMask");
  return v3;
}

- (id)overlayColor
{
  void *v3;
  void *v4;
  void *v5;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "theme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "balloonOverlayColorForColorType:", -[CKBalloonView color](self, "color"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CKGradientReferenceView)gradientReferenceView
{
  void *v2;
  void *v3;

  -[CKColoredBalloonView gradientView](self, "gradientView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "referenceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKGradientReferenceView *)v3;
}

- (BOOL)hasBackground
{
  return 1;
}

- (void)setBalloonDescriptor:(CKBalloonDescriptor_t *)a3
{
  __int128 v5;
  __int128 v6;
  _OWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKColoredBalloonView;
  v5 = *(_OWORD *)&a3->var6.alpha;
  v7[2] = *(_OWORD *)&a3->var6.green;
  v7[3] = v5;
  v7[4] = *(_OWORD *)&a3->var8;
  v6 = *(_OWORD *)&a3->var5;
  v7[0] = *(_OWORD *)&a3->var0;
  v7[1] = v6;
  -[CKBalloonView setBalloonDescriptor:](&v8, sel_setBalloonDescriptor_, v7);
  -[CKColoredBalloonView setColor:](self, "setColor:", a3->var5);
  -[CKBalloonView setStrokeColor:](self, "setStrokeColor:", a3->var6.red, a3->var6.green, a3->var6.blue, a3->var6.alpha);
  -[CKColoredBalloonView updateWantsGradient](self, "updateWantsGradient");
  -[CKBalloonView setNeedsPrepareForDisplay](self, "setNeedsPrepareForDisplay");
}

- (CKBalloonDescriptor_t)balloonDescriptor
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CKBalloonDescriptor_t *result;
  void *v11;
  uint64_t v12;
  objc_super v13;

  *(_OWORD *)&retstr->var6.alpha = 0u;
  *(_OWORD *)&retstr->var8 = 0u;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var6.green = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v13.receiver = self;
  v13.super_class = (Class)CKColoredBalloonView;
  -[CKBalloonDescriptor_t balloonDescriptor](&v13, sel_balloonDescriptor);
  if (!retstr->var7)
  {
    -[CKColoredBalloonView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    retstr->var7 = objc_msgSend(v5, "userInterfaceStyle");

  }
  retstr->var2 = -[CKBalloonView balloonStyle](self, "balloonStyle");
  -[CKBalloonView strokeColor](self, "strokeColor");
  retstr->var6.red = v6;
  retstr->var6.green = v7;
  retstr->var6.blue = v8;
  retstr->var6.alpha = v9;
  retstr->var5 = -[CKBalloonView color](self, "color");
  result = (CKBalloonDescriptor_t *)-[CKBalloonView isBeingShownAsPreview](self, "isBeingShownAsPreview");
  if ((_DWORD)result)
  {
    if (-[CKBalloonView balloonStyle](self, "balloonStyle") == 3
      || (result = (CKBalloonDescriptor_t *)-[CKBalloonView balloonStyle](self, "balloonStyle"), (_DWORD)result == 4))
    {
      *(_OWORD *)&retstr->var6.red = CKColorZero;
      *(_OWORD *)&retstr->var6.blue = *(_OWORD *)&qword_18E7CB368;
      objc_msgSend(MEMORY[0x1E0CEAB40], "currentTraitCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "userInterfaceStyle");

      if (v12 == 2)
        retstr->var5 = -1;
    }
  }
  return result;
}

- (CKBalloonImageView)mask
{
  CKBalloonImageView *mask;
  CKBalloonImageView *v4;
  CKBalloonImageView *v5;

  mask = self->_mask;
  if (!mask)
  {
    v4 = objc_alloc_init(CKBalloonImageView);
    v5 = self->_mask;
    self->_mask = v4;

    -[CKBalloonImageView setUserInteractionEnabled:](self->_mask, "setUserInteractionEnabled:", 0);
    mask = self->_mask;
  }
  return mask;
}

- (CKBalloonShapeView)balloonShapeView
{
  CKBalloonShapeView *balloonShapeView;
  CKBalloonShapeView *v4;
  CKBalloonShapeView *v5;
  CKBalloonShapeView *v6;
  uint64_t v8;

  balloonShapeView = self->_balloonShapeView;
  if (!balloonShapeView)
  {
    v4 = [CKBalloonShapeView alloc];
    -[CKColoredBalloonView balloonDescriptor](self, "balloonDescriptor");
    v5 = -[CKBalloonShapeView initWithDescriptor:imageGenerator:](v4, "initWithDescriptor:imageGenerator:", &v8, &__block_literal_global_193);
    v6 = self->_balloonShapeView;
    self->_balloonShapeView = v5;

    balloonShapeView = self->_balloonShapeView;
  }
  return balloonShapeView;
}

id __40__CKColoredBalloonView_balloonShapeView__block_invoke(uint64_t a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[5];

  v2 = a2[3];
  v5[2] = a2[2];
  v5[3] = v2;
  v5[4] = a2[4];
  v3 = a2[1];
  v5[0] = *a2;
  v5[1] = v3;
  CKResizableBalloonImage((uint64_t)v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)addFilter:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  __int128 v23[5];

  v4 = a3;
  objc_msgSend(v4, "balloonBackdropFilters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[CKColoredBalloonView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsGroupBlending:", 0);

    -[CKBalloonView backdropFilterLayer](self, "backdropFilterLayer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
LABEL_12:
      objc_msgSend(v4, "balloonBackdropFilters");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setFilters:", v17);

      goto LABEL_13;
    }
    v8 = objc_alloc_init(MEMORY[0x1E0CD2708]);
    objc_msgSend(v8, "setAnchorPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    objc_msgSend(v8, "setGroupName:", CFSTR("FSMBackdropGroup"));
    objc_msgSend(v8, "setScale:", 0.25);
    if (-[CKColoredBalloonView wantsGradient](self, "wantsGradient"))
    {
      -[CKColoredBalloonView gradientView](self, "gradientView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidden:", 1);

      -[CKColoredBalloonView gradientView](self, "gradientView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "maskImage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        goto LABEL_11;
    }
    else
    {
      -[CKBalloonImageView setImageHidden:](self, "setImageHidden:", 1);
      if (objc_msgSend(v4, "shouldUseMaskImage"))
      {
        -[CKColoredBalloonView balloonDescriptor](self, "balloonDescriptor");
        CKResizableBalloonMask(v23);
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[CKBalloonImageView image](self, "image");
        v12 = objc_claimAutoreleasedReturnValue();
      }
      v11 = (void *)v12;
      if (!v12)
        goto LABEL_11;
    }
    objc_msgSend(v8, "setMaskImage:", v11);
    v13 = (void *)MEMORY[0x1E0CD27A8];
    -[CKColoredBalloonView bounds](self, "bounds");
    objc_msgSend(v13, "boundsForMaskImage:withOriginalSize:", v11, v14, v15);
    objc_msgSend(v8, "setFrame:");
    -[CKBalloonView setBackdropFilterLayer:](self, "setBackdropFilterLayer:", v8);
LABEL_11:
    -[CKColoredBalloonView layer](self, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "insertSublayer:atIndex:", v8, 0);

    goto LABEL_12;
  }
LABEL_13:
  -[CKColoredBalloonView layer](self, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "balloonFilters");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFilters:", v19);

  -[CKColoredBalloonView layer](self, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "balloonCompositingFilter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCompositingFilter:", v21);

  v22.receiver = self;
  v22.super_class = (Class)CKColoredBalloonView;
  -[CKBalloonView addFilter:](&v22, sel_addFilter_, v4);

}

- (void)clearFilters
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[CKBalloonView filters](self, "filters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v7), "balloonBackdropFilters");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count"))
        {
          -[CKColoredBalloonView gradientView](self, "gradientView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            -[CKColoredBalloonView gradientView](self, "gradientView");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setHidden:", 0);

            -[CKBalloonImageView setImageHidden:](self, "setImageHidden:", 0);
            goto LABEL_12;
          }
        }
        else
        {

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }
LABEL_12:

  -[CKColoredBalloonView layer](self, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAllowsGroupBlending:", 1);

  -[CKColoredBalloonView layer](self, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFilters:", 0);

  -[CKColoredBalloonView layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCompositingFilter:", 0);

  -[CKBalloonView backdropFilterLayer](self, "backdropFilterLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeFromSuperlayer");

  -[CKBalloonView setBackdropFilterLayer:](self, "setBackdropFilterLayer:", 0);
  v15.receiver = self;
  v15.super_class = (Class)CKColoredBalloonView;
  -[CKBalloonView clearFilters](&v15, sel_clearFilters);
}

- (void)setEffectViewMaskImage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[CKBalloonView invisibleInkEffectController](self, "invisibleInkEffectController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v7)
    {
      -[CKColoredBalloonView effectViewMask](self, "effectViewMask");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setImage:", v7);
      objc_msgSend(v5, "setMaskView:", v6);

    }
    else
    {
      objc_msgSend(v5, "setMaskView:", 0);
    }
  }

}

- (CKBalloonImageView)effectViewMask
{
  CKBalloonImageView *effectViewMask;
  CKBalloonImageView *v4;
  CKBalloonImageView *v5;

  effectViewMask = self->_effectViewMask;
  if (!effectViewMask)
  {
    v4 = objc_alloc_init(CKBalloonImageView);
    v5 = self->_effectViewMask;
    self->_effectViewMask = v4;

    effectViewMask = self->_effectViewMask;
  }
  return effectViewMask;
}

- (void)setGradientOverrideFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGRect *p_gradientOverrideFrame;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_gradientOverrideFrame = &self->_gradientOverrideFrame;
  if (!CGRectEqualToRect(self->_gradientOverrideFrame, a3))
  {
    p_gradientOverrideFrame->origin.x = x;
    p_gradientOverrideFrame->origin.y = y;
    p_gradientOverrideFrame->size.width = width;
    p_gradientOverrideFrame->size.height = height;
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    -[CKColoredBalloonView gradientView](self, "gradientView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "gradient");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v18, "setContents:", objc_msgSend(v10, "CGImage"));

    objc_msgSend(v18, "setFrame:", x, y, width, height);
    -[CKColoredBalloonView layer](self, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKColoredBalloonView gradientView](self, "gradientView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "insertSublayer:above:", v18, v13);

    v14 = objc_alloc(MEMORY[0x1E0CEA658]);
    -[CKColoredBalloonView gradientView](self, "gradientView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "maskImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithImage:", v16);

    -[CKColoredBalloonView bounds](self, "bounds");
    objc_msgSend(v17, "setFrame:");
    -[CKColoredBalloonView setMaskView:](self, "setMaskView:", v17);

  }
}

- (BOOL)wantsInvisibleInkEffectMask
{
  unsigned __int8 v4;

  -[CKColoredBalloonView balloonDescriptor](self, "balloonDescriptor");
  return v4 <= 2u && -[CKBalloonView invisibleInkEffectEnabled](self, "invisibleInkEffectEnabled");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKColoredBalloonView;
  v4 = a3;
  -[CKBalloonView traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  -[CKColoredBalloonView traitCollection](self, "traitCollection", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v6)
  {
    -[CKColoredBalloonView setNeedsDisplay](self, "setNeedsDisplay");
    -[CKBalloonView prepareForDisplayIfNeeded](self, "prepareForDisplayIfNeeded");
  }
}

- (void)setMask:(id)a3
{
  objc_storeStrong((id *)&self->_mask, a3);
}

- (BOOL)wantsGradient
{
  return self->_wantsGradient;
}

- (CGRect)gradientOverrideFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_gradientOverrideFrame.origin.x;
  y = self->_gradientOverrideFrame.origin.y;
  width = self->_gradientOverrideFrame.size.width;
  height = self->_gradientOverrideFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setEffectViewMask:(id)a3
{
  objc_storeStrong((id *)&self->_effectViewMask, a3);
}

- (void)setBalloonShapeView:(id)a3
{
  objc_storeStrong((id *)&self->_balloonShapeView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_balloonShapeView, 0);
  objc_storeStrong((id *)&self->_effectViewMask, 0);
  objc_storeStrong((id *)&self->_mask, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
}

@end
