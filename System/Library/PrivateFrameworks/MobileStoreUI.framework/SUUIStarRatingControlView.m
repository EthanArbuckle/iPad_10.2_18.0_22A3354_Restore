@implementation SUUIStarRatingControlView

- (SUUIStarRatingControlView)initWithFrame:(CGRect)a3
{
  SUUIStarRatingControlView *v3;
  SUUIStarRatingControlView *v4;
  SUUIStarRatingControl *v5;
  SUUIStarRatingControl *control;
  void *v7;
  void *v8;
  uint64_t v9;
  UIImage *emptyStars;
  SUUIStarRatingControl *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SUUIStarRatingControlView;
  v3 = -[SUUIStarRatingControlView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SUUIStarRatingControlView setContentMode:](v3, "setContentMode:", 3);
    v5 = objc_alloc_init(SUUIStarRatingControl);
    control = v4->_control;
    v4->_control = v5;

    -[SUUIStarRatingControlView addSubview:](v4, "addSubview:", v4->_control);
    v7 = (void *)MEMORY[0x24BEBD640];
    SUUIBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageNamed:inBundle:", CFSTR("LightRateControl"), v8);
    v9 = objc_claimAutoreleasedReturnValue();
    emptyStars = v4->_emptyStars;
    v4->_emptyStars = (UIImage *)v9;

    -[SUUIStarRatingControl setEmptyStarsImage:](v4->_control, "setEmptyStarsImage:", v4->_emptyStars);
    v11 = v4->_control;
    v12 = (void *)MEMORY[0x24BEBD640];
    SUUIBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageNamed:inBundle:", CFSTR("RateControlFilled"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStarRatingControl setFilledStarsImage:](v11, "setFilledStarsImage:", v14);

    -[SUUIStarRatingControl sizeToFit](v4->_control, "sizeToFit");
    -[SUUIStarRatingControl addTarget:action:forControlEvents:](v4->_control, "addTarget:action:forControlEvents:", v4, sel_didRating_, 64);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[SUUIStarRatingControl removeTarget:action:forControlEvents:](self->_control, "removeTarget:action:forControlEvents:", self, 0, 0xFFFFFFFFLL);
  v3.receiver = self;
  v3.super_class = (Class)SUUIStarRatingControlView;
  -[SUUIStarRatingControlView dealloc](&v3, sel_dealloc);
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  return 0;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = *MEMORY[0x24BDBF148];
  v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v5 = (void *)MEMORY[0x24BEBD640];
  SUUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageNamed:inBundle:", CFSTR("StarRatingControlEmpty"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "size");
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  float v7;
  float v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_storeStrong((id *)&self->_viewElement, a3);
  objc_msgSend(v10, "ratingValue");
  if (v7 <= 0.0)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v10, "ratingValue");
    v9 = (uint64_t)(v8 * 5.0);
  }
  -[SUUIStarRatingControl setUserRating:](self->_control, "setUserRating:", v9);
  -[SUUIStarRatingControl setNeedsDisplay](self->_control, "setNeedsDisplay");
  -[SUUIStarRatingControlView setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SUUIStarRatingControlView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return 0;
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return 0;
}

- (id)viewForElementIdentifier:(id)a3
{
  return 0;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUUIStarRatingControlView;
  -[SUUIStarRatingControlView setEnabled:](&v5, sel_setEnabled_);
  -[SUUIStarRatingControl setEnabled:](self->_control, "setEnabled:", v3);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;
  CGRect v9;

  y = a3.y;
  x = a3.x;
  -[SUUIStarRatingControlView bounds](self, "bounds", a4);
  v9 = CGRectInset(v8, -20.0, -20.0);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v9, v7);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIImage size](self->_emptyStars, "size", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)didRating:(id)a3
{
  SUUIStarRatingViewElement *viewElement;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  viewElement = self->_viewElement;
  if (viewElement)
  {
    v6 = CFSTR("value");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SUUIStarRatingControl userRating](self->_control, "userRating", a3));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIStarRatingViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](viewElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 15, 1, 1, v5, 0);

  }
}

- (SUUIStarRatingControl)control
{
  return self->_control;
}

- (void)setControl:(id)a3
{
  objc_storeStrong((id *)&self->_control, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_control, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
  objc_storeStrong((id *)&self->_emptyStars, 0);
}

@end
