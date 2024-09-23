@implementation CKDetailsSegmentedControlCell

- (UISegmentedControl)segmentedControl
{
  UISegmentedControl *segmentedControl;
  UISegmentedControl *v4;
  UISegmentedControl *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  segmentedControl = self->_segmentedControl;
  if (!segmentedControl)
  {
    v4 = (UISegmentedControl *)objc_alloc_init(MEMORY[0x1E0CEA990]);
    v5 = self->_segmentedControl;
    self->_segmentedControl = v4;

    -[UISegmentedControl layer](self->_segmentedControl, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerRadius:", 4.0);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "theme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "detailsSegmentedControlBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISegmentedControl setBackgroundColor:](self->_segmentedControl, "setBackgroundColor:", v9);

    objc_msgSend(MEMORY[0x1E0CEA990], "appearance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0DC1140];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "theme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "segmentedControlSelectionTintColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitleTextAttributes:forState:", v14, 4);

    -[CKDetailsSegmentedControlCell contentView](self, "contentView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubview:", self->_segmentedControl);

    segmentedControl = self->_segmentedControl;
  }
  return segmentedControl;
}

+ (id)reuseIdentifier
{
  return CFSTR("CKDetailsSegmentedControlCell_reuseIdentifier");
}

+ (BOOL)shouldHighlight
{
  return 0;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  v16.receiver = self;
  v16.super_class = (Class)CKDetailsSegmentedControlCell;
  -[CKDetailsCell layoutSubviews](&v16, sel_layoutSubviews);
  -[CKDetailsSegmentedControlCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutMargins");
  v5 = v4;

  -[CKDetailsSegmentedControlCell contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[CKDetailsSegmentedControlCell segmentedControl](self, "segmentedControl");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17.origin.x = v8;
  v17.origin.y = v10;
  v17.size.width = v12;
  v17.size.height = v14;
  v18 = CGRectInset(v17, v5, 12.0);
  objc_msgSend(v15, "setFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);

}

- (void)setSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_segmentedControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedControl, 0);
}

@end
