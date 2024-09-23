@implementation CNContactListSectionHeaderFooterView

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  int v12;
  double x;
  double y;
  double width;
  double height;
  void *v17;
  void *v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;

  v19.receiver = self;
  v19.super_class = (Class)CNContactListSectionHeaderFooterView;
  -[CNContactListSectionHeaderFooterView layoutSubviews](&v19, sel_layoutSubviews);
  -[CNContactListSectionHeaderFooterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "usesInsetPlatterStyle");

  if (v12)
  {
    v20.origin.x = v4;
    v20.origin.y = v6;
    v20.size.width = v8;
    v20.size.height = v10;
    v21 = CGRectInset(v20, 8.0, 0.0);
    x = v21.origin.x;
    y = v21.origin.y;
    width = v21.size.width;
    height = v21.size.height;
    -[CNContactListSectionHeaderFooterView backgroundView](self, "backgroundView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFrame:", x, y, width, height);

    -[CNContactListSectionHeaderFooterView backgroundView](self, "backgroundView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_setContinuousCornerRadius:", 8.0);

  }
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_visualEffectView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end
