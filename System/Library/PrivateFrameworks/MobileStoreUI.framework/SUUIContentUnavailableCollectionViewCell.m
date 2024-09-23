@implementation SUUIContentUnavailableCollectionViewCell

- (SUUIContentUnavailableCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUIContentUnavailableCollectionViewCell *v3;
  SUUIContentUnavailableView *v4;
  SUUIContentUnavailableView *contentUnavailableView;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIContentUnavailableCollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(SUUIContentUnavailableView);
    contentUnavailableView = v3->_contentUnavailableView;
    v3->_contentUnavailableView = v4;

    -[SUUIContentUnavailableCollectionViewCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->_contentUnavailableView);

  }
  return v3;
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SUUIContentUnavailableView prefetchResourcesForViewElement:reason:context:](SUUIContentUnavailableView, "prefetchResourcesForViewElement:reason:context:", a3, a4, a5);
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  +[SUUIContentUnavailableView preferredSizeForViewElement:context:](SUUIContentUnavailableView, "preferredSizeForViewElement:context:", a3, a4);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  +[SUUIContentUnavailableView requestLayoutForViewElement:width:context:](SUUIContentUnavailableView, "requestLayoutForViewElement:width:context:", a3, a5, a4);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  +[SUUIContentUnavailableView sizeThatFitsWidth:viewElement:context:](SUUIContentUnavailableView, "sizeThatFitsWidth:viewElement:context:", a4, a5, a3);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  -[SUUIContentUnavailableView reloadWithViewElement:width:context:](self->_contentUnavailableView, "reloadWithViewElement:width:context:", a3, a5, a4);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SUUIContentUnavailableCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return -[SUUIContentUnavailableView setImage:forArtworkRequest:context:](self->_contentUnavailableView, "setImage:forArtworkRequest:context:", a3, a4, a5);
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return -[SUUIContentUnavailableView updateWithItemState:context:animated:](self->_contentUnavailableView, "updateWithItemState:context:animated:", a3, a4, a5);
}

- (id)viewForElementIdentifier:(id)a3
{
  return -[SUUIContentUnavailableView viewForElementIdentifier:](self->_contentUnavailableView, "viewForElementIdentifier:", a3);
}

- (void)applyLayoutAttributes:(id)a3
{
  SUUIContentUnavailableView *contentUnavailableView;
  id v5;
  void *v6;
  objc_super v7;

  contentUnavailableView = self->_contentUnavailableView;
  v5 = a3;
  objc_msgSend(v5, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewReuseView setBackgroundColor:](contentUnavailableView, "setBackgroundColor:", v6);

  v7.receiver = self;
  v7.super_class = (Class)SUUIContentUnavailableCollectionViewCell;
  -[SUUICollectionViewCell applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v5);

}

- (void)layoutSubviews
{
  SUUIContentUnavailableView *contentUnavailableView;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIContentUnavailableCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v9, sel_layoutSubviews);
  contentUnavailableView = self->_contentUnavailableView;
  -[SUUIContentUnavailableCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SUUIContentUnavailableView setFrame:](contentUnavailableView, "setFrame:", v5 + self->_contentInset.left, v6 + self->_contentInset.top, v7 - (self->_contentInset.left + self->_contentInset.right), v8 - (self->_contentInset.top + self->_contentInset.bottom));

}

- (void)setBackgroundColor:(id)a3
{
  SUUIContentUnavailableView *contentUnavailableView;
  id v5;
  objc_super v6;

  contentUnavailableView = self->_contentUnavailableView;
  v5 = a3;
  -[SUUIViewReuseView setBackgroundColor:](contentUnavailableView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIContentUnavailableCollectionViewCell;
  -[SUUICollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentUnavailableView, 0);
}

@end
