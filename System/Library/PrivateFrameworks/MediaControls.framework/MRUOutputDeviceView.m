@implementation MRUOutputDeviceView

- (MRUOutputDeviceView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MRUOutputDeviceView *v7;
  uint64_t v8;
  MTMaterialView *materialView;
  id v10;
  void *v11;
  uint64_t v12;
  UITableView *tableView;
  void *v14;
  id v15;
  void *v16;
  UISegmentedControl *v17;
  UISegmentedControl *segmentedControl;
  void *v19;
  MRUVisualStylingProvider *v20;
  MRUVisualStylingProvider *stylingProvider;
  objc_super v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v23.receiver = self;
  v23.super_class = (Class)MRUOutputDeviceView;
  v7 = -[MRUOutputDeviceView initWithFrame:](&v23, sel_initWithFrame_);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:options:initialWeighting:", 4, 0, 1.0);
    v8 = objc_claimAutoreleasedReturnValue();
    materialView = v7->_materialView;
    v7->_materialView = (MTMaterialView *)v8;

    -[MTMaterialView setUserInteractionEnabled:](v7->_materialView, "setUserInteractionEnabled:", 0);
    -[MRUOutputDeviceView addSubview:](v7, "addSubview:", v7->_materialView);
    v10 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v11);

    objc_msgSend(v10, "setAlpha:", 0.1);
    objc_msgSend(v10, "_setDrawsAsBackdropOverlayWithBlendMode:", 1);
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D48]), "initWithFrame:style:", 0, x, y, width, height);
    tableView = v7->_tableView;
    v7->_tableView = (UITableView *)v12;

    -[UITableView setSeparatorStyle:](v7->_tableView, "setSeparatorStyle:", 0);
    -[UITableView setIndicatorStyle:](v7->_tableView, "setIndicatorStyle:", 2);
    -[UITableView setAlwaysBounceVertical:](v7->_tableView, "setAlwaysBounceVertical:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableView setBackgroundColor:](v7->_tableView, "setBackgroundColor:", v14);

    -[UITableView setRowHeight:](v7->_tableView, "setRowHeight:", 52.0);
    -[UITableView setRowHeight:](v7->_tableView, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
    -[UITableView _setHeaderAndFooterViewsFloat:](v7->_tableView, "_setHeaderAndFooterViewsFloat:", 0);
    v15 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v16 = (void *)objc_msgSend(v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UITableView setTableFooterView:](v7->_tableView, "setTableFooterView:", v16);

    -[UITableView _setContinuousCornerRadius:](v7->_tableView, "_setContinuousCornerRadius:", 24.0);
    -[UITableView setBackgroundView:](v7->_tableView, "setBackgroundView:", v10);
    -[MRUOutputDeviceView addSubview:](v7, "addSubview:", v7->_tableView);
    v17 = (UISegmentedControl *)objc_alloc_init(MEMORY[0x1E0DC3C58]);
    segmentedControl = v7->_segmentedControl;
    v7->_segmentedControl = v17;

    -[MRUOutputDeviceView addSubview:](v7, "addSubview:", v7->_segmentedControl);
    -[MTMaterialView visualStylingProviderForCategory:](v7->_materialView, "visualStylingProviderForCategory:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[MRUVisualStylingProvider initWithVisualStylingProvider:]([MRUVisualStylingProvider alloc], "initWithVisualStylingProvider:", v19);
    stylingProvider = v7->_stylingProvider;
    v7->_stylingProvider = v20;

  }
  return v7;
}

- (void)layoutSubviews
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
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double MinX;
  CGFloat v24;
  objc_super v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v25.receiver = self;
  v25.super_class = (Class)MRUOutputDeviceView;
  -[MRUOutputDeviceView layoutSubviews](&v25, sel_layoutSubviews);
  -[MRUOutputDeviceView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  MRUExpandedContentInsets();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[MTMaterialView setFrame:](self->_materialView, "setFrame:", v4, v6, v8, v10);
  v19 = v4 + v14;
  v20 = v6 + v12;
  v21 = v8 - (v14 + v18);
  v22 = v10 - (v12 + v16);
  UIRectInset();
  -[UITableView setFrame:](self->_tableView, "setFrame:");
  v26.origin.x = v19;
  v26.origin.y = v20;
  v26.size.width = v21;
  v26.size.height = v22;
  MinX = CGRectGetMinX(v26);
  v27.origin.x = v19;
  v27.origin.y = v20;
  v27.size.width = v21;
  v27.size.height = v22;
  v24 = CGRectGetMaxY(v27) + -44.0;
  v28.origin.x = v19;
  v28.origin.y = v20;
  v28.size.width = v21;
  v28.size.height = v22;
  -[UISegmentedControl setFrame:](self->_segmentedControl, "setFrame:", MinX, v24, CGRectGetWidth(v28), 44.0);
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (MTMaterialView)materialView
{
  return self->_materialView;
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_segmentedControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
