@implementation SUUIPageControlCollectionViewCell

- (SUUIPageControlCollectionViewCell)initWithFrame:(CGRect)a3
{
  SUUIPageControlCollectionViewCell *v3;
  UIPageControl *v4;
  UIPageControl *pageControl;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIPageControlCollectionViewCell;
  v3 = -[SUUIViewReuseCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIPageControl *)objc_alloc_init(MEMORY[0x24BEBD7D0]);
    pageControl = v3->_pageControl;
    v3->_pageControl = v4;

    -[UIPageControl setEnabled:](v3->_pageControl, "setEnabled:", 0);
    -[SUUIPageControlCollectionViewCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->_pageControl);

  }
  return v3;
}

- (int64_t)currentPage
{
  return -[UIPageControl currentPage](self->_pageControl, "currentPage");
}

- (int64_t)numberOfPages
{
  return -[UIPageControl numberOfPages](self->_pageControl, "numberOfPages");
}

- (void)setCurrentPage:(int64_t)a3
{
  -[UIPageControl setCurrentPage:](self->_pageControl, "setCurrentPage:", a3);
}

- (void)setNumberOfPages:(int64_t)a3
{
  if (-[UIPageControl numberOfPages](self->_pageControl, "numberOfPages") != a3)
  {
    -[UIPageControl setNumberOfPages:](self->_pageControl, "setNumberOfPages:", a3);
    -[SUUIPageControlCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
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
  double v5;
  CGSize result;

  v5 = 37.0;
  result.height = v5;
  result.width = a3;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  void *v6;
  void *v7;
  UIPageControl *pageControl;
  void *v9;
  id v10;

  objc_msgSend(a3, "style", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  self->_pageControlPosition = objc_msgSend(v10, "elementPosition");
  objc_msgSend(v10, "ikColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "darkGrayColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[UIPageControl setCurrentPageIndicatorTintColor:](self->_pageControl, "setCurrentPageIndicatorTintColor:", v7);
  pageControl = self->_pageControl;
  objc_msgSend(v7, "colorWithAlphaComponent:", 0.33);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPageControl setPageIndicatorTintColor:](pageControl, "setPageIndicatorTintColor:", v9);

  -[SUUIPageControlCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[SUUIPageControlCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
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

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t pageControlPosition;
  double left;
  float v15;
  double top;
  float v17;

  -[SUUIPageControlCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = (double *)MEMORY[0x24BDBF090];
  -[UIPageControl sizeThatFits:](self->_pageControl, "sizeThatFits:", v5, v7);
  v11 = v9;
  v12 = v10;
  pageControlPosition = self->_pageControlPosition;
  if (pageControlPosition > 9)
  {
    left = *v8;
  }
  else if (((1 << pageControlPosition) & 0xF) != 0)
  {
    v15 = (v5 - v9) * 0.5;
    left = floorf(v15);
  }
  else if (((1 << pageControlPosition) & 0x150) != 0)
  {
    left = self->_contentInset.left;
  }
  else
  {
    left = v5 - v9 - self->_contentInset.right;
  }
  if (pageControlPosition > 9)
  {
    top = v8[1];
  }
  else if (((1 << pageControlPosition) & 0x33) != 0)
  {
    v17 = (v7 - v10) * 0.5;
    top = floorf(v17);
  }
  else if (((1 << pageControlPosition) & 0xC4) != 0)
  {
    top = self->_contentInset.top;
  }
  else
  {
    top = v7 - v10 - self->_contentInset.bottom;
  }
  -[UIPageControl setFrame:](self->_pageControl, "setFrame:", left, top, v11, v12);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageControl, 0);
}

@end
