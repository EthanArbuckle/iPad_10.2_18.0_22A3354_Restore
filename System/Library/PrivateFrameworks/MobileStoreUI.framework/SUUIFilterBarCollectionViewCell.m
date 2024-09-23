@implementation SUUIFilterBarCollectionViewCell

- (SUUIFilterBarCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUIFilterBarCollectionViewCell *v3;
  SUUIFilterBarCollectionViewCell *v4;
  void *v5;
  SUUIFilterBarView *v6;
  uint64_t v7;
  SUUIFilterBarView *filterBarView;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUUIFilterBarCollectionViewCell;
  v3 = -[SUUIViewReuseCollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SUUIFilterBarCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [SUUIFilterBarView alloc];
    objc_msgSend(v5, "bounds");
    v7 = -[SUUIFilterBarView initWithFrame:](v6, "initWithFrame:");
    filterBarView = v4->_filterBarView;
    v4->_filterBarView = (SUUIFilterBarView *)v7;

    objc_msgSend(v5, "addSubview:", v4->_filterBarView);
  }
  return v4;
}

- (void)applyLayoutAttributes:(id)a3
{
  SUUIFilterBarView *filterBarView;
  id v5;
  void *v6;
  objc_super v7;

  filterBarView = self->_filterBarView;
  v5 = a3;
  objc_msgSend(v5, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewReuseView setBackgroundColor:](filterBarView, "setBackgroundColor:", v6);

  v7.receiver = self;
  v7.super_class = (Class)SUUIFilterBarCollectionViewCell;
  -[SUUIViewReuseCollectionViewCell applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v5);

}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SUUIFilterBarView prefetchResourcesForViewElement:reason:context:](SUUIFilterBarView, "prefetchResourcesForViewElement:reason:context:", a3, a4, a5);
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  +[SUUIFilterBarView preferredSizeForViewElement:context:](SUUIFilterBarView, "preferredSizeForViewElement:context:", a3, a4);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  +[SUUIFilterBarView requestLayoutForViewElement:width:context:](SUUIFilterBarView, "requestLayoutForViewElement:width:context:", a3, a5, a4);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  +[SUUIFilterBarView sizeThatFitsWidth:viewElement:context:](SUUIFilterBarView, "sizeThatFitsWidth:viewElement:context:", a4, a5, a3);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  -[SUUIFilterBarView reloadWithViewElement:width:context:](self->_filterBarView, "reloadWithViewElement:width:context:", a3, a5, a4);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  -[SUUIFilterBarView setContentInset:](self->_filterBarView, "setContentInset:", a3.top, a3.left, a3.bottom, a3.right);
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return -[SUUIFilterBarView setImage:forArtworkRequest:context:](self->_filterBarView, "setImage:forArtworkRequest:context:", a3, a4, a5);
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return -[SUUIFilterBarView updateWithItemState:context:animated:](self->_filterBarView, "updateWithItemState:context:animated:", a3, a4, a5);
}

- (id)viewForElementIdentifier:(id)a3
{
  return -[SUUIFilterBarView viewForElementIdentifier:](self->_filterBarView, "viewForElementIdentifier:", a3);
}

- (void)layoutSubviews
{
  SUUIFilterBarView *filterBarView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIFilterBarCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v5, sel_layoutSubviews);
  filterBarView = self->_filterBarView;
  -[SUUIFilterBarCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SUUIFilterBarView setFrame:](filterBarView, "setFrame:");

}

- (void)setBackgroundColor:(id)a3
{
  SUUIFilterBarView *filterBarView;
  id v5;
  objc_super v6;

  filterBarView = self->_filterBarView;
  v5 = a3;
  -[SUUIViewReuseView setBackgroundColor:](filterBarView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIFilterBarCollectionViewCell;
  -[SUUIViewReuseCollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterBarView, 0);
}

@end
