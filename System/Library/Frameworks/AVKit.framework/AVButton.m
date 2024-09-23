@implementation AVButton

+ (AVButton)buttonWithAccessibilityIdentifier:(id)a3 accessibilityLabel:(id)a4 isSecondGeneration:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  AVLayoutItemAttributes *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "buttonWithType:", 0);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v9, "setSecondGeneration:", v5);
  if (v5)
    objc_msgSend((id)v9, "setPointerInteractionEnabled:", 1);
  objc_msgSend((id)v9, "_setVisualEffectViewEnabled:backgroundColor:", 0, 0);
  LODWORD(v10) = 1148846080;
  objc_msgSend((id)v9, "setContentHuggingPriority:forAxis:", 0, v10);
  LODWORD(v11) = 1148846080;
  objc_msgSend((id)v9, "setContentHuggingPriority:forAxis:", 1, v11);
  LODWORD(v12) = 1148846080;
  objc_msgSend((id)v9, "setContentCompressionResistancePriority:forAxis:", 0, v12);
  LODWORD(v13) = 1148846080;
  objc_msgSend((id)v9, "setContentCompressionResistancePriority:forAxis:", 1, v13);
  objc_msgSend((id)v9, "setIncluded:", 1);
  objc_msgSend((id)v9, "setAccessibilityIdentifier:", v8);

  objc_msgSend((id)v9, "setHitRectInsets:", -16.0, -16.0, -16.0, -16.0);
  objc_msgSend((id)v9, "setForceThreshold:", 2.0);
  objc_msgSend((id)v9, "setTintEffectStyle:", 1);
  objc_msgSend((id)v9, "setAdjustsImageWhenHighlighted:", 0);
  objc_msgSend((id)v9, "setMicaSnapshotAlpha:", 1.0);
  v14 = *MEMORY[0x1E0DC1438];
  objc_msgSend(MEMORY[0x1E0DC1350], "avkit_nonScalingFontWithTextStyle:weight:", *MEMORY[0x1E0DC4B60], *MEMORY[0x1E0DC1438]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v9, "setFullScreenFont:", v15);

  objc_msgSend(MEMORY[0x1E0DC1350], "avkit_nonScalingFontWithTextStyle:weight:", *MEMORY[0x1E0DC4B58], v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v9, "setAlternateFullScreenFont:", v16);

  objc_msgSend(MEMORY[0x1E0DC1350], "avkit_nonScalingFontWithTextStyle:weight:", *MEMORY[0x1E0DC4A90], v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v9, "setInlineFont:", v17);

  v18 = *(void **)(v9 + 752);
  *(_QWORD *)(v9 + 752) = v7;
  v19 = v7;

  v20 = objc_alloc_init(AVLayoutItemAttributes);
  v21 = *(void **)(v9 + 776);
  *(_QWORD *)(v9 + 776) = v20;

  v22 = *(void **)(v9 + 776);
  objc_msgSend((id)v9, "intrinsicContentSize");
  objc_msgSend(v22, "setMinimumSize:");
  objc_msgSend(*(id *)(v9 + 776), "setCollapsed:", objc_msgSend((id)v9, "isCollapsed"));
  objc_msgSend(*(id *)(v9 + 776), "setIncluded:", objc_msgSend((id)v9, "isIncluded"));
  objc_msgSend(*(id *)(v9 + 776), "setHasFlexibleContentSize:", 0);
  v23 = *(void **)(v9 + 776);
  objc_msgSend((id)v9, "accessibilityIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAccessibilityIdentifier:", v24);

  return (AVButton *)(id)v9;
}

- (void)_updateLayoutItem
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  if (a1)
  {
    objc_msgSend(a1, "layoutAttributes");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "intrinsicContentSize");
    objc_msgSend(v2, "setMinimumSize:");

    objc_msgSend(a1, "layoutAttributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "isIncluded"))
      v4 = objc_msgSend(a1, "isRemoved") ^ 1;
    else
      v4 = 0;
    objc_msgSend(v3, "setIncluded:", v4);

    objc_msgSend(a1, "layoutAttributes");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCollapsed:", objc_msgSend(a1, "isCollapsed"));

  }
}

- (AVLayoutItemAttributes)layoutAttributes
{
  return self->_layoutAttributes;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (BOOL)isIncluded
{
  return self->_included;
}

- (double)_preferredLayoutSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;

  if (!a1)
    return 0.0;
  objc_msgSend(a1, "extrinsicContentSize");
  v3 = v2;
  if (v4 > 0.0 && v2 <= 0.0)
  {
    if (objc_msgSend(a1, "hasFullScreenAppearance"))
      objc_msgSend(a1, "fullscreenAlternateImagePadding");
    else
      objc_msgSend(a1, "alternateImagePadding");
    v6 = v5;
    if (!objc_msgSend(a1, "hasAlternateAppearance"))
      v6 = 0.0;
    objc_msgSend(a1, "imageForState:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "size");
    v3 = v6 + v8;

  }
  return v3;
}

- (CGSize)extrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_extrinsicContentSize.width;
  height = self->_extrinsicContentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  objc_super v10;
  CGSize result;

  if (-[AVButton isSecondGeneration](self, "isSecondGeneration"))
  {
    -[AVButton intrinsicContentSize](&v10, sel_intrinsicContentSize, v9.receiver, v9.super_class, self, AVButton);
    goto LABEL_11;
  }
  -[AVButton titleForState:](self, "titleForState:", 0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_8:
    v3 = -[AVButton _preferredLayoutSize](self);
    goto LABEL_11;
  }
  v6 = (void *)v5;
  -[AVButton imageForState:](self, "imageForState:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

    goto LABEL_8;
  }
  -[AVButton micaPackage](self, "micaPackage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    goto LABEL_8;
  -[AVButton intrinsicContentSize](&v9, sel_intrinsicContentSize, self, AVButton, v10.receiver, v10.super_class);
LABEL_11:
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)isSecondGeneration
{
  return self->_secondGeneration;
}

- (void)layoutAttributesDidChange
{
  id v3;

  -[AVButton layoutAttributes](self, "layoutAttributes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AVButton setCollapsed:](self, "setCollapsed:", objc_msgSend(v3, "isCollapsed"));

}

- (void)setCollapsed:(BOOL)a3
{
  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
    -[AVButton _updateLayoutItem](self);
  }
}

- (BOOL)isRemoved
{
  return self->_removed;
}

- (id)_preferredFont
{
  id v1;
  void *v2;
  id v3;

  v1 = a1;
  if (a1)
  {
    if ((objc_msgSend(a1, "hasAlternateAppearance") & 1) != 0)
      objc_msgSend(v1, "alternateFullScreenFont");
    else
      objc_msgSend(v1, "fullScreenFont");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v1, "hasFullScreenAppearance"))
    {
      v3 = v2;
    }
    else
    {
      objc_msgSend(v1, "inlineFont");
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    v1 = v3;

  }
  return v1;
}

