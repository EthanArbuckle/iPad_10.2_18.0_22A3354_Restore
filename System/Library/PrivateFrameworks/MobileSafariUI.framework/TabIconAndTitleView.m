@implementation TabIconAndTitleView

+ (double)defaultTabIconSize
{
  objc_opt_self();
  return 16.0;
}

- (double)_titleInsets
{
  double *v2;
  void *v3;
  double v4;

  if (!a1)
    return 0.0;
  v2 = (double *)MEMORY[0x1E0DC3298];
  objc_msgSend(*(id *)(a1 + 416), "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[TabIconAndTitleView _tabIconSize](a1);
  v4 = *v2;
  if (*(_BYTE *)(a1 + 448))
    objc_msgSend(*(id *)(a1 + 440), "intrinsicContentSize");
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double MaxX;
  double v28;
  double v29;
  double v30;
  double v31;
  objc_super v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v32.receiver = self;
  v32.super_class = (Class)TabIconAndTitleView;
  -[TabIconAndTitleView layoutSubviews](&v32, sel_layoutSubviews);
  v3 = -[TabIconAndTitleView _titleInsets]((uint64_t)self);
  v5 = v4;
  v7 = v6;
  -[TabIconAndTitleView bounds](self, "bounds", v3);
  x = v33.origin.x;
  y = v33.origin.y;
  width = v33.size.width;
  height = v33.size.height;
  v12 = CGRectGetWidth(v33);
  v34.origin.x = x;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = height;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v12 - v5 - v7, CGRectGetHeight(v34));
  -[TabIconAndTitleView _tabIconSize]((uint64_t)self);
  -[TabIconAndTitleView icon]((id *)&self->super.super.super.isa);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_alignment == 2)
    -[TabIconAndTitleView directionalLayoutMargins](self, "directionalLayoutMargins");
  v14 = -[TabIconAndTitleView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  _SFRoundRectToPixels();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:");
  if (v13)
  {
    if (self->_usesAccessibilityContentSizeCategory)
    {
      -[UILabel _firstLineBaseline](self->_titleLabel, "_firstLineBaseline");
      if ((v14 & 1) != 0)
      {
LABEL_7:
        _SFRoundRectToPixels();
        -[UIImageView setFrame:](self->_iconImageView, "setFrame:");
        goto LABEL_8;
      }
    }
    else if ((v14 & 1) != 0)
    {
      goto LABEL_7;
    }
    -[UILabel frame](self->_titleLabel, "frame");
    CGRectGetMaxX(v35);
    goto LABEL_7;
  }
LABEL_8:
  if (self->_showsUnreadIndicator)
  {
    v23 = v16;
    v24 = v18;
    v25 = v20;
    v26 = v22;
    if (v14)
    {
      MaxX = CGRectGetMaxX(*(CGRect *)&v23);
      v28 = 8.0;
      if (!self->_usesAccessibilityContentSizeCategory)
        v28 = 4.0;
      v29 = MaxX + v28;
    }
    else
    {
      v29 = CGRectGetMinX(*(CGRect *)&v23) - v7;
    }
    -[SFUnreadIndicator intrinsicContentSize](self->_unreadIndicator, "intrinsicContentSize");
    v31 = v30;
    -[TabIconAndTitleView bounds](self, "bounds");
    -[SFUnreadIndicator ss_setUntransformedFrame:](self->_unreadIndicator, "ss_setUntransformedFrame:", v29, 0.0, v31, CGRectGetHeight(v36));
  }
}

- (id)icon
{
  if (a1)
  {
    objc_msgSend(a1[52], "image");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (double)_tabIconSize
{
  void *v1;
  double v2;
  double v3;

  if (!a1)
    return 0.0;
  if (*(_BYTE *)(a1 + 432))
  {
    objc_msgSend(*(id *)(a1 + 424), "font");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "capHeight");
    v3 = v2;

  }
  else
  {
    objc_opt_self();
    return 16.0;
  }
  return v3;
}

- (uint64_t)setShowsUnreadIndicator:(uint64_t)result
{
  char v2;
  _QWORD *v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  char v9;
  _QWORD v10[5];
  _QWORD v11[5];

  if (result)
  {
    v2 = a2;
    v3 = (_QWORD *)result;
    if (*(unsigned __int8 *)(result + 448) != a2)
    {
      *(_BYTE *)(result + 448) = a2;
      v4 = MEMORY[0x1E0C809B0];
      if (a2)
      {
        if (!*(_QWORD *)(result + 440))
        {
          v5 = objc_alloc_init(MEMORY[0x1E0D4EED0]);
          v6 = (void *)v3[55];
          v3[55] = v5;

          objc_msgSend(v3, "addSubview:", v3[55]);
          v11[0] = v4;
          v11[1] = 3221225472;
          v11[2] = __47__TabIconAndTitleView_setShowsUnreadIndicator___block_invoke;
          v11[3] = &unk_1E9CF1900;
          v11[4] = v3;
          objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v11);
        }
      }
      objc_msgSend(v3, "setNeedsLayout");
      v10[0] = v4;
      v10[1] = 3221225472;
      v10[2] = __47__TabIconAndTitleView_setShowsUnreadIndicator___block_invoke_2;
      v10[3] = &unk_1E9CF1900;
      v10[4] = v3;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v10);
      v7[4] = v3;
      v8[0] = v4;
      v8[1] = 3221225472;
      v8[2] = __47__TabIconAndTitleView_setShowsUnreadIndicator___block_invoke_3;
      v8[3] = &unk_1E9CF1EE8;
      v8[4] = v3;
      v9 = v2;
      v7[0] = v4;
      v7[1] = 3221225472;
      v7[2] = __47__TabIconAndTitleView_setShowsUnreadIndicator___block_invoke_4;
      v7[3] = &unk_1E9CF16A0;
      return objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v8, v7);
    }
  }
  return result;
}

