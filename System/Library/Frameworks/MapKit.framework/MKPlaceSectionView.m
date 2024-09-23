@implementation MKPlaceSectionView

- (MKPlaceSectionView)initWithFrame:(CGRect)a3
{
  MKPlaceSectionView *v3;
  MKPlaceSectionView *v4;
  MKViewWithHairline *v5;
  uint64_t v6;
  MKViewWithHairline *hairLineView;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MKPlaceSectionView;
  v3 = -[_MKStackView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_trackingSelectForRow = 0x7FFFFFFFFFFFFFFFLL;
    v3->_showsBottomHairline = 1;
    v5 = [MKViewWithHairline alloc];
    -[MKPlaceSectionView bounds](v4, "bounds");
    v6 = -[MKViewWithHairline initWithFrame:](v5, "initWithFrame:");
    hairLineView = v4->_hairLineView;
    v4->_hairLineView = (MKViewWithHairline *)v6;

    -[_MKStackView addSubview:](v4, "addSubview:", v4->_hairLineView);
    -[UIView mk_theme](v4, "mk_theme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "separatorLineColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKViewWithHairline setHairlineColor:](v4->_hairLineView, "setHairlineColor:", v9);

  }
  return v4;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKPlaceSectionView;
  -[MKPlaceSectionView layoutSubviews](&v3, sel_layoutSubviews);
  -[MKPlaceSectionView bounds](self, "bounds");
  -[MKViewWithHairline setFrame:](self->_hairLineView, "setFrame:");
  -[MKPlaceSectionView _updateHairlineInsets](self, "_updateHairlineInsets");
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKPlaceSectionView;
  -[MKPlaceSectionView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[MKPlaceSectionView _updateHairlineInsets](self, "_updateHairlineInsets");
}

- (void)infoCardThemeChanged
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKPlaceSectionView;
  -[UIView infoCardThemeChanged](&v5, sel_infoCardThemeChanged);
  -[UIView mk_theme](self, "mk_theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "separatorLineColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKViewWithHairline setHairlineColor:](self->_hairLineView, "setHairlineColor:", v4);

}

- (void)_updateHairlineInsets
{
  int IsRightToLeft;
  double v4;
  double v5;
  double v6;
  double v7;

  IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft();
  -[MKPlaceSectionView layoutMargins](self, "layoutMargins");
  if (IsRightToLeft)
    v6 = v5;
  else
    v6 = v4;
  if (IsRightToLeft)
    v7 = v4;
  else
    v7 = v5;
  -[MKViewWithHairline setLeftHairlineInset:](self->_hairLineView, "setLeftHairlineInset:", v6);
  -[MKViewWithHairline setRightHairlineInset:](self->_hairLineView, "setRightHairlineInset:", v7);
}

- (void)setShowsBottomHairline:(BOOL)a3
{
  if (self->_showsBottomHairline != a3)
  {
    self->_showsBottomHairline = a3;
    -[MKViewWithHairline setBottomHairlineHidden:](self->_hairLineView, "setBottomHairlineHidden:", !a3);
  }
}

- (unint64_t)indexOfRowAt:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v5;
  unint64_t v6;
  _QWORD v8[6];

  y = a3.y;
  x = a3.x;
  -[_MKStackView stackedSubviews](self, "stackedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__MKPlaceSectionView_indexOfRowAt___block_invoke;
  v8[3] = &__block_descriptor_48_e23_B32__0__UIView_8Q16_B24l;
  *(CGFloat *)&v8[4] = x;
  *(CGFloat *)&v8[5] = y;
  v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v8);

  return v6;
}

BOOL __35__MKPlaceSectionView_indexOfRowAt___block_invoke(CGPoint *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  _BOOL8 result;
  CGRect v7;

  objc_msgSend(a2, "frame");
  if (!CGRectContainsPoint(v7, a1[2]))
    return *a4 != 0;
  result = 1;
  *a4 = 1;
  return result;
}