- (void)layoutSubviews
{
  double v3;
  void *v4;
  objc_super v5;
  CGRect v6;
  CGRect v7;

  if (-[AVButton hasFullScreenAppearance](self, "hasFullScreenAppearance"))
    v3 = 12.0;
  else
    v3 = 8.0;
  -[AVButton backgroundEffectView](self, "backgroundEffectView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVButton bounds](self, "bounds");
  v7 = CGRectInset(v6, 0.0, v3);
  objc_msgSend(v4, "setFrame:", v7.origin.x, v7.origin.y, v7.size.width, v7.size.height);

  v5.receiver = self;
  v5.super_class = (Class)AVButton;
  -[AVButton layoutSubviews](&v5, sel_layoutSubviews);
}

- (BOOL)hasFullScreenAppearance
{
  return self->_hasFullScreenAppearance;
}

- (UIVisualEffectView)backgroundEffectView
{
  return self->_backgroundEffectView;
}

- (BOOL)hasAlternateAppearance
{
  return self->_hasAlternateAppearance;
}

- (void)_updateTintColorIfNeeded
{
  void *v2;
  void *v3;
  id v4;

  if (a1 && (objc_msgSend(a1, "isSecondGeneration") & 1) == 0)
  {
    objc_msgSend(a1, "imageName");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {

    }
    else
    {
      objc_msgSend(a1, "imageForState:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v3)
        return;
    }
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, -[AVButton _imageViewAlpha](a1));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setTintColor:", v4);

  }
}

- (NSString)imageName
{
  return self->_imageName;
}

- (UIFont)inlineFont
{
  return self->_inlineFont;
}

- (UIFont)fullScreenFont
{
  return self->_fullScreenFont;
}

- (void)setTintEffectStyle:(int64_t)a3
{
  self->_tintEffectStyle = a3;
  -[AVButton _updateTintColorIfNeeded](self);
}

- (void)setHitRectInsets:(NSDirectionalEdgeInsets)a3
{
  self->_hitRectInsets = a3;
}

- (void)setFullScreenFont:(id)a3
{
  objc_storeStrong((id *)&self->_fullScreenFont, a3);
}

- (double)alternateImagePadding
{
  return self->_alternateImagePadding;
}

- (void)setAlternateFullScreenFont:(id)a3
{
  objc_storeStrong((id *)&self->_alternateFullScreenFont, a3);
}

- (void)setMicaSnapshotAlpha:(double)a3
{
  self->_micaSnapshotAlpha = a3;
}

- (void)setInlineFont:(id)a3
{
  objc_storeStrong((id *)&self->_inlineFont, a3);
}

- (void)setSecondGeneration:(BOOL)a3
{
  self->_secondGeneration = a3;
}

- (void)setForceThreshold:(double)a3
{
  self->_forceThreshold = a3;
}

- (double)_imageViewAlpha
{
  uint64_t v2;
  void *v3;
  double v4;
  double v5;

  if (!a1)
    return 0.0;
  v2 = objc_msgSend(a1, "tintEffectStyle");
  objc_msgSend(a1, "micaPackage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1, "micaSnapshotAlpha");
    v5 = v4;
  }
  else if (v2)
  {
    v5 = 0.55;
  }
  else
  {
    v5 = 0.75;
  }

  return v5;
}

- (NSString)alternateImageName
{
  return self->_alternateImageName;
}

- (UIFont)alternateFullScreenFont
{
  return self->_alternateFullScreenFont;
}

- (void)setIncluded:(BOOL)a3
{
  if (self->_included != a3)
  {
    self->_included = a3;
    -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
    -[AVButton _updateLayoutItem](self);
  }
}

- (void)setHasFullScreenAppearance:(BOOL)a3
{
  if (self->_hasFullScreenAppearance != a3)
  {
    self->_hasFullScreenAppearance = a3;
    -[AVButton _updateImageIfNeeded](self);
    -[AVButton _updateEdgeInsets]((uint64_t)self);
  }
}

- (void)setExtrinsicContentSize:(CGSize)a3
{
  void *v5;

  if (a3.width != self->_extrinsicContentSize.width || a3.height != self->_extrinsicContentSize.height)
  {
    self->_extrinsicContentSize = a3;
    if (!-[AVButton isSecondGeneration](self, "isSecondGeneration"))
    {
      -[AVButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      -[AVButton superview](self, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", self);

    }
    -[AVButton _updateLayoutItem](self);
  }
}

+ (AVButton)buttonWithAccessibilityIdentifier:(id)a3 isSecondGeneration:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;

  v4 = a4;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "buttonWithAccessibilityIdentifier:accessibilityLabel:isSecondGeneration:", v5, 0, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVButton *)v6;
}

- (BOOL)isCollapsedOrExcluded
{
  return -[AVButton isCollapsed](self, "isCollapsed")
      || !-[AVButton isIncluded](self, "isIncluded")
      || -[AVButton isRemoved](self, "isRemoved");
}

- (void)setMicaPackage:(id)a3
{
  AVMicaPackage *v5;
  AVMicaPackage *micaPackage;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  AVMicaPackage *v29;

  v5 = (AVMicaPackage *)a3;
  micaPackage = self->_micaPackage;
  if (micaPackage != v5)
  {
    v29 = v5;
    -[AVMicaPackage rootLayer](micaPackage, "rootLayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperlayer");

    objc_storeStrong((id *)&self->_micaPackage, a3);
    -[AVMicaPackage rootLayer](v29, "rootLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVButton imageForState:](self, "imageForState:", 0);
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", v9 != 0);

    -[AVMicaPackage rootLayer](v29, "rootLayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_msgSend(v10, "isHidden");

    if ((v9 & 1) == 0)
    {
      -[AVButton layer](self, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setCompositingFilter:", 0);

    }
    if (v29)
    {
      -[AVButton layer](self, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVMicaPackage rootLayer](v29, "rootLayer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSublayer:", v13);

    }
    -[AVButton micaPackage](self, "micaPackage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rootLayer");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      -[AVButton bounds](self, "bounds");
      UIRectGetCenter();
      v18 = v17;
      v20 = v19;
      -[AVButton micaPackage](self, "micaPackage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "rootLayer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "position");
      v24 = v23;
      v26 = v25;

      if (v18 != v24 || v20 != v26)
      {
        objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
        objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
        -[AVButton micaPackage](self, "micaPackage");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "rootLayer");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVButton bounds](self, "bounds");
        UIRectGetCenter();
        objc_msgSend(v28, "setPosition:");

        objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      }
    }
    else
    {

    }
    -[AVButton _updateEdgeInsets]((uint64_t)self);
    -[AVButton _updateLayoutItem](self);
    v5 = v29;
  }

}

void __31__AVButton_setActiveImageName___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  int v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v13 = a2;
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "activeImageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)a1)
  {
    v6 = objc_loadWeakRetained(v3);
    objc_msgSend(v6, "setImage:forState:", v13, 0);

    v7 = objc_loadWeakRetained(v3);
    v8 = objc_msgSend(v7, "isSecondGeneration");

    if (v8)
    {
      v9 = objc_loadWeakRetained(v3);
      objc_msgSend(v9, "invalidateIntrinsicContentSize");

      v10 = objc_loadWeakRetained(v3);
      objc_msgSend(v10, "superview");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_loadWeakRetained(v3);
      objc_msgSend(v11, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", v12);

    }
  }

}

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  objc_super v26;

  v6 = a3;
  v7 = -[AVButton _preferredLayoutSize](self);
  v9 = v8;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[AVButton micaPackage](self, "micaPackage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rootLayer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", 1);

    if (!-[AVButton isSecondGeneration](self, "isSecondGeneration"))
    {
      -[AVButton layer](self, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "compositingFilter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        -[AVButton layer](self, "layer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setCompositingFilter:", *MEMORY[0x1E0CD2EA0]);

        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, -[AVButton _imageViewAlpha](self));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVButton setTintColor:](self, "setTintColor:", v15);

      }
    }
    v26.receiver = self;
    v26.super_class = (Class)AVButton;
    -[AVButton setImage:forState:](&v26, sel_setImage_forState_, v6, a4);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)AVButton;
    -[AVButton setImage:forState:](&v25, sel_setImage_forState_, 0, a4);
    -[AVButton _updateTintColorIfNeeded](self);
  }
  v16 = -[AVButton isSecondGeneration](self, "isSecondGeneration");
  if (v7 != -[AVButton _preferredLayoutSize](self) || v9 != v17 || v16)
  {
    -[AVButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[AVButton superview](self, "superview");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", self);

  }
  -[AVButton setContentEdgeInsets:](self, "setContentEdgeInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  -[AVButton _updateBackgroundEffectViewIsHidden](self);
  -[AVButton _updateEdgeInsets]((uint64_t)self);
  -[AVButton _updateLayoutItem](self);
  if (!v6)
  {
    -[AVButton micaPackage](self, "micaPackage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "rootLayer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isHidden");

    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      -[AVButton layer](self, "layer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setCompositingFilter:", 0);

      -[AVButton micaPackage](self, "micaPackage");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "rootLayer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setHidden:", 0);

      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
  }

}

- (uint64_t)_updateEdgeInsets
{
  void *v1;
  int v2;
  int v3;
  void *v4;
  double v5;
  double v6;
  void *v7;

  if (result)
  {
    v1 = (void *)result;
    result = objc_msgSend((id)result, "isSecondGeneration");
    if ((result & 1) == 0)
    {
      v2 = objc_msgSend(v1, "usesBackgroundEffectViewForTextOnlyButtons");
      v3 = objc_msgSend(v1, "usesBackgroundEffectViewForTextOnlyButtons");
      objc_msgSend(v1, "imageForState:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {

      }
      else
      {
        if (v3)
          v5 = 14.0;
        else
          v5 = 16.0;
        if (v2)
          v6 = 4.0;
        else
          v6 = 16.0;
        objc_msgSend(v1, "micaPackage");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v7)
          return objc_msgSend(v1, "setContentEdgeInsets:", v5, v6, v5, v6);
      }
      v5 = 0.0;
      v6 = 0.0;
      return objc_msgSend(v1, "setContentEdgeInsets:", v5, v6, v5, v6);
    }
  }
  return result;
}

