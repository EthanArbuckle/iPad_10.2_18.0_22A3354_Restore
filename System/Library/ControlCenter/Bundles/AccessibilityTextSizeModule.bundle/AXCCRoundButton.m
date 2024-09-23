@implementation AXCCRoundButton

- (AXCCRoundButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  AXCCRoundButton *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CCUICAPackageView *packageView;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  UIImageView *v18;
  UIImageView *glyphImageView;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  UILabel *titleLabel;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  double v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  objc_super v66;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v66.receiver = self;
  v66.super_class = (Class)AXCCRoundButton;
  v7 = -[AXCCRoundButton initWithFrame:](&v66, sel_initWithFrame_);
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x24BE19B08]);
    v12 = objc_msgSend_initWithFrame_(v8, v9, v10, v11, x, y, width, height);
    packageView = v7->_packageView;
    v7->_packageView = (CCUICAPackageView *)v12;

    objc_msgSend_setUserInteractionEnabled_(v7->_packageView, v14, 0, v15);
    objc_msgSend_addSubview_(v7, v16, (uint64_t)v7->_packageView, v17);
    v18 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    glyphImageView = v7->_glyphImageView;
    v7->_glyphImageView = v18;

    objc_msgSend_setContentMode_(v7->_glyphImageView, v20, 4, v21);
    objc_msgSend_setUserInteractionEnabled_(v7->_glyphImageView, v22, 0, v23);
    objc_msgSend_addSubview_(v7, v24, (uint64_t)v7->_glyphImageView, v25);
    v26 = objc_alloc(MEMORY[0x24BEBD708]);
    v30 = objc_msgSend_initWithFrame_(v26, v27, v28, v29, x, y, width, height);
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = (UILabel *)v30;

    objc_msgSend_setNumberOfLines_(v7->_titleLabel, v32, 3, v33);
    objc_msgSend_setTextAlignment_(v7->_titleLabel, v34, 1, v35);
    LODWORD(v36) = 1051931443;
    objc_msgSend__setHyphenationFactor_(v7->_titleLabel, v37, v38, v39, v36);
    objc_msgSend_labelColor(MEMORY[0x24BEBD4B8], v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTextColor_(v7->_titleLabel, v44, (uint64_t)v43, v45);

    objc_msgSend_addSubview_(v7, v46, (uint64_t)v7->_titleLabel, v47);
    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v48, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v51, v52, (uint64_t)v7, (uint64_t)sel_updateContentSizeCategory, *MEMORY[0x24BEBE088], 0);

    objc_msgSend_updateContentSizeCategory(v7, v53, v54, v55);
    objc_msgSend_updatePackageVisualStyling(v7, v56, v57, v58);
    objc_msgSend_updateLabelVisualStyling(v7, v59, v60, v61);
    objc_msgSend_updateGlyphImageViewVisualStyling(v7, v62, v63, v64);
  }
  return v7;
}

- (void)layoutSubviews
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  int64_t axis;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  CGFloat v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  double v57;
  double v58;
  double v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  objc_super v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  v63.receiver = self;
  v63.super_class = (Class)AXCCRoundButton;
  -[AXCCRoundButton layoutSubviews](&v63, sel_layoutSubviews);
  objc_msgSend_bounds(self, v3, v4, v5);
  objc_msgSend_imageFrame(self, v6, v7, v8);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend_setFrame_(self->_packageView, v17, v18, v19);
  objc_msgSend_imageFrame(self, v20, v21, v22);
  objc_msgSend_setFrame_(self->_glyphImageView, v23, v24, v25);
  axis = self->_axis;
  if (axis == 1)
  {
    v66.origin.x = v10;
    v66.origin.y = v12;
    v66.size.width = v14;
    v66.size.height = v16;
    CGRectGetMaxX(v66);
    UIRectInset();
    v46 = v45;
    v48 = v47;
    v50 = v49;
    v52 = v51;
    objc_msgSend_sizeThatFits_(self->_titleLabel, v53, v54, v55, v49, v51);
    v67.origin.x = v46;
    v67.origin.y = v48;
    v67.size.width = v50;
    v67.size.height = v52;
    CGRectGetMinX(v67);
    UIRectCenteredYInRect();
  }
  else
  {
    if (axis)
      return;
    v64.origin.x = v10;
    v64.origin.y = v12;
    v64.size.width = v14;
    v64.size.height = v16;
    CGRectGetMaxY(v64);
    UIRectInset();
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;
    objc_msgSend_sizeThatFits_(self->_titleLabel, v35, v36, v37, v31, v33);
    v65.origin.x = v28;
    v65.origin.y = v30;
    v65.size.width = v32;
    v65.size.height = v34;
    CGRectGetMinY(v65);
    UIRectCenteredXInRect();
  }
  v56 = v41;
  v57 = v42;
  v58 = v43;
  v59 = v44;
  objc_msgSend_setFrame_(self->_titleLabel, v38, v39, v40);
  objc_msgSend_setFrame_(self->_shadowView, v60, v61, v62, v56, v57, v58, v59);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v3;
  uint64_t v4;
  double height;
  double width;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int64_t axis;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  height = a3.height;
  width = a3.width;
  objc_msgSend_imageFrame(self, a2, v3, v4);
  v13 = v11;
  v14 = v12;
  axis = self->_axis;
  if (axis == 1)
  {
    objc_msgSend_sizeThatFits_(self->_titleLabel, v8, v9, v10, width - (v11 + 8.0), height - v12);
    v13 = v13 + AXCCSizeCeilToViewScale(self);
    if (v14 < v18)
      v14 = v18;
  }
  else if (!axis)
  {
    objc_msgSend_sizeThatFits_(self->_titleLabel, v8, v9, v10, width - v11, height - (v12 + 8.0));
    v16 = AXCCSizeCeilToViewScale(self);
    if (v16 >= v13)
      v13 = v16;
    v14 = v14 + v17;
  }
  if (v13 >= width)
    v19 = width;
  else
    v19 = v13;
  if (v14 >= height)
    v20 = height;
  else
    v20 = v14;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)AXCCRoundButton;
  v4 = a3;
  -[AXCCRoundButton traitCollectionDidChange:](&v23, sel_traitCollectionDidChange_, v4);
  objc_msgSend_traitCollection(self, v5, v6, v7, v23.receiver, v23.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_userInterfaceStyle(v8, v9, v10, v11);
  v16 = objc_msgSend_userInterfaceStyle(v4, v13, v14, v15);

  if (v12 != v16)
  {
    objc_msgSend_updatePackageVisualStyling(self, v17, v18, v19);
    objc_msgSend_updateGlyphImageViewVisualStyling(self, v20, v21, v22);
  }
}

