@implementation AMSUICommonCollectionViewCell

- (AMSUICommonCollectionViewCell)init
{
  AMSUICommonCollectionViewCell *v2;
  AMSUICommonCollectionViewCell *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AMSUICommonCollectionViewCell;
  v2 = -[AMSUICommonCollectionViewCell init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AMSUICommonCollectionViewCell _setup](v2, "_setup");
  return v3;
}

- (AMSUICommonCollectionViewCell)initWithFrame:(CGRect)a3
{
  AMSUICommonCollectionViewCell *v3;
  AMSUICommonCollectionViewCell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMSUICommonCollectionViewCell;
  v3 = -[AMSUICommonCollectionViewCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[AMSUICommonCollectionViewCell _setup](v3, "_setup");
  return v4;
}

- (id)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AMSUICommonCollectionViewCell;
  -[AMSUICommonCollectionViewCell tintColor](&v3, sel_tintColor);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setup
{
  AMSUICommonView *v3;
  AMSUICommonView *underlyingContentView;
  void *v5;
  objc_super v6;

  if (!self->_underlyingContentView)
  {
    v3 = objc_alloc_init(AMSUICommonView);
    underlyingContentView = self->_underlyingContentView;
    self->_underlyingContentView = v3;

    v6.receiver = self;
    v6.super_class = (Class)AMSUICommonCollectionViewCell;
    -[AMSUICommonCollectionViewCell contentView](&v6, sel_contentView);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", self->_underlyingContentView);

  }
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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AMSUICommonCollectionViewCell;
  -[AMSUICommonCollectionViewCell layoutSubviews](&v14, sel_layoutSubviews);
  v13.receiver = self;
  v13.super_class = (Class)AMSUICommonCollectionViewCell;
  -[AMSUICommonCollectionViewCell contentView](&v13, sel_contentView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[AMSUICommonCollectionViewCell underlyingContentView](self, "underlyingContentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (AMSUICommonView)underlyingContentView
{
  return self->_underlyingContentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingContentView, 0);
}

@end
