@implementation NUArticleContainerTitleView

- (NUArticleContainerTitleView)initWithFrame:(CGRect)a3
{
  NUArticleContainerTitleView *v3;
  NUTitleViewStyler *v4;
  NUTitleView *v5;
  NUTitleView *titleView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NUArticleContainerTitleView;
  v3 = -[NUArticleContainerTitleView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(NUTitleViewStyler);
    v5 = -[NUTitleView initWithStyler:]([NUTitleView alloc], "initWithStyler:", v4);
    titleView = v3->_titleView;
    v3->_titleView = v5;

    -[NUArticleContainerTitleView addSubview:](v3, "addSubview:", v3->_titleView);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NUArticleContainerTitleView;
  -[NUArticleContainerTitleView layoutSubviews](&v12, sel_layoutSubviews);
  -[NUArticleContainerTitleView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NUArticleContainerTitleView titleView](self, "titleView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)applyPageStyle:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  NUTitleViewUpdate *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NUTitleViewUpdate *v16;
  NUTitleViewUpdate *v17;
  void *v18;
  id v19;

  v19 = a3;
  -[NUArticleContainerTitleView pageStyle](self, "pageStyle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4,
        -[NUArticleContainerTitleView pageStyle](self, "pageStyle"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v19, "isEqual:", v6),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    -[NUArticleContainerTitleView setPageStyle:](self, "setPageStyle:", v19);
    -[NUArticleContainerTitleView pageStyle](self, "pageStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "titleImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = [NUTitleViewUpdate alloc];
      -[NUArticleContainerTitleView pageStyle](self, "pageStyle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "titleImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[NUTitleViewUpdate initWithImage:](v10, "initWithImage:", v12);
    }
    else
    {
      -[NUArticleContainerTitleView pageStyle](self, "pageStyle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "title");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        v17 = objc_alloc_init(NUTitleViewUpdate);
        goto LABEL_8;
      }
      v16 = [NUTitleViewUpdate alloc];
      -[NUArticleContainerTitleView pageStyle](self, "pageStyle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "title");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[NUTitleViewUpdate initWithText:styleType:](v16, "initWithText:styleType:", v12, 0);
    }
    v17 = (NUTitleViewUpdate *)v13;

LABEL_8:
    -[NUTitleViewUpdate setCancelPendingUpdates:](v17, "setCancelPendingUpdates:", 1);
    -[NUTitleViewUpdate setSpeakAccessibilityTitleWhenDisplayed:](v17, "setSpeakAccessibilityTitleWhenDisplayed:", 0);
    -[NUArticleContainerTitleView titleView](self, "titleView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "applyTitleViewUpdate:animation:", v17, 0);

  }
}

- (NUTitleView)titleView
{
  return self->_titleView;
}

- (NUPageStyle)pageStyle
{
  return self->_pageStyle;
}

- (void)setPageStyle:(id)a3
{
  objc_storeStrong((id *)&self->_pageStyle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageStyle, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end