- (BOOL)usesBackgroundEffectViewForTextOnlyButtons
{
  return self->_usesBackgroundEffectViewForTextOnlyButtons;
}

- (void)_updateBackgroundEffectViewIsHidden
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (a1)
  {
    objc_msgSend(a1, "titleForState:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend(a1, "titleForState:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "length"))
      {
        objc_msgSend(a1, "imageForState:", 0);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
        {
          v5 = 1;
        }
        else
        {
          objc_msgSend(a1, "micaPackage");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (v6)
            v5 = 1;
          else
            v5 = objc_msgSend(a1, "usesBackgroundEffectViewForTextOnlyButtons") ^ 1;

        }
      }
      else
      {
        v5 = 1;
      }

    }
    else
    {
      v5 = 1;
    }

    objc_msgSend(a1, "backgroundEffectView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", v5);

  }
}

- (NSString)activeImageName
{
  return self->_activeImageName;
}

- (AVMicaPackage)micaPackage
{
  return self->_micaPackage;
}

- (void)setHasAlternateAppearance:(BOOL)a3
{
  if (self->_hasAlternateAppearance != a3)
  {
    self->_hasAlternateAppearance = a3;
    -[AVButton _updateImageIfNeeded](self);
  }
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVButton;
  -[AVButton willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (a3)
    -[AVButton _updateImageIfNeeded](self);
}

- (void)setImageName:(id)a3
{
  NSString *v4;
  NSString *imageName;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_imageName, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    imageName = self->_imageName;
    self->_imageName = v4;

    -[AVButton _updateImageIfNeeded](self);
  }

}

