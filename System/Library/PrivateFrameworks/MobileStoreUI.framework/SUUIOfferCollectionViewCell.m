@implementation SUUIOfferCollectionViewCell

- (SUUIOfferCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUIOfferCollectionViewCell *v3;
  SUUIOfferCollectionViewCell *v4;
  void *v5;
  SUUIOfferView *v6;
  uint64_t v7;
  SUUIOfferView *offerView;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUUIOfferCollectionViewCell;
  v3 = -[SUUICollectionViewCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SUUIOfferCollectionViewCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [SUUIOfferView alloc];
    objc_msgSend(v5, "bounds");
    v7 = -[SUUIOfferView initWithFrame:](v6, "initWithFrame:");
    offerView = v4->_offerView;
    v4->_offerView = (SUUIOfferView *)v7;

    objc_msgSend(v5, "addSubview:", v4->_offerView);
  }
  return v4;
}

- (void)applyLayoutAttributes:(id)a3
{
  SUUIOfferView *offerView;
  id v5;
  void *v6;
  objc_super v7;

  offerView = self->_offerView;
  v5 = a3;
  objc_msgSend(v5, "backgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewReuseView setBackgroundColor:](offerView, "setBackgroundColor:", v6);

  v7.receiver = self;
  v7.super_class = (Class)SUUIOfferCollectionViewCell;
  -[SUUICollectionViewCell applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v5);

}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SUUIOfferView prefetchResourcesForViewElement:reason:context:](SUUIOfferView, "prefetchResourcesForViewElement:reason:context:", a3, a4, a5);
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  +[SUUIOfferView preferredSizeForViewElement:context:](SUUIOfferView, "preferredSizeForViewElement:context:", a3, a4);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  +[SUUIOfferView requestLayoutForViewElement:width:context:](SUUIOfferView, "requestLayoutForViewElement:width:context:", a3, a5, a4);
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  -[SUUIOfferView reloadWithViewElement:width:context:](self->_offerView, "reloadWithViewElement:width:context:", a3, a5, a4);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  +[SUUIOfferView sizeThatFitsWidth:viewElement:context:](SUUIOfferView, "sizeThatFitsWidth:viewElement:context:", a4, a5, a3);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  -[SUUIOfferView setContentInset:](self->_offerView, "setContentInset:", a3.top, a3.left, a3.bottom, a3.right);
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return -[SUUIOfferView setImage:forArtworkRequest:context:](self->_offerView, "setImage:forArtworkRequest:context:", a3, a4, a5);
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return -[SUUIOfferView updateWithItemState:context:animated:](self->_offerView, "updateWithItemState:context:animated:", a3, a4, a5);
}

- (id)viewForElementIdentifier:(id)a3
{
  return -[SUUIOfferView viewForElementIdentifier:](self->_offerView, "viewForElementIdentifier:", a3);
}

- (void)layoutSubviews
{
  SUUIOfferView *offerView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIOfferCollectionViewCell;
  -[SUUICollectionViewCell layoutSubviews](&v5, sel_layoutSubviews);
  offerView = self->_offerView;
  -[SUUIOfferCollectionViewCell contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SUUIOfferView setFrame:](offerView, "setFrame:");

}

- (void)setBackgroundColor:(id)a3
{
  SUUIOfferView *offerView;
  id v5;
  objc_super v6;

  offerView = self->_offerView;
  v5 = a3;
  -[SUUIViewReuseView setBackgroundColor:](offerView, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIOfferCollectionViewCell;
  -[SUUICollectionViewCell setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offerView, 0);
}

@end
