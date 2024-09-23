@implementation GKContiguousContainerView

+ (id)containerViewForViews:(id)a3 overlap:(double)a4 vertical:(BOOL)a5
{
  return (id)objc_msgSend(a1, "containerViewForViews:overlap:vertical:applyOrthogonalConstraints:", a3, a5, 1, a4);
}

+ (id)containerViewForViews:(id)a3 overlap:(double)a4 vertical:(BOOL)a5 applyOrthogonalConstraints:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = objc_alloc_init((Class)a1);
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v11, "setApplyOrthogonalConstraints:", v6);
  objc_msgSend(v11, "setVertical:", v7);
  objc_msgSend(v11, "setOverlap:", a4);
  objc_msgSend(v11, "_addContiguousSubviews:", v10);

  return v11;
}

+ (id)containerForViewsFontsLeadings:(id)a3 options:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__GKContiguousContainerView_containerForViewsFontsLeadings_options___block_invoke;
  v11[3] = &unk_1E59C5930;
  v7 = v6;
  v12 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);
  objc_msgSend(MEMORY[0x1E0CB3718], "_gkBaselineConstraintsForViewsFontsLeadings:superview:options:", v5, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addConstraints:", v8);
  v9 = v7;

  return v9;
}

void __68__GKContiguousContainerView_containerForViewsFontsLeadings_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addSubview:", v3);

}

- (void)setOverlap:(double)a3
{
  BOOL v5;
  NSArray *replaceableConstraints;
  _QWORD v7[5];
  BOOL v8;

  if (self->_overlap != a3)
  {
    v5 = -[GKContiguousContainerView vertical](self, "vertical");
    replaceableConstraints = self->_replaceableConstraints;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__GKContiguousContainerView_setOverlap___block_invoke;
    v7[3] = &__block_descriptor_41_e35_v32__0__NSLayoutConstraint_8Q16_B24l;
    v8 = v5;
    *(double *)&v7[4] = a3;
    -[NSArray enumerateObjectsUsingBlock:](replaceableConstraints, "enumerateObjectsUsingBlock:", v7);
    self->_overlap = a3;
  }
}

void __40__GKContiguousContainerView_setOverlap___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  int v6;
  uint64_t v7;
  BOOL v8;
  id v9;

  v5 = a2;
  if (a3 >= 2)
  {
    v6 = *(unsigned __int8 *)(a1 + 40);
    v9 = v5;
    v7 = objc_msgSend(v5, "firstAttribute");
    if (v6)
      v8 = v7 == 3;
    else
      v8 = v7 == 1;
    v5 = v9;
    if (v8)
    {
      objc_msgSend(v9, "setConstant:", -*(double *)(a1 + 32));
      v5 = v9;
    }
  }

}

- (void)setInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  double top;
  UIEdgeInsets *p_insets;
  double v8;
  BOOL v13;
  NSArray *replaceableConstraints;
  _QWORD v15[8];
  BOOL v16;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  p_insets = &self->_insets;
  v8 = self->_insets.top;
  if (self->_insets.left != a3.left
    || v8 != top
    || self->_insets.right != a3.right
    || self->_insets.bottom != a3.bottom)
  {
    v13 = -[GKContiguousContainerView vertical](self, "vertical", v8);
    replaceableConstraints = self->_replaceableConstraints;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __39__GKContiguousContainerView_setInsets___block_invoke;
    v15[3] = &__block_descriptor_65_e35_v32__0__NSLayoutConstraint_8Q16_B24l;
    v16 = v13;
    *(double *)&v15[4] = top;
    *(CGFloat *)&v15[5] = left;
    *(CGFloat *)&v15[6] = bottom;
    *(CGFloat *)&v15[7] = right;
    -[NSArray enumerateObjectsUsingBlock:](replaceableConstraints, "enumerateObjectsUsingBlock:", v15);
    p_insets->top = top;
    p_insets->left = left;
    p_insets->bottom = bottom;
    p_insets->right = right;
  }
}

void __39__GKContiguousContainerView_setInsets___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  double v9;
  void *v10;
  int v11;
  uint64_t v12;
  BOOL v13;
  id v14;

  v5 = a2;
  v14 = v5;
  if (a3 == 1)
  {
    v8 = 48;
    if (!*(_BYTE *)(a1 + 64))
      v8 = 56;
    v9 = *(double *)(a1 + v8);
  }
  else
  {
    if (!a3)
    {
      v6 = 32;
      if (!*(_BYTE *)(a1 + 64))
        v6 = 40;
      v7 = *(double *)(a1 + v6);
      goto LABEL_10;
    }
    v11 = *(unsigned __int8 *)(a1 + 64);
    v12 = objc_msgSend(v5, "firstAttribute");
    if (v11)
    {
      if (v12 == 1)
      {
        v7 = *(double *)(a1 + 40);
        goto LABEL_10;
      }
      v13 = objc_msgSend(v14, "firstAttribute") == 2;
      v10 = v14;
      if (!v13)
        goto LABEL_11;
      v9 = *(double *)(a1 + 56);
    }
    else
    {
      if (v12 == 3)
      {
        v7 = *(double *)(a1 + 32);
        goto LABEL_10;
      }
      v13 = objc_msgSend(v14, "firstAttribute") == 4;
      v10 = v14;
      if (!v13)
        goto LABEL_11;
      v9 = *(double *)(a1 + 48);
    }
  }
  v7 = -v9;
