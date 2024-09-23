@implementation _HKReportSegmentControl

- (_HKReportSegmentControl)initWithBackgroundColor:(id)a3 dividerColor:(id)a4 rightControl:(id)a5
{
  id v8;
  id v9;
  id v10;
  _HKReportSegmentControl *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  UISegmentedControl *segmentControl;
  uint64_t v19;
  UIView *dividerView;
  id v22;
  objc_super v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)_HKReportSegmentControl;
  v11 = -[_HKReportSegmentControl init](&v23, sel_init);
  if (v11)
  {
    v22 = v10;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("REPORT_FORMATTED"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v13;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("REPORT_RAW"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C58]), "initWithItems:", v16);
    segmentControl = v11->_segmentControl;
    v11->_segmentControl = (UISegmentedControl *)v17;

    -[_HKReportSegmentControl addSubview:](v11, "addSubview:", v11->_segmentControl);
    -[UISegmentedControl setSelectedSegmentIndex:](v11->_segmentControl, "setSelectedSegmentIndex:", 0);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, 1.0, 0.5);
    dividerView = v11->_dividerView;
    v11->_dividerView = (UIView *)v19;

    -[UIView setBackgroundColor:](v11->_dividerView, "setBackgroundColor:", v9);
    -[_HKReportSegmentControl addSubview:](v11, "addSubview:", v11->_dividerView);
    objc_storeStrong((id *)&v11->_rightControl, a5);
    if (v11->_rightControl)
      -[_HKReportSegmentControl addSubview:](v11, "addSubview:");
    -[_HKReportSegmentControl setBackgroundColor:](v11, "setBackgroundColor:", v8);

    v10 = v22;
  }

  return v11;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[UISegmentedControl frame](self->_segmentControl, "frame");
  v3 = v2;
  v5 = v4 + 12.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
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
  HKBarButtonItemControl *rightControl;
  double v18;

  -[_HKReportSegmentControl frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[_HKReportSegmentControl layoutMarginsGuide](self, "layoutMarginsGuide");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutFrame");
  v9 = v8;
  v11 = v10;

  -[UISegmentedControl frame](self->_segmentControl, "frame");
  v13 = v12;
  -[UIView frame](self->_dividerView, "frame");
  v15 = v14;
  -[UISegmentedControl setFrame:](self->_segmentControl, "setFrame:", v4 * 0.5 - (v11 + v11) / 3.0 * 0.5, v6 * 0.5 - v13 * 0.5, (v11 + v11) / 3.0, v13);
  -[UISegmentedControl setWidth:forSegmentAtIndex:](self->_segmentControl, "setWidth:forSegmentAtIndex:", 0, v11 / 3.0);
  -[UISegmentedControl setWidth:forSegmentAtIndex:](self->_segmentControl, "setWidth:forSegmentAtIndex:", 1, v11 / 3.0);
  v16 = v6 - v15;
  -[UIView setFrame:](self->_dividerView, "setFrame:", 0.0, v16, v4, v15);
  rightControl = self->_rightControl;
  if (rightControl)
  {
    -[HKBarButtonItemControl intrinsicContentSize](rightControl, "intrinsicContentSize");
    -[HKBarButtonItemControl setFrame:](self->_rightControl, "setFrame:", v9 + v11 - v18 + -16.0, 0.0, v18 + -10.0, v16);
  }
}

- (BOOL)isOpaque
{
  return 1;
}

- (UISegmentedControl)segmentControl
{
  return self->_segmentControl;
}

- (UIView)dividerView
{
  return self->_dividerView;
}

- (HKBarButtonItemControl)rightControl
{
  return self->_rightControl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightControl, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_segmentControl, 0);
}

@end
