@implementation CPSButton

- (CPSButton)initWithTitle:(id)a3 enabledTitleColor:(id)a4 disabledTitleColor:(id)a5 backgroundColor:(id)a6 textStyle:(id)a7 cornerRadius:(double)a8 animatesAlphaWhenHighlighted:(BOOL)a9
{
  _BOOL8 v9;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  CPSButton *v21;
  CPSButton *v22;
  void *v23;
  void *v24;
  CPSButton *v25;
  objc_super v27;

  v9 = a9;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v27.receiver = self;
  v27.super_class = (Class)CPSButton;
  v21 = -[CPSButton initWithFrame:](&v27, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v22 = v21;
  if (v21)
  {
    -[CPSButton _setContinuousCornerRadius:](v21, "_setContinuousCornerRadius:", a8);
    -[CPSButton setClipsToBounds:](v22, "setClipsToBounds:", 1);
    -[CPSButton setAnimatesAlphaWhenHighlighted:](v22, "setAnimatesAlphaWhenHighlighted:", v9);
    objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:variant:", v20, 256);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPSButton titleLabel](v22, "titleLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFont:", v23);

    -[CPSButton setTitle:forState:](v22, "setTitle:forState:", v16, 0);
    if (v17)
      -[CPSButton setTitleColor:forState:](v22, "setTitleColor:forState:", v17, 0);
    if (v18)
      -[CPSButton setTitleColor:forState:](v22, "setTitleColor:forState:", v18, 2);
    if (v19)
      -[CPSButton setBackgroundColor:](v22, "setBackgroundColor:", v19);
    v25 = v22;
  }

  return v22;
}

- (CPSButton)init
{
  return -[CPSButton initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (CPSButton)initWithFrame:(CGRect)a3
{
  return -[CPSButton initWithTitle:enabledTitleColor:disabledTitleColor:backgroundColor:textStyle:cornerRadius:animatesAlphaWhenHighlighted:](self, "initWithTitle:enabledTitleColor:disabledTitleColor:backgroundColor:textStyle:cornerRadius:animatesAlphaWhenHighlighted:", &stru_1E8E8B5E8, 0, 0, 0, *MEMORY[0x1E0CEB538], 0, 0.0, a3.origin.y, a3.size.width, a3.size.height);
}

- (CPSButton)initWithCoder:(id)a3
{
  CPSButton *v3;
  CPSButton *v4;
  CPSButton *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPSButton;
  v3 = -[CPSButton initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

- (void)updateCornerRadius
{
  CGRect v3;

  -[CPSButton layoutIfNeeded](self, "layoutIfNeeded");
  -[CPSButton bounds](self, "bounds");
  -[CPSButton _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", CGRectGetHeight(v3) * 0.5);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  uint64_t v8;
  double v10;
  double v11;
  double tapTargetSideMargin;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double Height;
  double MinY;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  BOOL v40;
  objc_super v42;
  CGPoint v43;
  CGPoint v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (self->_tapTargetSideMargin != 0.0)
  {
    -[CPSButton bounds](self, "bounds");
    tapTargetSideMargin = self->_tapTargetSideMargin;
    v13 = (44.0 - v10) * -0.5;
    if (v10 >= 44.0)
      v13 = 0.0;
    v14 = v13 - tapTargetSideMargin;
    v15 = v11 >= 44.0 ? 0.0 : (44.0 - v11) * -0.5;
    v45 = CGRectInset(*(CGRect *)&v8, v14, v15 - tapTargetSideMargin);
    v43.x = x;
    v43.y = y;
    if (CGRectContainsPoint(v45, v43))
      goto LABEL_16;
  }
  if (!self->_extraTapTargetSubstring)
    goto LABEL_17;
  -[CPSButton _boundingRectForSubstring:](self, "_boundingRectForSubstring:");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[CPSButton titleLabel](self, "titleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "convertRect:toView:", self, v17, v19, v21, v23);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;

  v46.origin.x = v26;
  v46.origin.y = v28;
  v46.size.width = v30;
  v46.size.height = v32;
  Height = CGRectGetHeight(v46);
  v47.origin.x = v26;
  v47.origin.y = v28;
  v47.size.width = v30;
  v47.size.height = v32;
  MinY = CGRectGetMinY(v47);
  v35 = MinY >= 0.0 ? 36.0 - MinY : 36.0;
  v36 = Height >= v35 ? Height : v35;
  v37 = v26;
  v38 = v28;
  v39 = v30;
  v44.x = x;
  v44.y = y;
  if (CGRectContainsPoint(*(CGRect *)(&v36 - 3), v44))
  {
LABEL_16:
    v40 = 1;
  }
  else
  {
LABEL_17:
    v42.receiver = self;
    v42.super_class = (Class)CPSButton;
    v40 = -[CPSButton pointInside:withEvent:](&v42, sel_pointInside_withEvent_, v7, x, y);
  }

  return v40;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  int v5;
  objc_super v7;

  v3 = a3;
  v5 = -[CPSButton isHighlighted](self, "isHighlighted");
  v7.receiver = self;
  v7.super_class = (Class)CPSButton;
  -[CPSButton setHighlighted:](&v7, sel_setHighlighted_, v3);
  if (self->_animatesAlphaWhenHighlighted && v5 != v3)
    -[UIView cps_configureForAnimatesAlphaWhenHighlighted:](self, "cps_configureForAnimatesAlphaWhenHighlighted:", -[CPSButton isHighlighted](self, "isHighlighted"));
}

- (CGRect)_boundingRectForSubstring:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  CGRect v30;
  CGRect result;

  v4 = a3;
  -[CPSButton titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "rangeOfString:", v4);
  v9 = v8;

  v10 = objc_alloc(MEMORY[0x1E0CEA268]);
  objc_msgSend(v5, "attributedText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithAttributedString:", v11);

  v13 = objc_alloc_init(MEMORY[0x1E0CEA228]);
  objc_msgSend(v12, "addLayoutManager:", v13);
  v14 = objc_alloc(MEMORY[0x1E0CEA260]);
  objc_msgSend(v5, "bounds");
  v15 = (void *)objc_msgSend(v14, "initWithSize:", CGRectGetWidth(v30), 1.79769313e308);
  objc_msgSend(v15, "setLineFragmentPadding:", 0.0);
  objc_msgSend(v13, "addTextContainer:", v15);
  v28 = 0;
  v29 = 0;
  objc_msgSend(v13, "characterRangeForGlyphRange:actualGlyphRange:", v7, v9, &v28);
  objc_msgSend(v13, "boundingRectForGlyphRange:inTextContainer:", v28, v29, v15);
  objc_msgSend(v5, "convertRect:toView:", self);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (BOOL)animatesAlphaWhenHighlighted
{
  return self->_animatesAlphaWhenHighlighted;
}

- (void)setAnimatesAlphaWhenHighlighted:(BOOL)a3
{
  self->_animatesAlphaWhenHighlighted = a3;
}

- (double)tapTargetSideMargin
{
  return self->_tapTargetSideMargin;
}

- (void)setTapTargetSideMargin:(double)a3
{
  self->_tapTargetSideMargin = a3;
}

- (NSString)extraTapTargetSubstring
{
  return self->_extraTapTargetSubstring;
}

- (void)setExtraTapTargetSubstring:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 768);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraTapTargetSubstring, 0);
}

@end
