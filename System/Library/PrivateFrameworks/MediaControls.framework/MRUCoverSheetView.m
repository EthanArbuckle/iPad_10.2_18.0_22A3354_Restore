@implementation MRUCoverSheetView

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
  NSObject *v11;
  uint64_t v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;
  CGRect v20;

  v19 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)MRUCoverSheetView;
  -[MRUCoverSheetView layoutSubviews](&v14, sel_layoutSubviews);
  -[MRUCoverSheetView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setFrame:](self->_contentView, "setFrame:");
  MCLogCategoryDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_opt_class();
    v20.origin.x = v4;
    v20.origin.y = v6;
    v20.size.width = v8;
    v20.size.height = v10;
    NSStringFromCGRect(v20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v16 = v12;
    v17 = 2114;
    v18 = v13;
    _os_log_impl(&dword_1AA991000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ frame: %{public}@", buf, 0x16u);

  }
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView *contentView;
  UIView *v7;

  v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    -[MRUCoverSheetView addSubview:](self, "addSubview:", self->_contentView);
    -[MRUCoverSheetView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