- (void)_updateImageIfNeeded
{
  id v2;

  if (a1)
  {
    if ((objc_msgSend(a1, "hasAlternateAppearance") & 1) != 0)
      objc_msgSend(a1, "alternateImageName");
    else
      objc_msgSend(a1, "imageName");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setActiveImageName:", v2);

  }
}

- (void)setActiveImageName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *activeImageName;
  char v8;
  NSString *v9;
  NSString *v10;
  UIFont *v11;
  UIFont *activeFont;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v4 = a3;
  if (-[NSString isEqualToString:](self->_activeImageName, "isEqualToString:", v4))
  {
    -[AVButton activeFont](self, "activeFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVButton _preferredFont](self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqual:", v6) & 1) != 0)
    {

      goto LABEL_20;
    }
    if (v4)
    {

      goto LABEL_9;
    }
    activeImageName = self->_activeImageName;

    if (!activeImageName)
      goto LABEL_20;
  }
  else
  {
    if (v4)
    {
LABEL_9:
      if (!self->_activeImageName)
      {
        if (-[AVButton tintEffectStyle](self, "tintEffectStyle"))
          +[AVBackdropView applySecondaryGlyphTintToView:](AVBackdropView, "applySecondaryGlyphTintToView:", self);
        else
          +[AVBackdropView applyPrimaryGlyphTintToView:](AVBackdropView, "applyPrimaryGlyphTintToView:", self);
      }
      v8 = 0;
      goto LABEL_16;
    }
    if (!self->_activeImageName)
      goto LABEL_20;
  }
  v8 = 1;
LABEL_16:
  v9 = (NSString *)objc_msgSend(v4, "copy");
  v10 = self->_activeImageName;
  self->_activeImageName = v9;

  -[AVButton _preferredFont](self);
  v11 = (UIFont *)objc_claimAutoreleasedReturnValue();
  activeFont = self->_activeFont;
  self->_activeFont = v11;

  if ((v8 & 1) != 0 || (objc_msgSend(v4, "isEqualToString:", CFSTR("AVMobileImageNameNoImage")) & 1) != 0)
  {
    -[AVButton setImage:forState:](self, "setImage:forState:", 0, 0);
  }
  else
  {
    objc_initWeak(&location, self);
    v13 = (void *)MEMORY[0x1E0DC3870];
    -[AVButton activeFont](self, "activeFont");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __31__AVButton_setActiveImageName___block_invoke;
    v15[3] = &unk_1E5BB4940;
    objc_copyWeak(&v17, &location);
    v16 = v4;
    objc_msgSend(v13, "avkit_imageWithSymbolNamed:font:completion:", v16, v14, v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
LABEL_20:

}

- (int64_t)tintEffectStyle
{
  return self->_tintEffectStyle;
}

- (UIFont)activeFont
{
  return self->_activeFont;
}

- (void)setAlternateImageName:(id)a3
{
  NSString *v4;
  NSString *alternateImageName;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_alternateImageName, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    alternateImageName = self->_alternateImageName;
    self->_alternateImageName = v4;

    -[AVButton _updateImageIfNeeded](self);
  }

}

- (void)setTreatsForcePressAsLongPress:(BOOL)a3
{
  self->_treatsForcePressAsLongPress = a3;
}

- (void)setMultipleTouchesEndsTracking:(BOOL)a3
{
  AVUserInteractionObserverGestureRecognizer *v4;
  void *v5;
  id v6;

  if (self->_multipleTouchesEndsTracking != a3)
  {
    self->_multipleTouchesEndsTracking = a3;
    if (a3)
    {
      v4 = -[AVUserInteractionObserverGestureRecognizer initWithTarget:action:]([AVUserInteractionObserverGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleUserInteractionGestureRecognizer_);
      -[AVButton setUserInteractionGestureRecognizer:](self, "setUserInteractionGestureRecognizer:", v4);

      -[AVButton userInteractionGestureRecognizer](self, "userInteractionGestureRecognizer");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[AVButton addGestureRecognizer:](self, "addGestureRecognizer:", v6);

    }
    else
    {
      -[AVButton userInteractionGestureRecognizer](self, "userInteractionGestureRecognizer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVButton removeGestureRecognizer:](self, "removeGestureRecognizer:", v5);

      -[AVButton setUserInteractionGestureRecognizer:](self, "setUserInteractionGestureRecognizer:", 0);
    }
  }
}

- (AVUserInteractionObserverGestureRecognizer)userInteractionGestureRecognizer
{
  return self->_userInteractionGestureRecognizer;
}

- (void)setUserInteractionGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_userInteractionGestureRecognizer, a3);
}

- (void)setFullscreenAlternateImagePadding:(double)a3
{
  self->_fullscreenAlternateImagePadding = a3;
}

- (void)setAlternateImagePadding:(double)a3
{
  self->_alternateImagePadding = a3;
}

