@implementation MTShadowView

- (MTShadowView)initWithShadowAttributes:(id *)a3 maskCornerRadius:(double)a4 continuousCorners:(BOOL)a5
{
  char *v8;
  MTShadowView *v9;
  __int128 v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MTShadowView;
  v8 = -[MTShadowView init](&v13, sel_init);
  v9 = (MTShadowView *)v8;
  if (v8)
  {
    v10 = *(_OWORD *)&a3->var1.height;
    *(_OWORD *)(v8 + 584) = *(_OWORD *)&a3->var0;
    *(_OWORD *)(v8 + 600) = v10;
    *((double *)v8 + 67) = a4;
    v8[528] = a5;
    objc_msgSend(v8, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsHitTesting:", 0);

  }
  return v9;
}

- (MTShadowView)initWithShadowAttributes:(id *)a3 maskCornerRadius:(double)a4
{
  __int128 v4;
  _OWORD v6[2];

  v4 = *(_OWORD *)&a3->var1.height;
  v6[0] = *(_OWORD *)&a3->var0;
  v6[1] = v4;
  return -[MTShadowView initWithShadowAttributes:maskCornerRadius:continuousCorners:](self, "initWithShadowAttributes:maskCornerRadius:continuousCorners:", v6, 1, a4);
}

- (UIEdgeInsets)shadowOutsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  -[MTShadowView _updateShadowOutsetsIfNecessary](self, "_updateShadowOutsetsIfNecessary");
  top = self->_shadowOutsets.top;
  left = self->_shadowOutsets.left;
  bottom = self->_shadowOutsets.bottom;
  right = self->_shadowOutsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setShadowColor:(id)a3
{
  UIColor *v4;
  UIColor *shadowColor;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (UIColor *)objc_msgSend(v6, "copy");
    shadowColor = self->_shadowColor;
    self->_shadowColor = v4;

    -[MTShadowView _updateShadowVisualStyling](self, "_updateShadowVisualStyling");
  }

}

- (CGRect)frameWithContentWithFrame:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[MTShadowView shadowOutsets](self, "shadowOutsets");
  MTRectApplyOutsets();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  BSRectWithSize();
  -[MTShadowView frameWithContentWithFrame:](self, "frameWithContentWithFrame:");
  v5 = v4;
  v7 = v6;
  result.height = v7;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTShadowView;
  -[MTShadowView layoutSubviews](&v3, sel_layoutSubviews);
  -[MTShadowView _validateImage](self, "_validateImage");
}

- (void)didMoveToSuperview
{
  void *v3;

  -[MTShadowView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[MTShadowView _updateShadowVisualStyling](self, "_updateShadowVisualStyling");
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTShadowView;
  -[MTShadowView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[MTShadowView _updateShadowVisualStyling](self, "_updateShadowVisualStyling");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  __int128 v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTShadowView;
  -[MTShadowView traitCollectionDidChange:](&v12, sel_traitCollectionDidChange_, v4);
  -[MTShadowView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  v7 = v6;
  objc_msgSend(v4, "displayScale");
  v9 = v8;

  if (v7 != v9)
  {
    v10 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
    *(_OWORD *)&self->_shadowOutsets.top = *MEMORY[0x24BDF7718];
    *(_OWORD *)&self->_shadowOutsets.bottom = v10;
    -[MTShadowView setNeedsLayout](self, "setNeedsLayout");
  }
  objc_msgSend(MEMORY[0x24BDF6F98], "bs_nextViewControllerForView:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bs_traitCollectionDidChange:forManagedTraitEnvironment:", v4, self);

}

- (void)_updateShadowOutsetsIfNecessary
{
  UIEdgeInsets *p_shadowOutsets;
  void *v3;
  $83F0DD3A623F7552E57A6A2CDFB333EA *p_shadowAttributes;
  void *v5;
  __int128 v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  _OWORD v11[2];

  p_shadowOutsets = &self->_shadowOutsets;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_shadowOutsets.top, *MEMORY[0x24BDF7718]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_shadowOutsets.bottom, *(float64x2_t *)(MEMORY[0x24BDF7718] + 16)))), 0xFuLL))) & 1) != 0)
  {
    v3 = (void *)MEMORY[0x24BDF6AC8];
    p_shadowAttributes = &self->_shadowAttributes;
    -[MTShadowView traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayScale");
    v6 = *(_OWORD *)&p_shadowAttributes->offset.height;
    v11[0] = *(_OWORD *)&p_shadowAttributes->opacity;
    v11[1] = v6;
    objc_msgSend(v3, "mt_edgeOutsetsForShadowProperties:scale:", v11);
    p_shadowOutsets->top = v7;
    p_shadowOutsets->left = v8;
    p_shadowOutsets->bottom = v9;
    p_shadowOutsets->right = v10;

  }
}

