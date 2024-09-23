@implementation SUUIAdornedImageView

- (SUUIAdornedImageView)initWithFrame:(CGRect)a3
{
  SUUIAdornedImageView *v3;
  SUUIAdornedImageViewReuseView *v4;
  SUUIAdornedImageViewReuseView *reuseView;
  SUUIAdornedImageViewReuseView *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIAdornedImageView;
  v3 = -[SUUIAdornedImageView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(SUUIAdornedImageViewReuseView);
    reuseView = v3->_reuseView;
    v3->_reuseView = v4;

    v6 = v3->_reuseView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewReuseView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[SUUIAdornedImageView addSubview:](v3, "addSubview:", v3->_reuseView);
    -[SUUIAdornedImageView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 1);
  }
  return v3;
}

- (void)setImage:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUIAdornedImageView;
  -[SUUIImageView setImage:](&v3, sel_setImage_, a3);
}

- (void)setImage:(id)a3 cacheKey:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a4;
  -[SUUIAdornedImageView setImage:](self, "setImage:", a3);
  -[SUUIAdornedImageViewReuseView playButton](self->_reuseView, "playButton");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIAdornedImageView image](self, "image");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIAdornedImageView updatePlayButonBlur:context:image:cacheKey:](self, "updatePlayButonBlur:context:image:cacheKey:", v11, v8, v10, v9);

}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return +[SUUIAdornedImageViewReuseView prefetchResourcesForViewElement:reason:context:](SUUIAdornedImageViewReuseView, "prefetchResourcesForViewElement:reason:context:", a3, a4, a5);
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  +[SUUIAdornedImageViewReuseView preferredSizeForViewElement:context:](SUUIAdornedImageViewReuseView, "preferredSizeForViewElement:context:", a3, a4);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  +[SUUIAdornedImageViewReuseView requestLayoutForViewElement:width:context:](SUUIAdornedImageViewReuseView, "requestLayoutForViewElement:width:context:", a3, a5, a4);
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  double v5;
  double v6;
  CGSize result;

  +[SUUIAdornedImageViewReuseView sizeThatFitsWidth:viewElement:context:](SUUIAdornedImageViewReuseView, "sizeThatFitsWidth:viewElement:context:", a4, a5, a3);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  float v16;
  void *v17;
  id v18;

  v18 = a3;
  v8 = a5;
  -[SUUIAdornedImageViewReuseView reloadWithViewElement:width:context:](self->_reuseView, "reloadWithViewElement:width:context:", v18, v8, a4);
  objc_msgSend(v8, "imageResourceCacheKeyForViewElement:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[SUUIAdornedImageViewReuseView playButton](self->_reuseView, "playButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIAdornedImageView image](self, "image");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIAdornedImageView updatePlayButonBlur:context:image:cacheKey:](self, "updatePlayButonBlur:context:image:cacheKey:", v10, v8, v11, v9);

  }
  objc_msgSend(v18, "layerShadowRadius");
  if (v12 != 0.0)
  {
    -[SUUIAdornedImageView layer](self, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setMasksToBounds:", 0);

    -[SUUIAdornedImageView layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layerShadowRadius");
    objc_msgSend(v14, "setShadowRadius:");

    -[SUUIAdornedImageView layer](self, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layerShadowOffset");
    objc_msgSend(v15, "setShadowOffset:");

  }
  objc_msgSend(v18, "layerShadowOpacity");
  if (v16 != 0.0)
  {
    -[SUUIAdornedImageView layer](self, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "layerShadowOpacity");
    objc_msgSend(v17, "setShadowOpacity:");

  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return -[SUUIAdornedImageViewReuseView setImage:forArtworkRequest:context:](self->_reuseView, "setImage:forArtworkRequest:context:", a3, a4, a5);
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return -[SUUIAdornedImageViewReuseView updateWithItemState:context:animated:](self->_reuseView, "updateWithItemState:context:animated:", a3, a4, a5);
}

- (void)updatePlayButonBlur:(id)a3 context:(id)a4 image:(id)a5 cacheKey:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v18;
  id v19;
  CGRect v20;
  CGRect v21;

  v19 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v12 && v10 && v19 && v11)
  {
    objc_msgSend(v10, "blurColorForCacheKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
LABEL_9:
      objc_msgSend(v19, "setControlColor:", v13);

      goto LABEL_10;
    }
    -[SUUIAdornedImageView bounds](self, "bounds");
    -[SUUIAdornedImageViewReuseView frameForView:](self->_reuseView, "frameForView:", v19);
    x = v20.origin.x;
    y = v20.origin.y;
    width = v20.size.width;
    height = v20.size.height;
    CGRectGetMaxX(v20);
    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    CGRectGetMaxY(v21);
    objc_msgSend(v19, "buttonSize");
    +[SUUIPlayButtonControl blurColorForImage:forButtonSize:withOffsetRight:withOffsetBottom:](SUUIPlayButtonControl, "blurColorForImage:forButtonSize:withOffsetRight:withOffsetBottom:", v11);
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v13 = (void *)v18;
      objc_msgSend(v10, "setBlurColor:cacheKey:", v18, v12);
      goto LABEL_9;
    }
    objc_msgSend(v19, "defaultBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBlurColor:cacheKey:", v13, v12);
    if (v13)
      goto LABEL_9;
  }
LABEL_10:

}

- (id)viewForElementIdentifier:(id)a3
{
  return -[SUUIAdornedImageViewReuseView viewForElementIdentifier:](self->_reuseView, "viewForElementIdentifier:", a3);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUUIAdornedImageView;
  -[SUUIImageView layoutSubviews](&v3, sel_layoutSubviews);
  -[SUUIAdornedImageView bounds](self, "bounds");
  -[SUUIAdornedImageViewReuseView setFrame:](self->_reuseView, "setFrame:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseView, 0);
}

@end
