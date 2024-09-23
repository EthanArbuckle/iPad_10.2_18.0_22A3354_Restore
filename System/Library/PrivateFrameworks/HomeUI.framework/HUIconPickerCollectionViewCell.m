@implementation HUIconPickerCollectionViewCell

- (HUIconPickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  HUIconPickerCollectionViewCell *v3;
  HUIconButton *v4;
  HUIconButton *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUIconPickerCollectionViewCell;
  v3 = -[HUIconPickerCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [HUIconButton alloc];
    -[HUIconPickerCollectionViewCell bounds](v3, "bounds");
    v5 = -[HUIconButton initWithFrame:](v4, "initWithFrame:");
    -[HUIconPickerCollectionViewCell setIconButton:](v3, "setIconButton:", v5);

    -[HUIconPickerCollectionViewCell iconButton](v3, "iconButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInteractionEnabled:", 0);

    -[HUIconPickerCollectionViewCell contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconPickerCollectionViewCell iconButton](v3, "iconButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

  }
  return v3;
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HUIconPickerCollectionViewCell;
  -[HUIconPickerCollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[HUIconPickerCollectionViewCell iconButton](self, "iconButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateWithIconDescriptor:animated:", 0, 0);

}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  void *v7;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  v8.receiver = self;
  v8.super_class = (Class)HUIconPickerCollectionViewCell;
  -[HUIconPickerCollectionViewCell layoutSubviews](&v8, sel_layoutSubviews);
  -[HUIconPickerCollectionViewCell bounds](self, "bounds");
  v10 = CGRectInset(v9, 20.0, 20.0);
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  -[HUIconPickerCollectionViewCell iconButton](self, "iconButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", x, y, width, height);

}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HUIconPickerCollectionViewCell iconButton](self, "iconButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelected:", v3);

}

- (HFIconDescriptor)iconDescriptor
{
  void *v2;
  void *v3;

  -[HUIconPickerCollectionViewCell iconButton](self, "iconButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFIconDescriptor *)v3;
}

- (void)setIconDescriptor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUIconPickerCollectionViewCell iconButton](self, "iconButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithIconDescriptor:animated:", v4, 1);

}

- (HUIconButton)iconButton
{
  return self->_iconButton;
}

- (void)setIconButton:(id)a3
{
  objc_storeStrong((id *)&self->_iconButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconButton, 0);
}

@end