- (id)rowAt:(CGPoint)a3
{
  unint64_t v4;
  MKPlaceSectionItemView *v5;
  unint64_t v6;
  void *v7;
  MKPlaceSectionItemView *v8;

  v4 = -[MKPlaceSectionView indexOfRowAt:](self, "indexOfRowAt:", a3.x, a3.y);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    v6 = v4;
    -[_MKStackView stackedSubviews](self, "stackedSubviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", v6);
    v8 = (MKPlaceSectionItemView *)objc_claimAutoreleasedReturnValue();

    if (v8 == self->_headerView)
      v5 = 0;
    else
      v5 = v8;

  }
  return v5;
}

- (void)_tappedRow:(id)a3 at:(unint64_t)a4
{
  void *v6;
  MKPlaceSectionItemView *WeakRetained;
  id v8;
  MKPlaceSectionItemView *v9;

  v9 = (MKPlaceSectionItemView *)a3;
  -[MKPlaceSectionView delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (self->_headerView == v9)
    {
      WeakRetained = (MKPlaceSectionItemView *)objc_loadWeakRetained((id *)&self->_delegate);
      -[MKPlaceSectionItemView sectionView:didSelectHeader:](WeakRetained, "sectionView:didSelectHeader:", self, v9);
    }
    else if (self->_footerView == v9)
    {
      WeakRetained = (MKPlaceSectionItemView *)objc_loadWeakRetained((id *)&self->_delegate);
      -[MKPlaceSectionItemView sectionView:didSelectFooter:](WeakRetained, "sectionView:didSelectFooter:", self, v9);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_12;
      WeakRetained = v9;
      if (-[MKPlaceSectionItemView isSelected](WeakRetained, "isSelected"))
      {
        -[MKPlaceSectionItemView setSelected:animated:](WeakRetained, "setSelected:animated:", 0, 1);
        v8 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v8, "sectionView:didDeselectRow:atIndex:", self, WeakRetained, a4 - (self->_headerView != 0));
      }
      else
      {
        v8 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v8, "sectionView:didSelectRow:atIndex:", self, WeakRetained, a4 - (self->_headerView != 0));
      }

    }
  }
LABEL_12:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[MKPlaceSectionItemView setHighlighted:](v9, "setHighlighted:", 0);

}

- (void)_touchesBeganForRow:(id)a3 at:(unint64_t)a4
{
  id v5;

  v5 = a3;
  if (-[MKPlaceSectionView highlightsTouches](self, "highlightsTouches"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v5, "setHighlighted:", 1);
  }

}