- (void)setEnabled:(BOOL)a3
{
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVButton;
  -[AVButton setEnabled:](&v6, sel_setEnabled_);
  if (-[AVButton isTracking](self, "isTracking") && !a3)
  {
    -[AVButton setTracking:](self, "setTracking:", 0);
    -[AVButton setHighlighted:](self, "setHighlighted:", 0);
    -[AVButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 256);
    -[AVButton setForce:](self, "setForce:", 0.0);
    if (-[AVButton wasLongPressed](self, "wasLongPressed"))
      -[AVButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x800000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __23__AVButton_setEnabled___block_invoke;
    block[3] = &unk_1E5BB4CA0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)setClampsHitRectInsetsWhenContainedInScrollableView:(BOOL)a3
{
  self->_clampsHitRectInsetsWhenContainedInScrollableView = a3;
}

- (void)setAppliesTransformToImageViewWhenHighlighted:(BOOL)a3
{
  self->_appliesTransformToImageViewWhenHighlighted = a3;
}

- (void)setBounds:(CGRect)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)AVButton;
  -[AVButton setBounds:](&v19, sel_setBounds_);
  -[AVButton micaPackage](self, "micaPackage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootLayer");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    UIRectGetCenter();
    v8 = v7;
    v10 = v9;
    -[AVButton micaPackage](self, "micaPackage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rootLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "position");
    v14 = v13;
    v16 = v15;

    if (v8 != v14 || v10 != v16)
    {
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
      -[AVButton micaPackage](self, "micaPackage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "rootLayer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVButton bounds](self, "bounds");
      UIRectGetCenter();
      objc_msgSend(v18, "setPosition:");

      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
    }
  }
  else
  {

  }
}

- (void)setRemoved:(BOOL)a3
{
  if (self->_removed != a3)
  {
    self->_removed = a3;
    -[UIView avkit_reevaluateHiddenStateOfItem:](self, "avkit_reevaluateHiddenStateOfItem:", self);
    -[AVButton _updateLayoutItem](self);
  }
}

