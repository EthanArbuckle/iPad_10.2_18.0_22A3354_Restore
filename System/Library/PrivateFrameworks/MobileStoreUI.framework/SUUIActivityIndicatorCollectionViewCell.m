@implementation SUUIActivityIndicatorCollectionViewCell

- (SUUIActivityIndicatorCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUIActivityIndicatorCollectionViewCell *v3;
  SUUIActivityIndicatorView *v4;
  SUUIActivityIndicatorView *indicatorView;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIActivityIndicatorCollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(SUUIActivityIndicatorView);
    indicatorView = v3->_indicatorView;
    v3->_indicatorView = v4;

    -[SUUIActivityIndicatorCollectionViewCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->_indicatorView);

  }
  return v3;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SUUIActivityIndicatorView prefetchResourcesForViewElement:reason:context:](SUUIActivityIndicatorView, "prefetchResourcesForViewElement:reason:context:", a3, a4, a5);
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  +[SUUIActivityIndicatorView preferredSizeForViewElement:context:](SUUIActivityIndicatorView, "preferredSizeForViewElement:context:", a3, a4);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  +[SUUIActivityIndicatorView requestLayoutForViewElement:width:context:](SUUIActivityIndicatorView, "requestLayoutForViewElement:width:context:", a3, a5, a4);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  +[SUUIActivityIndicatorView sizeThatFitsWidth:viewElement:context:](SUUIActivityIndicatorView, "sizeThatFitsWidth:viewElement:context:", a4, a5, a3);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  -[SUUIActivityIndicatorView reloadWithViewElement:width:context:](self->_indicatorView, "reloadWithViewElement:width:context:", a3, a5, a4);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SUUIActivityIndicatorCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return -[SUUIActivityIndicatorView setImage:forArtworkRequest:context:](self->_indicatorView, "setImage:forArtworkRequest:context:", a3, a4, a5);
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return -[SUUIActivityIndicatorView updateWithItemState:context:animated:](self->_indicatorView, "updateWithItemState:context:animated:", a3, a4, a5);
}

- (id)viewForElementIdentifier:(id)a3
{
  return -[SUUIActivityIndicatorView viewForElementIdentifier:](self->_indicatorView, "viewForElementIdentifier:", a3);
}

- (void)applyLayoutAttributes:(id)a3
{
  SUUIActivityIndicatorView *indicatorView;
  id v5;
  void *v6;
  objc_super v7;

  indicatorView = self->_indicatorView;
  v5 = a3;
  objc_msgSend(v5, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewReuseView setBackgroundColor:](indicatorView, "setBackgroundColor:", v6);

  v7.receiver = self;
  v7.super_class = (Class)SUUIActivityIndicatorCollectionViewCell;
  -[SUUICollectionViewCell applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v5);

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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SUUIActivityIndicatorCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v11, sel_layoutSubviews);
  -[SUUIActivityIndicatorCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[SUUIActivityIndicatorView sizeThatFits:](self->_indicatorView, "sizeThatFits:", v5, v7);
  v9 = v8;
  *(float *)&v8 = (v5 - v8) * 0.5;
  *(float *)&v10 = v7 * 0.5 - v10;
  -[SUUIActivityIndicatorView setFrame:](self->_indicatorView, "setFrame:", floorf(*(float *)&v8), floorf(*(float *)&v10), v9);
}

- (void)setBackgroundColor:(id)a3
{
  SUUIActivityIndicatorView *indicatorView;
  id v5;
  objc_super v6;

  indicatorView = self->_indicatorView;
  v5 = a3;
  -[SUUIViewReuseView setBackgroundColor:](indicatorView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIActivityIndicatorCollectionViewCell;
  -[SUUICollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicatorView, 0);
}

@end