- (void)setTitle:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  objc_msgSend_setText_(self->_titleLabel, v6, (uint64_t)v5, v7);
  objc_msgSend_setAccessibilityLabel_(self, v8, (uint64_t)v5, v9);

  objc_msgSend_setNeedsLayout(self, v10, v11, v12);
}

- (void)setPackageName:(id)a3
{
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  if ((objc_msgSend_isEqualToString_(self->_packageName, v5, (uint64_t)v20, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_packageName, a3);
    v7 = (void *)MEMORY[0x24BE19B00];
    v8 = (void *)MEMORY[0x24BDD1488];
    v9 = objc_opt_class();
    objc_msgSend_bundleForClass_(v8, v10, v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_descriptionForPackageNamed_inBundle_(v7, v13, (uint64_t)v20, (uint64_t)v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPackageDescription_(self->_packageView, v15, (uint64_t)v14, v16);

    objc_msgSend_updatePackageVisualStyling(self, v17, v18, v19);
  }

}

- (void)setGlyphState:(id)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend_isEqualToString_(self->_glyphState, v5, (uint64_t)v9, v6) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_glyphState, a3);
    objc_msgSend_setStateName_(self->_packageView, v7, (uint64_t)v9, v8);
  }

}

- (void)setImage:(id)a3
{
  uint64_t v3;
  UIImage *v5;
  UIImage *glyphImage;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend_imageWithRenderingMode_(a3, a2, 0, v3);
  v5 = (UIImage *)objc_claimAutoreleasedReturnValue();
  glyphImage = self->_glyphImage;
  self->_glyphImage = v5;

  objc_msgSend_setImage_(self->_glyphImageView, v7, (uint64_t)self->_glyphImage, v8);
  objc_msgSend_updateGlyphImageViewVisualStyling(self, v9, v10, v11);
}

- (CGRect)imageFrame
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  v5 = objc_msgSend_contentVerticalAlignment(self, a2, v2, v3);
  objc_msgSend_bounds(self, v6, v7, v8);
  if (v5)
    UIRectCenteredXInRect();
  else
    UIRectCenteredIntegralRect();
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void)setAxis:(int64_t)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  self->_axis = a3;
  if (a3)
    objc_msgSend_setTextAlignment_(self->_titleLabel, a2, 4, v3);
  else
    objc_msgSend_setTextAlignment_(self->_titleLabel, a2, 1, v3);
  objc_msgSend_setNeedsLayout(self, v5, v6, v7);
}

- (void)setStylingProvider:(id)a3
{
  char *v5;
  uint64_t v6;
  AXCCVisualStylingProvider *stylingProvider;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;

  v5 = (char *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != (AXCCVisualStylingProvider *)v5)
  {
    v19 = v5;
    objc_msgSend_removeObserver_(stylingProvider, v5, (uint64_t)self, v6);
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    objc_msgSend_addObserver_(self->_stylingProvider, v8, (uint64_t)self, v9);
    objc_msgSend_updateLabelVisualStyling(self, v10, v11, v12);
    objc_msgSend_updatePackageVisualStyling(self, v13, v14, v15);
    objc_msgSend_updateGlyphImageViewVisualStyling(self, v16, v17, v18);
    v5 = v19;
  }

}