- (void)_touchesCancelledForRow:(id)a3 at:(unint64_t)a4
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setHighlighted:", 0);

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  -[MKPlaceSectionView window](self, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "touchesForWindow:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "anyObject");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "tapCount") == 1)
  {
    objc_msgSend(v13, "locationInView:", self);
    v8 = -[MKPlaceSectionView indexOfRowAt:](self, "indexOfRowAt:");
    self->_trackingSelectForRow = v8;
    -[_MKStackView stackedSubviews](self, "stackedSubviews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v8 < v10)
    {
      -[_MKStackView stackedSubviews](self, "stackedSubviews");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", self->_trackingSelectForRow);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MKPlaceSectionView _touchesBeganForRow:at:](self, "_touchesBeganForRow:at:", v12, self->_trackingSelectForRow);

    }
  }

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  unint64_t trackingSelectForRow;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  trackingSelectForRow = self->_trackingSelectForRow;
  -[_MKStackView stackedSubviews](self, "stackedSubviews", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (trackingSelectForRow < v7)
  {
    -[_MKStackView stackedSubviews](self, "stackedSubviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", self->_trackingSelectForRow);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceSectionView _touchesCancelledForRow:at:](self, "_touchesCancelledForRow:at:", v9, self->_trackingSelectForRow);

  }
  self->_trackingSelectForRow = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;

  if (self->_trackingSelectForRow != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = a4;
    -[MKPlaceSectionView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "touchesForWindow:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "anyObject");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "locationInView:", self);
    v8 = -[MKPlaceSectionView indexOfRowAt:](self, "indexOfRowAt:");
    if (v8 == self->_trackingSelectForRow)
    {
      v9 = v8;
      -[_MKStackView stackedSubviews](self, "stackedSubviews");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");

      if (v9 < v11)
      {
        -[_MKStackView stackedSubviews](self, "stackedSubviews");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", self->_trackingSelectForRow);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[MKPlaceSectionView _tappedRow:at:](self, "_tappedRow:at:", v13, self->_trackingSelectForRow);

        self->_trackingSelectForRow = 0x7FFFFFFFFFFFFFFFLL;
      }
    }

  }
}

- (void)setHeaderView:(id)a3
{
  -[MKPlaceSectionView setHeaderView:animated:](self, "setHeaderView:animated:", a3, 0);
}

- (void)setHeaderView:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  MKPlaceSectionItemView *v7;
  MKPlaceSectionItemView *v8;

  v4 = a4;
  v7 = (MKPlaceSectionItemView *)a3;
  if (self->_headerView != v7)
  {
    v8 = v7;
    objc_storeStrong((id *)&self->_headerView, a3);
    -[MKPlaceSectionView _updateViewsAnimated:isNeedLayout:](self, "_updateViewsAnimated:isNeedLayout:", v4, 1);
    v7 = v8;
  }

}

- (void)setRowViews:(id)a3
{
  -[MKPlaceSectionView setRowViews:animated:](self, "setRowViews:animated:", a3, 0);
}

- (void)setRowViews:(id)a3 animated:(BOOL)a4
{
  -[MKPlaceSectionView setRowViews:animated:isNeedLayout:](self, "setRowViews:animated:isNeedLayout:", a3, a4, 1);
}

- (void)setRowViews:(id)a3 animated:(BOOL)a4 isNeedLayout:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  NSArray *v8;
  NSArray *rowViews;
  id v10;

  v5 = a5;
  v6 = a4;
  v10 = a3;
  if (!-[NSArray isEqualToArray:](self->_rowViews, "isEqualToArray:"))
  {
    v8 = (NSArray *)objc_msgSend(v10, "copy");
    rowViews = self->_rowViews;
    self->_rowViews = v8;

    -[MKPlaceSectionView _updateViewsAnimated:isNeedLayout:](self, "_updateViewsAnimated:isNeedLayout:", v6, v5);
  }

}

- (void)setFooterView:(id)a3
{
  -[MKPlaceSectionView setFooterView:animated:](self, "setFooterView:animated:", a3, 0);
}

- (void)setFooterView:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  MKPlaceSectionItemView *v7;
  MKPlaceSectionItemView *v8;

  v4 = a4;
  v7 = (MKPlaceSectionItemView *)a3;
  if (self->_footerView != v7)
  {
    v8 = v7;
    objc_storeStrong((id *)&self->_footerView, a3);
    -[MKPlaceSectionView _updateViewsAnimated:](self, "_updateViewsAnimated:", v4);
    v7 = v8;
  }

}

- (void)_updateViewsAnimated:(BOOL)a3
{
  -[MKPlaceSectionView _updateViewsAnimated:isNeedLayout:](self, "_updateViewsAnimated:isNeedLayout:", a3, 1);
}

- (void)_updateViewsAnimated:(BOOL)a3 isNeedLayout:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;

  v4 = a4;
  v5 = a3;
  if (self->_headerView)
  {
    objc_msgSend(MEMORY[0x1E0C9AA60], "arrayByAddingObject:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  if (self->_rowViews)
  {
    v10 = v7;
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  if (self->_footerView)
  {
    v11 = v7;
    objc_msgSend(v7, "arrayByAddingObject:");
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  v12 = v7;
  -[_MKStackView setStackedSubviews:animated:isNeedLayout:](self, "setStackedSubviews:animated:isNeedLayout:", v7, v5, v4);

}

- (MKPlaceSectionViewDelegate)delegate
{
  return (MKPlaceSectionViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MKPlaceSectionItemView)headerView
{
  return self->_headerView;
}

- (NSArray)rowViews
{
  return self->_rowViews;
}

- (BOOL)highlightsTouches
{
  return self->_highlightsTouches;
}

- (void)setHighlightsTouches:(BOOL)a3
{
  self->_highlightsTouches = a3;
}

- (MKPlaceSectionItemView)footerView
{
  return self->_footerView;
}

- (BOOL)showsBottomHairline
{
  return self->_showsBottomHairline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_rowViews, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_hairLineView, 0);
}

@end