- (id)title
{
  if (a1)
  {
    objc_msgSend(a1[53], "text");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)setTitle:(id *)a1
{
  void *v3;
  char v4;
  id v5;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(a1[53], "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = WBSIsEqual();

    if ((v4 & 1) == 0)
    {
      objc_msgSend(a1[53], "setText:", v5);
      objc_msgSend(a1, "setNeedsLayout");
    }
  }

}

- (void)setIcon:(id *)a1
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  if (a1)
  {
    v5 = v3;
    objc_msgSend(a1[52], "image");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    v3 = v5;
    if (v4 != v5)
    {
      objc_msgSend(a1[52], "setImage:", v5);
      objc_msgSend(a1, "setNeedsLayout");
      v3 = v5;
    }
  }

}

- (void)setAlignment:(void *)a1
{
  if (a1)
  {
    if (*((const char **)a1 + 57) != a2)
    {
      *((_QWORD *)a1 + 57) = a2;
      return (void *)objc_msgSend(a1, "setNeedsLayout");
    }
  }
  return a1;
}

- (uint64_t)setTextColor:(uint64_t)result
{
  if (result)
    return objc_msgSend(*(id *)(result + 424), "setTextColor:", a2);
  return result;
}

- (uint64_t)setNumberOfLines:(uint64_t)result
{
  void *v2;

  if (result)
  {
    v2 = (void *)result;
    objc_msgSend(*(id *)(result + 424), "setNumberOfLines:", a2);
    return objc_msgSend(v2, "setNeedsLayout");
  }
  return result;
}

- (id)initWithAlignment:(void *)a1
{
  _QWORD *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  id v15;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v17.receiver = a1;
  v17.super_class = (Class)TabIconAndTitleView;
  v3 = objc_msgSendSuper2(&v17, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v4 = v3;
  if (v3)
  {
    v3[57] = a2;
    v5 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    v6 = (void *)*((_QWORD *)v4 + 52);
    *((_QWORD *)v4 + 52) = v5;

    objc_msgSend(*((id *)v4 + 52), "setContentMode:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v4 + 52), "setTintColor:", v7);

    objc_msgSend(v4, "addSubview:", *((_QWORD *)v4 + 52));
    v8 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    v9 = (void *)*((_QWORD *)v4 + 53);
    *((_QWORD *)v4 + 53) = v8;

    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 12.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v4 + 53), "setFont:", v10);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)v4 + 53), "setBackgroundColor:", v11);

    objc_msgSend(*((id *)v4 + 53), "setOpaque:", 0);
    objc_msgSend(*((id *)v4 + 53), "setAccessibilityIdentifier:", CFSTR("TabOverviewItemTitleLabel"));
    objc_msgSend(v4, "addSubview:", *((_QWORD *)v4 + 53));
    objc_msgSend(v4, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "preferredContentSizeCategory");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v4 + 432) = UIContentSizeCategoryIsAccessibilityCategory(v13);

    v18[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v4, "registerForTraitChanges:withTarget:action:", v14, v4, sel__preferredContentSizeCategoryDidChange_previousTraitCollection_);

  }
  return v4;
}

- (id)titleFont
{
  if (a1)
  {
    objc_msgSend(a1[53], "font");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)setTitleFont:(uint64_t)result
{
  void *v2;

  if (result)
  {
    v2 = (void *)result;
    objc_msgSend(*(id *)(result + 424), "setFont:", a2);
    return objc_msgSend(v2, "setNeedsLayout");
  }
  return result;
}

uint64_t __47__TabIconAndTitleView_setShowsUnreadIndicator___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;
  CGAffineTransform v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", 0.0);
  CGAffineTransformMakeScale(&v5, 0.5, 0.5);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 440);
  v4 = v5;
  return objc_msgSend(v2, "setTransform:", &v4);
}

uint64_t __47__TabIconAndTitleView_setShowsUnreadIndicator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __47__TabIconAndTitleView_setShowsUnreadIndicator___block_invoke_3(uint64_t a1, double a2)
{
  double v3;
  void *v4;
  CGAffineTransform v6;
  CGAffineTransform v7;

  LOBYTE(a2) = *(_BYTE *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 440), "setAlpha:", (double)*(unint64_t *)&a2);
  v3 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v3 = 0.5;
  CGAffineTransformMakeScale(&v7, v3, v3);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 440);
  v6 = v7;
  return objc_msgSend(v4, "setTransform:", &v6);
}

void __47__TabIconAndTitleView_setShowsUnreadIndicator___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2 || !*(_BYTE *)(v2 + 448))
  {
    objc_msgSend(*(id *)(v2 + 440), "removeFromSuperview");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 440);
    *(_QWORD *)(v3 + 440) = 0;

  }
}

- (BOOL)showsUnreadIndicator
{
  if (result)
    return *(_BYTE *)(result + 448) != 0;
  return result;
}

- (void)_preferredContentSizeCategoryDidChange:(id)a3 previousTraitCollection:(id)a4
{
  void *v5;
  NSString *v6;
  _BOOL4 IsAccessibilityCategory;

  -[TabIconAndTitleView traitCollection](self, "traitCollection", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (self->_usesAccessibilityContentSizeCategory != IsAccessibilityCategory)
  {
    self->_usesAccessibilityContentSizeCategory = IsAccessibilityCategory;
    -[TabIconAndTitleView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unreadIndicator, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
}

@end
