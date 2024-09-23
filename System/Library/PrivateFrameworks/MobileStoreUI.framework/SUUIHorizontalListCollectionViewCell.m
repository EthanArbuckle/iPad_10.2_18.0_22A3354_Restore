@implementation SUUIHorizontalListCollectionViewCell

- (SUUIHorizontalListCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUIHorizontalListCollectionViewCell *v3;
  SUUIHorizontalListView *v4;
  uint64_t v5;
  SUUIHorizontalListView *horizontalList;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIHorizontalListCollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [SUUIHorizontalListView alloc];
    -[SUUIHorizontalListCollectionViewCell bounds](v3, "bounds");
    v5 = -[SUUIHorizontalListView initWithFrame:](v4, "initWithFrame:");
    horizontalList = v3->_horizontalList;
    v3->_horizontalList = (SUUIHorizontalListView *)v5;

    -[SUUIHorizontalListCollectionViewCell contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v3->_horizontalList);

  }
  return v3;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
  -[SUUIHorizontalListView setContentInset:](self->_horizontalList, "setContentInset:");
}

- (void)applyLayoutAttributes:(id)a3
{
  SUUIHorizontalListView *horizontalList;
  id v5;
  void *v6;
  objc_super v7;

  horizontalList = self->_horizontalList;
  v5 = a3;
  objc_msgSend(v5, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewReuseView setBackgroundColor:](horizontalList, "setBackgroundColor:", v6);

  v7.receiver = self;
  v7.super_class = (Class)SUUIHorizontalListCollectionViewCell;
  -[SUUICollectionViewCell applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v5);

}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SUUIHorizontalListView prefetchResourcesForViewElement:reason:context:](SUUIHorizontalListView, "prefetchResourcesForViewElement:reason:context:", a3, a4, a5);
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "defaultItemWidthForViewElement:", v7);
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  +[SUUIHorizontalListView requestLayoutForViewElement:width:context:](SUUIHorizontalListView, "requestLayoutForViewElement:width:context:", a3, a5, a4);
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  -[SUUIHorizontalListView reloadWithViewElement:width:context:](self->_horizontalList, "reloadWithViewElement:width:context:", a3, a5, a4);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  +[SUUIHorizontalListView sizeThatFitsWidth:viewElement:context:](SUUIHorizontalListView, "sizeThatFitsWidth:viewElement:context:", a4, a5, a3);
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return -[SUUIHorizontalListView setImage:forArtworkRequest:context:](self->_horizontalList, "setImage:forArtworkRequest:context:", a3, a4, a5);
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return -[SUUIHorizontalListView updateWithItemState:context:animated:](self->_horizontalList, "updateWithItemState:context:animated:", a3, a4, a5);
}

- (id)viewForElementIdentifier:(id)a3
{
  return -[SUUIHorizontalListView viewForElementIdentifier:](self->_horizontalList, "viewForElementIdentifier:", a3);
}

- (void)layoutSubviews
{
  SUUIHorizontalListView *horizontalList;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIHorizontalListCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v5, sel_layoutSubviews);
  horizontalList = self->_horizontalList;
  -[SUUIHorizontalListCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SUUIHorizontalListView setFrame:](horizontalList, "setFrame:");

}

- (void)setBackgroundColor:(id)a3
{
  SUUIHorizontalListView *horizontalList;
  id v5;
  objc_super v6;

  horizontalList = self->_horizontalList;
  v5 = a3;
  -[SUUIViewReuseView setBackgroundColor:](horizontalList, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIHorizontalListCollectionViewCell;
  -[SUUICollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_horizontalList, 0);
}

@end
