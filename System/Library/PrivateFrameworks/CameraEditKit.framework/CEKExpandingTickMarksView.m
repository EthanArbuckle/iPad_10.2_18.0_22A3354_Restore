@implementation CEKExpandingTickMarksView

- (CEKExpandingTickMarksView)initWithFrame:(CGRect)a3
{
  CEKExpandingTickMarksView *v3;
  NSMutableArray *v4;
  NSMutableArray *tickViews;
  uint64_t v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CEKExpandingTickMarksView;
  v3 = -[CEKExpandingTickMarksView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    tickViews = v3->__tickViews;
    v3->__tickViews = v4;

    v6 = 41;
    do
    {
      v7 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      -[NSMutableArray addObject:](v3->__tickViews, "addObject:", v7);
      -[CEKExpandingTickMarksView addSubview:](v3, "addSubview:", v7);

      --v6;
    }
    while (v6);
  }
  return v3;
}

- (void)setSelectedValue:(double)a3
{
  -[CEKExpandingTickMarksView setSelectedValue:animated:](self, "setSelectedValue:animated:", 0, a3);
}

- (void)setSelectedValue:(double)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  NSUInteger v7;
  double v8;
  _NSRange *p_selectedRange;
  unint64_t v10;
  NSUInteger v11;
  _QWORD v12[5];

  v4 = a4;
  v7 = -[CEKExpandingTickMarksView _middleTickIndex](self, "_middleTickIndex");
  v8 = (a3 + 1.0) * 0.5;
  if (v8 <= 0.5)
  {
    if (v8 >= 0.5)
    {
      v11 = 0;
      p_selectedRange = &self->__selectedRange;
      self->__selectedRange.location = v7;
      goto LABEL_7;
    }
    v10 = vcvtpd_s64_f64(v8 * (double)40);
    p_selectedRange = &self->__selectedRange;
    v11 = v7 - v10;
  }
  else
  {
    p_selectedRange = &self->__selectedRange;
    v10 = v7 + 1;
    v11 = vcvtmd_s64_f64(v8 * (double)40) - v7;
  }
  p_selectedRange->location = v10;
LABEL_7:
  p_selectedRange->length = v11;
  -[CEKExpandingTickMarksView setNeedsLayout](self, "setNeedsLayout");
  if (v4)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __55__CEKExpandingTickMarksView_setSelectedValue_animated___block_invoke;
    v12[3] = &unk_1E70A4B18;
    v12[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 2, v12, 0, 0.5, 0.0, 1.0, 1.0);
  }
}

uint64_t __55__CEKExpandingTickMarksView_setSelectedValue_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setExpanded:(BOOL)a3
{
  -[CEKExpandingTickMarksView setExpanded:animated:](self, "setExpanded:animated:", a3, 0);
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _QWORD v6[5];

  if (self->_expanded != a3)
  {
    v4 = a4;
    self->_expanded = a3;
    -[CEKExpandingTickMarksView setNeedsLayout](self, "setNeedsLayout");
    if (v4)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __50__CEKExpandingTickMarksView_setExpanded_animated___block_invoke;
      v6[3] = &unk_1E70A4B18;
      v6[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v6, 0, 0.35, 0.0);
    }
  }
}

uint64_t __50__CEKExpandingTickMarksView_setExpanded_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = (double)(uint64_t)(vcvtpd_s64_f64((double)41 / (double)5) - 1) * 7.0 + 1.0;
  v3 = fmax(10.0, 5.0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (unint64_t)_middleTickIndex
{
  return vcvtmd_u64_f64((double)41 * 0.5);
}

- (unint64_t)_collapsedTickIndexForIndex:(unint64_t)a3
{
  unint64_t v4;
  double v5;
  double v6;
  double v7;

  v4 = -[CEKExpandingTickMarksView _middleTickIndex](self, "_middleTickIndex");
  v5 = (double)a3 / (double)5;
  v6 = floor(v5);
  v7 = ceil(v5);
  if (v4 <= a3)
    return (uint64_t)v6;
  return (uint64_t)v7;
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[9];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CEKExpandingTickMarksView;
  -[CEKExpandingTickMarksView layoutSubviews](&v13, sel_layoutSubviews);
  -[CEKExpandingTickMarksView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CEKExpandingTickMarksView _tickViews](self, "_tickViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__CEKExpandingTickMarksView_layoutSubviews__block_invoke;
  v12[3] = &unk_1E70A4B60;
  v12[4] = self;
  v12[5] = v4;
  v12[6] = v6;
  v12[7] = v8;
  v12[8] = v10;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);

}

void __43__CEKExpandingTickMarksView_layoutSubviews__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  unint64_t v5;
  _BOOL4 v6;
  unint64_t v7;
  unint64_t v8;
  int v10;
  unint64_t v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  int v19;
  id v20;

  v20 = a2;
  v5 = a3 % 5;
  if (a3 % 5)
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "_selectedRange");
    v6 = a3 >= v7 && a3 - v7 < v8;
  }
  v10 = objc_msgSend(*(id *)(a1 + 32), "expanded");
  v11 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "expanded") & 1) == 0)
    v11 = objc_msgSend(*(id *)(a1 + 32), "_collapsedTickIndexForIndex:", a3);
  v12 = *(double *)(a1 + 64);
  if (v6 && !objc_msgSend(*(id *)(a1 + 32), "expanded"))
  {
    objc_msgSend(*(id *)(a1 + 32), "tintColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  v15 = 10.0;
  v16 = 0.3;
  v17 = 1.0;
  if (!v5)
    v16 = 1.0;
  objc_msgSend(v13, "colorWithAlphaComponent:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setBackgroundColor:", v18);

  if (v5)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "expanded"))
      v17 = 1.0;
    else
      v17 = 0.0;
  }
  if (a3)
    v19 = v10;
  else
    v19 = 1;
  if (a3 == 40)
    v19 = 1;
  if (!(v19 | v6))
    v15 = 5.0;
  objc_msgSend(v20, "setAlpha:", v17);
  objc_msgSend(v20, "setFrame:", 7.0 * (double)v11, v12 - v15, 1.0, v15);

}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CEKExpandingTickMarksView;
  -[CEKExpandingTickMarksView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[CEKExpandingTickMarksView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (_NSRange)_selectedRange
{
  _NSRange *p_selectedRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_selectedRange = &self->__selectedRange;
  location = self->__selectedRange.location;
  length = p_selectedRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)set_selectedRange:(_NSRange)a3
{
  self->__selectedRange = a3;
}

- (NSMutableArray)_tickViews
{
  return self->__tickViews;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__tickViews, 0);
}

@end