- (void)setLabelHidden:(BOOL)a3
{
  uint64_t v3;

  self->_labelHidden = a3;
  objc_msgSend_updateLabelVisualStyling(self, a2, a3, v3);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXCCRoundButton;
  -[AXCCRoundButton setHighlighted:](&v9, sel_setHighlighted_);
  v8 = 0.2;
  if (!v3)
    v8 = 1.0;
  objc_msgSend_setAlpha_(self->_packageView, v5, v6, v7, v8);
}

- (void)setSelected:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXCCRoundButton;
  -[AXCCRoundButton setSelected:](&v7, sel_setSelected_, a3);
  objc_msgSend_updatePackageVisualStyling(self, v4, v5, v6);
}

- (void)setEnabled:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AXCCRoundButton;
  -[AXCCRoundButton setEnabled:](&v13, sel_setEnabled_, a3);
  objc_msgSend_updateLabelVisualStyling(self, v4, v5, v6);
  objc_msgSend_updatePackageVisualStyling(self, v7, v8, v9);
  objc_msgSend_updateGlyphImageViewVisualStyling(self, v10, v11, v12);
}

- (void)controlCenterApplyPrimaryContentShadow
{
  AXCCShadowView *v3;
  AXCCShadowView *shadowView;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  if (!self->_shadowView)
  {
    v3 = objc_alloc_init(AXCCShadowView);
    shadowView = self->_shadowView;
    self->_shadowView = v3;

    objc_msgSend_controlCenterApplyPrimaryContentShadow(self->_shadowView, v5, v6, v7);
    MEMORY[0x24BEDD108](self, sel_insertSubview_below_, self->_shadowView, self->_titleLabel);
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  uint64_t v4;
  CGFloat y;
  CGFloat x;
  CGPoint v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  objc_msgSend_imageFrame(self, a2, (uint64_t)a4, v4);
  v8.x = x;
  v8.y = y;
  return CGRectContainsPoint(v9, v8);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend_titleLabel(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accessibilityLabel(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CGRect)accessibilityFrame
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
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
  CGRect result;

  objc_msgSend_packageView(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_accessibilityFrame(v4, v5, v6, v7);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXCCRoundButton;
  return (*MEMORY[0x24BEBDF00] | -[AXCCRoundButton accessibilityTraits](&v3, sel_accessibilityTraits)) & ~*MEMORY[0x24BEBDF20];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  AXCCRoundButton *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;

  v4 = a3;
  objc_msgSend_view(v4, v5, v6, v7);
  v8 = (AXCCRoundButton *)objc_claimAutoreleasedReturnValue();
  if (v8 == self
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || objc_msgSend_numberOfTouchesRequired(v4, v9, v10, v11) != 1)
  {

    goto LABEL_7;
  }
  v15 = objc_msgSend_numberOfTapsRequired(v4, v12, v13, v14);

  if (v15 != 1)
  {
LABEL_7:
    v16 = 1;
    goto LABEL_8;
  }
  v16 = 0;
LABEL_8:

  return v16;
}

- (void)visualStylingProviderDidChange:(id)a3
{
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend_updateLabelVisualStyling(self, a2, (uint64_t)a3, v3);
  objc_msgSend_updatePackageVisualStyling(self, v5, v6, v7);
  objc_msgSend_updateGlyphImageViewVisualStyling(self, v8, v9, v10);
}

- (void)updateLabelVisualStyling
{
  uint64_t v2;
  uint64_t v3;
  UILabel *titleLabel;
  double v6;
  char isEnabled;
  AXCCVisualStylingProvider *stylingProvider;
  char v9;

  if (!self->_labelHidden)
  {
    if (self->_stylingProvider)
    {
      isEnabled = objc_msgSend_isEnabled(self, a2, v2, v3);
      stylingProvider = self->_stylingProvider;
      if ((isEnabled & 1) == 0)
      {
        objc_msgSend_applyStyle_toView_(stylingProvider, a2, 0, (uint64_t)self->_titleLabel);
        titleLabel = self->_titleLabel;
        goto LABEL_10;
      }
      if (stylingProvider)
      {
        objc_msgSend_applyStyle_toView_(stylingProvider, a2, 0, (uint64_t)self->_titleLabel);
        return;
      }
    }
    v9 = objc_msgSend_isEnabled(self, a2, v2, v3);
    titleLabel = self->_titleLabel;
    if ((v9 & 1) != 0)
    {
      v6 = 1.0;
      goto LABEL_11;
    }
LABEL_10:
    v6 = 0.5;
    goto LABEL_11;
  }
  titleLabel = self->_titleLabel;
  v6 = 0.0;
LABEL_11:
  objc_msgSend_setAlpha_(titleLabel, a2, v2, v3, v6);
}

- (void)updatePackageVisualStyling
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  AXCCVisualStylingProvider *stylingProvider;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend_isEnabled(self, a2, v2, v3))
    objc_msgSend_setAlpha_(self->_packageView, v5, v6, v7, 1.0);
  else
    objc_msgSend_setAlpha_(self->_packageView, v5, v6, v7, 0.5);
  stylingProvider = self->_stylingProvider;
  if (stylingProvider)
  {
    objc_msgSend_primaryColor(stylingProvider, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((objc_msgSend_isSelected(self, v8, v9, v10) & 1) != 0)
      objc_msgSend_systemWhiteColor(MEMORY[0x24BEBD4B8], v13, v14, v15);
    else
      objc_msgSend_systemGrayColor(MEMORY[0x24BEBD4B8], v13, v14, v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = objc_retainAutorelease(v12);
  v20 = objc_msgSend_CGColor(v16, v17, v18, v19);

  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend_package(self->_packageView, v21, v22, v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_publishedObjectNames(v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v52, (uint64_t)v56, 16);
  if (v30)
  {
    v33 = v30;
    v34 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v53 != v34)
          objc_enumerationMutation(v28);
        v36 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        if (objc_msgSend_hasSuffix_(v36, v31, (uint64_t)CFSTR("-tint-shape"), v32))
        {
          objc_msgSend_package(self->_packageView, v37, v38, v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_publishedObjectWithName_(v40, v41, (uint64_t)v36, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend_setFillColor_(v43, v44, v20, v45);
        }
        else
        {
          if (!objc_msgSend_hasSuffix_(v36, v37, (uint64_t)CFSTR("-tint-bg"), v39))
            continue;
          objc_msgSend_package(self->_packageView, v31, v46, v32);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_publishedObjectWithName_(v47, v48, (uint64_t)v36, v49);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend_setBackgroundColor_(v43, v50, v20, v51);
        }

      }
      v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v52, (uint64_t)v56, 16);
    }
    while (v33);
  }

}

- (void)updateGlyphImageViewVisualStyling
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;

  if (objc_msgSend_isEnabled(self, a2, v2, v3))
    objc_msgSend_setAlpha_(self->_glyphImageView, v5, v6, v7, 1.0);
  else
    objc_msgSend_setAlpha_(self->_glyphImageView, v5, v6, v7, 0.5);
  if ((objc_msgSend_isSelected(self, v8, v9, v10) & 1) != 0)
    objc_msgSend_systemDarkGrayColor(MEMORY[0x24BEBD4B8], v11, v12, v13);
  else
    objc_msgSend_systemWhiteColor(MEMORY[0x24BEBD4B8], v11, v12, v13);
  v18 = (char *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTintColor_(self->_glyphImageView, v18, (uint64_t)v18, v14);
  objc_msgSend_controlCenterApplyPrimaryContentShadow(self->_glyphImageView, v15, v16, v17);

}

- (void)updateContentSizeCategory
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  id v13;

  objc_msgSend__preferredFontForTextStyle_maximumContentSizeCategory_(MEMORY[0x24BEBB520], a2, *MEMORY[0x24BEBE200], *MEMORY[0x24BEBE098]);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend_pointSize(v13, v4, v5, v6);
  objc_msgSend_boldSystemFontOfSize_(v3, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFont_(self->_titleLabel, v11, (uint64_t)v10, v12);

}

- (NSString)title
{
  return self->_title;
}

- (NSString)packageName
{
  return self->_packageName;
}

- (NSString)glyphState
{
  return self->_glyphState;
}

- (AXCCVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)axis
{
  return self->_axis;
}

- (UIImage)image
{
  return self->_image;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (BOOL)isLabelHidden
{
  return self->_labelHidden;
}

- (CCUICAPackageView)packageView
{
  return self->_packageView;
}

- (void)setPackageView:(id)a3
{
  objc_storeStrong((id *)&self->_packageView, a3);
}

- (UIImageView)glyphImageView
{
  return self->_glyphImageView;
}

- (void)setGlyphImageView:(id)a3
{
  objc_storeStrong((id *)&self->_glyphImageView, a3);
}

- (UIImage)glyphImage
{
  return self->_glyphImage;
}

- (void)setGlyphImage:(id)a3
{
  objc_storeStrong((id *)&self->_glyphImage, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (AXCCShadowView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_glyphImage, 0);
  objc_storeStrong((id *)&self->_glyphImageView, 0);
  objc_storeStrong((id *)&self->_packageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_glyphState, 0);
  objc_storeStrong((id *)&self->_packageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
