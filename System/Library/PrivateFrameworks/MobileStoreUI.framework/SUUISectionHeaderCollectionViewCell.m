@implementation SUUISectionHeaderCollectionViewCell

- (SUUISectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUISectionHeaderCollectionViewCell *v3;
  SUUISectionHeaderCollectionViewCell *v4;
  void *v5;
  SUUISectionHeaderView *v6;
  uint64_t v7;
  SUUISectionHeaderView *headerView;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUUISectionHeaderCollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SUUISectionHeaderCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [SUUISectionHeaderView alloc];
    objc_msgSend(v5, "bounds");
    v7 = -[SUUISectionHeaderView initWithFrame:](v6, "initWithFrame:");
    headerView = v4->_headerView;
    v4->_headerView = (SUUISectionHeaderView *)v7;

    objc_msgSend(v5, "addSubview:", v4->_headerView);
  }
  return v4;
}

- (void)applyLayoutAttributes:(id)a3
{
  SUUISectionHeaderView *headerView;
  void *v5;
  id v6;
  void *v7;
  objc_super v8;

  headerView = self->_headerView;
  v5 = (void *)MEMORY[0x24BEBD4B8];
  v6 = a3;
  objc_msgSend(v5, "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewReuseView setBackgroundColor:](headerView, "setBackgroundColor:", v7);

  v8.receiver = self;
  v8.super_class = (Class)SUUISectionHeaderCollectionViewCell;
  -[SUUICollectionViewCell applyLayoutAttributes:](&v8, sel_applyLayoutAttributes_, v6);

}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SUUISectionHeaderView prefetchResourcesForViewElement:reason:context:](SUUISectionHeaderView, "prefetchResourcesForViewElement:reason:context:", a3, a4, a5);
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  +[SUUISectionHeaderView preferredSizeForViewElement:context:](SUUISectionHeaderView, "preferredSizeForViewElement:context:", a3, a4);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  +[SUUISectionHeaderView requestLayoutForViewElement:width:context:](SUUISectionHeaderView, "requestLayoutForViewElement:width:context:", a3, a5, a4);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  +[SUUISectionHeaderView sizeThatFitsWidth:viewElement:context:](SUUISectionHeaderView, "sizeThatFitsWidth:viewElement:context:", a4, a5, a3);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  -[SUUISectionHeaderView reloadWithViewElement:width:context:](self->_headerView, "reloadWithViewElement:width:context:", a3, a5, a4);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  -[SUUISectionHeaderView setContentInset:](self->_headerView, "setContentInset:", a3.top, a3.left, a3.bottom, a3.right);
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return -[SUUISectionHeaderView setImage:forArtworkRequest:context:](self->_headerView, "setImage:forArtworkRequest:context:", a3, a4, a5);
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return -[SUUISectionHeaderView updateWithItemState:context:animated:](self->_headerView, "updateWithItemState:context:animated:", a3, a4, a5);
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)layoutSubviews
{
  SUUISectionHeaderView *headerView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUISectionHeaderCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v5, sel_layoutSubviews);
  headerView = self->_headerView;
  -[SUUISectionHeaderCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SUUISectionHeaderView setFrame:](headerView, "setFrame:");

}

- (void)setBackgroundColor:(id)a3
{
  SUUISectionHeaderView *headerView;
  id v5;
  objc_super v6;

  headerView = self->_headerView;
  v5 = a3;
  -[SUUIViewReuseView setBackgroundColor:](headerView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUISectionHeaderCollectionViewCell;
  -[SUUICollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
