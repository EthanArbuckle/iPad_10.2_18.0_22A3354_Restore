@implementation HULinkedApplicationTableViewCell

- (HULinkedApplicationTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HULinkedApplicationTableViewCell *v4;
  HULinkedApplicationView *v5;
  void *v6;
  uint64_t v7;
  HULinkedApplicationView *linkedApplicationView;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HULinkedApplicationTableViewCell;
  v4 = -[HULinkedApplicationTableViewCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = [HULinkedApplicationView alloc];
    -[HULinkedApplicationTableViewCell contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v7 = -[HULinkedApplicationView initWithFrame:](v5, "initWithFrame:");
    linkedApplicationView = v4->_linkedApplicationView;
    v4->_linkedApplicationView = (HULinkedApplicationView *)v7;

    -[HULinkedApplicationTableViewCell contentView](v4, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v4->_linkedApplicationView);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HULinkedApplicationTableViewCell;
  -[HULinkedApplicationTableViewCell layoutSubviews](&v13, sel_layoutSubviews);
  -[HULinkedApplicationTableViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[HULinkedApplicationTableViewCell linkedApplicationView](self, "linkedApplicationView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[HULinkedApplicationTableViewCell linkedApplicationView](self, "linkedApplicationView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = a4;
  *(float *)&v11 = a5;
  objc_msgSend(v9, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v10, v11);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.height = v17;
  result.width = v16;
  return result;
}

- (HFItem)item
{
  void *v2;
  void *v3;

  -[HULinkedApplicationTableViewCell linkedApplicationView](self, "linkedApplicationView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFItem *)v3;
}

- (void)setItem:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HULinkedApplicationTableViewCell linkedApplicationView](self, "linkedApplicationView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItem:", v4);

}

- (void)updateUIWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HULinkedApplicationTableViewCell linkedApplicationView](self, "linkedApplicationView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateUIWithAnimation:", v3);

}

- (HULinkedApplicationView)linkedApplicationView
{
  return self->_linkedApplicationView;
}

- (void)setLinkedApplicationView:(id)a3
{
  objc_storeStrong((id *)&self->_linkedApplicationView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedApplicationView, 0);
}

@end
