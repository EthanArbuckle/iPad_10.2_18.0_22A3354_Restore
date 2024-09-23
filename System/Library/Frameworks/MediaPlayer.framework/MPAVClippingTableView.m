@implementation MPAVClippingTableView

- (MPAVClippingTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  MPAVClippingTableView *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *sectionBackgroundViews;
  uint64_t v7;
  UIView *headerBackgroundView;
  uint64_t v9;
  UIView *footerBackgroundView;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MPAVClippingTableView;
  v4 = -[MPAVClippingTableView initWithFrame:style:](&v12, sel_initWithFrame_style_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sectionBackgroundViews = v4->_sectionBackgroundViews;
    v4->_sectionBackgroundViews = v5;

    -[MPAVClippingTableView _createBackgroundView](v4, "_createBackgroundView");
    v7 = objc_claimAutoreleasedReturnValue();
    headerBackgroundView = v4->_headerBackgroundView;
    v4->_headerBackgroundView = (UIView *)v7;

    -[MPAVClippingTableView _createBackgroundView](v4, "_createBackgroundView");
    v9 = objc_claimAutoreleasedReturnValue();
    footerBackgroundView = v4->_footerBackgroundView;
    v4->_footerBackgroundView = (UIView *)v9;

    -[MPAVClippingTableView setSeparatorStyle:](v4, "setSeparatorStyle:", 0);
  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double Width;
  double v8;
  UIView *headerBackgroundView;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSMutableDictionary *sectionBackgroundViews;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  MPAVClippingTableView *v23;
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v24.receiver = self;
  v24.super_class = (Class)MPAVClippingTableView;
  -[MPAVClippingTableView layoutSubviews](&v24, sel_layoutSubviews);
  -[MPAVClippingTableView contentOffset](self, "contentOffset");
  v4 = v3;
  -[MPAVClippingTableView contentSize](self, "contentSize");
  v6 = v5;
  -[MPAVClippingTableView bounds](self, "bounds");
  Width = CGRectGetWidth(v25);
  if (v4 >= 0.0)
  {
    headerBackgroundView = self->_headerBackgroundView;
    v10 = 0.0;
    v8 = 0.0;
  }
  else
  {
    v8 = fabs(v4) + 200.0;
    headerBackgroundView = self->_headerBackgroundView;
    v10 = v4 + -200.0;
  }
  -[UIView setFrame:](headerBackgroundView, "setFrame:", 0.0, v10, Width, v8);
  -[MPAVClippingTableView bounds](self, "bounds");
  v11 = CGRectGetWidth(v26);
  -[MPAVClippingTableView frame](self, "frame");
  -[UIView setFrame:](self->_footerBackgroundView, "setFrame:", 0.0, v6, v11, v4 + CGRectGetHeight(v27) - v6 + 200.0);
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPAVClippingTableView indexPathsForVisibleRows](self, "indexPathsForVisibleRows");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __39__MPAVClippingTableView_layoutSubviews__block_invoke;
  v21[3] = &unk_1E3159608;
  v15 = v12;
  v22 = v15;
  v23 = self;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v21);

  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __39__MPAVClippingTableView_layoutSubviews__block_invoke_2;
  v20[3] = &unk_1E315DBB0;
  v20[4] = self;
  objc_msgSend(v15, "enumerateIndexesUsingBlock:", v20);
  sectionBackgroundViews = self->_sectionBackgroundViews;
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __39__MPAVClippingTableView_layoutSubviews__block_invoke_3;
  v18[3] = &unk_1E3159630;
  v19 = v15;
  v17 = v15;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sectionBackgroundViews, "enumerateKeysAndObjectsUsingBlock:", v18);

}

- (id)backgroundViewForSection:(unint64_t)a3
{
  NSMutableDictionary *sectionBackgroundViews;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;

  sectionBackgroundViews = self->_sectionBackgroundViews;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](sectionBackgroundViews, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[MPAVClippingTableView _createBackgroundView](self, "_createBackgroundView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_sectionBackgroundViews;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v7, v9);

  }
  return v7;
}

- (id)_createBackgroundView
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setAlpha:", 0.1);
  objc_msgSend(v3, "_setDrawsAsBackdropOverlayWithBlendMode:", 1);
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);
  -[MPAVClippingTableView insertSubview:atIndex:](self, "insertSubview:atIndex:", v3, 0);
  return v3;
}

- (UIView)headerBackgroundView
{
  return self->_headerBackgroundView;
}

- (void)setHeaderBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_headerBackgroundView, a3);
}

- (UIView)footerBackgroundView
{
  return self->_footerBackgroundView;
}

- (void)setFooterBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_footerBackgroundView, a3);
}

- (NSMutableDictionary)sectionBackgroundViews
{
  return self->_sectionBackgroundViews;
}

- (void)setSectionBackgroundViews:(id)a3
{
  objc_storeStrong((id *)&self->_sectionBackgroundViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionBackgroundViews, 0);
  objc_storeStrong((id *)&self->_footerBackgroundView, 0);
  objc_storeStrong((id *)&self->_headerBackgroundView, 0);
}

void __39__MPAVClippingTableView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinY;
  double MaxY;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat rect;
  void *rect_8;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "addIndex:", objc_msgSend(v4, "section"));
  objc_msgSend(*(id *)(a1 + 40), "headerViewForSection:", objc_msgSend(v4, "section"));
  rect_8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "cellForRowAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(rect_8, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    objc_msgSend(v5, "frame");
    y = v25.origin.y;
    width = v25.size.width;
    height = v25.size.height;
    rect = v25.origin.x;
    MinY = CGRectGetMinY(v25);
    v26.origin.x = v7;
    v26.origin.y = v9;
    v26.size.width = v11;
    v26.size.height = v13;
    if (MinY >= CGRectGetMaxY(v26))
    {
      v19 = *MEMORY[0x1E0DC49E8];
      v20 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
      v21 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
      v22 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    }
    else
    {
      v27.origin.x = v7;
      v27.origin.y = v9;
      v27.size.width = v11;
      v27.size.height = v13;
      MaxY = CGRectGetMaxY(v27);
      v28.origin.x = rect;
      v28.origin.y = y;
      v28.size.width = width;
      v28.size.height = height;
      v19 = MaxY - CGRectGetMinY(v28);
      v20 = 0.0;
      v21 = 0.0;
      v22 = 0.0;
    }
    objc_msgSend(v5, "setClippingInsets:", v19, v20, v21, v22, *(_QWORD *)&rect);
  }

}

void __39__MPAVClippingTableView_layoutSubviews__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  double MaxY;
  double x;
  double width;
  CGFloat v8;
  id v9;
  CGRect v10;
  CGRect v11;

  objc_msgSend(*(id *)(a1 + 32), "headerViewForSection:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  MaxY = CGRectGetMaxY(v10);

  objc_msgSend(*(id *)(a1 + 32), "rectForSection:", a2);
  x = v11.origin.x;
  width = v11.size.width;
  v8 = v11.size.height - (MaxY - CGRectGetMinY(v11));
  objc_msgSend(*(id *)(a1 + 32), "backgroundViewForSection:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", x, MaxY, width, v8);

}

void __39__MPAVClippingTableView_layoutSubviews__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v5, "setHidden:", objc_msgSend(v4, "containsIndex:", objc_msgSend(a2, "integerValue")) ^ 1);

}

@end
