@implementation AVTCollectionViewCell

+ (id)reuseIdentifier
{
  return CFSTR("AVTCollectionViewCell");
}

- (void)setSubview:(id)a3
{
  UIView *v5;
  UIView *subview;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIView *v11;

  v5 = (UIView *)a3;
  subview = self->_subview;
  if (subview != v5)
  {
    v11 = v5;
    -[UIView superview](subview, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTCollectionViewCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v8)
      -[UIView removeFromSuperview](self->_subview, "removeFromSuperview");
    objc_storeStrong((id *)&self->_subview, a3);
    -[AVTCollectionViewCell contentView](self, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    -[UIView setFrame:](v11, "setFrame:");

    -[UIView setAutoresizingMask:](v11, "setAutoresizingMask:", 18);
    -[AVTCollectionViewCell contentView](self, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v11);

    v5 = v11;
  }

}

- (UIView)subview
{
  return self->_subview;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subview, 0);
}

@end