LABEL_10:
  objc_msgSend(v14, "setConstant:", v7);
  v10 = v14;
LABEL_11:

}

- (void)_addContiguousSubviews:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__GKContiguousContainerView__addContiguousSubviews___block_invoke;
  v6[3] = &unk_1E59C8280;
  v6[4] = self;
  v4 = a3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);
  objc_msgSend(MEMORY[0x1E0CB3718], "_gkConstraintsForViews:contiguouslyLaidOutVertically:overlap:withinView:insets:applyOrthogonalConstraints:", v4, self->_vertical, self, self->_applyOrthogonalConstraints, self->_overlap, self->_insets.top, self->_insets.left, self->_insets.bottom, self->_insets.right);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKContiguousContainerView setReplaceableConstraints:](self, "setReplaceableConstraints:", v5);
  if (objc_msgSend(v5, "count"))
    -[GKContiguousContainerView addConstraints:](self, "addConstraints:", v5);

}

uint64_t __52__GKContiguousContainerView__addContiguousSubviews___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addSubview:", a2);
}

- (void)replaceSubviews:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[GKContiguousContainerView replaceableConstraints](self, "replaceableConstraints");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[GKContiguousContainerView removeConstraints:](self, "removeConstraints:", v7);
  -[GKContiguousContainerView subviews](self, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &__block_literal_global_46);
  -[GKContiguousContainerView _addContiguousSubviews:](self, "_addContiguousSubviews:", v4);

}

uint64_t __45__GKContiguousContainerView_replaceSubviews___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[GKContiguousContainerView sizeThatFits:](self, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[9];
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  uint64_t v20;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v17 = 0;
  v18 = (double *)&v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[GKContiguousContainerView subviews](self, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__GKContiguousContainerView_sizeThatFits___block_invoke;
  v12[3] = &unk_1E59C82C8;
  *(CGFloat *)&v12[7] = width;
  *(CGFloat *)&v12[8] = height;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = &v17;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);
  if (v14[3] - (self->_insets.left + self->_insets.right) >= 0.0)
    v7 = v14[3] - (self->_insets.left + self->_insets.right);
  else
    v7 = 0.0;
  v8 = self->_insets.top + self->_insets.bottom;
  if (v18[3] - v8 >= 0.0)
    v9 = v18[3] - v8;
  else
    v9 = 0.0;

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

double __42__GKContiguousContainerView_sizeThatFits___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  double result;

  objc_msgSend(a2, "sizeThatFits:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(double *)(v5 + 24);
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 416))
  {
    if (v6 >= v3)
      v3 = *(double *)(v5 + 24);
    *(double *)(v5 + 24) = v3;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
    v3 = *(double *)(*(_QWORD *)(a1 + 32) + 432);
    if (v3 > v4)
      v3 = v4;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  }
  else
  {
    *(double *)(v5 + 24) = v3 + v6;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(double *)(v8 + 24) >= v4)
      v4 = *(double *)(v8 + 24);
    *(double *)(v8 + 24) = v4;
    if (*(double *)(*(_QWORD *)(a1 + 32) + 432) <= v3)
      v3 = *(double *)(*(_QWORD *)(a1 + 32) + 432);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  result = *(double *)(v7 + 24) - v3;
  *(double *)(v7 + 24) = result;
  return result;
}

- (id)viewForBaselineLayout
{
  UIView *baselineView;
  GKContiguousContainerView *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  baselineView = self->_baselineView;
  if (baselineView)
  {
    -[UIView superview](baselineView, "superview");
    v4 = (GKContiguousContainerView *)objc_claimAutoreleasedReturnValue();

    if (v4 != self)
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Baseline view MUST be a subview of the container view."));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/NSLayoutConstraint+GKAdditions.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ ([_baselineView superview] == self)\n[%s (%s:%d)]"), v6, "-[GKContiguousContainerView viewForBaselineLayout]", objc_msgSend(v8, "UTF8String"), 487);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v9);
    }
    return self->_baselineView;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)GKContiguousContainerView;
    -[GKContiguousContainerView viewForBaselineLayout](&v11, sel_viewForBaselineLayout);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (UIView)baselineView
{
  return self->_baselineView;
}

- (void)setBaselineView:(id)a3
{
  self->_baselineView = (UIView *)a3;
}

- (double)overlap
{
  return self->_overlap;
}

- (UIEdgeInsets)insets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)vertical
{
  return self->_vertical;
}

- (void)setVertical:(BOOL)a3
{
  self->_vertical = a3;
}

- (BOOL)applyOrthogonalConstraints
{
  return self->_applyOrthogonalConstraints;
}

- (void)setApplyOrthogonalConstraints:(BOOL)a3
{
  self->_applyOrthogonalConstraints = a3;
}

- (NSArray)replaceableConstraints
{
  return self->_replaceableConstraints;
}

- (void)setReplaceableConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_replaceableConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceableConstraints, 0);
}

@end