- (void)setWasLongPressed:(BOOL)a3
{
  uint64_t v3;

  if (self->_wasLongPressed != a3)
  {
    self->_wasLongPressed = a3;
    if (a3)
      v3 = 0x400000;
    else
      v3 = 0x800000;
    -[AVButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", v3);
  }
}

- (void)setForce:(double)a3
{
  if (self->_force != a3)
  {
    self->_force = a3;
    if (!-[AVButton treatsForcePressAsLongPress](self, "treatsForcePressAsLongPress"))
      -[AVButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x2000000);
  }
}

- (NSDirectionalEdgeInsets)hitRectInsets
{
  double leading;
  double top;
  double trailing;
  double bottom;
  double v7;
  double v8;
  double v9;
  double v10;
  NSDirectionalEdgeInsets result;

  top = self->_hitRectInsets.top;
  leading = self->_hitRectInsets.leading;
  bottom = self->_hitRectInsets.bottom;
  trailing = self->_hitRectInsets.trailing;
  if (-[AVButton clampsHitRectInsetsWhenContainedInScrollableView](self, "clampsHitRectInsetsWhenContainedInScrollableView")&& -[UIView avkit_isDescendantOfViewPassingTest:](self, "avkit_isDescendantOfViewPassingTest:", &__block_literal_global_22641))
  {
    trailing = -32.0;
    bottom = -32.0;
    leading = -32.0;
    top = -32.0;
  }
  v7 = top;
  v8 = leading;
  v9 = bottom;
  v10 = trailing;
  result.trailing = v10;
  result.bottom = v9;
  result.leading = v8;
  result.top = v7;
  return result;
}

- (void)setUsesBackgroundEffectViewForTextOnlyButtons:(BOOL)a3
{
  _BOOL4 v3;
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

  if (self->_usesBackgroundEffectViewForTextOnlyButtons != a3)
  {
    v3 = a3;
    self->_usesBackgroundEffectViewForTextOnlyButtons = a3;
    -[AVButton backgroundEffectView](self, "backgroundEffectView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5 && v3)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", 0);
      -[AVButton setBackgroundEffectView:](self, "setBackgroundEffectView:", v6);

      -[AVButton backgroundEffectView](self, "backgroundEffectView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVButton insertSubview:atIndex:](self, "insertSubview:atIndex:", v7, 0);

      -[AVButton backgroundEffectView](self, "backgroundEffectView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setUserInteractionEnabled:", 0);

      -[AVButton backgroundEffectView](self, "backgroundEffectView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0DC3F50];
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "effectCompositingColor:withMode:alpha:", v11, 24, 0.1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setEffect:", v12);

      -[AVButton backgroundEffectView](self, "backgroundEffectView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_setContinuousCornerRadius:", 6.0);

    }
    -[AVButton backgroundEffectView](self, "backgroundEffectView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setHidden:", !v3);

    -[AVButton _updateEdgeInsets]((uint64_t)self);
  }
}

- (double)baselineOffsetFromBottom
{
  void *v3;
  double v4;
  double v5;
  float v6;
  BOOL v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[AVButton imageForState:](self, "imageForState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  if (!v3)
    goto LABEL_9;
  v5 = v4;
  v6 = v4;
  *(float *)&v4 = fabsf(v6);
  v7 = v6 <= 0.0 || *(float *)&v4 < 0.00000011921;
  if (v7
    || (-[AVButton titleForState:](self, "titleForState:", 0, 3.18618444e-58, v4),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8)
    || (-[AVButton intrinsicContentSize](self, "intrinsicContentSize"), v9 <= v5))
  {
LABEL_9:
    v12 = NAN;
  }
  else
  {
    v10 = v9;
    objc_msgSend(v3, "baselineOffsetFromBottom");
    v12 = (v10 - v5) * 0.5 + v11;
  }

  return v12;
}

- (void)setHighlighted:(BOOL)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;
  objc_super v8;
  objc_super v9;
  _QWORD v10[4];
  id v11;
  id location;

  v3 = a3;
  if (-[AVButton wasLongPressed](self, "wasLongPressed"))
    v3 = v3 & ~-[AVButton disablesHighlightWhenLongPressed](self, "disablesHighlightWhenLongPressed");
  v9.receiver = self;
  v9.super_class = (Class)AVButton;
  if ((_DWORD)v3 != -[AVButton isHighlighted](&v9, sel_isHighlighted))
  {
    v8.receiver = self;
    v8.super_class = (Class)AVButton;
    -[AVButton setHighlighted:](&v8, sel_setHighlighted_, v3);
    if (!self->_disablesHighlightAnimation)
    {
      -[AVButton highlightAnimator](self, "highlightAnimator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "isRunning") && objc_msgSend(v5, "isInterruptible"))
      {
        objc_msgSend(v5, "stopAnimation:", 0);
        objc_msgSend(v5, "finishAnimationAtPosition:", 2);
      }
      if ((objc_msgSend(v5, "isRunning") & 1) != 0)
      {
        v6 = v5;
      }
      else
      {
        objc_initWeak(&location, self);
        v7 = objc_alloc(MEMORY[0x1E0DC3F38]);
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __38__AVButton__performHighlightAnimation__block_invoke;
        v10[3] = &unk_1E5BB4A40;
        objc_copyWeak(&v11, &location);
        v6 = (void *)objc_msgSend(v7, "initWithDuration:curve:animations:", 3, v10, 0.1);

        objc_msgSend(v6, "startAnimation");
        -[AVButton setHighlightAnimator:](self, "setHighlightAnimator:", v6);
        objc_destroyWeak(&v11);
        objc_destroyWeak(&location);
      }

    }
  }
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id location;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)AVButton;
  v8 = -[AVButton beginTrackingWithTouch:withEvent:](&v19, sel_beginTrackingWithTouch_withEvent_, v6, v7);
  if (v8)
  {
    -[AVButton setTrackingStartTime:](self, "setTrackingStartTime:", CFAbsoluteTimeGetCurrent());
    objc_initWeak(&location, self);
    v9 = (void *)MEMORY[0x1E0C99E88];
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __45__AVButton_beginTrackingWithTouch_withEvent___block_invoke;
    v16 = &unk_1E5BB49A8;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v9, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v13, 0.5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVButton setLongPressTimer:](self, "setLongPressTimer:", v10, v13, v14, v15, v16);
    -[AVButton longPressTimer](self, "longPressTimer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTolerance:", 0.05);

    objc_msgSend(v6, "force");
    -[AVButton setForce:](self, "setForce:");

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6;
  _BOOL4 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double Current;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  objc_super v30;

  v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)AVButton;
  v7 = -[AVButton continueTrackingWithTouch:withEvent:](&v30, sel_continueTrackingWithTouch_withEvent_, v6, a4);
  if (v7)
  {
    -[AVButton maximumForceSinceTrackingBegan](self, "maximumForceSinceTrackingBegan");
    v9 = v8;
    -[AVButton forceThreshold](self, "forceThreshold");
    v11 = v10;
    -[AVButton maximumForceSinceTrackingBegan](self, "maximumForceSinceTrackingBegan");
    v13 = v12;
    objc_msgSend(v6, "force");
    if (v13 >= v14)
      v14 = v13;
    -[AVButton setMaximumForceSinceTrackingBegan:](self, "setMaximumForceSinceTrackingBegan:", v14);
    Current = CFAbsoluteTimeGetCurrent();
    -[AVButton trackingStartTime](self, "trackingStartTime");
    v17 = v16;
    -[AVButton maximumForceSinceTrackingBegan](self, "maximumForceSinceTrackingBegan");
    v19 = v18;
    -[AVButton forceThreshold](self, "forceThreshold");
    if (v19 >= v20)
    {
      v20 = Current - v17;
      if (Current - v17 > 0.12)
      {
        if (-[AVButton treatsForcePressAsLongPress](self, "treatsForcePressAsLongPress", v20))
        {
          -[AVButton setWasLongPressed:](self, "setWasLongPressed:", 1);
        }
        else
        {
          -[AVButton setWasLongPressed:](self, "setWasLongPressed:", 0);
          -[AVButton longPressTimer](self, "longPressTimer");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "invalidate");

          objc_msgSend(v6, "force");
          -[AVButton setForce:](self, "setForce:");
          if (v9 < v11)
          {
            -[AVButton setWasForcePressTriggered:](self, "setWasForcePressTriggered:", 1);
            -[AVButton sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 0x1000000);
          }
        }
      }
    }
    if (-[AVButton wasLongPressed](self, "wasLongPressed", v20))
    {
      -[AVButton previousHorizontalPositionOfLongPress](self, "previousHorizontalPositionOfLongPress");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        -[AVButton previousHorizontalPositionOfLongPress](self, "previousHorizontalPositionOfLongPress");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "doubleValue");
        v25 = v24;

        objc_msgSend(v6, "locationInView:", self);
        -[AVButton setHorizontalTranslationOfLongPress:](self, "setHorizontalTranslationOfLongPress:", v26 - v25);
      }
      v27 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v6, "locationInView:", self);
      objc_msgSend(v27, "numberWithDouble:");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVButton setPreviousHorizontalPositionOfLongPress:](self, "setPreviousHorizontalPositionOfLongPress:", v28);

    }
  }

  return v7;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVButton;
  -[AVButton endTrackingWithTouch:withEvent:](&v6, sel_endTrackingWithTouch_withEvent_, a3, a4);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AVButton_endTrackingWithTouch_withEvent___block_invoke;
  block[3] = &unk_1E5BB4CA0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)cancelTrackingWithEvent:(id)a3
{
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVButton;
  -[AVButton cancelTrackingWithEvent:](&v5, sel_cancelTrackingWithEvent_, a3);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__AVButton_cancelTrackingWithEvent___block_invoke;
  block[3] = &unk_1E5BB4CA0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)setTitle:(id)a3 forState:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  -[AVButton titleForState:](self, "titleForState:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)AVButton;
  -[AVButton setTitle:forState:](&v12, sel_setTitle_forState_, v6, a4);
  LOBYTE(a4) = objc_msgSend(v7, "isEqualToString:", v6);

  if ((a4 & 1) == 0)
  {
    -[AVButton _updateBackgroundEffectViewIsHidden](self);
    -[AVButton _updateEdgeInsets]((uint64_t)self);
    -[AVButton _updateLayoutItem](self);
    -[AVButton invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[AVButton superview](self, "superview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "avkit_intrinsicContentSizeOfSubviewWasInvalidated:", self);

  }
  if (v6 && !v7)
  {
    -[AVButton layer](self, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCompositingFilter:", 0);

    v10 = -[AVButton tintEffectStyle](self, "tintEffectStyle");
    -[AVButton titleLabel](self, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      +[AVBackdropView applySecondaryGlyphTintToView:](AVBackdropView, "applySecondaryGlyphTintToView:", v11);
    else
      +[AVBackdropView applyPrimaryGlyphTintToView:](AVBackdropView, "applyPrimaryGlyphTintToView:", v11);

  }
}

- (id)accessibilityLabel
{
  NSString *v3;
  objc_super v5;

  v3 = self->_accessibilityLabelOverride;
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVButton;
    -[AVButton accessibilityLabel](&v5, sel_accessibilityLabel);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (CGRect)hitRect
{
  double v3;
  double v4;
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
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v26;
  CGRect result;

  v26.receiver = self;
  v26.super_class = (Class)AVButton;
  -[AVButton hitRect](&v26, sel_hitRect);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[AVButton hitRectInsets](self, "hitRectInsets");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = -[AVButton effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (v19 == 1)
    v20 = v18;
  else
    v20 = v14;
  if (v19 == 1)
    v21 = v14;
  else
    v21 = v18;
  v22 = v4 + v20;
  v23 = v6 + v12;
  v24 = v8 - (v20 + v21);
  v25 = v10 - (v12 + v16);
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[AVButton hitRect](self, "hitRect", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (void)setContentIntersection:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_contentIntersection;
  double v9;
  double v10;
  unint64_t v11;
  _BOOL4 v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_contentIntersection = &self->_contentIntersection;
  if (!CGRectEqualToRect(self->_contentIntersection, a3))
  {
    p_contentIntersection->origin.x = x;
    p_contentIntersection->origin.y = y;
    p_contentIntersection->size.width = width;
    p_contentIntersection->size.height = height;
    -[AVButton bounds](self, "bounds");
    v11 = (unint64_t)(COERCE__INT64(fabs(v9 * v10)) - 0x10000000000000) >> 53;
    v14 = (COERCE__INT64(v9 * v10) >= 0 && v11 <= 0x3FE
        || (unint64_t)(COERCE__INT64(v9 * v10) - 1) <= 0xFFFFFFFFFFFFELL)
       && p_contentIntersection->size.height * p_contentIntersection->size.width / (v9 * v10) > 0.5;
    if (self->_buttonIsOverVideo != v14)
    {
      self->_buttonIsOverVideo = v14;
      if (-[AVButton isSecondGeneration](self, "isSecondGeneration"))
        -[AVButton setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 2 * self->_buttonIsOverVideo);
    }
  }
}

- (void)interruptActiveInteractions
{
  id v2;

  -[AVButton contextMenuInteraction](self, "contextMenuInteraction");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissMenu");

}

- (void)_handleUserInteractionGestureRecognizer:(id)a3
{
  id v4;

  v4 = a3;
  if (-[AVButton multipleTouchesEndsTracking](self, "multipleTouchesEndsTracking")
    && (unint64_t)objc_msgSend(v4, "numberOfTouches") >= 2)
  {
    -[AVButton setEnabled:](self, "setEnabled:", 0);
    -[AVButton setEnabled:](self, "setEnabled:", 1);
  }

}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVButton;
  -[AVButton debugDescription](&v9, sel_debugDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[AVButton accessibilityIdentifier](self, "accessibilityIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR(" %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (CGRect)contentIntersection
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentIntersection.origin.x;
  y = self->_contentIntersection.origin.y;
  width = self->_contentIntersection.size.width;
  height = self->_contentIntersection.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)wasLongPressed
{
  return self->_wasLongPressed;
}

- (BOOL)treatsForcePressAsLongPress
{
  return self->_treatsForcePressAsLongPress;
}

- (double)forceThreshold
{
  return self->_forceThreshold;
}

- (double)force
{
  return self->_force;
}

- (double)maximumForceSinceTrackingBegan
{
  return self->_maximumForceSinceTrackingBegan;
}

- (void)setMaximumForceSinceTrackingBegan:(double)a3
{
  self->_maximumForceSinceTrackingBegan = a3;
}

- (BOOL)multipleTouchesEndsTracking
{
  return self->_multipleTouchesEndsTracking;
}

- (double)fullscreenAlternateImagePadding
{
  return self->_fullscreenAlternateImagePadding;
}

- (BOOL)appliesTransformToImageViewWhenHighlighted
{
  return self->_appliesTransformToImageViewWhenHighlighted;
}

- (double)micaSnapshotAlpha
{
  return self->_micaSnapshotAlpha;
}

- (BOOL)disablesHighlightWhenLongPressed
{
  return self->_disablesHighlightWhenLongPressed;
}

- (void)setDisablesHighlightWhenLongPressed:(BOOL)a3
{
  self->_disablesHighlightWhenLongPressed = a3;
}

- (BOOL)clampsHitRectInsetsWhenContainedInScrollableView
{
  return self->_clampsHitRectInsetsWhenContainedInScrollableView;
}

- (UIViewPropertyAnimator)highlightAnimator
{
  return (UIViewPropertyAnimator *)objc_loadWeakRetained((id *)&self->_highlightAnimator);
}

- (void)setHighlightAnimator:(id)a3
{
  objc_storeWeak((id *)&self->_highlightAnimator, a3);
}

- (double)trackingStartTime
{
  return self->_trackingStartTime;
}

- (void)setTrackingStartTime:(double)a3
{
  self->_trackingStartTime = a3;
}

- (BOOL)wasForcePressTriggered
{
  return self->_wasForcePressTriggered;
}

- (void)setWasForcePressTriggered:(BOOL)a3
{
  self->_wasForcePressTriggered = a3;
}

- (double)horizontalTranslationOfLongPress
{
  return self->_horizontalTranslationOfLongPress;
}

- (void)setHorizontalTranslationOfLongPress:(double)a3
{
  self->_horizontalTranslationOfLongPress = a3;
}

- (NSNumber)previousHorizontalPositionOfLongPress
{
  return self->_previousHorizontalPositionOfLongPress;
}

- (void)setPreviousHorizontalPositionOfLongPress:(id)a3
{
  objc_storeStrong((id *)&self->_previousHorizontalPositionOfLongPress, a3);
}

- (NSTimer)longPressTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_longPressTimer);
}

- (void)setLongPressTimer:(id)a3
{
  objc_storeWeak((id *)&self->_longPressTimer, a3);
}

- (void)setBackgroundEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundEffectView, a3);
}

- (void)setActiveFont:(id)a3
{
  objc_storeStrong((id *)&self->_activeFont, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeFont, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_userInteractionGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_longPressTimer);
  objc_storeStrong((id *)&self->_previousHorizontalPositionOfLongPress, 0);
  objc_destroyWeak((id *)&self->_highlightAnimator);
  objc_storeStrong((id *)&self->_micaPackage, 0);
  objc_storeStrong((id *)&self->_alternateFullScreenFont, 0);
  objc_storeStrong((id *)&self->_fullScreenFont, 0);
  objc_storeStrong((id *)&self->_inlineFont, 0);
  objc_storeStrong((id *)&self->_alternateImageName, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
  objc_storeStrong((id *)&self->_activeImageName, 0);
  objc_storeStrong((id *)&self->_layoutAttributes, 0);
  objc_storeStrong((id *)&self->_accessibilityLabelOverride, 0);
}

void *__36__AVButton_cancelTrackingWithEvent___block_invoke(uint64_t a1)
{
  return -[AVButton _resetTrackedState](*(void **)(a1 + 32));
}

- (void)_resetTrackedState
{
  void *v1;
  void *v2;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "longPressTimer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "invalidate");

    objc_msgSend(v1, "setHorizontalTranslationOfLongPress:", 0.0);
    objc_msgSend(v1, "setPreviousHorizontalPositionOfLongPress:", 0);
    objc_msgSend(v1, "setForce:", 0.0);
    objc_msgSend(v1, "setWasLongPressed:", 0);
    objc_msgSend(v1, "setMaximumForceSinceTrackingBegan:", 0.0);
    return (void *)objc_msgSend(v1, "setWasForcePressTriggered:", 0);
  }
  return result;
}

void *__43__AVButton_endTrackingWithTouch_withEvent___block_invoke(uint64_t a1)
{
  return -[AVButton _resetTrackedState](*(void **)(a1 + 32));
}

void __45__AVButton_beginTrackingWithTouch_withEvent___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  uint64_t v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setWasLongPressed:", objc_msgSend(v5, "isValid"));
    if (objc_msgSend(WeakRetained, "isTracking"))
      v4 = objc_msgSend(WeakRetained, "disablesHighlightWhenLongPressed") ^ 1;
    else
      v4 = 0;
    objc_msgSend(WeakRetained, "setHighlighted:", v4);
  }

}

void __38__AVButton__performHighlightAnimation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  __int128 v3;
  void *v4;
  void *v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    memset(&v7, 0, sizeof(v7));
    if (objc_msgSend(WeakRetained, "isHighlighted"))
    {
      CGAffineTransformMakeScale(&v7, 0.75, 0.75);
    }
    else
    {
      v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v7.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v7.c = v3;
      *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    }
    if (objc_msgSend(v2, "appliesTransformToImageViewWhenHighlighted"))
    {
      objc_msgSend(v2, "imageView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      objc_msgSend(v2, "imageView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v7;
      objc_msgSend(v5, "setTransform:", &v6);

    }
    else
    {
      v6 = v7;
      objc_msgSend(v2, "setTransform:", &v6);
    }
  }

}

void *__23__AVButton_setEnabled___block_invoke(uint64_t a1)
{
  return -[AVButton _resetTrackedState](*(void **)(a1 + 32));
}

BOOL __25__AVButton_hitRectInsets__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  char v5;
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
  _BOOL8 v18;
  CGRect v20;
  CGRect v21;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  if ((objc_msgSend(v4, "alwaysBounceVertical") & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(v4, "alwaysBounceHorizontal");
  objc_msgSend(v4, "contentSize");
  v7 = v6;
  objc_msgSend(v4, "contentInset");
  v9 = v8;
  objc_msgSend(v4, "contentInset");
  v11 = v10;
  objc_msgSend(v4, "contentSize");
  v13 = v12;
  objc_msgSend(v4, "contentInset");
  v15 = v14;
  objc_msgSend(v4, "contentInset");
  if ((v5 & 1) != 0 || (v17 = v16, objc_msgSend(v4, "bounds"), v7 - v9 - v11 > CGRectGetWidth(v20)))
  {
    v18 = 1;
  }
  else
  {
    objc_msgSend(v4, "bounds");
    v18 = v13 - v15 - v17 > CGRectGetHeight(v21);
  }

  return v18;
}

+ (id)customHighlightedAnimationButtonWithAccessibilityIdentifier:(id)a3
{
  id v3;
  _BYTE *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "buttonWithAccessibilityIdentifier:isSecondGeneration:", v3, 1);
  v4 = (_BYTE *)objc_claimAutoreleasedReturnValue();

  v4[760] = 1;
  return v4;
}

@end