- (void)_validateImage
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
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
  uint64_t v20;
  uint64_t v21;
  double maskCornerRadius;
  _BOOL8 continuousCorners;
  __int128 v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  _OWORD v28[2];

  -[MTShadowView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTShadowView image](self, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;

  -[MTShadowView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  v9 = v8;

  -[MTShadowView bounds](self, "bounds");
  v11 = v10;
  v13 = v12;
  -[MTShadowView shadowOutsets](self, "shadowOutsets");
  v16 = v11 - (v14 + v15);
  v19 = v13 - (v17 + v18);
  if (!v3
    || v6 != v9
    || (MTDimensionsForContinuousCornerRadiusInBounds(),
        v26 = v21,
        v27 = v20,
        MTResizableAreaForCornerDimensionsInBounds(),
        MTDimensionsForContinuousCornerRadiusInBounds(),
        MTResizableAreaForCornerDimensionsInBounds(),
        !BSSizeEqualToSize())
    || (BSSizeEqualToSize() & 1) == 0)
  {
    self->_maskSizeForCurrentImage.width = v16;
    self->_maskSizeForCurrentImage.height = v19;
    maskCornerRadius = self->_maskCornerRadius;
    continuousCorners = self->_continuousCorners;
    v24 = *(_OWORD *)&self->_shadowAttributes.offset.height;
    v28[0] = *(_OWORD *)&self->_shadowAttributes.opacity;
    v28[1] = v24;
    objc_msgSend(MEMORY[0x24BDF6AC8], "mt_resizableShadowTemplateImageWithAttributes:scale:maskCornerRadius:continuousCorners:maskSize:", v28, continuousCorners, v9, maskCornerRadius, v16, v19, v26, v27);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTShadowView setImage:](self, "setImage:", v25);

  }
}

- (void)_updateShadowVisualStyling
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_shadowColor)
  {
    -[UIView mt_removeAllVisualStyling](self, "mt_removeAllVisualStyling");
    -[MTShadowView setTintColor:](self, "setTintColor:", self->_shadowColor);
  }
  else
  {
    -[MTShadowView setTintColor:](self, "setTintColor:", 0);
    -[MTShadowView traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceStyle");
    v5 = CFSTR("platterVibrantShadowLight");
    if (v4 == 2)
      v5 = CFSTR("platterVibrantShadowDark");
    v6 = v5;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTVisualStylingProvider _visualStylingProviderForStyleSetNamed:inBundle:](MTVisualStylingProvider, "_visualStylingProviderForStyleSetNamed:inBundle:", v6, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_visualStylingForStyle:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView mt_replaceVisualStyling:](self, "mt_replaceVisualStyling:", v8);

  }
}

- ($E6ACA31A68A174A6D79E6FEB346BFC3C)shadowAttributes
{
  __int128 v3;

  v3 = *(_OWORD *)&self[18].var2;
  *(CGSize *)&retstr->var0 = self[18].var1;
  *(_OWORD *)&retstr->var1.height = v3;
  return self;
}

- (double)maskCornerRadius
{
  return self->_maskCornerRadius;
}

- (BOOL)continuousCorners
{
  return self->_continuousCorners;
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowColor, 0);
}

@end
